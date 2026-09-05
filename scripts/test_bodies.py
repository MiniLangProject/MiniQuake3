"""Original spawn selection, body queue and corpse physics versus MiniLang."""
import argparse, collections, itertools, json, random, re, struct, subprocess, sys, zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run
from spawn_oracle import build
from spawn_fixtures import entity, pack
from test_combat import bits, command, init, field, place, vector_field, shot_bsp, hit

def bf(slot,key,value):return (49,slot,key,value)
def tv(slot,kind,vector):return (50,slot,kind,*map(bits,vector))
def choose(kind=4,slot=64,team=0,state=0,avoid=(0.,0.,0.)):return (40,slot,kind,team,state,*map(bits,avoid))
def at(time,previous=1000):return [field(0,44,time),bf(0,12,previous)]
def dm(position,initial=False):return [('classname','info_player_deathmatch'),('origin',' '.join(map(str,position))),('angles','15.25 -25.5 35.75'),('spawnflags',str(int(initial)))]
def fixture(rows=None):return entity([('classname','worldspawn')])+''.join(entity(row) for row in (rows if rows is not None else [[('classname','info_notnull')]]*8))
def map_bytes(nodrop=False):
    data=bytearray(shot_bsp())
    if nodrop:
        off,size=struct.unpack_from('<2i',data,16)
        for pos in range(off,off+size,72):
            content=struct.unpack_from('<I',data,pos+68)[0];struct.pack_into('<I',data,pos+68,content|0x80000000)
    return bytes(data)

def inspect(data):
    off=0;counts=collections.Counter();snapshots={};extras={};selected=collections.Counter();events=set();traces=collections.Counter();body_index=0
    def ints(n):
        nonlocal off
        row=struct.unpack_from('<'+'i'*n,data,off);off+=n*4;return row
    def string():
        nonlocal off
        n=ints(1)[0]
        if n>=0:off+=n
    def snapshot():
        row=ints(124)
        for _ in range(9):string()
        return row
    def extra():
        ints(6)
        if ints(1)[0]:ints(132)
    while off<len(data):
        kind=ints(1)[0];counts[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:ints(2);snapshot()
        elif kind in (5,6):snapshot()
        elif kind in (7,21,22,28,29,30,37,40):ints(1)
        elif kind==12:ints(2)
        elif kind==20:ints(6)
        elif kind in (23,24,25):ints(9)
        elif kind==27:
            row=ints(30);traces[row[-1]]+=1
        elif kind==26:
            ints(5);assert ints(1)[0]==8;_,num,*_=ints(8);snapshots={}
            for _ in range(num-64+1):
                row=snapshot();snapshots[row[0]]=row
            for _ in range(3):
                row=snapshot();snapshots[row[0]]=row;extra()
            for _ in range(num-64+1):extra()
            for row in snapshots.values():events.add(row[46]&255)
        elif kind==33:ints(3)
        elif kind==38:
            _,_,body_index=ints(3);ints(14);num=ints(1)[0];extras={}
            for _ in range(num):
                row=ints(5);extras[row[0]]=row[1:]
        elif kind==39:
            row=ints(8);selected[(row[0],row[1])]+=1
        else:raise AssertionError((off,kind))
    assert off==len(data)
    return dict(selections=counts[39],yaw_probes=counts[40],links=counts[5],unlinks=counts[6],traces=counts[27],
        trace_entities=dict(traces),body_index=body_index,events=sorted(events),
        selection_results=[dict(kind=k,slot=s,count=v) for (k,s),v in sorted(selected.items())],
        final={slot:dict(health=row[108],linked=row[81]!=0,type=row[2],event=row[46]&255,physics=row[120],
            trajectory=row[4],ground=row[38],origin_bits=list(row[7:10]),extra=list(extras.get(slot,()))) for slot,row in snapshots.items()})

def scenarios():
    rng=random.Random(0x424f4459)
    for count in (1,2,3,5,64,65,96,128):
        rows=[dm((float((i*37)%101),float(i%7*25),128.),i==0) for i in range(count)]
        actions=[]
        for _ in range(64):
            avoid=tuple(rng.uniform(-200,200) for _ in range(3))
            actions += [choose(1,avoid=avoid),choose(2),choose(3,avoid=avoid),choose(4,avoid=avoid),choose(5)]
        yield 'selection_'+str(count),fixture(rows),actions,map_bytes()
    # Equal-distance insertion order, >64 candidates and random() == 1 endpoint.
    seed=next(i for i in range(300000) if ((214013*i+2531011)&0xffffffff)>>16&32767==32767)
    yield 'selection_ties_endpoint',fixture([dm((100.,0.,128.))]*70),[bf(0,16,seed),choose(3),choose(1),choose(5)],map_bytes()
    rows=[dm((0.,0.,128.),True),dm((100.,0.,128.)),dm((200.,0.,128.))]
    actions=[init(),init(1),init(2),place(0,(0.,0.,128.)),(10,0,1),choose(0),choose(5),field(0,0,-100),field(0,45,-100),choose(0)]
    actions += [place(1,(100.,0.,128.)),(10,1,1),place(2,(200.,0.,128.)),(10,2,1),choose(2),choose(4),choose(5)]
    actions += [(10,0,0),choose(0),choose(4),init(0,client=0),place(0,(0.,0.,128.)),(10,0,1),choose(0)]
    yield 'selection_occupied',fixture(rows),actions,map_bytes()
    actions=[init()]
    for x in (30.,31.,31.001,-30.,-31.,-31.001,100.):actions += [place(0,(x,0.,128.)),(10,0,1),choose(0)]
    yield 'selection_box_edges',fixture(rows),actions,map_bytes()
    yield 'selection_nearest_cutoff',fixture([dm((1000000.,0.,0.)),dm((999999.,0.,0.))]),[choose(1)],map_bytes()
    yield 'selection_empty_nullable',fixture([]),[choose(1),choose(2),choose(6,team=0)],map_bytes()
    for team in (1,2):
        rows=[dm((0.,0.,128.))]
        for name in ('team_CTF_redplayer','team_CTF_blueplayer','team_CTF_redspawn','team_CTF_bluespawn'):
            rows += [[('classname',name),('origin',f'{i*100} {team*200} 128')] for i in range(35)]
        actions=[]
        for state in (0,1,2,-1):
            for _ in range(32):actions += [choose(6,team=team,state=state),choose(7,team=team,state=state)]
        actions += [choose(7,team=0),choose(7,team=3)]
        yield 'selection_team_'+str(team),fixture(rows),actions,map_bytes()
    rows=[dm((0.,0.,128.)),[('classname','team_CTF_redspawn'),('origin','100 0 128')]]
    yield 'selection_team_occupied',fixture(rows),[init(),place(0,(100.,0.,128.)),(10,0,1),choose(6,team=1,state=1),choose(7,team=1,state=1),choose(7,team=2,state=1)],map_bytes()
    for target in (None,'dest','missing',''):
        rows=[dm((1.,2.,128.)),[('classname','info_player_intermission'),('origin','1 2 200'),('angles','23 -44 10')]+([] if target is None else [('target',target)]),
            [('classname','info_notnull'),('origin','100 -20 128'),('targetname','DEST')],
            [('classname','info_notnull'),('origin','-20 100 250'),('targetname','dest')]]
        yield 'intermission_'+str(target),fixture(rows),[choose(8),choose(9)]*64,map_bytes()
    yield 'intermission_fallback',fixture([dm((1.,2.,128.))]),[choose(8),choose(9)],map_bytes()
    # Full entityState copying, all animation branches, queue wrap and retained health.
    actions=[(41,),init(),place(0,(10.,20.,128.),(30.,40.,50.))]
    schema=json.loads((ROOT/'docs/reference/entitystate.json').read_text())['flat_fields']
    float_indices={f['offset']//4+i for f in schema if f['type']=='float' for i in range(f['count'])}
    for turn in range(24):
        for index in range(52):
            value=bits(rng.uniform(-100,100)) if index in float_indices else rng.randrange(-10000,10000)
            value={0:0,1:1,3:0,12:0,37:1023 if turn%2 else 1022}.get(index,value)
            actions.append(bf(0,100+index,value))
        actions += [bf(0,2,turn%12 | (128 if turn%2 else 0)),bf(0,15,turn*3),field(0,0,[-39,-40,-41,0][turn%4]),
            field(72+turn%8,0,-100-turn),(10,0,1),(42,0),tv(0,0,(999.,888.,777.)),vector_field(0,0,(999.,888.,777.))]
    yield 'body_copy_wrap',fixture(),actions,map_bytes()
    actions=[(41,),init(),field(0,0,-10),bf(0,1,1022),tv(0,0,(0.,0.,128.)),(42,0)]
    for time in (5999,6000,6001,7500,7501):actions += at(time)+[(18,72)]
    yield 'body_sink_think',fixture(),actions,map_bytes()
    actions=[(41,),init(),tv(0,0,(0.,0.,128.)),(42,0)]
    for time in (7499,7500,7501,7600):actions += at(time)+[(43,72)]
    yield 'body_sink_direct',fixture(),actions,map_bytes()
    actions=[(41,),init(),vector_field(0,0,(-128.,0.,-64.)),place(0,(10.,20.,128.)),(10,0,1),(42,0)]
    yield 'body_nodrop_origin',fixture(),actions,map_bytes(True)
    actions=[]
    for blood in (0,1,-1):
        for health in (-39,-40,-41,-999,0):actions += [init(0,0,health=health),bf(0,0,blood),(45,0)]
    yield 'body_die_thresholds',fixture(),actions,map_bytes()
    actions=[(41,),init(),field(0,0,-10),tv(0,0,(0.,0.,128.)),(42,0),field(72,0,-10),hit(72,0,0,damage=29,dir=None),hit(72,0,0,damage=1,dir=None)]
    yield 'body_damage_to_gib',fixture(),actions,map_bytes()
    actions=[init(),init(64,0),init(65,0),init(66,0),bf(0,4,512)]
    for slot,kind in ((64,2),(65,1),(66,1)):actions += [bf(slot,14,kind),field(slot,19,0)]
    actions += [(44,0,63),(44,0,1022),(44,0,-1)]
    yield 'body_gib_timers',fixture(),actions,map_bytes()
    vectors=[(0.,0.,0.),(-0.,-0.,1.),(0.,1.,0.),(0.,-1.,0.),(-1.,-0.,0.),(1.,-0.,0.)]+[tuple(rng.uniform(-1000,1000) for _ in range(3)) for _ in range(256)]
    actions=[init(),init(1,0),init(2,0),tv(0,0,(1.,2.,3.)),vector_field(0,1,(0.,-25.5,0.))]
    for v in vectors:actions += [(52,0,*map(bits,v)),tv(1,0,v),tv(2,0,tuple(-x for x in v)),(46,0,2,1),(46,0,2,0),(46,0,-1,-1)]
    yield 'body_killer_yaw',fixture(),actions,map_bytes()
    actions=[init(64,0),bf(64,14,0)]
    for _ in range(256):
        velocity=tuple(rng.uniform(-200,200) for _ in range(3));normal=rng.choice([(0.,0.,1.),(0.,0.,-1.),(1.,0.,0.),(.3,.4,.8660254)])
        time=rng.choice([1000,16777217,2147483600,-2000000000]);previous=time-rng.randrange(1,200)
        actions+=at(time,previous)+[bf(64,8,5),bf(64,9,previous-25),bf(64,11,bits(rng.choice([0.,.5,1.,-.5]))),tv(64,1,velocity),
            (48,64,bits(rng.random()),1022,0,*map(bits,normal),*map(bits,(-1.5,2.5,128.5)))]
    yield 'body_bounce_precision',fixture(),actions,map_bytes()
    for nodrop in (False,True):
        z=-64. if nodrop else 128.
        actions=[(41,),init(),vector_field(0,0,(0.,0.,128.)),place(0,(-128.,0.,z),(10.,0.,0.)),tv(0,0,(-128.,0.,z)),bf(0,1,1023),(42,0),field(0,46,0)]
        for time in (1100,1200,1500,2000,6000,6100,7501,7601):actions+=at(time,time-100)+[(51,)]
        yield 'body_physics_'+str(nodrop),fixture(),actions,map_bytes(nodrop)
    actions=[(41,),init(),tv(0,0,(0.,0.,128.)),(42,0),bf(72,1,-1),bf(72,18,0),field(0,46,0)]+at(1100)+[(51,)]+at(1300,1100)+[(51,)]
    yield 'body_pushed_off_edge',fixture(),actions,map_bytes()
    actions=[(41,),init(),tv(0,0,(0.,0.,128.)),(42,0),field(72,7,-2147483648)]+at(2147483647)+[(43,72)]
    yield 'body_sink_time_wrap',fixture(),actions,map_bytes()

def cd_scenarios(root):
    if root is None:return
    with zipfile.ZipFile(root/'baseq3/pak0.pk3') as archive:
        for name in sorted(n for n in archive.namelist() if n.startswith('maps/') and n.endswith('.bsp')):
            data=archive.read(name);off,size=struct.unpack_from('<2i',data,8)
            rows=[];positions=[]
            for block in re.findall(rb'\{([^{}]*)\}',data[off:off+size]):
                pairs=[(k.decode('latin1'),v.decode('latin1')) for k,v in re.findall(rb'"([^"]*)"\s*"([^"]*)"',block)];d=dict(pairs)
                if d.get('classname','').startswith(('info_player_','team_CTF_')) or d.get('classname') in ('info_notnull','target_position'):
                    rows.append(pairs)
                    if d.get('classname') in ('info_player_deathmatch','info_player_start'):positions.append(tuple(map(float,d.get('origin','0 0 0').split())))
            assert positions,name
            actions=[choose(1),choose(2),choose(3),choose(4),choose(5),choose(8)]
            for team in (1,2):
                for state in (0,1):actions += [choose(6,team=team,state=state),choose(7,team=team,state=state)]
            actions += [(41,),init(),place(0,positions[0],(30.,-20.,0.)),tv(0,0,positions[0]),bf(0,1,1023),(42,0),field(0,46,0)]
            for time in range(1100,2200,100):actions+=at(time,time-100)+[(51,)]
            yield 'cd_'+Path(name).stem,fixture(rows),actions,data

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    output=ROOT/'build/reference/bodies';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,text,actions,data in itertools.chain(scenarios(),cd_scenarios(args.data_root)):
        if args.case and name!=args.case:continue
        mapfile=output/(name+'.bsp');mapfile.write_bytes(data);inputs=output/(name+'.bin');inputs.write_bytes(pack(text)+b''.join(command(*a) for a in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--bodies'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--bodies'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result);observed=inspect(expected.read_bytes())
        if name=='body_damage_to_gib':assert observed['final'][72]['type']==10 and 64 in observed['events']
        if name=='body_copy_wrap':assert observed['body_index']==0 and observed['final'][72]['health']==-116
        if name=='body_nodrop_origin':assert observed['body_index']==0 and observed['final'][72]['physics']==0
        if name=='body_physics_True':assert observed['traces']==1 and observed['body_index']==1 and not observed['final'][72]['linked']
        if name=='body_physics_False':assert observed['traces']>0 and observed['final'][72]['physics']==0 and not observed['final'][72]['linked']
        if name=='selection_nearest_cutoff':assert observed['selection_results']==[dict(kind=1,slot=-1,count=1)]
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),**observed,inputs_sha256=sha(inputs),expected_sha256=sha(expected),map_sha256=sha(mapfile)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words / {observed["traces"]} traces',flush=True)
    assert records
    if args.data_root and not args.case:assert sum(r['name'].startswith('cd_') for r in records)==31
    contract_map=output/'contracts.bsp';contract_map.write_bytes(map_bytes())
    print(run([ROOT/'build/spawn_tests.exe',contract_map,inputs,expected,'0','--body-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    missing=output/'missing.bin';missing.write_bytes(pack(fixture([]))+command(*choose(4)));missing_expected=output/'missing.expected'
    rejected=[]
    for binary in (output/'spawn_oracle.exe',ROOT/'build/spawn_tests.exe'):
        result=subprocess.run([str(binary),str(contract_map),str(missing),str(missing_expected),'0','--bodies'],cwd=ROOT/'build',capture_output=True,text=True)
        (output/(binary.stem+'.missing.log')).write_text(result.stdout+result.stderr,encoding='utf-8')
        assert result.returncode!=0 and "Couldn't find a spawn point" in result.stdout+result.stderr
        rejected.append(result.returncode)
    assert rejected==[72,1]
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),string_bytes=sum(r['string_bytes'] for r in records),traces=sum(r['traces'] for r in records),cd_maps=sum(r['name'].startswith('cd_') for r in records),runtime_contracts=10,missing_spawn_rejections=rejected,test_sha256=sha(ROOT/'build/spawn_tests.exe'),scope='Baseq3 spawn selection, body queue, gib/dead-yaw helpers and non-item corpse physics. player_die and the respawn wrapper are covered by test_deaths; ClientSpawn and actual item entities remain explicit boundaries. Undefined C deathmatch spawn-array overflow is rejected in MiniLang.',original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
