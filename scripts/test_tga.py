"""Differential Baseq3 TGA decoder test against unchanged renderer code."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/tga';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_image.c'
    (out/'tga_under_test.inc').write_text(extract(original,['LoadTGA']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/tga_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/tga_oracle.ml','--output','tga_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/tga_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('TGA mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/tga_contracts.ml','--output','tga_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/tga_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 22 TGA contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/tga.ml',ROOT/'tests/tga_oracle.ml',ROOT/'tests/tga_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':22,'functions':['LoadTGA'],'scope':'Baseq3 TGA types 2/3/10, BGR(A)-to-RGBA conversion, bottom-up row order, ID skip, RLE packets crossing rows, ignored top-down declaration, and checked malformed input.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 TGA records + 22 contracts")
if __name__=='__main__': main()
