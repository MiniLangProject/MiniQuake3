#!/usr/bin/env python3
"""Complete code/botlib/be_ai_weight.c differential and retail gate."""
import argparse
import re
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, msvc_env, run

SYMBOLS=("BotShutdownWeights EvolveFuzzySeperator_r EvolveWeightConfig FindFuzzyWeight "
"FreeFuzzySeperators_r FreeWeightConfig FreeWeightConfig2 FuzzyWeight FuzzyWeightUndecided "
"FuzzyWeightUndecided_r FuzzyWeight_r InterbreedFuzzySeperator_r InterbreedWeightConfigs "
"ReadFuzzySeperators_r ReadFuzzyWeight ReadValue ReadWeightConfig ScaleFuzzyBalanceRange "
"ScaleFuzzySeperatorBalanceRange_r ScaleFuzzySeperator_r ScaleWeight WriteFuzzySeperators_r "
"WriteFuzzyWeight WriteWeightConfig").split()

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    original=(ROOT/'Quake-III-Arena-original-source/code/botlib/be_ai_weight.c').read_text(encoding='latin-1')
    port=(ROOT/'src/mq3/botlib/ai_weight_runtime.ml').read_text(encoding='utf-8')
    lower=lambda value:value[0].lower()+value[1:]
    missing_original=[s for s in SYMBOLS if not re.search(rf'\b{re.escape(s)}\s*\(',original)]
    missing_port=[s for s in SYMBOLS if not re.search(rf'\bfunction\s+{re.escape(lower(s))}\s*\(',port)]
    if missing_original or missing_port:raise SystemExit(f'FAIL: symbol coverage original={missing_original} port={missing_port}')
    for anchor in ('#if 0','return scale * w1 + (1 - scale) * w2;','if (random() < 0.01)','InterbreedFuzzySeperator_r(fs2->child, fs2->child, fsout->child)','weightFileList[MAX_WEIGHT_FILES]'):
        if anchor not in original:raise SystemExit('FAIL: original semantic anchor missing: '+anchor)
    out=ROOT/'build/reference/ai_weight_runtime';out.mkdir(parents=True,exist_ok=True);native=out/'ai_weight_runtime_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/WX',ROOT/'tests/reference/ai_weight_runtime_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log')
    c_value=run([native],out).strip();ml_value=run([build('tests/ai_weight_runtime_oracle.ml','ai_weight_runtime_oracle.exe')],ROOT/'build').strip()
    if c_value!=ml_value:raise SystemExit('FAIL: unchanged-C differential\nC:\n'+c_value+'\nMiniLang:\n'+ml_value)
    contract=run([build('tests/ai_weight_runtime_contracts.ml','ai_weight_runtime_contracts.exe')],ROOT/'build').strip()
    if contract!='PASS: 28 complete be_ai_weight runtime contracts':raise SystemExit(contract)
    for script in ('test_ai_item_weights.py','test_ai_weapon_weights.py'):
        subprocess.run([sys.executable,ROOT/'scripts'/script],cwd=ROOT,check=True,stdout=subprocess.DEVNULL)
    print('PASS: 24 / 24 be_ai_weight symbols');print('PASS: unchanged-C evaluate/scale/range/interbreed records=4');print(contract);print('PASS: existing item/weapon weight gates=2')
    if args.data_root:
        pak=(args.data_root/'baseq3/pak0.pk3').resolve()
        if not pak.is_file():raise SystemExit('FAIL: retail pak missing: '+str(pak))
        lines=[]
        for script in ('test_ai_item_weights.py','test_ai_weapon_weights.py'):
            value=subprocess.run([sys.executable,ROOT/'scripts'/script,'--pak',pak],cwd=ROOT,check=True,capture_output=True,text=True).stdout.splitlines();lines.extend(line for line in value if 'retail' in line)
        print('PASS: retail item/weapon fuzzy-weight files=2')
        for line in lines:print(line)

if __name__=='__main__':main()
