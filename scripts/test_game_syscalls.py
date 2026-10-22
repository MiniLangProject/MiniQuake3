#!/usr/bin/env python3
"""Symbol-complete unchanged-C oracle and native qagame syscall contracts."""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/game_syscalls"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/game/g_syscalls.c"
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/game/g_syscalls.c")
    symbols = entry["symbol_candidates"]
    assert len(symbols) == 185 and len(set(symbols)) == 185
    module = ROOT / "src/mq3/game/syscalls.ml"
    module_text = module.read_text(encoding="utf-8")
    for symbol in symbols:
        assert re.search(rf"\bfunction\s+{re.escape(symbol)}\s*\(", module_text), symbol
    traps = re.findall(r"(?m)^\s*(?:void|int|float|qboolean)\s+(trap_[A-Za-z0-9_]+)\s*\(", source.read_text(encoding="utf-8", errors="replace"))
    assert len(traps) == 183 and len(set(traps)) == 183
    game = source.parent
    host = ROOT / "tests/reference/game_syscalls_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W3", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS", f"/I{game}", source, host, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "build.log")
    expected = run([oracle], out, log=out / "native.log")
    assert len(expected.splitlines()) == 185
    for mini_source, output in [("tests/game_syscalls_oracle.ml", "game_syscalls_oracle.exe"), ("tests/game_syscalls_contracts.ml", "game_syscalls_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/game_syscalls_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, "native wrapper ABI differs from unchanged g_syscalls.c"
    contracts = run([ROOT / "build/game_syscalls_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 37 native game syscall contracts (185 symbols)", contracts
    retail = None
    if args.data_root:
        retail = run([sys.executable, ROOT / "scripts/test_botlib_retail_qagame.py", "--data-root", args.data_root], ROOT, timeout=240, log=out / "retail.log").strip().splitlines()[-1]
        assert retail.startswith("PASS: 12 retail qagame botlib lifecycle contracts"), retail
    files = [source, source.parent / "g_public.h", host, module, ROOT / "src/mq3/game/syscall_qagame_host.ml", ROOT / "tests/game_syscalls_oracle.ml", ROOT / "tests/game_syscalls_contracts.ml"]
    result = {"passed": True, "source_symbols": 185, "trap_wrappers": 183, "differential_records": 185, "contracts": 37, "retail": retail, "scope": "All g_syscalls.c engine, FS, cvar, server/world, BotLib, AAS, EA, AI and parser wrappers, including opcode order, 32-bit pointer tokens, return forwarding, float bit casts and the original mutate-fuzzy promoted-float quirk.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    suffix = "" if retail is None else " + 12 retail qagame lifecycle contracts"
    print(f"PASS: 185 unchanged-C syscall ABI records + 37 native contracts + 185 symbols{suffix}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
