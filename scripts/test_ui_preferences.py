#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_preferences.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['Crosshair_Draw','Preferences_Cache','Preferences_Event','Preferences_MenuInit','Preferences_SetMenuItems','UI_PreferencesMenu']
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_preferences.c';t=s.read_text(errors='replace')
 for n in FUNCTIONS: assert n in t,n
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_preferences_contracts.ml','--output','ui_preferences_contracts.exe'],cwd=ROOT,check=True)
 out=ROOT/'build/reference/ui_preferences';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_preferences_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 12 native UI preferences contracts (6 symbols)',actual
 files=[s,ROOT/'src/mq3/client/ui_preferences.ml',ROOT/'tests/ui_preferences_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':12,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 6 original UI preferences functions + 12 contracts')
if __name__=='__main__':main()
