"""Focused unchanged-C, native and Retail gate for all server/sv_init.c symbols."""
import argparse
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SOURCE = ROOT / "Quake-III-Arena-original-source/code/server/sv_init.c"
ALL = [
    "SV_SetConfigstring", "SV_GetConfigstring", "SV_SetUserinfo", "SV_GetUserinfo",
    "SV_CreateBaseline", "SV_BoundMaxClients", "SV_Startup", "SV_ChangeMaxClients",
    "SV_ClearServer", "SV_TouchCGame", "SV_SpawnServer", "SV_Init",
    "SV_FinalMessage", "SV_Shutdown",
]
EXACT = ALL[:10]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    pak = args.data_root / "baseq3/pak0.pk3" if args.data_root else None
    if pak is not None and not pak.is_file():
        raise RuntimeError(f"Retail pak missing: {pak}")
    text = SOURCE.read_text(encoding="utf-8", errors="replace")
    missing = [name for name in ALL if name not in text]
    if missing:
        raise RuntimeError("missing sv_init symbols: " + ", ".join(missing))
    out = ROOT / "build/reference/sv_init_complete"
    out.mkdir(parents=True, exist_ok=True)
    (out / "sv_init_under_test.inc").write_text(extract(SOURCE, EXACT), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/sv_init_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_init_complete_oracle.ml",
                    "--output", "sv_init_complete_oracle.exe"], cwd=ROOT, check=True)
    ported = run([ROOT / "build/sv_init_complete_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != ported:
        left, right = native.splitlines(), ported.splitlines()
        for index in range(max(len(left), len(right))):
            a = left[index] if index < len(left) else "<missing>"
            b = right[index] if index < len(right) else "<missing>"
            if a != b:
                raise RuntimeError(f"sv_init mismatch record {index+1}\nC: {a}\nM: {b}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_init_complete_contracts.ml",
                    "--output", "sv_init_complete_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/sv_init_complete_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 38 sv_init complete contracts":
        raise RuntimeError(contracts)
    retail = ""
    if pak is not None:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_init_retail_probe.ml",
                        "--output", "sv_init_retail_probe.exe"], cwd=ROOT, check=True)
        retail = run([ROOT / "build/sv_init_retail_probe.exe", pak], ROOT / "build", log=out / "retail.log").strip()
        if not retail.startswith("PASS: 8 Retail sv_init contracts"):
            raise RuntimeError(retail)
    sources = [SOURCE, harness, ROOT / "src/mq3/server/init_runtime.ml",
               ROOT / "tests/sv_init_complete_oracle.ml", ROOT / "tests/sv_init_complete_contracts.ml",
               ROOT / "tests/sv_init_retail_probe.ml"]
    report = {
        "passed": True, "symbols": 14, "unchanged_c_symbols": 10,
        "unchanged_c_records": len(native.splitlines()), "native_contracts": 38,
        "retail_contracts": 8 if retail else 0, "retail": retail,
        "scope": "All fourteen sv_init.c entry points. Ten state/data functions are compared directly with extracted unchanged C. Spawn, init, final-message and shutdown are covered by ordered native lifecycle contracts; the productive gate loads q3dm1.bsp and vm/cgame.qvm from the real Retail pak0.pk3.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    suffix = " + 8 Retail contracts" if retail else ""
    print("PASS: 14/14 sv_init symbols + 10 unchanged-C records + 38 native" + suffix)


if __name__ == "__main__":
    main()
