"""Verbatim Baseq3 CheckTournament versus MiniLang."""
import json,re,struct,subprocess,sys
from pathlib import Path
from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from toolchain import ROOT,run
def case(gametype=1,playing=2,warmup=-1,time=1000,warmup_cvar=20,cvar_mod=0,level_mod=0,maxclients=4,red=0,blue=0,promote=0):
    return struct.pack('<12i',gametype,playing,warmup,time,warmup_cvar,cvar_mod,level_mod,maxclients,red,blue,promote,0)
def scenarios():
    yield 'no_players',case(playing=0)
    yield 'tournament_waiting',case(playing=1,warmup=99)
    yield 'tournament_promoted',case(playing=1,promote=1)
    yield 'tournament_no_warmup',case(warmup=0)
    yield 'tournament_cvar_changed',case(warmup=5000,cvar_mod=4,level_mod=3)
    yield 'tournament_expired',case(warmup=999,time=1000)
    yield 'ffa_waiting',case(gametype=0,playing=1,warmup=44)
    yield 'ffa_countdown',case(gametype=0,playing=2,warmup=-1)
    yield 'ctf_missing_team',case(gametype=4,playing=2,warmup=50,red=1)
    yield 'ctf_countdown',case(gametype=4,playing=2,warmup=-1,red=1,blue=1)
    yield 'single_player_unchanged',case(gametype=2,warmup=-1)
    yield 'wrapped_countdown',case(gametype=0,playing=2,warmup=-1,time=0x7ffffff0,warmup_cvar=20)
def main():
    out=ROOT/'build/reference/tournament';sources=build(out);subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/tournament_tests.ml','--output','tournament_tests.exe'],check=True)
    bsp=out/'tournament.bsp';bsp.write_bytes(map_bytes());records=[]
    for name,data in scenarios():
        inp=out/(name+'.bin');exp=out/(name+'.expected');inp.write_bytes(data)
        run([out/'spawn_oracle.exe',bsp,inp,exp,'0','--tournament'],out,log=out/(name+'.oracle.log'))
        text=run([ROOT/'build/tournament_tests.exe',bsp,inp,exp,'0'],ROOT/'build',log=out/(name+'.test.log'));m=re.search(r'(\d+) exact CheckTournament words',text);assert m,text
        records.append(dict(name=name,exact_words=int(m[1]),bytes=exp.stat().st_size,inputs_sha256=sha(inp),expected_sha256=sha(exp)));print(f'{name}: PASS {m[1]} exact words')
    contract=run([ROOT/'build/tournament_tests.exe',bsp,out/'no_players.bin',out/'no_players.expected','--contracts'],ROOT/'build',log=out/'contracts.log').strip();print(contract)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(x['exact_words'] for x in records),output_bytes=sum(x['bytes'] for x in records),runtime_contracts=3,test_sha256=sha(ROOT/'build/tournament_tests.exe'),oracle_sha256=sha(out/'spawn_oracle.exe'),scope='Verbatim Baseq3 CheckTournament and TeamCount: tournament promotion/wait/countdown/restart, FFA/team readiness, warmup Cvar changes, configstrings, logs and 32-bit time boundaries. This isolated suite retains a promotion override; the default now executes ported AddTournamentPlayer, compared with actual team/spawn/rank integration in test_follow_tournament.py. Console delivery remains an engine boundary.',original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
if __name__=='__main__':main()
