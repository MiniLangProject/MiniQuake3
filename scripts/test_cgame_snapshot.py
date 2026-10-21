"""Unchanged-C entity transitions, native snapshot state, and retail-QVM regression."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 p=argparse.ArgumentParser();p.add_argument('--data-root',type=Path);p.add_argument('--qvms',type=Path,default=ROOT/'build/reference/qvms');a=p.parse_args();out=ROOT/'build/reference/cgame_snapshot';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_snapshot.c'
 (out/'cgame_snapshot_under_test.inc').write_text(extract(src,['CG_ResetEntity','CG_TransitionEntity']),encoding='utf-8',newline='\n');h=ROOT/'tests/reference/cgame_snapshot_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 for source,name in [('tests/cgame_snapshot_oracle.ml','cgame_snapshot_oracle.exe'),('tests/cgame_snapshot_contracts.ml','cgame_snapshot_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/cgame_snapshot_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini);contracts=run([ROOT/'build/cgame_snapshot_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts.startswith('PASS: '),contracts
 retail=None
 if a.data_root:
  retail=run([sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',a.data_root.resolve()],ROOT,log=out/'retail.log',timeout=300).strip().splitlines()[-1];assert retail.startswith('PASS: retail QVM match')
 files=[src,h,ROOT/'src/mq3/client/cgame_snapshot.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',ROOT/'tests/cgame_snapshot_oracle.ml',ROOT/'tests/cgame_snapshot_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'differential_records':4,'contracts':int(contracts.split()[1]),'retail':retail,'functions':['CG_ResetEntity','CG_TransitionEntity','CG_SetInitialSnapshot','CG_TransitionSnapshot','CG_SetNextSnap','CG_ReadNextSnapshot','CG_ProcessSnapshots'],'scope':'Complete native snapshot transition observer at the productive engine/QVM snapshot boundary. It mirrors interpolation, teleport/restart, drop accounting and transition ordering without firing game events twice.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
 print('PASS: 4 unchanged C snapshot records + '+contracts+((' + '+retail) if retail else ''))
if __name__=='__main__':main()
