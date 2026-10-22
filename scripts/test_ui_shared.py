#!/usr/bin/env python3
import argparse, json, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

ORACLE=['UI_Alloc','UI_InitMemory','UI_OutOfMemory','hashForString','LerpColor','Fade','IsVisible','Rect_ContainsPoint','KeywordHash_Key']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def pak0(root):
    direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
    if direct.is_file(): return direct
    if nested.is_file(): return nested
    raise FileNotFoundError(f'pak0.pk3 not found below {root}')
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path);args=ap.parse_args()
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text());row=next(x for x in ledger['files'] if x['source']=='code/ui/ui_shared.c');functions=row['symbol_candidates'];source=ROOT/'Quake-III-Arena-original-source/code/ui/ui_shared.c';port=ROOT/'src/mq3/client/ui_shared.ml';original=source.read_text(errors='replace');ported=port.read_text()
    missing=[name for name in functions if name not in original or f'function {name}(' not in ported]
    if missing: raise RuntimeError('missing ui_shared symbols: '+', '.join(missing))
    out=ROOT/'build/reference/ui_shared';out.mkdir(parents=True,exist_ok=True);(out/'ui_shared_under_test.inc').write_text(extract(source,ORACLE))
    harness=ROOT/'tests/reference/ui_shared_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log')
    expected=run([exe],out);actual=run([build('tests/ui_shared_oracle.ml','ui_shared_oracle.exe')],ROOT/'build')
    if expected!=actual: raise RuntimeError('ui_shared oracle mismatch\nC:\n'+expected+'ML:\n'+actual)
    contracts=run([build('tests/ui_shared_contracts.ml','ui_shared_contracts.exe')],ROOT/'build').strip()
    if contracts!='PASS: 32 ui_shared native contracts': raise RuntimeError(contracts)
    retail=None
    if args.data_root:
        retail=run([build('tests/ui_shared_retail_probe.ml','ui_shared_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build').strip()
        if not retail.startswith('PASS: 8 retail ui_shared contracts assets='): raise RuntimeError(retail)
    files=[source,port,harness,ROOT/'tests/ui_shared_oracle.ml',ROOT/'tests/ui_shared_contracts.ml',ROOT/'tests/ui_shared_retail_probe.ml']
    (out/'result.json').write_text(json.dumps({'passed':True,'symbols':len(functions),'oracle_records':9,'contracts':32,'retail_contracts':8 if retail else 0,'functions':functions,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print(f'PASS: {len(functions)} ui_shared symbols + 9 unchanged-C functions + 32 native contracts')
    if retail: print(retail)
if __name__=='__main__': main()
