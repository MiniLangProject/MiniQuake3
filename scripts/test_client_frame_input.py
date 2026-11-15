"""Productive client-frame commands: unchanged-C ABI, input/routing and real QVM gates."""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import subprocess
import sys

from build import build_file_lock, build_native, native_build_lock, minilang_inputs, valid_minilang_cache
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def write_app_input_module(out: Path) -> Path:
    """Compile exact app functions headlessly; no copied engine or alternate logic."""
    app = ROOT / "src/mq3/client/qvm_preview_app.ml"
    text = app.read_text(encoding="utf-8")
    imports = [line for line in text.splitlines() if line.startswith("import ") and
               line.rsplit(" as ", 1)[-1] in {"match", "frameInput", "cgameVm", "uiSession", "consoleInput", "window", "cgameClock"}]
    if len(imports) != 7:
        raise RuntimeError("productive app input dependencies changed")
    bridge = next(line for line in text.splitlines() if line.startswith("struct ClientInputBridge "))
    functions = text[text.index("function queueExpandedInput("):text.index("function consoleColor(")]
    draw = text[text.index("function drawFrame("):text.index("function uploadLightmaps(")]
    failure = next(line for line in text.splitlines() if line.startswith("function fail("))
    module = out / "modules/mq3/tests/client_frame_routing.ml"
    module.parent.mkdir(parents=True, exist_ok=True)
    module.write_text("// Exact productive app input functions for headless regression.\n"
                      "package mq3.tests.client_frame_routing\n" + "\n".join(imports) + "\n" +
                      bridge + "\n" + functions + failure + "\n" + draw,
                      encoding="utf-8", newline="\n")
    loop = text.split("while not window.shouldClose() and not quitRequested and (maxFrames<0 or frames<maxFrames)", 1)[1]
    server = loop.split("while simulationTime+50<=serverTime", 1)[1].split("end while", 1)[0]
    if "frameInput.finish(" in server or "submitUsercmd" in server:
        raise RuntimeError("local command generation regressed into the20Hz server loop")
    if loop.index("frameInput.finish(") > loop.index("drawnFrame=drawFrame("):
        raise RuntimeError("CL_SendCmd must precede CL_SetCGameTime/drawFrame")
    if 'state.context.soundCommands=[]' in draw:
        raise RuntimeError("Cgame draw discards early UI input sounds")
    if "refreshUiFrame(ui,serverTime)" not in loop or "uiSession.frame(ui,serverTime)" in loop:
        raise RuntimeError("productive UI input is duplicated by polling")
    return module


def compile_test(source: str, name: str, out: Path) -> Path:
    executable = out / (name + ".exe")
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    stamp = executable.with_suffix(".inputs.json")
    inputs = minilang_inputs(ROOT / source, compiler)
    inputs["generated_app_input"] = sha(out / "modules/mq3/tests/client_frame_routing.ml")
    with build_file_lock(executable.with_suffix(".build.lock")):
        if not valid_minilang_cache(executable, stamp, inputs):
            run([compiler, ROOT / source, executable,
                 "-I", out / "modules", "-I", ROOT / "src", "-I", ROOT / "artifacts/toolchain",
                 "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                ROOT / "build", log=out / (name + "-build.log"), timeout=900)
            current = minilang_inputs(ROOT / source, compiler)
            current["generated_app_input"] = sha(out / "modules/mq3/tests/client_frame_routing.ml")
            if current != inputs:
                raise RuntimeError("Input gate sources changed during compilation; rerun against a frozen source")
            stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(executable)}, indent=2) + "\n", encoding="utf-8")
    return executable


def retail_archive(data_root: Path) -> Path:
    for candidate in (data_root / "baseq3/pak0.pk3", data_root / "pak0.pk3", data_root / "Quake3/baseq3/pak0.pk3"):
        if candidate.is_file():
            return candidate.resolve()
    raise RuntimeError("Retail pak0.pk3 missing under: " + str(data_root))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/client_frame_input"
    out.mkdir(parents=True, exist_ok=True)
    generated = write_app_input_module(out)
    with native_build_lock(ROOT / "build"):
        build_native(ROOT / "build", msvc_env("x64"))
    core_exe = compile_test("tests/client_frame_input_contracts.ml", "contracts", out)
    core = run([core_exe], ROOT / "build", log=out / "contracts.log").strip()
    if core != "PASS: 95 client-frame input contracts":
        raise RuntimeError(core)
    route_exe = compile_test("tests/client_frame_input_routing_contracts.ml", "routing", out)
    routing = run([route_exe], ROOT / "build", log=out / "routing.log").strip()
    if routing != "PASS: 29 exact productive app routing contracts":
        raise RuntimeError(routing)
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c"
    (out / "cl_input_complete_under_test.inc").write_text(extract(original,
        ["IN_KeyDown", "IN_KeyUp", "CL_KeyState", "CL_MouseEvent", "CL_JoystickEvent", "CL_CmdButtons", "CL_FinishMove"]),
        encoding="utf-8", newline="\n")
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", f"/I{out}", ROOT / "tests/reference/cl_input_complete_oracle.c",
         f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    oracle_exe = compile_test("tests/client_frame_input_oracle.ml", "oracle_mini", out)
    mini = run([oracle_exe], ROOT / "build", log=out / "oracle-mini.log")
    if native != mini or "finish|5|123456|16384|57344|0\n" not in mini or "oddHalf|2\n" not in mini:
        raise RuntimeError("original unmasked usercmd_t.intAngles/key-up mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    retail = None
    if args.data_root:
        qvms = ROOT / "build/reference/qvms"
        if not all((qvms / name).is_file() for name in ("qagame.qvm", "cgame.qvm", "ui.qvm")):
            subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
        retail_exe = compile_test("tests/client_frame_input_retail_probe.ml", "retail", out)
        retail = run([retail_exe, retail_archive(args.data_root.resolve()), qvms], ROOT / "build",
                     log=out / "retail.log", timeout=300).strip()
        if not retail.startswith("PASS: ") or "Retail client-frame contracts" not in retail:
            raise RuntimeError(retail)
    sources = [ROOT / "src/mq3/client/qvm_frame_input.ml", ROOT / "src/mq3/client/input_command.ml",
               ROOT / "src/mq3/client/qvm_preview_app.ml", ROOT / "src/mq3/engine/local_qvm_match.ml",
               original, ROOT / "tests/reference/cl_input_complete_oracle.c", generated,
               *(ROOT / ("tests/client_frame_input_" + suffix + ".ml") for suffix in
                 ("contracts", "routing_contracts", "oracle", "retail_probe"))]
    report = {"passed": True, "contracts": 95, "routing_contracts": 29,
              "original_c_records": len(native.splitlines()), "retail": retail,
              "scope": "One command/ClientThink per client frame;20Hz authoritative snapshots; previous CG command time; real4ms Cgame camera; subtick input; teleport deltas; local/bot ring separation; ordered UI/console/cgame routing; early UI sounds; delegated zoom forced release;12 live Controls cvars;unsigned16 values in32-bit VM usercmd angles.",
              "remaining": "Full native pause lifecycle, non-default joystick devices and complete online protocol/gameplay acceptance remain separate integration gates.",
              "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources}}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(core)
    print(routing)
    print("PASS: " + str(len(native.splitlines())) + " exact unchanged-C int-angle/key timing records")
    if retail:
        print(retail)


if __name__ == "__main__":
    main()
