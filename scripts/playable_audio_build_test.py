#!/usr/bin/env python3
"""Build the dependency-free WinMM preview DLL and exercise its lifecycle."""
from __future__ import annotations
import os
from pathlib import Path
import shutil
import subprocess
import sys
from toolchain import ROOT, msvc_env

OUT=ROOT/'build/playable_audio'
SOURCE=ROOT/'native/playable_audio_win32.c'
TEST=ROOT/'tests/playable_audio_lifecycle.c'

def run(command,env):
    print('+',' '.join(map(str,command)))
    subprocess.run([str(x) for x in command],cwd=ROOT,env=env,check=True)

def main():
    if sys.platform!='win32': print('playable audio build: SKIP (Windows only)');return 0
    OUT.mkdir(parents=True,exist_ok=True);env=msvc_env('x64');compiler=shutil.which('cl.exe',path=env['PATH'])
    if not compiler: raise RuntimeError('vcvars initialized, but cl.exe is not on PATH')
    dll=OUT/'playable_audio.dll';lib=OUT/'playable_audio.lib';exe=OUT/'playable_audio_lifecycle.exe'
    run([compiler,'/nologo','/W4','/WX','/O2','/LD',SOURCE,'/link','winmm.lib',f'/OUT:{dll}',f'/IMPLIB:{lib}'],env)
    run([compiler,'/nologo','/W4','/WX',TEST,lib,f'/Fe:{exe}'],env)
    run([exe],env)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_audio_boundary_compile.ml','--output','playable_audio_boundary_compile.exe'],cwd=ROOT,check=True)
    print(f'playable audio build: PASS ({dll})');return 0

if __name__=='__main__': raise SystemExit(main())
