#!/usr/bin/env python3
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/playable_dynamic_lights';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_light.c'
    functions=['R_TransformDlights','R_DlightBmodel']
    (out/'playable_dynamic_lights_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/playable_dynamic_lights_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_dynamic_lights_oracle.ml','--output','playable_dynamic_lights_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/playable_dynamic_lights_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('dynamic-light bmodel mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_dynamic_lights_contracts.ml','--output','playable_dynamic_lights_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_dynamic_lights_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 13 playable dynamic-light contracts': raise RuntimeError(value)
    files=[original,harness,ROOT/'src/mq3/renderer/playable_dynamic_lights.ml',ROOT/'tests/playable_dynamic_lights_oracle.ml',ROOT/'tests/playable_dynamic_lights_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':13,'functions':functions,'scope':'Exact Baseq3 R_TransformDlights coordinates and R_DlightBmodel radius-expanded local bounds mask, plus retained projected-light rendering contracts.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 dynamic-light records + 13 contracts")
if __name__=='__main__': main()
