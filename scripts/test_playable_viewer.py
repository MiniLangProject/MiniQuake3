"""Build and run the MiniLang first-person playable-preview contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/playable_viewer';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_viewer_contracts.ml','--output','playable_viewer_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/playable_viewer_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 50 playable-viewer contracts'
    if contracts!=expected: raise RuntimeError(contracts)
    files=[ROOT/'src/mq3/client/playable_viewer.ml',ROOT/'tests/playable_viewer_contracts.ml']
    result={'passed':True,'contracts':50,'scope':'Binary32 first-person camera, clamped frame movement, mouse look, camera-space transforms, direct and frame-prepared perspective projection, and near-plane line clipping.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 50 playable-viewer contracts')

if __name__=='__main__': main()
