"""Differential tests for the Baseq3 texture-unit and bind-state cache."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/texture_state';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_backend.c'
    functions=['GL_Bind','GL_SelectTexture','GL_BindMultitexture']
    (out/'texture_state_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/texture_state_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/texture_state_oracle.ml','--output','texture_state_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/texture_state_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Texture-state mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/texture_state_contracts.ml','--output','texture_state_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/texture_state_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 30 texture-state contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/texture_state.ml',ROOT/'tests/texture_state_oracle.ml',ROOT/'tests/texture_state_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':30,'functions':functions,'scope':'Baseq3 two-TMU selection, bind caching, frame-use accounting, NULL fallback, r_nobind redirect and multitexture callback ordering.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 texture-state records + 30 contracts")
if __name__=='__main__': main()
