#!/usr/bin/env python3
import argparse
from pathlib import Path
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path,required=True);args=parser.parse_args()
    source=(ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_sample.c').read_text(encoding='latin-1')
    for anchor in ('int AAS_TraceAreas','tstack_p->nodenum = 1','areas[numareas] = -nodenum','tstack_p->nodenum = aasnode->children[!side]','tstack_p->nodenum = aasnode->children[side]'):
        if anchor not in source: raise SystemExit('FAIL: missing be_aas_sample.c anchor: '+anchor)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_trace_areas_retail_probe.ml','--output','aas_trace_areas_retail_probe.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/aas_trace_areas_retail_probe.exe',args.pak.resolve()],cwd=ROOT/'build',text=True,capture_output=True,check=True,timeout=120).stdout.strip()
    if not result.startswith('PASS: 6 q3dm1 AAS TraceAreas contracts areas='): raise SystemExit(result)
    print(result+' + original source anchors')

if __name__=='__main__': main()
