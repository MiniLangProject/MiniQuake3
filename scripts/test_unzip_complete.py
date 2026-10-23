#!/usr/bin/env python3
"""Complete unchanged-C and productive MiniLang gate for qcommon/unzip.c."""
import argparse,json,re,struct,subprocess,sys,zipfile,zlib
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=("adler32","inflate","inflateEnd","inflateInit2_","inflateInit_","inflateReset","inflateSetDictionary","inflateSync","inflateSyncPoint","inflate_blocks","inflate_blocks_free","inflate_blocks_new","inflate_blocks_reset","inflate_blocks_sync_point","inflate_codes","inflate_codes_free","inflate_codes_new","inflate_fast","inflate_flush","inflate_set_dictionary","strcmpcasenosensitive_internal","unzClose","unzCloseCurrentFile","unzGetCurrentFileInfo","unzGetCurrentFileInfoPosition","unzGetGlobalComment","unzGetGlobalInfo","unzGetLocalExtrafield","unzGoToFirstFile","unzGoToNextFile","unzLocateFile","unzOpen","unzOpenCurrentFile","unzReOpen","unzReadCurrentFile","unzSetCurrentFileInfoPosition","unzStringFileNameCompare","unzeof","unzlocal_CheckCurrentFileCoherencyHeader","unzlocal_DosDateToTmuDate","unzlocal_GetCurrentFileInfoInternal","unzlocal_SearchCentralDir","unzlocal_getByte","unzlocal_getLong","unzlocal_getShort","unztell","zcalloc","zcfree")
FALSE_POSITIVES=("unzlocal_getByte","inflate_set_dictionary","inflate_blocks_sync_point","inflateInit_","inflateSetDictionary","inflateSync","inflateSyncPoint")
EXACT=("unzlocal_getShort","unzlocal_getLong","strcmpcasenosensitive_internal","unzStringFileNameCompare","unzlocal_DosDateToTmuDate","adler32")

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def fixtures(out):
    plain=(b"Quake III Arena unzip compatibility\n"*257)+bytes(range(256))
    raw=zlib.compressobj(6,zlib.DEFLATED,-15);raw_data=raw.compress(plain)+raw.flush()
    raw_path=out/'raw.deflate';expected=out/'expected.bin';raw_path.write_bytes(raw_data);expected.write_bytes(plain)
    zip_path=out/'fixture.pk3'
    with zipfile.ZipFile(zip_path,'w') as archive:
        first=zipfile.ZipInfo('stored.txt',(2024,7,9,13,27,30));first.compress_type=zipfile.ZIP_STORED;first.extra=bytes([0x98,0,3,0,1,2,3]);first.comment=b'stored-comment';archive.writestr(first,b'stored payload')
        second=zipfile.ZipInfo('deflated.bin',(2001,2,3,4,5,6));second.compress_type=zipfile.ZIP_DEFLATED;archive.writestr(second,plain)
        archive.comment=b'archive-comment'
    data=bytearray(zip_path.read_bytes());central=data.find(b'PK\x01\x02');name_len,extra_len=struct.unpack_from('<HH',data,central+28);extra=central+46+name_len
    assert extra_len==7;data[extra:extra+7]=bytes([0x99,0,3,0,7,8,9]);zip_path.write_bytes(b'MINIQUAKE3-SFX'+data)
    return zip_path,raw_path,expected

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/unzip_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/qcommon/unzip.c';port=ROOT/'src/mq3/format/unzip.ml';pk3=ROOT/'src/mq3/format/pk3.ml'
    source=port.read_text(encoding='utf-8');missing=[name for name in SYMBOLS if not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',source)]
    if missing:raise RuntimeError('missing unzip symbols: '+', '.join(missing))
    original_text=original.read_text(encoding='latin1')
    missing_original=[name for name in SYMBOLS if not re.search(r'\b'+re.escape(name)+r'\b',original_text)]
    if missing_original:raise RuntimeError('unzip ledger candidates absent from pinned source: '+', '.join(missing_original))
    (out/'unzip_complete_under_test.inc').write_text(extract(original,EXACT),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/unzip_complete_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4','/WX','/wd4996',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    expected_text=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n')
    actual_text=run([build('tests/unzip_complete_oracle.ml','unzip_complete_oracle.exe')],ROOT/'build',log=out/'mini.log').replace('\r\n','\n')
    if expected_text!=actual_text:
        (out/'expected.txt').write_text(expected_text,encoding='utf-8');(out/'actual.txt').write_text(actual_text,encoding='utf-8');raise RuntimeError('unzip unchanged-C mismatch')
    fixture,raw_path,expected=fixtures(out)
    contracts=run([build('tests/unzip_complete_contracts.ml','unzip_complete_contracts.exe'),fixture,raw_path,expected],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 23 complete unzip contracts':raise RuntimeError(contracts)
    retail_cases=0
    if args.data_root:
        retail=run([sys.executable,ROOT/'scripts/test_archives.py','--data-root',args.data_root],ROOT,log=out/'retail-archives.log',timeout=300).strip().splitlines()[-1]
        match=re.search(r'PASS: (\d+) archive/DEFLATE',retail)
        if not match:raise RuntimeError('retail archive regression did not pass: '+retail)
        retail_cases=int(match.group(1))
    files=[original,port,pk3,harness,ROOT/'tests/unzip_complete_oracle.ml',ROOT/'tests/unzip_complete_contracts.ml']
    result={'passed':True,'ledger_candidates':len(SYMBOLS),'productive_symbols':len(SYMBOLS)-len(FALSE_POSITIVES),'parser_false_positives':list(FALSE_POSITIVES),'unchanged_c_records':len(expected_text.splitlines()),'contracts':23,'retail_archive_cases':retail_cases,'scope':'Complete stateful minizip navigation, metadata, SFX offsets, local/central extra fields, chunk reads, raw DEFLATE lifecycle and allocation/checksum helpers.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: unzip.c {len(SYMBOLS)}/{len(SYMBOLS)} candidates ({len(SYMBOLS)-len(FALSE_POSITIVES)} live, {len(FALSE_POSITIVES)} parser-only) + {result['unchanged_c_records']} unchanged-C records + 23 contracts + {retail_cases} retail archive cases")
if __name__=='__main__':main()
