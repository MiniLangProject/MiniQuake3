"""Native g_spawn field/getter/parser parity and malformed spawn contracts."""
import argparse
import json
import re
import random
import struct
import subprocess
import sys
from toolchain import ROOT,run
from inventory import sha
from spawn_oracle import build
from spawn_fixtures import pack,bsp,entity,value_cases

def main():
    p=argparse.ArgumentParser();p.add_argument('--count',type=int,default=4096);args=p.parse_args()
    output=ROOT/'build/reference/spawn_values';sources=build(output);mapfile=output/'fixture.bsp';mapfile.write_bytes(bsp())
    inputs=output/'inputs.bin';inputs.write_bytes(b''.join(map(pack,value_cases(args.count))));expected=output/'expected.bin'
    run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--values'],output,log=output/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--values'],ROOT/'build',log=output/'test.log',timeout=600);print(result.strip())
    match=re.search(r'(\d+) exact words / (\d+) string bytes',result)
    contracts=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,'0','--contracts'],ROOT/'build',log=output/'contracts.log');print(contracts.strip())
    clock=[-2147483648,-1,0,1,999,1000,1001,16777215,16777216,16777217,16777218,16777219,16777220,2147483646,2147483647]
    rng=random.Random(0x5448494e);thoughts=[(a,b,1) for a in clock for b in clock]
    while len(thoughts)<1024:thoughts.append((rng.randrange(-2147483648,2147483648),rng.randrange(-2147483648,2147483648),1))
    think_input=output/'think.bin';think_input.write_bytes(b''.join(struct.pack('<3i',*q) for q in thoughts));think_expected=output/'think.expected'
    run([output/'spawn_oracle.exe',mapfile,think_input,think_expected,'0','--think'],output,log=output/'think.oracle.log')
    print(run([ROOT/'build/spawn_tests.exe',mapfile,think_input,think_expected,'0','--think'],ROOT/'build',log=output/'think.test.log').strip())
    bad_think=output/'think_bad.bin';bad_think.write_bytes(struct.pack('<3i',1000,1000,0))
    c=subprocess.run([str(output/'spawn_oracle.exe'),str(mapfile),str(bad_think),str(output/'think_bad.expected'),'0','--think'],capture_output=True,text=True)
    if c.returncode!=72 or c.stderr!='NULL ent->think':raise RuntimeError('Original missing-think error changed')
    malformed=['bad','{','{ "a"','{ "a" }',entity([(str(i),'v') for i in range(65)]),entity([(str(i),'a'*900) for i in range(5)])]
    for index,text in enumerate(malformed):
        path=output/f'reject_{index}.bin';path.write_bytes(pack(text));target=output/f'reject_{index}.expected'
        c=subprocess.run([str(output/'spawn_oracle.exe'),str(mapfile),str(path),str(target),'0','--values'],capture_output=True,text=True)
        if c.returncode!=72:raise RuntimeError('Original did not reject malformed input '+str(index))
        run([ROOT/'build/spawn_tests.exe',mapfile,path,target,'0','--reject'],ROOT/'build',log=output/f'reject_{index}.log')
    (output/'result.json').write_text(json.dumps({'passed':True,'cases':args.count,'exact_words':int(match[1]),'string_bytes':int(match[2]),'original_rejections':len(malformed),'runtime_contracts':30,
        'think_cases':len(thoughts),'think_exact_words':len(thoughts)*2,'original_missing_think_rejection':True,'think_inputs_sha256':sha(think_input),'think_expected_sha256':sha(think_expected),
        'scope':'all original spawn field types, first-key lookup, last-field assignment, CRT numbers, parser bounds; no spawn class execution',
        'test_sha256':sha(ROOT/'build/spawn_tests.exe'),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected),
        'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}},indent=2)+'\n')
if __name__=='__main__':main()
