#!/usr/bin/env python3
"""Collect MiniLang callStats() from the productive Retail QVM replay.

The replay app is generated from qvm_preview_app.ml by the existing test
generator. Only its test entry point gains a post-run callStats() printout.
Profiling instrumentation adds overhead: these timings are not FPS benchmarks.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

from build import build_file_lock, minilang_inputs
from build_release import COMPILER_SHA256, PLAYABLE_RUNTIME_FLAGS, prepare_compiler
from test_ingame_controls_render import archive_path, generate
from toolchain import ROOT, run


ENTRY = " return controlsRenderApp.runLimitedSettingsNamed(archive,map,mapName,args[1],toNumber(args[3]),settings)"
REPORT = """ result=controlsRenderApp.runLimitedSettingsNamed(archive,map,mapName,args[1],toNumber(args[3]),settings)
 stats=callStats()
 if typeof(stats)=="array" then
   for each stat in stats
     if stat.calls>0 then print "[call-profile] name="+stat.name+" calls="+str(stat.calls) end if
   end for
 end if
 return result"""


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--frames", type=int, default=2200)
    parser.add_argument("--fixed-step-ms", type=int, default=20)
    parser.add_argument("--reuse-build", action="store_true")
    args = parser.parse_args()
    if args.frames<20 or not 0<=args.fixed_step_ms<=50:
        parser.error("at least 20 frames and a fixed step of 0–50 ms are required")
    out = ROOT / "build/reports/function_call_profile"
    out.mkdir(parents=True, exist_ok=True)
    app = ROOT / "src/mq3/client/qvm_preview_app.ml"
    app_hash = digest(app)
    generated = generate(out, app, False, False, 0)
    entry = (ROOT / "tests/ingame_controls_render_probe.ml").read_text(encoding="utf-8")
    if entry.count(ENTRY)!=1:
        raise RuntimeError("Replay entry point changed; review test-only callStats insertion")
    probe = out / "profile_replay.ml"
    probe.write_text(entry.replace(ENTRY, REPORT), encoding="utf-8", newline="\n")
    binary = out / "profile_replay.exe"
    compiler_root = ROOT / "build/toolchains/MiniLang-1.3.9/MiniLangCompilerML-1.3.9-windows-x64"
    compiler = compiler_root / "mlc.exe"
    if not compiler.is_file():
        compiler, compiler_root = prepare_compiler()
    if digest(compiler)!=COMPILER_SHA256:
        raise RuntimeError("Pinned MiniLang 1.3.9 compiler hash mismatch")
    inputs = minilang_inputs(probe, compiler)
    inputs["generated_app"] = digest(generated)
    inputs["profile_flags"] = [*PLAYABLE_RUNTIME_FLAGS, "--profile-calls"]
    stamp = out / "compile.inputs.json"
    with build_file_lock(ROOT / "build/release-build.lock"):
        if not args.reuse_build or not binary.is_file() or not stamp.is_file() or json.loads(stamp.read_text(encoding="utf-8"))!=inputs:
            run([compiler, probe, binary, "-I", out / "modules", "-I", ROOT / "src", "-I", compiler_root,
                 *PLAYABLE_RUNTIME_FLAGS, "--profile-calls"], ROOT / "build", log=out / "compile.log", timeout=900)
            if minilang_inputs(probe, compiler)!= {key: value for key, value in inputs.items()
                                                    if key not in ("generated_app", "profile_flags")} or digest(generated)!=inputs["generated_app"]:
                raise RuntimeError("MiniLang source changed during instrumented compilation")
            stamp.write_text(json.dumps(inputs, indent=2) + "\n", encoding="utf-8")
    if digest(app)!=app_hash:
        raise RuntimeError("Productive replay source changed during compilation")
    qvms = ROOT / "build/reference/qvms"
    if not all((qvms / name).is_file() for name in ("ui.qvm", "qagame.qvm", "cgame.qvm")):
        raise RuntimeError("Original QVM files missing under build/reference/qvms")
    archive = archive_path(args.data_root.resolve())
    env = os.environ.copy()
    env["MQ3_RENDERER"] = "hardware"
    command = [str(binary), str(archive), str(qvms), "moving", str(args.frames),
               "q3dm0", "1", str(args.fixed_step_ms)]
    result = subprocess.run(command, cwd=ROOT / "build", env=env,
                            capture_output=True, text=True, errors="replace", timeout=900)
    log = result.stdout + result.stderr
    (out / f"run_{args.frames}.log").write_text(log, encoding="utf-8")
    (out / "run.log").write_text(log, encoding="utf-8")
    if result.returncode or f"frames={args.frames}" not in log or "Error occured:" in log:
        raise RuntimeError(f"instrumented replay failed ({result.returncode}); see {out / 'run.log'}")
    calls = {}
    for name, count in re.findall(r"^\[call-profile\] name=(\S+) calls=(\d+)$", log, re.MULTILINE):
        calls[name] = int(count)
    if not calls:
        raise RuntimeError("callStats() returned no nonzero function counters")
    summary = {"frames": args.frames, "fixed_step_ms": args.fixed_step_ms,
               "binary_sha256": digest(binary), "compiler": "published 1.3.9",
               "instrumented": True, "scope": "call counts only, not FPS",
               "functions": sorted(calls.items(), key=lambda pair: pair[1], reverse=True)}
    (out / f"summary_{args.frames}.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    (out / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: {len(calls)} instrumented MiniLang functions; {out / 'summary.json'}")
    for name, count in summary["functions"][:20]:
        print(f"  {name}: {count}")


if __name__ == "__main__":
    main()
