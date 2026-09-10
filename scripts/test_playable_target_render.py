"""Build and run camera-projected preview-target rendering contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_target_render';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_target_render_contracts.ml','--output','playable_target_render_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/playable_target_render_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 26 playable-target-render contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[ROOT/'src/mq3/client/playable_target_render.ml',ROOT/'tests/playable_target_render_contracts.ml']
    result={'passed':True,'contracts':26,'scope':'Camera-projected player silhouettes, health bars, damage flash, death marker and timed local respawn state, exposed as line commands for the playable renderer.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)

if __name__=='__main__': main()
