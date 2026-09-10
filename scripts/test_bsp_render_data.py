"""Verify checked BSP46 triangle and lightmap extraction."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/bsp_render_data';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_render_data_contracts.ml','--output','bsp_render_data_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/bsp_render_data_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 55 BSP render-data contracts'
    if value!=expected:raise RuntimeError(value)
    original=ROOT/'Quake-III-Arena-original-source/code/qcommon/qfiles.h'
    source=original.read_text(encoding='utf-8',errors='replace')
    for token in ['drawVert_t','lightmapNum','firstVert','numVerts','firstIndex','numIndexes','patchWidth','patchHeight','MST_PLANAR','MST_PATCH','MST_TRIANGLE_SOUP','LIGHTMAP_WIDTH','LIGHTMAP_HEIGHT']:
        if token not in source:raise RuntimeError('missing BSP46 reference token '+token)
    map_probe=None
    retained=ROOT/'build/reference/bodies/cd_q3dm1.bsp'
    if retained.exists():
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_render_data_map_probe.ml','--output','bsp_render_data_map_probe.exe'],cwd=ROOT,check=True)
        map_probe=run([ROOT/'build/bsp_render_data_map_probe.exe',retained],ROOT/'build',log=out/'q3dm1.log').strip()
        if not map_probe.startswith('PASS: BSP map rendered surfaces='):raise RuntimeError(map_probe)
    files=[original,ROOT/'src/mq3/format/bsp.ml',ROOT/'src/mq3/renderer/bsp_render_data.ml',ROOT/'tests/bsp_render_data_contracts.ml',ROOT/'tests/bsp_render_data_map_probe.ml']
    report={'passed':True,'contracts':55,'q3dm1':map_probe,'scope':'BSP46 planar, triangle-soup, and quadratic MST_PATCH extraction with curvature-driven tessellation; positions, base/lightmap UVs, vertex colors, shader/lightmap indexes, stable face order, strict limits, complete validation, and RGB/RGBA lightmap decoding.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
