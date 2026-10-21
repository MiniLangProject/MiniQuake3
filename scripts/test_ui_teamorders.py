#!/usr/bin/env python3
"""Unchanged q3_ui team-order decisions plus native MiniLang contracts."""
import json, subprocess, sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS=['UI_TeamOrdersMenu','UI_TeamOrdersMenu_BackEvent','UI_TeamOrdersMenu_BuildBotList','UI_TeamOrdersMenu_Cache','UI_TeamOrdersMenu_Init','UI_TeamOrdersMenu_Key','UI_TeamOrdersMenu_ListDraw','UI_TeamOrdersMenu_ListEvent','UI_TeamOrdersMenu_SetList','UI_TeamOrdersMenu_f']
ORACLE=['UI_TeamOrdersMenu_BackEvent','UI_TeamOrdersMenu_SetList','UI_TeamOrdersMenu_ListEvent']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_teamorders.c';port=ROOT/'src/mq3/client/ui_teamorders.ml';original=source.read_text(errors='replace');ported=port.read_text()
 for name in FUNCTIONS:
  if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing symbol '+name)
 out=ROOT/'build/reference/ui_teamorders';out.mkdir(parents=True,exist_ok=True);(out/'ui_teamorders_under_test.inc').write_text(extract(source,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/ui_teamorders_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out);actual=run([build('tests/ui_teamorders_oracle.ml','ui_teamorders_oracle.exe')],ROOT/'build')
 if expected!=actual: raise RuntimeError('teamorders oracle mismatch\nC:\n'+expected+'ML:\n'+actual)
 contracts=run([build('tests/ui_teamorders_contracts.ml','ui_teamorders_contracts.exe')],ROOT/'build').strip()
 if contracts!='PASS: 23 UI teamorders contracts': raise RuntimeError(contracts)
 files=[source,port,harness,ROOT/'tests/ui_teamorders_oracle.ml',ROOT/'tests/ui_teamorders_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':5,'contracts':23,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 5 unchanged C UI teamorders records + 23 contracts / 10 original functions')
if __name__=='__main__': main()
