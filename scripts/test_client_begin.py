"""Verbatim Baseq3 ClientBegin over the ported spawn and rank lifecycle."""
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
         persistent=1000,angles=(100,200,300),weapon=9,hits=12,shots=34,origin=(10.,20.,30.),linked=0,other=0,userinfo=None):
    row=[scenario,gametype,team,bot,local,initial,teamstate,intermission,time,inactivity,handicap,
         psflags,entflags,ping,eventseq,persistent,*angles,weapon,hits,shots,*map(bits,origin),0,linked,other]
    row += [0]*(32-len(row));extra=b''
    if userinfo is not None:extra=userinfo.encode('utf-8');row[28]=len(extra)+1
    return struct.pack('<32i',*map(i32,row))+extra

def scenarios():
    yield 'ffa_regular',case()
    yield 'userinfo_case_insensitive_handicap',case(userinfo='\\HANDICAP\\35')
    yield 'userinfo_truncated_handicap',case(userinfo='\\pad\\'+'x'*1007+'\\handicap\\75')
    yield 'linked_team_change',case(linked=1,psflags=0x84004|0x10000000)
    yield 'tournament_suppresses_announcement',case(gametype=1)
    yield 'spectator',case(team=3)
    yield 'active_intermission',case(intermission=6789)
    yield 'ctf_blue_begin',case(gametype=4,team=2,teamstate=1)
    yield 'rank_with_other_client',case(other=1)
    yield 'wrapped_time_and_flags',case(psflags=0x84004|0x200|0x10000000,time=0x7ffffff0,inactivity=9)

def events(data):
    offset=0;result=[]
    while True:
        tag=struct.unpack_from('<i',data,offset)[0]
        if tag==70:break
        if tag==60:
            kind=struct.unpack_from('<i',data,offset+4)[0]
            if kind==10:
                size=struct.unpack_from('<i',data,offset+8)[0];result.append((kind,None));offset+=12+max(size,0)
            elif kind==9:
                slot,size=struct.unpack_from('<2i',data,offset+8);result.append((kind,slot));offset+=16+max(size,0)
            else:
                slot=struct.unpack_from('<i',data,offset+8)[0];result.append((kind,slot));offset+=12
        elif tag==1:
            index,n1=struct.unpack_from('<2i',data,offset+4);offset+=12+max(n1,0)
            n2=struct.unpack_from('<i',data,offset)[0];offset+=4+max(n2,0);result.append(('config',index))
        else:raise AssertionError((tag,offset))
    return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--case');parser.add_argument('--reuse-build',action='store_true');args=parser.parse_args()
    output=ROOT/'build/reference/client_begin';sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_begin_tests.ml','--output','client_begin_tests.exe'],check=True)
    mapfile=output/'client_begin.bsp';mapfile.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        if args.case and args.case!=name:continue
        inputs=output/(name+'.bin');expected=output/(name+'.expected');inputs.write_bytes(data)
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--client-begin'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/client_begin_tests.exe',mapfile,inputs,expected,'0'],ROOT/'build',log=output/(name+'.test.log'))
        match=re.search(r'(\d+) exact ClientBegin words',result);assert match,result
        sequence=events(expected.read_bytes());records.append(dict(name=name,exact_words=int(match[1]),bytes=expected.stat().st_size,events=sequence,
            inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {match[1]} exact words / {len(sequence)} ordered boundaries',flush=True)
    if not records:raise RuntimeError('No matching ClientBegin scenario')
    contracts=run([ROOT/'build/client_begin_tests.exe',mapfile,records and output/(records[0]['name']+'.bin'),output/(records[0]['name']+'.expected'),'--contracts'],ROOT/'build',log=output/'contracts.log').strip();print(contracts)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(r['exact_words'] for r in records),
        output_bytes=sum(r['bytes'] for r in records),ordered_boundary_events=sum(len(r['events']) for r in records),runtime_contracts=5,
        test_sha256=sha(ROOT/'build/client_begin_tests.exe'),oracle_sha256=sha(output/'spawn_oracle.exe'),map_sha256=sha(mapfile),
        scope='Verbatim Baseq3 ClientBegin with actual ported ClientSpawn and CalculateRanks: unlink/reinit, persistent client rebinding, playerState reset with eFlags preservation, spawn, entry event and announcement, game log, rankings and tournament/spectator suppression. This isolated suite retains spawn Think/EndFrame/intermission-placement overrides; test_intermission.py compares real placement through ClientBegin. Engine userinfo, usercmd, command and log delivery remain deterministic observed host boundaries.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
