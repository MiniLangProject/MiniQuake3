"""Build and run hostile Machinegun hitscan contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_enemy_hitscan';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_enemy_hitscan_contracts.ml','--output','playable_enemy_hitscan_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_enemy_hitscan_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 12 playable enemy-hitscan contracts'
    if value!=expected:raise RuntimeError(value)
    files=[ROOT/'src/mq3/client/playable_enemy_hitscan.ml',ROOT/'tests/playable_enemy_hitscan_contracts.ml']
    report={'passed':True,'contracts':12,'scope':'Retail-muzzle Machinegun hitscan with a post-movement BSP shielding trace, damage payloads and asset fallback.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
