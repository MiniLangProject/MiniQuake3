#!/usr/bin/env python3
"""Run C, MiniLang/QVM and optional retail q3dm1 map-goal probes."""
import argparse
import struct
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, msvc_env, run
STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)
def fixture():
    areas=b''.join(struct.pack('<3i9f',i,0,0,0,0,0,0,0,0,0,0,0) for i in range(2));settings=b''.join(struct.pack('<7i',0,0,6,0,0,0,0) for _ in range(2));planes=struct.pack('<4fi',1,0,0,0,0);nodes=struct.pack('<3i',0,0,0)+struct.pack('<3i',0,-1,-1);lumps=[b'',b'',planes,b'',b'',b'',b'',areas,settings,b'',nodes,b'',b'',b''];header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,4,0);offset=124
    for i,blob in enumerate(lumps): assert len(blob)%STRIDES[i]==0;struct.pack_into('<II',header,12+i*8,offset,len(blob));offset+=len(blob)
    return bytes(header)+b''.join(lumps)
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args();out=ROOT/'build/reference/ai_map_goals';out.mkdir(parents=True,exist_ok=True);native=out/'oracle.exe';aas=out/'fixture.aas';aas.write_bytes(fixture())
    run(['cl','/nologo','/O2','/MT','/W4',ROOT/'tests/reference/ai_map_goal_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');oracle=run([native],out).strip();expected='PASS: 4 native Baseq3 map-goal scenarios / 7 exact observations'
    if oracle!=expected: raise RuntimeError(oracle)
    contracts=run([build('tests/ai_map_goal_contracts.ml','ai_map_goal_contracts.exe'),aas],ROOT).strip()
    if contracts!='PASS: 10 AI map-goal contracts': raise RuntimeError(contracts)
    print(oracle);print(contracts)
    if args.pak:
      retail=run([build('tests/ai_map_goals_retail_probe.ml','ai_map_goals_retail_probe.exe'),args.pak],ROOT).strip()
      if retail!='PASS: 5 retail q3dm1 map-goal checks locations=12 camps=0': raise RuntimeError(retail)
      print(retail)
if __name__=='__main__': main()
