"""Original baseq3 item pickups, physics and CTF flag rules versus MiniLang."""
import argparse, json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, run
from spawn_oracle import build
from spawn_fixtures import pack
from test_bodies import fixture, map_bytes
from test_combat import command, bits

def state(gametype=0,time=1000,previous=0,red=0,blue=0,neutral=0):
    return (91,gametype,time,previous,red,blue,neutral)
def entity(slot,item,flags=0,origin=(0.,0.,128.),bounce=.5,link=0):
    return (92,slot,item,flags,*map(bits,origin),0,0,0,bits(bounce),link)
def launch(item,origin=(0.,0.,128.),velocity=(0.,0.,0.)):
    return (93,item,*map(bits,origin),*map(bits,velocity))
def drop(slot,item,angle):return (94,slot,item,bits(angle))
def field(slot,key,value):return (102,slot,key,value)
def vector(slot,key,value):return (103,slot,key,*map(bits,value))
def player(slot,team=0,health=100,max_health=100,predict=1,connected=2,name=1):
    return (107,slot,team,health,max_health,predict,connected,name)
def pfield(slot,key,value,index=0):return (108,slot,key,value,index)
def touch(item_slot,player_slot):return (109,item_slot,player_slot)
def can_grab(item_slot,player_slot):return (110,item_slot,player_slot)
def pickup(item_slot,player_slot,kind):return (111,item_slot,player_slot,kind)
def ifield(slot,key,value):return (112,slot,key,value)
def lfield(key,value,index=0):return (113,0,key,value,index)
def target(slot):return (114,slot)
def position(slot,origin,velocity=(0.,0.,0.)):return (12,slot,*map(bits,origin),*map(bits,velocity))

def scenarios():
    yield 'launch_and_drop',fixture([]),[
        state(),launch(12,(10.,20.,128.),(30.,-40.,250.)),vector(64,0,(100.,-50.,96.)),vector(64,1,(17.5,91.25,-4.)),
        drop(64,9,0.),drop(64,16,45.),drop(64,28,-90.)],map_bytes()

    actions=[state()]
    for item in range(1,36):actions.append(launch(item,(float(item*3),float(-item*2),128.),(float(item),float(item-20),200.)))
    yield 'launch_baseq3_catalog',fixture([]),actions,map_bytes()

    yield 'ctf_flag_launch_status',fixture([]),[
        state(4),launch(34,(-100.,0.,128.),(10.,20.,200.)),launch(35,(100.,0.,128.),(-10.,20.,200.)),
        (96,64),(96,65)],map_bytes()

    yield 'respawn_regular_and_powerup',fixture([]),[
        state(),entity(64,12),entity(65,28),entity(66,30),field(64,13,128),field(64,14,1),field(64,7,0),
        field(65,13,128),field(65,14,1),field(65,7,0),field(66,13,128),field(66,14,1),field(66,7,0),field(66,15,bits(1.)),
        (95,64),(95,65),(95,66)],map_bytes()

    yield 'teamed_respawn_selection',fixture([]),[
        state(),entity(64,12),entity(65,12),entity(66,12),field(64,10,1),field(64,8,64),field(64,9,65),field(65,9,66),
        field(64,13,128),field(65,13,128),field(66,13,128),(95,64),(95,64),(95,64)],map_bytes()

    yield 'flag_reset_and_return',fixture([]),[
        state(4),entity(64,34),entity(65,35),entity(66,34,0x1000,(20.,0.,128.)),entity(67,35,0x1000,(-20.,0.,128.)),
        field(64,13,128),field(64,14,1),field(64,7,0),field(65,13,128),field(65,14,1),field(65,7,0),
        (98,1),(98,2),(97,1),(97,2)],map_bytes()

    yield 'dropped_flag_timeout',fixture([]),[
        state(4),entity(64,34),entity(65,34,0x1000,(30.,0.,128.)),field(64,13,128),field(64,14,1),field(64,7,0),(96,65),(100,65)],map_bytes()

    yield 'team_free_nodrop',fixture([]),[
        state(4),entity(64,35),entity(65,35,0x1000,(40.,0.,128.)),field(64,13,128),field(64,14,1),field(64,7,0),(96,65),(99,65)],map_bytes(True)

    rows=[
        [('classname','item_health'),('origin','-100 0 128')],
        [('classname','weapon_rocketlauncher'),('origin','100 0 128')],
        [('classname','item_quad'),('origin','0 100 160'),('spawnflags','1'),('noglobalsound','1')],
        [('classname','item_health_large'),('origin','0 -100 128'),('targetname','delayed')],
        [('classname','team_CTF_redflag'),('origin','0 0 128')],
    ]
    actions=[state(0,1199,1100)]+[(18,slot) for slot in range(64,69)]+[state(0,1200,1199)]+[(18,slot) for slot in range(64,69)]
    yield 'map_item_spawn_finish',fixture(rows),actions,map_bytes()

    actions=[state(),launch(12,(-128.,0.,128.),(80.,0.,-250.))]
    for time in (1050,1100,1200,1400,1800):actions += [state(0,time,time-50),(101,64)]
    yield 'item_physics_bounce',fixture([]),actions,map_bytes()

    actions=[state(),launch(12,(-128.,0.,128.),(0.,0.,-300.))]
    for time in (1050,1100,1200,1400):actions += [state(0,time,time-50),(101,64)]
    yield 'item_physics_nodrop',fixture([]),actions,map_bytes(True)

    actions=[state(),launch(12,(-128.,0.,128.),(40.,0.,-150.))]
    for time in (1050,1100,1200):actions += [state(0,time,time-50),(104,)]
    yield 'allocated_frame_item_path',fixture([]),actions,map_bytes()

    yield 'can_grab_catalog_limits',fixture([]),[
        state(),player(0),entity(64,1),pfield(0,2,200,3),can_grab(64,0),pfield(0,2,199,3),can_grab(64,0),
        entity(65,4),pfield(0,2,200,0),can_grab(65,0),pfield(0,2,199,0),can_grab(65,0),
        entity(66,5),pfield(0,2,100,0),can_grab(66,0),pfield(0,2,99,0),can_grab(66,0),
        entity(67,18),pfield(0,0,200,3),can_grab(67,0),pfield(0,0,199,3),can_grab(67,0),
        entity(68,26),pfield(0,2,27,1),can_grab(68,0),pfield(0,2,0,1),can_grab(68,0),
        entity(69,9),can_grab(69,0),entity(70,28),can_grab(70,0),entity(71,34),can_grab(71,0),
        state(4),pfield(0,6,1),can_grab(71,0),ifield(71,6,1),can_grab(71,0),ifield(71,6,0),
        entity(72,35),can_grab(72,0),pfield(0,1,2147483647,8),can_grab(71,0)
    ],map_bytes()

    yield 'direct_regular_pickups',fixture([]),[
        state(0,12345),player(0),entity(64,9),pfield(0,0,7,3),pickup(64,0,3),
        entity(65,9,0x1000),pickup(65,0,3),entity(66,9),ifield(66,0,-1),pickup(66,0,3),
        entity(67,17),pickup(67,0,3),entity(68,18),pfield(0,0,198,3),pickup(68,0,2),
        ifield(68,0,-5),pickup(68,0,2),entity(69,4),pfield(0,2,195,0),pfield(0,15,195),pickup(69,0,4),
        entity(70,5),pfield(0,2,90,0),pfield(0,15,90),pickup(70,0,4),
        entity(71,2),pfield(0,2,180,3),pickup(71,0,5),entity(72,27),pickup(72,0,1),
        entity(73,28),pickup(73,0,0),ifield(73,0,7),pickup(73,0,0),
        state(3,20000),entity(74,12),lfield(2,37),pickup(74,0,3)
    ],map_bytes()

    yield 'powerup_denial_and_team_filter',fixture([]),[
        state(0,54321),player(0,0,100,100,1,2,1),player(1,0,100,100,1,2,2),
        position(0,(300.,300.,128.)),position(1,(-100.,0.,128.)),entity(64,28,0,(0.,0.,128.)),pickup(64,0,0),
        state(3,60000),player(2,1,100,100,1,2,3),pfield(0,6,1),pfield(1,6,2),
        position(0,(300.,300.,128.)),position(1,(-100.,0.,128.)),position(2,(-100.,0.,128.)),entity(65,29,0,(0.,0.,128.)),pickup(65,0,0)
    ],map_bytes()

    yield 'touch_events_targets_and_respawn',fixture([]),[
        state(0,5000),player(0,0,50,100,1),entity(64,18),touch(64,0),
        pfield(0,4,0),entity(65,5),touch(65,0),target(66),entity(67,9),ifield(67,4,1),ifield(67,1,bits(-1.0)),touch(67,0),
        entity(68,1),ifield(68,1,bits(7.9)),ifield(68,2,bits(2.5)),touch(68,0),
        entity(69,28,0x1000),ifield(69,3,bits(1.0)),touch(69,0),
        entity(70,26),ifield(70,1,bits(-1.0)),touch(70,0)
    ],map_bytes()

    yield 'touch_rejection_paths',fixture([]),[
        state(),entity(64,5),(109,64,70),player(0,0,0),touch(64,0),pfield(0,15,100),pfield(0,2,100,0),touch(64,0),
        pfield(0,2,50,0),touch(64,0)
    ],map_bytes()

    yield 'ctf_take_and_return',fixture([]),[
        state(4,100000),player(0,1),entity(64,34),entity(65,35),touch(65,0),
        state(4,105000,100000,4,0,0),entity(66,34,0x1000,(32.,0.,128.)),touch(66,0)
    ],map_bytes()

    yield 'ctf_red_capture_assist',fixture([]),[
        state(4,120000),player(0,1,100,100,1,2,1),player(1,1,100,100,1,2,2),player(2,2,100,100,1,2,3),
        pfield(0,1,2147483647,8),pfield(1,8,bits(115000.0)),entity(64,34,0,(64.,0.,128.)),entity(65,35,0,(-64.,0.,128.)),touch(64,0)
    ],map_bytes()

    yield 'ctf_blue_capture_assist',fixture([]),[
        state(4,220000),player(0,2,100,100,1,2,1),player(1,2,100,100,1,2,2),player(2,1,100,100,1,2,3),
        pfield(0,1,2147483647,7),pfield(1,12,bits(215000.0)),entity(64,34,0,(64.,0.,128.)),entity(65,35,0,(-64.,0.,128.)),touch(65,0)
    ],map_bytes()

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/items';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,text,actions,data in scenarios():
        if args.case and args.case!=name:continue
        mapfile=output/(name+'.bsp');mapfile.write_bytes(data);inputs=output/(name+'.bin');inputs.write_bytes(pack(text)+b''.join(command(*a) for a in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--items'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--items'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result);assert match,result
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),inputs_sha256=sha(inputs),expected_sha256=sha(expected),map_sha256=sha(mapfile)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words',flush=True)
    assert records
    print(run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--item-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),string_bytes=sum(r['string_bytes'] for r in records),runtime_contracts=12,test_sha256=sha(ROOT/'build/spawn_tests.exe'),scope='Baseq3 item registration/spawn/finish, pickup eligibility and item-specific pickup functions, Touch_Item events/targets/respawn, powerup denial, dropped-item physics, and complete CTF flag take/return/capture scoring. Disabled-item Cvar registration remains an explicit boundary.',original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
