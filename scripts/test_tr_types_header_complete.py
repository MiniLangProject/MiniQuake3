#!/usr/bin/env python3
"""Complete tr_types.h renderer-facing types, flags and ABI-layout gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/tr_types_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/cgame/tr_types.h';facade=ROOT/'src/mq3/renderer/tr_types.ml';queue=ROOT/'src/mq3/renderer/scene_queue.ml'
 original=header.read_text(encoding='latin1');ported=facade.read_text(encoding='utf-8')
 constants=re.findall(r'^const\s+([A-Z_][A-Z0-9_]*)=',ported,re.M)
 types=('polyVert_t','poly_t','refEntityType_t','refEntity_t','refdef_t','stereoFrame_t','textureCompression_t','glDriverType_t','glHardwareType_t','glconfig_t')
 missing_source=[n for n in constants if not re.search(r'\b'+re.escape(n)+r'\b',original)]
 missing_types=[n for n in types if not re.search(r'\b'+re.escape(n)+r'\b',original) or n not in ported]
 if missing_source or missing_types: raise RuntimeError(f'tr_types.h coverage constants={missing_source} types={missing_types}')
 oracle=out/'tr_types_header_oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/tr_types_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/tr_types_header_oracle.ml','tr_types_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('tr_types.h unchanged-C mismatch')
 contracts=run([build('tests/tr_types_header_contracts.ml','tr_types_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 tr_types.h ABI contracts': raise RuntimeError(contracts)
 files=[header,facade,queue,ROOT/'tests/reference/tr_types_header_oracle.c',ROOT/'tests/tr_types_header_oracle.ml',ROOT/'tests/tr_types_header_contracts.ml']
 result={'passed':True,'constants_enums':len(constants),'types':len(types),'exact_records':len(expected.splitlines()),'contracts':10,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: tr_types.h {len(constants)} constants/enums + {len(types)} ABI types + {len(expected.splitlines())} exact records + 10 contracts')
if __name__=='__main__':main()
