"""Native baseq3 ranking, score messages and match-exit decisions versus MiniLang."""
import argparse, collections, json, random, re, struct, subprocess, sys, shutil
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run, msvc_env
from spawn_oracle import build
from spawn_fixtures import pack
from test_bodies import fixture, map_bytes
from test_combat import command, bits, field

def client(slot=0,connected=2,team=0,score=0,ping=42,specstate=0,spectator=0,spectime=0,enter=0,hits=0,shots=0,ready=0,flags=0,name=1):
    return (60,slot,connected,team,score,ping,specstate,spectator,spectime,enter,hits,shots,ready,flags,name)
def cf(slot,key,value):return (61,slot,key,value)
def lf(key,value):return (62,0,key,value)
def limits(count=8):return [lf(0,count),lf(1,count)]
def award(slot=0,score=1,origin=(1.5,-2.5,128.25),op=66):return (op,slot,score,*map(bits,origin))
def basic():return limits()+[client(),client(1,score=-1),(63,)]

def inspect(data):
    off=0;counts=collections.Counter();clients={};meta=[];messages=[];logs=[];transitions=[];plums=[];base_state=[]
    def ints(count):
        nonlocal off
        row=struct.unpack_from('<'+'i'*count,data,off);off+=count*4;return row
    def string():
        nonlocal off
        size=ints(1)[0]
        if size<0:return None
        value=data[off:off+size].decode('latin1');off+=size;return value
    def snapshot():
        row=ints(124)
        for _ in range(9):string()
        if row[2]==78:plums.append((row[0],row[22],row[79]))
    def extra():
        ints(6)
        if ints(1)[0]:ints(132)
    while off<len(data):
        kind=ints(1)[0];counts[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:ints(2);snapshot()
        elif kind in (5,6):snapshot()
        elif kind==7:ints(1)
        elif kind==12:ints(2)
        elif kind==20:ints(6)
        elif kind in (21,22,28,29,30,37,45,46):ints(1)
        elif kind in (23,24,25):ints(9)
        elif kind==26:
            ints(5);assert ints(1)[0]==8;base_state=list(ints(8));num=base_state[1]
            for _ in range(num-64+1):snapshot()
            for _ in range(3):snapshot();extra()
            for _ in range(num-64+1):extra()
        elif kind==41:logs.append(string())
        elif kind==42:messages.append((ints(1)[0],string()))
        elif kind==43:transitions.append(list(ints(8)))
        elif kind==44:
            meta=list(ints(85));clients={}
            for slot in range(64):
                state=list(ints(117));fields=list(ints(9));name=string();ent=list(ints(5))
                # PERS_SCORE begins at byte 248, PERS_RANK at 256.
                clients[slot]=dict(state=state,fields=fields,name=name,entity=ent)
            size=ints(1)[0];ints(size*2)
        else:raise AssertionError((off,kind))
    assert off==len(data)
    return dict(messages=messages,logs=logs,transitions=transitions,rank_comparisons=counts[45],tie_probes=counts[46],plum_observations=len(plums),
        final_level=meta,final_clients=clients,final_spawn_fields=base_state[2:5])

def scenarios():
    rng=random.Random(0x53434f52)
    yield 'empty',limits()+[(63,),(64,0),(65,),(70,)]
    actions=limits(2)+[client(),client(1,score=-1)]
    for mode in (0,3):
        for count in (1,64):actions += [lf(12,mode),lf(16,1),lf(17,count),lf(18,37),(63,),(64,0)]
    yield 'rank_native_reset_side_effects',actions
    for mode in range(8):
        actions=limits()+[lf(12,mode),client(0,score=5),client(1,score=5),client(2,connected=1,score=99),client(3,team=3,score=100,spectime=100),client(4,team=3,spectime=50),
            client(5,flags=8,score=-10),client(6,team=3,specstate=3),client(7,team=3,spectator=-1),(63,),(64,0),(65,),(70,)]
        for red,blue in ((1,0),(0,1),(5,5),(-1,-2)):
            actions += [lf(101,red),lf(102,blue),(63,),(70,),(64,1)]
        yield 'rank_mode_'+str(mode),actions
    for count in (1,2,7,8,9,16,32,64):
        actions=limits(count)
        for iteration in range(16):
            for slot in range(count):
                team=rng.choice([0,0,1,2,3]);state=rng.choice([0,0,3]) if team==3 else 0
                actions += [client(slot,connected=rng.choice([0,1,2,2]),team=team,score=rng.randrange(-3,4),
                    specstate=state,spectator=rng.choice([-2,-1,0,1]) if team==3 else 0,spectime=rng.randrange(-2,3),flags=rng.choice([0,8]))]
            actions += [lf(12,rng.randrange(5)),(63,),(64,0),(70,)]
        yield 'rank_random_'+str(count),actions
    for mode in ('equal','connecting','special','mixed_special'):
        actions=limits(64)
        for slot in range(64):
            actions += [client(slot,connected=1 if mode=='connecting' else 2,team=3 if mode in ('special','mixed_special') else 0,
                specstate=3 if mode=='special' or mode=='mixed_special' and slot%2 else 0,spectator=-1 if mode=='mixed_special' and slot%2==0 else 0)]
        for count in (0,1,2,7,8,9,15,16,31,32,63,64):
            for i in range(count):actions += [lf(200+i,i)]
            actions += [(69,count)]
        actions += [(68,rng.randrange(64),rng.randrange(64)) for _ in range(128)]
        yield 'sort_'+mode,actions
    actions=limits(8)+[client(0),client(1,score=10),(63,)]
    for ping in (-2147483648,-1,0,998,999,1000,2147483647):
        for enter in (-2147483648,-60000,0,1000,60000,2147483647):
            actions += [cf(0,2,ping),cf(0,6,enter),(64,0)]
    for hits,shots in [(0,0),(1,3),(-1,3),(1,-3),(-1,-3),(2147483647,100),(-2147483648,1),(536870912,1),(-536870912,1),(1000,-1)]:
        actions += [cf(0,7,hits),cf(0,8,shots),(64,1)]
    for killed,rank in ((0,0),(1,0),(0,1),(0,16384),(-1,0)):
        actions += [cf(0,108,killed),cf(0,102,rank),(64,0)]
    yield 'scoreboard_integer_edges',actions
    actions=limits(64)+[client(slot,score=slot,team=slot%4,name=slot%7,hits=slot,shots=64,ping=2000) for slot in range(64)]
    actions += [(63,),(64,0)]
    for slot in range(64):
        for index in (9,10,11,12,13,14):actions += [cf(slot,100+index,2147483647)]
        actions += [cf(slot,11,-1),cf(slot,6,-2147483648)]
    actions += [(64,63),(65,),(72,3)]
    yield 'scoreboard_and_log_caps',actions
    for excess in (0,1):
        actions=limits(35)
        for slot in range(35):
            score=1000000000 if slot==0 else 10**(5+excess) if slot==1 else 0
            actions += [client(slot,score=score),lf(200+slot,slot)]
        actions += [lf(13,35),(64,0)]
        yield 'scoreboard_exact_cap_'+str(excess),actions
    actions=basic()+[cf(0,103,2),award(),award(score=-2),award(score=0),(64,0)]
    for mode in (0,1,2,3,4,5,6,7):
        actions += [lf(12,mode),award(score=3),lf(3,-1),award(score=100),lf(3,0),(75,)]
    actions += [cf(0,100,2147483647),award(score=1),cf(0,14,0),award(score=100),(64,0)]
    yield 'add_score_rules',actions
    actions=basic()+[lf(12,3),cf(0,1,1)]
    for team in range(4):actions += [cf(0,103,team),award(score=7),(75,)]
    actions += [cf(0,14,0),award(score=100),(63,),(64,0),cf(0,14,1),award(score=1),(11,0),(63,),(64,0)]
    yield 'team_score_and_client_storage',actions
    actions=basic()+[cf(0,15,63),award(score=-100,op=67),(64,0),lf(5,1300),(74,),lf(5,1301),(74,)]
    yield 'plum_recipient_and_expiry',actions
    for kind in ('timelimit','frag_free','frag_red','frag_blue','capture_red','capture_blue'):
        actions=basic()+[cf(0,13,5),lf(5,61000)]
        actions += {'timelimit':[lf(7,1)],'frag_free':[lf(8,10),cf(0,100,10)],'frag_red':[lf(8,10),lf(101,10)],
            'frag_blue':[lf(8,10),lf(102,10)],'capture_red':[lf(12,4),lf(9,10),lf(101,10)],'capture_blue':[lf(12,4),lf(9,10),lf(102,10)]}[kind]
        actions += [(63,),lf(5,61999),(71,),lf(5,62000),(71,)]
        yield 'exit_'+kind,actions
    actions=limits()+[client(),client(1),lf(8,1),lf(7,1),lf(5,100000),(63,),(70,),cf(0,100,1),(63,)]
    yield 'exit_sudden_death',actions
    for warmup in (0,-1,1):
        actions=limits()+[lf(7,1),lf(3,warmup),client(),(63,),lf(5,60999),(71,),lf(5,61000),(71,)]
        yield 'exit_warmup_'+str(warmup),actions
    actions=basic()+[lf(7,1),lf(8,1),cf(0,100,1),lf(5,61000),(63,)]
    yield 'exit_limit_priority',actions
    actions=basic()+[lf(12,4),lf(8,1),cf(0,100,100),(63,),lf(5,0),(72,3)]
    yield 'exit_capture_mode_ignores_frags',actions
    actions=basic()+[lf(7,2147483647),lf(5,2147483647),lf(6,-2147483648),(71,),lf(4,2147483600),lf(5,-2147482696),(71,)]
    yield 'exit_time_wrap',actions
    actions=basic()+[lf(4,1000),lf(5,1999),(71,),lf(15,1),lf(5,2000),(63,)]
    yield 'exit_callback_reentrant_state',actions
    for mode in ('nobody','all','one','bots','single','clientnum','over16'):
        count=20 if mode=='over16' else 3;actions=limits(count)+[lf(2,1000),lf(12,2 if mode=='single' else 0)]
        for slot in range(count):
            actions += [client(slot,score=-slot,team=3 if slot==2 else 0,ready=int(mode in ('all','over16') or mode in ('one','bots','single','clientnum') and slot==0),flags=8 if mode=='bots' and slot>0 else 0)]
        if mode=='clientnum':actions += [cf(0,12,1),cf(1,10,8)]
        actions += [(63,)]
        for time in (5999,6000,6001,15999,16000):actions += [lf(5,time),(73,)]
        yield 'intermission_'+mode,actions
    actions=limits()+[client(0,ready=1),client(1),lf(2,1000),lf(5,6000),(63,),cf(0,9,0),lf(5,7000),(73,),cf(0,9,1),lf(5,8000),(73,),lf(5,17999),(73,),lf(5,18000),(73,)]
    yield 'intermission_ready_reset',actions
    actions=limits()+[client(0,ready=1),lf(2,1000),lf(5,6000),lf(15,2),(63,)]
    yield 'intermission_exit_callback_mutation',actions
    actions=limits(1)+[lf(1,3),client(0),client(1,score=10),lf(8,10),(63,),lf(14,2),lf(201,1),(71,)]
    yield 'client_limit_sources',actions

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/scores';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    mapfile=output/'fixture.bsp';mapfile.write_bytes(map_bytes());records=[]
    for name,actions in scenarios():
        if args.case and args.case!=name:continue
        inputs=output/(name+'.bin');inputs.write_bytes(pack(fixture())+b''.join(command(*a) for a in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--scores'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--scores'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result);observed=inspect(expected.read_bytes())
        if name=='empty':assert observed['messages']==[(0,'scores 0 0 0')]
        if name=='rank_native_reset_side_effects':assert observed['final_spawn_fields']==[0,0,37]
        if name.startswith('exit_') and name in ('exit_timelimit','exit_frag_free','exit_frag_red','exit_frag_blue','exit_capture_red','exit_capture_blue'):
            assert len(observed['transitions'])==1 and observed['transitions'][0][0]==1 and observed['transitions'][0][2]==0
            assert sum(line.startswith('Exit:') for line in observed['logs'])==1
        if name=='intermission_one':assert len(observed['transitions'])==1 and observed['transitions'][0][0]==2 and observed['transitions'][0][1]==16000
        if name in ('intermission_nobody','intermission_single'):assert not observed['transitions']
        if name=='intermission_bots':assert len(observed['transitions'])==4
        if name=='scoreboard_and_log_caps':assert len(observed['logs'])<=33 and int(observed['messages'][0][1].split()[1])<64
        if name.startswith('scoreboard_exact_cap_'):
            message=observed['messages'][0][1];parts=message.split(' ',4)
            if name.endswith('_0'):assert int(parts[1])==34 and len(parts[4])+1==1024
            else:assert int(parts[1])==33
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),messages=len(observed['messages']),log_lines=len(observed['logs']),transitions=observed['transitions'],rank_comparisons=observed['rank_comparisons'],tie_probes=observed['tie_probes'],plum_observations=observed['plum_observations'],final_level=observed['final_level'],inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words / {len(observed["messages"])} messages',flush=True)
    assert records
    print(run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--score-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    env=msvc_env('x86');crt=Path(env['WINDOWSSDKDIR'])/'Source'/env['WINDOWSSDKVERSION'].strip('\\/')/'ucrt/stdlib/qsort.cpp'
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),string_bytes=sum(r['string_bytes'] for r in records),messages=sum(r['messages'] for r in records),log_lines=sum(r['log_lines'] for r in records),runtime_contracts=12,test_sha256=sha(ROOT/'build/spawn_tests.exe'),sort_profile=dict(name='native Windows UCRT qsort',sdk=env['WINDOWSSDKVERSION'],qsort_source_sha256=sha(crt),compiler_sha256=sha(Path(shutil.which('cl',path=env['PATH']))),static_runtime_sha256=sha(Path(env['UNIVERSALCRTSDKDIR'])/'Lib'/env['UCRTVERSION'].strip('\\/')/'ucrt/x86/libucrt.lib')),scope='Baseq3 score/rank/scoreboard and match-exit decisions. Server commands and formatted game-log payloads observed; BeginIntermission/ExitLevel are explicit callbacks, not complete map transitions. player_die integration is covered by test_deaths and ClientSpawn separately by test_client_spawn; client rendering and networking remain open. Invalid client ranges and native division overflow reject explicitly.',original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
