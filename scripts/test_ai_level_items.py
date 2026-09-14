#!/usr/bin/env python3
"""Run native and MiniLang level-item state contracts."""
import subprocess,sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run

def main():
    out=ROOT/'build/reference/ai_level_items';out.mkdir(parents=True,exist_ok=True)
    native=out/'ai_level_item_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',ROOT/'tests/reference/ai_level_item_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    observed=run([native],out).strip()
    if observed!='free=0 team=4 reuse=-1 equal=0 expired=1':raise RuntimeError(observed)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ai_level_item_contracts.ml','--output','ai_level_item_contracts.exe'],cwd=ROOT,check=True)
    contract=run([ROOT/'build/ai_level_item_contracts.exe'],ROOT/'build').strip()
    if contract!='PASS: 12 AI level-item contracts':raise RuntimeError(contract)
    print('PASS: native level-item observations '+observed);print(contract)
if __name__=='__main__':main()
