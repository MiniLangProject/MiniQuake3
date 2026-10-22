#!/usr/bin/env python3
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['LoadConfig_MenuEvent','LoadConfig_MenuInit','UI_LoadConfigMenu','UI_LoadConfig_Cache']
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_loadconfig.c';t=s.read_text(errors='replace');[(_ for _ in ()).throw(AssertionError(n)) for n in FUNCTIONS if n not in t]
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_load_config_contracts.ml','--output','ui_load_config_contracts.exe'],cwd=ROOT,check=True);out=ROOT/'build/reference/ui_load_config';out.mkdir(parents=True,exist_ok=True);a=run([ROOT/'build/ui_load_config_contracts.exe'],ROOT/'build').strip();assert a=='PASS: 8 native UI load config contracts (4 symbols)',a
 files=[s,ROOT/'src/mq3/client/ui_load_config.ml',ROOT/'tests/ui_load_config_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':8,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 4 original UI load config functions + 8 contracts')
if __name__=='__main__':main()
