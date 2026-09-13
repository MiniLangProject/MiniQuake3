#!/usr/bin/env python3
import argparse,subprocess,sys
from pathlib import Path
from toolchain import ROOT,run

def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    build('tests/playable_explosions_contracts.ml','playable_explosions_contracts.exe')
    value=run([ROOT/'build/playable_explosions_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 13 playable explosion contracts': raise RuntimeError(value)
    print(value)
    if args.pak:
        build('tests/playable_explosions_retail_probe.ml','playable_explosions_retail_probe.exe')
        retail=run([ROOT/'build/playable_explosions_retail_probe.exe',args.pak.resolve()],ROOT/'build').strip()
        if not retail.startswith('PASS: retail explosions'): raise RuntimeError(retail)
        print(retail)
if __name__=='__main__': main()
