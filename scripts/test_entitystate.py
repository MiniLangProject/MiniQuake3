"""Complete entity storage, player conversion and SetClientViewAngle parity."""
import json
import random
import struct
import subprocess
import sys
from toolchain import ROOT,run
from inventory import sha
from transition_oracle import build
from test_pmove import state_bytes
SCHEMA=json.loads((ROOT/'docs/reference/entitystate.json').read_text())
EFIELDS={f['name']:f for f in SCHEMA['flat_fields']}

def entity_bytes(values):
    data=bytearray(208)
    for name,value in values.items():
        field=EFIELDS[name];num=field['count'];items=value if num>1 else [value]
        struct.pack_into('<'+('f' if field['type']=='float' else 'i')*num,data,field['offset'],*items)
    return data

def cases(count=16384):
    rng=random.Random(0x4553);result=bytearray()
    for i in range(count):
        values={}
        for f in SCHEMA['flat_fields']:
            items=[rng.uniform(-2000,2000) if f['type']=='float' else rng.randrange(-200000,200000) for _ in range(f['count'])]
            values[f['name']]=items[0] if f['count']==1 else items
        seq=rng.randrange(-4,1024);stats=[0]*16;stats[0]=rng.choice([-100,-40,-39,0,1,100]);powerups=[rng.choice([0,0,-1,1000]) for _ in range(16)]
        origin=[rng.uniform(-10000,10000) for _ in range(3)]
        if i%4==0:origin=[rng.choice([0.0,-0.0,0.5,-0.5,1.5,-1.5,16777215.,-16777215.]) for _ in range(3)]
        p=dict(pm_type=i%7,origin=origin,velocity=[rng.uniform(-300,300) for _ in range(3)],viewangles=[rng.uniform(-720,720) for _ in range(3)],
               stats=stats,clientNum=i%64,eFlags=rng.randrange(65536),legsAnim=71,torsoAnim=147,movementDir=i%8,
               eventSequence=seq,entityEventSequence=seq+rng.choice([-4,-2,-1,0,1]),events=[rng.randrange(80),rng.randrange(80)],eventParms=[rng.randrange(256),rng.randrange(256)],
               externalEvent=0 if i%3 else 257,externalEventParm=i,weapon=i%11,groundEntityNum=rng.choice([0,34,1022,1023]),powerups=powerups,loopSound=i,generic1=55)
        angles=[rng.choice([-0.0,0.0,180,360,-360,rng.uniform(-360000,360000)]) for _ in range(3)]
        result+=state_bytes(p)+entity_bytes(values)+struct.pack('<3i3f3i',i%2,(i//2)%2,i*16,*angles,*[rng.randrange(-1000000,1000000) for _ in range(3)])
    return result

def main():
    output=ROOT/'build/reference/entitystate';output.mkdir(parents=True,exist_ok=True);sources=build(output)
    inputs=output/'inputs.bin';inputs.write_bytes(cases());expected=output/'expected.bin'
    run([output/'transition_oracle.exe','--state',inputs,expected],output,log=output/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/entitystate_tests.ml','--output','entitystate_tests.exe'],check=True)
    print(run([ROOT/'build/entitystate_tests.exe',inputs,expected],ROOT/'build',log=output/'test.log',timeout=300).strip())
    count=len(inputs.read_bytes())//712
    result={'passed':True,'cases':count,'exact_words':count*178,'codec_roundtrip_words':count*52,'entitystate_bytes':208,'validated_c_fields':36,'rejection_contracts':2,
            'scope':'BG_PlayerStateToEntityState/ExtraPolate, full entity storage and SetClientViewAngle; native original x86 profile',
            'input_sha256':sha(inputs),'expected_sha256':sha(expected),'test_sha256':sha(ROOT/'build/entitystate_tests.exe'),
            'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
