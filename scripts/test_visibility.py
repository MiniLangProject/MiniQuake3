"""All PVS bytes, leaf/brush queries and stateful portal operations vs original C."""
import argparse
import json
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
from test_rejections import tiny_bsp

def fixture(vised=True):
    original=tiny_bsp();lumps=[]
    for i in range(17):
        off,size=struct.unpack_from('<ii',original,8+i*8);lumps.append(original[off:off+size])
    # 10 areas, deliberately disconnected from the number of clusters. Padding
    # bits and the invalid-cluster first-row fallback are observable.
    clusters=[-1]+list(range(9));leaves=[]
    for i,cluster in enumerate(clusters):leaves.append(struct.pack('<12i',cluster,i,-16,-16,-16,16,16,16,0,0,0,1))
    lumps[4]=b''.join(leaves)
    # Nine internal split nodes, with all ten leaves addressable.
    lumps[3]=b''.join(struct.pack('<9i',1,-1-i,(i+1 if i<8 else -10),-16,-16,-16,16,16,16) for i in range(9))
    lumps[16]=struct.pack('<ii',9,4)+bytes((i*37+5)&255 for i in range(36)) if vised else b''
    header=bytearray(struct.pack('<ii',0x50534249,46)+bytes(136));offset=144
    for i,data in enumerate(lumps):struct.pack_into('<ii',header,8+i*8,offset,len(data));offset+=len(data)
    return header+b''.join(lumps)

def cases(data,seed,count):
    rng=random.Random(seed);off,size=struct.unpack_from('<ii',data,8+4*8)
    leaves=[struct.unpack_from('<12i',data,off+i*48) for i in range(size//48)]
    areas=max(v[1] for v in leaves)+1;boxes=[]
    for i in range(count):
        leaf=rng.choice(leaves);mins=list(leaf[2:5]);maxs=list(leaf[5:8])
        if i%5:
            center=[rng.uniform(mins[j],maxs[j]) for j in range(3)];radius=rng.choice([0,1,15,32,100,1000])
            mins=[v-radius for v in center];maxs=[v+radius for v in center]
        boxes.append(struct.pack('<6fi',*mins,*maxs,[0,1,2,4,16,64][i%6]))
    portals=[];refs=[[0]*areas for _ in range(areas)]
    def operation(a,b,opened,op=1,index=0):
        if op and a>=0 and b>=0:
            refs[a][b]+=1 if opened else -1;refs[b][a]+=1 if opened else -1
            assert refs[a][b]>=0
        noareas=int(index%17==0);view=rng.randrange(areas) if index%7 else -1
        qa,qb=rng.randrange(areas),rng.randrange(areas)
        if index%13==0:qa=-1
        if noareas and index%2:qa=999;view=999
        bits=bytes([rng.randrange(256) if index%3 else 0 for _ in range(32)])
        portals.append(struct.pack('<8i32s',op,a,b,int(opened),view,qa,qb,noareas,bits))
    # A ring, duplicate references, closing one of two references, and partitioning.
    for a in range(areas):operation(a,(a+1)%areas,True,index=len(portals));operation(a,(a+1)%areas,True,index=len(portals))
    for a in range(areas):operation(a,(a+1)%areas,False,index=len(portals));operation(a,(a+1)%areas,False,index=len(portals))
    for i in range(count):
        a,b=rng.randrange(areas),rng.randrange(areas);opened=refs[a][b]==0 or rng.randrange(2)==0
        if i%19==0:a=-1
        operation(a,b,opened,index=len(portals))
    return struct.pack('<ii',len(boxes),len(portals))+b''.join(boxes)+b''.join(portals)

def main():
    p=argparse.ArgumentParser();p.add_argument('data_root',type=Path,nargs='?');p.add_argument('--map',action='append');p.add_argument('--count',type=int,default=512)
    p.add_argument('--reuse-build',action='store_true');args=p.parse_args()
    output=ROOT/'build/reference/visibility';output.mkdir(parents=True,exist_ok=True);sources=build_oracle(output,visibility=True)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/visibility_tests.ml','--output','visibility_tests.exe'],check=True)
    maps={'fixture_pvs':fixture(True),'fixture_no_pvs':fixture(False)}
    if args.data_root:
        with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
            maps.update({Path(n).stem:archive.read(n) for n in sorted(archive.namelist()) if n.startswith('maps/') and n.endswith('.bsp') and (not args.map or Path(n).stem in args.map)})
    records=[]
    for i,(name,data) in enumerate(maps.items()):
        folder=output/name;folder.mkdir(exist_ok=True);bsp=folder/'map.bsp';bsp.write_bytes(data)
        inputs=folder/'inputs.bin';inputs.write_bytes(cases(data,0x351100+i,args.count));expected=folder/'expected.bin'
        run([output/'collision_oracle.exe',bsp,inputs,expected],folder,log=folder/'oracle.log')
        result=run([ROOT/'build/visibility_tests.exe',bsp,inputs,expected],ROOT/'build',log=folder/'test.log',timeout=600).strip();print(name+': '+result,flush=True)
        words,bytecount=map(int,re.search(r'PASS: (\d+) .* words and (\d+) ',result).groups())
        boxes,portals=struct.unpack_from('<ii',inputs.read_bytes())
        records.append({'map':name,'words':words,'bytes':bytecount,'box_queries':boxes,'portal_operations':portals,
                        'map_sha256':sha(bsp),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected)})
    result={'passed':True,'scope':'all cluster PVS rows, leaf/brush lists, bounds, area connectivity/reference counts and area-bit unions',
            'exact_words':sum(r['words'] for r in records),'exact_bytes':sum(r['bytes'] for r in records),'maps':records,
            'test_sha256':sha(ROOT/'build/visibility_tests.exe'),'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
