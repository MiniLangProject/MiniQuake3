"""Differential tests for Baseq3's pre-fog stage color modulation."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_fog_color';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c'
    functions=['RB_CalcModulateColorsByFog','RB_CalcModulateAlphasByFog','RB_CalcModulateRGBAsByFog']
    (out/'shader_fog_color_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_fog_color_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_fog_color_oracle.ml','--output','shader_fog_color_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_fog_color_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('fog color mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_fog_color_contracts.ml','--output','shader_fog_color_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/shader_fog_color_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 11 shader fog-color contracts': raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_fog_stage_contracts.ml','--output','playable_fog_stage_contracts.exe'],cwd=ROOT,check=True)
    integration=run([ROOT/'build/playable_fog_stage_contracts.exe'],ROOT/'build',log=out/'integration.log').strip()
    if integration!='PASS: 7 playable fog-stage contracts': raise RuntimeError(integration)
    files=[original,harness,ROOT/'src/mq3/renderer/playable_materials.ml',ROOT/'src/mq3/renderer/playable_world_batch.ml',ROOT/'tests/shader_fog_color_oracle.ml',ROOT/'tests/shader_fog_color_contracts.ml',ROOT/'tests/playable_fog_stage_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':18,'functions':functions,'scope':'Unchanged Baseq3 pre-fog RGB, alpha and RGBA modulation plus productive fog-density integration and complete supported blended-stage classification.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 fog-color records + 18 contracts")
if __name__=='__main__': main()
