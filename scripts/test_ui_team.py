#!/usr/bin/env python3
"""Source coverage and native contracts for ui_team.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_team.c';text=source.read_text(encoding='utf-8',errors='replace')
    names=['TeamMain_MenuEvent','TeamMain_MenuInit','TeamMain_Cache','UI_TeamMainMenu']
    for name in names: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_team_contracts.ml','--output','ui_team_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_team';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_team_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 9 UI team contracts',actual
    files=[source,ROOT/'src/mq3/client/ui_team.ml',ROOT/'tests/ui_team_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'source_functions':4,'contracts':9,'functions':names,'scope':'Complete team menu topology, gametype-dependent disabled states, team/spectator command dispatch, force-off behavior and shader cache.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print('PASS: 4 original UI team functions + 9 contracts')
if __name__=='__main__':main()
