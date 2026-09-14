#!/usr/bin/env python3
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run

STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)

def fixture(version: int) -> bytes:
    lumps=[
        struct.pack('<ii6f',2,0,-16,-16,-24,16,16,32),
        struct.pack('<6f',1,2,3,4,5,6),
        struct.pack('<4fi',0,0,1,64,2),
        struct.pack('<4i',0,0,0,1),
        struct.pack('<i',1),
        struct.pack('<12i',0,0,0,0,0,0,0,4,1,0,0,1),
        struct.pack('<i',1),
        struct.pack('<3i9f',0,0,0,0,0,0,0,0,0,0,0,0)+struct.pack('<3i9f',1,1,0,-8,-8,-8,8,8,16,0,0,4),
        struct.pack('<14i',0,0,0,0,0,0,0,0,1,2,0,1,1,1),
        struct.pack('<3i6fiH2x',0,0,0,0,0,0,0,0,0,0,0)+struct.pack('<3i6fiH2x',1,1,1,1,2,3,4,5,6,2,5),
        struct.pack('<6i',0,0,0,0,-1,0),
        struct.pack('<5i',0,0,0,0,0),
        b'',
        struct.pack('<4i',0,0,0,0),
    ]
    assert all(len(blob)%stride==0 for blob,stride in zip(lumps,STRIDES))
    header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,version,0x12345678)
    offset=124
    for index,blob in enumerate(lumps):
        struct.pack_into('<II',header,12+index*8,offset,len(blob));offset+=len(blob)
    if version==5:
        for index in range(116): header[8+index]^=(index*119)&255
    return bytes(header)+b''.join(lumps)

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/aas';out.mkdir(parents=True,exist_ok=True)
    v4=out/'synthetic-v4.aas';v5=out/'synthetic-v5.aas';v4.write_bytes(fixture(4));v5.write_bytes(fixture(5))
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_format_contracts.ml','--output','aas_format_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/aas_format_contracts.exe',v4,v5],ROOT/'build').strip()
    if value!='PASS: 28 AAS format contracts': raise RuntimeError(value)
    print(value)
    if args.pak:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_retail_probe.ml','--output','aas_retail_probe.exe'],cwd=ROOT,check=True)
        retail=run([ROOT/'build/aas_retail_probe.exe',args.pak],ROOT/'build').strip()
        expected='PASS: retail AAS files=30 v4=4 v5=26 areas=96758 reachabilities=125731 nodes=336570 clusters=177 checksumXor=-952155974'
        if retail!=expected: raise RuntimeError(retail)
        print(retail)
    return 0

if __name__=='__main__': raise SystemExit(main())
