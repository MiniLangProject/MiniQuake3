#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_mods.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['UI_Mods_MenuEvent','UI_Mods_ParseInfos','UI_Mods_LoadModsFromFile','UI_Mods_LoadMods','UI_Mods_MenuInit','UI_ModsMenu_Cache','UI_ModsMenu']
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_mods.c';t=s.read_text(errors='replace')
 for n in FUNCTIONS: assert n in t,n
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_mods_contracts.ml','--output','ui_mods_contracts.exe'],cwd=ROOT,check=True)
 out=ROOT/'build/reference/ui_mods';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_mods_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 10 native UI mods contracts (7 symbols)',actual
 files=[s,ROOT/'src/mq3/client/ui_mods.ml',ROOT/'tests/ui_mods_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':10,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 7 original UI mods functions + 10 contracts')
if __name__=='__main__':main()
