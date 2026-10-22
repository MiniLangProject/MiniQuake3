"""Complete bg_pmove.c symbol facade, Missionpack differential and native contracts."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['PM_Accelerate','PM_AddEvent','PM_AddTouchEnt','PM_AirMove','PM_Animate','PM_BeginWeaponChange','PM_CheckDuck','PM_CheckJump','PM_CheckStuck','PM_CheckWaterJump','PM_ClipVelocity','PM_ContinueLegsAnim','PM_ContinueTorsoAnim','PM_CorrectAllSolid','PM_CrashLand','PM_DeadMove','PM_DropTimers','PM_FinishWeaponChange','PM_FlyMove','PM_FootstepForSurface','PM_Footsteps','PM_ForceLegsAnim','PM_Friction','PM_GrappleMove','PM_GroundTrace','PM_GroundTraceMissed','PM_InvulnerabilityMove','PM_NoclipMove','PM_SetMovementDir','PM_SetWaterLevel','PM_StartLegsAnim','PM_StartTorsoAnim','PM_TorsoAnimation','PM_UpdateViewAngles','PM_WalkMove','PM_WaterEvents','PM_WaterJumpMove','PM_WaterMove','PM_Weapon','Pmove','PmoveSingle','sqrt']

def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/bg_pmove_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/game/bg_pmove.c'
    module=ROOT/'src/mq3/game/bg_pmove_runtime.ml';text=module.read_text(encoding='utf-8')
    missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
    if missing:raise RuntimeError('missing MiniLang symbols: '+', '.join(missing))
    include=out/'bg_pmove_complete_under_test.inc'
    include.write_text(extract(original,['PM_InvulnerabilityMove']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/bg_pmove_complete_oracle.c';oracle=out/'bg_pmove_complete_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    mini=run([build_ml('tests/bg_pmove_complete_oracle.ml','bg_pmove_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('invulnerability differential mismatch\nC: '+repr(native)+'\nMiniLang: '+repr(mini))
    contracts=run([build_ml('tests/bg_pmove_complete_contracts.ml','bg_pmove_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 11 complete bg_pmove contracts':raise RuntimeError(contracts)
    regressions=[]
    if args.full_regression:
        if not args.data_root:raise RuntimeError('--full-regression requires --data-root')
        commands=[
            [sys.executable,ROOT/'scripts/test_pmove.py',args.data_root,'--map','q3dm1','--count','256'],
            [sys.executable,ROOT/'scripts/test_runtime_pmove.py',args.data_root],
            [sys.executable,ROOT/'scripts/test_cgame_predict.py','--data-root',args.data_root],
            [sys.executable,ROOT/'scripts/test_client_think.py'],
            [sys.executable,ROOT/'scripts/test_server_user_move.py'],
        ]
        for index,command in enumerate(commands):
            value=run(command,ROOT,log=out/f'regression-{index}.log',timeout=900).strip().splitlines()[-1]
            if 'PASS:' not in value:raise RuntimeError(value)
            regressions.append(value)
    sources=[original,module,ROOT/'src/mq3/game/pmove.ml',harness,ROOT/'tests/bg_pmove_complete_oracle.ml',ROOT/'tests/bg_pmove_complete_contracts.ml']
    result={'passed':True,'symbols':len(SYMBOLS),'unchangedCRecords':1,'contracts':11,'regressions':regressions,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(SYMBOLS)} bg_pmove symbols + 1 unchanged-C Missionpack record + 11 contracts'+(f' + {len(regressions)} regressions' if regressions else ''))
if __name__=='__main__':main()
