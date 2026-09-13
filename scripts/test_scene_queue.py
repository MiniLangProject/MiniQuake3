"""Verify Baseq3 renderer scene submission and capacity contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
def main():
    out=ROOT/'build/reference/scene_queue';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code'
    harness=ROOT/'tests/reference/scene_queue_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original / "game"}',f'/I{original / "cgame"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log');subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/scene_queue_oracle.ml','--output','scene_queue_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/scene_queue_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('scene ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/scene_queue_contracts.ml','--output','scene_queue_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/scene_queue_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 33 scene queue contracts':raise RuntimeError(value)
    source=original/'renderer/tr_scene.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in ['RE_ClearScene','RE_AddPolyToScene','RE_AddRefEntityToScene','RE_AddDynamicLightToScene']:
      if name not in text:raise RuntimeError('missing original function '+name)
    files=[source,harness,ROOT/'src/mq3/renderer/scene_queue.ml',ROOT/'tests/scene_queue_contracts.ml'];report={'passed':True,'records':6,'contracts':33,'scope':'Scene marks, polygons/fog, reference entities, fixed 140-byte refEntity decoding, and dynamic/additive lights.','oracle':'Original q_shared.h and tr_types.h limits plus required unchanged tr_scene.c functions.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 6 exact Baseq3 scene constants + 33 scene queue contracts')
if __name__=='__main__':main()
