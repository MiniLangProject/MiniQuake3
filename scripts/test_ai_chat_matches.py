#!/usr/bin/env python3
"""Run Baseq3 match C oracle, MiniLang/QVM contracts and optional pak0 probe."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, msvc_env, run

def build(source, output):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output

def main():
    parser=argparse.ArgumentParser();parser.add_argument("--pak",type=Path);args=parser.parse_args()
    out=ROOT/"build/reference/ai_chat_matches";out.mkdir(parents=True,exist_ok=True);native=out/"ai_chat_match_oracle.exe"
    run(["cl","/nologo","/O2","/MT","/W4",ROOT/"tests/reference/ai_chat_match_oracle.c",f"/Fe:{native}","/link","/Brepro"],out,msvc_env("x64"),out/"oracle-build.log")
    oracle=run([native],out,log=out/"oracle.log").strip();expected="PASS: 5 native Baseq3 chat-match scenarios / 11 exact observations"
    if oracle!=expected: raise RuntimeError(oracle)
    contracts=run([build("tests/ai_chat_match_contracts.ml","ai_chat_match_contracts.exe")],ROOT).strip()
    if contracts!="PASS: 12 AI chat-match contracts": raise RuntimeError(contracts)
    print(oracle);print(contracts)
    if args.pak:
        retail=run([build("tests/ai_chat_matches_retail_probe.ml","ai_chat_matches_retail_probe.exe"),args.pak],ROOT).strip()
        if not retail.startswith("PASS: 5 retail match checks templates="): raise RuntimeError(retail)
        print(retail)
if __name__=="__main__": main()
