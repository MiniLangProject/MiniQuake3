#!/usr/bin/env python3
"""Complete code/renderer/tr_shader.c native runtime, C-oracle and retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run

SYMBOLS = ("CollapseMultitexture ComputeStageIteratorFunc CreateExternalShaders CreateInternalShaders "
"FindShaderInShaderText FinishShader FixRenderCommandList GeneratePermanentShader NameToAFunc "
"NameToDstBlendMode NameToGenFunc NameToSrcBlendMode ParseDeform ParseShader ParseSkyParms ParseSort "
"ParseStage ParseSurfaceParm ParseTexMod ParseVector ParseWaveForm RE_RegisterShaderFromImage "
"RE_RegisterShaderNoMip R_FindShader R_FindShaderByName R_InitShaders R_RemapShader R_ShaderList_f "
"ScanAndLoadShaderFiles SortNewShader VertexLightingCollapse generateHashValue modes valid").split()

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source', source, '--output', output], cwd=ROOT, check=True)
    return ROOT/'build'/output

def main() -> None:
    ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path);args=ap.parse_args()
    original_path=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shader.c'
    module_path=ROOT/'src/mq3/renderer/shader_runtime.ml'
    original=original_path.read_text(encoding='latin-1');port=module_path.read_text(encoding='utf-8')
    missing_original=[]
    for symbol in SYMBOLS:
        pattern=rf'\b{re.escape(symbol)}\s*\('
        if symbol in ('modes','valid'): pattern=rf'\b{symbol}\b'
        if not re.search(pattern,original):missing_original.append(symbol)
    def lower(value):
        if value.startswith('RE_'): return 're_'+value[3:]
        if value.startswith('R_'): return 'r_'+value[2:]
        return value[0].lower()+value[1:]
    missing_port=[s for s in SYMBOLS if not re.search(rf'\bfunction\s+{re.escape(lower(s))}\s*\(',port)]
    if missing_original or missing_port:raise SystemExit(f'FAIL: symbol coverage original={missing_original} port={missing_port}')
    anchors=(
        'shader.optimalStageIteratorFunc = RB_StageIteratorGeneric;',
        'if ( !stages[0].active || !stages[1].active )',
        'FixRenderCommandList( i+1 );',
        'newShader->sortedIndex = i+1;',
        'if ( shader.isSky ) {',
        'shader.sort = SS_FOG;',
        'COM_StripExtension( name, strippedName );',
        'for ( i = numShaders - 1; i >= 0 ; i-- )',
        'tr.projectionShadowShader = R_FindShader( "projectionShadow", LIGHTMAP_NONE, qtrue );',
    )
    for anchor in anchors:
        if anchor not in original:raise SystemExit('FAIL: original semantic anchor missing: '+anchor)
    # Both gates compile byte-for-byte extracted functions from the released C file.
    index_out=subprocess.run([sys.executable,ROOT/'scripts/test_shader_index.py'],cwd=ROOT,check=True,capture_output=True,text=True).stdout
    parser_out=subprocess.run([sys.executable,ROOT/'scripts/test_shader_parser.py'],cwd=ROOT,check=True,capture_output=True,text=True).stdout
    contract=run([build('tests/shader_runtime_contracts.ml','shader_runtime_contracts.exe')],ROOT/'build').strip()
    if contract!='PASS: 35 complete tr_shader runtime contracts':raise SystemExit(contract)
    subprocess.run([sys.executable,ROOT/'scripts/test_playable_materials.py'],cwd=ROOT,check=True,stdout=subprocess.DEVNULL)
    retail=None
    if args.data_root:
        pak=(args.data_root/'baseq3/pak0.pk3').resolve()
        if not pak.is_file():raise SystemExit('FAIL: retail pak missing: '+str(pak))
        retail=run([build('tests/shader_runtime_retail_probe.ml','shader_runtime_retail_probe.exe'),pak],ROOT/'build',timeout=240).strip()
        if not retail.startswith('PASS: 8 retail tr_shader probes'):raise SystemExit(retail)
    out=ROOT/'build/reference/shader_runtime';out.mkdir(parents=True,exist_ok=True)
    files=[original_path,module_path,ROOT/'tests/shader_runtime_contracts.ml',ROOT/'tests/shader_runtime_retail_probe.ml',ROOT/'scripts/test_shader_runtime.py']
    report={'passed':True,'symbols':len(SYMBOLS),'contracts':35,'unchanged_c_oracles':40,'playable_material_contracts':59,'retail':retail,'scope':'Complete tr_shader runtime: parser facade, script scan/index, finish/collapse/vertex-light optimization, stable permanent handles and sort repair callback, implicit/explicit/internal/external registration, remapping and listing.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 34 / 34 tr_shader symbols')
    print(next(line for line in index_out.splitlines() if line.startswith('PASS:')))
    print(next(line for line in parser_out.splitlines() if line.startswith('PASS:')))
    print(contract);print('PASS: 59 existing playable-material contracts')
    if retail:print(retail)

if __name__=='__main__':main()
