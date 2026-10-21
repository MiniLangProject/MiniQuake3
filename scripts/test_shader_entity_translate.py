"""Differential and productive tests for Baseq3 per-entity shader time."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_entity_translate';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c'
    (out/'shader_entity_translate_under_test.inc').write_text(extract(original,['RB_CalcScrollTexCoords']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_entity_translate_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_entity_translate_oracle.ml','--output','shader_entity_translate_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_entity_translate_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('entity translate mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    shade=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade.c'
    (out/'shader_entity_time_under_test.inc').write_text(extract(shade,['R_BindAnimatedImage','RB_BeginSurface']),encoding='utf-8',newline='\n')
    time_harness=ROOT/'tests/reference/shader_entity_time_oracle.c';time_oracle=out/'time-oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict',f'/I{out}',time_harness,f'/Fe:{time_oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'time-oracle-build.log')
    native_time=run([time_oracle],out,log=out/'time-oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_entity_time_oracle.ml','--output','shader_entity_time_oracle.exe'],cwd=ROOT,check=True)
    mini_time=run([ROOT/'build/shader_entity_time_oracle.exe'],ROOT/'build',log=out/'time-minilang.log')
    if native_time!=mini_time: raise RuntimeError('entity shader-time mismatch\nC:\n'+native_time+'MiniLang:\n'+mini_time)
    native=native+native_time
    subprocess.run([sys.executable,ROOT/'scripts/test_playable_materials.py'],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/test_qvm_scene_geometry.py'],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/test_qvm_scene_batch.py'],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/test_playable_world_batch.py'],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/test_cgame_renderer_extended.py'],cwd=ROOT,check=True)
    files=[original,shade,harness,time_harness,ROOT/'src/mq3/renderer/playable_materials.ml',ROOT/'src/mq3/renderer/shader_remap.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'src/mq3/renderer/qvm_scene_materials.ml',ROOT/'src/mq3/renderer/qvm_scene_batch.ml',ROOT/'src/mq3/renderer/playable_world_batch.ml',ROOT/'tests/shader_entity_translate_oracle.ml',ROOT/'tests/shader_entity_time_oracle.ml',ROOT/'tests/playable_materials_contracts.ml',ROOT/'tests/qvm_scene_geometry_contracts.ml',ROOT/'tests/qvm_scene_materials_contracts.ml',ROOT/'tests/qvm_scene_batch_contracts.ml',ROOT/'tests/playable_world_batch_contracts.ml',ROOT/'tests/cgame_renderer_extended_contracts.ml',ROOT/'scripts/test_cgame_renderer_extended.py']
    result={'passed':True,'records':len(native.splitlines()),'contracts':104,'function':'RB_CalcScrollTexCoords + R_BindAnimatedImage + RB_BeginSurface','scope':'Exact wrapped entity texture scrolling, animated-image selection, remap time offsets and shader clamp times plus productive refEntity shaderTexCoord/shaderTime propagation through QVM geometry and retained image, UV, color-wave, normal and deformation evaluation.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 entity-time records + {result['contracts']} contracts")
if __name__=='__main__': main()
