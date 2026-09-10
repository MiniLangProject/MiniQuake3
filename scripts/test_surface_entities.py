"""Differential unchanged Baseq3 sprite surface oracle and MiniLang contracts."""
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
    out=ROOT/'build/reference/surface_entities';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c'
    names=['RB_AddQuadStampExt','RB_AddQuadStamp','RB_SurfaceSprite']
    (out/'surface_entities_under_test.inc').write_text(extract(original,names),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_entities_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_entities_oracle.ml','--output','surface_entities_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_entities_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('surface entity mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_entities_contracts.ml','--output','surface_entities_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_entities_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 31 surface-entity contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/surface_entities.ml',ROOT/'tests/surface_entities_oracle.ml',ROOT/'tests/surface_entities_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':31,'functions':names,'scope':'CPU-side sprite basis rotation and mirroring, quad positions, normals, two texture-coordinate sets, RGBA copying, index rebasing, and exact RB_CheckOverflow sentinel behavior.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-entity records + 31 contracts")
if __name__=='__main__':main()
