#!/usr/bin/env python3
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['UI_SaveConfigMenu','UI_SaveConfigMenu_BackEvent','UI_SaveConfigMenu_Cache','UI_SaveConfigMenu_Init','UI_SaveConfigMenu_SaveEvent','UI_SaveConfigMenu_SavenameDraw']
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_saveconfig.c';t=s.read_text(errors='replace');[(_ for _ in ()).throw(AssertionError(n)) for n in FUNCTIONS if n not in t]
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_save_config_contracts.ml','--output','ui_save_config_contracts.exe'],cwd=ROOT,check=True);out=ROOT/'build/reference/ui_save_config';out.mkdir(parents=True,exist_ok=True);a=run([ROOT/'build/ui_save_config_contracts.exe'],ROOT/'build').strip();assert a=='PASS: 8 native UI save config contracts (6 symbols)',a
 files=[s,ROOT/'src/mq3/client/ui_save_config.ml',ROOT/'tests/ui_save_config_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':8,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 6 original UI save config functions + 8 contracts')
if __name__=='__main__':main()
