#!/usr/bin/env python3
"""Unchanged q3_ui rank-status routes plus native MiniLang contracts."""
import json, subprocess, sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS=['RankStatus_Cache','RankStatus_MenuEvent','RankStatus_MenuInit','UI_RankStatusMenu']
ORACLE=['RankStatus_MenuEvent']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_rankstatus.c';port=ROOT/'src/mq3/client/ui_rankstatus.ml';original=source.read_text(errors='replace');ported=port.read_text()
 for name in FUNCTIONS:
  if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing symbol '+name)
 out=ROOT/'build/reference/ui_rankstatus';out.mkdir(parents=True,exist_ok=True);(out/'ui_rankstatus_under_test.inc').write_text(extract(source,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/ui_rankstatus_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out);actual=run([build('tests/ui_rankstatus_oracle.ml','ui_rankstatus_oracle.exe')],ROOT/'build')
 if expected!=actual: raise RuntimeError('rankstatus oracle mismatch\nC:\n'+expected+'ML:\n'+actual)
 contracts=run([build('tests/ui_rankstatus_contracts.ml','ui_rankstatus_contracts.exe')],ROOT/'build').strip()
 if contracts!='PASS: 10 UI rankstatus contracts': raise RuntimeError(contracts)
 files=[source,port,harness,ROOT/'tests/ui_rankstatus_oracle.ml',ROOT/'tests/ui_rankstatus_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':5,'contracts':10,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 5 unchanged C UI rankstatus records + 10 contracts / 4 original functions')
if __name__=='__main__': main()
