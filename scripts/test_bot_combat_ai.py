"""Build unchanged-C ai_dmq3 combat oracle and focused MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_combat_ai';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_combat_ai_oracle.c';exe=out/'bot_combat_ai_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 expected='PASS: 12 native Baseq3 bot combat scenarios / 68 exact observations'
 if native!=expected:raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_combat_ai_contracts.ml','--output','bot_combat_ai_contracts.exe'],check=True);mini=run([ROOT/'build/bot_combat_ai_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 35 bot combat AI contracts':raise RuntimeError(mini)
 files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c',src,ROOT/'src/mq3/game/bot_combat_ai.ml',ROOT/'src/mq3/game/bot_lifecycle.ml',ROOT/'tests/bot_combat_ai_contracts.ml']
 result={'passed':True,'native':native,'minilang':mini,'native_scenarios':12,'exact_observations':68,'contract_count':35,'scope':'Baseq3 ai_dmq3 combat predicates, CTF carrying, teleport/death/intermission/hazard state, aggression, retreat/chase, rocket-jump eligibility and field-of-vision decisions.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: direct C oracle + 35 MiniLang bot combat AI contracts')
if __name__=='__main__':main()
