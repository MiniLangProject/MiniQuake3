"""Verify local preview opponents, hitscan damage, death and respawn."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_targets';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_targets_contracts.ml','--output','playable_targets_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_targets_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 29 playable-target contracts'
    if value!=expected:raise RuntimeError(value)
    probe=None;retained=ROOT/'build/reference/bodies/cd_q3dm1.bsp'
    if retained.exists():
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_targets_map_probe.ml','--output','playable_targets_map_probe.exe'],cwd=ROOT,check=True)
        probe=run([ROOT/'build/playable_targets_map_probe.exe',retained],ROOT/'build',log=out/'q3dm1.log').strip()
        if not probe.startswith('PASS: BSP preview targets total='):raise RuntimeError(probe)
    files=[ROOT/'src/mq3/client/playable_targets.ml',ROOT/'tests/playable_targets_contracts.ml',ROOT/'tests/playable_targets_map_probe.ml']
    report={'passed':True,'contracts':29,'q3dm1':probe,'scope':'Deterministic local deathmatch-spawn opponents with wall-limited hitscan selection, damage, kills, score, patrol and timed respawn.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
