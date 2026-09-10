"""Differential Baseq3 renderer shader-text index test."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_index';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shader.c'
    (out/'shader_index_under_test.inc').write_text(extract(original,['generateHashValue','FindShaderInShaderText']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_index_oracle.c';oracle=out/'oracle.exe'
    qshared=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.c'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,qshared,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_index_oracle.ml','--output','shader_index_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_index_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('shader index mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_index_contracts.ml','--output','shader_index_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/shader_index_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 10 shader-index contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/shader_index.ml',ROOT/'tests/shader_index_oracle.ml',ROOT/'tests/shader_index_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':10,'functions':['generateHashValue','FindShaderInShaderText'],'scope':'Renderer shader-script hash normalization, bucket lookup, duplicate precedence and nested braced-definition indexing.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 shader-index records + 10 contracts")
if __name__=='__main__': main()
