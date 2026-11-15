#!/usr/bin/env python3
import argparse,json,shutil,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run,msvc_env

def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/playable_sky';out.mkdir(parents=True,exist_ok=True)
    env=msvc_env('x64');compiler=shutil.which('cl.exe',path=env.get('PATH'))
    if not compiler: raise RuntimeError('MSVC cl.exe is required for native sky blend verification')
    run([compiler,'/nologo','/O2','/W4','/WX',ROOT/'tests/playable_sky_native.c',f'/Fe:{out / "playable_sky_native.exe"}',f'/Fo:{out / "playable_sky_native.obj"}','/link','user32.lib','gdi32.lib','winmm.lib'],out,env=env,log=out/'native-build.log')
    native=run([out/'playable_sky_native.exe'],out,log=out/'native.log').strip()
    if native!='playable sky native blend: PASS': raise RuntimeError(native)
    build('tests/playable_sky_contracts.ml','playable_sky_contracts.exe')
    contracts=run([ROOT/'build/playable_sky_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 27 playable sky contracts': raise RuntimeError(contracts)
    retail=None
    if args.pak:
        build('tests/playable_sky_retail_probe.ml','playable_sky_retail_probe.exe')
        retail=run([ROOT/'build/playable_sky_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=out/'retail.log').strip()
        if not retail.startswith('PASS: retail map skies='): raise RuntimeError(retail)
    files=[ROOT/'src/mq3/client/playable_sky.ml',ROOT/'native/playable_win32.c',ROOT/'native/playable_sky_math.h',ROOT/'tests/playable_sky_native.c',ROOT/'tests/playable_sky_contracts.ml',ROOT/'tests/playable_sky_retail_probe.ml',ROOT/'tests/playable_sky_benchmark.ml',ROOT/'tests/playable_sky_prepare_benchmark.ml',ROOT/'scripts/test_playable_sky.py',ROOT/'scripts/benchmark_playable_sky.py']
    report={'passed':True,'contracts':27,'native':native,'retail':retail,'scope':'Camera-anchored map-specific retail cloud skies, exact double source UVs, bounded retained view/batch cache, native scale/scroll/seam packing and explicit OPAQUE/ONE+ONE layer blending without depth writes.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
    print(contracts)
    if retail: print(retail)
if __name__=='__main__': main()
