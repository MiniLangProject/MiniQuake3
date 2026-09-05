"""Verbatim Baseq3 G_RunFrame orchestration versus MiniLang."""
import json,re,struct,subprocess,sys
from pathlib import Path
from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from toolchain import ROOT,run

def case(time=1000,previous=900,framenum=7,restarted=0,maxclients=1,mode=1,think=1050,leveltime=1100):
    return struct.pack('<8i',time,previous,framenum,restarted,maxclients,mode,think,leveltime)

def scenarios():
    yield 'normal',case()
    yield 'restart_early_return',case(restarted=1)
    yield 'empty_frame',case(maxclients=0,mode=0)
    yield 'future_think',case(think=1200)
    yield 'time_wrap',case(time=0x7ffffff0,framenum=0x7fffffff,think=-1,leveltime=-0x7ffffff0)
    yield 'entity_listing',case(mode=2)

def main():
    output=ROOT/'build/reference/full_frame';sources=build(output)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/full_frame_tests.ml','--output','full_frame_tests.exe'],check=True)
    mapfile=output/'full_frame.bsp';mapfile.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        inputs=output/(name+'.bin');expected=output/(name+'.expected');inputs.write_bytes(data)
        run([output/'spawn_oracle.exe',mapfile,inputs,expected,'0','--frame'],output,log=output/(name+'.oracle.log'))
        result=run([ROOT/'build/full_frame_tests.exe',mapfile,inputs,expected,'0'],ROOT/'build',log=output/(name+'.test.log'))
        match=re.search(r'(\d+) exact G_RunFrame words',result);assert match,result
        records.append(dict(name=name,exact_words=int(match[1]),bytes=expected.stat().st_size,inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f'{name}: PASS {match[1]} exact words',flush=True)
    contracts=run([ROOT/'build/full_frame_tests.exe',mapfile,output/'normal.bin',output/'normal.expected','--contracts'],ROOT/'build',log=output/'contracts.log').strip();print(contracts)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(r['exact_words'] for r in records),output_bytes=sum(r['bytes'] for r in records),runtime_contracts=3,
        test_sha256=sha(ROOT/'build/full_frame_tests.exe'),oracle_sha256=sha(output/'spawn_oracle.exe'),map_sha256=sha(mapfile),
        scope='Verbatim Baseq3 G_RunFrame ordering: restart guard, frame/time update, Cvar refresh, allocated entities, client end frames, actual CheckTournament and CheckExitRules, team status, votes, CheckCvars and entity-list reset. Unported team/vote/Cvar maintenance and entity class dispatch are ordered observed boundaries.',
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')

if __name__=='__main__':main()
