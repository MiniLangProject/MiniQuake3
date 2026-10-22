#!/usr/bin/env python3
"""Complete code/qcommon/files.c native runtime, unchanged-C and retail gate."""
import argparse
import json
import re
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def port_name(symbol: str) -> str:
    if symbol.startswith('FS_'):return 'fs_'+symbol[3:]
    if symbol.startswith('Sys_'):return 'sys_'+symbol[4:]
    if symbol=='FILE':return 'file'
    return symbol[0].lower()+symbol[1:]

def fixture(out: Path) -> Path:
    root=out/'root'
    if root.exists():shutil.rmtree(root)
    base=root/'baseq3';(base/'maps').mkdir(parents=True);(base/'loose.cfg').write_text('loose',encoding='ascii');(base/'maps/loose.bsp').write_bytes(b'loose')
    with zipfile.ZipFile(base/'pak0.pk3','w',zipfile.ZIP_DEFLATED) as z:z.writestr('common.txt',b'zero');z.writestr('maps/a.bsp',b'a');z.writestr('scripts/common.shader',b'old')
    with zipfile.ZipFile(base/'pak1.pk3','w',zipfile.ZIP_DEFLATED) as z:z.writestr('common.txt',b'one');z.writestr('maps/b.bsp',b'b');z.writestr('scripts/Common.shader',b'new')
    return root

def main() -> None:
    ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path);args=ap.parse_args()
    original_path=ROOT/'Quake-III-Arena-original-source/code/qcommon/files.c';module_path=ROOT/'src/mq3/qcommon/files_runtime.ml'
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'));symbols=next(x for x in ledger['files'] if x['source']=='code/qcommon/files.c')['symbol_candidates']
    original=original_path.read_text(encoding='latin-1');port=module_path.read_text(encoding='utf-8')
    missing_original=[]
    for symbol in symbols:
        pattern=rf'\b{re.escape(symbol)}\s*\('
        if symbol in ('FILE','cvars','fclose','paksort','readable','write'):pattern=rf'\b{re.escape(symbol)}\b'
        if not re.search(pattern,original):missing_original.append(symbol)
    missing_port=[s for s in symbols if not re.search(rf'\bfunction\s+{re.escape(port_name(s))}\s*\(',port)]
    if len(symbols)!=75 or missing_original or missing_port:raise SystemExit(f'FAIL: coverage count={len(symbols)} original={missing_original} port={missing_port}')
    out=ROOT/'build/reference/files_runtime';out.mkdir(parents=True,exist_ok=True)
    functions=['FS_HashFileName','FS_FilenameCompare','FS_ShiftedStrStr','FS_ConvertPath','FS_PathCmp','FS_ReturnPath']
    (out/'files_runtime_under_test.inc').write_text(extract(original_path,functions),encoding='utf-8',newline='\n')
    native=out/'files_runtime_oracle.exe';run(['cl','/nologo','/O2','/MT','/W4','/WX','/wd4244','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',ROOT/'tests/reference/files_runtime_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    c_value=run([native],out,log=out/'oracle.log');ml_value=run([build('tests/files_runtime_oracle.ml','files_runtime_oracle.exe')],ROOT/'build',log=out/'minilang.log')
    if c_value!=ml_value:raise SystemExit('FAIL: unchanged files.c differential\nC:\n'+c_value+'MiniLang:\n'+ml_value)
    root=fixture(out);contract=run([build('tests/files_runtime_contracts.ml','files_runtime_contracts.exe'),root],ROOT/'build',timeout=240).strip()
    if contract!='PASS: 44 complete files.c runtime contracts':raise SystemExit(contract)
    pure_root=ROOT/'build/reference/pure_filesystem/root'
    if pure_root.exists():shutil.rmtree(pure_root)
    pure=subprocess.run([sys.executable,ROOT/'scripts/test_pure_filesystem.py'],cwd=ROOT,check=True,capture_output=True,text=True).stdout
    archive_args=[sys.executable,ROOT/'scripts/test_archives.py'];
    if args.data_root:archive_args.extend(['--data-root',str(args.data_root)])
    archives=subprocess.run(archive_args,cwd=ROOT,check=True,capture_output=True,text=True,timeout=300).stdout
    retail=None
    if args.data_root:
        retail=run([build('tests/files_runtime_retail_probe.ml','files_runtime_retail_probe.exe'),args.data_root.resolve()],ROOT/'build',timeout=240).strip()
        if not retail.startswith('PASS: 10 retail files.c probes'):raise SystemExit(retail)
    files=[original_path,module_path,ROOT/'tests/reference/files_runtime_oracle.c',ROOT/'tests/files_runtime_oracle.ml',ROOT/'tests/files_runtime_contracts.ml',ROOT/'tests/files_runtime_retail_probe.ml',ROOT/'scripts/test_files_runtime.py']
    result={'passed':True,'symbols':75,'unchanged_c_functions':functions,'oracle_records':len(c_value.splitlines()),'contracts':44,'pure_filesystem_contracts':25,'retail':retail,'scope':'Complete files.c facade over native search paths, PK3/ZIP, pure/reference checksums, bounded handles and seek/read/write/append, file lists, server paths and restart/shutdown lifecycle.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 75 / 75 files.c symbols');print(f'PASS: {len(c_value.splitlines())} unchanged-C files.c records');print(contract)
    print(next(line for line in pure.splitlines() if line.startswith('PASS:')));print(next(line for line in archives.splitlines() if line.startswith('PASS:')))
    if retail:print(retail)

if __name__=='__main__':main()
