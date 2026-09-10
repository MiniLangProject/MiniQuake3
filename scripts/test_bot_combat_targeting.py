"""Build Baseq3 targeting/attack C oracle and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_combat_targeting';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_combat_targeting_oracle.c';exe=out/'bot_combat_targeting_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 if native!='PASS: 10 native Baseq3 targeting scenarios / 25 exact observations':raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_combat_targeting_contracts.ml','--output','bot_combat_targeting_contracts.exe'],check=True);mini=run([ROOT/'build/bot_combat_targeting_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 24 bot combat targeting contracts':raise RuntimeError(mini)
 files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c',src,ROOT/'src/mq3/game/bot_combat_ai.ml',ROOT/'src/mq3/game/bot_lifecycle.ml',ROOT/'tests/bot_combat_targeting_contracts.ml']
 result={'passed':True,'native':native,'minilang':mini,'native_scenarios':10,'exact_observations':25,'contract_count':24,'scope':'Enemy scanning and replacement, direct/visible/last-known aiming, reaction and throttle gates, FOV, obstruction, teammate, radial self-damage and fire-release attack decisions.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: direct C oracle + 24 MiniLang bot targeting contracts')
if __name__=='__main__':main()
