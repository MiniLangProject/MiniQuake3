"""Complete unchanged-C differential and productive contracts for qcommon/cvar.c."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    out = ROOT / "build/reference/cvar_complete"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code"
    original = source / "qcommon/cvar.c"
    static_harness = ROOT / "tests/reference/cvar_static_oracle.c"
    (out / "cvar_static_under_test.inc").write_text(
        extract(original, ["generateHashValue", "Cvar_ValidateString"]), encoding="utf-8", newline="\n"
    )
    static_oracle = out / "cvar_static_oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", static_harness, f"/Fe:{static_oracle}", "/link", "/Brepro"],
        out, msvc_env("x86"), out / "static-oracle-build.log",
    )
    static_native = run([static_oracle], out, log=out / "static-oracle.log")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cvar_static_oracle.ml", "--output", "cvar_static_oracle.exe"], check=True,
    )
    static_mini = run([ROOT / "build/cvar_static_oracle.exe"], ROOT / "build", log=out / "static-minilang.log")
    if static_native != static_mini:
        raise RuntimeError("Static cvar differential mismatch\nnative:\n" + static_native + "\nMiniLang:\n" + static_mini)
    harness = ROOT / "tests/reference/cvar_complete_oracle.c"
    oracle = out / "cvar_complete_oracle.exe"
    run(
        [
            "cl", "/nologo", "/Od", "/fp:strict", "/MT", "/DWIN32", "/DNDEBUG",
            "/D_CRT_SECURE_NO_WARNINGS", f"/I{source / 'game'}", f"/I{source / 'qcommon'}",
            harness, source / "qcommon/cvar.c", source / "game/q_shared.c",
            f"/Fe:{oracle}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cvar_complete_oracle.ml", "--output", "cvar_complete_oracle.exe"],
        check=True,
    )
    mini = run([ROOT / "build/cvar_complete_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("Complete cvar differential mismatch\nnative:\n" + native + "\nMiniLang:\n" + mini)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cvar_complete_contracts.ml", "--output", "cvar_complete_contracts.exe"],
        check=True,
    )
    contracts = run([ROOT / "build/cvar_complete_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 29 complete cvar contracts":
        raise RuntimeError(contracts)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cvar_productive_contracts.ml", "--output", "cvar_productive_contracts.exe"],
        check=True,
    )
    productive = run([ROOT / "build/cvar_productive_contracts.exe"], ROOT / "build", log=out / "productive-contracts.log").strip()
    if productive != "PASS: 12 productive cvar syscall contracts":
        raise RuntimeError(productive)
    files = [
        original, source / "game/q_shared.c", harness, static_harness,
        ROOT / "src/mq3/qcommon/cvar.ml", ROOT / "src/mq3/qcommon/cvar_commands.ml", ROOT / "src/mq3/vm/syscall_common.ml",
        ROOT / "tests/cvar_complete_oracle.ml", ROOT / "tests/cvar_static_oracle.ml", ROOT / "tests/cvar_complete_contracts.ml", ROOT / "tests/cvar_productive_contracts.ml",
    ]
    result = {
        "passed": True,
        "differential_records": 24,
        "contracts": 41,
        "newly_closed_symbols": 13,
        "aggregate_symbols": 31,
        "scope": "The 13 previously open qcommon/cvar.c symbols: hash/name validation, case-insensitive lookup, typed/string queries and bounded copies, command completion, SetLatched/SetValue, info strings and their productive QVM syscall paths. Together with the existing command/config/restart gates this closes all 31 symbols.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 24 exact Baseq3 cvar records + 41 complete/productive contracts (13 newly closed; aggregate 31/31)")


if __name__ == "__main__":
    main()
