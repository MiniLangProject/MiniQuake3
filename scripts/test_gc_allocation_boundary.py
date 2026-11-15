"""Check real allocation-owner retention for native/lvalue interior roots.

The forged shaderTime case reproduces the measured RenderVertex GC phantom;
the old compiler must lose real payloads, not merely exceed a timing threshold.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import re
import subprocess

from build import build_file_lock, valid_minilang_cache
from inventory import sha
from test_allocator_search import verify_installed_profile
from toolchain import ROOT, run

MODES = {"struct": 3, "bytes": 2, "array": 3, "boundaries": 128, "invalid": 2, "threads": 6}
FLAGS = ("--heap-reserve", "256m", "--heap-commit", "128m", "--gc-limit", "64m")


def evaluate(compiler: Path, out: Path, baseline: bool) -> dict:
    compiler = compiler.resolve()
    verify_installed_profile(compiler)
    source = ROOT / "tests/gc_allocation_boundary_contracts.ml"
    out.mkdir(parents=True, exist_ok=True)
    executable = out / "gc_allocation_boundary.exe"
    stamp = executable.with_suffix(".inputs.json")
    inputs = {"compiler": sha(compiler), "source": sha(source), "flags": list(FLAGS)}
    with build_file_lock(executable.with_suffix(".build.lock")):
        if not valid_minilang_cache(executable, stamp, inputs):
            run([compiler, source, executable, *FLAGS], out, log=out / "compile.log", timeout=180)
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n")
    records = []
    for mode, count in MODES.items():
        result = subprocess.run([str(executable), mode], cwd=out, capture_output=True,
                                text=True, timeout=30)
        output = result.stdout + result.stderr
        log = out / (mode + ".log")
        log.write_text(output)
        actual_pass = result.returncode == 0 and re.fullmatch(
            r"GC_BOUNDARY_OK mode=" + mode + r" contracts=" + str(count) + r"\s*", output) is not None
        expected_pass = not baseline or mode == "invalid"
        record = {"mode": mode, "contracts": count, "exit_code": result.returncode,
                  "actual_pass": actual_pass, "expected_pass": expected_pass,
                  "passed": actual_pass == expected_pass, "log_sha256": sha(log)}
        records.append(record)
        print(("RED verified " if baseline and not expected_pass else "PASS ") + mode, flush=True)
        if not record["passed"]:
            raise RuntimeError("GC boundary " + mode + " did not match expected liveness behavior: " + output)
    report = {"passed": True, "baseline_negative_control": baseline,
              "compiler_sha256": sha(compiler), "source_sha256": sha(source),
              "binary_sha256": sha(executable), "flags": list(FLAGS), "modes": records,
              "contracts": sum(MODES.values()),
              "scope": "Actual owner/child payload assertions for forged struct headers, bytes and arrays; 64 bitmap edges; free/header/out-of-range rejection; completed thread-result roots. No FPS acceptance."}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    return report


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", type=Path, default=ROOT / "artifacts/toolchain/build/mlc_win64.exe")
    parser.add_argument("--baseline-compiler", type=Path)
    parser.add_argument("--label", default="installed")
    args = parser.parse_args()
    if not re.fullmatch(r"[A-Za-z0-9_-]+", args.label):
        parser.error("label must contain only letters, digits, '_' or '-'")
    out = ROOT / "build/reference/gc-allocation-boundary" / args.label
    report = {"passed": True, "candidate": evaluate(args.compiler, out / "candidate", False)}
    if args.baseline_compiler:
        report["baseline"] = evaluate(args.baseline_compiler, out / "baseline", True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
