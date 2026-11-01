"""Direct differential test for Baseq3 snapshot visibility construction."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

FUNCS=['SV_QsortEntityNumbers','SV_AddEntToSnapshot','SV_AddEntitiesVisibleFromPoint','SV_BuildClientSnapshot']
def main():
 out=ROOT/'build/reference/snapshot_build';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'Quake-III-Arena-original-source/code/server/sv_snapshot.c'
 (out/'snapshot_build_under_test.inc').write_text(extract(source,FUNCS),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/snapshot_build_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_build_oracle.ml','--output','snapshot_build_oracle.exe'],cwd=ROOT,check=True)
 mini=run([ROOT/'build/snapshot_build_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'snapshot build mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_build_contracts.ml','--output','snapshot_build_contracts.exe'],cwd=ROOT,check=True)
 contracts=run([ROOT/'build/snapshot_build_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 27 snapshot-build contracts' not in contracts: raise RuntimeError(contracts)
 sources=[source,harness,ROOT/'src/mq3/server/snapshot_build.ml',ROOT/'tests/snapshot_build_oracle.ml',ROOT/'tests/snapshot_build_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':27,'scope':'Unchanged SV_QsortEntityNumbers, SV_AddEntToSnapshot, SV_AddEntitiesVisibleFromPoint and SV_BuildClientSnapshot behavior for linked/PVS/area visibility, client filters, broadcast, portal recursion, deduplication, maximum-size sorted entity numbers, viewpoint, area inversion and circular ring copies.','remaining':'Snapshot send scheduling and integration with live game/collision host state remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 snapshot-build records + 27 contracts')
if __name__=='__main__':main()
