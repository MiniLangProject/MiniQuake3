"""Build and run isolated playable hitscan weapon contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_weapon';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_weapon_contracts.ml','--output','playable_weapon_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/playable_weapon_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 37 playable-weapon contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[ROOT/'src/mq3/client/playable_weapon.ml',ROOT/'tests/playable_weapon_contracts.ml']
    result={'passed':True,'contracts':37,'scope':'Playable weapon ray path plus stock Baseq3 weapon timing/damage profiles: camera-basis aiming, point trace, hit result, trigger latch, automatic fire rate, cooldown, finite and unlimited ammo, no-ammo events, reload and trace-error atomicity.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)

if __name__=='__main__': main()
