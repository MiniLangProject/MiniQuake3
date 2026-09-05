"""Original ClientConnect, all Baseq3 session functions and actual userinfo/ranks."""
import argparse
from dataclasses import dataclass, replace
import json
import random
import re
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_client_info import info
from test_votes import ints, text
from toolchain import ROOT, run


@dataclass(frozen=True)
class Client:
    bound: int = 1
    active: int = 1
    flags: int = 0
    connected: int = 2
    team: int = 1
    spectator: int = 2
    target: int = -1
    time: int = 123
    wins: int = 9
    losses: int = 8
    leader: int = 1
    name: str = '^2Previous'
    userinfo: str = info(ip='198.51.100.7')
    session: str = '1 123 2 -1 9 8 1'


def action(kind=1, first=None, second='', *, slot=0, p0=1, p1=0, time=1000):
    return kind, time, slot, p0, p1, info(ip='198.51.100.7') if first is None else first, second


def case(actions, clients=None, *, maxclients=4, gametype=0, time=1000, redscore=0, bluescore=0,
         new_session=0, autojoin=0, maxgame=0, nonspectators=0, intermission=0, banned=0, bot_ok=1, password='', world_session='0'):
    data=ints(maxclients,gametype,time,redscore,bluescore,new_session,autojoin,maxgame,nonspectators,intermission,banned,bot_ok)
    data+=text(password)+text(world_session)
    population={0:Client(),1:Client(team=2,name='Other',leader=0)}
    population.update(clients or {})
    for slot in range(64):
        c=population.get(slot,Client(active=0,connected=0,team=0,name=''))
        data+=ints(c.bound,c.active,c.flags,c.connected,c.team,c.spectator,c.target,c.time,c.wins,c.losses,c.leader)
        data+=text(c.name)+text(c.userinfo)+text(c.session)
    data+=ints(len(actions))
    for kind,at,slot,p0,p1,first,second in actions:
        data+=ints(kind,at,slot,p0,p1)+text(first)+text(second)
    return data


def scenarios():
    yield 'first_connect_ffa',case([action()])
    for first in (0,1):
        for new in (0,1):
            for bot in (0,1):
                yield f'connect_first_{first}_new_{new}_bot_{bot}',case([action(p0=first,p1=bot)],new_session=new)
    yield 'unbound_entity_rebind_and_zero',case([action()],clients={0:Client(bound=0,active=0,flags=0x208)})
    yield 'successive_first_connects',case([action(),action(first=info(name='New',ip='localhost'),time=1010)])
    yield 'reconnect_after_session_changes',case([action(3,'2 -2147483648 1 -2 2147483647 -4 1'),action(p0=0)])
    for banned in (0,1):
        for ip in ('localhost','LOCALHOST','198.51.100.7:27960','', '127.0.0.1'):
            for flags,bot in ((0,0),(8,0),(0,1),(8,1)):
                yield f'password_filter_{banned}_{ip}_{flags}_{bot}'.replace(':','_'),case(
                    [action(first=info(ip=ip,password='wrong'),p1=bot)],password='secret',banned=banned,clients={0:Client(flags=flags)})
    for index,pw in enumerate(('', 'none','NoNe',' none','secret','SECRET','päss','x'*255)):
        for supplied in (pw,'wrong'):
            yield f'password_match_{index}_{supplied==pw}',case([action(first=info(password=supplied,ip='203.0.113.9'))],password=pw)
    yield 'banned_takes_priority_and_retry',case([action(),action(12,p0=0,p1=1),action()],banned=1,password='secret')
    for first in (0,1):
        yield f'bot_failure_{first}',case([action(p0=first,p1=1)],bot_ok=0)
    for game in (-1,0,1,2,3,4,7):
        for auto in (0,1,-1):
            yield f'gametype_{game}_autojoin_{auto}',case([action()],gametype=game,autojoin=auto)
    for game in (0,1,2,3):
        for team in ('s','spectator','S','Spectator','blue','', ' s'):
            yield f'initial_team_{game}_{team}',case([action(first=info(team=team))],gametype=game)
    for game in (0,1,2):
        for limit,count in ((0,50),(-1,50),(1,0),(1,1),(2,1),(2,2),(2147483647,2147483647)):
            yield f'capacity_{game}_{limit}_{count}',case([action()],gametype=game,maxgame=limit,nonspectators=count)
    for red,blue in ((0,0),(1,0),(0,1),(-2147483648,2147483647),(2147483647,-2147483648)):
        yield f'autojoin_score_tie_{red}_{blue}',case([action()],gametype=3,autojoin=1,redscore=red,bluescore=blue,
            clients={1:Client(team=0,connected=0)})
    for connection in (0,1,2):
        yield f'autojoin_existing_red_{connection}',case([action()],gametype=4,autojoin=1,clients={1:Client(team=1,connected=connection)})
    for raw in ('\n\t1 0x10 03 -0x2 +7 -011 1 extra', '1+2+3+4+5+6+1', '1 08 3 4 5 6 0',
                '0x1 010 -0x1 -010 0x7fffffff 0x80000000 -1',
                '1 2147483648 3 4294967295 -2147483649 18446744073709551615 42',
                '1 '+('9'*300)+' 1 -1 2 3 0', ' '*1000+'1 2 3 4 5 6 1',
                '1 2 3 4 5 6 1'+'x'*2000):
        yield 'session_scan_'+str(len(raw))+'_'+str(sum(raw.encode())),case([action(3,raw),action(4)])
    rng=random.Random(0x5E5510)
    for index in range(35):
        fields=[rng.randint(-2147483648,2147483647) for _ in range(7)]
        raw=' '.join(str(v) for v in fields)
        yield f'session_roundtrip_{index}',case([action(3,raw),action(4)])
    for leader in (-2147483648,-1,0,1,2,2147483647):
        yield f'noncanonical_leader_{leader}',case([action(3,f'1 7 2 -1 9 8 {leader}'),action(13),action(4),action(14,p0=1),action(4)])
    for gametype in (0,1,3):
        for previous in ('','0','00','1','3','0x3','  +3trailing','2147483648'):
            yield f'world_init_{gametype}_{previous}',case([action(5,previous,p0=gametype),action(5,str(gametype),p0=gametype)])
    yield 'world_init_retains_true',case([action(5,'0',p0=0)],new_session=1)
    for connected in (0,1,2):
        yield f'write_world_connected_{connected}',case([action(6)],clients={0:Client(connected=connected)})
    for team in (-1,0,1,2,3,4):
        for old in (-1,0,1,2,3):
            yield f'broadcast_{team}_{old}',case([action(7,p0=old)],clients={0:Client(team=team)})
    yield 'init_preserves_other_session_fields',case([action(2,info(team='s')),action(4)],clients={0:Client(leader=17,wins=-99,losses=234,target=-2)})
    yield 'shutdown_reset_reconnect',case([action(6),action(9,p0=4),action(5,'3',p0=3),action(p0=0),action(slot=1,p0=0),action(6)],gametype=3)
    yield 'gametype_change_reinitializes_on_reconnect',case([action(6),action(9,p0=4),action(5,'0',p0=4),action(p0=0)],autojoin=1)
    yield 'session_only_connected_saved',case([action(8,p0=1,p1=1),action(6),action(9,p0=4),action(p0=0)])
    yield 'intermission_rank_scoreboards',case([action()],intermission=995)
    for slot,maximum in ((0,0),(63,64)):
        yield f'client_storage_{slot}_{maximum}',case([action(slot=slot),action(6)],maxclients=maximum)
    for index,raw in enumerate(('name\\NoLeading\\IP\\localhost\\TEAM\\s',
        '\\name\\bad;name\\ip\\localhost', '\\name\\quote"name\\ip\\localhost',
        '\\padding\\'+'x'*1014+'\\ip\\localhost', info(name='é'*100,model='中'*80))):
        yield f'userinfo_bytes_{index}',case([action(first=raw)])


def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/client_connect'
    sources=build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_connect_tests.ml','--output','client_connect_tests.exe'],check=True)
    bsp=out/'client_connect.bsp';bsp.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        if args.case and args.case!=name:continue
        safe=re.sub(r'[^a-zA-Z0-9_-]','_',name)
        inp,expected=out/(safe+'.bin'),out/(safe+'.expected');inp.write_bytes(data)
        run([out/'spawn_oracle.exe',bsp,inp,expected,'0','--client-connect'],out,log=out/(safe+'.oracle.log'))
        output=run([ROOT/'build/client_connect_tests.exe',bsp,inp,expected],ROOT/'build',log=out/(safe+'.test.log'))
        match=re.search(r'(\d+) connect actions / (\d+) exact words / (\d+) ordered effects',output)
        if not match:raise RuntimeError(output)
        records.append(dict(name=name,actions=int(match[1]),exact_words=int(match[2]),ordered_effects=int(match[3]),
            bytes=expected.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(expected)))
        if len(records)%20==0 or args.case:print(f'{len(records)} scenarios passed ({name})',flush=True)
    if not records:raise RuntimeError('No matching connect scenario')
    output=run([ROOT/'build/client_connect_tests.exe',bsp,inp,expected,'--contracts'],ROOT/'build',log=out/'contracts.log');print(output.strip())
    contracts=int(re.search(r'(\d+) connect runtime contracts',output)[1])
    result=dict(passed=True,scenarios=records,scenario_count=len(records),actions=sum(r['actions'] for r in records),
        exact_words=sum(r['exact_words'] for r in records),ordered_effects=sum(r['ordered_effects'] for r in records),
        output_bytes=sum(r['bytes'] for r in records),runtime_contracts=contracts,
        test_sha256=sha(ROOT/'build/client_connect_tests.exe'),oracle_sha256=sha(out/'spawn_oracle.exe'),map_sha256=sha(bsp),
        scope='Unchanged Baseq3 ClientConnect, five session functions and BroadcastTeamChange, with actual userinfo, team selection and CalculateRanks. All modeled client fields and all 117 playerState words in every slot are compared at each host effect and action; session Cvar storage survives level reconstruction. MiniLang uses its real registry, native host models Cvar storage. IP filtering, bot setup, userinfo delivery, logs, commands and configstring broadcast remain observed boundaries. Session reads require all seven native CRT conversions; incomplete input would use uninitialized original C locals and is rejected safely before MiniLang mutation. ClientDisconnect and team changes are compared separately. Full module lifecycle, IP filters, bot AI, map/network delivery and Missionpack remain open.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    name=('reused-'+(args.case or 'all')+'.json') if args.reuse_build else ((args.case+'.result.json') if args.case else 'result.json')
    (out/name).write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__=='__main__':main()
