"""Actual Baseq3 map classes against unchanged C and real lifecycle/game subsystems.

Defined cases and measured MSVC va-overlap/NULL-format profiles are separate.
Full fresh builds alone write canonical result.json; partial/reused reports are isolated.
"""
import argparse
from collections import Counter
import hashlib
import json
import re
import struct
import subprocess
import sys
from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_game_lifecycle import action, setvar, entity, maptext, init, pack, artifact_stem
from toolchain import ROOT, run


def bits(value):return struct.unpack('<i',struct.pack('<f',value))[0]
def scalar(slot,field,value):return action(21,slot,field,value)
def vec(slot,field,value):return action(22,slot,field,first=','.join(str(bits(x)) for x in value))
def txt(slot,field,value):return action(23,slot,field,int(value is None),first='' if value is None else value)
def client(slot,field,value=0,text=''):return action(24,slot,field,value,first=text)
def use(slot=72,activator=0,other=-1):return action(20,slot,other,activator)
def direct(slot,method):return action(31,slot,method)
def mutate(event,arg,operation,nth=1):return action(30,event,arg,nth,','.join(map(str,operation[:4])),operation[4])
def player(slot=0,team=0,health=100):
    return [scalar(slot,11,1),scalar(slot,3,health),scalar(slot,4,slot),client(slot,1,2),client(slot,2,team),
            client(slot,3,team),client(slot,5,health),client(slot,6,100),client(slot,13,text=f'Player{slot}')]
def fixture(*rows,gametype=0,maximum=4,seed=1):
    return [setvar('g_log',''),setvar('g_gametype',gametype),setvar('sv_maxclients',maximum),init(seed=seed,entities=maptext(*rows))]
def row(kind,**fields):return dict(classname=kind,**fields)
def spec(name,actions,domain='defined',**expected):return dict(name=name,actions=actions,domain=domain,expected=expected)


def scenarios():
    for kind in ('target_give','target_remove_powerups','target_score','target_print','misc_portal_surface','misc_portal_camera'):
        yield spec('spawn_'+kind,fixture(row(kind)),spawn_kind=kind)
    for count in (0,1,-1,17):
        yield spec('score_count_'+str(count),fixture(row('target_score',count=count))+player()+[use()],score=(count or 1))
    yield spec('print_broadcast',fixture(row('target_print',message='Hello'))+[use()],messages=[[-1,'cp "Hello"']])
    yield spec('portal_mirror',fixture(row('misc_portal_surface',origin='1.25 -2.75 96')),mirror=True)
    for roll,expected in [('0',0),('90',64),('360',256),('-360',-256),('16777216',11930464),('16777217',11930464),('3019898624',2147483465),('-3019898880',-2147483648)]:
        yield spec('camera_roll_'+roll,fixture(row('misc_portal_camera',roll=roll)),camera_num=expected)
    yield spec('portal_missing_owner',fixture(row('misc_portal_surface',target='absent'))+[direct(72,7)],freed=72)
    yield spec('portal_camera_fallback',fixture(row('misc_portal_surface',target='cam'),row('misc_portal_camera',targetname='cam',angles='10 45 0'))+[direct(72,7)],owner=73)
    for label,flags,speed,delta in [
        ('default_y',0,100,[0,100,0]),
        ('x_axis',8,37,[37,0,0]),
        ('z_axis_negative',4,-25,[0,0,-25]),
    ]:
        fields=dict(model='*1',spawnflags=flags)
        if speed != 100:fields['speed']=speed
        yield spec('mover_rotating_'+label,fixture(row('func_rotating',**fields)),mover_rotation=delta)
    import map_portal_cases, map_target_cases
    yield from map_portal_cases.scenarios(sys.modules[__name__])
    yield from map_target_cases.scenarios(sys.modules[__name__])


class Reader:
    def __init__(self, data): self.data, self.offset, self.words = data, 0, 0
    def ints(self, count=1):
        row=struct.unpack_from('<'+'i'*count,self.data,self.offset);self.offset+=4*count;self.words+=count;return row
    def integer(self): return self.ints()[0]
    def blob(self):
        size=self.integer()
        if size==-1:return None
        if size<0 or self.offset+size>len(self.data):raise AssertionError('invalid native blob')
        result=self.data[self.offset:self.offset+size];self.offset+=size;return result
    def string(self):
        result=self.blob();return None if result is None else result.decode('utf-8')


def inspect_snapshot(data):
    r=Reader(data); head=r.ints(23); counts=r.ints(6);scores=r.ints(4);sorted_clients=r.ints(64);bodies=r.ints(8)
    intermission=r.ints(10);changemap=r.string();vote=r.string();display=r.string();r.ints(4)
    for _ in range(2):r.string();r.ints(3)
    spawnvars=[(r.string(),r.string()) for _ in range(head[15])]
    team=r.ints(9);registered=r.ints(256);remaps=[(r.string(),r.string(),r.integer()) for _ in range(r.integer())]
    weapon=r.ints(13);allocated=r.integer();pool=r.blob();ip_count=r.integer();ip_rows=r.ints(2048);banbytes=r.blob()
    vms=[]
    for _ in range(r.integer()):
        count=r.integer();present=r.integer();vms.append((count,r.ints(4),r.string()) if present else (count,None,None))
    num,flags=r.ints(2);registry={}
    for _ in range(num):
        name,value,default,latched=(r.string() for _ in range(4));words=r.ints(5);registry[name]=(value,default,latched,words)
    configs=[r.string() for _ in range(1024)];clients=[]
    for _ in range(64):
        ps=r.ints(117);prefix=r.ints(23);name=r.string();suffix=r.ints(47);clients.append((ps,prefix,name,suffix))
    entities={}
    for _ in range(r.integer()):
        slot=r.integer();es=r.ints(52);active,client=r.ints(2);classname=r.string();base=r.ints(45)
        spawnflags=r.integer();target,targetname,model,model2=(r.string() for _ in range(4));rates=r.ints(3)
        message,ent_team=r.string(),r.string();damage=r.integer();shader,shader_new=r.string(),r.string();tail=r.ints(41)
        entities[slot]={'active':active,'client':client,'classname':classname,'base':base,'targetname':targetname,'team':ent_team,
                        'message':message,'tail':tail,'state':es,'spawnflags':spawnflags,'target':target,'rates':rates,'damage':damage}
    assert r.integer()==950
    mutation=r.ints(7);mutation_text=r.string();callback_count=r.integer()
    assert callback_count==len(entities)
    callbacks={slot:r.ints(3) for slot in entities}
    assert r.offset==len(data),(r.offset,len(data))
    return dict(head=head,counts=counts,scores=scores,bodies=bodies,team=team,registered=registered,remaps=remaps,weapon=weapon,
                allocated=allocated,pool=pool,ip_count=ip_count,banbytes=banbytes,vms=vms,registry=registry,configs=configs,
                clients=clients,entities=entities,spawnvars=spawnvars,word_count=r.words,callbacks=callbacks,mutation=mutation,mutation_text=mutation_text)


def inspect(data):
    r=Reader(data);last=None;effects=[];snapshots=0;draws=[];normalizations=None;callspawn=[]
    while r.offset<len(data):
        tag=r.integer()
        if tag==900:
            payload=r.blob();last=inspect_snapshot(payload);r.words+=last['word_count'];snapshots+=1
        elif tag==901:
            kind,a,b=r.ints(3);key=r.string();value=r.blob();assert last is not None
            effects.append((kind,a,b,key,value,last))
        elif tag==902:draws.append(r.integer())
        elif tag==903:normalizations=r.integer()
        elif tag==904:callspawn.append(r.integer())
        elif tag==999:raise AssertionError('unexpected native error '+r.string())
        else:raise AssertionError(('unknown lifecycle record',tag,r.offset))
    return dict(last=last,effects=effects,snapshots=snapshots,draws=draws,normalizations=normalizations,callspawn=callspawn,exact_words=r.words)

def semantic_proof(scenario,parsed):
    name=scenario['name'];expected=scenario['expected'];last=parsed['last'];effects=parsed['effects'];counts=Counter(e[0] for e in effects)
    messages=[[e[1],e[4].decode('utf-8')] for e in effects if e[0]==20]
    assert counts[6]>=9 and last['bodies']==tuple(range(64,72))
    if 'spawn_kind' in expected:
        kind=expected['spawn_kind'];callbacks=last['callbacks'][72]
        target_callbacks={'target_give':1,'target_remove_powerups':2,'target_score':3,'target_print':4}
        if kind in target_callbacks:assert callbacks[1]==target_callbacks[kind]
        if kind=='target_score':assert last['entities'][72]['base'][13]==1
        if kind=='misc_portal_surface':assert last['entities'][72]['state'][1]==6 and last['entities'][72]['base'][22]==64
        assert counts[18]==0, 'the six new classes must never use the unported callback'
    if 'messages' in expected:assert messages==expected['messages'],(name,messages,expected['messages'])
    if 'score' in expected:assert last['clients'][0][0][62]==expected['score'],(name,last['clients'][0][0][62])
    if expected.get('mirror'):assert last['entities'][72]['state'][23:26]==last['entities'][72]['state'][26:29]
    if 'camera_num' in expected:assert last['entities'][72]['state'][42]==expected['camera_num']
    if 'freed' in expected:assert last['entities'][expected['freed']]['active']==0
    if 'owner' in expected:assert last['entities'][72]['base'][23]==expected['owner']
    if 'mover_rotation' in expected:
        ent=last['entities'][72];delta=tuple(bits(value) for value in expected['mover_rotation'])
        assert ent['state'][1]==4 and ent['state'][12]==2,(name,ent['state'][1],ent['state'][12])
        assert ent['state'][18:21]==delta,(name,ent['state'][18:21],delta)
        assert ent['base'][22]==128 and ent['damage']==2,(name,ent['base'][22],ent['damage'])
        assert last['callbacks'][72]==(0,99,0),(name,last['callbacks'][72])
    import map_portal_cases, map_target_cases
    portal_proof=map_portal_cases.validate(scenario,parsed)
    target_proof=map_target_cases.validate(scenario,parsed)
    return dict(portal_proof=portal_proof,target_proof=target_proof,snapshots=parsed['snapshots'],effect_kinds=dict(sorted(counts.items())),native_random_draws=parsed['draws'],
                ctf_first_status_normalizations=parsed['normalizations'],server_messages=messages,assertions=sorted(expected))


def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/map_objects';out.mkdir(parents=True,exist_ok=True)
    source_manifest=out/'original_sources.json'
    if not args.reuse_build:
        sources=build(out,lifecycle=True)
        source_manifest.write_text(json.dumps([p.relative_to(ROOT).as_posix() for p in sorted(set(sources))],indent=2)+'\n',encoding='utf-8')
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/map_object_tests.ml','--output','map_object_tests.exe'],check=True)
    sources=[ROOT/p for p in json.loads(source_manifest.read_text(encoding='utf-8'))]
    native=out/'spawn_oracle.exe';mini=ROOT/'build/map_object_tests.exe';build_date=run([native,'--build-date'],out).strip()
    bsp=out/'empty.bsp';bsp.write_bytes(map_bytes());records=[];used={}
    hosts=[ROOT/'tests/reference/spawn_oracle.c',ROOT/'tests/reference/spawn_server.c',ROOT/'tests/reference/collision_oracle.c',
           ROOT/'tests/reference/transition_server.c',*sorted((ROOT/'tests/reference').glob('*.inc')),
           ROOT/'tests/reference/game_lifecycle_api.h',ROOT/'tests/reference/game_lifecycle_cvars.c']
    test_sources=[ROOT/'tests/map_object_tests.ml',ROOT/'scripts/test_game_lifecycle.py',ROOT/'scripts/test_map_objects.py',ROOT/'scripts/spawn_oracle.py',ROOT/'tests/map_object_contracts.ml',ROOT/'scripts/map_portal_cases.py',ROOT/'scripts/map_target_cases.py',ROOT/'scripts/test_bodies.py',ROOT/'scripts/test_combat.py',ROOT/'scripts/toolchain.py',ROOT/'scripts/inventory.py']
    port_paths=sorted(set([*sorted((ROOT/'src/mq3').rglob('*.ml')),*hosts,*test_sources]))
    compiled_paths=[native,mini,bsp,*sorted(out.glob('*.inc'))]
    bound_paths=sorted(set([*sources,*port_paths,*compiled_paths]))
    before_hashes={p.relative_to(ROOT).as_posix():sha(p) for p in bound_paths}
    cases=list(scenarios());assert len({c['name'] for c in cases})==len(cases)
    for scenario in cases:
        name,actions=scenario['name'],scenario['actions']
        stem=artifact_stem(name);folded=stem.casefold()
        if folded in used:raise RuntimeError(f'Artifact collision: {name!r}, {used[folded]!r}')
        used[folded]=name
        if args.case and args.case!=name:continue
        inp,expected,raw=out/(stem+'.bin'),out/(stem+'.expected'),out/(stem+'.raw.jsonl');inp.write_bytes(pack(actions,build_date))
        run([native,bsp,inp,expected,'0','--map-objects',raw],out,log=out/(stem+'.oracle.log'))
        parsed=inspect(expected.read_bytes());proof=semantic_proof(scenario,parsed)
        comparison='native_profile_only' if scenario['domain']=='va_overlap' else 'exact_native_mini'
        if comparison=='exact_native_mini':
            output=run([mini,bsp,inp,expected],ROOT/'build',log=out/(stem+'.test.log'),timeout=600)
            match=re.search(r'(\d+) map-object actions / (\d+) exact words / (\d+) ordered effects',output)
            if not match:raise RuntimeError(output)
            assert tuple(map(int,match.groups()))==(len(actions),parsed['exact_words'],len(parsed['effects']))
            exact_words,ordered_effects=int(match[2]),int(match[3])
        else:
            exact_words=ordered_effects=0
            output=f"PROFILE: {len(actions)} actions / {parsed['exact_words']} native words / {len(parsed['effects'])} native effects"
        raw_records=[json.loads(line) for line in raw.read_text(encoding='utf-8').splitlines()]
        assert len(raw_records)==parsed['normalizations']
        for raw_index,raw_record in enumerate(raw_records):
            assert raw_record['sequence']==raw_index and raw_record['index']==23
            assert len(raw_record['bytes'])==3 and raw_record['bytes'][0]==48 and raw_record['bytes'][2]==0
            assert all(isinstance(byte,int) and 0<=byte<=255 for byte in raw_record['bytes'])
        records.append(dict(name=name,artifact_stem=stem,domain=scenario['domain'],comparison=comparison,actions=len(actions),exact_words=exact_words,ordered_effects=ordered_effects,
            native_words=parsed['exact_words'],native_effects=len(parsed['effects']),
            bytes=expected.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(expected),raw_ctf_sha256=sha(raw),semantic_proof=proof))
        print(f'{len(records)}/{len(cases)} {name}: '+output.strip(),flush=True)
    if not records:raise RuntimeError('No matching map-object scenario')
    stem=records[0]['artifact_stem'];contracts=run([mini,bsp,out/(stem+'.bin'),out/(stem+'.expected'),'--contracts'],ROOT/'build',log=out/'contracts.log',timeout=600)
    match=re.search(r'PASS: (\d+) map-object runtime contracts',contracts)
    if not match:raise RuntimeError(contracts)
    print(contracts.strip(),flush=True)
    after_hashes={p.relative_to(ROOT).as_posix():sha(p) for p in bound_paths}
    if before_hashes!=after_hashes:raise RuntimeError('Map-object sources or compiled artifacts changed during the comparison run')
    def domain_report(domain):
        selected=[r for r in records if r['domain']==domain]
        return dict(scenario_count=len(selected),scenarios=selected,actions=sum(r['actions'] for r in selected),
            exact_words=sum(r['exact_words'] for r in selected),ordered_effects=sum(r['ordered_effects'] for r in selected),
            native_words=sum(r['native_words'] for r in selected),native_effects=sum(r['native_effects'] for r in selected),
            output_bytes=sum(r['bytes'] for r in selected))
    defined=domain_report('defined');crt=domain_report('crt_null');overlap=domain_report('va_overlap')
    result=dict(passed=True,canonical=not args.case and not args.reuse_build,**defined,
        crt_null_profile=crt,va_overlap_profile=overlap,all_scenario_count=len(records),runtime_contracts=int(match[1]),
        profile='Unchanged Baseq3 map classes and their use/think functions, including deterministic func_rotating axes, composed with real lifecycle, arena, Cvars, parsing, items, scores, CTF and CM/SV.',
        scope='Input begins with real G_InitGame and entity text. Engine FS/serverinfo/LocateGameData and Bot-AI are observed hosts. The PrintMsg delivery adapter reproduces the original quote replacement and server command, while actual item, flag and score algorithms execute on both sides. All observed game delivery effects carry full ordered snapshots. Internal item/CM trace payloads are not new records here; the separate Items/Combat/Collision suites cover those, and this suite asserts concrete item outcomes and SV state. Full snapshots include entities, clients, original server metadata, Cvars, arena bytes, configstrings, module state, concrete callbacks and post-delivery fixture mutation controls. One selected native first-CTF-status byte is archived under the existing isolated normalization. Native NULL %s formatting and multiple same-team va-buffer recipients are measured separately as MSVC CRT profiles, excluded from defined-case counters; Mini contracts independently require intact multi-recipient messages. Unsupported model states and original undefined format/cast/pointer cases use separate Mini contracts; no native parity is claimed for those rejections.',
        build_date=build_date,source_bindings_unchanged_during_run=True,normalization='Exact isolated Team_InitGame red=0/blue=-1 host boundary only; raw sequence/index/three bytes are archived per case.',
        original_sources={p.relative_to(ROOT).as_posix():sha(p) for p in sorted(set(sources))},
        hosts={p.relative_to(ROOT).as_posix():sha(p) for p in sorted(set(hosts))},
        tests={p.relative_to(ROOT).as_posix():sha(p) for p in test_sources},
        port_sources={p.relative_to(ROOT).as_posix():sha(p) for p in port_paths},
        compiled_artifacts={p.relative_to(ROOT).as_posix():sha(p) for p in compiled_paths},test_sha256=sha(mini),oracle_sha256=sha(native),map_sha256=sha(bsp),
        all_output_bytes=sum(r['bytes'] for r in records),normalization_count=sum(r['semantic_proof']['ctf_first_status_normalizations'] for r in records))
    selected=records[0]['artifact_stem'] if args.case else None
    filename=('reused-'+(selected or 'all')+'.json') if args.reuse_build else ((selected+'.partial.json') if selected else 'result.json')
    destination=out/filename
    destination.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['scenario_count']} defined map-object scenarios / {crt['scenario_count']} NULL CRT / {overlap['scenario_count']} va-overlap / {result['exact_words']} exact words / {result['runtime_contracts']} contracts",flush=True)


if __name__=='__main__':main()
