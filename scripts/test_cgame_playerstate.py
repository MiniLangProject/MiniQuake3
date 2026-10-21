"""Unchanged-C differential and native contracts for cg_playerstate.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
 out=ROOT/'build/reference/cgame_playerstate';out.mkdir(parents=True,exist_ok=True)
 src=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_playerstate.c'
 functions=['CG_CheckAmmo','CG_DamageFeedback','CG_Respawn']
 (out/'cgame_playerstate_under_test.inc').write_text(extract(src,functions),encoding='utf-8',newline='\n')
 host=ROOT/'tests/reference/cgame_playerstate_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/W4','/WX','/wd4100','/wd4244',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 for source,name in [('tests/cgame_playerstate_oracle.ml','cgame_playerstate_oracle.exe'),('tests/cgame_playerstate_contracts.ml','cgame_playerstate_contracts.exe')]:
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/cgame_playerstate_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
 contracts=run([ROOT/'build/cgame_playerstate_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 23 playerstate contracts',contracts
 files=[src,host,ROOT/'src/mq3/client/cgame_playerstate.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',ROOT/'tests/cgame_playerstate_oracle.ml',ROOT/'tests/cgame_playerstate_contracts.ml']
 result={'passed':True,'differential_records':7,'contracts':23,'functions':['CG_CheckAmmo','CG_DamageFeedback','CG_Respawn','CG_CheckPlayerstateEvents','CG_CheckChangedPredictableEvents','pushReward','CG_CheckLocalSounds','CG_TransitionPlayerState'],'scope':'Complete native player-state transition observer wired after snapshot promotion. Exact unchanged-C ammo, damage-kick and respawn records plus native contracts cover events, corrections, rewards, local announcements, warnings and transition suppression. The observer records actions and never repeats QVM audio/entity-event traps.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
 print('PASS: 7 unchanged C playerstate records + 23 native contracts')
if __name__=='__main__':main()
