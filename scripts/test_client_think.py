"""Verbatim Baseq3 ClientThink, G_RunClient and closed helpers versus MiniLang."""
import argparse
import json
import re
import struct
import subprocess
import sys
from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from toolchain import ROOT,run

SCENARIOS=[
    "normal_idle","move_jump_fire","intermission_ready","spectator_follow_cycle","spectator_free_move",
    "disconnected","stale_command","inactivity_warning","inactivity_drop","regen_timer",
    "noclip_haste","forced_gesture","smooth_snapshot","fixed_pmove","pmove_cvar_clamp",
    "dead_wait","clientthink_wrapper","runclient_bot","gauntlet_attack","medkit_event",
    "fall_damage","fall_damage_disabled","fire_event","teleporter_flag_drop","fractional_tuning","spectator_fixed_command","hook_release"
]

def effects(data):
    offset=0;result=[]
    while struct.unpack_from("<I",data,offset)[0]!=91:
        tag,kind=struct.unpack_from("<2I",data,offset);assert tag==90;(start,offset)=(offset,offset+8)
        fixed={0:1,1:1,2:1,3:1,4:1,5:1,6:1,7:1,8:2,9:3,10:0}[kind]
        offset+=fixed*4
        strings=2 if kind==10 else 1 if kind in (4,5) else 0
        for _ in range(strings):
            size=struct.unpack_from("<i",data,offset)[0];offset+=4+size
        result.append((kind,offset-start))
    return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument("--case");parser.add_argument("--reuse-build",action="store_true");args=parser.parse_args()
    output=ROOT/"build/reference/client_think";sources=build(output)
    if not args.reuse_build:
        subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/client_think_tests.ml","--output","client_think_tests.exe"],check=True)
    mapfile=output/"client_think.bsp";mapfile.write_bytes(map_bytes());records=[]
    for scenario,name in enumerate(SCENARIOS):
        if args.case and args.case!=name:continue
        inputs=output/(name+".bin");expected=output/(name+".expected");inputs.write_bytes(struct.pack("<i",scenario))
        run([output/"spawn_oracle.exe",mapfile,inputs,expected,"0","--client-think"],output,log=output/(name+".oracle.log"))
        result=run([ROOT/"build/client_think_tests.exe",mapfile,inputs,expected,"0"],ROOT/"build",log=output/(name+".test.log"))
        match=re.search(r"(\d+) exact ClientThink words",result);assert match,result;sequence=effects(expected.read_bytes())
        records.append(dict(name=name,exact_words=int(match[1]),bytes=expected.stat().st_size,effects=sequence,
                            inputs_sha256=sha(inputs),expected_sha256=sha(expected)))
        print(f"{name}: PASS {match[1]} exact words / {len(sequence)} ordered effects",flush=True)
    if not records:raise RuntimeError("No matching ClientThink scenario")
    first=records[0]["name"]
    contracts=run([ROOT/"build/client_think_tests.exe",mapfile,output/(first+".bin"),output/(first+".expected"),"--contracts"],
                  ROOT/"build",log=output/"contracts.log").strip();print(contracts)
    result=dict(passed=True,scenarios=records,scenario_count=len(records),exact_words=sum(r["exact_words"] for r in records),
        output_bytes=sum(r["bytes"] for r in records),ordered_effects=sum(len(r["effects"]) for r in records),runtime_contracts=3,
        test_sha256=sha(ROOT/"build/client_think_tests.exe"),oracle_sha256=sha(output/"spawn_oracle.exe"),map_sha256=sha(mapfile),
        scope="Verbatim Baseq3 ClientThink_real, ClientThink, G_RunClient, ClientImpacts, SpectatorThink, ClientInactivityTimer, ClientTimerActions, ClientIntermissionThink and ClientEvents. Actual Pmove, dynamic server collision, snapshots, triggers, hook release and medkit state are integrated; engine usercmd, cvar, drop, follow, weapon and AAS calls are ordered observed boundaries.",
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    (output/"result.json").write_text(json.dumps(result,indent=2)+"\n",encoding="utf-8")

if __name__=="__main__":main()
