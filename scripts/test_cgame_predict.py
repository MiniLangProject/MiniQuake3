"""Unchanged-C interpolation/solid-list parity and native prediction contracts."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/cgame_predict';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_predict.c'
    (out/'cgame_predict_under_test.inc').write_text(extract(original,['CG_BuildSolidList','CG_InterpolatePlayerState']),encoding='utf-8',newline='\n')
    oracle=ROOT/'tests/reference/cgame_predict_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/wd4100',f'/I{out}',oracle,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    for source,name in [('tests/cgame_predict_oracle.ml','cgame_predict_oracle.exe'),('tests/cgame_predict_contracts.ml','cgame_predict_contracts.exe')]:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_predict_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
    contracts=run([ROOT/'build/cgame_predict_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts.startswith('PASS: '),contracts
    retail=None
    if args.data_root:
        retail=run([sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',args.data_root.resolve()],ROOT,log=out/'retail.log',timeout=300).strip().splitlines()[-1];assert retail.startswith('PASS: retail QVM match'),retail
    files=[original,oracle,ROOT/'src/mq3/client/cgame_predict.ml',ROOT/'tests/cgame_predict_oracle.ml',ROOT/'tests/cgame_predict_contracts.ml']
    result={'passed':True,'differential_records':6,'contracts':int(contracts.split()[1]),'retail':retail,'functions':['CG_BuildSolidList','CG_ClipMoveToEntities','CG_Trace','CG_PointContents','CG_InterpolatePlayerState','CG_TouchItem','CG_TouchTriggerPrediction','CG_PredictPlayerState'],'scope':'Complete read-only native cg_predict observer. It reuses shared Pmove, item, trajectory and jump-pad ports, delegates collision to the engine, and never duplicates authoritative retail-cgame effects.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 6 unchanged C prediction records + '+contracts+((' + '+retail) if retail else ''))
if __name__=='__main__':main()
