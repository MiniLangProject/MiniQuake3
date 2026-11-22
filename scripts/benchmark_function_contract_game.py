#!/usr/bin/env python3
"""Alternate frozen MiniQuake3 replay binaries against the same Retail data.

The binaries must already have been compiled from the same replay fixture.
Compiling inside this loop would make the wall-time comparison meaningless.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import statistics
import subprocess

from toolchain import ROOT


TIMING = re.compile(
    r"QVM loop profile: elapsed=(\S+)ms fps=(\S+) workP50=(\S+)ms "
    r"workP95=(\S+)ms workP99=(\S+)ms workMax=(\S+)ms"
)
MOVEMENT = re.compile(r"REPLAY movement positions=(\d+) attacks=(\d+) ammoDecreases=(\d+)")
SIMULATION = re.compile(r"QVM frame profile: simulation=(\S+)ms \(game=(\S+) cgame=(\S+) ui=")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(exe: Path, archive: Path, qvms: Path, frames: int, folder: Path, tag: str) -> dict:
    env = os.environ.copy()
    env["MQ3_RENDERER"] = "hardware"
    env.pop("MQ3_QVM_PROFILE", None)
    env.pop("MQ3_QVM_PROFILE_FILE", None)
    result = subprocess.run(
        [str(exe), str(archive), str(qvms), "moving", str(frames), "q3dm0", "1", "20"],
        cwd=ROOT / "build", env=env, capture_output=True, text=True,
        errors="replace", timeout=900,
    )
    log = result.stdout + result.stderr
    (folder / f"{tag}.log").write_text(log, encoding="utf-8")
    timing = TIMING.search(log)
    movement = MOVEMENT.search(log)
    if (result.returncode or not timing or not movement
            or f"frames={frames}" not in log or "Error occured:" in log):
        raise RuntimeError(f"{tag} failed; see {folder / (tag + '.log')}")
    values = [float(item) for item in timing.groups()]
    sample = {
        "elapsed_ms": values[0], "fps": values[1], "p50_ms": values[2],
        "p95_ms": values[3], "p99_ms": values[4], "max_ms": values[5],
        "movement": tuple(int(value) for value in movement.groups()),
        "log_sha256": sha256(folder / f"{tag}.log"),
    }
    simulation = SIMULATION.search(log)
    if simulation:
        sample.update(zip(("simulation_ms", "game_ms", "cgame_ms"), map(float, simulation.groups())))
    return sample


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", type=Path, required=True)
    parser.add_argument("--candidate", type=Path, required=True)
    parser.add_argument("--archive", type=Path, default=ROOT / "build/baseq3/pak0.pk3")
    parser.add_argument("--qvms", type=Path, default=ROOT / "build/reference/qvms")
    parser.add_argument("--frames", type=int, default=2200)
    parser.add_argument("--repeat", type=int, default=3)
    parser.add_argument("--output", type=Path,
                        default=ROOT / "build/reports/function_contract_game_ab.json")
    args = parser.parse_args()
    if args.frames < 100 or args.repeat < 2:
        parser.error("at least 100 frames and two alternating repetitions are required")
    baseline = args.baseline.resolve()
    candidate = args.candidate.resolve()
    archive = args.archive.resolve()
    qvms = args.qvms.resolve()
    for path in (baseline, candidate, archive, *(qvms / name for name in
                                                 ("ui.qvm", "cgame.qvm", "qagame.qvm"))):
        if not path.is_file():
            parser.error(f"missing input: {path}")
    if sha256(baseline) == sha256(candidate):
        parser.error("baseline and candidate binaries are identical")
    folder = args.output.resolve().parent / (args.output.stem + "_logs")
    folder.mkdir(parents=True, exist_ok=True)
    executables = {"baseline": baseline, "candidate": candidate}
    samples = {name: [] for name in executables}
    reference_movement = None
    for iteration in range(args.repeat):
        order = ("baseline", "candidate") if iteration % 2 == 0 else ("candidate", "baseline")
        for name in order:
            sample = run(executables[name], archive, qvms, args.frames, folder,
                         f"{iteration + 1:02d}_{name}")
            if reference_movement is None:
                reference_movement = sample["movement"]
            elif sample["movement"] != reference_movement:
                raise RuntimeError(f"simulation diverged in {name} run {iteration + 1}")
            samples[name].append(sample)
            print(f"{iteration + 1}/{args.repeat} {name}: {sample['fps']:.2f} FPS, "
                  f"p99 {sample['p99_ms']:.0f} ms, max {sample['max_ms']:.0f} ms", flush=True)
    report = {
        "scope": "frozen productive Retail QVM q3dm0 moving replay; no compile in measurement loop",
        "frames": args.frames, "fixed_step_ms": 20, "singleplayer": True,
        "movement": reference_movement,
        "binaries": {name: {"path": str(path), "sha256": sha256(path),
                             "size_bytes": path.stat().st_size}
                     for name, path in executables.items()},
        "assets": {"pak0_sha256": sha256(archive),
                   "qvm_sha256": {name: sha256(qvms / name) for name in
                                   ("ui.qvm", "cgame.qvm", "qagame.qvm")}},
        "samples": samples,
        "median": {name: {metric: statistics.median(sample[metric] for sample in values)
                          for metric in ("elapsed_ms", "fps", "p50_ms", "p95_ms", "p99_ms", "max_ms",
                                         "simulation_ms", "game_ms", "cgame_ms")
                          if all(metric in sample for sample in values)}
                   for name, values in samples.items()},
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: matching gameplay counters, alternating A/B; {args.output}")


if __name__ == "__main__":
    main()
