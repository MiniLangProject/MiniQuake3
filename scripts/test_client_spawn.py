"""Verbatim Baseq3 ClientSpawn orchestration versus MiniLang."""
import argparse
import json
import re
import struct
import subprocess
import sys
from pathlib import Path
from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_combat import bits
from toolchain import ROOT,run

def i32(value):
    value=int(value)&0xffffffff
    return value-0x100000000 if value>=0x80000000 else value

def case(scenario=0,gametype=0,team=0,bot=0,local=0,initial=1,teamstate=0,intermission=0,
         time=2345,inactivity=17,handicap=75,psflags=0x84004,entflags=0x123456,ping=44,eventseq=5,
         persistent=1000,angles=(100,200,300),weapon=9,hits=12,shots=34,origin=(10.,20.,30.),userinfo=None):
    row=[scenario,gametype,team,bot,local,initial,teamstate,intermission,time,inactivity,handicap,
         psflags,entflags,ping,eventseq,persistent,*angles,weapon,hits,shots,*map(bits,origin)]
    row += [0]*(32-len(row)); extra=b''
    if userinfo is not None:extra=userinfo.encode('utf-8');row[28]=len(extra)+1
    return struct.pack('<32i',*map(i32,row))+extra

def scenarios():
    yield 'ffa_regular',case()
    yield 'userinfo_mixed_case_first_duplicate',case(userinfo='\\HaNdIcAp\\25\\handicap\\90')
    yield 'userinfo_no_leading_delimiter',case(userinfo='HaNdIcAp\\45')
    yield 'userinfo_truncates_before_handicap',case(userinfo='\\padding\\'+'x'*1014+'\\handicap\\1')
    yield 'userinfo_truncated_handicap_digits',case(userinfo='\\pad\\'+'x'*1007+'\\handicap\\75')
    yield 'local_initial',case(local=1,initial=0,origin=(900.,0.,64.))
    yield 'human_initial_filter_retry',case(scenario=1,local=1,initial=0,origin=(900.,0.,64.))
    yield 'bot_initial_filter_retry',case(scenario=2,bot=1,local=1,initial=0,origin=(900.,0.,64.))
    yield 'occupied_fallback_and_killbox',case(scenario=3,local=0,initial=1,origin=(10.,20.,30.))
    yield 'team_machinegun_ammo',case(gametype=3,team=1,origin=(10.,20.,30.))
    yield 'ctf_red_begin',case(gametype=4,team=1,teamstate=0)
    yield 'ctf_red_active',case(gametype=4,team=1,teamstate=1)
    yield 'ctf_blue_begin',case(gametype=4,team=2,teamstate=0)
    yield 'ctf_blue_active',case(gametype=4,team=2,teamstate=1)
    yield 'spectator_intermission_spot',case(team=3)
    yield 'active_intermission_callback',case(intermission=6789)
    yield 'handicap_zero_defaults',case(handicap=0)
    yield 'handicap_above_range_defaults',case(handicap=101)
    yield 'handicap_negative_defaults',case(handicap=-20)
    yield 'teleport_vote_flags_and_wrap',case(psflags=0x84004|0x200|0x10000000,persistent=0x7ffffffa,eventseq=0x7fffffff,time=0x7ffffff0,inactivity=9)
    yield 'negative_angles_and_times',case(time=-2000,inactivity=-3,angles=(-2147483648,-1,65537),origin=(-0.,-123.5,0.125),ping=-7,eventseq=-9,persistent=-50)

def events(data):
    offset=0;result=[]
    while struct.unpack_from('<i',data,offset)[0]==60:
        _,kind,slot=struct.unpack_from('<3i',data,offset);result.append((kind,slot));offset+=12
    assert struct.unpack_from('<i',data,offset)[0]==70
    return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/client_spawn';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_spawn_tests.ml','--output','client_spawn_tests.exe'],check=True)
    mapfile=output/'client_spawn.bsp';mapfile.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        if args.case and args.case!=name:continue
        inputs=output/(name+'.bin');expected=output/(name+'.expected');inputs.write_bytes(data)
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--client-spawn'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/client_spawn_tests.exe',mapfile,inputs,expected,'0'],ROOT/'build',log=output/(name+'.test.log'))
        match=re.search(r'(\d+) exact ClientSpawn words',result);assert match,result
        sequence=events(expected.read_bytes());records.append(dict(name=name,exact_words=int(match[1]),bytes=expected.stat().st_size,events=sequence,
            inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {match[1]} exact words / {len(sequence)} ordered boundaries',flush=True)
    if not records:raise RuntimeError('No matching ClientSpawn scenario')
    contracts=run([ROOT/'build/client_spawn_tests.exe',mapfile,records and output/(records[0]['name']+'.bin'),output/(records[0]['name']+'.expected'),'--contracts'],ROOT/'build',log=output/'contracts.log').strip();print(contracts)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(r['exact_words'] for r in records),
        output_bytes=sum(r['bytes'] for r in records),ordered_boundary_events=sum(len(r['events']) for r in records),runtime_contracts=8,
        test_sha256=sha(ROOT/'build/client_spawn_tests.exe'),oracle_sha256=sha(output/'spawn_oracle.exe'),map_sha256=sha(mapfile),
        scope='Verbatim Baseq3 ClientSpawn selection and orchestration: persistent/session preservation, transient reset, handicap, spawn filters, CTF/spectator/intermission placement, initial inventory, KillBox/link order, target activation, weapon selection and playerState-to-entityState snapshots. ClientThink, ClientEndFrame, userinfo/usercmd delivery and intermission movement are deterministic observed host boundaries.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
