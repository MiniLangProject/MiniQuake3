"""Direct deterministic parity for Baseq3 G_MoverPush and G_MoverTeam."""
import argparse
import json
import re
import struct
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from test_rejections import tiny_bsp

CASES=['linear_success','rotation_client_yaw','blocked_rollback','mover_stop','team_rollback']
HOST_COUNTS=[(1,1,2,1,0,-1),(1,1,2,1,0,-1),(1,2,2,1,0,-1),(1,1,1,1,0,-1),(2,3,7,2,1,4)]

def build_native(out):
    out.mkdir(parents=True,exist_ok=True)
    code=ROOT/'Quake-III-Arena-original-source/code'
    sources=[ROOT/'tests/reference/mover_push_oracle.c',code/'game/q_math.c',code/'game/q_shared.c',code/'game/bg_misc.c']
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/DWIN32','/DNDEBUG',f'/I{code / "game"}',*sources,
         f'/Fe:{out / "mover_push_oracle.exe"}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    return sources+[code/'game/g_mover.c']

def inspect(path):
    data=path.read_bytes();words=struct.unpack('<'+'i'*(len(data)//4),data);assert words[0]==0x4d505553
    return dict(case=words[1],success=words[2],obstacle=words[3],words=len(words),sha256=sha(path),
                area_calls=words[-6],trace_calls=words[-5],link_calls=words[-4],unlink_calls=words[-3],
                blocked_calls=words[-2],blocked_slot=words[-1])

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    out=ROOT/'build/reference/mover_push';out.mkdir(parents=True,exist_ok=True)
    sources=build_native(out)
    data=bytearray(tiny_bsp());material_off=struct.unpack_from('<i',data,16)[0];struct.pack_into('<i',data,material_off+68,0)
    bsp=out/'empty.bsp';bsp.write_bytes(data)
    if not args.reuse_build:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/reference/mover_push_tests.ml','--output','mover_push_tests.exe'],check=True)
    records=[]
    for case_id,name in enumerate(CASES,1):
        expected=out/(name+'.expected');run([out/'mover_push_oracle.exe',str(case_id),expected],out,log=out/(name+'.oracle.log'))
        result=run([ROOT/'build/mover_push_tests.exe',bsp,str(case_id),expected],ROOT/'build',log=out/(name+'.test.log')).strip()
        match=re.search(r'PASS: (\d+) mover-push words',result);assert match,result
        record=inspect(expected);assert int(match[1])==109
        observed=tuple(record[key] for key in ('area_calls','trace_calls','link_calls','unlink_calls','blocked_calls','blocked_slot'))
        assert observed==HOST_COUNTS[case_id-1],(name,observed,HOST_COUNTS[case_id-1])
        record['name']=name;record['exact_state_words']=109;records.append(record);print(name+': '+result,flush=True)
    result=dict(passed=True,scenario_count=len(records),exact_words=sum(r['exact_state_words'] for r in records),oracle_words=sum(r['words'] for r in records),scenarios=records,
                scope='Unchanged Baseq3 G_MoverPush/G_MoverTeam against MiniLang for linear and angular pushes, client yaw, rollback, EF_MOVER_STOP and two-part team rollback.',
                original_sources={p.relative_to(ROOT).as_posix():sha(p) for p in sources},
                callback_proof={name:list(HOST_COUNTS[index]) for index,name in enumerate(CASES)},bsp_sha256=sha(bsp),
                tests={p.relative_to(ROOT).as_posix():sha(p) for p in (ROOT/'scripts/test_mover_push.py',ROOT/'tests/reference/mover_push_tests.ml')},
                oracle_sha256=sha(out/'mover_push_oracle.exe'),test_sha256=sha(ROOT/'build/mover_push_tests.exe'))
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(records)} mover-push scenarios / {result['exact_words']} exact words")

if __name__=='__main__':main()
