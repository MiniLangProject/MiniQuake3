"""Smoke every arena BSP through the packaged Windows/QVM rendering path."""
import argparse
import json
import re
import subprocess
import time
import zipfile
from pathlib import Path

from toolchain import ROOT

FRAME = re.compile(r"selected=(\d+)x(\d+) models=(\d+) triangles=(\d+) textures=(\d+) hudQuads=(\d+) sounds=(\d+) frames=(\d+)")
NUMBER = r"([\d.eE+-]+)"
PROFILE = re.compile(r"QVM frame profile: simulation=" + NUMBER +
                     r"ms .* geometry=" + NUMBER + r"ms .* render=" +
                     NUMBER + r"ms audio=" + NUMBER + r"ms total=" + NUMBER + r"ms")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--frames", type=int, default=30)
    args = parser.parse_args()
    if args.frames < 1:
        parser.error("--frames must be positive")
    archive = (args.data_root / "baseq3/pak0.pk3").resolve()
    exe = ROOT / "build/MiniQuake3.exe"
    qvms = ROOT / "build/reference/qvms"
    with zipfile.ZipFile(archive) as pak:
        text = pak.read("scripts/arenas.txt").decode("latin1")
        arenas = sorted(set(re.findall(r"\bmap\s+\"?([A-Za-z0-9_]+)", text)))
        maps = {Path(name).stem for name in pak.namelist()
                if re.fullmatch(r"maps/[^/]+\.bsp", name, re.I)}
    if len(arenas) != 30 or not set(arenas).issubset(maps):
        raise RuntimeError(f"unexpected Retail arena inventory: {len(arenas)} arenas, missing={set(arenas)-maps}")
    rows = []
    failures = []
    for name in arenas:
        started = time.perf_counter()
        result = subprocess.run([exe, "--play-qvm-smoke", archive,
                                 f"maps/{name}.bsp", qvms, str(args.frames)], cwd=ROOT,
                                capture_output=True, text=True, timeout=90)
        elapsed = round((time.perf_counter() - started) * 1000)
        frame, profile = FRAME.search(result.stdout), PROFILE.search(result.stdout)
        if (result.returncode or not frame or not profile or
                (frame and (int(frame.group(4)) <= 0 or int(frame.group(5)) <= 0 or int(frame.group(8)) != args.frames))):
            failure = {"map": name, "exit": result.returncode,
                       "stdout": result.stdout[-1200:], "stderr": result.stderr[-600:]}
            failures.append(failure)
            print(f"FAIL {name}: {failure['stdout'][-240:]}", flush=True)
            continue
        row = {"map": name, "wall_ms": elapsed, "triangles": int(frame.group(4)),
               "textures": int(frame.group(5)), "simulation_ms": float(profile.group(1)),
               "geometry_ms": float(profile.group(2)), "render_ms": float(profile.group(3)),
               "frame_ms": float(profile.group(5))}
        rows.append(row)
        print(f"PASS {name}: load={elapsed}ms frame={row['frame_ms']}ms triangles={row['triangles']}", flush=True)
    report = ROOT / "build/reports/all_retail_levels.json"
    report.parent.mkdir(parents=True, exist_ok=True)
    report.write_text(json.dumps({"frames_per_map": args.frames, "maps": rows,
                                  "failures": failures}, indent=2) + "\n")
    slow = sorted(rows, key=lambda row: row["wall_ms"], reverse=True)[:3]
    print(f"RESULT: {len(rows)}/{len(arenas)} Retail arenas, slowest startup: " +
          ", ".join(f"{row['map']} {row['wall_ms']}ms" for row in slow))
    if failures:
        raise RuntimeError(f"{len(failures)} Retail arenas failed: " +
                           ", ".join(row["map"] for row in failures))


if __name__ == "__main__":
    main()
