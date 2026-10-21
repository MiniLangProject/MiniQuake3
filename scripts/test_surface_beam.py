"""Differential unchanged Baseq3 RT_BEAM surface and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
    out=ROOT/'build/reference/surface_beam';out.mkdir(parents=True,exist_ok=True)
    renderer=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c';math=ROOT/'Quake-III-Arena-original-source/code/game/q_math.c'
    (out/'surface_beam_under_test.inc').write_text(extract(renderer,['RB_SurfaceBeam']),encoding='utf-8',newline='\n')
    (out/'surface_beam_math_under_test.inc').write_text(extract(math,['MatrixMultiply','VectorNormalize','ProjectPointOnPlane','PerpendicularVector','RotatePointAroundVector']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_beam_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_beam_oracle.ml','--output','surface_beam_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_beam_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('surface beam mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_beam_contracts.ml','--output','surface_beam_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_beam_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 13 surface-beam contracts':raise RuntimeError(contracts)
    files=[renderer,math,harness,ROOT/'src/mq3/renderer/surface_beam.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'src/mq3/renderer/qvm_scene_materials.ml',ROOT/'tests/surface_beam_oracle.ml',ROOT/'tests/surface_beam_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':13,'functions':['RB_SurfaceBeam'],'scope':'Exact Baseq3 six-sided immediate-mode RT_BEAM prism, zero-length handling, productive QVM triangle expansion and built-in additive white material with original red vertex color.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-beam records + 13 contracts")
if __name__=='__main__':main()
