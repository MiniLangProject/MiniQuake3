"""Verify checked BSP46 triangle and lightmap extraction."""
import json
import re
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/bsp_render_data';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_render_data_contracts.ml','--output','bsp_render_data_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/bsp_render_data_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 65 BSP render-data contracts'
    if value!=expected:raise RuntimeError(value)
    original_renderer=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_bsp.c'
    (out/'bsp_lighting_shift_under_test.inc').write_text(extract(original_renderer,['R_ColorShiftLightingBytes']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/bsp_lighting_shift_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_lighting_shift_oracle.ml','--output','bsp_lighting_shift_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/bsp_lighting_shift_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('BSP lighting shift mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    original_curve=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_curve.c'
    patch_helpers = ['MakeMeshNormals', 'LerpDrawVert', 'Transpose', 'InvertCtrl',
                     'InvertErrorTable', 'PutPointsOnCurve']
    # The introductory comment contains a second, incomplete copy of the signature.
    subdivision = re.search(
        r'(?ms)^srfGridMesh_t \*R_SubdividePatchToGrid[^{]+\{\n\tint.*?^\}',
        original_curve.read_text(),
    )
    if subdivision is None:
        raise RuntimeError('missing original patch subdivision function')
    patch_source = extract(original_curve, patch_helpers) + subdivision[0] + '\n'
    (out/'bsp_patch_normals_under_test.inc').write_text(patch_source, encoding='utf-8', newline='\n')
    normal_harness=ROOT/'tests/reference/bsp_patch_normals_oracle.c';normal_oracle=out/'normal-oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX',f'/I{out}',normal_harness,f'/Fe:{normal_oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'normal-oracle-build.log')
    native_normals=run([normal_oracle],out,log=out/'normal-oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bsp_patch_normals_oracle.ml','--output','bsp_patch_normals_oracle.exe'],cwd=ROOT,check=True)
    mini_normals=run([ROOT/'build/bsp_patch_normals_oracle.exe'],ROOT/'build',log=out/'normal-minilang.log')
    if native_normals != mini_normals:
        raise RuntimeError('BSP patch grid or normal mismatch\nC:\n' + native_normals + 'MiniLang:\n' + mini_normals)
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
    files=[original,original_renderer,original_curve,harness,normal_harness,ROOT/'src/mq3/format/bsp.ml',ROOT/'src/mq3/renderer/bsp_render_data.ml',ROOT/'tests/bsp_lighting_shift_oracle.ml',ROOT/'tests/bsp_patch_normals_oracle.ml',ROOT/'tests/bsp_render_data_contracts.ml',ROOT/'tests/bsp_render_data_map_probe.ml']
    patch_records = native_normals.splitlines()
    normal_records = sum(line.startswith(('N', 'W', 'D')) for line in patch_records)
    grid_records = len(patch_records) - normal_records
    report = {
        'passed': True,
        'records': len(native.splitlines()),
        'normal_records': normal_records,
        'grid_records': grid_records,
        'contracts': 65,
        'functions': ['R_ColorShiftLightingBytes', 'R_SubdividePatchToGrid', *patch_helpers],
        'q3dm1': map_probe,
        'scope': (
            'BSP46 planar, triangle-soup, quadratic MST_PATCH and inline brush-model extraction. '
            'Adaptive subdivision, collinear row and column removal, SURF_NODRAW mesh exclusion, position, UV and color interpolation, '
            'and exact wrapped and degenerate patch normals. Source vertex identity, shader and lightmap '
            'references, face order, limits, validation, RGB/RGBA decoding and Baseq3 overbright color shifting.'
        ),
        'sources': {p.relative_to(ROOT).as_posix(): sha(p) for p in files},
    }
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact lighting-shift + {normal_records} exact patch-normal + {grid_records} exact patch-grid records + 65 BSP render-data contracts")
if __name__=='__main__':main()
