#!/usr/bin/env python3
"""Run direct Baseq3 engine-bot oracle and MiniLang bridge contracts."""
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run

def build(source:str,output:str)->Path:
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main()->int:
    out=ROOT/'build/reference/bot_server_bridge';out.mkdir(parents=True,exist_ok=True);source=ROOT/'tests/reference/bot_server_bridge_oracle.c';native=out/'bot_server_bridge_oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4',source,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    value=run([native],out,log=out/'oracle.log').strip();expected='PASS: 4 native Baseq3 bot server scenarios / 11 exact observations'
    if value!=expected:raise RuntimeError(value)
    mini=run([build('tests/bot_server_bridge_contracts.ml','bot_server_bridge_contracts.exe')],ROOT/'build').strip()
    if mini!='PASS: 12 bot server bridge contracts':raise RuntimeError(mini)
    print(value);print(mini);return 0

if __name__=='__main__':raise SystemExit(main())
