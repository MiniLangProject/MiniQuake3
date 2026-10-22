#!/usr/bin/env python3
"""Unchanged q3_ui rankings actions plus native MiniLang contracts."""
import json, subprocess, sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS=['Rankings_Cache','Rankings_DrawName','Rankings_DrawPassword','Rankings_DrawText','Rankings_MenuEvent','Rankings_MenuInit','UI_RankingsMenu']
ORACLE=['Rankings_MenuEvent']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_rankings.c';port=ROOT/'src/mq3/client/ui_rankings.ml';original=source.read_text(errors='replace');ported=port.read_text()
 for name in FUNCTIONS:
  if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing symbol '+name)
 out=ROOT/'build/reference/ui_rankings';out.mkdir(parents=True,exist_ok=True);(out/'ui_rankings_under_test.inc').write_text(extract(source,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/ui_rankings_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out);actual=run([build('tests/ui_rankings_oracle.ml','ui_rankings_oracle.exe')],ROOT/'build')
 if expected!=actual: raise RuntimeError('rankings oracle mismatch\nC:\n'+expected+'ML:\n'+actual)
 contracts=run([build('tests/ui_rankings_contracts.ml','ui_rankings_contracts.exe')],ROOT/'build').strip()
 if contracts!='PASS: 12 UI rankings contracts': raise RuntimeError(contracts)
 files=[source,port,harness,ROOT/'tests/ui_rankings_oracle.ml',ROOT/'tests/ui_rankings_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':7,'contracts':12,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 7 unchanged C UI rankings records + 12 contracts / 7 original functions')
if __name__=='__main__': main()
