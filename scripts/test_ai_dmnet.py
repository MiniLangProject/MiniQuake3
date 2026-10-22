"""Verify the complete native code/game/ai_dmnet.c adapter."""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


SYMBOLS = [
    "AIEnter_Battle_Chase", "AIEnter_Battle_Fight", "AIEnter_Battle_NBG",
    "AIEnter_Battle_Retreat", "AIEnter_Battle_SuicidalFight", "AIEnter_Intermission",
    "AIEnter_Observer", "AIEnter_Respawn", "AIEnter_Seek_ActivateEntity",
    "AIEnter_Seek_LTG", "AIEnter_Seek_NBG", "AIEnter_Stand", "AINode_Battle_Chase",
    "AINode_Battle_Fight", "AINode_Battle_NBG", "AINode_Battle_Retreat",
    "AINode_Intermission", "AINode_Observer", "AINode_Respawn",
    "AINode_Seek_ActivateEntity", "AINode_Seek_LTG", "AINode_Seek_NBG", "AINode_Stand",
    "BotClearPath", "BotDumpNodeSwitches", "BotGetAirGoal", "BotGetItemLongTermGoal",
    "BotGetLongTermGoal", "BotGoForAir", "BotLongTermGoal", "BotNearbyGoal",
    "BotReachedGoal", "BotRecordNodeSwitch", "BotResetNodeSwitches", "BotSelectActivateWeapon",
]


def build_ml(source: str, output: str) -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    out = ROOT / "build/reference/ai_dmnet"
    out.mkdir(parents=True, exist_ok=True)

    original = ROOT / "Quake-III-Arena-original-source/code/game/ai_dmnet.c"
    module = ROOT / "src/mq3/game/ai_dmnet.ml"
    original_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8-sig")
    absent = [name for name in SYMBOLS if not re.search(rf"\b{re.escape(name)}\s*\(", original_text)]
    missing = [name for name in SYMBOLS if not re.search(rf"(?m)^function\s+{re.escape(name)}\s*\(", module_text)]
    if absent or missing:
        raise RuntimeError(f"symbol mismatch original={absent} minilang={missing}")
    for anchor in ("gametype == GT_1FCTF", "gametype == GT_OBELISK", "gametype == GT_HARVESTER", "INVENTORY_CHAINGUN", "INVENTORY_NAILGUN"):
        if anchor not in original_text:
            raise RuntimeError(f"missing Missionpack source anchor: {anchor}")

    oracle_source = ROOT / "tests/reference/ai_dmnet_oracle.c"
    oracle_exe = out / "ai_dmnet_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", oracle_source, f"/Fe:{oracle_exe}", "/link", "/Brepro"],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    oracle = run([oracle_exe], out, log=out / "oracle.log").strip()
    if oracle != "PASS: 10 unchanged-C ai_dmnet observations":
        raise RuntimeError(oracle)

    build_ml("tests/ai_dmnet_contracts.ml", "ai_dmnet_contracts.exe")
    native = run([ROOT / "build/ai_dmnet_contracts.exe"], ROOT, log=out / "contracts.log").strip()
    if native != "PASS: 27 ai_dmnet native contracts":
        raise RuntimeError(native)

    build_ml("tests/ai_dmnet_retail_probe.ml", "ai_dmnet_retail_probe.exe")
    pak = args.data_root / "baseq3/pak0.pk3"
    retail = run([ROOT / "build/ai_dmnet_retail_probe.exe", pak], ROOT, log=out / "retail.log").strip()
    if not retail.startswith("PASS: 5 retail ai_dmnet probes"):
        raise RuntimeError(retail)

    files = [
        module,
        ROOT / "src/mq3/game/bot_fight_state.ml",
        ROOT / "src/mq3/game/bot_seek_state.ml",
        ROOT / "src/mq3/game/bot_lifecycle.ml",
        oracle_source,
        ROOT / "tests/ai_dmnet_contracts.ml",
        ROOT / "tests/ai_dmnet_retail_probe.ml",
    ]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "oracle": oracle,
        "native": native,
        "retail": retail,
        "scope": "All ai_dmnet.c functions through the existing native navigation/fight/seek nodes, including Missionpack 1FCTF, Obelisk and Harvester long-term-goal branches.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in [original, *files]},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 35/35 ai_dmnet symbols + 10 C + 27 native + 5 retail contracts")


if __name__ == "__main__":
    main()
