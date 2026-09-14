#!/usr/bin/env python3
"""Run the direct Baseq3 C oracle and MiniLang Elementary Actions contracts."""
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run

def main()->int:
    out=ROOT/'build/reference/elementary_actions';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'tests/reference/elementary_actions_oracle.c';native=out/'elementary_actions_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',source,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    value=run([native],out,log=out/'oracle.log').strip();expected='PASS: 5 native Baseq3 Elementary Actions scenarios / 20 exact observations'
    if value!=expected:raise RuntimeError(value)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/elementary_actions_contracts.ml','--output','elementary_actions_contracts.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/elementary_actions_contracts.exe'],ROOT/'build').strip()
    if mini!='PASS: 19 Elementary Actions contracts':raise RuntimeError(mini)
    print(value);print(mini);return 0

if __name__=='__main__':raise SystemExit(main())
