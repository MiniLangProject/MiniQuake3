"""Differential tests for Baseq3 CPU image registration and upload planning."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/image_registry';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_image.c'
    functions=['generateHashValue','R_CreateImage','R_FindImageFile']
    (out/'image_registry_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/image_registry_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/image_registry_oracle.ml','--output','image_registry_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/image_registry_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Image registry mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/image_registry_contracts.ml','--output','image_registry_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/image_registry_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 29 image-registry contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/image_registry.ml',ROOT/'tests/image_registry_oracle.ml',ROOT/'tests/image_registry_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':29,'functions':functions,'scope':'Baseq3 filename hashing, image creation/cache semantics, loader boundary, power-of-two/picmip sizing, format selection and CPU mip upload plans.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 image-registry records + 29 contracts")
if __name__=='__main__': main()
