#!/usr/bin/env python3
"""Run native and MiniLang contracts for late Botlib chat/goal traps."""
import subprocess
import sys
from toolchain import ROOT, msvc_env, run

def main():
    out=ROOT/"build/reference/ai_chat_goal_tail";out.mkdir(parents=True,exist_ok=True);native=out/"ai_chat_goal_tail_oracle.exe"
    run(["cl","/nologo","/O2","/MT","/W4",ROOT/"tests/reference/ai_chat_goal_tail_oracle.c",f"/Fe:{native}","/link","/Brepro"],out,msvc_env("x64"),out/"oracle-build.log")
    oracle=run([native],out,log=out/"oracle.log").strip();expected="PASS: 4 native Baseq3 chat/goal-tail scenarios / 9 exact observations"
    if oracle!=expected: raise RuntimeError(oracle)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/ai_chat_goal_tail_contracts.ml","--output","ai_chat_goal_tail_contracts.exe"],cwd=ROOT,check=True)
    contracts=run([ROOT/"build/ai_chat_goal_tail_contracts.exe"],ROOT).strip()
    if contracts!="PASS: 13 AI chat/goal tail contracts": raise RuntimeError(contracts)
    print(oracle);print(contracts)
if __name__=="__main__": main()
