"""Full baseq3 Pmove differential tests, including the complete 468-byte state."""
import argparse
import collections
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
import pmove_fixtures

SCHEMA=json.loads((ROOT/'docs/reference/playerstate.json').read_text())
FIELDS={f['name']:f for f in SCHEMA['fields']}

def state_bytes(values):
    data=bytearray(SCHEMA['size'])
    for name,value in values.items():
        field=FIELDS[name];count=field['count']
        values=value if count>1 else [value]
        struct.pack_into('<'+('f' if field['type']=='float' else 'i')*count,data,field['offset'],*values)
    return data

def spawns(data):
    offset,size=struct.unpack_from('<ii',data,8)
    origins=[]
    for block in data[offset:offset+size].decode('ascii',errors='replace').split('}'):
        if '"info_player_deathmatch"' not in block:continue
        match=re.search(r'"origin"\s+"([^"]+)"',block)
        if match:origins.append(list(map(float,match[1].split())))
    return origins or [[0,0,128]]

def cases(data,count,seed):
    rng=random.Random(seed);origins=spawns(data);result=[];clock=0
    for i in range(count):
        independent=i<count//2
        chain=int(not independent and i!=count//2 and i%64!=0)
        profile=(i if independent else i//64)%24
        origin=rng.choice(origins)[:]
        if independent:
            origin=[v+rng.uniform(-60,60) for v in origin]
            origin[2]+=rng.choice([0,0,0,128,256,512])
        velocity=[rng.uniform(-400,400),rng.uniform(-400,400),rng.uniform(-600,400)] if independent else [0,0,0]
        stats=[0]*16;stats[0]=rng.choice([100,100,100,25,124,125,150]);stats[2]=2046;stats[6]=100
        stats[1]=rng.choice([0,26,27]) # none, teleporter, medkit
        stats[3]=rng.randrange(101)
        ammo=[rng.choice([-1,0,1,5,50]) for _ in range(16)]
        powerups=[0]*16
        if profile==8:powerups[6]=10000
        if profile==9:powerups[3]=10000
        if profile==10:powerups[14]=10000
        pmtype=[0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,0,0,0,0,0,0][profile]
        if pmtype==3:stats[0]=-10
        flags=[0,0,1,2,8,16,32,64,0,0,16384,512,0,0,0,0,0,0,1024,2048,256,0,0,0][profile]
        if not chain:clock=1000
        values=dict(commandTime=1000,pm_type=pmtype,pm_flags=flags,pm_time=150 if flags&(32|64|256) else 0,
                    origin=origin,velocity=velocity,gravity=rng.choice([400,800,800,1200]),speed=rng.choice([200,320,400]),
                    groundEntityNum=rng.choice([1022,1023]),viewheight=26,stats=stats,ammo=ammo,powerups=powerups,
                    weapon=rng.randrange(1,11),weaponstate=rng.randrange(4),weaponTime=rng.choice([0,0,50,200,1500]),
                    delta_angles=[rng.randrange(-32768,32768) for _ in range(3)],
                    viewangles=[rng.uniform(-180,180) for _ in range(3)],
                    grapplePoint=[origin[0]+80,origin[1]-160,origin[2]+100],
                    bobCycle=rng.randrange(256),legsAnim=rng.randrange(25),torsoAnim=rng.randrange(6,13),
                    legsTimer=rng.choice([0,0,130]),torsoTimer=rng.choice([0,0,200]),
                    eventSequence=rng.randrange(8),events=[70,71],eventParms=[99,100],clientNum=7,
                    externalEvent=123,externalEventParm=321,externalEventTime=5555,generic1=42,ping=37,
                    jumppad_ent=312,jumppad_frame=123,pmove_framecount=63,entityEventSequence=17,
                    damageEvent=4,damageYaw=5,damagePitch=6,damageCount=7,loopSound=1234)
        if profile==23:values['persistant']=[0,0,0,3]+[0]*12
        step=rng.choice([1,8,16,33,66,100,200]) if independent else rng.choice([8,16,33])
        if independent and i%31==0:step=rng.choice([-100,0,1001,2000])
        clock+=step
        # Coherent 8-command bursts, including jumping, crouching, walking and talk.
        phase=(i//8)%8
        f=rng.choice([-127,-64,0,64,127]) if independent else [127,127,127,0,-127,64,0,127][phase]
        r=rng.choice([-127,-64,0,64,127]) if independent else [0,-127,127,127,0,64,0,0][phase]
        u=rng.choice([-127,0,0,0,20,127]) if independent else [0,20,20,0,-127,0,0,0][phase]
        buttons=rng.choice([0,1,1,4,8,16,17,2,3,0]) if independent else [1,1,0,8,0,16,2,4][phase]
        angles=[rng.randrange(-65536,65536) for _ in range(3)] if independent else [0,(i*233)&65535,0]
        cmd=struct.pack('<5iB3b',clock,*angles,buttons,rng.randrange(1,11) if independent else 1+((i//24)%10),f,r,u)
        opts=struct.pack('<7i',chain,int(i%3==0),rng.choice([8,16,33]),int(i%2==0),int(i%5==0),int(independent and i%7==0),0)
        result.append(state_bytes(values)+cmd+opts)
    return b''.join(result)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('data_root',type=Path)
    parser.add_argument('--map',action='append');parser.add_argument('--count',type=int,default=4096)
    parser.add_argument('--no-curves',action='store_true');parser.add_argument('--reuse-build',action='store_true')
    parser.add_argument('--fixture-only',action='store_true')
    args=parser.parse_args();profile='no_curves' if args.no_curves else 'curves';flag='1' if args.no_curves else '0'
    output=ROOT/'build/reference/pmove'/profile;output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,pmove=True)
    if not args.reuse_build:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/pmove_tests.ml','--output','pmove_tests.exe'],check=True)
    mathfile=output/'math.bin';run([output/'collision_oracle.exe','--math',mathfile],output)
    print(run([ROOT/'build/pmove_tests.exe','--contracts'],ROOT/'build',log=output/'contracts.log').strip(),flush=True)
    print(run([ROOT/'build/pmove_tests.exe','--math',mathfile],ROOT/'build',log=output/'math.log').strip(),flush=True)
    records=[]
    with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
        names=[] if args.fixture_only else args.map or ['q3dm1','q3dm6','q3dm17','q3tourney2']
        for j,name in enumerate(names+['movement_fixture']):
            folder=output/name;folder.mkdir(exist_ok=True)
            fixture=name=='movement_fixture'
            bsp=folder/'map.bsp';bsp.write_bytes(pmove_fixtures.bsp() if fixture else archive.read('maps/'+name+'.bsp'))
            labels=[]
            if fixture:queries,labels=pmove_fixtures.commands(state_bytes)
            else:queries=cases(bsp.read_bytes(),args.count,0x132680+j)
            inputs=folder/'inputs.bin';inputs.write_bytes(queries);count=len(queries)//520
            expected=folder/'expected.bin';run([output/'collision_oracle.exe',bsp,inputs,expected,flag],folder,log=folder/'oracle.log')
            print(name+': '+run([ROOT/'build/pmove_tests.exe',bsp,inputs,expected,flag],ROOT/'build',log=folder/'test.log',timeout=600).strip(),flush=True)
            rows=list(struct.iter_unpack('<166I',expected.read_bytes()))
            record={'map':name,'commands':count,'bsp_sha256':sha(bsp),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected),
                    'waterlevel_histogram':dict(collections.Counter(row[130] for row in rows)),
                    'pm_type_histogram':dict(collections.Counter(row[1] for row in rows))}
            if fixture:
                record['scenarios']=dict(collections.Counter(labels))
                eventoff=FIELDS['events']['offset']//4
                record['event_ring_histogram']=dict(collections.Counter(event for row in rows for event in row[eventoff:eventoff+2]))
                record['waterjump_frames']=sum(bool(row[3]&256) for row in rows)
                assert set(record['waterlevel_histogram'])=={0,1,2,3}
                assert record['waterjump_frames']>0
                for event in (1,2,6,12,14,15,16,21,23):assert record['event_ring_histogram'].get(event,0)>0,event
            records.append(record)
    result={'passed':True,'profile':'complete baseq3 Pmove / PmoveSingle; original Win32 SnapVector; static world; cm_noCurves='+flag,
            'commands':sum(r['commands'] for r in records),'exact_fields':sum(r['commands'] for r in records)*166,'math_cases':65536,'math_fields':65536*12,
            'snap_boundary_cases':26,'contract_cases':14,'playerstate_bytes':468,'validated_c_field_offsets':45,'maps':records,'math_sha256':sha(mathfile),'test_sha256':sha(ROOT/'build/pmove_tests.exe'),
            'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')

if __name__=='__main__':main()
