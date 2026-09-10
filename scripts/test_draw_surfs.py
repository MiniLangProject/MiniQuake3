"""Differential Baseq3 draw-surface key/order oracle and MiniLang contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/draw_surfs';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_main.c'
    functions=['shortsort','qsortFast','R_AddDrawSurf','R_DecomposeSort']
    (out/'draw_surfs_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/draw_surfs_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/draw_surfs_oracle.ml','--output','draw_surfs_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/draw_surfs_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('draw-surface mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/draw_surfs_contracts.ml','--output','draw_surfs_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/draw_surfs_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 34 draw-surface contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/draw_surfs.ml',ROOT/'tests/draw_surfs_oracle.ml',ROOT/'tests/draw_surfs_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':34,'functions':functions,'scope':'Exact Baseq3 draw-surface bit packing/decomposition and unique-key ordering, plus bounded masked ring admission and deterministic stable tie ordering.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 draw-surface records + 34 contracts")
if __name__=='__main__': main()
