#!/usr/bin/env python3
"""Source coverage and native contracts for ui_spskill.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_spskill.c';text=source.read_text(encoding='utf-8',errors='replace')
    names=['SetSkillColor','UI_SPSkillMenu_SkillEvent','UI_SPSkillMenu_FightEvent','UI_SPSkillMenu_BackEvent','UI_SPSkillMenu_Key','UI_SPSkillMenu_Cache','UI_SPSkillMenu_Init','UI_SPSkillMenu']
    for name in names: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_sp_skill_contracts.ml','--output','ui_sp_skill_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_sp_skill';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_sp_skill_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 10 UI SP skill contracts',actual
    files=[source,ROOT/'src/mq3/client/ui_sp_skill.ml',ROOT/'tests/ui_sp_skill_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'source_functions':8,'contracts':10,'functions':names,'scope':'Complete difficulty menu selection, color and picture state, announcer sounds, back/default-key handling, cache, fight routing and arena launch.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print('PASS: 8 original UI SP skill functions + 10 contracts')
if __name__=='__main__':main()
