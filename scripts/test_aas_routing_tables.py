#!/usr/bin/env python3
"""Run original reverse-reachability and portal-max table contracts."""
import argparse,struct,subprocess,sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run
STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)
def fixture():
    areas=b''.join(struct.pack('<3i9f',i,0,0,0,0,0,0,0,0,0,0,0) for i in range(4));rows=[(0,0,6,0,0,0,0),(0,0,6,1,0,2,1),(0,0,6,-1,0,2,3),(0,0,6,2,0,0,5)];settings=b''.join(struct.pack('<7i',*r) for r in rows)
    def reach(area,start,end):return struct.pack('<3i6fiH2x',area,0,0,*start,*end,2,1)
    reaches=reach(0,(0,0,0),(0,0,0))+reach(2,(0,0,0),(10,0,0))+reach(2,(0,0,0),(30,0,0))+reach(3,(0,0,0),(0,0,0))+reach(3,(100,0,0),(0,0,0))
    portals=struct.pack('<5i',0,0,0,0,0)+struct.pack('<5i',2,1,2,1,0);portalindex=struct.pack('<2i',1,1);clusters=struct.pack('<4i',0,0,0,0)+struct.pack('<4i',2,2,1,0)+struct.pack('<4i',2,2,1,1)
    lumps=[b'',b'',b'',b'',b'',b'',b'',areas,settings,reaches,b'',portals,portalindex,clusters];header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,4,0);offset=124
    for i,blob in enumerate(lumps):assert len(blob)%STRIDES[i]==0;struct.pack_into('<II',header,12+i*8,offset,len(blob));offset+=len(blob)
    return bytes(header)+b''.join(lumps)
def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args();out=ROOT/'build/reference/aas_routing_tables';out.mkdir(parents=True,exist_ok=True);fixture_path=out/'tables.aas';fixture_path.write_bytes(fixture());native=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4',ROOT/'tests/reference/aas_routing_tables_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');oracle=run([native],out).strip();expected='PASS: 4 native Baseq3 reverse/portal-table scenarios / 6 exact observations'
    if oracle!=expected:raise RuntimeError(oracle)
    contracts=run([build('tests/aas_routing_tables_contracts.ml','aas_routing_tables_contracts.exe'),fixture_path],ROOT).strip()
    if contracts!='PASS: 8 AAS reverse/portal table contracts':raise RuntimeError(contracts)
    print(oracle);print(contracts)
    if args.pak:
      retail=run([build('tests/aas_routing_tables_retail_probe.ml','aas_routing_tables_retail_probe.exe'),args.pak],ROOT).strip()
      if not retail.startswith('PASS: 5 retail q3dm7 reverse/portal tables links='):raise RuntimeError(retail)
      print(retail)
if __name__=='__main__':main()
