#!/usr/bin/env python3
import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output

def main() -> None:
    parser=argparse.ArgumentParser();parser.add_argument("--pak",type=Path);args=parser.parse_args()
    original=(ROOT/"Quake-III-Arena-original-source/code/botlib/be_ai_chat.c").read_text(encoding="latin-1")
    for anchor in (
        "void BotInitialChat(int chatstate, char *type, int mcontext",
        "m->time = AAS_Time() + CHATMESSAGE_RECENTTIME;",
        "int BotReplyChat(int chatstate, char *message, int mcontext, int vcontext",
        "int bestpriority, num, found, res, numchatmessages, index;",
        "BotReplaceWeightedSynonyms(outputbuf, mcontext);",
        "int BotChatLength(int chatstate)",
        "void BotEnterChat(int chatstate, int clientto, int sendto)",
        "int BotSetupChatAI(void)", "void BotShutdownChatAI(void)",
        'EA_Command(cs->client, va("say_team %s", cs->chatmessage));',
        'EA_Command(cs->client, va("tell %d %s", clientto, cs->chatmessage));',
    ):
        if anchor not in original: raise SystemExit("FAIL: missing original chat anchor: "+anchor)
    server=(ROOT/"Quake-III-Arena-original-source/code/server/sv_game.c").read_text(encoding="latin-1")
    for anchor in (
        "case BOTLIB_AI_INITIAL_CHAT:",
        "BotInitialChat( args[1], VMA(2), args[3], VMA(4), VMA(5), VMA(6), VMA(7), VMA(8), VMA(9), VMA(10), VMA(11) );",
        "case BOTLIB_AI_REPLY_CHAT:",
        "BotReplyChat( args[1], VMA(2), args[3], args[4], VMA(5), VMA(6), VMA(7), VMA(8), VMA(9), VMA(10), VMA(11), VMA(12) );",
        "case BOTLIB_AI_CHAT_LENGTH:", "BotChatLength( args[1] );",
        "case BOTLIB_AI_ENTER_CHAT:", "BotEnterChat( args[1], args[2], args[3] );",
    ):
        if anchor not in server: raise SystemExit("FAIL: missing sv_game.c chat ABI anchor: "+anchor)
    out=ROOT/"build/reference/ai_chat_output";out.mkdir(parents=True,exist_ok=True);native=out/"ai_chat_output_oracle.exe"
    run(["cl","/nologo","/O2","/MT","/W4","/WX",ROOT/"tests/reference/ai_chat_output_oracle.c",f"/Fe:{native}","/link","/Brepro"],out,msvc_env("x64"),out/"build.log")
    result=run([native],out).strip()
    if result!="PASS: 15 native chat-output observations":raise SystemExit(result)
    contract=run([build("tests/ai_chat_output_contracts.ml","ai_chat_output_contracts.exe")],ROOT/"build").strip()
    if contract!="PASS: 21 AI chat-output contracts":raise SystemExit(contract)
    print(result);print(contract)
    if args.pak:
        retail=run([build("tests/ai_chat_output_retail_probe.ml","ai_chat_output_retail_probe.exe"),args.pak.resolve()],ROOT/"build").strip()
        if not retail.startswith("PASS: retail chat-output checks=6 random="):raise SystemExit(retail)
        print(retail)

if __name__=="__main__": main()
