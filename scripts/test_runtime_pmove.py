"""PK3 -> MiniLang collision -> command text -> Pmove CLI vs original C."""
import argparse
import json
import struct
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from test_pmove import state_bytes,FIELDS
from inventory import sha

def main():
    parser=argparse.ArgumentParser();parser.add_argument('data_root',type=Path);args=parser.parse_args()
    output=ROOT/'build/reference/runtime_pmove';output.mkdir(parents=True,exist_ok=True)
    build_oracle(output,pmove=True)
    archive=args.data_root/'baseq3/pak0.pk3'
    with zipfile.ZipFile(archive) as z:data=z.read('maps/q3dm1.bsp')
    bsp=output/'map.bsp';bsp.write_bytes(data)
    commands=[]
    for line in (ROOT/'examples/movement.tsv').read_text().splitlines():
        if line and not line.startswith('#'):commands.append(list(map(int,line.split('\t'))))
    for i in range(12,268):
        commands.append([(i+1)*16,0,(i*137)&65535,0,127,(-127 if i%32<16 else 127),(20 if i%64<32 else 0),int(i%16<8),2])
    commandfile=output/'commands.tsv';commandfile.write_text('\n'.join('\t'.join(map(str,c)) for c in commands)+'\n')
    initial=state_bytes(dict(origin=[216,1328,24],gravity=800,speed=320,viewheight=26,groundEntityNum=1023,weapon=2,
                             stats=[100,0,2046,0,0,0,100]+[0]*9,ammo=[100,-1]+[100]*14))
    inputs=output/'inputs.bin';expected=output/'expected.bin'
    queries=[]
    for i,c in enumerate(commands):
        t,pitch,yaw,roll,f,r,u,buttons,weapon=c
        queries.append(initial+struct.pack('<5iB3b7i',t,pitch,yaw,roll,buttons,weapon,f,r,u,int(i!=0),0,8,0,0,0,0))
    inputs.write_bytes(b''.join(queries));run([output/'collision_oracle.exe',bsp,inputs,expected,'0'],output,log=output/'oracle.log')
    binary=ROOT/'build/MiniQuake3.exe'
    response=run([binary,'--pmove-map',archive,'maps/q3dm1.bsp','216','1328','24',commandfile],ROOT/'build',log=output/'test.log')
    lines=response.splitlines()[1:]
    if len(lines)!=len(commands):raise RuntimeError('Incorrect CLI frame count')
    reference=expected.read_bytes()
    for i,line in enumerate(lines):
        fields=line.split('\t')
        if len(fields)!=15:raise RuntimeError('Incorrect CLI column count')
        actual=struct.pack('<i6f8i',int(fields[0]),*map(float,fields[1:7]),*map(int,fields[7:]))
        row=reference[i*664:(i+1)*664]
        names=['commandTime','origin','velocity','groundEntityNum','pm_flags']
        wanted=b''.join(row[FIELDS[name]['offset']:FIELDS[name]['offset']+4*FIELDS[name]['count']] for name in names)
        wanted+=row[520:524] # pmove.waterlevel
        for name in ('weapon','weaponTime','eventSequence','events'):
            f=FIELDS[name];wanted+=row[f['offset']:f['offset']+f['count']*4]
        if actual!=wanted:raise RuntimeError(f'CLI Pmove frame {i} differs from C')
    result={'passed':True,'scope':'PK3-to-Pmove CLI; static world; native baseq3 command cycle',
            'commands':len(commands),'exact_fields':len(commands)*15,'binary_sha256':sha(binary),'input_sha256':sha(commandfile),
            'map_sha256':sha(bsp),'expected_sha256':sha(expected)}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print(f'PASS: {len(commands)} PK3-to-Pmove CLI commands / {len(commands)*15} exact fields')

if __name__=='__main__':main()
