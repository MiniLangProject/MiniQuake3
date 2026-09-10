"""Build unchanged Baseq3 BotAttackMove oracle and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_attack_move';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_attack_move_oracle.c';exe=out/'bot_attack_move_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 if native!='PASS: 12 native Baseq3 BotAttackMove scenarios / 21 exact observations':raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_attack_move_contracts.ml','--output','bot_attack_move_contracts.exe'],check=True);mini=run([ROOT/'build/bot_attack_move_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 15 BotAttackMove contracts':raise RuntimeError(mini)
 files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c',src,ROOT/'src/mq3/game/bot_combat_ai.ml',ROOT/'src/mq3/game/bot_lifecycle.ml',ROOT/'tests/bot_attack_move_contracts.ml']
 result={'passed':True,'native':native,'minilang':mini,'native_scenarios':12,'exact_observations':21,'contract_count':15,'scope':'Full Baseq3 BotAttackMove chase, skill, distance, gauntlet, jump/crouch cooldown and adaptive strafe movement.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: unchanged-C BotAttackMove oracle + 15 MiniLang contracts')
if __name__=='__main__':main()
