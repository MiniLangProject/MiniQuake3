"""Differential original server linking/trace + Pmove with dynamic entities."""
import argparse
import collections
import json
import random
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from inventory import sha
from test_collision import build_oracle
from test_spatial import to_world
from test_pmove import state_bytes,spawns,FIELDS
import pmove_fixtures

BODY=0x2000000
class Stream:
    def __init__(self):self.data=bytearray();self.ops=[];self.entities={}
    def add(self,op,data=b''):
        self.data+=struct.pack('<i',op)+data;self.ops.append(op)
    def reset(self):self.add(0);self.entities={}
    def link(self,number,origin,mins=(-16,-16,-24),maxs=(16,16,32),angles=(0,0,0),model=0,contents=BODY,owner=1023,network=None,network_angles=None):
        values=(number,int(model!=0),model,0,contents,owner,*mins,*maxs,*origin,*angles,*(origin if network is None else network),*(angles if network_angles is None else network_angles))
        self.add(1,struct.pack('<6i18f',*values));self.entities[number]=values
    def relink(self,number):self.add(1,struct.pack('<6i18f',*self.entities[number]))
    def area(self,mins,maxs,capacity=1024):self.add(3,struct.pack('<6fi',*mins,*maxs,capacity))
    def trace(self,start,end,mins=(0,0,0),maxs=(0,0,0),number=1023,mask=-1,capsule=0,direct=False):
        self.add(5 if direct else 4,struct.pack('<12f3i',*start,*end,*mins,*maxs,number,mask,capsule))
    def point(self,point,number=1023):self.add(6,struct.pack('<3fi',*point,number))

def cases(data,count,seed):
    rng=random.Random(seed);s=Stream();s.reset();origins=spawns(data)
    modeloff,modelsize=struct.unpack_from('<ii',data,8+7*8)
    bounds=[struct.unpack_from('<6f',data,modeloff+i*40) for i in range(modelsize//40)]
    base=origins[0][:];base[2]+=128
    # Equal hit fractions retain sector head order; relinking changes the winner.
    for number in (1,2,3):s.link(number,base)
    a=[base[0]-128,base[1],base[2]];b=[base[0]+128,base[1],base[2]]
    for number in (1,2,3):
        s.trace(a,b,mask=BODY);s.relink(number);s.trace(a,b,mask=BODY)
        s.trace(base,base,mask=BODY);s.point(base)
    for owner in (0,1,2,-1,1023):
        s.link(2,base,owner=owner);s.trace(a,b,number=1,mask=BODY)
    for cap in (0,1,2,3,4,1024):s.area(a,b,cap)
    s.add(2,struct.pack('<i',2));s.add(2,struct.pack('<i',2))
    s.trace(a,b,mask=BODY);s.trace(a,b,number=2,mask=0,direct=True)
    # Network/current transforms deliberately diverge for SV_PointContents.
    s.add(2,struct.pack('<i',1));s.link(3,base,network=[v+100 for v in base]);s.point(base)
    s.link(3,base);s.point(base)
    # Leaving one body then striking another must retain startsolid and the
    # later hit's entity number. Box-hull BODY contents differ from r.contents.
    s.link(1,base);s.link(2,[base[0]+64,base[1],base[2]])
    s.trace(base,b,mask=BODY);s.link(3,base,contents=1);s.trace(a,b,number=3,mask=1,direct=True)
    for number in range(4,68):
        center=rng.choice(origins);origin=[center[j]+rng.uniform(-400,400) for j in range(3)]
        if number%4==0:origin=[rng.uniform(bounds[0][j],bounds[0][j+3]) for j in range(3)]
        model=rng.randrange(1,len(bounds)) if len(bounds)>1 and number%3==0 else 0
        mins=[rng.uniform(-100,-0.1) for _ in range(3)];maxs=[rng.uniform(0.1,100) for _ in range(3)]
        if model:mins=[v-1 for v in bounds[model][:3]];maxs=[v+1 for v in bounds[model][3:]]
        s.link(number,origin,mins,maxs,angles=rng.choice([(0,0,0),(0,90,0),(35,72,-29)]),model=model,
               contents=rng.choice([1,BODY,32,0,-1]),owner=rng.choice([0,1,2,1023]))
    # Include giant bounds to exercise the 128-leaf/16-cluster link limits.
    s.link(68,(0,0,0),[v-128 for v in bounds[0][:3]],[v+128 for v in bounds[0][3:]],contents=0)
    for i in range(count):
        number=rng.randrange(1,69);ent=s.entities[number];origin=ent[12:15];angles=ent[15:18]
        center=[(ent[6+j]+ent[9+j])*0.5 for j in range(3)]
        if ent[1]:center=to_world(center,angles,origin)
        else:center=[center[j]+origin[j] for j in range(3)]
        a=[center[j]+rng.uniform(-192,192) for j in range(3)];b=[center[j]+rng.uniform(-192,192) for j in range(3)]
        if i%7==0:a=center;b=center
        if i%9==0:s.add(2,struct.pack('<i',number))
        if i%11==0:s.relink(number)
        mins,maxs=rng.choice([((0,0,0),(0,0,0)),((-15,-15,-24),(15,15,32)),((-2,-8,-3),(5,9,1))])
        mask=rng.choice([-1,1,BODY,0,32,0x2010001]);passed=rng.choice([0,1,2,number,1023])
        s.trace(a,b,mins,maxs,passed,mask,i%2)
        s.trace(a,b,mins,maxs,number,mask,i%2,direct=True)
        s.point(center,passed)
        lo=[min(a[j],b[j]) for j in range(3)];hi=[max(a[j],b[j]) for j in range(3)]
        s.area(lo,hi,rng.choice([0,1,2,16,1024]))
    # Exact sector planes and touching bounds, including zero-width queries.
    mid=[(bounds[0][j]+bounds[0][j+3])*0.5 for j in range(3)]
    for j in range(3):
        lo=list(bounds[0][:3]);hi=list(bounds[0][3:]);lo[j]=hi[j]=mid[j];s.area(lo,hi)
    # Chained original Pmove calls use SV_Trace and SV_PointContents. Entities
    # are explicitly moved/relinked by the host; no g_mover pushing is claimed.
    for scenario in range(4):
        s.reset();base=origins[scenario%len(origins)][:];base[2]+=96
        s.link(100,[base[0],base[1],base[2]-32],(-160,-160,-16),(160,160,8))
        for frame in range(128):
            offset=(frame%48-24)*1.5
            s.link(101,[base[0]+64+offset,base[1],base[2]],(-8,-96,-64),(8,96,96),owner=0 if scenario==2 else 1023)
            if scenario==3 and len(bounds)>1:
                s.link(102,[base[0]-bounds[1][0]+64,base[1]-bounds[1][1],base[2]-bounds[1][2]],
                       [v-1 for v in bounds[1][:3]],[v+1 for v in bounds[1][3:]],angles=(0,frame*2.0,0),model=1,contents=-1)
            values=dict(commandTime=1000,origin=base,gravity=800,speed=320,viewheight=26,groundEntityNum=1023,
                        stats=[100,0,2046,0,0,0,100]+[0]*9,ammo=[100]*16,weapon=2,clientNum=0)
            cmd=struct.pack('<5iB3b',1000+(frame+1)*16,0,0,0,0,2,127 if frame<96 else -127,
                            0 if scenario%2==0 else 60,127 if frame%32<4 else 0)
            s.add(7,state_bytes(values)+cmd+struct.pack('<7i',int(frame>0),scenario%2,8,0,0,0,0))
            # Explicit recorded trigger calls, interleaved with real Pmove.
            # Initial/repeated/changed pads exercise event suppression and impulse.
            if frame in (8,9,10,48,49,80):
                pad=200 if frame<48 else 201
                impulse=(400,0,399.999) if scenario%2==0 else (-100,200,650)
                s.add(8,struct.pack('<i3f',pad,*impulse))
    return s

def inspect(stream,data):
    off=0;stats=collections.Counter();pmove_ground=collections.Counter();trace_entities=collections.Counter()
    for op in stream.ops:
        count={0:125,1:30,2:30,4:14,5:14,6:1,7:166,8:117}.get(op)
        if op==3:count=1+struct.unpack_from('<i',data,off)[0]
        if op in (4,5):
            row=struct.unpack_from('<14I',data,off)
            if row[0]!=0x3f800000:stats['trace_hits']+=1;trace_entities[row[13]]+=1
            stats['startsolid']+=row[7];stats['allsolid']+=row[8]
        if op==7:
            row=struct.unpack_from('<166I',data,off);stats['pmove_commands']+=1
            pmove_ground[row[FIELDS['groundEntityNum']['offset']//4]]+=1
            stats['pmove_dynamic_touches']+=sum(0<v<1022 for v in row[133:133+row[132]])
        off+=count*4
    if off!=len(data):raise RuntimeError('Unexpected oracle output length')
    return dict(stats)|{'operations':len(stream.ops),'exact_words':off//4,'operation_histogram':dict(collections.Counter(stream.ops)),
                        'trace_hit_entities':dict(trace_entities),'pmove_ground_entities':dict(pmove_ground)}

def main():
    p=argparse.ArgumentParser();p.add_argument('data_root',type=Path);p.add_argument('--count',type=int,default=1024)
    p.add_argument('--map',action='append');p.add_argument('--no-curves',action='store_true');p.add_argument('--reuse-build',action='store_true')
    args=p.parse_args();flag='1' if args.no_curves else '0'
    output=ROOT/'build/reference/server_world'/('no_curves' if args.no_curves else 'curves');output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,server_world=True)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_world_tests.ml','--output','server_world_tests.exe'],check=True)
    records=[]
    with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
        maps=[(n,archive.read(n)) for n in sorted(archive.namelist()) if n.startswith('maps/') and n.endswith('.bsp')]
    maps.append(('fixture.bsp',bytes(pmove_fixtures.bsp())))
    for index,(name,data) in enumerate(maps):
        if args.map and Path(name).stem not in args.map:continue
        folder=output/Path(name).stem;folder.mkdir(exist_ok=True);bsp=folder/'map.bsp';bsp.write_bytes(data)
        stream=cases(data,args.count,0x535600+index);inputs=folder/'inputs.bin';inputs.write_bytes(stream.data);expected=folder/'expected.bin'
        run([output/'collision_oracle.exe',bsp,inputs,expected,flag],folder,log=folder/'oracle.log',timeout=300)
        print(name+': '+run([ROOT/'build/server_world_tests.exe',bsp,inputs,expected,flag],ROOT/'build',log=folder/'test.log',timeout=600).strip(),flush=True)
        records.append({'map':name,**inspect(stream,expected.read_bytes()),'map_sha256':sha(bsp),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected)})
    if not records:raise RuntimeError('No maps matched')
    assert sum(r.get('pmove_dynamic_touches',0) for r in records)>0
    result={'passed':True,'profile':'unmodified original sv_world.c + original Pmove/CM/BG_TouchJumpPad; explicit entity updates/trigger calls; cm_noCurves='+flag,
            **{key:sum(r[key] for r in records) for key in ('operations','exact_words','pmove_commands','pmove_dynamic_touches')},
            'maps':records,'test_sha256':sha(ROOT/'build/server_world_tests.exe'),
            'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources},
            'extracted_helpers_sha256':sha(output/'server_helpers.inc')}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
