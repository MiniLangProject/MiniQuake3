"""Unchanged G_InitGame/G_ShutdownGame against the composed MiniLang game port.

The native build uses real engine Cvars, IP filters, game arena, sessions,
BodyQue, complete g_spawn parsing, item registration, team grouping and CM/SV.
Only engine delivery and absent Bot-AI are observed hosts. Direct repeated Init
runs in the same module; a separate scenario process represents a fresh VM image.
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
from toolchain import ROOT, run


def ints(*values):
    return struct.pack('<' + 'i' * len(values), *values)


def text(value):
    data = value.encode('utf-8')
    return ints(len(data)) + data


def action(kind, a=0, b=0, c=0, first='', second=''):
    return kind, a, b, c, first, second


def setvar(name, value, force=1):
    return action(3, force, first=name, second=str(value))


def entity(**fields):
    return '{\n' + ''.join('"' + k + '" "' + str(v) + '"\n' for k, v in fields.items()) + '}\n'


def maptext(*rows, **world):
    return entity(classname='worldspawn', **world) + ''.join(entity(**row) for row in rows)


def init(time=1000, seed=1, restart=0, entities=None):
    return action(1, time, seed, restart, first=maptext() if entities is None else entities)


def shutdown(restart=0):
    return action(2, restart)


def pack(actions, build_date):
    return text(build_date) + ints(len(actions)) + b''.join(ints(*row[:4]) + text(row[4]) + text(row[5]) for row in actions)


def scenarios():
    yield 'default_init_shutdown', [init(), shutdown()]
    yield 'empty_action_stream', []
    yield 'callspawn_null_classname_diagnostic', [action(14)]
    yield 'fresh_module_shutdown_before_init', [shutdown(), shutdown(-1)]
    for gametype in range(8):
        yield f'gametype_{gametype}', [setvar('g_gametype', gametype), init(), shutdown()]
    for gametype in (-1, 8, 2147483647, -2147483648):
        yield f'invalid_gametype_vm_before_refresh_{gametype}', [setvar('g_gametype', gametype), init(), shutdown(), init(2000, 2, 1), shutdown(1)]
    for maximum in (0, 1, 3, 64):
        yield f'maxclients_{maximum}', [setvar('sv_maxclients', maximum), action(5), init(), shutdown()]
    yield 'poisoned_level_arrays_and_module_retention', [action(5), init(), shutdown(), init(2000, 2, 1), shutdown(1)]
    yield 'bodyque_second_initialization_retains_pending_slots', [init(), action(13), shutdown()]
    yield 'same_module_init_without_shutdown', [init(seed=123), init(2000, 123, 1), shutdown()]
    yield 'same_module_shutdown_twice_preserves_handle', [init(), shutdown(), shutdown(1)]
    for restart in (-2147483648, -1, 0, 1, 2147483647):
        yield f'bot_restart_argument_{restart}', [setvar('bot_enable', 1), init(restart=restart), shutdown(restart)]
    yield 'bot_engine_query_live_at_shutdown', [setvar('bot_enable', 1), init(), setvar('bot_enable', 0), shutdown(), setvar('bot_enable', -3), shutdown(7)]
    yield 'log_disabled_empty_name', [setvar('g_log', ''), init(), shutdown()]
    yield 'log_open_failure', [action(4, 0, first='ignored serverinfo'), init(), shutdown()]
    yield 'log_sync_negative_handle', [setvar('g_logSync', -2), action(4, -7, first='\\mapname\\signed-handle'), init(), shutdown()]
    yield 'log_name_255_utf8_bytes', [setvar('g_log', 'ä' * 127 + 'x'), init(), shutdown()]
    yield 'log_dedicated_console_and_file', [setvar('dedicated', 2), init(), shutdown()]
    yield 'log_dedicated_no_file', [setvar('dedicated', -1), setvar('g_log', ''), setvar('g_doWarmup', 1), init(), shutdown()]
    yield 'log_dedicated_open_failure', [setvar('dedicated', 1), action(4, 0, first=''), init(), shutdown()]
    yield 'log_serverinfo_quotes_newline_utf8', [action(4, 19, first='\\name\\Höhle "quoted"\nnext'), setvar('dedicated', 1), init(), shutdown()]
    yield 'log_serverinfo_native_payload_limit', [action(4, 7, first='s' * 1005), init(), shutdown()]
    for time in (-2147483648, -61000, -1, 0, 59999, 60000, 2147483647):
        yield f'log_timestamp_{time}', [setvar('dedicated', 1), init(time=time), shutdown()]
    yield 'precache_buildscript', [setvar('com_buildScript', 1), init(), shutdown()]
    yield 'precache_singleplayer_short_circuit', [setvar('g_gametype', 2), setvar('com_buildScript', 17), setvar('bot_enable', 1), init(), shutdown()]
    yield 'precache_existing_model_and_sound_indices', [action(9, 289, first='existing-sound'), action(9, 290, first='sound/player/fry.wav'),
        action(9, 33, first='models/mapobjects/podium/podium4.md3'), setvar('com_buildScript', 1), init(), init(2000, 2, 1), shutdown()]
    yield 'engine_configstrings_survive_direct_init', [action(9, 22, first='old intermission'), action(9, 23, first='old flags'),
        action(9, 544, first='old player'), init(), shutdown()]
    for restarted, warmup in ((0, 0), (0, 1), (0, -1), (1, 1), (-1, 1)):
        yield f'world_warmup_{restarted}_{warmup}', [setvar('g_restarted', restarted), setvar('g_doWarmup', warmup),
            setvar('g_warmup', 30), setvar('dedicated', 1), init(), shutdown()]
    yield 'worldspawn_music_motd_gravity_effects', [setvar('g_motd', 'MötD'), init(entities=maptext(music='music/one.wav music/two.wav',
        message='Map name', gravity='755.75', enableDust='-1', enableBreath='2')), action(10), shutdown()]
    yield 'worldspawn_nul_terminates_token_source', [init(entities=maptext()+ '\0'+entity(classname='weapon_rocketlauncher')), shutdown()]
    yield 'worldspawn_terminal_nul', [init(entities=maptext()+'\0'), shutdown()]
    yield 'worldspawn_comments_and_empty_entities', [init(entities='// before\n'+maptext()+' /*after*/\n{ }\n'), shutdown()]
    yield 'unknown_spawn_diagnostic_native_byte_limit', [init(entities=maptext(dict(classname='x'*(1023-len(" doesn't have a spawn function\n"))))), shutdown()]
    yield 'spawn_real_arena_nine_string_fields', [setvar('g_debugAlloc', 1), init(entities=maptext(dict(classname='info_notnull',
        model='model-one', model2='model-two', target='target', targetname='name', message='line\\nsecond', team='group',
        targetShaderName='old', targetShaderNewName='new', origin='32 64 96'))), action(12), shutdown()]
    team_rows=[dict(classname='info_notnull', team='group', targetname='first'),
        dict(classname='info_notnull', team='group', targetname='second'), dict(classname='info_notnull', team='other'),
        dict(classname='info_notnull', team='group', targetname='last'), dict(classname='info_notnull', team='Group')]
    yield 'spawn_real_findteams_last_targetname', [init(entities=maptext(*team_rows)), shutdown()]
    item_rows=[dict(classname=name, origin=f'{64 + index*16} 0 96') for index,name in enumerate([
        'weapon_shotgun','weapon_rocketlauncher','ammo_shells','item_armor_body','item_health_mega','item_quad'])]
    yield 'spawn_real_items_registration', [init(entities=maptext(*item_rows)), shutdown()]
    yield 'spawn_disabled_item_retains_registration', [setvar('disable_weapon_shotgun', 1), init(entities=maptext(*item_rows)), shutdown()]
    yield 'spawn_real_shooters_register_weapons', [init(entities=maptext(dict(classname='shooter_rocket'),
        dict(classname='shooter_grenade'), dict(classname='shooter_plasma'))), shutdown()]
    flags=[dict(classname='team_CTF_redflag', origin='64 0 96'),dict(classname='team_CTF_blueflag', origin='128 0 96')]
    for flagmask in range(4):
        yield f'ctf_flags_{flagmask}', [setvar('g_gametype', 4), init(entities=maptext(*(flags[i] for i in range(2) if flagmask & (1<<i)))), shutdown()]
    yield 'ctf_repeated_init_retains_engine_indices', [setvar('g_gametype', 4), init(entities=maptext(*flags)), shutdown(), init(2000, 7, 1, maptext(*flags)), shutdown(1)]
    yield 'gametype_latch_applied_next_init', [init(), setvar('g_gametype', 4, 0), setvar('sv_maxclients', 3, 0), shutdown(), init(2000, 3, 1, maptext(*flags)), shutdown(1)]
    for gametype in (0, 2, 3, 4):
        filtered=[dict(classname='weapon_shotgun', notfree='1'), dict(classname='weapon_rocketlauncher', notteam='1'),
            dict(classname='weapon_plasmagun', notsingle='1'),dict(classname='ammo_shells', notq3a='1'),
            dict(classname='info_notnull', gametype='ctf'),dict(classname='info_null'),dict(classname='unknown_fixture_class')]
        yield f'spawn_gametype_filter_{gametype}', [setvar('g_gametype', gametype), init(entities=maptext(*filtered)), shutdown()]
    yield 'spawn_known_missing_class_explicit_boundary', [init(entities=maptext(dict(classname='func_door', model='*1'))), shutdown()]
    yield 'spawn_real_speaker_links_and_metadata_retention', [init(entities=maptext(dict(classname='target_speaker', noise='sound/test.wav', spawnflags='1', origin='96 0 96'))),
        init(2000, 2, 1), shutdown()]
    yield 'arena_reset_preserves_written_tail', [action(8, 512, 0xA5), init(entities=maptext(dict(classname='info_notnull', message='long first message'))),
        action(8, 33, 0x5A), init(2000, 2, 1, maptext(dict(classname='info_notnull'))), action(12), shutdown()]
    yield 'session_connected_only_and_client_limits', [setvar('sv_maxclients', 3), init(),
        action(7, 0, 2, 1, '345,2,-1,4,5,1'), action(7, 1, 1, 2, '678,1,2,7,8,0'),
        action(7, 2, 2, 3, '-9,3,63,10,11,-3'), action(7, 3, 2, 0, '0,0,0,0,0,0'), shutdown(1)]
    yield 'session_gametype_change_marks_new_session', [setvar('session', 4), init(), shutdown()]
    yield 'session_same_gametype_keeps_newsession_false', [setvar('g_gametype', 4), setvar('session', 4), init(entities=maptext(*flags)), shutdown()]
    yield 'session_shutdown_survives_repeated_init', [setvar('sv_maxclients', 1), init(), action(7, 0, 2, 1, '100,2,-1,8,9,1'),
        shutdown(1), init(2000, 2, 1), shutdown(1)]
    for bans in ('', '1.2.3.4 ', '1.2.3.4', '1.2.*.* 5.6.7.8 ', '1.2.3.4  5.6.7.8 ', 'bad 5.6.7.8 '):
        yield 'ip_process_' + repr(bans), [setvar('g_banIPs', bans), init(), shutdown(), init(2000, 2, 1), shutdown(1)]
    yield 'ip_register_copy_repeated_same_counter_text', [setvar('g_banIPs', '1.2.3.4 5.6.7.8 '), init(),
        setvar('g_banIPs','1.2.3.4 5.6.7.8 '), init(2000, 2, 1), shutdown()]
    for seed in (0, 1, -1, 2147483647, -2147483648, 123456789):
        yield f'random_seed_reseeding_{seed}', [action(6), init(seed=seed), action(6), action(6), init(2000, seed, 1), action(6), shutdown()]


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
                        'message':message,'tail':tail,'state':es,'spawnflags':spawnflags}
    assert r.offset==len(data),(r.offset,len(data))
    return dict(head=head,counts=counts,scores=scores,bodies=bodies,team=team,registered=registered,remaps=remaps,weapon=weapon,
                allocated=allocated,pool=pool,ip_count=ip_count,banbytes=banbytes,vms=vms,registry=registry,configs=configs,
                clients=clients,entities=entities,spawnvars=spawnvars,word_count=r.words)


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


def semantic_proof(name, actions, parsed):
    effects=parsed['effects'];counts=Counter(e[0] for e in effects);last=parsed['last'];initializations=sum(a[0]==1 for a in actions)
    assert counts[6]>=initializations*9, 'actual LocateGameData plus eight body allocations must run'
    locate=[e for e in effects if e[0]==6 and e[1]==64]
    assert len(locate)==initializations
    for event in locate:
        state=event[-1];assert state['head'][0:2]==(1,1) and state['head'][5]==64
        maximum=state['head'][6];assert sum(e['client']>=0 for e in state['entities'].values())==maximum
        assert all(c[2]=='' and not any(c[0]) for c in state['clients']), 'all physical clients reset before Locate'
    if initializations:
        body_start=72 if name=='bodyque_second_initialization_retains_pending_slots' else 64
        assert last['bodies']==tuple(range(body_start,body_start+8)) and last['head'][17]==0
        assert all(last['entities'][slot]['classname']=='bodyque' and last['entities'][slot]['base'][1]==1 for slot in range(body_start,body_start+8))
        assert last['registered'][8] and last['registered'][10], 'default machinegun and gauntlet registration'
        assert 'sound/player/fry.wav' in last['configs'][289:544]
    if name=='callspawn_null_classname_diagnostic':
        assert parsed['callspawn']==[0] and effects[0][4]==b'G_CallSpawn: NULL classname\n'
    if name=='unknown_spawn_diagnostic_native_byte_limit':
        assert any(e[0]==1 and len(e[4])==1023 for e in effects)
    if name=='poisoned_level_arrays_and_module_retention':
        prints=[e for e in effects if e[0]==1]
        assert prints[0][-1]['head'][2]==123456 and prints[0][-1]['entities'][127]['classname']=='poisoned'
        opened=next(e for e in effects if e[0]==9)
        assert opened[-1]['head'][0:2]==(0,0) and opened[-1]['clients'][0][2]=='Before init'
        assert opened[-1]['allocated']==0 and opened[-1]['pool'][:128]==b'a'*128
        assert last['entities'][127]['classname'] is None and last['entities'][1023]['classname'] is None
        assert last['remaps']==[('old','new',1069547520)] and last['weapon'][0]==1075838976 and last['ip_count']==1
    if name.startswith('bot_restart_argument_'):
        assert [e[0] for e in effects if e[0] in (13,14,15,16)]==[13,14,15,16]
        assert all(e[1]==actions[1][3] for e in effects if e[0] in (13,14,15,16))
    if name=='precache_singleplayer_short_circuit':
        assert not any(e[0]==17 and e[3]=='com_buildScript' for e in effects)
        assert counts[9]==0 and 'models/mapobjects/podium/podium4.md3' in last['configs']
    if name=='bodyque_second_initialization_retains_pending_slots':
        second_queue=[e for e in effects if e[0]==6 and 73<=e[1]<=80]
        assert len(second_queue)==8
        for i,e in enumerate(second_queue):assert e[-1]['bodies']==tuple(range(72,72+i))+tuple(range(64+i,72))
    if name=='spawn_real_findteams_last_targetname':
        ents=last['entities'];assert ents[72]['targetname']=='last' and ents[72]['tail'][15]==75
        assert ents[73]['tail'][14]==72 and ents[75]['tail'][14]==72
        assert any(b'3 teams with 5 entities' in e[4] for e in effects if e[0]==1)
    if name=='spawn_real_items_registration':
        names={e['classname'] for e in last['entities'].values() if e['active']}
        assert {'weapon_shotgun','weapon_rocketlauncher','item_quad'}<=names
        assert all(last['entities'][slot]['base'][11]==1200 and last['entities'][slot]['base'][15] for slot in range(72,78))
    if name=='spawn_known_missing_class_explicit_boundary':assert counts[18]==1
    if name=='spawn_real_speaker_links_and_metadata_retention':
        assert counts[7]>0 and last['entities'][72]['classname'] is None
        assert last['entities'][72]['tail'][-1]>=0, 'server sector survives direct game memset'
    if name.startswith('ctf_'):
        assert parsed['normalizations']==initializations and last['configs'][23]=='00'
    if name=='log_open_failure':assert counts[9]==1 and counts[10]==0 and counts[11]==0 and counts[12]==0
    if name=='same_module_shutdown_twice_preserves_handle':assert counts[12]==2 and last['head'][8]==7
    if name=='worldspawn_nul_terminates_token_source':assert 'weapon_rocketlauncher' not in {e['classname'] for e in last['entities'].values()}
    if name=='session_connected_only_and_client_limits':
        registry=last['registry'];assert registry['session0'][0]=='1 345 2 -1 4 5 1'
        assert registry['session2'][0]=='3 -9 3 63 10 11 -3' and 'session1' not in registry and 'session3' not in registry
    if name.startswith('random_seed_reseeding_'):assert parsed['draws'][1]==parsed['draws'][3], 'actual srand resets sequence'
    return dict(snapshots=parsed['snapshots'],effect_kinds=dict(sorted(counts.items())),initializations=initializations,
        final_entities=None if last is None else last['head'][5],final_allocated=None if last is None else last['allocated'],
        final_ip_count=None if last is None else last['ip_count'],native_random_draws=parsed['draws'],
        ctf_first_status_normalizations=parsed['normalizations'])


def artifact_stem(name):
    slug=re.sub('[^A-Za-z0-9_.-]+','_',name).strip('._')[:40] or 'case'
    return slug+'_'+hashlib.sha256(name.encode('utf-8')).hexdigest()[:16]


def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/game_lifecycle';out.mkdir(parents=True,exist_ok=True)
    source_manifest=out/'original_sources.json'
    if not args.reuse_build:
        sources=build(out,lifecycle=True)
        source_manifest.write_text(json.dumps([p.relative_to(ROOT).as_posix() for p in sorted(set(sources))],indent=2)+'\n',encoding='utf-8')
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/game_lifecycle_tests.ml','--output','game_lifecycle_tests.exe'],check=True)
    sources=[ROOT/p for p in json.loads(source_manifest.read_text(encoding='utf-8'))]
    native=out/'spawn_oracle.exe';mini=ROOT/'build/game_lifecycle_tests.exe';build_date=run([native,'--build-date'],out).strip()
    bsp=out/'empty.bsp';bsp.write_bytes(map_bytes());records=[];used={}
    hosts=[ROOT/'tests/reference/spawn_oracle.c',ROOT/'tests/reference/spawn_server.c',ROOT/'tests/reference/collision_oracle.c',
           ROOT/'tests/reference/transition_server.c',*sorted((ROOT/'tests/reference').glob('*.inc')),
           ROOT/'tests/reference/game_lifecycle_api.h',ROOT/'tests/reference/game_lifecycle_cvars.c']
    test_sources=[ROOT/'tests/game_lifecycle_tests.ml',ROOT/'tests/lifecycle_reset_contracts.ml',ROOT/'scripts/test_game_lifecycle.py',ROOT/'scripts/spawn_oracle.py']
    port_paths=sorted(set([*sorted((ROOT/'src/mq3').rglob('*.ml')),*hosts,*test_sources]))
    compiled_paths=[native,mini,bsp,*sorted(out.glob('*.inc'))]
    bound_paths=sorted(set([*sources,*port_paths,*compiled_paths]))
    before_hashes={p.relative_to(ROOT).as_posix():sha(p) for p in bound_paths}
    cases=list(scenarios());assert len({n for n,_ in cases})==len(cases)
    for name,actions in cases:
        stem=artifact_stem(name);folded=stem.casefold()
        if folded in used:raise RuntimeError(f'Artifact collision: {name!r}, {used[folded]!r}')
        used[folded]=name
        if args.case and args.case!=name:continue
        inp,expected,raw=out/(stem+'.bin'),out/(stem+'.expected'),out/(stem+'.raw.jsonl');inp.write_bytes(pack(actions,build_date))
        run([native,bsp,inp,expected,'0','--lifecycle',raw],out,log=out/(stem+'.oracle.log'))
        output=run([mini,bsp,inp,expected],ROOT/'build',log=out/(stem+'.test.log'),timeout=600)
        match=re.search(r'(\d+) lifecycle actions / (\d+) exact words / (\d+) ordered effects',output)
        if not match:raise RuntimeError(output)
        parsed=inspect(expected.read_bytes());proof=semantic_proof(name,actions,parsed)
        assert tuple(map(int,match.groups()))==(len(actions),parsed['exact_words'],len(parsed['effects']))
        raw_records=[json.loads(line) for line in raw.read_text(encoding='utf-8').splitlines()]
        assert len(raw_records)==parsed['normalizations']
        for raw_index,raw_record in enumerate(raw_records):
            assert raw_record['sequence']==raw_index and raw_record['index']==23
            assert len(raw_record['bytes'])==3 and raw_record['bytes'][0]==48 and raw_record['bytes'][2]==0
            assert all(isinstance(byte,int) and 0<=byte<=255 for byte in raw_record['bytes'])
        records.append(dict(name=name,artifact_stem=stem,actions=int(match[1]),exact_words=int(match[2]),ordered_effects=int(match[3]),
            bytes=expected.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(expected),raw_ctf_sha256=sha(raw),semantic_proof=proof))
        print(f'{len(records)}/{len(cases)} {name}: '+output.strip(),flush=True)
    if not records:raise RuntimeError('No matching lifecycle scenario')
    stem=records[0]['artifact_stem'];contracts=run([mini,bsp,out/(stem+'.bin'),out/(stem+'.expected'),'--contracts'],ROOT/'build',log=out/'contracts.log',timeout=600)
    match=re.search(r'PASS: (\d+) lifecycle runtime contracts',contracts)
    if not match:raise RuntimeError(contracts)
    print(contracts.strip(),flush=True)
    after_hashes={p.relative_to(ROOT).as_posix():sha(p) for p in bound_paths}
    if before_hashes!=after_hashes:raise RuntimeError('Lifecycle sources or compiled artifacts changed during the comparison run')
    result=dict(passed=True,canonical=not args.case and not args.reuse_build,scenario_count=len(records),scenarios=records,actions=sum(r['actions'] for r in records),
        exact_words=sum(r['exact_words'] for r in records),ordered_effects=sum(r['ordered_effects'] for r in records),runtime_contracts=int(match[1]),
        profile='Unchanged original G_InitGame/G_ShutdownGame plus real game Cvars, original engine registry, IP, arena, sessions, body queue, parsing, spawns, items and team initialization.',
        scope='Engine FS/serverinfo/LocateGameData delivery and unavailable Bot-AI are explicit hosts. Input starts at the game API with entity text; engine map loading, token transport, VM loading/reloading and complete server/map acceptance remain separate. Direct repeated Init preserves module statics; separate scenario processes model fresh modules. Known missing spawn classes stay explicit boundaries. Snapshots include all 64 physical clients, allocated entities with at least slots 0..127 plus 1022/1023, original server metadata, all engine/VM Cvars, 1024 configstrings, IP storage, item registrations, team/shader/weapon statics and every arena byte up to the observed high-water mark (minimum 256). Independent reset contracts probe array edges and selected entity/client identities (entity slots 0,63,64,1022,1023 and client slots 0,63); they do not individually inspect every physical slot. Only the undefined blue byte in the first CTF status update is normalized to a terminated red prefix, with all three native bytes archived separately.',
        build_date=build_date,source_bindings_unchanged_during_run=True,normalization='Exact isolated Team_InitGame red=0/blue=-1 host boundary only; raw sequence/index/three bytes are archived per case.',
        original_sources={p.relative_to(ROOT).as_posix():sha(p) for p in sorted(set(sources))},
        hosts={p.relative_to(ROOT).as_posix():sha(p) for p in sorted(set(hosts))},
        tests={p.relative_to(ROOT).as_posix():sha(p) for p in test_sources},
        port_sources={p.relative_to(ROOT).as_posix():sha(p) for p in port_paths},
        compiled_artifacts={p.relative_to(ROOT).as_posix():sha(p) for p in compiled_paths},test_sha256=sha(mini),oracle_sha256=sha(native),map_sha256=sha(bsp),
        output_bytes=sum(r['bytes'] for r in records),normalization_count=sum(r['semantic_proof']['ctf_first_status_normalizations'] for r in records))
    selected=records[0]['artifact_stem'] if args.case else None
    filename=('reused-'+(selected or 'all')+'.json') if args.reuse_build else ((selected+'.partial.json') if selected else 'result.json')
    destination=out/filename
    destination.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} lifecycle scenarios / {result['exact_words']} exact words / {result['runtime_contracts']} contracts",flush=True)


if __name__=='__main__':main()
