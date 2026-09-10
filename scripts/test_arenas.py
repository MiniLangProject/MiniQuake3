"""Direct deterministic parity for Baseq3 postgame and victory podium code."""
import json
import re
import struct
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from test_rejections import tiny_bsp

CASES=['active_postgame','spectator_postgame','spawn_podium','placement_celebration','abort_guard']

def build_native(out):
    code=ROOT/'Quake-III-Arena-original-source/code'
    sources=[ROOT/'tests/reference/arenas_oracle.c',code/'game/q_math.c',code/'game/q_shared.c',code/'game/bg_misc.c']
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/DWIN32','/DNDEBUG',f'/I{code / "game"}',*sources,
         f'/Fe:{out / "arenas_oracle.exe"}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    return sources+[code/'game/g_arenas.c']

def main():
    out=ROOT/'build/reference/arenas';out.mkdir(parents=True,exist_ok=True)
    sources=build_native(out);bsp=out/'empty.bsp';bsp.write_bytes(tiny_bsp())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/reference/arenas_tests.ml','--output','arenas_tests.exe'],check=True)
    records=[]
    for case_id,name in enumerate(CASES,1):
        expected=out/(name+'.expected');run([out/'arenas_oracle.exe',str(case_id),expected],out,log=out/(name+'.oracle.log'))
        result=run([ROOT/'build/arenas_tests.exe',bsp,str(case_id),expected],ROOT/'build',log=out/(name+'.test.log')).strip()
        match=re.search(r'PASS: (\d+) arena words',result);assert match,result
        data=expected.read_bytes();words=struct.unpack('<'+'i'*(len(data)//4),data)
        assert words[0]==0x4152454e and words[1]==case_id and int(match[1])==len(words)
        records.append(dict(name=name,exact_words=len(words),sha256=sha(expected)))
        print(name+': '+result,flush=True)
    result=dict(passed=True,scenario_count=len(records),exact_words=sum(r['exact_words'] for r in records),scenarios=records,
                scope='Unchanged Baseq3 g_arenas.c bodies against MiniLang for active and spectator postgame output, podium entity copies, placement, celebration event/timing and abort gametype guard.',
                original_sources={p.relative_to(ROOT).as_posix():sha(p) for p in sources},bsp_sha256=sha(bsp),
                tests={p.relative_to(ROOT).as_posix():sha(p) for p in (ROOT/'scripts/test_arenas.py',ROOT/'tests/reference/arenas_tests.ml')},
                oracle_sha256=sha(out/'arenas_oracle.exe'),test_sha256=sha(ROOT/'build/arenas_tests.exe'))
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} arena scenarios / {result['exact_words']} exact words")

if __name__=='__main__':main()
