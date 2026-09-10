"""Verify preview player armor, death, spawn protection and map respawn cycle."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_player';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_player_contracts.ml','--output','playable_player_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_player_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 24 playable-player contracts'
    if value!=expected:raise RuntimeError(value)
    probe=None;retained=ROOT/'build/reference/bodies/cd_q3dm1.bsp'
    if retained.exists():
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_player_map_probe.ml','--output','playable_player_map_probe.exe'],cwd=ROOT,check=True)
        probe=run([ROOT/'build/playable_player_map_probe.exe',retained],ROOT/'build',log=out/'q3dm1.log').strip()
        if not probe.startswith('PASS: BSP playable player deathmatchSpawns='):raise RuntimeError(probe)
    files=[ROOT/'src/mq3/client/playable_player.ml',ROOT/'tests/playable_player_contracts.ml',ROOT/'tests/playable_player_map_probe.ml']
    report={'passed':True,'contracts':24,'q3dm1':probe,'scope':'Preview player Baseq3 armor absorption, death count, timed cyclic respawn, loadout reset and optional spawn protection.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
