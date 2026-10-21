"""Differential tests for Baseq3 ComputeColors rgbGen/alphaGen ordering."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_compute_colors';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade.c'
    shade_calc=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c'
    (out/'shader_compute_colors_under_test.inc').write_text(extract(original,['ComputeColors']),encoding='utf-8',newline='\n')
    (out/'shader_specular_alpha_under_test.inc').write_text(extract(shade_calc,['RB_CalcSpecularAlpha']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_compute_colors_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_compute_colors_oracle.ml','--output','shader_compute_colors_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_compute_colors_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('ComputeColors mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_compute_colors_contracts.ml','--output','shader_compute_colors_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/shader_compute_colors_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 14 shader ComputeColors contracts': raise RuntimeError(contracts)
    files=[original,shade_calc,harness,ROOT/'src/mq3/renderer/playable_materials.ml',ROOT/'src/mq3/renderer/playable_world_batch.ml',ROOT/'tests/shader_compute_colors_oracle.ml',ROOT/'tests/shader_compute_colors_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':14,'functions':['ComputeColors','RB_CalcSpecularAlpha'],'scope':'Unchanged Baseq3 rgbGen then alphaGen ordering plus the real lightingSpecular reflection, fast-normalization, fourth-power falloff and byte clamp.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 ComputeColors/specular records + 14 contracts")
if __name__=='__main__': main()
