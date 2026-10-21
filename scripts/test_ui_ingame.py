#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_ingame.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['InGame_Cache','InGame_Event','InGame_MenuInit','InGame_QuitAction','InGame_RestartAction','UI_InGameMenu']
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_ingame.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in FUNCTIONS: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_ingame_contracts.ml','--output','ui_ingame_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_ingame';out.mkdir(parents=True,exist_ok=True)
    actual=run([ROOT/'build/ui_ingame_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 14 native UI ingame contracts (6 symbols)',actual
    files=[source,ROOT/'src/mq3/client/ui_ingame.ml',ROOT/'tests/ui_ingame_contracts.ml']
    result={'passed':True,'contracts':14,'source_functions':6,'functions':FUNCTIONS,'scope':'Complete in-game menu topology, local-server/bot/gametype/team disabled states, team/setup/server/bot/order navigation, restart/quit confirmation, disconnect/resume commands, cache and forced top-level cursor lifecycle.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 6 original UI ingame functions + 14 contracts')
if __name__=='__main__':main()
