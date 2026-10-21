"""Differential Baseq3 portal orientation/reflected-view gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
    out=ROOT/'build/reference/portal_view';out.mkdir(parents=True,exist_ok=True)
    renderer=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_main.c';math=ROOT/'Quake-III-Arena-original-source/code/game/q_math.c'
    (out/'portal_view_under_test.inc').write_text(extract(renderer,['R_MirrorPoint','R_MirrorVector','R_GetPortalOrientations']),encoding='utf-8',newline='\n')
    (out/'portal_math_under_test.inc').write_text(extract(math,['MatrixMultiply','VectorNormalize','ProjectPointOnPlane','PerpendicularVector','RotatePointAroundVector']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/portal_view_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/portal_view_oracle.ml','--output','portal_view_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/portal_view_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('portal view mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/portal_view_contracts.ml','--output','portal_view_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/portal_view_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 17 portal-view contracts':raise RuntimeError(contracts)
    files=[renderer,math,harness,ROOT/'src/mq3/renderer/portal_view.ml',ROOT/'src/mq3/renderer/entity_surface_policy.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'tests/portal_view_oracle.ml',ROOT/'tests/portal_view_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':17,'functions':['R_MirrorPoint','R_MirrorVector','R_GetPortalOrientations'],'scope':'Portal marker plane matching, mirror and remote-camera orientations, PVS origin, optional camera rotation, reflected view axes/clip plane, plus productive marker retention and main/portal entity filtering.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 portal-view records + 17 contracts")
if __name__=='__main__':main()
