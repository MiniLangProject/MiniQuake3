"""Build and run isolated playable Quake-style movement contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_movement';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_movement_contracts.ml','--output','playable_movement_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/playable_movement_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 27 playable-movement contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[ROOT/'src/mq3/client/playable_movement.ml',ROOT/'tests/playable_movement_contracts.ml']
    result={'passed':True,'contracts':27,'scope':'Playable Quake-style ground movement using the shared bg_pmove/bg_slidemove kernel: gravity, ground probing, grounded-idle support checks, jump-edge latch, friction/acceleration, collision slide, 18-unit step-up, analog input and bounded 8 ms substeps.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)

if __name__=='__main__': main()
