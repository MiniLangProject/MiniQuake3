"""Complete bg_misc.c symbol facade plus focused and optional full regressions."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['BG_AddPredictableEventToPlayerstate','BG_CanItemBeGrabbed','BG_EvaluateTrajectory',
         'BG_EvaluateTrajectoryDelta','BG_FindItem','BG_FindItemForHoldable',
         'BG_FindItemForPowerup','BG_FindItemForWeapon','BG_PlayerStateToEntityState',
         'BG_PlayerStateToEntityStateExtraPolate','BG_PlayerTouchesItem','BG_TouchJumpPad']

def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/bg_misc_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/game/bg_misc.c'
    module=ROOT/'src/mq3/game/bg_misc_runtime.ml';text=module.read_text(encoding='utf-8')
    missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
    if missing:raise RuntimeError('missing MiniLang symbols: '+', '.join(missing))
    original_text=original.read_text(encoding='utf-8',errors='replace')
    missing_original=[name for name in SYMBOLS if not re.search(r'\b'+re.escape(name)+r'\s*\(',original_text)]
    if missing_original:raise RuntimeError('missing pinned original symbols: '+', '.join(missing_original))
    contracts=run([build_ml('tests/bg_misc_complete_contracts.ml','bg_misc_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 15 complete bg_misc contracts':raise RuntimeError(contracts)
    regressions=[]
    if args.full_regression:
        if not args.data_root:raise RuntimeError('--full-regression requires --data-root')
        commands=[
            [sys.executable,ROOT/'scripts/test_shared_game.py'],
            [sys.executable,ROOT/'scripts/test_entitystate.py'],
            [sys.executable,ROOT/'scripts/test_items.py'],
            [sys.executable,ROOT/'scripts/test_g_items_complete.py','--data-root',args.data_root],
            [sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',args.data_root],
        ]
        for index,command in enumerate(commands):
            value=run(command,ROOT,log=out/f'regression-{index}.log',timeout=1800).strip().splitlines()[-1]
            if 'PASS:' not in value:raise RuntimeError(value)
            regressions.append(value)
    sources=[original,module,ROOT/'tests/bg_misc_complete_contracts.ml']
    result={'passed':True,'symbols':len(SYMBOLS),'contracts':15,'regressions':regressions,
            'existingExactCGates':['test_shared_game.py','test_entitystate.py','test_items.py'],
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(SYMBOLS)}/{len(SYMBOLS)} bg_misc symbols + 15 native contracts'+(f' + {len(regressions)} regressions' if regressions else ''))

if __name__=='__main__':main()
