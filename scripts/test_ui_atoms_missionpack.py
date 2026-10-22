#!/usr/bin/env python3
"""Missionpack ui_atoms.c unchanged-C, native contract, and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

FUNCTIONS=['Com_Error','Com_Printf','NeedCDAction','NeedCDKeyAction','UI_AdjustFrom640','UI_Argv','UI_Cache_f','UI_CalcPostGameStats','UI_ClampCvar','UI_ClearScores','UI_ConsoleCommand','UI_CursorInRect','UI_Cvar_VariableString','UI_DrawHandlePic','UI_DrawNamedPic','UI_DrawRect','UI_DrawSides','UI_DrawTextBox','UI_DrawTopBottom','UI_FillRect','UI_LoadBestScores','UI_SetBestScores','UI_SetColor','UI_Shutdown','UI_StartDemoLoop','UI_UpdateScreen']

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def pak0(root):
    direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
    if direct.is_file(): return direct
    if nested.is_file(): return nested
    raise FileNotFoundError('pak0.pk3 not found below '+str(root))

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,required=True);args=parser.parse_args()
    source=ROOT/'Quake-III-Arena-original-source/code/ui/ui_atoms.c';port=ROOT/'src/mq3/client/ui_atoms_missionpack.ml'
    original=source.read_text(encoding='utf-8',errors='replace');ported=port.read_text(encoding='utf-8')
    for name in FUNCTIONS:
        if not re.search(r'\b'+re.escape(name)+r'\s*\(',original): raise RuntimeError('missing original symbol '+name)
        if not re.search(r'(?m)^function\s+'+re.escape(name)+r'\s*\(',ported): raise RuntimeError('missing ported symbol '+name)
    if len(FUNCTIONS)!=26: raise RuntimeError('symbol inventory changed')
    required=['UI_AdjustFrom640(state,x,y,w,h) return [x*state.xscale,y*state.yscale,w*state.xscale,h*state.yscale]',
      '"demos/"+map+"_"+str(game)+".dm_"+str(protocol)','"ui_scoreAccuracy2"','"remapshader"','"display-cache-all"']
    for fragment in required:
        if fragment not in ported: raise RuntimeError('missing Missionpack semantic marker '+fragment)

    out=ROOT/'build/reference/ui_atoms_missionpack';out.mkdir(parents=True,exist_ok=True);code=source.parents[1]
    harness=ROOT/'tests/reference/ui_atoms_missionpack_oracle.c';oracle=out/'oracle.exe';includes=[f'/I{code/name}' for name in ('ui','qcommon','renderer','client')]
    run(['cl','/nologo','/Od','/MT','/Gy','/DWIN32','/DMISSIONPACK',*includes,source,harness,f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/ui_atoms_missionpack_oracle.ml','ui_atoms_missionpack_oracle.exe')],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini: raise RuntimeError('Missionpack UI atoms oracle mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    contracts=run([build('tests/ui_atoms_missionpack_contracts.ml','ui_atoms_missionpack_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 32 Missionpack UI atoms contracts': raise RuntimeError(contracts)
    retail=run([build('tests/ui_atoms_missionpack_retail_probe.ml','ui_atoms_missionpack_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build',log=out/'retail.log').strip()
    if not retail.startswith('PASS: 6 Retail Missionpack UI atoms probes map=q3dm1 shaderBytes='): raise RuntimeError(retail)
    files=[source,port,harness,ROOT/'tests/ui_atoms_missionpack_oracle.ml',ROOT/'tests/ui_atoms_missionpack_contracts.ml',ROOT/'tests/ui_atoms_missionpack_retail_probe.ml']
    report={'passed':True,'symbols':26,'differential_records':32,'contracts':32,'retail_contracts':6,
      'scope':'Complete Missionpack ui_atoms.c behavior: diagnostics, command/cvar buffers, score persistence and postgame calculation, console commands, x/y display-context scaling, draw primitives, screen update and cursor hit testing through the native Missionpack trap veneer.',
      'missionpack_differences':'Uses independent xscale/yscale without Baseq3 bias, uiDC frame timing, Display_CacheAll command behavior, protocol-suffixed demo lookup, two complete postgame cvar sets and Missionpack console commands.',
      'remaining':'UI_Report, UI_Load, UI_ShowPostGame and Display_CacheAll are typed internal callbacks because their implementations live in other original UI files. NeedCD callbacks are retained for ledger/source completeness although MISSIONPACK excludes them at preprocessing time.',
      'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 26 Missionpack UI atoms symbols + 32 C records + 32 native contracts + 6 Retail probes')

if __name__=='__main__': main()
