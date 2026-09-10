"""Differential Baseq3 team and client query helpers."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCTIONS=['BotTeam','BotOppositeTeam','EntityIsDead','ClientFromName','ClientOnSameTeamFromName','BotSameTeam']
def main():
 out=ROOT/'build/reference/bot_team_queries';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c';(out/'bot_team_queries_under_test.inc').write_text(extract(original,FUNCTIONS),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/bot_team_queries_oracle.c';exe=out/'bot_team_queries_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_team_queries_oracle.ml','--output','bot_team_queries_oracle.exe'],check=True);mini=run([ROOT/'build/bot_team_queries_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('team query differential mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_team_query_contracts.ml','--output','bot_team_query_contracts.exe'],check=True);contracts=run([ROOT/'build/bot_team_query_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 11 bot team query contracts':raise RuntimeError(contracts)
 result={'passed':True,'records':native.count('\n'),'contracts':11,'functions':FUNCTIONS,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/game/bot_team_helpers.ml',ROOT/'tests/bot_team_queries_oracle.ml',ROOT/'tests/bot_team_query_contracts.ml']}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact Baseq3 team-query differential records + 11 contracts")
if __name__=='__main__':main()
