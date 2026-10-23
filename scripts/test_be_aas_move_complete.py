#!/usr/bin/env python3
"""Complete code/botlib/be_aas_move.c symbol and behavior gate."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

SYMBOLS=("AAS_Accelerate","AAS_AgainstLadder","AAS_AirControl","AAS_ApplyFriction","AAS_BFGJumpZVelocity","AAS_ClientMovementHitBBox","AAS_ClientMovementPrediction","AAS_ClipToBBox","AAS_DropToFloor","AAS_HorizontalVelocityForJump","AAS_InitSettings","AAS_JumpReachRunStart","AAS_OnGround","AAS_PredictClientMovement","AAS_RocketJumpZVelocity","AAS_SetMovedir","AAS_Swimming","AAS_TestMovementPrediction","AAS_WeaponJumpZVelocity")

def main():
 out=ROOT/'build/reference/be_aas_move_complete';out.mkdir(parents=True,exist_ok=True)
 original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_move.c';port=ROOT/'src/mq3/botlib/be_aas_move.ml';text=port.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text)]
 if missing: raise RuntimeError('missing be_aas_move symbols: '+', '.join(missing))
 oracle=out/'oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',ROOT/'tests/reference/aas_client_movement_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log').strip()
 if native!='PASS: 5 native Baseq3 AAS movement scenarios / 17 exact observations': raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/be_aas_move_complete_contracts.ml','--output','be_aas_move_complete_contracts.exe'],cwd=ROOT,check=True)
 contracts=run([ROOT/'build/be_aas_move_complete_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 16 complete be_aas_move contracts': raise RuntimeError(contracts)
 subprocess.run([sys.executable,ROOT/'scripts/test_aas_client_movement.py'],cwd=ROOT,check=True)
 files=[original,port,ROOT/'tests/reference/aas_client_movement_oracle.c',ROOT/'tests/be_aas_move_complete_contracts.ml']
 result={'passed':True,'symbols':len(SYMBOLS),'unchanged_c_scenarios':5,'exact_observations':17,'contracts':16,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print('PASS: 19/19 be_aas_move symbols + 5 unchanged-C scenarios / 17 observations + 16 complete contracts')
if __name__=='__main__':main()
