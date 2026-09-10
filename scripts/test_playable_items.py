"""Verify the entity-driven item layer used by the playable preview."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_items';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_items_contracts.ml','--output','playable_items_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_items_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 47 playable-item contracts'
    if value!=expected:raise RuntimeError(value)
    probe=None
    retained=ROOT/'build/reference/bodies/cd_q3dm1.bsp'
    if retained.exists():
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_items_map_probe.ml','--output','playable_items_map_probe.exe'],cwd=ROOT,check=True)
        probe=run([ROOT/'build/playable_items_map_probe.exe',retained],ROOT/'build',log=out/'q3dm1.log').strip()
        if not probe.startswith('PASS: BSP preview items total='):raise RuntimeError(probe)
    files=[ROOT/'src/mq3/client/playable_items.ml',ROOT/'tests/playable_items_contracts.ml',ROOT/'tests/playable_items_map_probe.ml']
    report={'passed':True,'contracts':47,'q3dm1':probe,'scope':'Preview recognition and pickup/respawn simulation for Baseq3 health, armor, ammo and weapon BSP entities, with bounded aggregate HUD stats.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
