#!/usr/bin/env python3
"""Unchanged Baseq3 UI gameinfo decisions, native contracts and Retail metadata."""
import argparse
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "UI_Alloc", "UI_CanShowTierVideo", "UI_GetArenaInfoByMap", "UI_GetArenaInfoByNumber",
    "UI_GetAwardLevel", "UI_GetBestScore", "UI_GetBotInfoByName", "UI_GetBotInfoByNumber",
    "UI_GetCurrentGame", "UI_GetNumArenas", "UI_GetNumBots", "UI_GetNumSPArenas",
    "UI_GetNumSPTiers", "UI_GetSpecialArenaInfo", "UI_InitGameinfo", "UI_InitMemory",
    "UI_LoadArenas", "UI_LoadArenasFromFile", "UI_LoadBots", "UI_LoadBotsFromFile",
    "UI_LogAwardData", "UI_NewGame", "UI_ParseInfos", "UI_SPUnlockMedals_f", "UI_SPUnlock_f",
    "UI_SetBestScore", "UI_ShowTierVideo", "UI_TierCompleted",
]

ORACLE_FUNCTIONS = [
    "UI_Alloc", "UI_InitMemory", "UI_GetArenaInfoByNumber", "UI_GetArenaInfoByMap",
    "UI_GetSpecialArenaInfo", "UI_GetBotInfoByNumber", "UI_GetBotInfoByName", "UI_GetBestScore",
    "UI_SetBestScore", "UI_LogAwardData", "UI_GetAwardLevel", "UI_TierCompleted",
    "UI_ShowTierVideo", "UI_CanShowTierVideo", "UI_GetCurrentGame", "UI_NewGame",
    "UI_GetNumArenas", "UI_GetNumSPArenas", "UI_GetNumSPTiers", "UI_GetNumBots",
    "UI_SPUnlock_f", "UI_SPUnlockMedals_f", "UI_InitGameinfo",
]


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def pak0(root: Path) -> Path:
    direct = root / "pak0.pk3"
    nested = root / "baseq3/pak0.pk3"
    if direct.is_file():
        return direct
    if nested.is_file():
        return nested
    raise FileNotFoundError(f"pak0.pk3 not found below {root}")


def main() -> int:
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument("--data-root", type=Path)
    args = args_parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_gameinfo.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        if name not in text:
            raise RuntimeError(f"missing original gameinfo function {name}")

    out = ROOT / "build/reference/ui_gameinfo"
    out.mkdir(parents=True, exist_ok=True)
    include = out / "ui_gameinfo_under_test.inc"
    include.write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/ui_gameinfo_oracle.c"
    native_exe = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/W3", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness,
         f"/Fe:{native_exe}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native_exe], out, log=out / "native.log")
    mini_exe = build("tests/ui_gameinfo_oracle.ml", "ui_gameinfo_oracle.exe")
    actual = run([mini_exe], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"UI gameinfo differential mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}")
    contracts_exe = build("tests/ui_gameinfo_contracts.ml", "ui_gameinfo_contracts.exe")
    contracts = run([contracts_exe], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 42 UI gameinfo contracts":
        raise RuntimeError(contracts)

    retail = None
    if args.data_root:
        retail_exe = build("tests/ui_gameinfo_retail_probe.ml", "ui_gameinfo_retail_probe.exe")
        retail = run([retail_exe, pak0(args.data_root.resolve())], ROOT / "build", log=out / "retail.log").strip()
        expected_retail = "PASS: 7 retail arena/bot contracts arenas=30 bots=32"
        if retail != expected_retail:
            raise RuntimeError(retail)

    files = [source, harness, ROOT / "src/mq3/client/ui_gameinfo.ml", ROOT / "tests/ui_gameinfo_oracle.ml",
             ROOT / "tests/ui_gameinfo_contracts.ml", ROOT / "tests/ui_gameinfo_retail_probe.ml"]
    result = {
        "passed": True,
        "differential_records": 17,
        "contracts": 42,
        "retail_contracts": 7 if retail else 0,
        "functions": FUNCTIONS,
        "scope": "Complete q3_ui gameinfo memory and info parsing, arena/bot loading and numbering, case-insensitive lookups, gametype bits, persistent SP scores/awards/videos, tier progression, unlock commands and demo-state initialization.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print("PASS: 17 unchanged C UI gameinfo records + 42 contracts / 28 original functions")
    if retail:
        print(retail)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
