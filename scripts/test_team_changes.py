"""Differential Baseq3 SetTeam, StopFollowing, Cmd_Team_f and ClientDisconnect."""
import argparse
from dataclasses import dataclass, fields, replace
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
    bound:int=1
    active:int=1
    svflags:int=0
    connected:int=2
    team:int=0
    spectator:int=0
    target:int=0
    spectime:int=73
    wins:int=9
    losses:int=8
    leader:int=0
    health:int=100
    pmtype:int=0
    pmflags:int=0x1020
    psnum:int=-999
    entnum:int=-999
    flags:int=0x10
    cooldown:int=0
    weapon:int=2
    ammo:int=25
    weaponstate:int=0
    cmdweapon:int=5
    powers:int=0
    until:int=25000
    ground:int=1023
    linked:int=1
    score:int=0
    eflags:int=0x10100
    name:str='Before'
    userinfo:str=info(name='Ranger',ip='198.51.100.7')

def action(kind=1,request='spectator',*,slot=0,time=1000,p0=2):
    return kind,time,slot,p0,request

def case(actions,clients=None,*,maxclients=4,gametype=0,time=1000,balance=0,maxgame=0,nonspectators=0,
         intermission=0,warmup=0,redscore=0,bluescore=0,first=0,second=1,blood=1):
    data=ints(maxclients,gametype,time,balance,maxgame,nonspectators,intermission,warmup,redscore,bluescore,first,second,blood)
    population={0:Client(),1:Client(name='Other',score=10)};population.update(clients or {})
    for slot in range(64):
        c=population.get(slot,Client(active=0,connected=0))
        values=[getattr(c,f.name) for f in fields(Client) if f.type is int]
        values[14]=slot if c.psnum==-999 else c.psnum;values[15]=slot if c.entnum==-999 else c.entnum
        assert len(values)==28
        data+=ints(*values)+text(c.name)+text(c.userinfo)
    data+=ints(len(actions))
    for kind,time,slot,p0,request in actions:data+=ints(kind,time,slot,p0)+text(request)
    return data

def scenarios():
    yield 'active_to_spectator',case([action()])
    yield 'team_change_empty_client_limit',case([action()],maxclients=0,clients={63:Client(team=3,spectator=2,target=0)})
    yield 'team_change_last_client',case([action(slot=63)],maxclients=64,clients={63:Client()})
    yield 'persistent_client_slot_differs_entity',case([action(6,p0=1),action()])
    for game in (0,1,2,3,4):
        for request in ('scoreboard','ScOrE','follow1','FOLLOW2','spectator','S','red','R','blue','B','auto','',' red','r\u00e9d'):
            yield f'request_{game}_{request}',case([action(request=request)],gametype=game,clients={0:Client(team=3,spectator=1)})
    for team in (0,1,2):
        yield f'active_same_team_{team}',case([action(request=['free','red','blue'][team])],gametype=3 if team else 0,clients={0:Client(team=team,health=-20,pmtype=3)})
    for old in (0,1,2,3):
        for health in (100,0,-40):
            yield f'old_team_{old}_health_{health}',case([action(request='blue')],gametype=4,clients={0:Client(team=old,health=health,pmtype=3 if health<=0 else 0,leader=1)})
    for balanced in (0,1,-1):
        for requested,targetteam in (('red',1),('blue',2)):
            for spread in (1,2,3):
                population={0:Client(team=3),1:Client(team=targetteam),2:Client(team=targetteam,connected=2 if spread>=2 else 0),3:Client(team=targetteam,connected=1 if spread>=3 else 0)}
                yield f'balance_{balanced}_{requested}_{spread}',case([action(request=requested)],gametype=3,balance=balanced,clients=population)
    yield 'balance_excludes_ps_client_not_entity',case([action(request='red')],gametype=3,balance=1,clients={0:Client(team=3,psnum=1),1:Client(team=1),2:Client(team=1)})
    yield 'balance_notice_uses_ps_slot',case([action(request='red')],gametype=3,balance=1,clients={0:Client(team=3,psnum=63),1:Client(team=1),2:Client(team=1)})
    yield 'balance_before_same_team',case([action(request='red')],gametype=3,balance=1,clients={0:Client(team=1),1:Client(team=1),2:Client(team=1)})
    for game in (0,1,3):
        for limit,count in ((0,2),(-1,2),(2,1),(2,2),(1,0),(1,1)):
            yield f'capacity_{game}_{limit}_{count}',case([action(request='red')],gametype=game,maxgame=limit,nonspectators=count)
    yield 'capacity_preserves_follow2',case([action(request='follow2')],gametype=1,nonspectators=2)
    for leader,bot,callerbot in ((0,0,0),(1,0,0),(1,8,0),(1,8,8),(17,8,0)):
        yield f'leader_{leader}_{bot}_{callerbot}',case([action(request='blue')],gametype=3,clients={0:Client(team=1,leader=1,svflags=callerbot),1:Client(team=2,leader=leader,svflags=bot),2:Client(team=1,svflags=8),3:Client(team=1)})
    yield 'multiple_old_leaders_cleared',case([action(request='blue')],gametype=3,clients={0:Client(team=3),1:Client(team=2,leader=1,svflags=8),2:Client(team=2,leader=17,svflags=8)})
    for team in (-1,0,1,2,3,4):
        for argc in (0,1,3):
            yield f'cmd_report_{team}_{argc}',case([action(2,p0=argc)],clients={0:Client(team=team)})
    for cd in (999,1000,1001):
        yield f'cmd_cooldown_{cd}',case([action(2)],clients={0:Client(cooldown=cd)})
    yield 'cmd_cooldown_sequence',case([action(2),action(2,request='red',time=5999),action(2,request='red',time=6000)],gametype=3)
    yield 'cmd_denial_still_sets_cooldown',case([action(2,request='red'),action(2,request='blue',time=1001)],gametype=3,balance=1,clients={0:Client(team=3),1:Client(team=1),2:Client(team=1)})
    yield 'cmd_tournament_loss_before_same_team',case([action(2,request='free')],gametype=1,clients={0:Client(losses=2147483647)})
    yield 'cmd_tournament_capacity_loss',case([action(2,request='red')],gametype=1,nonspectators=2)
    yield 'cmd_int32_cooldown_wrap',case([action(2,request='free',time=2147483000)],clients={0:Client()})
    yield 'cmd_token_truncation',case([action(2,request='red'+' '*1800)],gametype=3,clients={0:Client(team=3)})
    for slot in (0,63):
        yield f'stop_follow_{slot}',case([action(3,slot=slot)],maxclients=64,clients={slot:Client(team=3,spectator=2,target=-2,psnum=7,svflags=0x208,wins=123)})
    for connected in (0,1,2):
        for team in (0,1,2,3):
            yield f'disconnect_{connected}_{team}',case([action(4)],clients={0:Client(connected=connected,team=team)})
    yield 'disconnect_unbound_queued_bot',case([action(4)],clients={0:Client(bound=0,svflags=8)})
    yield 'disconnect_bot_shutdown',case([action(4)],clients={0:Client(svflags=0x208)})
    yield 'disconnect_stops_all_matching_followers',case([action(4)],clients={1:Client(team=3,spectator=2,target=0,psnum=0,svflags=8),2:Client(team=3,spectator=2,target=0,connected=0),3:Client(team=3,spectator=2,target=-1)})
    yield 'disconnect_ignores_nonfollow_spectators',case([action(4)],clients={1:Client(team=3,spectator=1,target=0),2:Client(team=1,spectator=2,target=0),3:Client(team=3,spectator=3,target=0)})
    yield 'disconnect_self_follow_clears_bot',case([action(4)],clients={0:Client(team=3,spectator=2,target=0,svflags=8,psnum=42)})
    for game,intermission,warmup,second in ((1,0,0,0),(1,995,0,0),(1,0,-1,0),(1,0,1,0),(1,0,0,1),(0,0,0,0)):
        yield f'tournament_disconnect_{game}_{intermission}_{warmup}_{second}',case([action(4)],gametype=game,intermission=intermission,warmup=warmup,first=1,second=second,clients={1:Client(wins=2147483647)})
    yield 'tournament_disconnect_self_winner',case([action(4)],gametype=1,first=0,second=0)
    yield 'disconnect_entity_clientnum_effect',case([action(4)],clients={0:Client(psnum=31,entnum=47)})
    yield 'disconnect_repeated',case([action(4),action(4,time=1001)])
    yield 'disconnect_empty_client_limit',case([action(4)],maxclients=0,clients={0:Client(connected=0,team=3)})
    yield 'disconnect_last_client',case([action(4,slot=63)],maxclients=64,clients={63:Client(svflags=8)})
    for weapon,ammo,state in ((5,7,0),(7,-1,0),(5,0,0),(2,10,2),(10,10,2)):
        for kind in (1,4):
            yield f'items_{kind}_{weapon}_{ammo}_{state}',case([action(kind)],clients={0:Client(weapon=weapon,ammo=ammo,weaponstate=state)})
    for game in (0,3,4):
        for kind in (1,4):
            yield f'powerup_drops_{kind}_{game}',case([action(kind)],gametype=game,clients={0:Client(powers=(1<<1)|(1<<2)|(1<<3),weapon=5)})
    for flag in (7,8):
        for kind in (1,4):
            yield f'ctf_flag_{kind}_{flag}',case([action(kind)],gametype=4,clients={0:Client(team=1 if flag==8 else 2,powers=1<<flag)})
    yield 'body_queue_wrap',case([a for index in range(10) for a in (action(5,time=1000+index*100,p0=-10),action(request='s',time=1000+index*100))],clients={0:Client(team=3)})
    yield 'intermission_team_change',case([action(request='blue')],gametype=3,intermission=995)
    yield 'team_then_disconnect_sequence',case([action(request='blue'),action(request='spectator',time=2000),action(request='red',time=3000),action(4,time=4000)],gametype=4)
    rng=random.Random(0x7EA)
    for index in range(12):
        population={slot:Client(team=rng.randrange(4),connected=rng.randrange(3),svflags=rng.choice((0,8)),score=rng.randrange(-2,4),spectator=rng.randrange(4),target=rng.randrange(-2,4)) for slot in range(4)}
        yield f'mixed_population_{index}',case([action(request=rng.choice(('red','blue','spectator','auto'))),action(4,slot=rng.randrange(4),time=2000)],gametype=rng.choice((0,1,3,4)),clients=population)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/team_changes';sources=build(out) if not args.reuse_build else []
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/team_change_tests.ml','--output','team_change_tests.exe'],check=True)
    bsp=out/'team_changes.bsp';bsp.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        if args.case and args.case!=name:continue
        safe=re.sub(r'[^a-zA-Z0-9_-]','_',name);inp,expected=out/(safe+'.bin'),out/(safe+'.expected');inp.write_bytes(data)
        run([out/'spawn_oracle.exe',bsp,inp,expected,'0','--team-changes'],out,log=out/(safe+'.oracle.log'))
        output=run([ROOT/'build/team_change_tests.exe',bsp,inp,expected],ROOT/'build',log=out/(safe+'.test.log'))
        match=re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects',output)
        if not match:raise RuntimeError(output)
        records.append(dict(name=name,actions=int(match[1]),exact_words=int(match[2]),ordered_effects=int(match[3]),bytes=expected.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(expected)))
        if len(records)%20==0 or args.case:print(f'{len(records)} scenarios passed ({name})',flush=True)
    if not records:raise RuntimeError('No matching team change scenario')
    output=run([ROOT/'build/team_change_tests.exe',bsp,inp,expected,'--contracts'],ROOT/'build',log=out/'contracts.log');print(output.strip())
    contracts=int(re.search(r'(\d+) team change runtime contracts',output)[1])
    result=dict(passed=True,scenarios=records,scenario_count=len(records),actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),ordered_effects=sum(r['ordered_effects'] for r in records),output_bytes=sum(r['bytes'] for r in records),runtime_contracts=contracts,test_sha256=sha(ROOT/'build/team_change_tests.exe'),oracle_sha256=sha(out/'spawn_oracle.exe'),map_sha256=sha(bsp),
        scope='Verbatim original SetTeam, StopFollowing, Cmd_Team_f and ClientDisconnect. Actual death, item/CTF drops and returns, body queue, leaders, userinfo, ClientBegin/Spawn and ranks. Every action and host effect compares all 66 modeled client fields including all 117 playerState words in all 64 slots, all 52 entityState words plus selected private/spatial entity fields, body queue, ranks, configstrings and item registry. Engine delivery, bot begin queue removal/shutdown, movement and end-frame callbacks remain observed boundaries; full command dispatch, module lifecycle and bot AI remain open.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    name=('reused-'+(args.case or 'all')+'.json') if args.reuse_build else ((args.case+'.result.json') if args.case else 'result.json')
    (out/name).write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")

if __name__=='__main__':main()
