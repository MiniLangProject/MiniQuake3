"""Verbatim Baseq3 ClientEndFrame and helpers versus MiniLang."""
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
from toolchain import ROOT,run

SCENARIOS=[
    "normal_powerup_expiry","directional_damage_matrix","world_damage_clamp_godmode","dead_damage_deferred",
    "noclip_air_reset","drowning_gurp_damage","lava_slime_damage","battlesuit_sizzle",
    "pending_predictable_event","smooth_client_extrapolation","intermission_early_return",
    "spectator_direct_follow","spectator_team_follow","spectator_invalid_follow",
    "spectator_scoreboard","spectator_free","spectator_dedicated_camera"
]

def prelude(data):
    offset=0;events=[]
    while struct.unpack_from("<I",data,offset)[0]!=81:
        kind=struct.unpack_from("<I",data,offset)[0]
        if kind==1:
            _,index=struct.unpack_from("<2i",data,offset);offset+=8
            strings=[]
            for _ in range(2):
                size=struct.unpack_from("<i",data,offset)[0];offset+=4
                strings.append(data[offset:offset+size].decode());offset+=size
            events.append(("configstring",index,*strings))
        elif kind==80:
            sub=struct.unpack_from("<i",data,offset+4)[0]
            count=5 if sub==3 else 3
            row=struct.unpack_from("<"+str(count)+"i",data,offset);offset+=count*4
            events.append(tuple(row[1:]))
        else:
            raise RuntimeError(f"Unknown ClientEndFrame record {kind} at {offset}")
    return events

def main():
    parser=argparse.ArgumentParser();parser.add_argument("--case");parser.add_argument("--reuse-build",action="store_true");args=parser.parse_args()
    output=ROOT/"build/reference/client_frame";sources=build(output)
    if not args.reuse_build:
        subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/client_frame_tests.ml","--output","client_frame_tests.exe"],check=True)
    mapfile=output/"client_frame.bsp";mapfile.write_bytes(map_bytes());records=[]
    for scenario,name in enumerate(SCENARIOS):
        if args.case and args.case!=name:continue
        inputs=output/(name+".bin");expected=output/(name+".expected")
        values=range(100,356) if name=="directional_damage_matrix" else [scenario]
        inputs.write_bytes(struct.pack("<"+str(len(values))+"i",*values))
        run([output/"spawn_oracle.exe",mapfile,inputs,expected,"0","--client-frame"],output,log=output/(name+".oracle.log"))
        result=run([ROOT/"build/client_frame_tests.exe",mapfile,inputs,expected,"0"],ROOT/"build",log=output/(name+".test.log"))
        match=re.search(r"(\d+) exact ClientEndFrame words",result);assert match,result
        sequence=prelude(expected.read_bytes());records.append(dict(name=name,exact_words=int(match[1]),bytes=expected.stat().st_size,
            events=sequence,inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f"{name}: PASS {match[1]} exact words / {len(sequence)} ordered effects",flush=True)
    if not records:raise RuntimeError("No matching ClientEndFrame scenario")
    contracts=run([ROOT/"build/client_frame_tests.exe",mapfile,records and output/(SCENARIOS[0]+".bin"),output/(SCENARIOS[0]+".expected"),"--contracts"],
                  ROOT/"build",log=output/"contracts.log").strip();print(contracts)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(r["exact_words"] for r in records),
        output_bytes=sum(r["bytes"] for r in records),ordered_effects=sum(len(r["events"]) for r in records),runtime_contracts=2,
        test_sha256=sha(ROOT/"build/client_frame_tests.exe"),oracle_sha256=sha(output/"spawn_oracle.exe"),map_sha256=sha(mapfile),
        scope="Verbatim Baseq3 ClientEndFrame, SpectatorClientEndFrame, P_WorldEffects, P_DamageFeedback, G_SetClientSound and SendPendingPredictableEvents. Covers powerup expiry, damage direction/clamp/debounce, drowning, lava/slime, Battlesuit, noclip, interpolation/extrapolation, intermission, predictable event entities and spectator follow/scoreboard/loss. The isolated suite observes ClientBegin when an invalid explicit follow target is released; the normal port binds the separately verified ClientBegin implementation.",
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (output/"result.json").write_text(json.dumps(result,indent=2)+"\n",encoding="utf-8")

if __name__=="__main__":main()
