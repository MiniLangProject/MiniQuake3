"""Direct extracted Baseq3 enemy-flag-away CTF order oracle and contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/bot_ctf_enemy_away';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/game/ai_team.c';(out/'bot_ctf_enemy_away_under_test.inc').write_text(extract(original,['BotCTFOrders_EnemyFlagNotAtBase']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/bot_ctf_enemy_away_oracle.c';exe=out/'bot_ctf_enemy_away_oracle.exe';run(['cl','/nologo','/O2','/MT','/W4',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 if native.count('\n')!=12 or 'n1=\n' not in native or 'n12=' not in native or 'C:cmd_accompany:P4:P0' not in native:raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_ctf_enemy_away_contracts.ml','--output','bot_ctf_enemy_away_contracts.exe'],check=True);mini=run([ROOT/'build/bot_ctf_enemy_away_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 15 enemy-flag-away CTF order contracts':raise RuntimeError(mini)
 files=[original,harness,ROOT/'src/mq3/game/bot_team_helpers.ml',ROOT/'tests/bot_ctf_enemy_away_contracts.ml'];result={'passed':True,'native_records':12,'contracts':15,'function':'BotCTFOrders_EnemyFlagNotAtBase','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
 print('PASS: 12 exact Baseq3 enemy-flag-away CTF records + 15 contracts')
if __name__=='__main__':main()
