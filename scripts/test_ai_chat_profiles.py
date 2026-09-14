#!/usr/bin/env python3
"""Run native chat setup oracle, MiniLang contracts, and optional pak0 probe."""
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
    out=ROOT/'build/reference/ai_chat_profiles';out.mkdir(parents=True,exist_ok=True);source=ROOT/'tests/reference/ai_chat_profile_oracle.c';native=out/'ai_chat_profile_oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4',source,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    value=run([native],out,log=out/'oracle.log').strip();expected='PASS: 4 native Baseq3 chat setup scenarios / 8 exact observations'
    if value!=expected:raise RuntimeError(value)
    mini=run([build('tests/ai_chat_profile_contracts.ml','ai_chat_profile_contracts.exe')],ROOT/'build').strip()
    if mini!='PASS: 18 AI chat profile contracts':raise RuntimeError(mini)
    print(value);print(mini)
    if args.pak:
        retail=run([build('tests/ai_chat_retail_probe.ml','ai_chat_retail_probe.exe'),args.pak],ROOT/'build').strip()
        if not retail.startswith('PASS: retail Sarge chat checks=8 types='):raise RuntimeError(retail)
        print(retail)
    return 0

if __name__=='__main__':raise SystemExit(main())
