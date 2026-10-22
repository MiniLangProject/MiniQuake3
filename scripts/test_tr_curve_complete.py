#!/usr/bin/env python3
"""Complete tr_curve.c source, unchanged-C, native and Retail gate."""
import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def retail_bsp(data_root: Path, output: Path) -> tuple[Path, int]:
    base = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    maps = 0; selected = None
    for archive in sorted(base.glob("*.pk3")):
        with zipfile.ZipFile(archive) as pak:
            names = [name for name in pak.namelist() if name.lower().endswith(".bsp")]; maps += len(names)
            if selected is None and "maps/q3dm1.bsp" in names:
                output.write_bytes(pak.read("maps/q3dm1.bsp")); selected = output
    if selected is None: raise RuntimeError(f"Retail maps/q3dm1.bsp missing below {base}")
    return selected, maps


def invoke(name: str, *arguments: str) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name, *arguments], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser(); parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3")); parser.add_argument("--full-regression", action="store_true"); args = parser.parse_args()
    out = ROOT / "build/reference/tr_curve_complete"; out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8")); entry = next(item for item in ledger["files"] if item["source"] == "code/renderer/tr_curve.c")
    facade = ROOT / "src/mq3/renderer/tr_curve_runtime.ml"; text = facade.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"] if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", text)]
    if missing: raise RuntimeError("missing tr_curve facade symbols: " + ", ".join(missing))
    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_curve.c"; functions = ["LerpDrawVert", "Transpose", "InvertCtrl", "InvertErrorTable", "PutPointsOnCurve"]
    (out / "tr_curve_complete_under_test.inc").write_text(extract(original, functions), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/tr_curve_complete_oracle.c"; oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log"); mini = run([build("tests/tr_curve_complete_oracle.ml", "tr_curve_complete_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if native != mini: raise RuntimeError("tr_curve unchanged-C mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    contracts = run([build("tests/tr_curve_complete_contracts.ml", "tr_curve_complete_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if not re.fullmatch(r"PASS: \d+ complete tr_curve contracts", contracts): raise RuntimeError(contracts)
    contract_count = int(contracts.split()[1]); bsp_path, retail_maps = retail_bsp(args.data_root.resolve(), out / "q3dm1.bsp")
    retail = run([build("tests/tr_curve_retail_probe.ml", "tr_curve_retail_probe.exe"), bsp_path], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not retail.startswith("PASS: retail tr_curve "): raise RuntimeError(retail)
    if args.full_regression:
        invoke("test_bsp_render_data.py", "--data-root", str(args.data_root.resolve()))
        invoke("test_world_surface_selection.py", "--data-root", str(args.data_root.resolve()))
        invoke("test_surface_grid.py")
    files = [original, facade, harness, ROOT / "tests/tr_curve_complete_oracle.ml", ROOT / "tests/tr_curve_complete_contracts.ml", ROOT / "tests/tr_curve_retail_probe.ml"]
    result = {"passed": True, "symbols": len(entry["symbol_candidates"]), "unchanged_c_records": len(native.splitlines()), "contracts": contract_count, "retail": retail, "retail_bsp_maps": retail_maps, "retail_bsp_sha256": sha(bsp_path), "scope": "All tr_curve.c symbols over productive BSP RenderVertex records: exact vertex interpolation/transposition/inversion/on-curve placement, seam-aware normals, adaptive two-axis subdivision, collinear removal, longest-strip orientation, LOD error tables and row/column stitching with preserved LOD groups.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['symbols']}/{result['symbols']} tr_curve symbols + {result['unchanged_c_records']} unchanged-C records + {contract_count} native contracts + {retail_maps} Retail BSP maps")


if __name__ == "__main__": main()
