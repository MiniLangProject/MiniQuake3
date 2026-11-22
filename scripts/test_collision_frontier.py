"""Exact productive collision traversal versus the frozen pre-fix DFS."""
import ctypes
import json
import os
import re
import struct
from pathlib import Path
from build import build_file_lock, build_native, native_build_lock, minilang_inputs, valid_minilang_cache
from inventory import sha
from toolchain import ROOT, msvc_env, run


def extract(source, name):
    match = re.search(r"^function " + name + r"\(", source, re.M)
    if not match:
        raise RuntimeError("productive traversal function missing: " + name)
    end = source.index("\nend function", match.start()) + len("\nend function")
    return source[match.start():end]


def check_segment_kernel():
    # The former traversal rounded each scalar op to binary32, except the
    # epsilon expressions. Check all four packed lanes as bytes, including
    # untouched intervals and guard regions around a nonzero stack offset.
    dll = ctypes.CDLL(str(ROOT / "build/miniquake3_qvm.dll"))
    step = dll.mq3_trace_segment_step
    step.argtypes = [ctypes.c_void_p, *([ctypes.c_int] * 3), *([ctypes.c_double] * 5)]
    step.restype = ctypes.c_int

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    def pack(point):
        return struct.pack("<4f", *point)

    cases = 0
    for axis, normal in enumerate(((1, 0, 0), (0, 1, 0), (0, 0, 1), (0.6, -0.8, 0))):
        for extent in (0, 0.5, 2048):
            for first, last in ((-15, 20), (20, -15), (1, 1), (-8, -8), (-0.125, 0.125),
                                (1, 0.99999994), (16777216, 0.25), (-16777216, -0.25)):
                start = tuple(map(f32, (first, -first, first * 0.75, 0.0625)))
                end = tuple(map(f32, (last, -last, last * 0.75, 0.9375)))
                plane_distance = 0.0 if axis % 2 == 0 else -3.5

                def distance(point):
                    if axis < 3:
                        return f32(point[axis] - plane_distance)
                    x, y, z = (f32(f32(n) * v) for n, v in zip(normal, point))
                    return f32(f32(f32(x + y) + z) - plane_distance)

                d1, d2 = distance(start), distance(end)
                expected = bytearray(b"!" * 96)
                expected[16:48] = pack(start) + pack(end)
                data = (ctypes.c_ubyte * 96).from_buffer_copy(expected)
                if min(d1, d2) >= extent + 1:
                    side = 0
                elif max(d1, d2) < -extent - 1:
                    side = 1
                else:
                    side = 3 if d1 < d2 else 2
                    near, far = 1, 0
                    if d1 != d2:
                        inverse = f32(1 / f32(d1 - d2))
                        signed = -extent if d1 < d2 else extent
                        near = f32((f32(d1 + signed) + 0.125) * inverse)
                        far = f32((f32(d1 - signed) + (0.125 if d1 < d2 else -0.125)) * inverse)
                    def interpolate(fraction):
                        t = max(0, min(1, fraction))
                        return pack(f32(a + f32(f32(b - a) * t)) for a, b in zip(start, end))
                    expected[16:32] = interpolate(far)
                    expected[48:80] = pack(start) + interpolate(near)
                actual = step(data, len(data), 16, axis, *normal, plane_distance, extent)
                if actual != side or bytes(data) != expected:
                    raise RuntimeError(f"trace split mismatch: {axis=} {extent=} {first=} {last=}")
                cases += 1
    for size, offset, axis in ((63, 0, 0), (64, 1, 0), (64, -1, 0), (64, 0, 4)):
        data = ctypes.create_string_buffer(b"!" * 64)
        before = bytes(data)
        if step(data, size, offset, axis, 1, 0, 0, 0, 0) != -1 or bytes(data) != before:
            raise RuntimeError("invalid trace segment span modified the buffer")
        cases += 1
    return cases


def main():
    with native_build_lock(ROOT / "build"):
        build_native(ROOT / "build", msvc_env("x64"))
    segment_cases = check_segment_kernel()
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
    blocks.append(next(line for line in text.splitlines() if line.startswith("extern function traceSegmentStep(")))
    for name in ("min", "max", "boxSide", "interpolate"):
        blocks.append(extract(text, name))
    for name in ("throughTree", "positionTest"):
        function = extract(text, name)
        if name == "throughTree":
            # Observe local capacity/frontier only; all branches and leaf order
            # remain the exact productive source rather than a copied engine.
            pop = "num=stack.pop()"
            if function.count(pop) != 1:
                raise RuntimeError("productive DFS pop changed; update instrumentation")
            function = function.replace(pop, "if stack.len()>work.peakPending then work.peakPending=stack.len() end if\n    " + pop, 1)
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
    report = {"passed": True, "contracts": 35, "segment_cases": segment_cases, "result": result,
              "allocation_probe": {"new_trace_bytes": int(measured[1]), "legacy_trace_bytes": int(measured[2])},
              "scope": "Exact productive DFS leaf order/pruning against frozen legacy, depth80 frontier grows beyond32, BSP4096 nodes with narrow frontier retains32 slots and no pending branch, popped references cleared and per-call ownership.",
              "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in (source, legacy, test, Path(__file__).resolve())},
              "binary_sha256": sha(executable)}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"{result}; {segment_cases} packed segment cases")


if __name__ == "__main__":
    main()
