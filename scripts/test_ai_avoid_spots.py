#!/usr/bin/env python3
"""Run the native BotAddAvoidSpot oracle and MiniLang/QVM contracts."""
import subprocess
import sys
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/ai_avoid_spots"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "ai_avoid_spot_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", ROOT / "tests/reference/ai_avoid_spot_oracle.c", f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "oracle-build.log")
    observed = run([native], out, log=out / "oracle.log").strip()
    expected = "PASS: 5 native BotAddAvoidSpot scenarios / 11 exact observations"
    if observed != expected:
        raise RuntimeError(observed)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/ai_avoid_spot_contracts.ml", "--output", "ai_avoid_spot_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/ai_avoid_spot_contracts.exe"], ROOT).strip()
    if contracts != "PASS: 10 AI avoid-spot contracts":
        raise RuntimeError(contracts)
    print(observed)
    print(contracts)


if __name__ == "__main__":
    main()
