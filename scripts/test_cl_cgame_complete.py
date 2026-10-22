#!/usr/bin/env python3
"""Complete client/cl_cgame.c symbol, unchanged-C, native and Retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def invoke(name: str, *args: str) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name, *args], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/cl_cgame_complete"
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/client/cl_cgame.c")
    facade = ROOT / "src/mq3/client/cl_cgame_runtime.ml"
    text = facade.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"] if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", text)]
    if missing:
        raise RuntimeError("missing cl_cgame facade symbols: " + ", ".join(missing))

    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c"
    unchanged = ["CL_GetGameState", "CL_GetGlconfig", "CL_GetUserCmd", "CL_GetCurrentCmdNumber",
                 "CL_GetParseEntityState", "CL_GetCurrentSnapshotNumber", "CL_SetUserCmdValue", "FloatAsInt"]
    (out / "cl_cgame_complete_under_test.inc").write_text(extract(original, unchanged), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/cl_cgame_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/MT", "/W3", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    mini = run([build("tests/cl_cgame_complete_oracle.ml", "cl_cgame_complete_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("cl_cgame unchanged-C mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    contracts = run([build("tests/cl_cgame_complete_contracts.ml", "cl_cgame_complete_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if not re.fullmatch(r"PASS: \d+ complete cl_cgame contracts", contracts):
        raise RuntimeError(contracts)
    contract_count = int(contracts.split()[1])

    data_root = args.data_root.resolve()
    pak = data_root / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"missing Retail pak0.pk3: {pak}")
    qvms = ROOT / "build/reference/qvms"
    if not (qvms / "cgame.qvm").is_file() or not (qvms / "qagame.qvm").is_file():
        invoke("build_qvms.py")
    retail = run([build("tests/cl_cgame_retail_probe.ml", "cl_cgame_retail_probe.exe"), pak, qvms], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not retail.startswith("PASS: retail cl_cgame "):
        raise RuntimeError(retail)

    if args.full_regression:
        invoke("test_cgame_vm_lifecycle.py")
        invoke("test_vm_syscall_cgame.py")
        invoke("test_cgame_time.py")
        invoke("test_cgame_clock.py")
        invoke("test_client_command_ring.py")
        invoke("test_server_command_stream.py")
        invoke("test_cgame_usercmd.py")

    files = [original, facade, harness, ROOT / "tests/cl_cgame_complete_oracle.ml",
             ROOT / "tests/cl_cgame_complete_contracts.ml", ROOT / "tests/cl_cgame_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(entry["symbol_candidates"]),
        "unchanged_c_records": len(native.splitlines()),
        "contracts": contract_count,
        "retail": retail,
        "retail_pak_sha256": sha(pak),
        "scope": "All client/cl_cgame.c symbols through a C-named facade over the productive VM lifecycle, cgame trap dispatcher, reliable command stream, usercmd/parse-entity/snapshot rings, packed ABI state and cgame clock.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['symbols']}/{result['symbols']} cl_cgame symbols + {result['unchanged_c_records']} unchanged-C records + {contract_count} native contracts + Retail QVM lifecycle")


if __name__ == "__main__":
    main()
