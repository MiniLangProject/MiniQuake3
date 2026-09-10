"""Verify deterministic BSP46 wireframe preview extraction."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/bsp_preview';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_preview_contracts.ml','--output','bsp_preview_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/bsp_preview_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 34 BSP preview contracts'
    if value!=expected:raise RuntimeError(value)
    original=ROOT/'Quake-III-Arena-original-source/code/qcommon/qfiles.h'
    source=original.read_text(encoding='utf-8',errors='replace')
    for token in ['typedef struct {','firstVert','numVerts','firstIndex','numIndexes','MST_PLANAR','MST_TRIANGLE_SOUP']:
        if token not in source:raise RuntimeError('missing BSP46 reference token '+token)
    files=[original,ROOT/'src/mq3/format/bsp.ml',ROOT/'src/mq3/renderer/bsp_preview.ml',ROOT/'tests/bsp_preview_contracts.ml']
    report={'passed':True,'contracts':34,'scope':'BSP46 planar and triangle-soup meshvert resolution, visible leaf-face selection, deterministic shared-edge removal, coordinates, provenance, line limits, and malformed range rejection.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 34 BSP preview contracts')
if __name__=='__main__':main()
