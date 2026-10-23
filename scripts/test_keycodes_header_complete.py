#!/usr/bin/env python3
"""Complete unchanged-C gate for the old q3_ui key number ABI."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/keycodes_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/q3_ui/keycodes.h';module=ROOT/'src/mq3/client/keycodes.ml';qmenu=ROOT/'src/mq3/client/ui_qmenu.ml';session=ROOT/'src/mq3/client/original_ui_session.ml'
 original=header.read_text(encoding='latin1');ported='\n'.join(p.read_text(encoding='utf-8') for p in (module,qmenu,session))
 body=re.search(r'typedef\s+enum\s*\{(.*?)\}\s*keyNum_t',original,re.S).group(1);names=re.findall(r'\b(K_[A-Z0-9_]+)\s*(?:=|,|$)',re.sub(r'//[^\n]*','',body),re.M)+['K_CHAR_FLAG']
 missing=[name for name in names if not re.search(r'\bconst\s+'+name+r'\s*=',ported)]
 if missing:raise RuntimeError(f'keycodes.h missing constants: {missing}')
 oracle=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX',ROOT/'tests/reference/keycodes_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/keycodes_header_oracle.ml','keycodes_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:raise RuntimeError(f'keycodes.h unchanged-C mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}')
 contracts=run([build('tests/keycodes_header_contracts.ml','keycodes_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 keycodes.h ABI contracts':raise RuntimeError(contracts)
 result={'passed':True,'constants':len(names),'types':1,'exact_records':len(expected.splitlines()),'contracts':10,'productive_consumers':['src/mq3/client/ui_qmenu.ml','src/mq3/client/original_ui_session.ml'],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in (header,module,qmenu,session,ROOT/'tests/reference/keycodes_header_oracle.c',ROOT/'tests/keycodes_header_oracle.ml',ROOT/'tests/keycodes_header_contracts.ml')}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: keycodes.h {len(names)} constants + keyNum_t + {len(expected.splitlines())} exact records + 10 contracts')
if __name__=='__main__':main()
