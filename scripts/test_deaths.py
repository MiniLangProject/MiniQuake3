"""Original baseq3 death lifecycle and team frag bonuses versus MiniLang."""
import argparse, json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run
from spawn_oracle import build
from spawn_fixtures import pack
from test_bodies import fixture, map_bytes
from test_combat import command, bits

def lf(key,value):return (62,0,key,value)
def cf(slot,key,value):return (61,slot,key,value)
def limits(count=4):return [lf(0,count),lf(1,count)]
def player(slot,team=0,health=100,name=1,connected=2):return (80,slot,connected,team,health,name)
def df(slot,key,value,index=0):return (81,slot,key,value,index)
def position(slot,origin):return (89,slot,*map(bits,origin),*map(bits,origin),*map(bits,origin))
def named(slot,name,origin=(0.,0.,128.),current=None,flags=0):
    current=origin if current is None else current
    return (88,slot,name,flags,*map(bits,origin),*map(bits,current))
def die(victim=0,inflictor=1,attacker=1,damage=100,mod=6):return (82,victim,inflictor,attacker,damage,mod)
def damage(victim=0,inflictor=1,attacker=1,amount=200,flags=0,mod=6):
    direction=(1.,0.,0.);point=(0.,0.,128.)
    return (3,victim,inflictor,attacker,amount,flags,mod,*map(bits,direction),1,*map(bits,point),1)
def base_players(vteam=0,ateam=0):
    return limits(4)+[player(0,vteam,100,1),player(1,ateam,100,3),position(0,(0.,0.,128.)),position(1,(100.,0.,128.))]

def scenarios():
    actions=base_players()+[df(0,11,bits(17.5),1),df(0,11,bits(-23.25),0),df(0,11,bits(35.75),2),df(0,12,5),df(0,13,7),die()]
    yield 'enemy_normal_death',fixture([]),actions,map_bytes()

    actions=base_players()+[df(1,7,-1999),die(mod=2),player(0,0,100,1),position(0,(0.,0.,128.)),lf(5,4000),df(1,7,1001),die(mod=6)]
    yield 'gauntlet_and_excellent_2999',fixture([]),actions,map_bytes()
    actions=base_players()+[df(1,7,-2000),die(mod=6)]
    yield 'excellent_boundary_3000',fixture([]),actions,map_bytes()

    actions=limits(4)+[player(0,1,100,2),player(1,1,100,2),position(0,(0.,0.,128.)),position(1,(50.,0.,128.)),die(),player(2,2,100,3),position(2,(100.,0.,128.)),die(2,2,2,100,20)]
    yield 'teamkill_and_suicide',fixture([]),actions,map_bytes()

    actions=limits(4)+[player(0,0,100,1),position(0,(0.,0.,128.)),named(1,1,(20.,0.,128.)),die(0,1,1,100,23),player(0,0,100,1),position(0,(0.,0.,128.)),df(1022,16,1022),die(0,1022,1022,100,17)]
    yield 'nonclient_and_world_killers',fixture([]),actions,map_bytes()

    actions=base_players()
    for mod in range(24):
        actions += [player(0,0,100,1),position(0,(0.,0.,128.)),die(mod=mod)]
    actions += [player(0,0,100,1),position(0,(0.,0.,128.)),die(mod=-1),player(0,0,100,1),position(0,(0.,0.,128.)),die(mod=24)]
    yield 'obituary_table',fixture([]),actions,map_bytes()

    actions=limits()+[player(0),df(0,0,5),df(0,4,7,5),df(0,5,1500,1),df(0,5,3500,2),df(0,5,9000,7),df(0,5,10000,8),df(0,5,11000,9),(84,0)]
    yield 'toss_weapon_and_powerups',fixture([]),actions,map_bytes()
    actions=limits()+[player(0),df(0,0,2),df(0,1,2),df(0,2,5),df(0,3,1<<5),df(0,4,3,5),(84,0),player(0),df(0,0,10),df(0,1,2),df(0,2,8),df(0,3,1<<8),df(0,4,9,8),(84,0)]
    yield 'toss_pending_weapon_switches',fixture([]),actions,map_bytes()
    actions=limits()+[lf(12,3),player(0),df(0,0,5),df(0,4,3,5),df(0,5,9000,1),df(0,5,9000,7),(84,0)]
    yield 'team_toss_skips_powerups',fixture([]),actions,map_bytes()

    actions=base_players()+[df(0,5,9000,9),df(0,5,9000,7),df(0,5,9000,8),die(mod=20)]
    yield 'suicide_flag_priority',fixture([]),actions,map_bytes()
    actions=base_players()+[df(0,5,9000,7),df(0,5,9000,8),die()]
    yield 'nodrop_flag_return',fixture([]),actions,map_bytes(True)

    actions=limits(4)+[lf(12,4),player(0,1,100,2),player(1,2,100,3),player(2,2,100,4),position(0,(0.,0.,128.)),position(1,(100.,0.,128.)),df(0,5,1,8),df(1,8,500),df(2,8,750),(83,0,1,1)]
    yield 'frag_flag_carrier',fixture([]),actions,map_bytes()
    actions=limits(3)+[lf(12,4),lf(5,9000),player(0,1,100,2),player(1,2,100,3),position(0,(0.,0.,128.)),position(1,(100.,0.,128.)),df(0,8,1001),(83,0,1,1),player(0,1,100,2),position(0,(0.,0.,128.)),df(0,8,1000),df(1,5,1,7),(83,0,1,1)]
    yield 'carrier_danger_protect',fixture([]),actions,map_bytes()

    actions=limits(3)+[lf(12,4),player(0,1,100,2),player(1,2,100,3),position(0,(500.,0.,128.)),position(1,(1200.,0.,128.)),named(64,7,(0.,0.,128.)),(83,0,1,1)]
    yield 'flag_base_defense',fixture([]),actions,map_bytes()
    actions=limits(4)+[lf(12,4),player(0,1,100,2),player(1,2,100,3),player(2,1,100,4),position(0,(4000.,0.,128.)),position(1,(250.,0.,128.)),position(2,(0.,0.,128.)),df(2,5,1,7),named(64,7,(5000.,0.,128.)),(83,0,1,1)]
    yield 'carrier_defense_vector_reuse',fixture([]),actions,map_bytes()

    actions=limits(3)+[lf(12,4),player(0,2),player(1,1),position(0,(0.,0.,128.)),position(1,(500.,0.,128.)),df(0,5,1,7),named(64,7,(199.,0.,128.)),(85,0,1),player(0,2),position(0,(0.,0.,128.)),df(0,5,1,7),named(65,7,(200.,0.,128.)),(85,0,1)]
    yield 'almost_capture_radius',fixture([]),actions,map_bytes()
    actions=limits(3)+[player(0,2),player(1,1),position(0,(0.,0.,128.)),position(1,(500.,0.,128.)),df(0,18,5),named(64,8,(199.,0.,128.)),(86,0,1),player(0,1),position(0,(0.,0.,128.)),df(0,18,5),named(65,9,(200.,0.,128.)),(86,0,1)]
    yield 'almost_scored_radius',fixture([]),actions,map_bytes()

    actions=base_players()+[named(64,1,(10.,0.,128.)),df(64,20,0),df(0,19,64),die()]
    yield 'hook_cleanup_on_death',fixture([]),actions,map_bytes()

    actions=base_players()+[df(0,22,-40),die(),player(2,0,-50,4),position(2,(200.,0.,128.)),df(2,21,0),die(2,1,1,100,6),player(3,0,100,1),position(3,(300.,0.,128.)),die(3,1,1,100,20)]
    yield 'gib_blood_and_suicide',fixture([]),actions,map_bytes()

    actions=limits(4)+[player(0),player(1),player(2,3,100,4),cf(2,3,1),cf(2,4,0),position(0,(0.,0.,128.)),position(1,(100.,0.,128.)),die()]
    yield 'spectator_score_refresh',fixture([]),actions,map_bytes()

    actions=limits(2)+[(90,),player(0),position(0,(0.,0.,128.)),df(0,17,77),(87,0)]
    yield 'respawn_wrapper',fixture([]),actions,map_bytes()

    actions=base_players()+[damage()]
    yield 'damage_to_player_die',fixture([]),actions,map_bytes()

    actions=base_players()+[df(0,6,3),die(),player(0),position(0,(0.,0.,128.)),lf(2,1234),die()]
    yield 'death_early_returns',fixture([]),actions,map_bytes()

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/deaths';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,text,actions,data in scenarios():
        if args.case and args.case!=name:continue
        mapfile=output/(name+'.bsp');mapfile.write_bytes(data)
        inputs=output/(name+'.bin');inputs.write_bytes(pack(text)+b''.join(command(*a) for a in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--deaths'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--deaths'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result);assert match,result
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),inputs_sha256=sha(inputs),expected_sha256=sha(expected),map_sha256=sha(mapfile)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words',flush=True)
    assert records
    print(run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--death-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),string_bytes=sum(r['string_bytes'] for r in records),runtime_contracts=8,test_sha256=sha(ROOT/'build/spawn_tests.exe'),scope='Baseq3 player_die, Team_FragBonuses, TossClientItems decisions, almost-capture/scored checks and respawn wrapper. Drop_Item, Team_ReturnFlag, PrintMsg and ClientSpawn remain explicit observed callbacks; collision, PVS, scores, body queue and hook cleanup execute in the port.',original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
