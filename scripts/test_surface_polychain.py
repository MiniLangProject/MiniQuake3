"""Differential unchanged Baseq3 RB_SurfacePolychain oracle and MiniLang contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/surface_polychain';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c'
    (out/'surface_polychain_under_test.inc').write_text(extract(original,['RB_SurfacePolychain']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_polychain_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_polychain_oracle.ml','--output','surface_polychain_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_polychain_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('surface polychain mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_polychain_contracts.ml','--output','surface_polychain_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_polychain_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 21 surface-polychain contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/surface_polychain.ml',ROOT/'tests/surface_polychain_oracle.ml',ROOT/'tests/surface_polychain_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':21,'functions':['RB_SurfacePolychain'],'scope':'CPU polygon copy, packed vertex color, triangle-fan indexing, append offsets and Baseq3 strict tessellation overflow boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-polychain records + 21 contracts")
if __name__=='__main__': main()
