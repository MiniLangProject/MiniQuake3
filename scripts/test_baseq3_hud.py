#!/usr/bin/env python3
"""Build Baseq3 HUD contracts and optionally verify retail pak0 artwork."""
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
    output=ROOT/'build/reference/baseq3_hud';output.mkdir(parents=True,exist_ok=True)
    build('tests/baseq3_hud_contracts.ml','baseq3_hud_contracts.exe')
    contracts=run([ROOT/'build/baseq3_hud_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 50 Baseq3 HUD contracts': raise RuntimeError(contracts)
    retail=None
    if args.pak is not None:
        build('tests/baseq3_hud_retail_probe.ml','baseq3_hud_retail_probe.exe')
        retail=run([ROOT/'build/baseq3_hud_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=output/'retail.log',timeout=240).strip()
        if not retail.startswith('PASS: retail Baseq3 HUD 39 textures / 8 ammo icons / '): raise RuntimeError(retail)
    files=[ROOT/'src/mq3/client/baseq3_hud.ml',ROOT/'tests/baseq3_hud_contracts.ml',ROOT/'tests/baseq3_hud_retail_probe.ml',ROOT/'scripts/test_baseq3_hud.py']
    report={'passed':True,'contracts':50,'retail':retail,'scope':'Original Baseq3 640x480 status placement including the 60x60 player-head box, timed owned-weapon selection strip, PK3 number/crosshair/player/dynamic per-weapon ammo/armor/weapon/pickup/medal artwork, bounded dynamic texture slots, combat state and feedback timing.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(contracts)
    if retail: print(retail)
    return 0
if __name__=='__main__': raise SystemExit(main())
