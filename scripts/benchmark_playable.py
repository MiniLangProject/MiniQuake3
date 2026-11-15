"""Serial, reproducible timings of the real Retail-QVM Windows path."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import time
from inventory import sha
from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--binary", type=Path, default=ROOT / "build/MiniQuake3.exe")
    parser.add_argument("--data-root", type=Path, default=ROOT / "build")
    parser.add_argument("--renderer", choices=("hardware", "software"), default="hardware")
    parser.add_argument("--frames", type=int, default=120)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--capture", action="store_true")
    parser.add_argument("--qvm-profile", action="store_true", help="diagnostic trap timings; disables FPS acceptance")
    parser.add_argument("--render-profile", action="store_true", help="diagnostic native draw/swap timings; disables FPS acceptance")
    parser.add_argument("--min-fps", type=float, help="require actual loop FPS, including its sleep")
    parser.add_argument("--max-work-p95-ms", type=float, help="require the measured work-frame P95")
    args = parser.parse_args()
    if args.frames < 1:
        parser.error("--frames must be positive")
    diagnostic = args.capture or args.qvm_profile or args.render_profile
    if diagnostic and (args.min_fps is not None or args.max_work_p95_ms is not None):
        parser.error("capture/profiling cannot be used for performance acceptance")
    binary = args.binary.resolve()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    env["MQ3_RENDERER"] = args.renderer
    env.pop("MQ3_CAPTURE", None)
    env.pop("MQ3_RENDER_TRACE", None)
    for name in ("MQ3_QVM_PROFILE", "MQ3_QVM_PROFILE_FILE", "MQ3_RENDER_PROFILE", "MQ3_RENDER_PROFILE_FILE"):
        env.pop(name, None)
    profile_files = {}
    for enabled, prefix, kind in ((args.qvm_profile, "MQ3_QVM", "qvm"), (args.render_profile, "MQ3_RENDER", "render")):
        if enabled:
            path = out / f"native-{kind}-{time.time_ns()}.log"
            env[prefix + "_PROFILE"] = "1"
            env[prefix + "_PROFILE_FILE"] = str(path)
            profile_files[kind] = str(path)
    if args.capture:
        env["MQ3_CAPTURE"] = str(out / "frame.bmp")
    command = [str(binary), "--play-qvm-smoke", str(args.data_root.resolve() / "baseq3/pak0.pk3"),
               "maps/q3dm1.bsp", str(ROOT / "build/reference/qvms"), str(args.frames)]
    started = time.perf_counter()
    result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, text=True, timeout=240)
    wall = time.perf_counter() - started
    (out / "stdout.log").write_text(result.stdout, encoding="utf-8")
    (out / "stderr.log").write_text(result.stderr, encoding="utf-8")
    print(result.stdout)
    if result.returncode:
        raise RuntimeError(f"Retail benchmark failed ({result.returncode}): {result.stderr}")
    startup = re.search(r"QVM startup profile: .*total=([\d.]+)ms", result.stdout)
    frame = re.search(r"QVM frame profile: .*total=([\d.]+)ms", result.stdout)
    if not startup or not frame or f"QVM renderer: {args.renderer}" not in result.stdout:
        raise RuntimeError("missing real frame timings or requested renderer was not active")
    scene = re.search(r"QVM preview: views=(\d+).* models=(\d+) triangles=(\d+)", result.stdout)
    if not scene:
        raise RuntimeError("missing actual scene submission counts")
    record = {"passed": True, "binary_sha256": sha(binary), "renderer": args.renderer,
              "map": "q3dm1", "frames": args.frames, "wall_seconds": wall, "startup_ms": float(startup[1]),
              "frame_ms": float(frame[1]), "capture_enabled": args.capture,
              "diagnostic_only": diagnostic, "profile_files": profile_files,
              "native": {name: sha(binary.parent / name) for name in
                         ("playable_window.dll", "miniquake3_qvm.dll", "miniquake3_abi.dll", "playable_ambient.dll")}}
    record["scene"] = dict(zip(("views", "models", "triangles"), map(int, scene.groups())))
    record["passed"] = record["scene"]["views"] >= 3 and record["scene"]["models"] >= 5 and record["scene"]["triangles"] > 500
    loop = re.search(r"QVM loop profile: elapsed=(\S+)ms fps=(\S+) workP50=(\S+)ms workP95=(\S+)ms workP99=(\S+)ms workMax=(\S+)ms", result.stdout)
    if loop:
        record["loop"] = dict(zip(("elapsed_ms", "fps", "work_p50_ms", "work_p95_ms", "work_p99_ms", "work_max_ms"), map(float, loop.groups())))
    if args.min_fps is not None or args.max_work_p95_ms is not None:
        record["acceptance"] = {"min_fps": args.min_fps, "max_work_p95_ms": args.max_work_p95_ms}
        measured = record.get("loop", {})
        enough_fps = args.min_fps is None or measured.get("fps", 0) >= args.min_fps
        low_p95 = args.max_work_p95_ms is None or measured.get("work_p95_ms", float("inf")) <= args.max_work_p95_ms
        record["acceptance"]["passed"] = enough_fps and low_p95
        record["passed"] = record["passed"] and record["acceptance"]["passed"]
    (out / "result.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
    if not record["passed"]:
        raise RuntimeError("q3dm1 scene or performance acceptance failed; inspect result.json and the complete render counters")
    print(f"PASS: {args.renderer}, start {record['startup_ms']} ms, frame {record['frame_ms']} ms")


if __name__ == "__main__":
    main()
