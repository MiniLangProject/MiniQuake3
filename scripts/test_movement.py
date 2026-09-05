"""Shared movement kernels against original C, using original map collision."""
import argparse
import json
import math
import random
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from inventory import sha

def cases(data,count,seed):
    rng=random.Random(seed)
    entities,size=struct.unpack_from("<ii",data,8)
    origins=[]
    for block in data[entities:entities+size].decode("ascii",errors="replace").split("}"):
        if '"info_player_deathmatch"' not in block: continue
        match=re.search(r'"origin"\s+"([^"]+)"',block)
        if match: origins.append(list(map(float,match[1].split())))
    if not origins: origins=[[0,0,128]]
    result=[]
    for i in range(count):
        mode=i%9 if i<count//2 else 8
        chain=int(i>=count//2 and i%64!=0 and i!=count//2)
        origin=[v+rng.uniform(-80,80) for v in rng.choice(origins)]
        velocity=[rng.uniform(-600,600) for _ in range(3)]
        if i%29==0: velocity=[0,0,0]
        if i%31==0: velocity=[0.1,-0.2,0.7]
        normal=rng.choice([[0,0,1],[1,0,0],[0,1,0],[0.6,0,0.8],[0,-0.6,0.8]])
        angle=rng.uniform(-math.pi,math.pi);wishdir=[math.cos(angle),math.sin(angle),0]
        integers=[mode,int(i%3!=0),rng.choice([0,400,800,1200]),int(i%11==0)*100,int(i%2==0),int(i%3==0),2 if i%7==0 else 0,
                  i%4,64 if i%5==0 else 0,int(i%11==0),2 if i%13==0 else 0,rng.choice([100,320,400])]
        floats=[rng.choice([0.001,0.008,0.016,0.05,0.066,0.2]),*origin,*velocity,*normal,*wishdir,rng.uniform(0,500),rng.choice([1,4,8,10]),rng.choice([1,1.001,1.5])]
        command=[rng.randrange(128),rng.randrange(-127,128),rng.randrange(-127,128),chain]
        result.append(struct.pack("<12i16f4i",*integers,*floats,*command))
    return b"".join(result)

def main():
    p=argparse.ArgumentParser();p.add_argument("data_root",type=Path)
    p.add_argument("--map",action="append");p.add_argument("--count",type=int,default=2048)
    p.add_argument("--no-curves",action="store_true")
    args=p.parse_args();no_curves="1" if args.no_curves else "0"
    output=ROOT / "build/reference/movement" / ("no_curves" if args.no_curves else "curves");output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,movement=True)
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/movement_tests.ml","--output","movement_tests.exe"],check=True)
    records=[]
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        names=args.map or ["q3dm1","q3dm6","q3dm17","q3tourney2"]
        for index,name in enumerate(names):
            data=archive.read("maps/"+name+".bsp");folder=output / name;folder.mkdir(exist_ok=True)
            bsp=folder / "map.bsp";bsp.write_bytes(data)
            inputs=folder / "inputs.bin";inputs.write_bytes(cases(data,args.count,0x506800+index))
            expected=folder / "expected.bin"
            run([output / "collision_oracle.exe",bsp,inputs,expected,no_curves],folder,log=folder / "oracle.log")
            print(name+": "+run([ROOT / "build/movement_tests.exe",bsp,inputs,expected,no_curves],ROOT / "build",log=folder / "test.log",timeout=300).strip(),flush=True)
            rows=list(struct.iter_unpack("<47I",expected.read_bytes()))
            queries=list(struct.iter_unpack("<12i16f4i",inputs.read_bytes()))
            steps=sum(row[42]-(rows[j-1][42] if queries[j][-1] else 0)
                      for j,row in enumerate(rows) if queries[j][0] in (5,8))
            records.append({"map":name,"operations":args.count,"generated_step_events":steps,
                            "bsp_sha256":sha(bsp),"input_sha256":sha(inputs),"expected_sha256":sha(expected)})
    result={"passed":True,"profile":"original shared movement kernels; cm_noCurves="+no_curves+" world traces; independent inputs and chained 64-frame sequences",
            "maps":records,"operations":len(records)*args.count,"exact_fields":len(records)*args.count*47,
            "original_sources":{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output / "result.json").write_text(json.dumps(result,indent=2)+"\n")
if __name__=="__main__":main()
