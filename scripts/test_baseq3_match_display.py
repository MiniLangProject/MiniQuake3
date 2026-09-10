#!/usr/bin/env python3
"""Build the Baseq3 match-display contracts and optional retail artwork probe."""
from __future__ import annotations
import argparse
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run

def build(source: str, output: str) -> None:
    subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source', source, '--output', output], cwd=ROOT, check=True)

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    output=ROOT/'build/reference/baseq3_match_display';output.mkdir(parents=True,exist_ok=True)
    build('tests/baseq3_match_display_contracts.ml','baseq3_match_display_contracts.exe')
    contracts=run([ROOT/'build/baseq3_match_display_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 38 Baseq3 match-display contracts': raise RuntimeError(contracts)
    retail=None
    if args.pak is not None:
        build('tests/baseq3_match_display_retail_probe.ml','baseq3_match_display_retail_probe.exe')
        retail=run([ROOT/'build/baseq3_match_display_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=output/'retail.log',timeout=240).strip()
        if retail!='PASS: retail match display 256x256 bigchars / 11 number shaders / 11264 number pixels': raise RuntimeError(retail)
    files=[ROOT/'src/mq3/client/baseq3_match_display.ml',ROOT/'tests/baseq3_match_display_contracts.ml',ROOT/'tests/baseq3_match_display_retail_probe.ml',ROOT/'scripts/test_baseq3_match_display.py']
    report={'passed':True,'contracts':38,'retail':retail,'scope':'Retail bigchars atlas addressing, Quake color escapes and shadowed text; Baseq3 timer, pulsing warmup countdown, fading multiline centerprint and sorted FFA intermission scoreboard; plus retail PK3 validation of bigchars and all eleven status-number shaders.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(contracts)
    if retail: print(retail)
    return 0

if __name__=='__main__': raise SystemExit(main())
