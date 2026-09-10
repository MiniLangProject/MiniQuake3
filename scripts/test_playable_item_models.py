#!/usr/bin/env python3
"""Verify PK3-backed, textured MD3 item models and the q3dm1 inventory."""
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run


def build(source: str, output: str) -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path, help="optional retail baseq3/pak0.pk3")
    args = parser.parse_args()
    output = ROOT / "build/reference/playable_item_models"
    output.mkdir(parents=True, exist_ok=True)

    build("tests/playable_item_models_contracts.ml", "playable_item_models_contracts.exe")
    contracts = run(
        [ROOT / "build/playable_item_models_contracts.exe"], ROOT / "build", log=output / "contracts.log"
    ).strip()
    expected = "PASS: 44 playable item-model contracts"
    if contracts != expected:
        raise RuntimeError(contracts)

    retail = None
    if args.pak is not None:
        pak = args.pak.resolve()
        if not pak.is_file():
            raise FileNotFoundError(pak)
        build("tests/playable_item_models_retail_probe.ml", "playable_item_models_retail_probe.exe")
        retail = run(
            [ROOT / "build/playable_item_models_retail_probe.exe", pak], ROOT / "build", log=output / "q3dm1.log", timeout=240
        ).strip()
        if not retail.startswith("PASS: retail q3dm1 item models"):
            raise RuntimeError(retail)

    sources = [
        ROOT / "src/mq3/client/playable_item_models.ml",
        ROOT / "tests/playable_item_models_contracts.ml",
        ROOT / "tests/playable_item_models_retail_probe.ml",
        ROOT / "scripts/test_playable_item_models.py",
    ]
    report = {
        "passed": True,
        "contracts": 44,
        "retail": retail,
        "scope": "Retail classname-to-MD3 item assets, shader/skin/base-image resolution, shared texture slots, transforms, bob/rotation, and bounded renderer-neutral triangles.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    (output / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(contracts)
    if retail is not None:
        print(retail)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
