"""Complete be_ai_move.c symbol, unchanged-C, native and retail gate."""
import argparse,json,os,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from test_aas_route_extras import fixture
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['AngleDiff','BotAddAvoidSpot','BotAddToAvoidReach','BotAddToTarget','BotAirControl','BotAllocMoveState','BotAvoidSpots','BotCheckBarrierJump','BotCheckBlocked','BotClearMoveResult','BotFinishTravel_BarrierJump','BotFinishTravel_Elevator','BotFinishTravel_FuncBobbing','BotFinishTravel_Jump','BotFinishTravel_JumpPad','BotFinishTravel_Walk','BotFinishTravel_WalkOffLedge','BotFinishTravel_WaterJump','BotFinishTravel_WeaponJump','BotFreeMoveState','BotFuncBobStartEnd','BotFuzzyPointReachabilityArea','BotGapDistance','BotGetReachabilityToGoal','BotInitMoveState','BotMoveInDirection','BotMoveInGoalArea','BotMoveStateFromHandle','BotMoveToGoal','BotMovementViewTarget','BotOnMover','BotOnTopOfEntity','BotPredictVisiblePosition','BotReachabilityArea','BotReachabilityTime','BotResetAvoidReach','BotResetGrapple','BotResetLastAvoidReach','BotResetMoveState','BotSetBrushModelTypes','BotSetupMoveAI','BotShutdownMoveAI','BotSwimInDirection','BotTravel_BFGJump','BotTravel_BarrierJump','BotTravel_Crouch','BotTravel_Elevator','BotTravel_FuncBobbing','BotTravel_Grapple','BotTravel_Jump','BotTravel_JumpPad','BotTravel_Ladder','BotTravel_RocketJump','BotTravel_Swim','BotTravel_Teleport','BotTravel_Walk','BotTravel_WalkOffLedge','BotTravel_WaterJump','BotValidTravel','BotVisible','BotWalkInDirection','DistanceFromLineSquared','GrappleState','Intersection','MoverBottomCenter','MoverDown','VectorDistanceSquared']
ORACLE=['AngleDiff','DistanceFromLineSquared','VectorDistanceSquared','Intersection','BotAddToTarget','BotClearMoveResult','BotReachabilityTime']
def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path(os.environ.get('MQ3_DATA_ROOT','D:/Quake3')));args=parser.parse_args();data_root=args.data_root.resolve()
 py_compile.compile(__file__,doraise=True);out=ROOT/'build/reference/be_ai_move_complete';out.mkdir(parents=True,exist_ok=True);(out/'move.aas').write_bytes(fixture())
 original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_ai_move.c';module=ROOT/'src/mq3/botlib/be_ai_move.ml';text=module.read_text(encoding='utf-8');missing=[x for x in SYMBOLS if not re.search(r'function\s+'+re.escape(x)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing movement symbols: '+', '.join(missing))
 inc=out/'be_ai_move_complete_under_test.inc';inc.write_text(extract(original,ORACLE),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/be_ai_move_complete_oracle.c';nativeExe=out/'be_ai_move_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{nativeExe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([nativeExe],out,log=out/'oracle.log');mini=run([build('tests/be_ai_move_complete_oracle.ml','be_ai_move_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 normalizedMini=re.sub(r'(?<=\d)\.(?=[,\n])','',mini)
 if native!=normalizedMini:raise RuntimeError('be_ai_move unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/be_ai_move_complete_contracts.ml','be_ai_move_complete_contracts.exe'),out/'move.aas'],ROOT/'build',log=out/'contracts.log').strip();expected='PASS: 18 complete be_ai_move adapter contracts'
 if contracts!=expected:raise RuntimeError(contracts)
 retail=run([build('tests/be_ai_move_retail_probe.ml','be_ai_move_retail_probe.exe'),data_root/'baseq3/pak0.pk3'],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 5 retail q3dm1 movement contracts'):raise RuntimeError(retail)
 result={'passed':True,'symbols':len(SYMBOLS),'differentialRecords':native.count('\n'),'contracts':18,'retail':retail,'data_root':str(data_root),'oracleFunctions':ORACLE,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,module,ROOT/'src/mq3/botlib/ai_move_runtime.ml',harness,ROOT/'tests/be_ai_move_complete_oracle.ml',ROOT/'tests/be_ai_move_complete_contracts.ml',ROOT/'tests/be_ai_move_retail_probe.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)} be_ai_move symbols + {result['differentialRecords']} unchanged-C records + 18 contracts + retail")
if __name__=='__main__':main()
