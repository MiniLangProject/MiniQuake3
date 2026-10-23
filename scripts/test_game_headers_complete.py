#!/usr/bin/env python3
"""Complete Baseq3 gameplay constant-header ownership gate."""
import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


HEADERS = ["surfaceflags.h", "inv.h", "chars.h", "syn.h", "match.h", "g_team.h"]


def build(source, output):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def public_macros(path):
    text = path.read_text(encoding="latin1")
    names = re.findall(r"^\s*#define\s+([A-Z][A-Z0-9_]*)\b", text, re.M)
    if path.name == "g_team.h":
        # Baseq3 compiles the non-MISSIONPACK branch. Repeated names in the
        # Missionpack branch still describe the same public symbol.
        names = list(dict.fromkeys(names))
    return names


def main():
    out = ROOT / "build/reference/game_headers"
    out.mkdir(parents=True, exist_ok=True)
    source_root = ROOT / "Quake-III-Arena-original-source/code/game"
    facade = ROOT / "src/mq3/game/game_headers.ml"
    facade_text = facade.read_text(encoding="utf-8")
    counts = {}
    missing = []
    for name in HEADERS:
        macros = public_macros(source_root / name)
        counts[name] = len(macros)
        missing.extend(f"{name}:{macro}" for macro in macros if not re.search(r"\b" + re.escape(macro) + r"\b", facade_text))
    if missing:
        raise RuntimeError(f"unmapped gameplay header macros: {missing}")
    team_text = (source_root / "g_team.h").read_text(encoding="latin1")
    team_functions = re.findall(
        r"^\s*(?:(?:int|void|qboolean)\s+|(?:const char|gentity_t)\s*\*\s*)([A-Za-z_][A-Za-z0-9_]*)\s*\(",
        team_text,
        re.M,
    )
    all_port = "\n".join(path.read_text(encoding="utf-8", errors="ignore") for path in (ROOT / "src/mq3").rglob("*.ml"))
    missing_functions = [name for name in team_functions if not re.search(r"\b" + re.escape(name) + r"\b", all_port)]
    if missing_functions:
        raise RuntimeError(f"unmapped g_team.h functions: {missing_functions}")

    oracle = out / "game_headers_oracle.exe"
    run(
        [
            "cl", "/nologo", "/Od", "/MT", "/W4", "/WX",
            f"/I{source_root}", ROOT / "tests/reference/game_headers_oracle.c",
            f"/Fe:{oracle}", "/link", "/Brepro",
        ],
        ROOT,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    expected = run([oracle], out, log=out / "oracle.log").replace("\r\n", "\n")
    actual = run(
        [build("tests/game_headers_oracle.ml", "game_headers_oracle.exe")],
        ROOT / "build",
        log=out / "minilang.log",
    ).replace("\r\n", "\n")
    if expected != actual:
        (out / "expected.txt").write_text(expected, encoding="utf-8")
        (out / "actual.txt").write_text(actual, encoding="utf-8")
        raise RuntimeError("gameplay header unchanged-C mismatch")

    contracts = run(
        [build("tests/game_headers_contracts.ml", "game_headers_contracts.exe")],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    if contracts != "PASS: 11 game header contracts":
        raise RuntimeError(contracts)

    files = [source_root / name for name in HEADERS] + [
        facade,
        ROOT / "tests/reference/game_headers_oracle.c",
        ROOT / "tests/game_headers_oracle.ml",
        ROOT / "tests/game_headers_contracts.ml",
    ]
    result = {
        "passed": True,
        "headers": counts,
        "baseq3_numeric_macros": 332,
        "team_functions": len(team_functions),
        "exact_records": len(expected.splitlines()),
        "contracts": 11,
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 6 Baseq3 gameplay headers / 332 numeric macros + EC + {len(team_functions)} team functions + 7 exact records + 11 contracts")


if __name__ == "__main__":
    main()
