"""Complete bg_slidemove.c facade backed by exact existing C movement parity."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['PM_SlideMove','PM_StepSlideMove']

def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/bg_slidemove_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/game/bg_slidemove.c';module=ROOT/'src/mq3/game/bg_slidemove_runtime.ml'
    original_text=original.read_text(encoding='utf-8',errors='replace');module_text=module.read_text(encoding='utf-8')
    for name in SYMBOLS:
        if not re.search(r'\b'+name+r'\s*\(',original_text):raise RuntimeError('missing original '+name)
        if not re.search(r'function\s+'+name+r'\s*\(',module_text):raise RuntimeError('missing MiniLang '+name)
    contracts=run([build_ml('tests/bg_slidemove_complete_contracts.ml','bg_slidemove_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 5 complete bg_slidemove contracts':raise RuntimeError(contracts)
    regressions=[]
    if args.full_regression:
        if not args.data_root:raise RuntimeError('--full-regression requires --data-root')
        value=run([sys.executable,ROOT/'scripts/test_movement.py',args.data_root,'--count','512'],ROOT,log=out/'movement.log',timeout=1800).strip().splitlines()[-1]
        if 'PASS:' not in value:raise RuntimeError(value)
        regressions.append(value)
    sources=[original,module,ROOT/'src/mq3/game/movement.ml',ROOT/'tests/bg_slidemove_complete_contracts.ml']
    result={'passed':True,'symbols':2,'contracts':5,'regressions':regressions,
            'existingExactCGate':'test_movement.py',
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 2/2 bg_slidemove symbols + 5 native contracts'+(f' + {len(regressions)} exact-C movement regressions' if regressions else ''))

if __name__=='__main__':main()
