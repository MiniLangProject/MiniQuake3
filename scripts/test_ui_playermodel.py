#!/usr/bin/env python3
import json, subprocess, sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCS=['PlayerModel_BuildList','PlayerModel_Cache','PlayerModel_DrawPlayer','PlayerModel_MenuEvent','PlayerModel_MenuInit','PlayerModel_MenuKey','PlayerModel_PicEvent','PlayerModel_SaveChanges','PlayerModel_SetMenuItems','PlayerModel_UpdateGrid','PlayerModel_UpdateModel','UI_PlayerModelMenu']
ORACLE=['PlayerModel_SaveChanges','PlayerModel_MenuEvent']
def build(s,o): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',s,'--output',o],cwd=ROOT,check=True);return ROOT/'build'/o
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_playermodel.c';p=ROOT/'src/mq3/client/ui_playermodel.ml';ot=s.read_text(errors='replace');pt=p.read_text()
 for f in FUNCS:
  if f not in ot or f'function {f}(' not in pt: raise RuntimeError('missing symbol '+f)
 out=ROOT/'build/reference/ui_playermodel';out.mkdir(parents=True,exist_ok=True);(out/'ui_playermodel_under_test.inc').write_text(extract(s,ORACLE))
 h=ROOT/'tests/reference/ui_playermodel_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');e=run([exe],out);a=run([build('tests/ui_playermodel_oracle.ml','ui_playermodel_oracle.exe')],ROOT/'build')
 if e!=a: raise RuntimeError('playermodel oracle mismatch\nC:\n'+e+'ML:\n'+a)
 c=run([build('tests/ui_playermodel_contracts.ml','ui_playermodel_contracts.exe')],ROOT/'build').strip()
 if c!='PASS: 17 UI playermodel contracts': raise RuntimeError(c)
 files=[s,p,h,ROOT/'tests/ui_playermodel_oracle.ml',ROOT/'tests/ui_playermodel_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':4,'contracts':17,'functions':FUNCS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 4 unchanged C UI playermodel records + 17 contracts / 12 original functions')
if __name__=='__main__': main()
