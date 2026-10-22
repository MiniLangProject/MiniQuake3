#!/usr/bin/env python3
"""Complete tr_bsp.c surface, unchanged-C differentials and Retail world load."""
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


def retail_bsp(data_root: Path, output: Path) -> Path:
    base = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    for archive in sorted(base.glob("*.pk3")):
        with zipfile.ZipFile(archive) as pak:
            try:
                body = pak.read("maps/q3dm1.bsp")
            except KeyError:
                continue
            output.write_bytes(body)
            return output
    raise RuntimeError(f"Retail maps/q3dm1.bsp missing below {base}")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = ap.parse_args()
    out = ROOT / "build/reference/tr_bsp_complete"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/renderer/tr_bsp.c")
    facade = ROOT / "src/mq3/renderer/tr_bsp_runtime.ml"
    source = facade.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"] if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", source)]
    if missing:
        raise RuntimeError("missing tr_bsp facade symbols: " + ", ".join(missing))

    contracts_exe = build("tests/tr_bsp_complete_contracts.ml", "tr_bsp_complete_contracts.exe")
    contracts = run([contracts_exe], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 25 complete tr_bsp contracts":
        raise RuntimeError(contracts)

    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_bsp.c"
    extracted = extract(original, ["HSVtoRGB", "R_ColorShiftLightingBytes", "R_MergedWidthPoints", "R_MergedHeightPoints"])
    (out / "tr_bsp_complete_under_test.inc").write_text(extracted, encoding="utf-8", newline="\n")
    oracle = out / "oracle.exe"
    harness = ROOT / "tests/reference/tr_bsp_complete_oracle.c"
    run(["cl", "/nologo", "/Od", "/MT", "/W4", "/WX", "/wd4244", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    mini_exe = build("tests/tr_bsp_complete_oracle.ml", "tr_bsp_complete_oracle.exe")
    mini = run([mini_exe], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("tr_bsp unchanged-C mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    bsp_path = retail_bsp(args.data_root.resolve(), out / "q3dm1.bsp")
    retail_exe = build("tests/tr_bsp_retail_probe.ml", "tr_bsp_retail_probe.exe")
    retail = run([retail_exe, bsp_path], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not retail.startswith("PASS: retail tr_bsp world "):
        raise RuntimeError(retail)

    files = [original, facade, harness, ROOT / "tests/tr_bsp_complete_oracle.ml", ROOT / "tests/tr_bsp_complete_contracts.ml", ROOT / "tests/tr_bsp_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(entry["symbol_candidates"]),
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 25,
        "retail": retail,
        "retail_bsp_sha256": sha(bsp_path),
        "scope": "All tr_bsp.c ledger symbols through a C-named MiniLang facade; checked BSP46 shader/lightmap/plane/fog/surface/mark/node/leaf/model/PVS/entity/light-grid loading; planar, patch, triangle-soup and flare parsing; shared patch LOD propagation and crack stitching; unchanged-C HSV, overbright and merged-edge behavior; Retail q3dm1 retained-world acceptance.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['symbols']} tr_bsp symbols / {result['unchanged_c_records']} unchanged-C records / {result['contracts']} native contracts / Retail q3dm1 world")


if __name__ == "__main__":
    main()
