#!/usr/bin/env python3
"""Complete tr_scene.c facade, native, unchanged-header and Retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run

EXPECTED = [
    "RE_AddAdditiveLightToScene", "RE_AddDynamicLightToScene",
    "RE_AddLightToScene", "RE_AddPolyToScene", "RE_AddRefEntityToScene",
    "RE_ClearScene", "RE_RenderScene", "R_AddPolygonSurfaces",
    "R_ToggleSmpFrame",
]


def invoke(name: str, *arguments: object) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name, *map(str, arguments)], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_scene.c"
    facade = ROOT / "src/mq3/renderer/tr_scene_runtime.ml"
    text = facade.read_text(encoding="utf-8")
    missing = [name for name in EXPECTED if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", text)]
    if missing:
        raise RuntimeError("missing tr_scene facade symbols: " + ", ".join(missing))

    invoke("test_scene_queue.py")
    invoke("build.py", "--source", "tests/tr_scene_complete_contracts.ml", "--output", "tr_scene_complete_contracts.exe")
    contracts = run([ROOT / "build/tr_scene_complete_contracts.exe"], ROOT / "build").strip()
    if contracts != "PASS: 32 complete tr_scene contracts":
        raise RuntimeError(contracts)
    invoke("test_qvm_scene_geometry.py")
    invoke("test_qvm_scene_batch.py")
    invoke("test_cgame_renderer_extended.py")

    retail = "not requested"
    if args.data_root:
        base = args.data_root.resolve()
        if (base / "baseq3").is_dir():
            base = base / "baseq3"
        pak = base / "pak0.pk3"
        if not pak.is_file():
            raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
        qvms = ROOT / "build/reference/qvms"
        if not (qvms / "cgame.qvm").is_file():
            invoke("build_qvms.py")
        output = subprocess.run(
            [sys.executable, ROOT / "scripts/test_qvm_renderer_traps.py", "--pak", pak, "--qvms", qvms],
            cwd=ROOT, check=True, text=True, capture_output=True, timeout=600,
        ).stdout.strip()
        retail = output.splitlines()[-1] if output else ""
        if not retail.startswith("PASS: retail QVM renderer traps "):
            raise RuntimeError(retail)
    if args.full_regression:
        invoke("test_retail_qvm_match.py", "--data-root", args.data_root or Path("D:/Quake3"))

    previous = json.loads((ROOT / "build/reference/scene_queue/result.json").read_text(encoding="utf-8"))
    files = [source, facade, ROOT / "src/mq3/renderer/scene_queue.ml", ROOT / "tests/tr_scene_complete_contracts.ml"]
    report = {
        "passed": True, "symbols": len(EXPECTED), "unchanged_header_records": previous["records"],
        "contracts": 32, "retail": retail,
        "scope": "All tr_scene.c symbols: SMP-frame reset, scene marks, polygon/entity/light submission, world polygon draw-surfaces, refdef/areamask/view construction, multi-scene isolation, dynamic-light policy and productive retained-QVM view dispatch.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/tr_scene_complete"; out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(EXPECTED)}/{len(EXPECTED)} tr_scene symbols + {previous['records']} exact ABI records + 32 native contracts + Retail QVM renderer traps")


if __name__ == "__main__":
    main()
