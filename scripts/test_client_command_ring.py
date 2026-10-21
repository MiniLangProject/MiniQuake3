#!/usr/bin/env python3
"""Differential coverage for Baseq3's 64-entry client usercmd ring."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main() -> None:
    out = ROOT / "build/reference/client_command_ring"
    out.mkdir(parents=True, exist_ok=True)
    input_source = ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c"
    cgame_source = ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c"
    extracted = extract(input_source, ["CL_CreateNewCommands"])
    extracted += "\n" + extract(cgame_source, ["CL_GetUserCmd", "CL_GetCurrentCmdNumber"])
    (out / "client_command_ring_under_test.inc").write_text(extracted, encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/client_command_ring_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/client_command_ring_oracle.ml", "--output", "client_command_ring_oracle.exe"], cwd=ROOT, check=True)
    mini = run([ROOT / "build/client_command_ring_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("client command-ring mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/client_command_ring_contracts.ml", "--output", "client_command_ring_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/client_command_ring_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 11 client command-ring contracts":
        raise RuntimeError(contracts)
    module = ROOT / "src/mq3/client/command_ring.ml"
    send = ROOT / "src/mq3/client/send_cmd.ml"
    match = ROOT / "src/mq3/engine/local_qvm_match.ml"
    for path, anchors in [(send, ["sendCommandRing.advance(", "sendCommandRing.store(", "sendCommandRing.get("]), (match, ["matchCommandRing.store(", "matchCommandRing.get(", "matchCommandRing.clear("])]:
        text = path.read_text(encoding="utf-8")
        for anchor in anchors:
            if anchor not in text:
                raise RuntimeError(f"productive command-ring integration missing in {path.name}: {anchor}")
    files = [input_source, cgame_source, harness, module, send, match,
             ROOT / "tests/client_command_ring_oracle.ml", ROOT / "tests/client_command_ring_contracts.ml"]
    report = {
        "passed": True,
        "records": len(native.splitlines()),
        "contracts": 11,
        "function": "CL_CreateNewCommands / CL_GetCurrentCmdNumber / CL_GetUserCmd",
        "scope": "Frame-msec hitch clamp, signed frame delta, 64-entry masked storage, current-number reporting, oldest-retained boundary, stale miss and future-command error are shared by packet transmission and cgame traps.",
        "remaining": "The ring is complete; configurable input bindings remain separate client work.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 client command-ring records + {report['contracts']} contracts")


if __name__ == "__main__":
    main()
