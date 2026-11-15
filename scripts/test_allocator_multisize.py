"""Check fragmented allocator reuse and report same-workload QPC timings.

All seven fixtures check payloads, live blockers and free-list reuse. Timing is
observational: these microbenchmarks are not whole-game FPS acceptance.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import re
import statistics
import subprocess

from build import build_file_lock, valid_minilang_cache
from inventory import sha
from toolchain import ROOT, run

MODES = ("two", "four", "sixteen", "seventeen", "tiny", "large", "large-tiny")
FLAGS = ("--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "512m")


def verify_installed_profile(compiler: Path) -> None:
    installed = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    if compiler.resolve() != installed.resolve():
        return
    profile = json.loads((ROOT / "docs/reference/toolchain.json").read_text())
    record = next(row for row in profile["inputs"] if row["path"] == "build/mlc_win64.exe")
    if sha(compiler) != record["sha256"]:
        raise RuntimeError("Installed frozen compiler differs from its recorded profile")


def evaluate(compiler: Path, flavor: str, samples: int, timeout: int, out: Path) -> dict:
    compiler = compiler.resolve()
    verify_installed_profile(compiler)
    source = ROOT / "tests/allocator_multisize_contracts.ml"
    target = out / (flavor + "-" + sha(compiler)[:12])
    target.mkdir(parents=True, exist_ok=True)
    executable = target / "allocator_multisize.exe"
    stamp = executable.with_suffix(".inputs.json")
    inputs = {"compiler": sha(compiler), "source": sha(source), "flags": list(FLAGS)}
    with build_file_lock(executable.with_suffix(".build.lock")):
        if not valid_minilang_cache(executable, stamp, inputs):
            run([compiler, source, executable, *FLAGS], ROOT / "build", log=target / "compile.log", timeout=900)
            if inputs != {"compiler": sha(compiler), "source": sha(source), "flags": list(FLAGS)}:
                raise RuntimeError("Allocator fixture inputs changed during compilation")
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n")
    modes = {}
    for mode in MODES:
        timings = []
        logs = []
        for number in range(samples):
            completed = subprocess.run([str(executable), mode], cwd=ROOT / "build",
                                       capture_output=True, text=True, timeout=timeout)
            output = completed.stdout + completed.stderr
            name = mode + "-" + str(number) + ".log"
            (target / name).write_text(output, encoding="utf-8")
            record = re.fullmatch(r"ALLOCATOR_MATRIX_OK mode=" + mode +
                                  r" allocations=(\d+) holes=(\d+) tiny=(?:true|false) free_before=(\d+) elapsed_us=([\deE+.\-]+)\s*", output)
            if completed.returncode or record is None:
                raise RuntimeError("Allocator " + flavor + " " + mode + " failed: " + output)
            timings.append(float(record.group(4)))
            logs.append({"path": str((target / name).relative_to(ROOT)), "sha256": sha(target / name)})
        modes[mode] = {"passed": True, "elapsed_us": timings,
                       "median_us": statistics.median(timings), "logs": logs}
    return {"passed": True, "compiler_sha256": sha(compiler), "binary_sha256": sha(executable), "modes": modes}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", type=Path, default=ROOT / "artifacts/toolchain/build/mlc_win64.exe")
    parser.add_argument("--baseline-compiler", type=Path)
    parser.add_argument("--samples", type=int, default=3)
    parser.add_argument("--timeout", type=int, default=30)
    args = parser.parse_args()
    if not 1 <= args.samples <= 10 or not 1 <= args.timeout <= 120:
        raise RuntimeError("Choose 1..10 samples and 1..120 seconds per bounded fixture")
    out = ROOT / "build/reference/allocator_multisize"
    out.mkdir(parents=True, exist_ok=True)
    report = {"passed": True, "source_sha256": sha(ROOT / "tests/allocator_multisize_contracts.ml"),
              "scope": "Bounded first-fit reuse with interleaved 2/4/16/17 request sizes, tiny head hits, and exact 8208/32784/53792-byte requests from the productive QVM path. Payload/live-blocker/reuse checks are exact; QPC timing is observational, not game FPS.",
              "flags": list(FLAGS), "samples": args.samples}
    if args.baseline_compiler:
        report["baseline"] = evaluate(args.baseline_compiler, "baseline", args.samples, args.timeout, out)
    report["candidate"] = evaluate(args.compiler, "candidate", args.samples, args.timeout, out)
    if "baseline" in report:
        report["observed_speedups"] = {mode: report["baseline"]["modes"][mode]["median_us"] /
                                      max(0.001, report["candidate"]["modes"][mode]["median_us"])
                                      for mode in MODES}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    for mode, result in report["candidate"]["modes"].items():
        print("PASS: allocator " + mode + " exact integrity/reuse contracts; median_us=" + str(result["median_us"]))


if __name__ == "__main__":
    main()
