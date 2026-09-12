#!/usr/bin/env python3
"""Build and run Baseq3-style playable viewmodel pose contracts."""
from __future__ import annotations

import json
import argparse
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/playable_viewmodel"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_viewmodel_contracts.ml", "--output", "playable_viewmodel_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    result = run([ROOT / "build/playable_viewmodel_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    expected = "PASS: 26 playable viewmodel contracts"
    if result != expected:
        raise RuntimeError(result)
    retail = None
    if args.pak:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_viewmodel_retail_probe.ml", "--output", "playable_viewmodel_retail_probe.exe"],
            cwd=ROOT,
            check=True,
        )
        retail = run([ROOT / "build/playable_viewmodel_retail_probe.exe", args.pak.resolve()], ROOT / "build", log=out / "retail.log").strip()
        if not retail.startswith("PASS: retail viewmodels 10 hand MD3s / "):
            raise RuntimeError(retail)
    files = [ROOT / "src/mq3/client/playable_viewmodel.ml", ROOT / "src/mq3/format/md3.ml", ROOT / "tests/playable_viewmodel_contracts.ml", ROOT / "tests/playable_viewmodel_retail_probe.ml"]
    report = {
        "passed": True,
        "contracts": 26,
        "retail": retail,
        "scope": "Baseq3 CG_CalculateWeaponPosition, AnglesToAxis, complete interpolated hand-tag attachment and mapped attack/drop/raise weapon frames.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(result)
    if retail:
        print(retail)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
