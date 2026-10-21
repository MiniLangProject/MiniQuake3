"""Differential Baseq3 view-transform/culling oracle and MiniLang contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/renderer_view_math';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_main.c'
    functions=['R_LocalNormalToWorld','R_LocalPointToWorld','R_WorldToLocal','R_TransformModelToClip','R_TransformClipToWindow','R_CullPointAndRadius','R_CullLocalPointAndRadius','R_CullLocalBox','R_SetupFrustum']
    (out/'renderer_view_math_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/renderer_view_math_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/renderer_view_math_oracle.ml','--output','renderer_view_math_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/renderer_view_math_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Renderer view-math mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/renderer_view_math_contracts.ml','--output','renderer_view_math_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/renderer_view_math_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 39 renderer-view-math contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/view_math.ml',ROOT/'tests/renderer_view_math_oracle.ml',ROOT/'tests/renderer_view_math_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':39,'functions':functions,'scope':'Exact Baseq3 local/world transforms, model/projection and clip/window conversion, plus point/radius and local-box four-plane frustum culling and productive R_SetupFrustum planes.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 renderer-view-math records + 39 contracts")
if __name__=='__main__': main()
