#!/usr/bin/env python3
"""Run the direct Baseq3 character oracle, contracts and optional Retail probe."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run

def build(source:str,output:str)->Path:
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main()->int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/ai_characters';out.mkdir(parents=True,exist_ok=True);source=ROOT/'tests/reference/ai_character_oracle.c';native=out/'ai_character_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',source,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    value=run([native],out,log=out/'oracle.log').strip();expected='PASS: 5 native Baseq3 character scenarios / 14 exact observations'
    if value!=expected:raise RuntimeError(value)
    mini=run([build('tests/ai_character_contracts.ml','ai_character_contracts.exe')],ROOT/'build').strip()
    if mini!='PASS: 26 AI character contracts':raise RuntimeError(mini)
    print(value);print(mini)
    if args.pak:
        retail=run([build('tests/ai_character_retail_probe.ml','ai_character_retail_probe.exe'),args.pak],ROOT/'build').strip()
        if not retail.startswith('PASS: retail Sarge character checks=8 handle=5 files='):raise RuntimeError(retail)
        print(retail)
    return 0

if __name__=='__main__':raise SystemExit(main())
