#!/usr/bin/env python3
"""Build and exercise the queued WinMM ambient-stream bridge."""
from pathlib import Path
import shutil,subprocess,sys
from toolchain import ROOT,msvc_env

OUT=ROOT/'build/playable_ambient';SOURCE=ROOT/'native/playable_ambient_win32.c';TEST=ROOT/'tests/playable_ambient_lifecycle.c'
def run(command,env):
    print('+',' '.join(map(str,command)));subprocess.run([str(x) for x in command],cwd=ROOT,env=env,check=True)
def main():
    if sys.platform!='win32': print('playable ambient build: SKIP (Windows only)');return 0
    OUT.mkdir(parents=True,exist_ok=True);env=msvc_env('x64');compiler=shutil.which('cl.exe',path=env['PATH'])
    if not compiler: raise RuntimeError('cl.exe not found after vcvars initialization')
    dll=OUT/'playable_ambient.dll';lib=OUT/'playable_ambient.lib';exe=OUT/'playable_ambient_lifecycle.exe'
    run([compiler,'/nologo','/W4','/WX','/O2','/LD',SOURCE,'/link','winmm.lib',f'/OUT:{dll}',f'/IMPLIB:{lib}'],env)
    run([compiler,'/nologo','/W4','/WX',TEST,lib,f'/Fe:{exe}'],env);run([exe],env)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_spatial_ambient_boundary.ml','--output','playable_spatial_ambient_boundary.exe'],cwd=ROOT,check=True)
    print(f'playable ambient build: PASS ({dll})');return 0
if __name__=='__main__': raise SystemExit(main())
