#!/usr/bin/env python3
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run

STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)

def fixture() -> bytes:
    areas=b''.join(struct.pack('<3i9f',i,0,0,0,0,0,0,0,0,0,0,0) for i in range(6))
    rows=[(0,0,6,0,0,0,0),(0,0,6,0,0,2,1),(0,0,6,0,0,1,3),(0,0,6,0,0,1,4),(0,0,6,0,0,0,5),(0,0,6,0,0,0,5)]
    settings=b''.join(struct.pack('<7i',*row) for row in rows)
    def reach(area:int,travel_type:int,travel_time:int)->bytes:
        return struct.pack('<3i6fiH2x',area,0,0,0,0,0,0,0,0,travel_type,travel_time)
    reaches=reach(0,0,0)+reach(2,2,10)+reach(3,2,2)+reach(4,2,2)+reach(4,12,1)
    lumps=[b'',b'',b'',b'',b'',b'',b'',areas,settings,reaches,b'',b'',b'',b'']
    assert all(len(blob)%stride==0 for blob,stride in zip(lumps,STRIDES))
    header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,4,0)
    offset=124
    for index,blob in enumerate(lumps):struct.pack_into('<II',header,12+index*8,offset,len(blob));offset+=len(blob)
    return bytes(header)+b''.join(lumps)

def build(source:str,output:str)->Path:
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main()->int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    generated=ROOT/'build/reference/aas/routing.aas';generated.parent.mkdir(parents=True,exist_ok=True);generated.write_bytes(fixture())
    value=run([build('tests/aas_routing_contracts.ml','aas_routing_contracts.exe'),generated],ROOT/'build').strip()
    if value!='PASS: 13 AAS weighted routing contracts':raise RuntimeError(value)
    print(value)
    if args.pak:
        value=run([build('tests/aas_routing_retail_probe.ml','aas_routing_retail_probe.exe'),args.pak],ROOT/'build').strip()
        expected='PASS: q3dm1 weighted routes checks=6 forward=54/2 reverse=51/21 walk=118 rocket=302'
        if value!=expected:raise RuntimeError(value)
        print(value)
    return 0

if __name__=='__main__':raise SystemExit(main())
