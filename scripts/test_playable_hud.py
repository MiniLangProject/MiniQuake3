"""Build and run contracts for the line-rendered playable HUD."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_hud';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_hud_contracts.ml','--output','playable_hud_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_hud_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 62 playable-HUD contracts'
    if value!=expected:raise RuntimeError(value)
    files=[ROOT/'src/mq3/client/playable_hud.ml',ROOT/'tests/playable_hud_contracts.ml']
    report={'passed':True,'contracts':62,'scope':'Line-rendered crosshair, clamped health/armor/ammo state, responsive layout, status/help text, and complete uppercase, digit, and HUD-punctuation glyph coverage.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
