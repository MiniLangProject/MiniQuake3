"""Differential Baseq3 rail-core/ring geometry and lightning contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
    out=ROOT/'build/reference/surface_trails';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_surface.c';names=['DoRailCore','DoRailDiscs']
    (out/'surface_trails_under_test.inc').write_text(extract(original,names),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/surface_trails_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_trails_oracle.ml','--output','surface_trails_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/surface_trails_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('surface trail mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/surface_trails_contracts.ml','--output','surface_trails_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/surface_trails_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 26 surface-trail contracts':raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/surface_trails.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'tests/surface_trails_oracle.ml',ROOT/'tests/surface_trails_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':26,'functions':names,'scope':'Exact Baseq3 rail-core and rail-disc vertices, UVs, RGB falloff and topology plus productive QVM RT_RAIL_CORE, RT_RAIL_RINGS and four-plane RT_LIGHTNING expansion.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 surface-trail records + 26 contracts")
if __name__=='__main__':main()
