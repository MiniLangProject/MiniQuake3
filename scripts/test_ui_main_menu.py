#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_menu.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['ErrorMessage_Key','MainMenu_Cache','MainMenu_ExitAction','Main_MenuDraw','Main_MenuEvent','UI_MainMenu','UI_TeamArenaExists']
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_menu.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in FUNCTIONS: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_main_menu_contracts.ml','--output','ui_main_menu_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_main_menu';out.mkdir(parents=True,exist_ok=True)
    actual=run([ROOT/'build/ui_main_menu_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 15 native UI main menu contracts (7 symbols)',actual
    files=[source,ROOT/'src/mq3/client/ui_main_menu.ml',ROOT/'tests/ui_main_menu_contracts.ml']
    result={'passed':True,'contracts':15,'source_functions':7,'functions':FUNCTIONS,'scope':'Complete main menu layout and navigation, CD-key and error gates, missionpack discovery and restart, animated banner render boundary, demo/copyright draw paths, exit confirmation, cache and UI stack lifecycle.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 7 original UI main menu functions + 15 contracts')
if __name__=='__main__':main()
