#!/usr/bin/env python3
"""Complete ownership and unchanged-C differential gate for Baseq3 AI headers."""
import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


HEADERS = ["ai_chat.h", "ai_cmd.h", "ai_dmnet.h", "ai_dmq3.h", "ai_main.h", "ai_team.h", "ai_vcmd.h"]


def build(source, output):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def exported_list(text, function):
    match = re.search(r"function\s+" + re.escape(function) + r"\(\)\s+return\s+\[(.*?)\]\s+end function", text, re.S)
    if not match:
        raise RuntimeError(f"missing {function} inventory")
    return re.findall(r'"([A-Za-z_][A-Za-z0-9_]*)"', match.group(1))


def main():
    source_root = ROOT / "Quake-III-Arena-original-source/code/game"
    facade = ROOT / "src/mq3/game/bot_ai_headers.ml"
    facade_text = facade.read_text(encoding="utf-8")
    source_text = "\n".join((source_root / name).read_text(encoding="latin1") for name in HEADERS)
    inventories = {
        "constants": exported_list(facade_text, "constantNames"),
        "types": exported_list(facade_text, "typeNames"),
        "waypoint_fields": exported_list(facade_text, "waypointFieldNames"),
        "activate_goal_fields": exported_list(facade_text, "activateGoalFieldNames"),
        "bot_state_fields": exported_list(facade_text, "botStateFieldNames"),
        "declarations": exported_list(facade_text, "declarationNames"),
        "globals": exported_list(facade_text, "globalNames"),
    }
    expected_counts = {
        "constants": 55, "types": 3, "waypoint_fields": 5,
        "activate_goal_fields": 13, "bot_state_fields": 145,
        "declarations": 135, "globals": 16,
    }
    actual_counts = {key: len(value) for key, value in inventories.items()}
    if actual_counts != expected_counts:
        raise RuntimeError(f"AI header inventory drift: {actual_counts}")
    missing = [name for values in inventories.values() for name in values
               if not re.search(r"\b" + re.escape(name) + r"\b", source_text)]
    if missing:
        raise RuntimeError(f"facade names absent from original headers: {missing}")

    # Guard the four values that had drifted in productive game logic.
    required = {
        "BFL_STRAFERIGHT": "1", "PATROL_BACK": "4",
        "TEAMTP_DEFENDER": "1", "TEAMTP_ATTACKER": "2",
    }
    for name, value in required.items():
        if not re.search(r"^const\s+" + name + r"=" + value + r"$", facade_text, re.M):
            raise RuntimeError(f"wrong canonical value for {name}")
    productive = {
        "src/mq3/game/bot_combat_ai.ml": ["BFL_STRAFERIGHT"],
        "src/mq3/game/bot_navigation.ml": ["PATROL_BACK"],
        "src/mq3/game/ai_team.ml": ["TEAMTP_DEFENDER", "TEAMTP_ATTACKER"],
        "src/mq3/game/bot_team_helpers.ml": ["TEAMTP_DEFENDER", "TEAMTP_ATTACKER"],
    }
    for relative, names in productive.items():
        text = (ROOT / relative).read_text(encoding="utf-8")
        for name in names:
            if not re.search(r"^const\s+" + name + r"=aiheaders\." + name + r"$", text, re.M):
                raise RuntimeError(f"{relative} does not consume canonical {name}")

    out = ROOT / "build/reference/bot_ai_headers"
    out.mkdir(parents=True, exist_ok=True)
    oracle = out / "bot_ai_headers_oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/WX",
         ROOT / "tests/reference/bot_ai_headers_oracle.c", f"/Fe:{oracle}", "/link", "/Brepro"],
        ROOT, msvc_env("x86"), out / "oracle-build.log",
    )
    expected = run([oracle], out, log=out / "oracle.log").replace("\r\n", "\n")
    actual = run(
        [build("tests/bot_ai_headers_oracle.ml", "bot_ai_headers_oracle.exe")],
        ROOT / "build", log=out / "minilang.log",
    ).replace("\r\n", "\n")
    if expected != actual:
        (out / "expected.txt").write_text(expected, encoding="utf-8")
        (out / "actual.txt").write_text(actual, encoding="utf-8")
        raise RuntimeError("AI header unchanged-C mismatch")
    contracts = run(
        [build("tests/bot_ai_headers_contracts.ml", "bot_ai_headers_contracts.exe")],
        ROOT / "build", log=out / "contracts.log",
    ).strip()
    if contracts != "PASS: 16 bot AI header contracts":
        raise RuntimeError(contracts)

    files = [source_root / name for name in HEADERS] + [
        facade, ROOT / "tests/reference/bot_ai_headers_oracle.c",
        ROOT / "tests/bot_ai_headers_oracle.ml", ROOT / "tests/bot_ai_headers_contracts.ml",
    ]
    result = {
        "passed": True,
        "headers": len(HEADERS),
        "inventory": actual_counts,
        "exact_records": len(expected.splitlines()),
        "contracts": 16,
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 7 Baseq3 AI headers / 55 constants + 3 types + 135 declarations + 16 globals + 163 fields + EC + 16 contracts")


if __name__ == "__main__":
    main()
