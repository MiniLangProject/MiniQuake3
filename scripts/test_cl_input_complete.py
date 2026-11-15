"""Full-file differential, native, retail, and symbol gate for client/cl_input.c."""
from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


SYMBOLS = [
    "CL_AdjustAngles", "CL_CmdButtons", "CL_CreateCmd", "CL_CreateNewCommands",
    "CL_FinishMove", "CL_InitInput", "CL_JoystickEvent", "CL_JoystickMove",
    "CL_KeyMove", "CL_KeyState", "CL_MouseEvent", "CL_MouseMove",
    "CL_ReadyToSendPacket", "CL_SendCmd", "CL_WritePacket", "IN_BackDown",
    "IN_BackUp", "IN_Button0Down", "IN_Button0Up", "IN_Button10Down",
    "IN_Button10Up", "IN_Button11Down", "IN_Button11Up", "IN_Button12Down",
    "IN_Button12Up", "IN_Button13Down", "IN_Button13Up", "IN_Button14Down",
    "IN_Button14Up", "IN_Button15Down", "IN_Button15Up", "IN_Button1Down",
    "IN_Button1Up", "IN_Button2Down", "IN_Button2Up", "IN_Button3Down",
    "IN_Button3Up", "IN_Button4Down", "IN_Button4Up", "IN_Button5Down",
    "IN_Button5Up", "IN_Button6Down", "IN_Button6Up", "IN_Button7Down",
    "IN_Button7Up", "IN_Button8Down", "IN_Button8Up", "IN_Button9Down",
    "IN_Button9Up", "IN_ButtonDown", "IN_ButtonUp", "IN_CenterView",
    "IN_DownDown", "IN_DownUp", "IN_ForwardDown", "IN_ForwardUp",
    "IN_KeyDown", "IN_KeyUp", "IN_LeftDown", "IN_LeftUp",
    "IN_LookdownDown", "IN_LookdownUp", "IN_LookupDown", "IN_LookupUp",
    "IN_MLookDown", "IN_MLookUp", "IN_MoveleftDown", "IN_MoveleftUp",
    "IN_MoverightDown", "IN_MoverightUp", "IN_RightDown", "IN_RightUp",
    "IN_SpeedDown", "IN_SpeedUp", "IN_StrafeDown", "IN_StrafeUp",
    "IN_UpDown", "IN_UpUp",
]


def build_and_run(source: str, output: str, *args: str) -> str:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return run([ROOT / "build" / output, *args], ROOT / "build")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path(os.environ.get("MQ3_DATA_ROOT", "D:/Quake3")))
    args = parser.parse_args()
    data_root = args.data_root.resolve()
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c"
    module = ROOT / "src/mq3/client/cl_input.ml"
    module_text = module.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if f"function {name}(" not in module_text]
    if missing:
        raise RuntimeError("missing cl_input file symbols: " + ", ".join(missing))
    if len(SYMBOLS) != 78 or len(set(SYMBOLS)) != 78:
        raise RuntimeError("cl_input symbol inventory drift")

    out = ROOT / "build/reference/cl_input_complete"
    out.mkdir(parents=True, exist_ok=True)
    oracle_names = [
        "IN_KeyDown", "IN_KeyUp", "CL_KeyState", "CL_MouseEvent",
        "CL_JoystickEvent", "CL_CmdButtons", "CL_FinishMove",
    ]
    (out / "cl_input_complete_under_test.inc").write_text(
        extract(original, oracle_names), encoding="utf-8", newline="\n"
    )
    harness = ROOT / "tests/reference/cl_input_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"],
        out,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    mini = build_and_run("tests/cl_input_complete_oracle.ml", "cl_input_complete_oracle.exe")
    if native != mini:
        raise RuntimeError("unchanged client/cl_input.c mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    contracts = build_and_run("tests/cl_input_complete_contracts.ml", "cl_input_complete_contracts.exe").strip()
    if contracts != "PASS: 31 complete cl_input contracts":
        raise RuntimeError(contracts)

    retail = build_and_run("tests/cl_input_retail_probe.ml", "cl_input_retail_probe.exe", str(data_root)).strip()
    if not retail.startswith("PASS: retail cgame.qvm "):
        raise RuntimeError(retail)

    files = [
        original, module, harness,
        ROOT / "tests/cl_input_complete_oracle.ml",
        ROOT / "tests/cl_input_complete_contracts.ml",
        ROOT / "tests/cl_input_retail_probe.ml",
    ]
    report = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 31,
        "retail": retail,
        "data_root": str(data_root),
        "scope": "All cl_input.c entry points, dual-source buttons, command registration, mouse/joystick routing, command construction, command ring, packet pacing, reliable/delta packet writing and transmit callbacks.",
        "host_boundary": "Window event production, UI/cgame VM mouse calls, diagnostics and UDP transmission remain typed injectable host services; the native state and packet policy are deterministic.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(SYMBOLS)} cl_input symbols + {len(native.splitlines())} unchanged-C records + 31 contracts + retail probe")


if __name__ == "__main__":
    main()
