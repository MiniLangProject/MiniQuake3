"""Run unchanged runtime assertions from the frozen compiler source revision.

Sources are extracted into ignored build/ with git show; this gate neither
copies newer GC features nor modifies the compiler checkout or shipping DLLs.
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

REFERENCE = "738d830fa604de884d7e488fde0991a19c034016"
CASES = ("gc_periodic_test", "gc_heap_stress", "gc_box_float_safepoint",
         "gc_float_call_roots", "gc_nested_graph_roots", "gc_reference_write_roots",
         "gc_interior_pointer_bounds", "heap_growth_precedes_gc", "tlab_shared_heap",
         "gc_back_to_back_safepoint")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", type=Path, default=ROOT / "artifacts/toolchain/build/mlc_win64.exe")
    parser.add_argument("--source-repo", type=Path, default=ROOT.parent / "MiniLangCompilerML")
    parser.add_argument("--label", default="installed")
    parser.add_argument("--only", action="append", choices=CASES, help="focused subset; omitted by the full verifier")
    args = parser.parse_args()
    if not re.fullmatch(r"[A-Za-z0-9_-]+", args.label):
        parser.error("label must contain only letters, numbers, '_' or '-'")
    compiler = args.compiler.resolve()
    verify_installed_profile(compiler)
    source_repo = args.source_repo.resolve()
    resolved = subprocess.check_output(["git", "-C", source_repo, "rev-parse", REFERENCE], text=True).strip()
    if resolved != REFERENCE:
        raise RuntimeError("frozen runtime reference revision is unavailable")
    out = ROOT / "build/reference/allocator-legacy" / args.label
    sources = out / "sources"
    sources.mkdir(parents=True, exist_ok=True)
    stdlib = ROOT / "artifacts/toolchain"
    std_hashes = {str(path.relative_to(stdlib)).replace("\\", "/"): sha(path)
                  for path in (stdlib / "std").rglob("*.ml")}
    records = []
    for name in CASES:
        if args.only and name not in args.only:
            continue
        source = sources / (name + ".ml")
        original = subprocess.check_output(["git", "-C", source_repo, "show", REFERENCE + ":tests/" + name + ".ml"])
        source.write_bytes(original)
        flags = ["--heap-reserve", "128m", "--heap-commit", "1m", "--gc-limit",
                 "64m" if name == "heap_growth_precedes_gc" else "2m"]
        executable = out / (name + ".exe")
        stamp = out / (name + ".inputs.json")
        inputs = {"reference": REFERENCE, "source": sha(source), "compiler": sha(compiler),
                  "stdlib": std_hashes, "flags": flags}
        with build_file_lock(out / (name + ".build.lock")):
            if not valid_minilang_cache(executable, stamp, inputs):
                run([compiler, source, executable, "-I", stdlib, *flags], out,
                    log=out / (name + ".compile.log"), timeout=180)
                stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n")
        output = run([executable], out, log=out / (name + ".log"), timeout=90).strip()
        records.append({"name": name, "passed": True, "source_sha256": sha(source),
                        "binary_sha256": sha(executable), "flags": flags, "output": output})
        print("PASS: unchanged runtime " + name, flush=True)
    report = {"passed": True, "full_suite": len(records) == len(CASES),
              "reference_commit": REFERENCE, "compiler_sha256": sha(compiler),
              "stdlib": std_hashes, "cases": records,
              "scope": "Unchanged old runtime assertions for periodic GC, roots, heap growth, TLAB refill/retirement and 24-thread safepoint races; not whole-game performance or full-game parity."}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
