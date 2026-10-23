#!/usr/bin/env python3
"""Complete original-C, native, Retail and productive-path gate for cl_console.c."""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


SYMBOLS = [
    "CL_ConsolePrint", "Con_Bottom", "Con_CheckResize", "Con_ClearNotify",
    "Con_Clear_f", "Con_Close", "Con_DrawConsole", "Con_DrawInput",
    "Con_DrawNotify", "Con_DrawSolidConsole", "Con_Dump_f", "Con_Init",
    "Con_Linefeed", "Con_MessageMode2_f", "Con_MessageMode3_f",
    "Con_MessageMode4_f", "Con_MessageMode_f", "Con_PageDown", "Con_PageUp",
    "Con_RunConsole", "Con_ToggleConsole_f", "Con_Top",
]

PRODUCTIVE_WIRING = {
    "reference-space console view": ("src/mq3/client/qvm_preview_app.ml", "clientConsoleView(matchState,now,16"),
    "single output scale": ("src/mq3/client/qvm_preview_app.ml", "scaleY=height/480.0"),
    "retail background draw": ("src/mq3/client/qvm_preview_app.ml", "consoleBackground.draw(background,width,bottom+1,now)"),
    "two-pixel red separator": ("src/mq3/client/qvm_preview_app.ml", "separator+1"),
    "unshadowed console glyph": ("src/mq3/client/qvm_preview_app.ml", "color[0],color[1],color[2],false"),
    "productive scroll callback": ("src/mq3/engine/local_qvm_match.ml", "textServices.scrollFn=consoleScroll"),
    "productive demo-loop callback": ("src/mq3/engine/local_qvm_match.ml", "consoleServices.startDemoLoopFn=consoleStartDemoLoop"),
    "productive catcher synchronization": ("src/mq3/engine/local_qvm_match.ml", "runtime.uiOrCgameCatcher=runtime.keyCatchers&(clientConsole.KEYCATCH_UI|clientConsole.KEYCATCH_CGAME)"),
    "retail two-stage shader": ("src/mq3/client/baseq3_console_background.ml", "const REQUIRED_TEXTURES=2"),
}


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/cl_console_complete"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_console.c"
    facade = ROOT / "src/mq3/client/cl_console.ml"
    text = facade.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", text)]
    if missing:
        raise RuntimeError("missing cl_console facade symbols: " + ", ".join(missing))
    if len(SYMBOLS) != 22 or len(set(SYMBOLS)) != 22:
        raise RuntimeError("cl_console symbol inventory drift")
    for label, (relative, snippet) in PRODUCTIVE_WIRING.items():
        if snippet not in (ROOT / relative).read_text(encoding="utf-8"):
            raise RuntimeError(f"missing productive console wiring: {label}")

    unchanged = ["Con_ClearNotify", "Con_CheckResize", "Con_Linefeed", "CL_ConsolePrint",
                 "Con_RunConsole", "Con_PageUp", "Con_PageDown", "Con_Top", "Con_Bottom"]
    (out / "cl_console_complete_under_test.inc").write_text(extract(original, unchanged), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/cl_console_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/MT", "/W3", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    mini = run([build("tests/cl_console_complete_oracle.ml", "cl_console_complete_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("cl_console unchanged-C mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    contracts = run([build("tests/cl_console_complete_contracts.ml", "cl_console_complete_contracts.exe")], ROOT, log=out / "contracts.log").strip()
    if contracts != "PASS: 33 complete cl_console contracts":
        raise RuntimeError(contracts)

    pak = args.data_root.resolve() / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"missing Retail pak0.pk3: {pak}")
    qvms = ROOT / "build/reference/qvms"
    if not (qvms / "qagame.qvm").is_file():
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
    retail = run([build("tests/cl_console_retail_probe.ml", "cl_console_retail_probe.exe"), pak, qvms], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not retail.startswith("PASS: retail cl_console "):
        raise RuntimeError(retail)

    if args.full_regression:
        subprocess.run([sys.executable, ROOT / "scripts/test_console_input.py"], cwd=ROOT, check=True)
        subprocess.run([sys.executable, ROOT / "scripts/test_retail_qvm_match.py", "--data-root", args.data_root], cwd=ROOT, check=True)

    files = [original, facade, harness, ROOT / "src/mq3/client/console_input.ml",
             ROOT / "src/mq3/client/baseq3_console_background.ml",
             ROOT / "src/mq3/engine/local_qvm_match.ml", ROOT / "src/mq3/client/qvm_preview_app.ml",
             ROOT / "tests/cl_console_complete_oracle.ml", ROOT / "tests/cl_console_complete_contracts.ml",
             ROOT / "tests/cl_console_retail_probe.ml"]
    report = {
        "passed": True, "symbols": len(SYMBOLS), "unchanged_c_records": len(native.splitlines()),
        "contracts": 33, "productive_wiring_contracts": len(PRODUCTIVE_WIRING), "retail": retail, "retail_pak_sha256": sha(pak),
        "scope": "All cl_console.c symbols: colored circular transcript, wrapping, resize preservation, notify expiry/suppression, dump, scroll controls, animated solid console and all message modes.",
        "productive_path": "local_qvm_match routes retail VM prints and console commands through cl_console; qvm_preview_app advances and draws its solid/notify glyph model in the Windows frame loop.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 22/22 cl_console symbols + {len(native.splitlines())} unchanged-C records + 33 native contracts + {len(PRODUCTIVE_WIRING)} productive wiring contracts + Retail productive console")


if __name__ == "__main__":
    main()
