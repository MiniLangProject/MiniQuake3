"""Complete g_mover.c facade, Team Arena branches and productive regressions."""
import argparse,json,py_compile,re,struct,subprocess,sys
from pathlib import Path
from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT,msvc_env,run

SYMBOLS=['G_TestEntityPosition','G_CreateRotationMatrix','G_TransposeMatrix','G_RotatePoint',
         'G_TryPushingEntity','G_CheckProxMinePosition','G_TryPushingProxMine','G_MoverPush',
         'G_MoverTeam','G_RunMover','SetMoverState','MatchTeam','ReturnToPos1','Reached_BinaryMover',
         'Use_BinaryMover','InitMover','Blocked_Door','Touch_DoorTriggerSpectator','Touch_DoorTrigger',
         'Think_SpawnNewDoorTrigger','Think_MatchTeam','SP_func_door','Touch_Plat',
         'Touch_PlatCenterTrigger','SpawnPlatTrigger','SP_func_plat','Touch_Button','SP_func_button',
         'Think_BeginMoving','Reached_Train','Think_SetupTrainTargets','SP_path_corner','SP_func_train',
         'SP_func_static','SP_func_rotating','SP_func_bobbing','SP_func_pendulum']

def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/g_mover_complete';out.mkdir(parents=True,exist_ok=True)
    facade=ROOT/'src/mq3/game/g_mover.ml';text=facade.read_text(encoding='utf-8')
    missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
    if missing:raise RuntimeError('missing g_mover symbols: '+', '.join(missing))
    frame=(ROOT/'src/mq3/game/frame.ml').read_text(encoding='utf-8')
    spawn=(ROOT/'src/mq3/game/spawn_functions.ml').read_text(encoding='utf-8')
    if 'gMover.G_RunMover(level,ent)' not in frame or 'gMover.dispatch(level,ent)' not in spawn or 'gMover.SP_path_corner(level,ent)' not in spawn:
        raise RuntimeError('productive frame/spawn path bypasses g_mover facade')

    code=ROOT/'Quake-III-Arena-original-source/code';harness=ROOT/'tests/reference/g_mover_complete_oracle.c';oracle=out/'g_mover_complete_oracle.exe'
    sources=[harness,code/'game/q_math.c',code/'game/q_shared.c',code/'game/bg_misc.c']
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/DWIN32','/DNDEBUG',f'/I{code / "game"}',*sources,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    empty=bytearray(tiny_bsp());material_off=struct.unpack_from('<i',empty,16)[0];struct.pack_into('<i',empty,material_off+68,0)
    empty_path=out/'empty.bsp';solid_path=out/'solid.bsp';empty_path.write_bytes(empty);solid_path.write_bytes(tiny_bsp())
    mini=build_ml('tests/g_mover_complete_oracle.ml','g_mover_complete_oracle.exe')
    records=[]
    for case_id,bsp in ((1,empty_path),(2,solid_path)):
        expected=out/f'case-{case_id}.expected';run([oracle,str(case_id),expected],out,log=out/f'oracle-{case_id}.log')
        line=run([mini,bsp,str(case_id),expected],ROOT/'build',log=out/f'minilang-{case_id}.log').strip()
        if line!='PASS: 13 g_mover Missionpack words':raise RuntimeError(line)
        records.append({'case':case_id,'bsp':bsp.name,'expected_sha256':sha(expected)})
    contracts=build_ml('tests/g_mover_complete_contracts.ml','g_mover_complete_contracts.exe')
    line=run([contracts,empty_path],ROOT/'build',log=out/'contracts.log').strip()
    if line!='PASS: 6 complete g_mover contracts':raise RuntimeError(line)
    regressions=[]
    commands=[[sys.executable,ROOT/'scripts/test_mover_push.py']]
    if args.full_regression:
        if args.data_root is None:raise RuntimeError('--full-regression requires --data-root')
        commands.append([sys.executable,ROOT/'scripts/test_retail_movers.py',args.data_root])
    for index,command in enumerate(commands):
        value=run(command,ROOT,log=out/f'regression-{index}.log',timeout=1800).strip().splitlines()[-1]
        if 'PASS:' not in value:raise RuntimeError(value)
        regressions.append(value)
    paths=[ROOT/'Quake-III-Arena-original-source/code/game/g_mover.c',facade,ROOT/'src/mq3/game/movers.ml',harness,ROOT/'tests/g_mover_complete_oracle.ml',ROOT/'tests/g_mover_complete_contracts.ml']
    result={'passed':True,'symbols':len(SYMBOLS),'unchangedCMissionpackRecords':2,'contracts':6,'regressions':regressions,'records':records,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in paths}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(SYMBOLS)} g_mover symbols + 2 unchanged-C Missionpack records + 6 contracts + {len(regressions)} regressions')
if __name__=='__main__':main()
