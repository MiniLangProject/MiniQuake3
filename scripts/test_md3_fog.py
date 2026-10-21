#!/usr/bin/env python3
"""Differential Baseq3 MD3 fog-volume selection and productive integration."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/md3_fog';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_mesh.c'
    (out/'md3_fog_under_test.inc').write_text(extract(original,['R_ComputeFogNum']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/md3_fog_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md3_fog_oracle.ml','--output','md3_fog_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/md3_fog_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('MD3 fog mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    retail='not run'
    if args.pak:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md3_fog_retail_probe.ml','--output','md3_fog_retail_probe.exe'],cwd=ROOT,check=True)
        retail=run([ROOT/'build/md3_fog_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=out/'retail.log').strip()
        if not retail.startswith('PASS: retail MD3 fog'):raise RuntimeError(retail)
    files=[original,harness,ROOT/'src/mq3/renderer/md3_entity.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'src/mq3/client/qvm_preview_app.ml',ROOT/'tests/md3_fog_oracle.ml',ROOT/'tests/md3_fog_retail_probe.ml']
    result={'passed':True,'records':len(native.splitlines()),'function':'R_ComputeFogNum','retail':retail,'scope':'Selected-frame sphere against BSP fog AABBs, RDF_NOWORLDMODEL, first-fog ordering, touch exclusion, productive MD3 fogIndex and shadow suppression.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 MD3 fog records")
    if args.pak:print(retail)
if __name__=='__main__':main()
