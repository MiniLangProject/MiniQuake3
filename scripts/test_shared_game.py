"""Shared trajectory, contact, jump-pad state and vector-angle C parity."""
import collections
import json
import random
import struct
import subprocess
import sys
from toolchain import ROOT,run
from inventory import sha
from test_collision import build_oracle
from test_pmove import state_bytes,FIELDS

def cases(count=16384):
    rng=random.Random(0x4247);data=bytearray()
    impulses=[(0,0,0),(0,0,1),(0,0,-1),(0,1,0),(0,-1,0),(1,0,0),(-1,0,0),
              (400,0,400),(400,0,399.999),(400,0,400.001),(400,0,-400),(1,-0.0,-0.0)]
    for i in range(count):
        kind=i%6;start=rng.randrange(-100000,100000);duration=rng.choice([1,8,100,1000,2501,-1000])
        at=rng.choice([start-1,start,start+1,start+duration-1,start+duration,start+duration+1,rng.randrange(-1000000,1000000)])
        base=[rng.uniform(-10000,10000) for _ in range(3)];delta=[rng.uniform(-1000,1000) for _ in range(3)]
        origin=[v+rng.uniform(-60,60) for v in base]
        if i%24<6:
            kind=0;base=[0,0,0];origin=base[:];axis=(i%6)//2;origin[axis]=[44,-50,36,-36,36,-36][i%6]
        impulse=list(impulses[(i//2)%len(impulses)]) if i%2 else [rng.uniform(-2000,2000) for _ in range(3)]
        number=rng.randrange(1,1022);flight=[0]*16
        if i%11==0:flight[6]=1
        values=dict(origin=origin,velocity=[-20,30,40],pm_type=i%7 if i%5==0 else 0,powerups=flight,
                    jumppad_ent=number if i%4==0 else number-1,jumppad_frame=5,pmove_framecount=i%64,
                    eventSequence=i,events=[41,42],eventParms=[6,7])
        angle=rng.choice([0,-0.0,180,-180,360,-360,720,45,44.99999,45.00001,rng.uniform(-1e6,1e6)])
        data+=struct.pack('<3i6fi',kind,start,duration,*base,*delta,at)+state_bytes(values)+struct.pack('<i4f',number,*impulse,angle)
    return data

def main():
    output=ROOT/'build/reference/shared_game';output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,shared_game=True);inputs=output/'inputs.bin';inputs.write_bytes(cases());expected=output/'expected.bin'
    run([output/'collision_oracle.exe',inputs,expected],output,log=output/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/shared_game_tests.ml','--output','shared_game_tests.exe'],check=True)
    print(run([ROOT/'build/shared_game_tests.exe',inputs,expected],ROOT/'build',log=output/'test.log',timeout=300).strip())
    rows=list(struct.iter_unpack('<129I',expected.read_bytes()));eventoff=12+FIELDS['eventParms']['offset']//4
    effects=collections.Counter(value for row in rows for value in row[eventoff:eventoff+2]);assert effects[0] and effects[1]
    result={'passed':True,'cases':len(rows),'exact_words':len(rows)*129,'rejection_cases':6,'effect_parm_histogram':dict(effects),
            'scope':'six BG trajectories, BG_PlayerTouchesItem, BG_TouchJumpPad, vectoangles and angle normalization; finite test inputs',
            'input_sha256':sha(inputs),'expected_sha256':sha(expected),'test_sha256':sha(ROOT/'build/shared_game_tests.exe'),
            'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
