"""Private trace flags and sparse area-list storage with exact legacy order."""
import json
import os
import re
from pathlib import Path
from build import build_file_lock, minilang_inputs, valid_minilang_cache
from inventory import sha
from toolchain import ROOT, run


def extract(source, name):
    match = re.search(r"^function " + name + r"\(", source, re.M)
    if not match:
        raise RuntimeError("productive function missing: " + name)
    end = source.index("\nend function", match.start()) + len("\nend function")
    return source[match.start():end]


def main():
    out = ROOT / "build/reference/trace_query_storage"
    folder = out / "modules/mq3/tests"
    folder.mkdir(parents=True, exist_ok=True)
    collision = ROOT / "src/mq3/collision/world.ml"
    spatial = ROOT / "src/mq3/server/world.ml"
    legacy = ROOT / "tests/reference/trace_query_storage_legacy.ml"
    source = ROOT / "tests/trace_query_storage_contracts.ml"
    # Pull the actual private-storage arguments from the productive Work
    # constructor; replacing byte flags with the old arrays must fail this gate.
    text = collision.read_text(encoding="utf-8")
    constructor = next(line for line in text.splitlines() if line.strip().startswith("work = Work("))
    flags = re.search(r",point,(.+),curves\)", constructor)
    if not flags:
        raise RuntimeError("productive Work constructor changed")
    area = extract(spatial.read_text(encoding="utf-8"), "areaEntities")
    area = area.replace("function areaEntities(", "function productiveAreaEntities(", 1)
    blocks = ["package mq3.tests.trace_query_storage", "import mq3.collision.world as cm",
              "import std.array as arrays", "import std.ds.list as spatialAreaLists",
              "function productiveSeenFlags(world) return [" + flags[1] + "] end function",
              area, legacy.read_text(encoding="utf-8")]
    generated = folder / "trace_query_storage.ml"
    generated.write_text("\n\n".join(blocks) + "\n", encoding="utf-8", newline="\n")
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    executable = out / "contracts.exe"
    stamp = out / "contracts.inputs.json"
    inputs = minilang_inputs(source, compiler)
    inputs["generated"] = sha(generated)
    inputs["legacy"] = sha(legacy)
    with build_file_lock(out / "contracts.build.lock"):
        if not valid_minilang_cache(executable, stamp, inputs):
            run([compiler, source, executable, "-I", out / "modules", "-I", ROOT / "src",
                 "-I", ROOT / "artifacts/toolchain", "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                ROOT / "build", log=out / "compile.log", timeout=900)
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n")
    env = os.environ.copy()
    env["PATH"] = str(ROOT / "build") + os.pathsep + env.get("PATH", "")
    result = run([executable], ROOT / "build", env=env, log=out / "result.log").strip()
    measured = re.fullmatch(r"PASS: 23 trace query storage contracts flagBytes=(\d+) legacyFlagBytes=(\d+) areaBytes=(\d+) legacyAreaBytes=(\d+)", result)
    if not measured:
        raise RuntimeError(result)
    report = {"passed": True, "contracts": 23, "result": result,
              "allocation_probe": dict(zip(("flags", "legacy_flags", "area", "legacy_area"), map(int, measured.groups()))),
              "scope": "Actual Work-constructor storage expressions, actual throughLeaf byte writes/duplicate suppression, independent query storage and actual area-list capacity/order versus frozen legacy including geometric growth.",
              "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in (collision, spatial, legacy, source, Path(__file__).resolve())},
              "binary_sha256": sha(executable)}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(result)


if __name__ == "__main__":
    main()
