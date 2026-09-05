"""Original baseq3 damage/armor/team/hazard functions against MiniLang state.

Pain/death/mover callbacks observe their contracts; they do not replace player_die.
"""
import argparse
import collections
import json
import random
import re
import struct
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run
from spawn_oracle import build
from spawn_fixtures import bsp,entity,pack

def bits(value):return struct.unpack('<i',struct.pack('<f',value))[0]
def command(*q):return struct.pack('<16i',*q,*([0]*(16-len(q))))
def field(slot,key,value):return (2,slot,key,value)
def init(slot=0,client=1,team=0,health=100,armor=0,maxhealth=100):return (1,slot,client,team,health,armor,maxhealth)
def hit(targ=0,inflictor=1,attacker=1,damage=100,flags=0,mod=6,dir=(3.,4.,5.),point=(11.,22.,33.)):
    return (3,targ,inflictor,attacker,damage,flags,mod,*map(bits,dir or (3.,4.,5.)),int(dir is not None),*map(bits,point or (11.,22.,33.)),int(point is not None))
def place(slot,origin,velocity=(0.,0.,0.)):return (12,slot,*map(bits,origin),*map(bits,velocity))
def fixture(name):
    text=entity([('classname','worldspawn')])
    if name.startswith('hurt'):
        for flags in range(32):text+=entity([('classname','trigger_hurt'),('model','*1'),('spawnflags',str(flags)),('damage','0' if flags%2==0 else '7')])
    else:
        text+=entity([('classname','target_kill')])+entity([('classname','info_notnull')])
    return text

def inspect_combat(data):
    """Read record boundaries, so integration gates require real callbacks."""
    off=0;counts=collections.Counter()
    def ints(n):
        nonlocal off
        values=struct.unpack_from('<'+'i'*n,data,off);off+=n*4;return values
    def string():
        nonlocal off
        size=ints(1)[0]
        if size>=0:off+=size
    def snapshot():
        ints(124)
        for _ in range(9):string()
    def extra():
        ints(6)
        if ints(1)[0]:ints(132)
    while off<len(data):
        kind=ints(1)[0];counts[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:ints(2);snapshot()
        elif kind in (5,6):snapshot()
        elif kind==7:ints(1)
        elif kind==20:ints(6)
        elif kind in (21,22):ints(1)
        elif kind in (23,24,25):ints(9)
        elif kind==26:
            ints(5);assert ints(1)[0]==8
            _,num,*_=ints(8)
            for _ in range(num-64+1):snapshot()
            for _ in range(3):snapshot();extra()
            for _ in range(num-64+1):extra()
        else:raise RuntimeError('Unknown combat record '+str(kind)+' at '+str(off))
    assert off==len(data)
    return {'pain_callbacks':counts[23],'death_callbacks':counts[24],'mover_callbacks':counts[25],
            'spatial_links':counts[5],'spatial_unlinks':counts[6]}

def scenarios():
    # Exhaust armor rounding boundaries, including negative and int32 extremes.
    actions=[init(),init(1,0)]
    for damage in [0,1,2,3,49,50,51,99,100,101,199,200,201,999,100000,-1,-50,-100,-2147483648,2147483647]:
        for armor in [0,1,2,33,66,100,100000,-1,2147483647]:
            for flags in [0,2,8,10]:actions += [field(0,22,armor),(4,0,damage,flags)]
        actions += [(4,1,damage,0)]
    yield 'armor_rounding',actions
    actions=[]
    # Original ordering: momentum before protection, suit before self/armor.
    for gametype in [0,3,4]:
        for team in [0,1,2]:
            for flags in range(16):
                actions += [init(0,team=1,armor=50),init(1,team=team),field(0,40,gametype),field(0,41,flags%2),
                            field(0,2,0x10 if flags&2 else 0),field(0,26,flags&4),hit(damage=101,flags=flags)]
    for damage in [0,1,2,3,199,200,201,100000,-1,-999]:
        for flags in [0,1,2,4,8,15]:
            actions += [init(armor=33),field(0,26,1),hit(attacker=0,damage=damage,flags=flags),hit(attacker=-1,inflictor=-1,damage=damage,flags=flags,mod=19,dir=None,point=None)]
    yield 'protection_and_self',actions
    actions=[init(1)]
    for condition in ['takedamage','intermission','noclip','mover','mover_in_motion','mover_no_use']:
        for client in [0,1]:
            actions += [init(client=client),field(0,13,1)]
            if condition=='takedamage':actions += [field(0,1,0)]
            if condition=='intermission':actions += [field(0,43,1)]
            if condition=='noclip' and client:actions += [field(0,21,1)]
            if condition.startswith('mover'):actions += [field(0,3,4),field(0,4,0 if condition=='mover' else 1)]
            if condition=='mover_no_use':actions += [field(0,4,0),field(0,13,0)]
            actions += [hit(inflictor=-1,attacker=-1),field(0,43,0)]
    for damage in [0,1,200,100000]:
        for mode in [0,1,2,3]:
            actions += [init(health=100,armor=100),field(0,5,mode&1),field(0,12,int(mode==3)),hit(damage=damage,flags=2)]
    # Nonclients may be general/missile targets; original hit counter excludes both.
    for type_ in [0,3]:actions += [init(client=0),field(0,3,type_),hit(damage=25),hit(damage=100000)]
    yield 'early_returns_and_callbacks',actions
    actions=[]
    for targetteam in range(4):
        for attackerteam in range(4):
            for gametype in [-1,0,1,2,3,4,5,8]:
                actions += [init(team=targetteam,armor=999),init(1,team=attackerteam),field(0,40,gametype),field(0,41,1),
                            field(0,27,1),field(0,28,1),(7,0,1),hit(damage=1),field(1,31,0),field(0,27,0),field(0,28,0),field(0,29,1),(8,0,1)]
    actions += [init(2,0),(7,0,2),(7,2,1),(8,0,2),(8,2,1)]
    for time in [0,-1,16777215,16777216,16777217,16777219,2147483647,-2147483648]:
        actions += [init(team=1,armor=100),init(1,team=2),field(0,40,4),field(0,44,time),field(0,28,1),hit(damage=1),field(1,31,0),(8,0,1)]
    yield 'teams_and_carrier',actions
    rng=random.Random(0x44414d47);actions=[]
    for i in range(1024):
        damage=rng.choice([0,1,-1,3,49,50,51,199,200,201,100000,2147483647,-2147483648]) if i<256 else rng.randrange(-10000,10000)
        armor=rng.choice([0,1,100,-1,2147483647]) if i<256 else rng.randrange(0,1000)
        direction=rng.choice([None,(0.,-0.,0.),(1e-20,0.,0.),(1e20,-1e20,0.),(1.,2.,3.)]) if i<256 else tuple(rng.uniform(-1000,1000) for _ in range(3))
        actions += [init(health=rng.choice([1,100,999,2147483647]),armor=armor),init(1,maxhealth=rng.choice([0,1,37,99,100,200,999])),
                    field(0,2,rng.choice([0,0x800])),field(0,24,rng.choice([0,1,160,999])),field(0,25,rng.randrange(256)),
                    field(0,42,bits(rng.choice([0.,-0.,1.,-1000.,1000.,123.125]))),
                    place(0,(10.25,-20.75,32.5),tuple(rng.uniform(-500,500) for _ in range(3))),
                    hit(attacker=rng.choice([0,1,-1]),inflictor=rng.choice([0,1,-1]),damage=damage,flags=rng.randrange(16),dir=direction)]
    # Counter wrapping and a pre-existing external event, without integer UB crashes.
    actions += [init(armor=10),init(1),field(0,32,2147483647),field(0,33,2147483647),field(0,34,2147483647),field(1,30,2147483647),field(0,26,1),field(0,37,0x3ff),hit(damage=25)]
    yield 'numeric_damage',actions
    actions=[]
    for flags in range(32):
        slot=64+flags
        actions += [init(armor=10),init(1,armor=10),field(0,44,1000),field(slot,7,0),field(0,2,0x10 if flags%2 else 0),
                    (5,slot,0),(5,slot,1),field(0,44,1099),(5,slot,1),field(0,44,1100),(5,slot,1),
                    field(0,44,1999),(5,slot,0),field(0,44,2000),(5,slot,0)]
        if flags&2:actions += [(6,slot,0,0),(6,slot,0,0)]
    actions += [init(),field(0,1,0),field(64,7,0),(5,64,0),field(0,1,1),field(0,44,2147483647),(5,64,0),(5,64,0),field(0,44,-2147483648),(5,64,0)]
    yield 'hurt_flags_and_timing',actions
    # All other hazards are explicitly unlinked to isolate real broadphase/contact.
    actions=[(10,slot,0) for slot in range(64,96)]+[init(health=1000),place(0,(-100.,0.,-100.)),(10,64,1),(10,0,1),(13,0),(13,0),field(0,44,1100),(13,0),(10,64,0),(13,0)]
    yield 'hurt_spatial_contact',actions
    actions=[]
    for armor in [0,100,100000,2147483647]:
        for suit in [0,1]:
            actions += [init(armor=armor),field(0,26,suit),field(0,2,0x10),(6,64,0,0)]
    actions += [init(client=0),(6,64,0,0)]
    yield 'target_kill',actions
    actions=[init(),init(1,armor=100),init(2,armor=50),place(0,(100.,0.,100.)),place(1,(100.,0.,100.)),place(2,(100.,0.,100.)),(10,1,1),(10,2,1),(9,0)]
    actions += [init(1,armor=100),place(1,(200.,0.,101.)),(10,1,1),(14,0,*map(bits,(200.,0.,100.)))]
    actions += [init(1,armor=100),place(1,(300.,0.,101.)),(10,1,1),field(0,20,3),(14,0,*map(bits,(300.,0.,100.)))]
    yield 'killbox_and_teleport',actions

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/combat';sources=build(output);mapfile=output/'map.bsp';mapfile.write_bytes(bsp())
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,actions in scenarios():
        if args.case and args.case!=name:continue
        inputs=output/(name+'.bin');inputs.write_bytes(pack(fixture(name))+b''.join(command(*q) for q in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--combat'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--combat'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result)
        observed=inspect_combat(expected.read_bytes())
        if name=='hurt_spatial_contact':assert observed['pain_callbacks']==2,observed
        if name=='killbox_and_teleport':assert observed['death_callbacks']==3,observed
        if name=='early_returns_and_callbacks':assert all(observed[key]>0 for key in ('pain_callbacks','death_callbacks','mover_callbacks')),observed
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),**observed,inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words',flush=True)
    if not records:raise RuntimeError('No matching scenario')
    print(run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--combat-contracts'],ROOT/'build',log=output/'contracts.log').strip())
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),
        string_bytes=sum(r['string_bytes'] for r in records),test_sha256=sha(ROOT/'build/spawn_tests.exe'),runtime_contracts=6,
        scope='Baseq3 G_Damage/CheckArmor/OnSameTeam/Team_CheckHurtCarrier and hurt/kill spawns; actual server CM and teleport integration. Pain/die/mover callbacks observe dispatch only; no player_die, scoring, damage feedback or complete game server.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n')

if __name__=='__main__':main()
