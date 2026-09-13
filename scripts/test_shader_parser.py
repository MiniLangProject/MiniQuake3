"""Differential Baseq3 shader-directive parser primitives and MiniLang contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_parser';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shader.c'
    functions=['NameToAFunc','NameToSrcBlendMode','NameToDstBlendMode','NameToGenFunc']
    (out/'shader_parser_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_parser_oracle.c';oracle=out/'oracle.exe'
    qshared=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.c'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,qshared,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_parser_oracle.ml','--output','shader_parser_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_parser_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('shader parser primitive mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_parser_contracts.ml','--output','shader_parser_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/shader_parser_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 36 shader-parser contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/shader_parser.ml',ROOT/'tests/shader_parser_oracle.ml',ROOT/'tests/shader_parser_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':36,'functions':functions,'scope':'Renderer shader/stage parsing: maps, blends, color/alpha/tc generation, tcMods, wave/move/bulge vertex deformations, depth state, cull, sort and surface parameters.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 shader-parser records + 36 contracts")
if __name__=='__main__': main()
