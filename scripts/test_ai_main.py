"""Verify the complete native code/game/ai_main.c ownership adapter."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run

SYMBOLS = [
    "AngleDifference", "BotAI", "BotAILoadMap", "BotAIRegularUpdate", "BotAISetup",
    "BotAISetupClient", "BotAIShutdown", "BotAIShutdownClient", "BotAIStartFrame",
    "BotAI_BotInitialChat", "BotAI_GetClientState", "BotAI_GetEntityState",
    "BotAI_GetSnapshotEntity", "BotAI_Print", "BotAI_Trace", "BotChangeViewAngle",
    "BotChangeViewAngles", "BotEntityInfo", "BotInitLibrary", "BotInputToUserCommand",
    "BotInterbreedBots", "BotInterbreedEndMatch", "BotInterbreeding", "BotReadSessionData",
    "BotReportStatus", "BotResetState", "BotScheduleBotThink", "BotSetInfoConfigString",
    "BotTeamLeader", "BotTeamplayReport", "BotTestAAS", "BotUpdateInfoConfigStrings",
    "BotUpdateInput", "BotWriteInterbreeded", "BotWriteSessionData", "NumBots",
    "RemoveColorEscapeSequences",
]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    out = ROOT / "build/reference/ai_main"
    out.mkdir(parents=True, exist_ok=True)
    module = ROOT / "src/mq3/game/ai_main.ml"
    text = module.read_text(encoding="utf-8-sig")
    missing = [s for s in SYMBOLS if not re.search(rf"(?m)^function\s+{re.escape(s)}\s*\(", text)]
    if missing:
        raise RuntimeError(f"missing ai_main symbols: {missing}")
    original = ROOT / "Quake-III-Arena-original-source/code/game/ai_main.c"
    original_text = original.read_text(encoding="latin-1")
    absent = [s for s in SYMBOLS if not re.search(rf"\b{re.escape(s)}\s*\(", original_text)]
    if absent:
        raise RuntimeError(f"ledger candidates absent in original: {absent}")

    source = ROOT / "tests/reference/ai_main_oracle.c"
    oracle = out / "ai_main_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", source,
         f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x64"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log").strip()
    if native != "PASS: 15 unchanged-C ai_main observations":
        raise RuntimeError(native)

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/ai_main_contracts.ml", "--output", "ai_main_contracts.exe"],
                   cwd=ROOT, check=True)
    mini = run([ROOT / "build/ai_main_contracts.exe"], ROOT, log=out / "contracts.log").strip()
    if mini != "PASS: 19 ai_main native adapter contracts":
        raise RuntimeError(mini)

    pak = args.data_root / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"retail pak missing: {pak}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/ai_main_retail_probe.ml", "--output", "ai_main_retail_probe.exe"],
                   cwd=ROOT, check=True)
    retail = run([ROOT / "build/ai_main_retail_probe.exe", pak], ROOT,
                 log=out / "retail.log").strip()
    if not retail.startswith("PASS: 5 ai_main retail-backed contracts bytes="):
        raise RuntimeError(retail)

    files = [original, module, source, ROOT / "tests/ai_main_contracts.ml",
             ROOT / "tests/ai_main_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "symbol_names": SYMBOLS,
        "native": native,
        "minilang": mini,
        "retail": retail,
        "scope": "All 37 ai_main.c ledger candidates through one native adapter: botlib host boundaries, client/entity/snapshot sync, lifecycle, client resources, command AI, frame cadence, input/usercmd conversion, interbreeding, AAS diagnostics, status/configstrings and session persistence.",
        "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 37/37 ai_main symbols + unchanged-C oracle + 19 native contracts + 5 retail contracts")

if __name__ == "__main__":
    main()
