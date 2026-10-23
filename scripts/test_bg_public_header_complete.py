#!/usr/bin/env python3
"""Complete bg_public.h shared gameplay ABI ownership gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/bg_public_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/game/bg_public.h';facade=ROOT/'src/mq3/game/bg_public.ml'
 original=header.read_text(encoding='latin1');all_port='\n'.join(p.read_text(encoding='utf-8',errors='ignore') for p in (ROOT/'src/mq3').rglob('*.ml'))
 defines=re.findall(r'^\s*#define\s+([A-Z][A-Z0-9_]*)',original,re.M);enums=[]
 for body in re.findall(r'typedef\s+enum\s*\{(.*?)\}\s*\w+',original,re.S): enums.extend(re.findall(r'\b([A-Z][A-Z0-9_]+)\b',re.sub(r'/\*.*?\*/|//[^\n]*','',body,flags=re.S)))
 names=list(dict.fromkeys(defines+enums));types=re.findall(r'}\s*(\w+_t)\s*;',original);functions=re.findall(r'^\s*(?:void|qboolean|gitem_t\s*\*)\s+(BG_[A-Za-z0-9_]+|Pmove|PM_UpdateViewAngles)\s*\(',original,re.M)
 missing_source=[n for n in names+types+functions if not re.search(r'\b'+re.escape(n)+r'\b',original)]
 missing_port=[n for n in names+types+functions if not re.search(r'\b'+re.escape(n)+r'\b',all_port)]
 if missing_source or missing_port: raise RuntimeError(f'bg_public.h coverage source={missing_source} port={missing_port}')
 oracle=out/'bg_public_header_oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4700','/DWIN32',ROOT/'tests/reference/bg_public_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/bg_public_header_oracle.ml','bg_public_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('bg_public.h unchanged-C mismatch')
 contracts=run([build('tests/bg_public_header_contracts.ml','bg_public_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 bg_public.h ABI contracts': raise RuntimeError(contracts)
 files=[header,facade,ROOT/'tests/reference/bg_public_header_oracle.c',ROOT/'tests/bg_public_header_oracle.ml',ROOT/'tests/bg_public_header_contracts.ml']
 result={'passed':True,'constants_enums':len(names),'types':len(types),'functions':len(functions),'exact_records':len(expected.splitlines()),'contracts':10,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: bg_public.h {len(names)} constants/enums + {len(types)} types + {len(functions)} functions + {len(expected.splitlines())} exact records + 10 contracts')
if __name__=='__main__':main()
