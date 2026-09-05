"""Original trigger discovery, teleport ordering and entity lifetime on BSP maps."""
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
from transition_oracle import build
from test_entitystate import entity_bytes
from test_pmove import state_bytes,spawns,FIELDS
import pmove_fixtures

TRIGGER=0x40000000;BODY=0x2000000
class Stream:
    def __init__(self):self.data=bytearray();self.ops=[]
    def add(self,op,data=b''):self.data+=struct.pack('<i',op)+data;self.ops.append(op)
    def reset(self,seed=1,time=1000):self.add(0,struct.pack('<2i',seed,time))
    def config(self,number,origin=(0,0,0),mins=(-15,-15,-24),maxs=(15,15,32),angles=(0,0,0),
               client=False,team=0,touch=0,model=0,contents=0,flags=0,owner=1023,link=True,never=False,spawnflags=0,target='',targetname='',s=None,ps=None,cmd=(0,0,0)):
        state=dict(number=number,origin=origin,angles=angles,clientNum=number if client else 0);state.update(s or {})
        player=dict(clientNum=number,origin=origin,gravity=800,speed=320,viewheight=26,groundEntityNum=1023,weapon=2,
                    stats=[100,0,2046,0,0,0,100]+[0]*9,ammo=[100]*16,commandTime=1000);player.update(ps or {})
        self.add(1,struct.pack('<11i',number,int(client),team,touch,int(model!=0),contents,flags,owner,int(link),int(never),spawnflags)
                 +entity_bytes(state|{'modelindex':model})+state_bytes(player)+struct.pack('<12f3i32s32s',*mins,*maxs,*origin,*angles,*cmd,target.encode(),targetname.encode()))
    def touch(self,number=0):self.add(3,struct.pack('<i',number))
    def teleport(self,origin,angles=(0,0,0),number=0):self.add(2,struct.pack('<i6f',number,*origin,*angles))
    def move(self,time,f=0,r=0,u=0,fixed=0):self.add(4,struct.pack('<i5iB3b2i',0,time,0,0,0,0,2,f,r,u,fixed,8))

def cases(data,seed):
    rng=random.Random(seed);stream=Stream();stream.reset(seed)
    for _ in range(1024):stream.add(11)
    # Native G_PickTarget first-32 cap, case folding, misses and RNG consumption.
    for i in range(40):stream.config(64+i,targetname='MiXeD' if i%2 else 'mixed',link=False)
    for name in ['mixed','MIXED','missing','']*16:stream.add(10,struct.pack('<32s',name.encode()))
    # Reuse grace period, growth, neverFree and resetting the game/shared fields.
    stream.reset(seed)
    stream.add(8);stream.add(8);stream.add(7,struct.pack('<i',4001));stream.add(6,struct.pack('<i',64));stream.add(8)
    stream.add(7,struct.pack('<i',5001));stream.add(8)
    stream.config(65,never=True);stream.add(6,struct.pack('<i',65));stream.add(8)
    origins=spawns(data);base=origins[0][:];base[2]+=96
    modeloff,modelsize=struct.unpack_from('<ii',data,8+7*8);bounds=[struct.unpack_from('<6f',data,modeloff+i*40) for i in range(modelsize//40)]
    # Direct teleports: observe event entities, view deltas, kill-box selection
    # and player unlink/link order. G_Damage itself is a recorded boundary.
    for i in range(32):
        stream.reset(seed+i);origin=[base[j]+rng.uniform(-30,30) for j in range(3)];dest=[base[j]+rng.uniform(-256,256) for j in range(3)]
        team=3 if i%4==0 else i%3
        stream.config(0,origin,client=True,team=team,contents=BODY,cmd=(1001,-222,33333),
                      ps=dict(pm_type=i%7,eFlags=i,eventSequence=5,entityEventSequence=1,events=[13,14],eventParms=[1,0]),s=dict(eType=1,clientNum=7))
        stream.config(1,[dest[0],dest[1],dest[2]+1],client=True,contents=BODY,s=dict(eType=1))
        stream.config(64,dest,contents=BODY) # a non-client must not receive telefrag damage
        angles=rng.choice([(0,0,0),(0,90,0),(30.125,-27.5,17.25),(-90,180,0)])
        stream.teleport(dest,angles);stream.teleport(dest,angles)
    # Trigger filters, both contact branches and bot callback ordering.
    for profile in range(16):
        stream.reset(seed+profile);team=3 if profile%4==0 else 0
        stats=[100,0,2046,0,0,0,100]+[0]*9
        if profile==14:stats[0]=0
        powers=[0]*16
        if profile==13:powers[6]=1
        stream.config(0,base,client=profile!=15,team=team,contents=BODY,flags=8 if profile%2 else 0,touch=3 if profile%3 else 0,
                      ps=dict(pm_type=3 if profile==12 else 2 if team==3 else 0,stats=stats,powerups=powers,jumppad_ent=999,jumppad_frame=5,pmove_framecount=6),s=dict(eType=1))
        stream.config(64,base,contents=TRIGGER,touch=1,s=dict(eType=8,origin2=(250,0,500))) # ET_PUSH_TRIGGER
        stream.config(65,base,contents=TRIGGER,touch=3,s=dict(eType=2,**{'pos.trBase':base})) # ET_ITEM
        stream.config(66,base,contents=TRIGGER,touch=4,s=dict(eType=0)) # spectator door exception
        stream.config(67,base,contents=0,touch=3)
        stream.config(68,[base[0]+80,base[1],base[2]],contents=TRIGGER,touch=3)
        if profile%2 or profile in (4,8,12):
            stream.config(69,[base[0]+300,base[1],base[2]],targetname='destination',link=False,s=dict(angles=(0,90,0)))
            stream.config(70,base,contents=TRIGGER,touch=2,spawnflags=1 if profile%3==0 or profile==4 else 0,target='destination',s=dict(eType=9))
        stream.touch();stream.touch()
    # Real inline BSP brush contacts with asymmetric world-space bounds and rotation.
    stream.reset(seed)
    for i in range(128):
        model=(i%(len(bounds)-1)+1) if len(bounds)>1 else 0
        lo=[-32,-32,-32];hi=[32,32,32]
        if model:lo=[v-1 for v in bounds[model][:3]];hi=[v+1 for v in bounds[model][3:]]
        origin=[rng.uniform(-100,100) for _ in range(3)];angles=rng.choice([(0,0,0),(0,90,0),(31,75,-20)])
        stream.config(64,origin,lo,hi,angles,model=model,contents=TRIGGER,touch=1,s=dict(eType=8,origin2=(300,0,600)))
        middle=[(lo[j]+hi[j])*0.5+origin[j] for j in range(3)]
        a=[middle[j]-rng.uniform(0,64) for j in range(3)];b=[middle[j]+rng.uniform(0,64) for j in range(3)]
        stream.add(12,struct.pack('<6f2i',*a,*b,64,i%2))
    # Pmove -> current collision bounds -> snapshot -> link -> G_TouchTriggers.
    # Push triggers are found geometrically, not delivered by a scripted touch.
    for scenario in range(4):
        stream.reset(seed+scenario);origin=base[:]
        stream.config(0,origin,client=True,contents=BODY,s=dict(eType=1))
        stream.config(64,[origin[0],origin[1],origin[2]-32],(-256,-256,-16),(256,256,8),contents=BODY)
        stream.config(65,origin,(-32,-32,-32),(32,32,32),contents=TRIGGER,touch=1,s=dict(eType=8,origin2=(300,0,500)))
        stream.config(66,[origin[0]+100,origin[1],origin[2]+10],(-16,-80,-80),(16,80,200),contents=TRIGGER,touch=2,target='exit',s=dict(eType=9))
        stream.config(67,[origin[0]+300,origin[1],origin[2]+1],link=False,targetname='exit',s=dict(angles=(0,180,0)))
        for frame in range(64):
            time=1000+(frame+1)*16;stream.add(7,struct.pack('<i',time));stream.move(time,127 if scenario%2 else 0,0,0,scenario//2)
        stream.teleport(origin);stream.touch()
    return stream

def inspect(stream,data):
    off=0;counts=collections.Counter();pad_reset=0;pad_active=0
    primary={0:1,1:226,2:226,3:226,4:226,5:226,6:226,7:1,8:228,9:226,10:1,11:1,12:1}
    for op in stream.ops:
        size=struct.unpack_from('<i',data,off)[0];off+=4;row=struct.unpack_from('<'+'I'*size,data,off);off+=size*4
        extra=primary[op];logs=row[extra]
        for i in range(logs):counts[row[extra+1+i*12]]+=1
        if op==4:
            pad=row[54+FIELDS['jumppad_ent']['offset']//4]
            pad_active+=pad!=0;pad_reset+=pad==0
    if off!=len(data):raise RuntimeError('Unexpected record size')
    return {'operations':len(stream.ops),'exact_words':len(data)//4,'operation_histogram':dict(collections.Counter(stream.ops)),
            'callback_histogram':dict(counts),'pmove_pad_active_frames':pad_active,'pmove_pad_clear_frames':pad_reset}

def main():
    p=argparse.ArgumentParser();p.add_argument('data_root',type=Path);p.add_argument('--map',action='append');p.add_argument('--no-curves',action='store_true');p.add_argument('--reuse-build',action='store_true')
    args=p.parse_args();flag='1' if args.no_curves else '0';output=ROOT/'build/reference/transitions'/('no_curves' if args.no_curves else 'curves');output.mkdir(parents=True,exist_ok=True)
    sources=build(output)
    for recent in (0,1):
        rejected=subprocess.run([str(output/'transition_oracle.exe'),'--spawn-exhaustion',str(recent)],capture_output=True,text=True)
        if rejected.returncode!=72 or rejected.stderr!='G_Error: G_Spawn: no free entities':raise RuntimeError('Unexpected exhausted-spawn result: '+rejected.stderr)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/transition_tests.ml','--output','transition_tests.exe'],check=True)
    with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
        maps=[(n,archive.read(n)) for n in sorted(archive.namelist()) if n.startswith('maps/') and n.endswith('.bsp')]
    maps.append(('fixture.bsp',bytes(pmove_fixtures.bsp())));records=[]
    for index,(name,data) in enumerate(maps):
        if args.map and Path(name).stem not in args.map:continue
        folder=output/Path(name).stem;folder.mkdir(exist_ok=True);bsp=folder/'map.bsp';bsp.write_bytes(data)
        stream=cases(data,0x474100+index);inputs=folder/'inputs.bin';inputs.write_bytes(stream.data);expected=folder/'expected.bin'
        run([output/'transition_oracle.exe',bsp,inputs,expected,flag],folder,log=folder/'oracle.log',timeout=300)
        print(name+': '+run([ROOT/'build/transition_tests.exe',bsp,inputs,expected,flag],ROOT/'build',log=folder/'test.log',timeout=600).strip(),flush=True)
        record={'map':name,**inspect(stream,expected.read_bytes()),'map_sha256':sha(bsp),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected)};records.append(record)
    if not records:raise RuntimeError('No maps matched')
    assert sum(r['callback_histogram'].get(4,0) for r in records)>0
    assert sum(r['pmove_pad_active_frames'] for r in records)>0 and sum(r['pmove_pad_clear_frames'] for r in records)>0
    result={'passed':True,'profile':'original native G_TouchTriggers/TeleportPlayer/lifecycle + original SV/CM/Pmove; cm_noCurves='+flag,
            'scope_boundary':'G_Damage recorded only; no damage/death/scoring rules or full ClientThink/serverframe acceptance',
            'operations':sum(r['operations'] for r in records),'exact_words':sum(r['exact_words'] for r in records),'maps':records,
            'original_spawn_rejections':2,'allocator_client_contracts':5,
            'test_sha256':sha(ROOT/'build/transition_tests.exe'),'extracted_functions_sha256':sha(output/'game_functions.inc'),
            'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
