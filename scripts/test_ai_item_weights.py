#!/usr/bin/env python3
"""Run native, MiniLang and optional retail item-weight contracts."""
import argparse,subprocess,sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args();out=ROOT/'build/reference/ai_item_weights';out.mkdir(parents=True,exist_ok=True);native=out/'ai_item_weight_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',ROOT/'tests/reference/ai_item_weight_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    observed=run([native],out).strip();expected='PASS: 12 native fuzzy-weight observations'
    if observed!=expected:raise RuntimeError(observed)
    contract=run([build('tests/ai_item_weight_contracts.ml','ai_item_weight_contracts.exe')],ROOT/'build').strip()
    if contract!='PASS: 25 AI item-weight contracts':raise RuntimeError(contract)
    print(observed);print(contract)
    if args.pak:
      retail=run([build('tests/ai_item_weight_retail_probe.ml','ai_item_weight_retail_probe.exe'),args.pak],ROOT/'build').strip()
      if not retail.startswith('PASS: retail Sarge item weights checks=10 items=35 weights=33 missing=2'):raise RuntimeError(retail)
      print(retail)
if __name__=='__main__':main()
