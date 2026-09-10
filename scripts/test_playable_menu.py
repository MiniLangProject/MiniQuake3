#!/usr/bin/env python3
"""Build playable menu contracts and optionally probe retail pak0 artwork."""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
from toolchain import ROOT, run
def build(source: str, output: str) -> None: subprocess.run([sys.executable, ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args();output=ROOT/'build/reference/playable_menu';output.mkdir(parents=True,exist_ok=True)
    build('tests/playable_menu_contracts.ml','playable_menu_contracts.exe');contracts=run([ROOT/'build/playable_menu_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 24 playable menu contracts': raise RuntimeError(contracts)
    print(contracts)
    if args.pak is not None:
        build('tests/playable_menu_retail_probe.ml','playable_menu_retail_probe.exe');retail=run([ROOT/'build/playable_menu_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=output/'retail.log').strip()
        if retail!='PASS: retail Baseq3 menu 4 textures / 4 image checks': raise RuntimeError(retail)
        print(retail)
    return 0
if __name__=='__main__': raise SystemExit(main())
