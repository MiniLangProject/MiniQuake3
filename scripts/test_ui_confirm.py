#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_confirm.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['ConfirmMenu_Cache','ConfirmMenu_Draw','ConfirmMenu_Event','ConfirmMenu_Key','MessageMenu_Draw','UI_ConfirmMenu','UI_ConfirmMenu_Style','UI_Message']
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_confirm.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in FUNCTIONS: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_confirm_contracts.ml','--output','ui_confirm_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_confirm';out.mkdir(parents=True,exist_ok=True)
    actual=run([ROOT/'build/ui_confirm_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 11 native UI confirm contracts (8 symbols)',actual
    files=[source,ROOT/'src/mq3/client/ui_confirm.ml',ROOT/'tests/ui_confirm_contracts.ml']
    result={'passed':True,'contracts':11,'source_functions':8,'functions':FUNCTIONS,'scope':'Complete confirmation and message menus: original layout arithmetic, online fullscreen policy, draw layers, custom draw/action callbacks, yes/no and arrow keyboard handling, cache, cursor and menu lifecycle.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 8 original UI confirm functions + 11 contracts')
if __name__=='__main__':main()
