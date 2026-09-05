"""Original baseq3 missiles, grapple and shooters versus MiniLang with real SV/CM."""
import argparse, collections, itertools, json, random, re, struct, subprocess, sys, zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run
from spawn_oracle import build
from spawn_fixtures import entity, pack
from test_combat import bits, command, init, field, place, vector_field, shot_bsp
from generate_directions import render

def mf(slot,key,value):return (31,slot,key,value)
def fire(weapon=5,start=(0.,0.,128.),direction=(1.,0.,0.),owner=0):return (21,owner,weapon,*map(bits,start),*map(bits,direction))
def tv(slot,which,vector):return (32,slot,which,*map(bits,vector))
def contact(op=25,slot=72,fraction=.5,target=1022,flags=0,normal=(0.,0.,1.),end=(0.,0.,128.)):
    return (op,slot,bits(fraction),target,flags,*map(bits,normal),*map(bits,end))
def time(at,previous):return [mf(0,0,previous),field(0,44,at)]

def fixture(name):
    rows=[[('classname','info_notnull')]]*8
    if name.startswith('shooter'):
        rows=[
            [('classname','shooter_rocket'),('origin','0 0 128'),('target','dest')],
            [('classname','shooter_grenade'),('origin','0 100 128'),('angle','-1'),('random','12')],
            [('classname','shooter_plasma'),('origin','0 200 128'),('angle','90'),('random','-5')],
            [('classname','info_notnull'),('origin','300 0 128'),('targetname','DEST')],
            [('classname','info_notnull'),('origin','100 100 128'),('targetname','dest')],
            [('classname','shooter_rocket'),('origin','0 300 128'),('target','missing')],
            [('classname','shooter_plasma'),('origin','0 400 128'),('target','')],
            [('classname','info_notnull')]]
    return entity([('classname','worldspawn')])+''.join(entity(row) for row in rows)

def missile_bsp(flags=0):
    data=bytearray(shot_bsp());off,size=struct.unpack_from('<2i',data,16)
    for pos in range(off,off+size,72):struct.pack_into('<i',data,pos+64,flags)
    return bytes(data)

def inspect(data):
    offset=0;counts=collections.Counter();trace_entities=collections.Counter();trace_flags=collections.Counter();events=set();types=set();rest=False;private={};registered=[];snapshots={};startsolid=0
    def ints(count):
        nonlocal offset
        result=struct.unpack_from('<'+'i'*count,data,offset);offset+=count*4;return result
    def string():
        nonlocal offset
        size=ints(1)[0]
        if size>=0:offset+=size
    def snapshot():
        row=ints(124)
        for _ in range(9):string()
        return row
    def extra():
        ints(6)
        if ints(1)[0]:ints(132)
    while offset<len(data):
        kind=ints(1)[0];counts[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:ints(2);snapshot()
        elif kind in (5,6):snapshot()
        elif kind==7:ints(1)
        elif kind==12:ints(2)
        elif kind==20:ints(6)
        elif kind in (21,22,28,29,30,36,37):ints(1)
        elif kind in (23,24,25):ints(9)
        elif kind==27:
            row=ints(30);trace_entities[row[-1]]+=1;trace_flags[row[21]]+=1;startsolid+=bool(row[23] or row[24])
        elif kind==26:
            ints(5);assert ints(1)[0]==8;_,num,*_=ints(8);snapshots={}
            for _ in range(num-64+1):
                row=snapshot();snapshots[row[0]]=row
            for _ in range(3):
                row=snapshot();snapshots[row[0]]=row;extra()
            for _ in range(num-64+1):extra()
            for row in snapshots.values():
                events.add(row[46]&255);types.add(row[2]);rest |= row[2]==3 and row[4]==0 and row[10:13]==(0,0,0)
        elif kind==31:
            ints(1);registered=list(ints(256));num=ints(1)[0];private={}
            for _ in range(num):
                row=ints(12);private[row[0]]=list(row)
        elif kind==32:ints(7)
        elif kind in (33,35):ints(3)
        elif kind==34:ints(4)
        else:raise RuntimeError(f'Unknown missile record {kind} at {offset}')
    assert offset==len(data)
    return dict(traces=counts[27],trace_entities=dict(trace_entities),trace_flags=dict(trace_flags),startsolid_traces=startsolid,
        pain_callbacks=counts[23],death_callbacks=counts[24],events_seen=sorted(events),entity_types_seen=sorted(types),
        shots=counts[32],final_health={slot:row[108] for slot,row in snapshots.items()},
        final_private=private,registered_items=[i for i,value in enumerate(registered) if value],resting_missile_seen=rest,
        final_entities={slot:dict(inuse=bool(row[53]),type=row[2],event=row[46]&255,nextthink=row[114]) for slot,row in snapshots.items()})

def scenarios():
    rng=random.Random(0x4d495353)
    actions=[init()]
    dirs=[(0.,0.,0.),(1.,0.,0.),(3.,4.,5.),(-0.,-1.,0.),(1e-20,-1e-20,0.),(1e20,1e20,0.)]
    dirs += [tuple(rng.uniform(-2000,2000) for _ in range(3)) for _ in range(128)]
    for weapon in (4,5,8,9,10):
        for direction in dirs:actions += [fire(weapon,direction=direction),(11,72)]
    yield 'fire_parameters',actions,0
    actions=[]
    for weapon in range(1,11):actions += [(34,weapon)]
    for i in range(1024):
        direction=dirs[i%len(dirs)] if i<134 else tuple(rng.uniform(-10000,10000) for _ in range(3))
        towards=tuple(rng.uniform(-10000,10000) for _ in range(3))
        actions += [(29,0,*map(bits,direction),*map(bits,towards),int(i==0))]
    for direction in [(0.,0.,0.),(-1.5,-2.,-.1),(1.5,2.,.1),(-0.,0.,0.),(2147483648.,-2147483648.,16777216.)]:
        for towards in (direction,(0.,0.,0.),(-1e10,)*3,(1e10,)*3):actions += [(29,0,*map(bits,direction),*map(bits,towards),0)]
    for direction in dirs[1:]:actions += [(33,0,*map(bits,direction))]
    yield 'direction_helpers',actions,0
    actions=[init()]
    for i in range(512):
        at=rng.choice([1000,16777217,2147483600,-2000000000]);previous=at-rng.randrange(1,200)
        direction=tuple(rng.uniform(-2000,2000) for _ in range(3));normal=rng.choice([(0.,0.,1.),(1.,0.,0.),(0.,1.,0.),(.3,.4,.8660254)])
        actions+=time(1000,900)+[fire(4),mf(72,1,rng.choice([16,32,48])),tv(72,1,direction),mf(72,3,previous-25)]+time(at,previous)+[
            contact(24,fraction=rng.random(),normal=normal,end=(-.25,1.5,3.75)),(11,72)]
        # Reset free-time eligibility, preserving the original allocator rules.
        actions += [field(72,46,1),(11,72)] if at<=3000 else time(1000,900)+[field(72,46,1),(11,72)]
    yield 'bounce_precision',actions,0
    actions=[init(),fire(4),mf(72,2,2),tv(72,1,(10.,0.,-10.)),contact(24,end=(10.25,-5.5,128.)),(11,72),fire(4),mf(72,2,2),tv(72,1,(0.,0.,-100.)),contact(24,normal=(1.,0.,0.))]
    yield 'bounce_stop_and_continue',actions,0
    for weapon in (4,5,8,9):
        actions=[init(),init(1,health=1000,armor=25),init(2,health=1000,armor=5),place(1,(100.,0.,128.)),place(2,(110.,20.,128.)),(10,1,1),(10,2,1),fire(weapon)]
        actions += [contact(target=1,end=(100.25,.75,128.5))]
        yield 'impact_direct_splash_'+str(weapon),actions,0
    for mode in ('world','metal','zero_velocity','god','suit','team','zero_damage','nonclient','accuracy_wrap'):
        actions=[init(team=1),init(1,health=1000,team=1),init(2,health=1000,team=1),place(1,(100.,0.,128.)),place(2,(100.,25.,128.)),(10,1,1),(10,2,1),fire()]
        actions += {'zero_velocity':[mf(72,2,0)],'god':[field(1,2,16)],'suit':[field(1,26,1)],'team':[field(0,40,3)],
            'zero_damage':[field(72,9,0)],'nonclient':[init(1,client=0,health=1000)],'accuracy_wrap':[mf(0,10,2147483647)]}.get(mode,[])
        actions += [contact(target=1022 if mode in ('world','metal') else 1,flags=4096 if mode=='metal' else 0,end=(100.25,.75,128.5))]
        yield 'impact_'+mode,actions,0
    for mode in range(1,7):
        actions=[init(),init(1,health=1000),init(2,health=1000),place(1,(100.,0.,128.)),place(2,(110.,0.,128.)),(10,1,1),(10,2,1),fire(),field(1,12,mode),field(1,9,2),contact(target=1,end=(100.,0.,128.))]
        yield 'impact_callback_'+str(mode),actions,0
    for weapon in (4,5,8,9,10):
        actions=[init(),field(0,46,0),fire(weapon,direction=(0.,0.,1.))]+time(1099,1000)+[(28,)]+time(20000,1099)+[(28,)]+time(20301,20000)+[(28,)]
        yield 'flight_timeout_'+str(weapon),actions,0
    for flags in (0,16,4096):
        actions=[init(),fire(5,start=(0.,0.,128.),direction=(0.,0.,-1.))]+time(1200,1000)+[(22,72)]
        yield 'flight_surface_'+str(flags),actions,flags
    actions=[init(),fire(5,start=(0.,0.,-100.),direction=(1.,0.,0.)),(22,72)]
    yield 'flight_startsolid',actions,0
    actions=[init(),init(1,health=1000),place(1,(128.,0.,128.)),(10,1,1),fire(),mf(72,8,1)]+time(1200,1000)+[(22,72)]
    yield 'flight_target_filter',actions,0
    actions=[init(),init(1,health=1000),init(2,health=1000),place(1,(128.,0.,128.)),place(2,(140.,30.,128.)),(10,1,1),(10,2,1),fire()]+time(1200,1000)+[(22,72)]
    yield 'flight_client_direct',actions,0
    actions=[init(),field(0,46,0),fire(4,direction=(0.,0.,-1.))]
    for previous,at in [(1000,1200),(1200,1400),(1400,1600),(1600,2000),(2000,2500),(2500,3500),(3500,3801)]:actions+=time(at,previous)+[(28,)]
    yield 'flight_grenade_bounces',actions,0
    actions=[init(),init(1,health=1000),place(1,(100.,0.,128.)),(10,1,1),fire(10),contact(target=1,end=(84.,0.,128.))]
    actions += [place(1,(-10.5,20.5,140.5))]+time(1100,1000)+[(18,72)]+time(1200,1100)+[(18,72),(26,72),(27,72)]
    yield 'grapple_client_tracking',actions,0
    actions=[init(),fire(10),contact(end=(-1.5,2.5,128.5)),(26,72),(27,72)]
    yield 'grapple_world',actions,0
    actions=[init(),fire(10,start=(0.,0.,128.),direction=(0.,0.,-1.))]+time(1200,1000)+[(22,72)]
    yield 'grapple_noimpact',actions,16
    actions=[]
    for index,at in enumerate([1499,1500,1501]):
        actions += time(at,at-1)+[(18,slot) for slot in (64,69,70)]
    for i in range(64):
        for slot in (64,65,66,69,70):actions += [(6,slot,-1,-1),(35,)]
    yield 'shooter_spawns_and_uses',actions,0
    actions=[]
    for i in range(256):
        actions += [mf(71,12,rng.choice([0,3,4,5])),mf(71,13,bits(rng.choice([0.,-1.,1.,90.,180.,1e10,rng.uniform(-720,720)]))),
            vector_field(71,1,tuple(rng.uniform(-360,360) for _ in range(3))),(30,71,rng.choice([4,5,8]))]+time(2000+i*500,1500+i*500)+[(18,71),(6,71,-1,-1),(35,)]
    yield 'shooter_precision',actions,0

def cd_scenarios(root):
    if root is None:return
    with zipfile.ZipFile(root/'baseq3/pak0.pk3') as archive:
        for index,name in enumerate(sorted(n for n in archive.namelist() if n.startswith('maps/') and n.endswith('.bsp'))):
            data=archive.read(name);off,size=struct.unpack_from('<2i',data,8)
            positions=[tuple(map(float,m.split())) for m in re.findall(rb'"origin"\s*"([^"]+)"',data[off:off+size])]
            rng=random.Random(0x50524f4a+index);actions=[init(),field(0,46,0)];at=1000
            for position in positions[::max(1,len(positions)//2)][:2]:
                start=(position[0],position[1],position[2]+24.)
                for weapon in (4,5,8,9,10):
                    actions += [fire(weapon,start,tuple(rng.uniform(-1,1) for _ in range(3)))]
                    for step in range(8):
                        previous=at;at+=100;actions+=time(at,previous)+[(28,)]
                    actions += [(35,)]
            yield 'cd_'+Path(name).stem,actions,data

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    assert (ROOT/'src/mq3/shared/bytedirs.ml').read_text(encoding='utf-8')==render()
    output=ROOT/'build/reference/missiles';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,actions,mapdata in itertools.chain(scenarios(),cd_scenarios(args.data_root)):
        if args.case and args.case!=name:continue
        mapfile=output/(name+'.bsp');mapfile.write_bytes(mapdata if isinstance(mapdata,bytes) else missile_bsp(mapdata))
        inputs=output/(name+'.bin');inputs.write_bytes(pack(fixture(name))+b''.join(command(*q) for q in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--missiles'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--missiles'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result);observed=inspect(expected.read_bytes())
        if name=='fire_parameters':assert observed['shots']==670
        if name.startswith('impact_direct_splash_') or name=='flight_client_direct':
            assert observed['pain_callbacks']==2 and observed['final_health'][1]<1000 and observed['final_health'][2]<1000 and observed['final_private'][0][10]==1,observed
        if name=='bounce_stop_and_continue':assert observed['resting_missile_seen'],observed
        if name=='impact_accuracy_wrap':assert observed['final_private'][0][10]==-2147483648,observed
        if name=='flight_startsolid':assert observed['traces']==2 and observed['startsolid_traces']==2,observed
        if name=='flight_client_direct':assert observed['trace_entities'].get(1,0)>=1,observed
        if name=='flight_target_filter':assert observed['trace_entities']=={1023:1},observed
        if name in ('flight_surface_16','grapple_noimpact'):assert 16 in observed['trace_flags'] and observed['events_seen']==[0] and not observed['final_entities'][72]['inuse'],observed
        if name=='flight_surface_4096':assert 52 in observed['events_seen'],observed
        if name=='flight_grenade_bounces':assert {44,51}<=set(observed['events_seen']) and not observed['final_entities'][72]['inuse'],observed
        if name.startswith('flight_timeout_'):assert not observed['final_entities'][72]['inuse'],observed
        if name.startswith('grapple_') and name!='grapple_noimpact':assert 11 in observed['entity_types_seen'] and observed['final_private'][0][11]==-1,observed
        if name.startswith('shooter_'):assert observed['registered_items']==[11,12,15] and 23 in observed['events_seen'] and 3 in observed['entity_types_seen'],observed
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),**observed,
            inputs_sha256=sha(inputs),expected_sha256=sha(expected),map_sha256=sha(mapfile)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words / {observed["traces"]} traces',flush=True)
    assert records
    if args.data_root and not args.case:assert sum(r['name'].startswith('cd_') for r in records)==31
    contract_map=output/'contracts.bsp';contract_map.write_bytes(missile_bsp())
    print(run([ROOT/'build/spawn_tests.exe',contract_map,inputs,expected,'0','--missile-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    invalid=output/'freed_projectile.bin';invalid_expected=output/'freed_projectile.expected'
    actions=[init(),init(1,health=1000),fire(),field(1,12,2),field(1,9,72),contact(target=1)]
    invalid.write_bytes(pack(fixture('freed_projectile'))+b''.join(command(*q) for q in actions))
    run([output/'spawn_oracle.exe',contract_map,invalid,invalid_expected,'0','--missiles'],output,log=output/'freed_projectile.oracle.log')
    rejected=subprocess.run([str(ROOT/'build/spawn_tests.exe'),str(contract_map),str(invalid),str(invalid_expected),'0','--missiles'],cwd=ROOT/'build',capture_output=True,text=True)
    (output/'freed_projectile.test.log').write_text(rejected.stdout+rejected.stderr,encoding='utf-8')
    assert rejected.returncode==1 and 'Server entity number does not match its slot' in rejected.stdout+rejected.stderr
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),
        string_bytes=sum(r['string_bytes'] for r in records),traces=sum(r['traces'] for r in records),cd_maps=sum(r['name'].startswith('cd_') for r in records),
        test_sha256=sha(ROOT/'build/spawn_tests.exe'),runtime_contracts=8,
        controlled_rejections=[dict(name='freed_projectile',original_exit_code=0,minilang_exit_code=1,reason='Freed entity number differs from its slot',inputs_sha256=sha(invalid),expected_sha256=sha(invalid_expected))],
        scope='Baseq3 missile/shooter/grapple functions, actual SV/CM and allocated-entity frame loop. No full weapons, player_die, item spawning, client rendering or complete server. Freed projectile callback rejects invalid relinking instead of original SV metadata aliasing.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
