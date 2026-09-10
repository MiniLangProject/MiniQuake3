"""Build and run pure contracts for the playable first-person combat view."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_combat_view';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_combat_view_contracts.ml','--output','playable_combat_view_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_combat_view_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 40 playable-combat-view contracts'
    if value!=expected:raise RuntimeError(value)
    files=[ROOT/'src/mq3/client/playable_combat_view.ml',ROOT/'tests/playable_combat_view_contracts.ml']
    report={'passed':True,'contracts':40,'scope':'First-person line weapon, timed muzzle flash/recoil, hit and directional damage marks, frag notification, score, K/D, and combat event accounting.', 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
