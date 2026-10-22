#!/usr/bin/env python3
"""Complete code/botlib/be_ai_goal.c adapter and retail integration gate."""
import argparse
import re
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run

SYMBOLS = (
    "AddLevelItemToList AllocLevelItem BotAddToAvoidGoals BotAllocGoalState BotAvoidGoalTime "
    "BotChooseLTGItem BotChooseNBGItem BotDumpAvoidGoals BotDumpGoalStack BotEmptyGoalStack "
    "BotFindEntityForLevelItem BotFreeGoalState BotFreeInfoEntities BotFreeItemWeights "
    "BotGetLevelItemGoal BotGetMapLocationGoal BotGetNextCampSpotGoal BotGetSecondGoal BotGetTopGoal "
    "BotGoalName BotGoalStateFromHandle BotInitInfoEntities BotInitLevelItems "
    "BotInterbreedGoalFuzzyLogic BotItemGoalInVisButNotVisible BotLoadItemWeights "
    "BotMutateGoalFuzzyLogic BotPopGoal BotPushGoal BotRemoveFromAvoidGoals BotResetAvoidGoals "
    "BotResetGoalState BotSaveGoalFuzzyLogic BotSetAvoidGoalTime BotSetupGoalAI BotShutdownGoalAI "
    "BotTouchingGoal BotUpdateEntityItems FreeLevelItem InitLevelItemHeap ItemWeightIndex "
    "LoadItemConfig RemoveLevelItemFromList"
).split()


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def lower_first(value: str) -> str:
    return value[0].lower() + value[1:]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    original = (ROOT / "Quake-III-Arena-original-source/code/botlib/be_ai_goal.c").read_text(encoding="latin-1")
    port = (ROOT / "src/mq3/botlib/ai_goal_runtime.ml").read_text(encoding="utf-8")
    missing_original = [s for s in SYMBOLS if not re.search(rf"\b{re.escape(s)}\s*\(", original)]
    missing_port = [s for s in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(lower_first(s))}\s*\(", port)]
    if missing_original or missing_port:
        raise SystemExit(f"FAIL: symbol coverage original={missing_original} port={missing_port}")
    for anchor in (
        "BotAddToAvoidGoals(gs, number, avoidtime);",
        "weight = FuzzyWeight(inventory, gs->itemweightconfig, weightnum);",
        "t = AAS_AreaTravelTimeToGoalArea",
        "BotInitInfoEntities();",
        "itemconfig = LoadItemConfig(filename);",
        "BotFreeGoalState(i);",
    ):
        if anchor not in original:
            raise SystemExit("FAIL: original semantic anchor missing: " + anchor)

    out = ROOT / "build/reference/ai_goal_runtime"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "ai_goal_runtime_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/WX", ROOT / "tests/reference/ai_goal_runtime_oracle.c", f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    native_value = run([native], out).strip()
    mini_value = run([build("tests/ai_goal_runtime_oracle.ml", "ai_goal_runtime_oracle.exe")], ROOT / "build").strip()
    if native_value != mini_value:
        raise SystemExit(f"FAIL: unchanged C differential\nC: {native_value}\nMiniLang: {mini_value}")
    contract = run([build("tests/ai_goal_runtime_contracts.ml", "ai_goal_runtime_contracts.exe")], ROOT / "build").strip()
    if contract != "PASS: 34 complete be_ai_goal runtime contracts":
        raise SystemExit(contract)

    # These gates retain their own unchanged-C oracles and independently test
    # every focused module owned by the facade.
    focused = (
        "test_ai_goal_state.py", "test_ai_goal_selection.py", "test_ai_level_items.py",
        "test_ai_map_goals.py", "test_ai_item_weights.py",
    )
    for script in focused:
        subprocess.run([sys.executable, ROOT / "scripts" / script], cwd=ROOT, check=True, stdout=subprocess.DEVNULL)

    print(f"PASS: {len(SYMBOLS)} / {len(SYMBOLS)} be_ai_goal symbols")
    print("PASS: unchanged-C touch differential records=5")
    print(contract)
    print("PASS: existing goal oracles/gates=5")

    if args.data_root:
        pak = (args.data_root / "baseq3/pak0.pk3").resolve()
        if not pak.is_file():
            raise SystemExit(f"FAIL: retail pak missing: {pak}")
        retail_commands = (
            [sys.executable, ROOT / "scripts/test_ai_item_weights.py", "--pak", pak],
            [sys.executable, ROOT / "scripts/test_ai_map_goals.py", "--pak", pak],
            [sys.executable, ROOT / "scripts/test_jump_pad_items_retail.py", "--data-root", args.data_root.resolve()],
        )
        retail_lines = []
        for command in retail_commands:
            value = subprocess.run(command, cwd=ROOT, check=True, capture_output=True, text=True).stdout.strip().splitlines()
            retail_lines.extend(line for line in value if "retail" in line or "q3dm17 suspended-item" in line)
        print("PASS: retail goal probes item-config/map-BSP/AAS-jumppads=3")
        for line in retail_lines:
            print(line)


if __name__ == "__main__":
    main()
