#!/usr/bin/env python3
"""Build weapon-sound contracts and optionally decode the retail pak0 catalog."""
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
    output=ROOT/'build/reference/playable_weapon_sounds';output.mkdir(parents=True,exist_ok=True)
    build('tests/playable_weapon_sounds_contracts.ml','playable_weapon_sounds_contracts.exe')
    contracts=run([ROOT/'build/playable_weapon_sounds_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 41 playable weapon-sound contracts': raise RuntimeError(contracts)
    retail=None
    if args.pak is not None:
        pak=args.pak.resolve()
        if not pak.is_file(): raise FileNotFoundError(pak)
        build('tests/playable_weapon_sounds_retail_probe.ml','playable_weapon_sounds_retail_probe.exe')
        retail=run([ROOT/'build/playable_weapon_sounds_retail_probe.exe',pak],ROOT/'build',log=output/'retail.log',timeout=240).strip()
        if not retail.startswith('PASS: retail weapon sounds 9 weapons / 21 unique WAVs / '): raise RuntimeError(retail)
    files=[ROOT/'src/mq3/client/playable_weapon_sounds.ml',ROOT/'tests/playable_weapon_sounds_contracts.ml',ROOT/'tests/playable_weapon_sounds_retail_probe.ml',ROOT/'scripts/test_playable_weapon_sounds.py']
    report={'passed':True,'contracts':41,'retail':retail,'scope':'PK3-backed Baseq3 fire, applicable impact, and shared pickup sounds for all nine playable weapons including the gauntlet, decoded as WAV PCM accepted by playable_audio.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(contracts)
    if retail: print(retail)
    return 0

if __name__=='__main__': raise SystemExit(main())
