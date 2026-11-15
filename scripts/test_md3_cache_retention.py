#!/usr/bin/env python3
"""Actual Retail MD3 output parity and bounded production cache retention."""
import argparse
import json
from pathlib import Path
import re
import subprocess
import sys
import zipfile

from inventory import sha
from toolchain import ROOT, run

ASSETS = ["models/players/sarge/head.md3", "models/players/sarge/upper.md3",
          "models/players/sarge/lower.md3", "models/weapons2/machinegun/machinegun.md3",
          "models/weapons2/machinegun/machinegun_barrel.md3",
          "models/weapons2/machinegun/machinegun_flash.md3"]


def verify_app_policy(text):
    if not re.search(r"^const MD3_FRAME_CACHE_ENTRIES=32$", text, re.MULTILINE):
        raise RuntimeError("Productive MD3 retention policy must be32")
    if "frameCache=sceneGeometry.createFrameCache(void,MD3_FRAME_CACHE_ENTRIES)" not in text:
        raise RuntimeError("Productive app must use the bounded MD3 policy")


def write_report(out, executable, output, archive):
    text = (ROOT / "src/mq3/client/qvm_preview_app.ml").read_text(encoding="utf-8")
    verify_app_policy(text)
    rejected = 0
    for negative in [text.replace("const MD3_FRAME_CACHE_ENTRIES=32", "const MD3_FRAME_CACHE_ENTRIES=256", 1),
                     text.replace("frameCache=sceneGeometry.createFrameCache(void,MD3_FRAME_CACHE_ENTRIES)",
                                  "frameCache=sceneGeometry.createFrameCache(void,256)", 1)]:
        try:
            verify_app_policy(negative)
        except RuntimeError:
            rejected += 1
    if rejected != 2:
        raise RuntimeError("Production policy source guard failed its256-capacity negative controls")
    lines = output.strip().splitlines()
    if len(lines) != 2 or not lines[0].startswith("PASS: 5 Retail MD3 retention contracts models=6 transforms=768 vertices=108960 triangles=101952 checksum="):
        raise RuntimeError(output)
    values = dict((name, int(value)) for name, value in re.findall(r"(\w+)=(\d+)", lines[1]))
    for large, small in [("largeEntries", "smallEntries"), ("largeVertices", "smallVertices"),
                         ("largeArrays", "smallArrays"), ("largeFloatScalars", "smallFloatScalars")]:
        if values[large] != values[small] * 8:
            raise RuntimeError("Retained cache graph is not bounded to one eighth: " + output)
    if values["smallEntries"] != 32 or values["largeEntries"] != 256:
        raise RuntimeError(output)
    files = ["src/mq3/client/qvm_preview_app.ml", "src/mq3/renderer/qvm_scene_geometry.ml",
             "src/mq3/renderer/md3_cache_index.ml", "src/mq3/renderer/native_md3.ml",
             "src/mq3/renderer/playable_light_grid.ml", "tests/md3_cache_retention_retail_probe.ml",
             "scripts/test_md3_cache_retention.py"]
    with zipfile.ZipFile(archive) as pak:
        import hashlib
        assets = {name: hashlib.sha256(pak.read(name)).hexdigest() for name in ASSETS}
    report = {"schema": 1, "passed": True, "contracts": 5, "frames": 96,
              "output": output.strip(), "retained": values, "asset_sha256": assets,
              "scope": "Capacity256 versus32 through identical productive MD3 interpolation, transform and lighting kernels on six actual Retail models/eight surfaces. Every XYZ/normal binary32 bit and RGBA component is compared before output checksums. Cache eviction preserves a previously retained view. Scene/triangle counts are never reduced.",
              "production_policy": {"capacity": 32, "actual_app_call_verified": True,
                                    "negative_256_constant_rejected": True,
                                    "negative_256_literal_call_rejected": True},
              "limits": "Counts describe cache-owned transformed position/normal/color arrays and coordinate/normal float scalars; exclude keys/structs/shared assets and geometry retained independently by current views. This is not a global heap or GC pause/FPS acceptance measurement. No production binary was patched by this test.",
              "compiler_sha256": sha(ROOT / "artifacts/toolchain/build/mlc_win64.exe"),
              "test_binary_sha256": sha(executable),
              "sources": {name: sha(ROOT / name) for name in files}}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    return report


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    candidates = [args.data_root / "baseq3/pak0.pk3", args.data_root / "pak0.pk3",
                  args.data_root / "Quake3/baseq3/pak0.pk3"]
    archive = next((path.resolve() for path in candidates if path.is_file()), None)
    if archive is None:
        raise RuntimeError("Retail pak0.pk3 missing under " + str(args.data_root))
    verify_app_policy((ROOT / "src/mq3/client/qvm_preview_app.ml").read_text(encoding="utf-8"))
    out = ROOT / "build/reference/md3-cache-retention"
    out.mkdir(parents=True, exist_ok=True)
    assets = []
    with zipfile.ZipFile(archive) as pak:
        for index, name in enumerate(ASSETS):
            path = out / (str(index) + ".md3")
            path.write_bytes(pak.read(name))
            assets.append(path)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/md3_cache_retention_retail_probe.ml", "--output",
                    "md3_cache_retention_retail_probe.exe"], cwd=ROOT, check=True)
    executable = ROOT / "build/md3_cache_retention_retail_probe.exe"
    output = run([executable, *assets], ROOT / "build", log=out / "probe.log", timeout=180).strip()
    write_report(out, executable, output, archive)
    print(output)


if __name__ == "__main__":
    main()
