#!/usr/bin/env python3
"""Complete g_public.h shared-entity, flag and VM opcode gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/g_public_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/game/g_public.h';facade=ROOT/'src/mq3/game/g_public.ml';traps=ROOT/'src/mq3/game/syscalls.ml';exports=ROOT/'src/mq3/server/game_vm.ml'
 original=header.read_text(encoding='latin1');ported='\n'.join(p.read_text(encoding='utf-8') for p in (facade,traps,exports))
 flags=("GAME_API_VERSION","SVF_NOCLIENT","SVF_CLIENTMASK","SVF_BOT","SVF_BROADCAST","SVF_PORTAL","SVF_USE_CURRENT_ORIGIN","SVF_SINGLECLIENT","SVF_NOSERVERINFO","SVF_CAPSULE","SVF_NOTSINGLECLIENT")
 enums=[]
 for body in re.findall(r'typedef\s+enum\s*\{(.*?)\}\s*(?:gameImport_t|gameExport_t)',original,re.S):
  clean=re.sub(r'/\*.*?\*/|//[^\n]*','',body,flags=re.S)
  enums.extend(re.findall(r'^\s*((?:G|GAME|BOTLIB|BOTAI)_[A-Z0-9_]+)\s*(?:=\s*[^,]+)?\s*,?',clean,re.M))
 names=flags+tuple(enums)+("entityShared_t","sharedEntity_t")
 missing_source=[n for n in names if not re.search(r'\b'+re.escape(n)+r'\b',original)]
 missing_port=[n for n in flags+tuple(enums) if not re.search(r'\bconst\s+'+re.escape(n)+r'\b',ported)]+[n for n in ("entityShared_t","sharedEntity_t") if n not in ported]
 if missing_source or missing_port: raise RuntimeError(f'g_public.h coverage source={missing_source} port={missing_port}')
 oracle=out/'g_public_header_oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/g_public_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/g_public_header_oracle.ml','g_public_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('g_public.h unchanged-C mismatch')
 contracts=run([build('tests/g_public_header_contracts.ml','g_public_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 g_public.h ABI contracts': raise RuntimeError(contracts)
 files=[header,facade,traps,exports,ROOT/'tests/reference/g_public_header_oracle.c',ROOT/'tests/g_public_header_oracle.ml',ROOT/'tests/g_public_header_contracts.ml']
 result={'passed':True,'imports_exports':len(enums),'flags':len(flags),'types':2,'exact_records':len(expected.splitlines()),'contracts':10,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: g_public.h {len(enums)} import/export opcodes + {len(flags)} flags + 2 ABI types + {len(expected.splitlines())} exact records + 10 contracts')
if __name__=='__main__':main()
