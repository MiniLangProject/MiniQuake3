#!/usr/bin/env python3
"""Build and run retail first-person weapon-barrel contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_weapon_barrel';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_weapon_barrel_contracts.ml','--output','playable_weapon_barrel_contracts.exe'],cwd=ROOT,check=True)
    result=run([ROOT/'build/playable_weapon_barrel_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 13 playable weapon-barrel contracts'
    if result!=expected: raise RuntimeError(result)
    files=[ROOT/'src/mq3/client/playable_weapon_barrel.ml',ROOT/'tests/playable_weapon_barrel_contracts.ml']
    report={'passed':True,'contracts':13,'scope':'Baseq3 barrel asset mapping, CG_MachinegunSpinAngle firing/coast transitions, 16-bit wrap, and rotated tag attachment.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(result)

if __name__=='__main__': main()
