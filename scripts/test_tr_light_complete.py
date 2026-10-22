#!/usr/bin/env python3
"""Complete tr_light.c facade, unchanged-C, native and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

SYMBOLS=["R_TransformDlights","R_DlightBmodel","R_SetupEntityLightingGrid","LogLight","R_SetupEntityLighting","R_LightForPoint"]
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output
def invoke(name,*args): subprocess.run([sys.executable,ROOT/'scripts'/name,*map(str,args)],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/tr_light_complete';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_light.c';facade=ROOT/'src/mq3/renderer/tr_light_runtime.ml'
    original_text=original.read_text(encoding='utf-8');facade_text=facade.read_text(encoding='utf-8')
    absent_original=[name for name in SYMBOLS if not re.search(rf'\b{name}\s*\(',original_text)];absent_facade=[name for name in SYMBOLS if not re.search(rf'\bfunction\s+{name}\s*\(',facade_text)]
    if absent_original or absent_facade: raise RuntimeError(f'tr_light symbols missing: original={absent_original}, facade={absent_facade}')
    contracts=run([build('tests/tr_light_complete_contracts.ml','tr_light_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 19 complete tr_light contracts': raise RuntimeError(contracts)
    pak=(args.data_root/'baseq3/pak0.pk3').resolve()
    if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 missing: {pak}')
    retail=run([build('tests/tr_light_retail_probe.ml','tr_light_retail_probe.exe'),pak],ROOT/'build',log=out/'retail.log',timeout=600).strip()
    if not retail.startswith('PASS: retail tr_light q3dm1 '): raise RuntimeError(retail)
    invoke('test_playable_dynamic_lights.py');dynamic=json.loads((ROOT/'build/reference/playable_dynamic_lights/result.json').read_text(encoding='utf-8'))
    exact=out/'exact';exact.mkdir(exist_ok=True);(exact/'tr_light_log_under_test.inc').write_text(extract(original,['LogLight']),encoding='utf-8',newline='\n')
    oracle=exact/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{exact}',ROOT/'tests/reference/tr_light_log_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],exact,msvc_env('x86'),exact/'oracle-build.log')
    native=run([oracle],exact,log=exact/'oracle.log');mini=run([build('tests/tr_light_log_oracle.ml','tr_light_log_oracle.exe')],ROOT/'build',log=exact/'minilang.log')
    if native!=mini: raise RuntimeError('LogLight unchanged-C mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    if args.full_regression:
        invoke('test_playable_light_grid.py','--pak',pak);invoke('test_qvm_scene_geometry.py');invoke('test_qvm_scene_batch.py')
    files=[original,facade,ROOT/'src/mq3/renderer/playable_light_grid.ml',ROOT/'tests/tr_light_complete_contracts.ml',ROOT/'tests/tr_light_retail_probe.ml',ROOT/'tests/reference/tr_light_log_oracle.c',ROOT/'tests/tr_light_log_oracle.ml']
    report={'passed':True,'symbols':len(SYMBOLS),'unchanged_c_records':dynamic['records']+len(native.splitlines()),'contracts':19,'retail':retail,'retail_pak_sha256':sha(pak),'scope':'All six real tr_light.c functions through a C-named native MiniLang facade; exact transform/bmodel-mask and LogLight records, entity-grid sampling, dynamic accumulation, cache, ambient byte packet, local direction, and Retail q3dm1 light grid.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)}/{len(SYMBOLS)} tr_light symbols + {report['unchanged_c_records']} unchanged-C records + 19 native contracts + Retail q3dm1")
if __name__=='__main__': main()
