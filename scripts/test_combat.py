"""Original baseq3 damage/armor/team/hazard functions against MiniLang state.

Pain/death/mover callbacks observe their contracts; they do not replace player_die.
"""
import argparse
import collections
import json
import itertools
import random
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run
from spawn_oracle import build
from spawn_fixtures import bsp,entity,pack

def bits(value):return struct.unpack('<i',struct.pack('<f',value))[0]
def command(*q):return struct.pack('<16i',*q,*([0]*(16-len(q))))
def field(slot,key,value):return (2,slot,key,value)
def init(slot=0,client=1,team=0,health=100,armor=0,maxhealth=100):return (1,slot,client,team,health,armor,maxhealth)
def hit(targ=0,inflictor=1,attacker=1,damage=100,flags=0,mod=6,dir=(3.,4.,5.),point=(11.,22.,33.)):
    return (3,targ,inflictor,attacker,damage,flags,mod,*map(bits,dir or (3.,4.,5.)),int(dir is not None),*map(bits,point or (11.,22.,33.)),int(point is not None))
def place(slot,origin,velocity=(0.,0.,0.)):return (12,slot,*map(bits,origin),*map(bits,velocity))
def vector_field(slot,key,value):return (19,slot,key,*map(bits,value))
def visible(slot,origin):return (15,slot,*map(bits,origin))
def blast(origin=(0.,0.,128.),attacker=0,ignore=-1,damage=100.,radius=200.,mod=7):return (16,attacker,ignore,bits(damage),bits(radius),*map(bits,origin),mod)
def box(slot,origin,mins,maxs,contents=1):
    model=2 if tuple(mins)==(-.25,-.25,-.25) else 3
    return [init(slot,0),place(slot,origin),(20,slot,model),field(slot,14,contents),(10,slot,1)]
def shot_bsp():
    data=bsp();lumps=[]
    for i in range(17):
        off,size=struct.unpack_from('<2i',data,8+i*8);lumps.append(data[off:off+size])
    # Inline solid brushes, outside world leaf brush lists. Temp boxes are BODY.
    for mins,maxs in [((-.25,)*3,(.25,)*3),((-8.,-30.,-20.),(8.,30.,20.)),((-15.,-15.,-24.),(15.,15.,32.))]:
        shader=len(lumps[1])//72;first=len(lumps[9])//8;brush=len(lumps[8])//12
        lumps[1]+=struct.pack('<64sii',b'combat_solid',0,1)
        for axis in range(3):
            for sign in (-1,1):
                normal=[0.,0.,0.];normal[axis]=sign
                lumps[9]+=struct.pack('<2i',len(lumps[2])//16,shader)
                lumps[2]+=struct.pack('<4f',*normal,maxs[axis] if sign==1 else -mins[axis])
        lumps[8]+=struct.pack('<3i',first,6,shader)
        lumps[7]+=struct.pack('<6f4i',*mins,*maxs,0,0,brush,1)
    header=bytearray(struct.pack('<2i',0x50534249,46)+bytes(17*8));off=144
    for i,data in enumerate(lumps):struct.pack_into('<2i',header,8+i*8,off,len(data));off+=len(data)
    return bytes(header)+b''.join(lumps)
def fixture(name):
    text=entity([('classname','worldspawn')])
    if name.startswith('hurt'):
        for flags in range(32):text+=entity([('classname','trigger_hurt'),('model','*1'),('spawnflags',str(flags)),('damage','0' if flags%2==0 else '7')])
    elif name.startswith('laser'):
        for pairs in [
            [('classname','target_laser'),('origin','0 0 128'),('target','dest')],
            [('classname','info_notnull'),('origin','256 0 128'),('targetname','DEST')],
            [('classname','info_notnull'),('origin','256 100 128'),('targetname','dest')],
            [('classname','target_laser'),('origin','0 100 128'),('angle','0'),('spawnflags','1'),('damage','7')],
            [('classname','target_laser'),('origin','0 200 128'),('angle','-1')],
            [('classname','target_laser'),('origin','0 300 128'),('target','missing'),('spawnflags','1')],
            [('classname','target_laser'),('origin','0 400 128'),('angle','-2')],
            [('classname','target_laser'),('origin','0 500 128'),('target',''),('damage','-3')]]:text+=entity(pairs)
    else:
        text+=entity([('classname','target_kill')])+entity([('classname','info_notnull')])
        if name.startswith(('visibility','radius','accuracy','cd_')):
            text+=''.join(entity([('classname','info_notnull')]) for _ in range(6))
    return text

def inspect_combat(data):
    """Read record boundaries, so integration gates require real callbacks."""
    off=0;counts=collections.Counter();trace_count=0;probe_counts=collections.Counter();trace_hits=collections.Counter();results=collections.Counter();final_health={}
    def ints(n):
        nonlocal off
        values=struct.unpack_from('<'+'i'*n,data,off);off+=n*4;return values
    def string():
        nonlocal off
        size=ints(1)[0]
        if size>=0:off+=size
    def snapshot():
        fields=ints(124)
        for _ in range(9):string()
        return fields
    def extra():
        ints(6)
        if ints(1)[0]:ints(132)
    while off<len(data):
        kind=ints(1)[0];counts[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:ints(2);snapshot()
        elif kind in (5,6):snapshot()
        elif kind==7:ints(1)
        elif kind==20:ints(6)
        elif kind in (21,22):ints(1)
        elif kind in (23,24,25):ints(9)
        elif kind==27:
            tr=ints(30);trace_hits[tr[-1]]+=1;trace_count+=1
        elif kind in (28,29,30):
            results[str(kind)+'_'+str(ints(1)[0])]+=1
            if kind==28:probe_counts[trace_count]+=1
        elif kind==26:
            trace_count=0
            ints(5);assert ints(1)[0]==8
            _,num,*_=ints(8)
            final_health={}
            for _ in range(num-64+1):
                fields=snapshot();final_health[fields[0]]=fields[108]
            for _ in range(3):
                fields=snapshot();final_health[fields[0]]=fields[108];extra()
            for _ in range(num-64+1):extra()
        else:raise RuntimeError('Unknown combat record '+str(kind)+' at '+str(off))
    assert off==len(data)
    return {'pain_callbacks':counts[23],'death_callbacks':counts[24],'mover_callbacks':counts[25],
            'spatial_links':counts[5],'spatial_unlinks':counts[6],'traces':counts[27],
            'trace_entities':dict(trace_hits),'visibility_probe_counts':dict(probe_counts),'query_results':dict(results),'final_health':final_health}

def scenarios():
    # Exhaust armor rounding boundaries, including negative and int32 extremes.
    actions=[init(),init(1,0)]
    for damage in [0,1,2,3,49,50,51,99,100,101,199,200,201,999,100000,-1,-50,-100,-2147483648,2147483647]:
        for armor in [0,1,2,33,66,100,100000,-1,2147483647]:
            for flags in [0,2,8,10]:actions += [field(0,22,armor),(4,0,damage,flags)]
        actions += [(4,1,damage,0)]
    yield 'armor_rounding',actions
    actions=[]
    # Original ordering: momentum before protection, suit before self/armor.
    for gametype in [0,3,4]:
        for team in [0,1,2]:
            for flags in range(16):
                actions += [init(0,team=1,armor=50),init(1,team=team),field(0,40,gametype),field(0,41,flags%2),
                            field(0,2,0x10 if flags&2 else 0),field(0,26,flags&4),hit(damage=101,flags=flags)]
    for damage in [0,1,2,3,199,200,201,100000,-1,-999]:
        for flags in [0,1,2,4,8,15]:
            actions += [init(armor=33),field(0,26,1),hit(attacker=0,damage=damage,flags=flags),hit(attacker=-1,inflictor=-1,damage=damage,flags=flags,mod=19,dir=None,point=None)]
    yield 'protection_and_self',actions
    actions=[init(1)]
    for condition in ['takedamage','intermission','noclip','mover','mover_in_motion','mover_no_use']:
        for client in [0,1]:
            actions += [init(client=client),field(0,13,1)]
            if condition=='takedamage':actions += [field(0,1,0)]
            if condition=='intermission':actions += [field(0,43,1)]
            if condition=='noclip' and client:actions += [field(0,21,1)]
            if condition.startswith('mover'):actions += [field(0,3,4),field(0,4,0 if condition=='mover' else 1)]
            if condition=='mover_no_use':actions += [field(0,4,0),field(0,13,0)]
            actions += [hit(inflictor=-1,attacker=-1),field(0,43,0)]
    for damage in [0,1,200,100000]:
        for mode in [0,1,2,3]:
            actions += [init(health=100,armor=100),field(0,5,mode&1),field(0,12,int(mode==3)),hit(damage=damage,flags=2)]
    # Nonclients may be general/missile targets; original hit counter excludes both.
    for type_ in [0,3]:actions += [init(client=0),field(0,3,type_),hit(damage=25),hit(damage=100000)]
    yield 'early_returns_and_callbacks',actions
    actions=[]
    for targetteam in range(4):
        for attackerteam in range(4):
            for gametype in [-1,0,1,2,3,4,5,8]:
                actions += [init(team=targetteam,armor=999),init(1,team=attackerteam),field(0,40,gametype),field(0,41,1),
                            field(0,27,1),field(0,28,1),(7,0,1),hit(damage=1),field(1,31,0),field(0,27,0),field(0,28,0),field(0,29,1),(8,0,1)]
    actions += [init(2,0),(7,0,2),(7,2,1),(8,0,2),(8,2,1)]
    for time in [0,-1,16777215,16777216,16777217,16777219,2147483647,-2147483648]:
        actions += [init(team=1,armor=100),init(1,team=2),field(0,40,4),field(0,44,time),field(0,28,1),hit(damage=1),field(1,31,0),(8,0,1)]
    yield 'teams_and_carrier',actions
    rng=random.Random(0x44414d47);actions=[]
    for i in range(1024):
        damage=rng.choice([0,1,-1,3,49,50,51,199,200,201,100000,2147483647,-2147483648]) if i<256 else rng.randrange(-10000,10000)
        armor=rng.choice([0,1,100,-1,2147483647]) if i<256 else rng.randrange(0,1000)
        direction=rng.choice([None,(0.,-0.,0.),(1e-20,0.,0.),(1e20,-1e20,0.),(1.,2.,3.)]) if i<256 else tuple(rng.uniform(-1000,1000) for _ in range(3))
        actions += [init(health=rng.choice([1,100,999,2147483647]),armor=armor),init(1,maxhealth=rng.choice([0,1,37,99,100,200,999])),
                    field(0,2,rng.choice([0,0x800])),field(0,24,rng.choice([0,1,160,999])),field(0,25,rng.randrange(256)),
                    field(0,42,bits(rng.choice([0.,-0.,1.,-1000.,1000.,123.125]))),
                    place(0,(10.25,-20.75,32.5),tuple(rng.uniform(-500,500) for _ in range(3))),
                    hit(attacker=rng.choice([0,1,-1]),inflictor=rng.choice([0,1,-1]),damage=damage,flags=rng.randrange(16),dir=direction)]
    # Counter wrapping and a pre-existing external event, without integer UB crashes.
    actions += [init(armor=10),init(1),field(0,32,2147483647),field(0,33,2147483647),field(0,34,2147483647),field(1,30,2147483647),field(0,26,1),field(0,37,0x3ff),hit(damage=25)]
    yield 'numeric_damage',actions
    actions=[]
    for flags in range(32):
        slot=64+flags
        actions += [init(armor=10),init(1,armor=10),field(0,44,1000),field(slot,7,0),field(0,2,0x10 if flags%2 else 0),
                    (5,slot,0),(5,slot,1),field(0,44,1099),(5,slot,1),field(0,44,1100),(5,slot,1),
                    field(0,44,1999),(5,slot,0),field(0,44,2000),(5,slot,0)]
        if flags&2:actions += [(6,slot,0,0),(6,slot,0,0)]
    actions += [init(),field(0,1,0),field(64,7,0),(5,64,0),field(0,1,1),field(0,44,2147483647),(5,64,0),(5,64,0),field(0,44,-2147483648),(5,64,0)]
    yield 'hurt_flags_and_timing',actions
    # All other hazards are explicitly unlinked to isolate real broadphase/contact.
    actions=[(10,slot,0) for slot in range(64,96)]+[init(health=1000),place(0,(-100.,0.,-100.)),(10,64,1),(10,0,1),(13,0),(13,0),field(0,44,1100),(13,0),(10,64,0),(13,0)]
    yield 'hurt_spatial_contact',actions
    actions=[]
    for armor in [0,100,100000,2147483647]:
        for suit in [0,1]:
            actions += [init(armor=armor),field(0,26,suit),field(0,2,0x10),(6,64,0,0)]
    actions += [init(client=0),(6,64,0,0)]
    yield 'target_kill',actions
    actions=[init(),init(1,armor=100),init(2,armor=50),place(0,(100.,0.,100.)),place(1,(100.,0.,100.)),place(2,(100.,0.,100.)),(10,1,1),(10,2,1),(9,0)]
    actions += [init(1,armor=100),place(1,(200.,0.,101.)),(10,1,1),(14,0,*map(bits,(200.,0.,100.)))]
    actions += [init(1,armor=100),place(1,(300.,0.,101.)),(10,1,1),field(0,20,3),(14,0,*map(bits,(300.,0.,100.)))]
    yield 'killbox_and_teleport',actions
    yield from shot_scenarios()

def shot_scenarios():
    actions=[]
    for team in range(4):
        for type_ in [0,3,4]:
            for health in [-1,0,1]:
                actions += [init(team=1),init(1,team=team),field(0,40,type_),field(0,45,health),(17,0,1),field(0,1,0),(17,0,1),(17,1,1)]
    actions += [init(2,0),(17,0,2),(17,2,1)]
    yield 'accuracy_filters',actions
    actions=[init(1),place(1,(128.,0.,100.)),(10,1,1),visible(1,(0.,0.,104.))]
    # Place tiny occluders at the five ray intersections, in original probe order.
    for i,y in enumerate([0.,64*15/143,-64*15/143,64*15/113,-64*15/113]):
        actions += box(64+i,(64.,y,104.),(-.25,-.25,-.25),(.25,.25,.25))+[visible(1,(0.,0.,104.))]
    actions += [(10,slot,0) for slot in range(64,69)]+[(20,1,4),field(1,14,1),(10,1,1),visible(1,(0.,0.,104.)),(10,64,1),visible(1,(0.,0.,104.))]
    yield 'visibility_corners',actions
    actions=[init(1),place(1,(-160.,256.,80.)),(10,1,1),visible(1,(-300.,256.,80.)),visible(1,(-200.,256.,80.))]
    actions += [init(65,0),(20,65,1),field(65,14,1),place(65,(0.,0.,400.)),vector_field(65,6,(0.,35.,0.)),(10,65,1)]
    for origin in [(100.,0.,300.),(-1500.,0.,300.),(-200.,100.,1000.),(0.,0.,400.)]:actions += [visible(65,origin)]
    yield 'visibility_world_and_brush',actions
    actions=[]
    # Distances use the expanded linked bounding box, not currentOrigin.
    for radius in [-100.,-0.,.5,1.,16.,64.,128.,128.00001525878906,1000.]:
        for distance in [0.,.999,1.,15.999,16.,63.999,64.,127.99999,128.,129.]:
            actions += [init(),init(1,health=10000,armor=50),place(1,(16.+distance,0.,128.)),(10,1,1),blast(radius=radius)]
    yield 'radius_edges',actions
    rng=random.Random(0x52414449);actions=[]
    for i in range(512):
        origin=tuple(rng.uniform(-100,100) for _ in range(2))+(rng.uniform(64,512),)
        position=tuple(origin[j]+rng.uniform(-200,200) for j in range(3))
        actions += [init(),init(1,health=100000,armor=rng.randrange(200)),place(1,position),(10,1,1),
                    blast(origin,damage=rng.choice([0.,-1.,.99999,1.00001,1e10,rng.uniform(1,1000)]),radius=rng.uniform(.01,512))]
    yield 'radius_precision',actions
    actions=[]
    for mode in ['normal','god','suit','noclip','intermission','friendly','dead_ps','dead_entity','ignore','world_attacker','self']:
        actions += [init(team=1),init(1,team=1,armor=33),place(1,(100.,0.,128.)),(10,1,1)]
        extra={'god':[field(1,2,16)],'suit':[field(1,26,1)],'noclip':[field(1,21,1)],'intermission':[field(0,43,1)],
               'friendly':[field(0,40,3)],'dead_ps':[field(1,45,0)],'dead_entity':[field(1,0,0)]}.get(mode,[])
        actions += extra+[blast(attacker=1022 if mode=='world_attacker' else 1 if mode=='self' else 0,ignore=1 if mode=='ignore' else -1),field(0,43,0),field(0,40,0)]
    yield 'radius_protection_and_accuracy',actions
    for mode in range(1,7):
        # Link 65 first, then 1: native sector traversal visits client 1 first.
        actions=[init(),init(65,0,health=1000),place(65,(100.,0.,128.)),(10,65,1),init(1,health=1000),place(1,(120.,0.,128.)),(10,1,1),field(1,12,mode),field(1,9,65),blast()]
        yield 'radius_mutation_'+str(mode),actions
    actions=[init(),init(1),place(1,(128.,0.,100.)),(10,1,1)]+box(64,(64.,0.,104.),(-8.,-30.,-20.),(8.,30.,20.))+[field(64,1,0),blast((0.,0.,104.)),(10,64,0),blast((0.,0.,104.))]
    yield 'radius_occlusion',actions
    actions=[field(0,44,1099)]+[(18,slot) for slot in (64,67,68,69,70,71)]+[field(0,44,1100)]+[(18,slot) for slot in (64,67,68,69,70,71)]
    for slot in (64,67,68,69,70,71):actions += [(6,slot,-1,-1),(6,slot,-1,-1),field(0,44,1200),(18,slot)]
    actions += [field(0,44,2147483647),(6,64,-1,-1),(6,64,-1,-1),(18,64)]
    yield 'laser_spawn_toggle',actions
    actions=[init(),init(1,health=1000,armor=33),place(0,(128.,0.,128.)),place(1,(256.,0.,128.)),(10,0,1),(10,1,1),field(0,44,1100),(18,64),field(64,9,11),(6,64,-1,0),
             (10,0,0),field(0,44,1200),(18,64),field(1,26,1),field(0,44,1300),(18,64),field(1,26,0),field(1,2,16),field(0,44,1400),(18,64),
             field(64,18,-1),vector_field(64,2,(2.,.01,0.)),field(1,2,0),field(0,44,1500),(18,64),field(0,44,1600),(18,64),
             field(1,15,64),field(0,44,1700),(18,64),field(1,15,1023),(10,1,0),field(0,44,1800),(18,64)]
    yield 'laser_hits_and_slot_zero',actions
    # G_Find chooses the first matching live target; later it retains its pointer.
    actions=[field(65,46,0),field(0,44,1100),(18,64),(6,64,-1,-1),vector_field(66,0,(100.,50.,150.)),vector_field(66,3,(-7.,-3.,-11.)),vector_field(66,4,(13.,5.,27.)),field(0,44,1200),(18,64),
             (11,66),field(0,44,1300),(18,64)]
    yield 'laser_target_tracking',actions
    # 0.5 in the original VectorMA macro keeps double intermediates. Subnormal
    # products expose premature rounding even when VectorNormalize returns zero.
    rng=random.Random(0x4c415345);actions=[field(0,44,1100),(18,64),vector_field(64,0,(0.,0.,0.)),(6,64,-1,-1)]
    tiny=[struct.unpack('<f',struct.pack('<I',x))[0] for x in [0,1,2,3,4,5,0x80000001,0x80000003,0x80000005,0x80000000,0x00800000]]
    for i in range(256):
        actions += [vector_field(65,0,tuple(rng.choice(tiny) for _ in range(3))),
                    vector_field(65,3,tuple(-abs(rng.choice(tiny)) for _ in range(3))),vector_field(65,4,tuple(abs(rng.choice(tiny)) for _ in range(3))),
                    field(0,44,1200+i*100),(18,64)]
    yield 'laser_precision',actions

def cd_scenarios(data_root):
    if data_root is None:return
    with zipfile.ZipFile(data_root/'baseq3/pak0.pk3') as archive:
        for index,name in enumerate(sorted(n for n in archive.namelist() if n.startswith('maps/') and n.endswith('.bsp'))):
            data=archive.read(name);off,size=struct.unpack_from('<2i',data,8);positions=[]
            for found in re.findall(rb'"origin"\s*"([^"]+)"',data[off:off+size]):
                position=tuple(map(float,found.split()))
                if len(position)==3:positions.append(position)
            assert positions,name
            rng=random.Random(0x424c4153+index);actions=[init()]
            for position in positions[::max(1,len(positions)//8)][:8]:
                origin=tuple(value+rng.uniform(-400,400) for value in position)
                actions += [init(1,health=1000,armor=17),place(1,position),(10,1,1),visible(1,origin),blast(origin,radius=512.,damage=180.)]
            yield 'cd_'+Path(name).stem,actions,data

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    output=ROOT/'build/reference/combat';sources=build(output);base_map=output/'map.bsp';base_map.write_bytes(shot_bsp())
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,actions,mapdata in itertools.chain(((name,actions,None) for name,actions in scenarios()),cd_scenarios(args.data_root)):
        if args.case and args.case!=name:continue
        mapfile=base_map
        if mapdata is not None:mapfile=output/(name+'.bsp');mapfile.write_bytes(mapdata)
        inputs=output/(name+'.bin');inputs.write_bytes(pack(fixture(name))+b''.join(command(*q) for q in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--combat'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--combat'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result)
        observed=inspect_combat(expected.read_bytes())
        if name=='hurt_spatial_contact':assert observed['pain_callbacks']==2,observed
        if name=='killbox_and_teleport':assert observed['death_callbacks']==3,observed
        if name=='early_returns_and_callbacks':assert all(observed[key]>0 for key in ('pain_callbacks','death_callbacks','mover_callbacks')),observed
        if name=='visibility_corners':assert observed['visibility_probe_counts']=={1:2,2:1,3:1,4:1,5:3} and observed['query_results']['28_0']==2,observed
        if name=='radius_protection_and_accuracy':assert observed['query_results']=={'29_1':6,'29_0':5},observed
        if name=='radius_occlusion':assert observed['query_results']=={'29_0':1,'29_1':1},observed
        if name=='radius_mutation_5':assert observed['final_health'][65]<333,observed
        if name=='radius_mutation_6':assert observed['final_health'][72]==333,observed
        if name=='laser_hits_and_slot_zero':assert observed['trace_entities'][0]==1 and observed['pain_callbacks']>=2 and observed['final_health'][0]==100,observed
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),**observed,map_sha256=sha(mapfile),inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words',flush=True)
    if not records:raise RuntimeError('No matching scenario')
    if args.data_root and not args.case:assert sum(r['name'].startswith('cd_') for r in records)==31
    print(run([ROOT/'build/spawn_tests.exe',base_map,inputs,expected,'0','--combat-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    # The original links a freed laser with s.number=0. Keep the established
    # server slot invariant and report this deliberate controlled divergence.
    invalid=output/'laser_callback_free.bin';expected=output/'laser_callback_free.expected'
    actions=[init(),init(1),place(1,(128.,0.,128.)),(10,1,1),field(0,44,1100),(18,64),field(1,12,2),field(1,9,64),(6,64,-1,0)]
    invalid.write_bytes(pack(fixture('laser'))+b''.join(command(*q) for q in actions))
    run([output/'spawn_oracle.exe',base_map,invalid,expected,'0','--combat'],output,log=output/'laser_callback_free.oracle.log')
    rejected=subprocess.run([str(ROOT/'build/spawn_tests.exe'),str(base_map),str(invalid),str(expected),'0','--combat'],cwd=ROOT/'build',capture_output=True,text=True)
    (output/'laser_callback_free.test.log').write_text(rejected.stdout+rejected.stderr)
    assert rejected.returncode==1 and 'Server entity number does not match its slot' in rejected.stdout+rejected.stderr
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),
        string_bytes=sum(r['string_bytes'] for r in records),traces=sum(r['traces'] for r in records),cd_maps=sum(r['name'].startswith('cd_') for r in records),
        test_sha256=sha(ROOT/'build/spawn_tests.exe'),runtime_contracts=8,controlled_freed_laser_link_rejections=1,
        controlled_rejections=[dict(name='laser_callback_free',original_exit_code=0,minilang_exit_code=1,reason='Freed entity number differs from its slot',inputs_sha256=sha(invalid),expected_sha256=sha(expected))],
        scope='Baseq3 damage, armor, teams, radius/visibility/accuracy, hurt/kill/laser spawns; actual server CM and teleport integration. Pain/die/mover callbacks observe dispatch only; no player_die, scoring, damage feedback, projectile physics or complete game server. Freed laser linking rejects its invalid entity number instead of reproducing original metadata aliasing.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n')

if __name__=='__main__':main()
