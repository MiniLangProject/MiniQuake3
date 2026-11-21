"""CM_TransformedBoxTrace/PointContents, shared temp boxes and model bounds."""
import argparse
import json
import math
import random
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from inventory import sha

def to_world(point,angles,origin):
    # Only target generation; neither implementation uses these approximations.
    pitch,yaw,roll=map(math.radians,angles)
    sp,cp=math.sin(pitch),math.cos(pitch);sy,cy=math.sin(yaw),math.cos(yaw);sr,cr=math.sin(roll),math.cos(roll)
    axes=[[cp*cy,cp*sy,-sp],[sr*sp*cy-cr*sy,sr*sp*sy+cr*cy,sr*cp],[cr*sp*cy+sr*sy,cr*sp*sy-sr*cy,cr*cp]]
    return [sum(axes[j][i]*point[j] for j in range(3))+origin[i] for i in range(3)]

def cases(data,count,seed):
    rng=random.Random(seed);modeloff,size=struct.unpack_from('<ii',data,8+7*8);num=size//40
    leafoff,leafsize=struct.unpack_from('<ii',data,8+4*8);result=[]
    for i in range(count):
        kind=i%6;model=rng.randrange(num)
        bounds=struct.unpack_from('<6f',data,modeloff+model*40)
        if model==0 and i%4:bounds=struct.unpack_from('<6i',data,leafoff+rng.randrange(leafsize//48)*48+8)
        tempmins=[rng.uniform(-64,-1) for _ in range(3)];tempmaxs=[rng.uniform(1,64) for _ in range(3)]
        if kind in (1,2,3):bounds=tempmins+tempmaxs
        origin=[rng.uniform(-512,512) for _ in range(3)]
        angles=rng.choice([[0,0,0],[0,90,0],[90,0,0],[0,0,90],[rng.uniform(-360,360) for _ in range(3)]])
        start=[rng.uniform(bounds[j]-40,bounds[j+3]+40) for j in range(3)]
        finish=[rng.uniform(bounds[j]-40,bounds[j+3]+40) for j in range(3)]
        if i%7==0:finish=start[:]
        if kind not in (2,3,4):
            rotation=[0,0,0] if kind==1 else angles
            start=to_world(start,rotation,origin);finish=to_world(finish,rotation,origin)
        else:origin=[0,0,0]
        mins,maxs=rng.choice([([-15,-15,-24],[15,15,32]),([0,0,0],[0,0,0]),([-2,-8,-3],[5,9,1]),([-20,-20,-40],[20,20,40])])
        mask=rng.choice([-1,0x2010001,0x2000000,1,0,0x38])
        # kind==1 otherwise shares the same odd parity as its capsule flag.
        capsule=(i//6)%2 if kind==1 else i%2
        result.append(struct.pack('<24f4i',*start,*finish,*mins,*maxs,*origin,*angles,*tempmins,*tempmaxs,model,mask,capsule,kind))
    return b''.join(result)

def main():
    p=argparse.ArgumentParser();p.add_argument('data_root',type=Path);p.add_argument('--count',type=int,default=2048)
    p.add_argument('--map',action='append');p.add_argument('--no-curves',action='store_true');p.add_argument('--reuse-build',action='store_true')
    args=p.parse_args();flag='1' if args.no_curves else '0'
    output=ROOT/'build/reference/spatial'/('no_curves' if args.no_curves else 'curves');output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,spatial=True)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spatial_tests.ml','--output','spatial_tests.exe'],check=True)
    records=[]
    with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
        for j,name in enumerate(sorted(n for n in archive.namelist() if n.startswith('maps/') and n.endswith('.bsp'))):
            if args.map and Path(name).stem not in args.map:continue
            folder=output/Path(name).stem;folder.mkdir(exist_ok=True)
            bsp=folder/'map.bsp';bsp.write_bytes(archive.read(name))
            inputs=folder/'inputs.bin';inputs.write_bytes(cases(bsp.read_bytes(),args.count,0x351000+j))
            expected=folder/'expected.bin';run([output/'collision_oracle.exe',bsp,inputs,expected,flag],folder,log=folder/'oracle.log')
            print(name+': '+run([ROOT/'build/spatial_tests.exe',bsp,inputs,expected,flag],ROOT/'build',log=folder/'test.log',timeout=600).strip(),flush=True)
            rejection=subprocess.run([str(output/'collision_oracle.exe'),'--capsule-rejection',str(bsp)],capture_output=True,text=True)
            if rejection.returncode!=41 or not rejection.stderr.startswith('CM_ClipHandleToModel: bad handle') or '254' not in rejection.stderr:raise RuntimeError('Unexpected original capsule-handle outcome: '+rejection.stderr)
            rows=list(struct.iter_unpack('<24I',expected.read_bytes()))
            records.append({'map':name,'cases':args.count,'hits':sum(r[0]!=0x3f800000 for r in rows),
                            'capsule_rejection_code':rejection.returncode,'capsule_rejection':rejection.stderr,
                            'map_sha256':sha(bsp),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected)})
    if not records:raise RuntimeError('No maps matched')
    result={'passed':True,'profile':'original transformed world/inline models, shared temporary boxes; cm_noCurves='+flag,
            'cases':sum(r['cases'] for r in records),'exact_fields':sum(r['cases'] for r in records)*24,'maps':records,
            'test_sha256':sha(ROOT/'build/spatial_tests.exe'),'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
