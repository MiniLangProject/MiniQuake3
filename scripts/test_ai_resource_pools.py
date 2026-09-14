#!/usr/bin/env python3
"""Run the direct C lifecycle oracle and MiniLang AI resource contracts."""
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run

def main()->int:
    out=ROOT/'build/reference/ai_resource_pools';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'tests/reference/ai_resource_pool_oracle.c';native=out/'ai_resource_pool_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',source,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    observed=run([native],out,log=out/'oracle.log').strip();expected='PASS: 4 native AI resource scenarios / 13 exact observations'
    if observed!=expected:raise RuntimeError(observed)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ai_resource_pool_contracts.ml','--output','ai_resource_pool_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/ai_resource_pool_contracts.exe'],ROOT/'build').strip()
    if contracts!='PASS: 22 AI resource pool contracts':raise RuntimeError(contracts)
    print(observed);print(contracts);return 0

if __name__=='__main__':raise SystemExit(main())
