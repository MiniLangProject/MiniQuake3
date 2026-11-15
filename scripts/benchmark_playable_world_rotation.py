"""Deterministic retail renderer probe; timings exclude QVM, models and gameplay."""
import argparse
import json
import math
import os
from pathlib import Path
import re
import subprocess
import time
from build import minilang_inputs, valid_minilang_cache
from inventory import sha
from toolchain import ROOT


FIELDS = ("frame", "yaw", "frame_ms", "view_selection_ms", "world_build_ms", "effects_build_ms",
          "render_present_ms", "faces", "retained_triangles", "drawable_triangles", "skipped_sky_triangles", "sky_triangles", "world_submitted",
          "gpu_submitted", "draw_calls", "rebuilt", "pvs_cluster", "pvs_used")
INTEGERS = set(FIELDS) - {"yaw", "frame_ms", "view_selection_ms", "world_build_ms", "effects_build_ms", "render_present_ms"}


def distribution(values):
    ordered = sorted(values)
    return {"mean": sum(values) / len(values), "min": ordered[0],
            "p50": ordered[math.ceil(len(values) * 0.50) - 1],
            "p95": ordered[math.ceil(len(values) * 0.95) - 1],
            "p99": ordered[math.ceil(len(values) * 0.99) - 1], "max": ordered[-1]}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=ROOT / "build")
    parser.add_argument("--pak", type=Path, help="override data-root/baseq3/pak0.pk3")
    parser.add_argument("--reference", action="store_true", help="same binary and renderer, original selected world builder")
    parser.add_argument("--renderer", choices=("hardware", "software"), default="hardware")
    parser.add_argument("--output", type=Path, default=ROOT / "build/reference/world_rotation")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--compile-only", action="store_true", help="prepare the renderer probe without opening a window")
    modes.add_argument("--no-build", action="store_true", help="require an existing fresh probe binary")
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "tests/playable_world_rotation_benchmark.ml"
    frozen = ROOT / "artifacts/toolchain"
    compiler = frozen / "build/mlc_win64.exe"
    binary = ROOT / "build/playable_world_rotation_benchmark.exe"
    stamp = binary.with_name(binary.name + ".inputs.json")
    inputs = minilang_inputs(source, compiler)
    if not valid_minilang_cache(binary, stamp, inputs):
        if args.no_build:
            raise RuntimeError("renderer probe is missing or stale; run --compile-only first")
        # Compile this focused source only. Shipping DLLs remain untouched.
        command = [str(compiler), str(source), str(binary), "-I", str(ROOT / "src"), "-I", str(frozen),
                   "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"]
        result = subprocess.run(command, cwd=ROOT / "build", capture_output=True, text=True, timeout=900)
        (out / "compile.log").write_text(result.stdout + result.stderr)
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)
        stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(binary)}, indent=2) + "\n")
    if args.compile_only:
        print("READY: compiled retail world rotation renderer probe; no window was opened")
        return
    pak = (args.pak or args.data_root / "baseq3/pak0.pk3").resolve()
    if not pak.is_file():
        raise RuntimeError(f"Retail pak0.pk3 is required: {pak}")
    env = os.environ.copy()
    env["MQ3_RENDERER"] = args.renderer
    env.pop("MQ3_CAPTURE", None)
    env.pop("MQ3_RENDER_TRACE", None)
    for name in ("MQ3_QVM_PROFILE", "MQ3_QVM_PROFILE_FILE", "MQ3_RENDER_PROFILE", "MQ3_RENDER_PROFILE_FILE"):
        env.pop(name, None)
    started = time.perf_counter()
    command = [str(binary), str(pak)]
    if args.reference:
        command.append("--reference")
    result = subprocess.run(command, cwd=ROOT / "build", env=env,
                            capture_output=True, text=True, timeout=240)
    wall = time.perf_counter() - started
    (out / "stdout.log").write_text(result.stdout)
    (out / "stderr.log").write_text(result.stderr)
    if result.returncode:
        raise RuntimeError(f"Renderer rotation probe failed ({result.returncode}): {result.stdout}\n{result.stderr}")
    if f"Renderer rotation backend={args.renderer} " not in result.stdout:
        raise RuntimeError("requested renderer was not active")
    frames = []
    for line in result.stdout.splitlines():
        if not line.startswith("FRAME|"):
            continue
        values = line.split("|")[1:]
        if len(values) != len(FIELDS):
            raise RuntimeError("malformed rotation observation: " + line)
        frames.append({field: int(value) if field in INTEGERS else float(value)
                       for field, value in zip(FIELDS, values)})
    match = re.search(r"PASS: retail world rotation frames=(\d+) faceChanges=(\d+) pvsClusterChanges=(\d+) retainedTriangles=(\d+) worldSubmitted=(\d+) skySubmitted=(\d+) budgetDropped=(\d+) startupMs=(\S+) elapsedMs=(\S+)", result.stdout)
    if not match or len(frames) != 360 or int(match[1]) != 360:
        raise RuntimeError("360 complete rotation observations are required")
    if any(row["frame"] != index or row["yaw"] != 90 + index for index, row in enumerate(frames)):
        raise RuntimeError("camera did not follow the deterministic 360-degree schedule")
    face_changes = sum(row["rebuilt"] for row in frames)
    if face_changes < 90 or face_changes != int(match[2]) or int(match[7]) != 0:
        raise RuntimeError("rotation must stress frequent faceset rebuilds without triangle budget drops")
    if any(row["retained_triangles"] < 1 or row["drawable_triangles"] + row["skipped_sky_triangles"] != row["retained_triangles"] or row["world_submitted"] < row["drawable_triangles"] or row["sky_triangles"] < 1 or row["pvs_used"] != 1 for row in frames):
        raise RuntimeError("retail world/PVS/sky geometry was not retained")
    if args.renderer == "hardware" and any(row["gpu_submitted"] != row["world_submitted"] + row["sky_triangles"] or row["draw_calls"] < 1 for row in frames):
        raise RuntimeError("GPU counters disagree with complete retained-world and sky submissions")
    for key, group in (("retained_triangles", 4), ("world_submitted", 5), ("sky_triangles", 6)):
        if sum(row[key] for row in frames) != int(match[group]):
            raise RuntimeError("rotation total disagrees with per-frame counters: " + key)
    if int(match[3]) != 0 or len({row["pvs_cluster"] for row in frames}) != 1:
        raise RuntimeError("fixed camera origin unexpectedly changed PVS clusters")
    if any(not math.isfinite(row["frame_ms"]) or row["frame_ms"] <= 0 for row in frames):
        raise RuntimeError("invalid high-resolution frame timing")
    cache = re.search(r"WORLD_CACHE selections=(\d+) fallbacks=(\d+) staticPrimes=(\d+)", result.stdout)
    mode = "reference" if args.reference else "retained"
    if not cache or f"WORLD_CACHE mode={mode}" not in result.stdout:
        raise RuntimeError("missing actual world batch path/counters")
    loop_ms = float(match[9])
    report = {"passed": True, "scope": "renderer-only q3dm1 world rotation; no QVM, models, gameplay or desktop input",
              "renderer": args.renderer, "map": "q3dm1", "frames": len(frames),
              "world_batch_path": mode, "cache_selections": int(cache[1]), "cache_fallbacks": int(cache[2]), "cache_static_primes": int(cache[3]),
              "phase_scope": "retained world_build_ms includes record gather, source prefixes and selected fog/dlight attachment; reference reports attachment separately",
              "camera_origin": [1024, 1000, 50.125], "yaw_start": 90, "yaw_step": 1,
              "face_changes": face_changes, "pvs_cluster_changes": int(match[3]),
              "pvs_scope": "fixed origin reuses one PVS cluster; rotation stresses frustum/faceset rebuilds",
              "budget_dropped": int(match[7]), "retained_triangles": int(match[4]),
              "startup_ms": float(match[8]), "loop_ms": loop_ms, "renderer_probe_fps": 360000 / loop_ms,
              "wall_seconds": wall, "capture_enabled": False, "swap_interval_requested": 0,
              "frame_ms": distribution([row["frame_ms"] for row in frames]),
              "phases": {key: distribution([row[key] for row in frames]) for key in
                         ("view_selection_ms", "world_build_ms", "effects_build_ms", "render_present_ms")},
              "selected_triangles_per_frame": {"min": min(row["retained_triangles"] for row in frames), "max": max(row["retained_triangles"] for row in frames)},
              "binary_sha256": sha(binary), "pak_sha256": sha(pak),
              "native": {name: sha(ROOT / "build" / name) for name in
                         ("playable_window.dll", "miniquake3_qvm.dll", "miniquake3_abi.dll")},
              "observations": frames}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"PASS: {mode} renderer-only retail rotation, {face_changes} faceset changes, zero budget drops; "
          f"mean {report['frame_ms']['mean']:.3f}ms P95 {report['frame_ms']['p95']:.3f}ms "
          f"P99 {report['frame_ms']['p99']:.3f}ms max {report['frame_ms']['max']:.3f}ms; "
          f"{report['renderer_probe_fps']:.1f} renderer-probe FPS")


if __name__ == "__main__":
    main()
