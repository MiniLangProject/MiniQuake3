"""Differential Baseq3 MD3 tag interpolation/model-bounds gate."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/model_tags';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_model.c'
    (out/'model_tags_under_test.inc').write_text(extract(original,['R_GetTag','R_LerpTag','R_ModelBounds']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/model_tags_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/model_tags_oracle.ml','--output','model_tags_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/model_tags_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('model tag mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/model_tags_contracts.ml','--output','model_tags_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/model_tags_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 26 model-tag contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/model_tags.ml',ROOT/'tests/model_tags_oracle.ml',ROOT/'tests/model_tags_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':26,'functions':['R_GetTag','R_LerpTag','R_ModelBounds'],'scope':'MD3 tag lookup/frame clamping, binary32 origin/axis interpolation, per-axis normalization, missing-model identity and brush/MD3 bounds.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 model-tag records + 26 contracts")
if __name__=='__main__': main()
