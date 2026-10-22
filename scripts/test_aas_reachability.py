"""Build the unchanged-C oracle and native/retail be_aas_reach contracts."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run

SYMBOLS = [
 "AAS_AllocReachability","AAS_AreaClusterPortal","AAS_AreaCrouch","AAS_AreaDoNotEnter","AAS_AreaGroundFaceArea","AAS_AreaGrounded","AAS_AreaJumpPad","AAS_AreaLadder","AAS_AreaLava","AAS_AreaLiquid","AAS_AreaReachability","AAS_AreaSlime","AAS_AreaSwim","AAS_AreaTeleporter","AAS_AreaVolume","AAS_BarrierJumpTravelTime","AAS_BestReachableArea","AAS_BestReachableFromJumpPadArea","AAS_BestReachableLinkArea","AAS_ClosestEdgePoints","AAS_ContinueInitReachability","AAS_FaceArea","AAS_FaceCenter","AAS_FallDamageDistance","AAS_FallDelta","AAS_FindFaceReachabilities","AAS_FreeReachability","AAS_GetJumpPadInfo","AAS_InitReachability","AAS_MaxJumpDistance","AAS_MaxJumpHeight","AAS_NearbySolidOrGap","AAS_ReachabilityExists","AAS_Reachability_Elevator","AAS_Reachability_EqualFloorHeight","AAS_Reachability_FuncBobbing","AAS_Reachability_Grapple","AAS_Reachability_Jump","AAS_Reachability_JumpPad","AAS_Reachability_Ladder","AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge","AAS_Reachability_Swim","AAS_Reachability_Teleport","AAS_Reachability_WalkOffLedge","AAS_Reachability_WeaponJump","AAS_SetWeaponJumpAreaFlags","AAS_SetupReachabilityHeap","AAS_ShutDownReachabilityHeap","AAS_StoreReachability","AAS_TravelFlagsForTeam","VectorBetweenVectors","VectorDistance","VectorMiddle"]

def main():
 p=argparse.ArgumentParser();p.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));a=p.parse_args();out=ROOT/'build/reference/aas_reachability';out.mkdir(parents=True,exist_ok=True)
 module=ROOT/'src/mq3/botlib/aas_reachability.ml';text=module.read_text(encoding='utf-8-sig');missing=[s for s in SYMBOLS if not re.search(rf'(?m)^function\s+{re.escape(s)}\s*\(',text)]
 if missing: raise RuntimeError(f'missing symbols: {missing}')
 original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_reach.c';ot=original.read_text(encoding='latin-1');absent=[s for s in SYMBOLS if not re.search(rf'\b{re.escape(s)}\s*\(',ot)]
 if absent: raise RuntimeError(f'not in original: {absent}')
 source=ROOT/'tests/reference/aas_reachability_oracle.c';exe=out/'aas_reachability_oracle.exe';run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',source,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 if native!='PASS: 8 unchanged-C reachability observations': raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_reachability_contracts.ml','--output','aas_reachability_contracts.exe'],cwd=ROOT,check=True);pak=a.data_root/'baseq3/pak0.pk3';mini=run([ROOT/'build/aas_reachability_contracts.exe',pak],ROOT,log=out/'contracts.log').strip()
 if mini!='PASS: 29 AAS reachability native contracts': raise RuntimeError(mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_reachability_retail_probe.ml','--output','aas_reachability_retail_probe.exe'],cwd=ROOT,check=True);retail=run([ROOT/'build/aas_reachability_retail_probe.exe',pak],ROOT,log=out/'retail.log').strip()
 if not retail.startswith('PASS: 8 q3dm17 reachability contracts'): raise RuntimeError(retail)
 files=[original,module,source,ROOT/'tests/aas_reachability_contracts.ml',ROOT/'tests/aas_reachability_retail_probe.ml'];result={'passed':True,'symbols':len(SYMBOLS),'native':native,'minilang':mini,'retail':retail,'scope':'All be_aas_reach.c ledger candidates: geometry/physics, heap/store, area traits, pair generation and special BSP entity reachabilities. Released retail AAS retains BSPC-precomputed links unless forceReachability is selected.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 53/53 be_aas_reach symbols + 8 C + 29 native + 8 retail contracts')
if __name__=='__main__': main()

