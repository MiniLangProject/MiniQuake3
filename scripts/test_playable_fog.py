#!/usr/bin/env python3
import argparse,subprocess,sys
from pathlib import Path
from toolchain import ROOT,run

def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    build('tests/playable_fog_contracts.ml','playable_fog_contracts.exe')
    value=run([ROOT/'build/playable_fog_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 12 playable fog contracts': raise RuntimeError(value)
    print(value)
    if args.pak:
        build('tests/playable_fog_retail_probe.ml','playable_fog_retail_probe.exe')
        value=run([ROOT/'build/playable_fog_retail_probe.exe',args.pak.resolve()],ROOT/'build').strip()
        if not value.startswith('PASS: retail q3ctf1 fog'): raise RuntimeError(value)
        print(value)
if __name__=='__main__': main()
