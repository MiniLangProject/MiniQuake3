"""Differential unchanged Baseq3 curved-grid surface oracle and MiniLang contracts."""
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
    out=ROOT/'build/reference/surface_grid';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c'
    extracted=extract(original,['RB_SurfaceGrid'])
    (out/'surface_grid_under_test.inc').write_text(extracted,encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_grid_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_grid_oracle.ml','--output','surface_grid_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_grid_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('surface grid mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_grid_contracts.ml','--output','surface_grid_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_grid_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 30 surface-grid contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/surface_grid.ml',ROOT/'tests/surface_grid_oracle.ml',ROOT/'tests/surface_grid_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':30,'functions':['RB_SurfaceGrid'],'scope':'Curved-grid LOD row and column selection, conservative strip batching with repeated boundary rows, triangle winding, texture/lightmap coordinates, colors, normals, dynamic-light masks, and capacity boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-grid records + 30 contracts")
if __name__=='__main__': main()
