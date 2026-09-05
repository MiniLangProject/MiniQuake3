"""Original name lookup, follow commands, spectator input and tournament queue."""
import argparse
import json
import random
import re
import subprocess
import sys
from dataclasses import replace
from inventory import sha
from spawn_oracle import build
from test_team_changes import Client, action, case
from test_bodies import map_bytes
from toolchain import ROOT, run

WATCH=Client(team=3,spectator=2,target=1,name='Watcher')
def follow(actions,clients=None,**kwargs):
    population={0:WATCH,1:Client(name='Other')};population.update(clients or {})
    return case(actions,clients=population,**kwargs)
def queue(actions,clients=None,playing=1,**kwargs):
    population={0:Client(name='Player'),1:replace(WATCH,name='Next',spectime=100,target=0,spectator=1),2:replace(WATCH,name='Later',spectime=200,target=0),3:replace(WATCH,name='Last',spectime=300,target=0)}
    population.update(clients or {});kwargs.setdefault('nonspectators',1)
    return case([action(17,p0=playing)]+actions,clients=population,gametype=1,**kwargs)

def scenarios():
    yield 'follow_active_player_by_slot',case([action(8,'1')])
    for arg in ('1','01','1tail','1.9','0','3','4','63','64','9999','2147483648','4294967297','9'*100,'-1','+1',' 1','Other','oThEr','Missing',''):
        yield 'lookup_'+repr(arg),follow([action(7,arg),action(8,arg)])
    for connection in (0,1,2):
        yield f'lookup_connection_{connection}',follow([action(7,'1'),action(7,'Other'),action(8,'1')],clients={1:Client(connected=connection,name='Other')})
    for raw in ('Alpha','^1Alpha','\x1b1Alpha','A\tL\nP\rH\x01A','\x7fALPHA','R\u00e4ng\u00e9r','\x1b\x1bA','\x1b1','\x01\x02'):
        yield 'sanitize_'+repr(raw),follow([action(16,raw),action(7,raw),action(8,raw)],clients={1:Client(name=raw)})
    yield 'sanitize_ascii_table',follow([action(16,''.join(chr(i) for i in range(32,128)))])
    yield 'sanitize_esc_pairs',follow([action(16,'A\x1b1B\x1b^C\x1b\x1bD')])
    yield 'lookup_keeps_caret_colors',follow([action(7,'Alpha'),action(7,'^1Alpha'),action(8,'^1Alpha')],clients={1:Client(name='^1Alpha')})
    yield 'lookup_duplicates_first_connected',follow([action(8,'other')],clients={1:Client(name='OTHER'),2:Client(name='Other')})
    yield 'lookup_duplicates_skip_connecting',follow([action(8,'other')],clients={1:Client(name='OTHER',connected=1),2:Client(name='Other')})
    yield 'lookup_uses_entity_recipient',follow([action(7,'999')],clients={0:replace(WATCH,psnum=42)})
    yield 'lookup_empty_limit',follow([action(7,'0'),action(7,'Other')],maxclients=0)
    yield 'lookup_last_slot',follow([action(8,'63')],maxclients=64,clients={63:Client(name='Last')})
    for state in (0,1,2,3):
        for argc in (0,1,3):
            yield f'follow_argc_{state}_{argc}',follow([action(8,'1',p0=argc)],clients={0:replace(WATCH,spectator=state,svflags=0x208,psnum=7)})
    yield 'follow_spectator_target_ignored',follow([action(8,'1')],clients={1:replace(WATCH,name='Other')})
    yield 'follow_self_ignored',follow([action(8,'0')])
    yield 'follow_persistent_self_ignored',case([action(6,p0=1),action(8,'1')])
    for team in (0,1,2,3):
        for game in (0,1,3):
            yield f'follow_team_{game}_{team}',case([action(8,'1')],gametype=game,clients={0:Client(team=team,losses=2147483647)})
    yield 'follow_ignores_team_cooldown',case([action(8,'1')],clients={0:Client(cooldown=99999)})
    yield 'follow_native_token_copy',follow([action(8,'a'*1800)])
    for direction in (-1,1):
        for start in (-2147483648,-2,-1,0,1,2,3,4,2147483647):
            yield f'cycle_{direction}_{start}',follow([action(9,p0=direction)],clients={0:replace(WATCH,target=start),2:Client(name='Second')})
        for connection in (0,1,2):
            yield f'cycle_connection_{direction}_{connection}',follow([action(9,p0=direction)],clients={1:Client(connected=connection),2:Client(name='Second')})
        for start in range(4):
            yield f'cycle_finite_empty_{direction}_{start}',follow([action(9,p0=direction)],clients={0:replace(WATCH,target=start),1:replace(WATCH,target=0)})
    yield 'cycle_single_client_self_allowed',case([action(9,p0=1)],maxclients=1,clients={0:Client(spectator=2,target=0)})
    yield 'cycle_last_slot_wrap',follow([action(9,p0=1),action(9,p0=-1)],maxclients=64,clients={0:replace(WATCH,target=63),63:Client()})
    for team,state in ((0,0),(0,1),(0,2),(3,0),(3,1),(3,3)):
        yield f'cycle_team_state_{team}_{state}',case([action(9,p0=1)],gametype=1,clients={0:Client(team=team,spectator=state,losses=2147483647)})
    for direction in (0,2,-2):
        yield f'error_bad_direction_{direction}',follow([action(9,p0=direction)])
    yield 'error_bad_direction_after_real_team_change',case([action(9,p0=0)],gametype=1,clients={0:Client(losses=2147483647)})
    for state in (1,2,3):
        yield f'spectator_attack_edges_{state}',follow([action(15,'1',p0=1050),action(15,'1',p0=1100),action(15,'0',p0=1150),action(15,'1',p0=1200)],clients={0:replace(WATCH,spectator=state),2:Client(name='Third')})
    yield 'spectator_without_attack',follow([action(15,'0',p0=1050)])
    yield 'promotion_oldest',queue([action(10)])
    for playing in (0,1,2,3):
        yield f'promotion_playing_{playing}',queue([action(10)],playing=playing)
    yield 'promotion_intermission_guard',queue([action(10)],intermission=995)
    for state,target,connected in ((3,0,2),(1,-1,2),(2,-2,2),(1,0,1),(1,0,0),(0,0,2),(2,0,2)):
        yield f'promotion_filters_{state}_{target}_{connected}',queue([action(10)],clients={1:replace(WATCH,spectime=-1000,spectator=state,target=target,connected=connected)})
    yield 'promotion_queue_time_tie',queue([action(10)],clients={1:replace(WATCH,target=0,spectime=100),2:replace(WATCH,target=0,spectime=100)})
    yield 'promotion_signed_oldest_time',queue([action(10)],clients={1:replace(WATCH,target=0,spectime=2147483647),2:replace(WATCH,target=0,spectime=-2147483648)})
    yield 'promotion_dead_spectator_body',queue([action(10)],clients={1:replace(WATCH,target=0,spectime=-100,health=-10,pmtype=3)})
    yield 'promotion_capacity_stays_spectator',queue([action(10)],maxgame=1,nonspectators=1)
    yield 'promotion_tournament_capacity',queue([action(10)],nonspectators=2)
    yield 'promotion_no_candidate',queue([action(10)],clients={1:Client(team=0),2:replace(WATCH,target=-1),3:replace(WATCH,spectator=3)})
    yield 'promotion_zero_limit',queue([action(10)],maxclients=0)
    yield 'promotion_slot_63',queue([action(10)],maxclients=64,clients={1:replace(WATCH,target=-1),2:replace(WATCH,target=-1),3:replace(WATCH,target=-1),63:replace(WATCH,spectime=-10,target=0)})
    for kind in (11,12):
        for playing in (0,1,2,3):
            yield f'remove_{kind}_playing_{playing}',queue([action(kind)],playing=playing,clients={1:Client(name='Second')},nonspectators=2)
        for connection in (0,1,2):
            yield f'remove_{kind}_connection_{connection}',queue([action(kind)],playing=2,clients={0:Client(connected=connection),1:Client(connected=connection)},nonspectators=2)
    for first in (0,1,2):
        for second in (0,1,2):
            yield f'adjust_connections_{first}_{second}',queue([action(13)],clients={0:Client(connected=first,wins=2147483647),1:Client(connected=second,losses=2147483647)})
    yield 'adjust_same_client_both_ranks',queue([action(13)],first=0,second=0,playing=0)
    yield 'adjust_repeated',queue([action(13),action(13,time=1001)],clients={1:Client(name='Second')},playing=2)
    yield 'check_tournament_promotes_and_starts_countdown',queue([action(14)])
    yield 'check_tournament_zero_players_skips_queue',queue([action(14)],playing=0)
    yield 'check_tournament_failed_promotion_waits',queue([action(14)],clients={1:replace(WATCH,target=-1),2:replace(WATCH,target=-1),3:replace(WATCH,spectator=3)},warmup=3000)
    yield 'check_tournament_promotion_then_restart',queue([action(14),action(14,time=20001)] )
    yield 'check_tournament_cvar_changed_after_promotion',queue([action(18,'5',p0=7),action(14)])
    yield 'loser_then_next_player',queue([action(13),action(11,time=2000),action(14,time=3000)],playing=2,clients={1:Client(name='Loser')},nonspectators=2)
    yield 'disconnect_then_next_player',queue([action(4,slot=1,time=2000),action(14,time=3000)],playing=2,clients={1:Client(name='Leaving')},nonspectators=2)
    yield 'follow_then_fill_vacancy',queue([action(8,'1'),action(14,time=2000)],playing=2,clients={1:Client(name='Other')},nonspectators=2)
    rng=random.Random(0xF0110)
    for index in range(20):
        population={slot:replace(WATCH,spectime=rng.randrange(-100,100),target=rng.choice((-2,-1,0,1)),spectator=rng.randrange(4),connected=rng.randrange(3)) for slot in (1,2,3)}
        yield f'queue_mixed_{index}',queue([action(10)],clients=population)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/follow_tournament';sources=build(out) if not args.reuse_build else []
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/team_change_tests.ml','--output','team_change_tests.exe'],check=True)
    bsp=out/'follow_tournament.bsp';bsp.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        if args.case and args.case!=name:continue
        safe=re.sub(r'[^a-zA-Z0-9_-]','_',name);inp,expected=out/(safe+'.bin'),out/(safe+'.expected');inp.write_bytes(data)
        command=[out/'spawn_oracle.exe',bsp,inp,expected,'0','--follow-tournament']
        native_error=name.startswith('error_')
        if native_error:
            result=subprocess.run(command,cwd=out,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,errors='replace',timeout=20)
            (out/(safe+'.oracle.log')).write_text(result.stdout,encoding='utf-8')
            if result.returncode!=72 or 'Cmd_FollowCycle_f: bad dir' not in result.stdout:raise RuntimeError(result.stdout)
        else:run(command,out,log=out/(safe+'.oracle.log'),timeout=20)
        output=run([ROOT/'build/team_change_tests.exe',bsp,inp,expected,'--follow'],ROOT/'build',log=out/(safe+'.test.log'),timeout=20)
        match=re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects',output)
        if not match:raise RuntimeError(output)
        records.append(dict(name=name,actions=int(match[1]),exact_words=int(match[2]),ordered_effects=int(match[3]),native_error=native_error,bytes=expected.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(expected)))
        if len(records)%20==0 or args.case:print(f'{len(records)} follow scenarios passed ({name})',flush=True)
    if not records:raise RuntimeError('No matching follow scenario')
    output=run([ROOT/'build/team_change_tests.exe',bsp,inp,expected,'--follow-contracts'],ROOT/'build',log=out/'contracts.log');print(output.strip())
    contracts=int(re.search(r'(\d+) follow runtime contracts',output)[1])
    result=dict(passed=True,scenarios=records,scenario_count=len(records),actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),ordered_effects=sum(r['ordered_effects'] for r in records),output_bytes=sum(r['bytes'] for r in records),runtime_contracts=contracts,native_errors=sum(r['native_error'] for r in records),test_sha256=sha(ROOT/'build/team_change_tests.exe'),oracle_sha256=sha(out/'spawn_oracle.exe'),map_sha256=sha(bsp),
        scope='Unchanged Baseq3 SanitizeString, ClientNumberFromString, Cmd_Follow_f, Cmd_FollowCycle_f, AddTournamentPlayer, RemoveTournamentLoser, RemoveTournamentWinner and AdjustTournamentScores. Actual SetTeam/death/items/body/userinfo/ClientBegin/Spawn/ranks, SpectatorThink/Pmove attack edges, CheckTournament promotion/countdown/restart and disconnect/rotation sequences. All modeled clients, entityStates, selected private/spatial fields and queue/rank/config state are compared at every host effect and action. Four original bad-direction drops include their partial state. Undefined trailing-ESC reads, zero client ranges and endless invalid-start cycles are separately rejected; no native parity is claimed for those guards. Match-transition orchestration is separately ported and compared by test_intermission.py. Full ClientCommand routing, bots, engine transport/map execution and Missionpack remain open.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    name=('reused-'+(args.case or 'all')+'.json') if args.reuse_build else ((args.case+'.result.json') if args.case else 'result.json')
    (out/name).write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} follow scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")

if __name__=='__main__':main()
