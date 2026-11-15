"""Exact productive collision traversal versus the frozen pre-fix DFS."""
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
        raise RuntimeError("productive traversal function missing: " + name)
    end = source.index("\nend function", match.start()) + len("\nend function")
    return source[match.start():end]


def main():
    out = ROOT / "build/reference/collision_frontier"
    folder = out / "modules/mq3/tests"
    folder.mkdir(parents=True, exist_ok=True)
    source = ROOT / "src/mq3/collision/world.ml"
    legacy = ROOT / "tests/reference/collision_frontier_legacy.ml"
    text = source.read_text(encoding="utf-8")
    blocks = ["package mq3.tests.collision_frontier", "import mq3.compat.numeric as n",
              "import mq3.shared.math as q", "import mq3.qcommon.headers as qcommonHeaders",
              "import std.array as arrays", "import std.ds.list as worldTraceLists",
              "function throughLeaf(work,leaf,position) work.visits.add([leaf.id,position]);if leaf.id==work.stopLeaf then work.trace.fraction=0.0;work.trace.allsolid=true end if;return void end function"]
    for name in ("min", "max", "boxSide", "interpolate"):
        blocks.append(extract(text, name))
    for name in ("throughTree", "positionTest"):
        function = extract(text, name)
        if name == "throughTree":
            # Observe local capacity/frontier only; all branches and leaf order
            # remain the exact productive source rather than a copied engine.
            function = function.replace("item = stack.pop()", "if stack.len()>work.peakPending then work.peakPending=stack.len() end if\n    item = stack.pop()")
            function = function.replace("  return void\nend function", "  work.peakCapacity=stack.cap\n  return void\nend function")
            if "work.peakCapacity=stack.cap" not in function:
                raise RuntimeError("productive DFS shape changed; update instrumentation")
        blocks.append(function)
    blocks.append(legacy.read_text(encoding="utf-8"))
    generated = folder / "collision_frontier.ml"
    generated.write_text("\n\n".join(blocks) + "\n", encoding="utf-8", newline="\n")
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    test = ROOT / "tests/collision_frontier_contracts.ml"
    executable = out / "contracts.exe"
    stamp = out / "contracts.inputs.json"
    inputs = minilang_inputs(test, compiler)
    inputs["generated"] = sha(generated)
    inputs["legacy"] = sha(legacy)
    with build_file_lock(out / "contracts.build.lock"):
        if not valid_minilang_cache(executable, stamp, inputs):
            run([compiler, test, executable, "-I", out / "modules", "-I", ROOT / "src",
                 "-I", ROOT / "artifacts/toolchain", "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                ROOT / "build", log=out / "compile.log", timeout=900)
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n")
    env = os.environ.copy()
    env["PATH"] = str(ROOT / "build") + os.pathsep + env.get("PATH", "")
    result = run([executable], ROOT / "build", env=env, log=out / "result.log").strip()
    measured = re.fullmatch(r"PASS: 35 exact collision frontier contracts newTraceBytes=(\d+) legacyTraceBytes=(\d+)", result)
    if not measured:
        raise RuntimeError(result)
    report = {"passed": True, "contracts": 35, "result": result,
              "allocation_probe": {"new_trace_bytes": int(measured[1]), "legacy_trace_bytes": int(measured[2])},
              "scope": "Exact productive DFS leaf order/pruning against frozen legacy, depth80 frontier grows beyond32, BSP4096 nodes with narrow frontier retains32 slots, popped references cleared and per-call ownership.",
              "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in (source, legacy, test, Path(__file__).resolve())},
              "binary_sha256": sha(executable)}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(result)


if __name__ == "__main__":
    main()
