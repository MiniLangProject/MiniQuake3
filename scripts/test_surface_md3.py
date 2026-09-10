"""Differential unchanged Baseq3 MD3 mesh surface oracle and MiniLang contracts."""
import json
import subprocess
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from transition_oracle import extract
from toolchain import msvc_env,run
from inventory import sha

def main():
    out=ROOT/'build/reference/surface_md3';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c'
    extracted=extract(original,['VectorArrayNormalize','LerpMeshVertexes','RB_SurfaceMesh'])
    (out/'surface_md3_under_test.inc').write_text(extracted,encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_md3_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_md3_oracle.ml','--output','surface_md3_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_md3_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('surface MD3 mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_md3_contracts.ml','--output','surface_md3_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_md3_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 31 surface-md3 contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/surface_md3.ml',ROOT/'tests/surface_md3_oracle.ml',ROOT/'tests/surface_md3_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':31,'functions':['VectorArrayNormalize','LerpMeshVertexes','RB_SurfaceMesh'],'scope':'MD3 frame selection, backlerped positions, lat-long normal decoding and fast normalization, triangle rebasing, texture coordinates, overflow flush behavior, and the absence of mesh-local dynamic-light mutation.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-md3 records + 31 contracts")
if __name__=='__main__': main()
