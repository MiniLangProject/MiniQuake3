"""Original target chains, events and verbatim G_RunFrame entity loop parity."""
import argparse
import json
import random
import re
import struct
import subprocess
import sys
from toolchain import ROOT,run
from inventory import sha
from spawn_oracle import build
from spawn_fixtures import entity,pack,bsp

def bits(x):return struct.unpack('<i',struct.pack('<f',x))[0]
def command(*values):return struct.pack('<8i',*values,*([0]*(8-len(values))))
def field(slot,key,value):return (5,slot,key,value)

def fixture(case=''):
    rows=[('worldspawn',{}),
        ('info_notnull',dict(target='leaf',targetShaderName='Shader/Old',targetShaderNewName='shader/new')),
        ('target_delay',dict(target='leaf',wait='0.001',random='0.002')),
        ('target_relay',dict(target='leaf')),
        ('target_teleporter',dict(target='dest')),
        ('trigger_multiple',dict(target='leaf',model='*1')),
        ('trigger_always',dict(target='leaf')),
        ('target_position',dict(targetname='LEAF')),
        ('target_position',dict(targetname='leaf')),
        ('target_position',dict(targetname='changed')),
        ('target_position',dict(targetname='dest',origin='10.25 -20.75 150.5',angles='15 91.25 0')),
        ('trigger_multiple',dict(target='leaf',model='*1',wait='-1')),
        ('trigger_multiple',dict(target='leaf',model='*1',wait='0.1',random='0.2')),
        ('target_delay',dict(target='leaf',delay='0',wait='9')),
        ('target_delay',dict(target='leaf',delay='2',wait='9')),
        ('target_delay',dict(target='leaf')),
        ('info_notnull',{}),
        ('info_notnull',dict(target='leaf',targetname='leaf',targetShaderName='shader/old',targetShaderNewName='shader/replace')),
        *[('info_notnull',{}) for _ in range(5)]]
    if case.startswith('speaker'):
        rows += [('target_speaker',dict(noise='sound/test/speaker',spawnflags=str(flags),wait='1.234567',random='-.987654',origin='128.5 -45.25 300')) for flags in range(16)]
        noises=['','*pain','sound/test.WAV','sound/has.wav.more','a'*59,'b'*60,'c'*63,'d'*80,'x'*70+'.wav']
        rows += [('target_speaker',dict(noise=noise,wait=str(wait),random=str(variance))) for noise,wait,variance in zip(noises,[0,-0.,.09999999,1677721.75,214748368.,-214748368.,'inf','nan',1e-40],[0,1,-1,99.9,1e30,-1e30,'-inf','nan',-0.])]
    if case.startswith('push'):
        rows += [('target_push',values) for values in [dict(),dict(angle='-1'),dict(angle='-2',spawnflags='1'),dict(angles='23.25 -141.75 17',speed='-350.125'),
                 dict(target='dest',speed='37',origin='-100 20 -40'),dict(target='missing'),dict(target='dest',origin='10.25 -20.75 150.5'),dict(target='dest',origin='10.25 -20.75 300')]]
    if case.startswith('timer'):
        rows += [('func_timer',dict(target='leaf',**values)) for values in [dict(),dict(spawnflags='1',wait='.25',random='.125'),dict(wait='0',random='0'),dict(wait='-1',random='0'),dict(wait='.1',random='.2')]]
    if case.startswith('location'):
        rows += [('target_location',dict(message='Area '+str(i),origin=f'{i*100} 3.25 -10',count=str(i%8))) for i in range(70)]
        rows += [('target_location',{})]
    return '\n'.join(entity([('classname',name),*values.items()]) for name,values in rows)

def scenarios():
    setup=[(6,0,0),(6,1,1),(6,2,2),*[field(i,18,1) for i in (70,71,72,80)]]
    yield 'chain_order',setup+[(2,-1,0),(2,64,0),(2,80,1),(2,64,2),field(64,15,4),(2,64,0),field(64,15,0),(2,64,0)]
    for behavior in range(1,8):
        yield 'chain_mutation_'+str(behavior),setup+[field(70,13,behavior),field(70,12,71),(2,64,1)]
    yield 'relay_teams_random',setup+[q for flag in range(8) for q in [field(66,0,flag),*[(1,66,64,a) for a in (0,1,2,79) for _ in range(5)]]]+[field(66,15,0),(1,66,64,0)]
    rng=random.Random(0x54415247);actions=list(setup)
    times=[-2147483648,-1000,-1,0,1,1000,16777215,16777216,16777217,16777219,2147483647]
    for i in range(1024):
        t=rng.choice(times) if i<256 else rng.randrange(-2000000000,2000000000)
        wait=rng.choice([0,-1,.001,.5,1.000999,1000000,1e20]) if i<256 else rng.uniform(-3,3)
        variance=rng.choice([0,.002,.5,99.9,1e20]) if i<256 else rng.uniform(0,3)
        actions += [(0,t),field(65,10,bits(wait)),field(65,11,bits(variance)),(1,65,64,i%3),(3,65)]
    # Repeated use overwrites pending delay and activator, including default/delay key precedence.
    actions += [(0,1000),(1,76,64,0),(1,77,64,1),(1,78,64,2),(0,2000),(3,76),(3,77),(3,78),(0,3000),(3,77)]
    yield 'delay_precision',actions
    actions=list(setup)
    for flags in range(4):
        for activator in (0,1,2,79):
            actions += [field(68,0,flags),field(68,1,0),(1,68,64,activator),(1,68,64,2),(0,2000+flags*1000),(3,68),(12,68,activator)]
    actions += [(1,74,64,1),(1,74,64,2),(0,5100),(3,74),field(75,1,0),(1,75,64,1),(3,75)]
    yield 'multiple_cooldown',actions
    yield 'teleporter_and_expiry',setup+[(1,67,64,79),(1,67,64,0),(0,1300),(4,),(0,1301),(4,),field(1,19,3),(1,67,64,1),field(67,15,4),(1,67,64,2)]
    actions=list(setup)
    for slot in (0,79):
        for old in (0,0x100,0x200,0x300,0x3ff,-1):
            for event in (0,1,45,0x100,0x3ff,-1):
                actions += [field(slot,20 if slot==0 else 8,old),(7,slot,event,1234)]
    actions += [(0,1000),(8,79,0,32),(8,0,7,511),field(0,21,79),field(0,8,1),
                field(1,20,345),field(1,8,0),field(79,17,1),field(79,1,1200),
                (0,1300),(4,),(0,1301),(4,)]
    yield 'event_bits_expiry',actions
    actions=list(setup)
    # Dispatch precedence, hidden neverFree entities, unlink/free priorities.
    for slot,type_,physics in [(0,3,1),(1,4,1),(2,4,0),(79,3,1),(81,2,0),(82,4,0),(83,0,1),(84,0,0)]:
        actions += [field(slot,7,type_),field(slot,6,physics),field(slot,17,1),field(slot,1,1000)]
    actions += [field(85,3,1),field(85,2,1000),field(85,1,1000),field(84,5,1),(4,),(9,84,1),(4,),field(84,4,1),field(84,2,1000),(0,1300),(4,),(0,1301),(4,),
                field(81,3,1),field(81,4,1),field(81,5,1),(9,81,1),(4,),
                field(82,3,1),field(82,4,1),(4,),(0,-2147483648),(4,)]
    yield 'frame_dispatch',actions
    yield 'frame_live_growth',setup+[field(70,13,5),(0,1300),(4,),(0,1301),(4,)]
    actions=[(15,)]
    for value in [0.,-0.,.005,.015,.125,-.125,1.005,99999.99,2147483.75,-2147483.75,3.4028234663852886e38,1.401298464324817e-45]:
        actions += [(14,1,2,bits(value)),(16,)]
    actions += [(15,)]+[(14,i,i+1,bits(i*.123)) for i in range(130)]+[(16,), (14,0,999,bits(-1.5)),(16,)]
    # Long shader names reach the per-row and overall C truncation boundaries.
    actions += [(13,64,999,888),(0,16777217),(2,64,0),(16,), (15,)]
    actions += [(17,i,i+1,bits(3.4028234663852886e38)) for i in range(130)]+[(16,),(17,0,999,bits(-.125)),(16,)]
    yield 'shader_state',actions
    actions=list(setup)
    for slot in range(86,111):
        for activator in (0,79):
            actions += [(1,slot,64,activator),(1,slot,64,activator),(1,slot,64,activator)]
    actions += [(0,1300),(4,),(0,1301),(4,),(10,86)]
    yield 'speaker_modes_and_names',actions
    actions=list(setup)
    for slot in range(86,94):
        for client in (0,1,2,79):actions += [(1,slot,64,client)]
    actions += [(0,1099),(4,),(0,1100),(4,)]
    for slot in range(86,91):
        for mode in range(7):
            actions += [field(0,24,mode),(1,slot,64,0)]
        actions += [field(0,24,0),field(0,25,1),(1,slot,64,0),field(0,25,0)]
        for time in [0,1,1000,2499,2500,2501,4001,4002,2147483647,-2147483648]:
            actions += [(0,time),(1,slot,64,0)]
    yield 'push_modes_apex_and_sound',actions
    actions=list(setup)+[(0,1099),(4,),(0,1100),(4,),(1,87,64,1),(1,87,64,2),(1,87,64,0)]
    for slot in range(86,91):
        actions += [(1,slot,64,1),(1,slot,64,2),(1,slot,64,0),(0,5000),(3,slot)]
    yield 'timer_toggle_and_start',actions
    rng=random.Random(0x54494d45);actions=list(setup)
    for i in range(512):
        time=rng.choice(times) if i<128 else rng.randrange(-2000000000,2000000000)
        wait=rng.choice([0,-1,.00099999,1e20]) if i<128 else rng.uniform(-3,3)
        variance=rng.choice([0,-1,.0001,1e20]) if i<128 else rng.uniform(-3,3)
        actions += [(0,time),field(86,10,bits(wait)),field(86,11,bits(variance)),field(86,1,0),(1,86,64,i%3),(3,86)]
    yield 'timer_precision',actions
    for behavior in [1,2,3,4,5,6,7]:
        # A freed timer still gets nextthink written, but its think pointer is NULL.
        followup=[] if behavior in (1,7) else [(0,100000),(3,86)]
        yield 'timer_mutation_'+str(behavior),setup+[field(70,13,behavior),field(70,12,71),(1,86,64,1),*followup]
    yield 'location_linkup',setup+[field(86,28,0),(0,1199),(3,87),(0,1200),(3,87),(18,608),(18,609),(18,679),
                                 (3,88),(4,),(10,100),(0,1201),(3,89),(18,623)]

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/targets';sources=build(output);mapfile=output/'map.bsp';mapfile.write_bytes(bsp())
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    records=[]
    for name,actions in scenarios():
        if args.case and args.case!=name:continue
        inputs=output/(name+'.bin');inputs.write_bytes(pack(fixture(name))+b''.join(command(*q) for q in actions));expected=output/(name+'.expected')
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--actions'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--actions'],ROOT/'build',log=output/(name+'.test.log'),timeout=600)
        match=re.search(r'(\d+) exact words / (\d+) string bytes',result)
        records.append(dict(name=name,actions=len(actions),exact_words=int(match[1]),string_bytes=int(match[2]),inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {len(actions)} actions / {match[1]} exact words',flush=True)
    if not records:raise RuntimeError('No matching scenario')
    invalid=output/'speaker_missing_noise.bin';invalid.write_bytes(pack(entity([('classname','worldspawn')])+entity([('classname','target_speaker')])))
    rejected=subprocess.run([str(output/'spawn_oracle.exe'),str(mapfile),str(invalid),str(output/'speaker_missing_noise.expected'),'0','--actions'],capture_output=True,text=True)
    assert rejected.returncode==72 and 'target_speaker without a noise key' in rejected.stderr
    run([ROOT/'build/spawn_tests.exe',mapfile,invalid,output/'speaker_missing_noise.expected','0','--reject-spawn'],ROOT/'build',log=output/'speaker_missing_noise.test.log')
    for behavior in (1,7):
        name='timer_freed_think_'+str(behavior);path=output/(name+'.bin');expected=output/(name+'.expected')
        actions=[field(70,18,1),field(70,13,behavior),(1,86,64,0),(0,100000),(3,86)]
        path.write_bytes(pack(fixture('timer'))+b''.join(command(*q) for q in actions))
        c_result=subprocess.run([str(output/'spawn_oracle.exe'),str(mapfile),str(path),str(expected),'0','--actions'],capture_output=True,text=True)
        ml_result=subprocess.run([str(ROOT/'build/spawn_tests.exe'),str(mapfile),str(path),str(expected),'0','--actions'],capture_output=True,text=True,cwd=ROOT/'build')
        (output/(name+'.test.log')).write_text(ml_result.stdout+ml_result.stderr)
        assert c_result.returncode==72 and 'NULL ent->think' in c_result.stderr
        assert ml_result.returncode==1 and 'NULL ent->think' in ml_result.stdout+ml_result.stderr
    (output/'result.json').write_text(json.dumps(dict(passed=True,scenarios=records,actions=sum(r['actions'] for r in records),exact_words=sum(r['exact_words'] for r in records),
        string_bytes=sum(r['string_bytes'] for r in records),test_sha256=sha(ROOT/'build/spawn_tests.exe'),original_missing_noise_rejection=True,original_freed_timer_rejections=2,
        scope='Original target, event, spawn and allocated-entity frame loop; missile/item/mover/client handlers record dispatch only; no complete G_RunFrame/server acceptance',
        entity_loop_sha256=sha(output/'entity_frame.inc'),original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources}),indent=2)+'\n')

if __name__=='__main__':main()
