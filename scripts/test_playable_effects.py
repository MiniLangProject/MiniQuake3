"""Build and run item-marker and weapon-effect preview contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_effects';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_effects_contracts.ml','--output','playable_effects_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/playable_effects_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 31 playable-effects contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[ROOT/'src/mq3/client/playable_effects.ml',ROOT/'tests/playable_effects_contracts.ml']
    result={'passed':True,'contracts':31,'scope':'Camera-projected colored item billboards plus bounded-lifetime hitscan tracers and impact crosses, exposed as line commands for the playable Win32 renderer.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)

if __name__=='__main__': main()
