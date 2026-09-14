#!/usr/bin/env python3
"""Run C and MiniLang/QVM contracts for BOTLIB_AI_PREDICT_VISIBLE_POSITION."""
import struct
import subprocess
import sys
from toolchain import ROOT, msvc_env, run

STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)
def fixture():
    areas=b''.join(struct.pack('<3i9f',i,0,0,0,0,0,0,0,0,0,0,0) for i in range(6))
    rows=[(0,0,6,0,0,0,0),(0,0,6,0,0,2,1),(0,0,6,0,0,1,3),(0,0,6,0,0,1,4),(0,0,6,0,0,0,5),(0,0,6,0,0,0,5)]
    settings=b''.join(struct.pack('<7i',*row) for row in rows)
    def reach(area,start,end,time): return struct.pack('<3i6fiH2x',area,0,0,*start,*end,2,time)
    reaches=reach(0,(0,0,0),(0,0,0),0)+reach(2,(10,0,0),(20,0,0),5)+reach(3,(0,10,0),(0,20,0),2)+reach(4,(30,0,0),(100,0,0),10)+reach(4,(10,20,0),(100,0,0),2)
    lumps=[b'',b'',b'',b'',b'',b'',b'',areas,settings,reaches,b'',b'',b'',b''];header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,4,0);offset=124
    for i,blob in enumerate(lumps): assert len(blob)%STRIDES[i]==0;struct.pack_into('<II',header,12+i*8,offset,len(blob));offset+=len(blob)
    return bytes(header)+b''.join(lumps)
def long_fixture():
    count=23;areas=b''.join(struct.pack('<3i9f',i,0,0,0,0,0,0,0,0,0,0,0) for i in range(count));rows=[(0,0,6,0,0,0,0)]
    for area in range(1,count): rows.append((0,0,6,0,0,1,area)) if area<count-1 else rows.append((0,0,6,0,0,0,count-1))
    settings=b''.join(struct.pack('<7i',*row) for row in rows)
    def reach(area): return struct.pack('<3i6fiH2x',area+1,0,0,area*10.0,0,0,(area+1)*10.0,0,0,2,1)
    reaches=struct.pack('<3i6fiH2x',0,0,0,0,0,0,0,0,0,0,0)+b''.join(reach(area) for area in range(1,count-1))
    lumps=[b'',b'',b'',b'',b'',b'',b'',areas,settings,reaches,b'',b'',b'',b''];header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,4,0);offset=124
    for i,blob in enumerate(lumps): assert len(blob)%STRIDES[i]==0;struct.pack_into('<II',header,12+i*8,offset,len(blob));offset+=len(blob)
    return bytes(header)+b''.join(lumps)
def main():
    out=ROOT/'build/reference/ai_predict_visible_position';out.mkdir(parents=True,exist_ok=True);native=out/'oracle.exe';aas=out/'routing.aas';aas.write_bytes(fixture());long_aas=out/'long.aas';long_aas.write_bytes(long_fixture())
    run(['cl','/nologo','/O2','/MT','/W4',ROOT/'tests/reference/ai_predict_visible_position_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    oracle=run([native],out,log=out/'oracle.log').strip();expected='PASS: 6 native Baseq3 visible-position scenarios / 8 exact observations'
    if oracle!=expected: raise RuntimeError(oracle)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ai_predict_visible_position_contracts.ml','--output','ai_predict_visible_position_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/ai_predict_visible_position_contracts.exe',aas,long_aas],ROOT).strip()
    if contracts!='PASS: 10 AI visible-position contracts': raise RuntimeError(contracts)
    print(oracle);print(contracts)
if __name__=='__main__': main()
