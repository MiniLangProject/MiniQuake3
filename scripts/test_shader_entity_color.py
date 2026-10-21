"""Differential unchanged Baseq3 entity shader color generators."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/shader_entity_color';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c'
    functions=['RB_CalcColorFromEntity','RB_CalcColorFromOneMinusEntity','RB_CalcAlphaFromEntity','RB_CalcAlphaFromOneMinusEntity']
    (out/'shader_entity_color_under_test.inc').write_text(extract(source,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/shader_entity_color_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_entity_color_oracle.ml','--output','shader_entity_color_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/shader_entity_color_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('shader entity color mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shader_entity_color_contracts.ml','--output','shader_entity_color_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/shader_entity_color_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 8 shader entity-color contracts':raise RuntimeError(contracts)
    files=[source,harness,ROOT/'src/mq3/renderer/playable_materials.ml',ROOT/'src/mq3/renderer/bsp_render_data.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'src/mq3/renderer/qvm_scene_batch.ml',ROOT/'src/mq3/renderer/playable_world_batch.ml',ROOT/'tests/shader_entity_color_oracle.ml',ROOT/'tests/shader_entity_color_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':8,'functions':functions,'scope':'Exact rgbGen entity/oneMinusEntity and alphaGen entity/oneMinusEntity semantics, preserving refEntity shaderRGBA separately from light-grid vertex color through the productive retained QVM render pass.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(native.splitlines())} exact Baseq3 entity-color records + 8 contracts")
if __name__=='__main__':main()
