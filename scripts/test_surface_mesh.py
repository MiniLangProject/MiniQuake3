"""Differential unchanged Baseq3 static triangle/face surface oracle."""
import json,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
from transition_oracle import extract
from toolchain import msvc_env,run
from inventory import sha
def main():
 out=ROOT/'build/reference/surface_mesh';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c'
 (out/'surface_mesh_under_test.inc').write_text(extract(original,['RB_SurfaceTriangles','RB_SurfaceFace']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/surface_mesh_oracle.c';oracle=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log');subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_mesh_oracle.ml','--output','surface_mesh_oracle.exe'],cwd=ROOT,check=True);mini=run([ROOT/'build/surface_mesh_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('surface mesh mismatch\nC:\n'+native+'MiniLang:\n'+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_mesh_contracts.ml','--output','surface_mesh_contracts.exe'],cwd=ROOT,check=True);contracts=run([ROOT/'build/surface_mesh_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 30 surface-mesh contracts':raise RuntimeError(contracts)
 files=[original,harness,ROOT/'src/mq3/renderer/surface_mesh.ml',ROOT/'tests/surface_mesh_oracle.ml',ROOT/'tests/surface_mesh_contracts.ml'];result={'passed':True,'records':len(native.splitlines()),'contracts':30,'functions':['RB_SurfaceTriangles','RB_SurfaceFace'],'scope':'Static triangle and planar-face attributes, index rebasing, normals, both texture channels, packed colors, SMP dynamic lights, and overflow ordering.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact Baseq3 surface-mesh records + 30 contracts")
if __name__=='__main__':main()
