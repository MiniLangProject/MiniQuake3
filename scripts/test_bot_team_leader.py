"""Differential Baseq3 human team-leader selection."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/bot_team_leader';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/game/ai_team.c';(out/'bot_team_leader_under_test.inc').write_text(extract(original,['FindHumanTeamLeader']),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/bot_team_leader_oracle.c';exe=out/'bot_team_leader_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_team_leader_oracle.ml','--output','bot_team_leader_oracle.exe'],check=True);mini=run([ROOT/'build/bot_team_leader_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 # C emits callbacks before the summary; compare normalized per-case semantics below.
 nativeLines=native.splitlines();miniLines=mini.splitlines();expectedNative=['last','defend:3:1','found=1:Human','last','found=1:Human','found=0:'];expectedMini=['found=1:Human','last','defend:3:1','found=1:Human','last','found=0:']
 if nativeLines!=expectedNative or miniLines!=expectedMini:raise RuntimeError('team leader differential mismatch\nnative: '+repr(nativeLines)+'\nmini: '+repr(miniLines))
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_team_leader_contracts.ml','--output','bot_team_leader_contracts.exe'],check=True);contracts=run([ROOT/'build/bot_team_leader_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 6 bot team leader contracts':raise RuntimeError(contracts)
 result={'passed':True,'records':len(nativeLines),'contracts':6,'functions':['FindHumanTeamLeader'],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/game/bot_team_helpers.ml',ROOT/'tests/bot_team_leader_oracle.ml',ROOT/'tests/bot_team_leader_contracts.ml']}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 3 Baseq3 leader scenarios / 6 exact observations + 6 contracts')
if __name__=='__main__':main()
