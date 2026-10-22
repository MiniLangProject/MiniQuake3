#!/usr/bin/env python3
"""Complete tr_cmds.c facade, unchanged-C, native and Retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run

EXPECTED = [
    "RE_BeginFrame", "RE_EndFrame", "RE_SetColor", "RE_StretchPic",
    "R_AddDrawSurfCmd", "R_GetCommandBuffer", "R_InitCommandBuffers",
    "R_IssueRenderCommands", "R_PerformanceCounters",
    "R_ShutdownCommandBuffers", "R_SyncRenderThread",
]


def invoke(name: str, *arguments: object) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name, *map(str, arguments)], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_cmds.c"
    facade = ROOT / "src/mq3/renderer/tr_cmds_runtime.ml"
    text = facade.read_text(encoding="utf-8")
    missing = [name for name in EXPECTED if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", text)]
    if missing:
        raise RuntimeError("missing tr_cmds facade symbols: " + ", ".join(missing))

    invoke("test_renderer_commands.py")
    invoke("build.py", "--source", "tests/tr_cmds_complete_contracts.ml", "--output", "tr_cmds_complete_contracts.exe")
    contracts = run([ROOT / "build/tr_cmds_complete_contracts.exe"], ROOT / "build").strip()
    if contracts != "PASS: 37 complete tr_cmds contracts":
        raise RuntimeError(contracts)
    invoke("test_qvm_2d_batch.py")

    retail = "not requested"
    if args.data_root:
        base = args.data_root.resolve()
        if (base / "baseq3").is_dir():
            base = base / "baseq3"
        pak = base / "pak0.pk3"
        if not pak.is_file():
            raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
        qvms = ROOT / "build/reference/qvms"
        if not (qvms / "cgame.qvm").is_file() or not (qvms / "ui.qvm").is_file():
            invoke("build_qvms.py")
        output = subprocess.run(
            [sys.executable, ROOT / "scripts/test_qvm_2d_retail.py", "--pak", pak, "--qvms", qvms],
            cwd=ROOT, check=True, text=True, capture_output=True, timeout=600,
        ).stdout.strip()
        result = output.splitlines()[-1] if output else ""
        if not result.startswith("PASS: retail QVM 2D "):
            raise RuntimeError(result)
        retail = result

    if args.full_regression:
        invoke("test_qvm_renderer_traps.py")

    previous = json.loads((ROOT / "build/reference/renderer_commands/result.json").read_text(encoding="utf-8"))
    files = [source, facade, ROOT / "src/mq3/renderer/command_queue.ml", ROOT / "tests/tr_cmds_complete_contracts.ml"]
    report = {
        "passed": True,
        "symbols": len(EXPECTED),
        "unchanged_c_records": previous["records"],
        "contracts": 37,
        "qvm_2d_contracts": 32,
        "retail": retail,
        "scope": "All tr_cmds.c symbols: command budgeting and snapshots, frame begin/end, stereo buffers, overdraw/texture/gamma transitions, performance counters, synchronous and SMP issue/sync/shutdown lifecycle, and productive 2D/QVM command submission.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/tr_cmds_complete"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(EXPECTED)}/{len(EXPECTED)} tr_cmds symbols + {previous['records']} unchanged-C records + 37 native contracts + 32 QVM 2D contracts")


if __name__ == "__main__":
    main()
