#!/usr/bin/env python3
"""Complete be_ai_chat.c symbol, differential, lifecycle and retail gate."""
import argparse
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from toolchain import ROOT, msvc_env, run

SYMBOLS = (
    "AllocConsoleMessage BotAllocChatState BotChatLength BotChatStateFromHandle "
    "BotCheckChatMessageIntegrety BotCheckInitialChatIntegrety BotCheckReplyChatIntegrety "
    "BotCheckValidReplyChatKeySet BotChooseInitialChatMessage BotConstructChatMessage "
    "BotDumpInitialChat BotDumpMatchTemplates BotDumpRandomStringList BotDumpReplyChat "
    "BotDumpSynonymList BotEnterChat BotExpandChatMessage BotFindMatch BotFindStringInList "
    "BotFreeChatFile BotFreeChatState BotFreeMatchPieces BotFreeMatchTemplates BotFreeReplyChat "
    "BotGetChatMessage BotInitialChat BotLoadChatFile BotLoadChatMessage BotLoadInitialChat "
    "BotLoadMatchPieces BotLoadMatchTemplates BotLoadRandomStrings BotLoadReplyChat BotLoadSynonyms "
    "BotMatchVariable BotNextConsoleMessage BotNumConsoleMessages BotNumInitialChats "
    "BotPrintReplyChatKeys BotQueueConsoleMessage BotRemoveConsoleMessage BotRemoveTildes "
    "BotReplaceReplySynonyms BotReplaceSynonyms BotReplaceWeightedSynonyms BotReplyChat "
    "BotResetChatAI BotSetChatGender BotSetChatName BotSetupChatAI BotShutdownChatAI "
    "FreeConsoleMessage InitConsoleMessageHeap IsWhiteSpace RandomString StringContains "
    "StringContainsWord StringReplaceWords StringsMatch UnifyWhiteSpaces"
).split()


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def lower_first(name: str) -> str:
    return name[0].lower() + name[1:]


def find_pak(data_root: Path | None, pak: Path | None) -> Path | None:
    if pak:
        return pak.resolve()
    if not data_root:
        return None
    for candidate in (data_root / "baseq3/pak0.pk3", data_root / "pak0.pk3"):
        if candidate.is_file():
            return candidate.resolve()
    raise SystemExit(f"FAIL: pak0.pk3 not found below {data_root}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()

    original_path = ROOT / "Quake-III-Arena-original-source/code/botlib/be_ai_chat.c"
    original = original_path.read_text(encoding="latin-1")
    port = (ROOT / "src/mq3/botlib/ai_chat_runtime.ml").read_text(encoding="utf-8")
    missing_original = [s for s in SYMBOLS if not re.search(rf"\b{re.escape(s)}\s*\(", original)]
    missing_port = [s for s in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(lower_first(s))}\s*\(", port)]
    if missing_original or missing_port:
        raise SystemExit(f"FAIL: symbol coverage original={missing_original} port={missing_port}")

    for anchor in (
        "m->time = AAS_Time() + CHATMESSAGE_RECENTTIME;",
        "BotReplaceWeightedSynonyms(outputbuf, mcontext);",
        "EA_Command(cs->client, va(\"say_team %s\", cs->chatmessage));",
        "synonyms = BotLoadSynonyms(file);",
        "matchtemplates = BotLoadMatchTemplates(file);",
        "InitConsoleMessageHeap();",
    ):
        if anchor not in original:
            raise SystemExit("FAIL: original semantic anchor missing: " + anchor)

    out = ROOT / "build/reference/ai_chat_runtime"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "ai_chat_runtime_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", ROOT / "tests/reference/ai_chat_runtime_oracle.c", f"/Fe:{native}", "/link", "/Brepro"],
        out,
        msvc_env("x64"),
        out / "build.log",
    )
    native_result = run([native], out, log=out / "native.log").strip()
    mini_result = run([build("tests/ai_chat_runtime_oracle.ml", "ai_chat_runtime_oracle.exe")], ROOT / "build").strip()
    if native_result != mini_result:
        raise SystemExit("FAIL: unchanged-C differential mismatch\nC:\n" + native_result + "\nMiniLang:\n" + mini_result)

    contracts = run([build("tests/ai_chat_runtime_contracts.ml", "ai_chat_runtime_contracts.exe")], ROOT / "build").strip()
    if contracts != "PASS: 36 complete be_ai_chat runtime contracts":
        raise SystemExit(contracts)

    print(f"PASS: {len(SYMBOLS)} / {len(SYMBOLS)} be_ai_chat symbols")
    print("PASS: 6 unchanged-C differential records")
    print(contracts)

    pak = find_pak(args.data_root, args.pak)
    if pak:
        with zipfile.ZipFile(pak) as archive:
            names = {name.lower() for name in archive.namelist()}
            required = {"botfiles/syn.c", "botfiles/rnd.c", "botfiles/match.c", "botfiles/rchat.c"}
            missing = sorted(required - names)
            chats = sorted(name for name in names if name.startswith("botfiles/") and name.endswith("_t.c"))
            if missing or len(chats) < 20:
                raise SystemExit(f"FAIL: retail bot chat corpus missing={missing} chat_files={len(chats)}")
        retail_specs = (
            ("tests/ai_chat_retail_probe.ml", "ai_chat_runtime_profiles_retail.exe", "PASS: retail Sarge chat checks=8 types="),
            ("tests/ai_chat_strings_retail_probe.ml", "ai_chat_runtime_strings_retail.exe", "PASS: 5 retail synonym checks groups="),
            ("tests/ai_chat_matches_retail_probe.ml", "ai_chat_runtime_matches_retail.exe", "PASS: 5 retail match checks templates="),
            ("tests/ai_chat_output_retail_probe.ml", "ai_chat_runtime_output_retail.exe", "PASS: retail chat-output checks=6 random="),
        )
        observations = []
        for source, executable, prefix in retail_specs:
            value = run([build(source, executable), pak], ROOT / "build").strip()
            if not value.startswith(prefix):
                raise SystemExit(value)
            observations.append(value)
        print(f"PASS: retail pak chat corpus files={len(chats)} parsers=4")
        for value in observations:
            print(value)


if __name__ == "__main__":
    main()
