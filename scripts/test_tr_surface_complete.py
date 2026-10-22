#!/usr/bin/env python3
"""Complete tr_surface.c facade, unchanged-C, native and Retail gate."""
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


def invoke(name: str) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name], cwd=ROOT, check=True)


def retail_probe(data_root: Path, out: Path) -> tuple[str, Path, int]:
    base = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    archives = sorted(base.glob("*.pk3"))
    destination = out / "q3dm1.bsp"
    qvm = False
    for archive in archives:
        with zipfile.ZipFile(archive) as pak:
            names = {name.lower(): name for name in pak.namelist()}
            qvm = qvm or "vm/cgame.qvm" in names
            if not destination.exists() and "maps/q3dm1.bsp" in names:
                destination.write_bytes(pak.read(names["maps/q3dm1.bsp"]))
    if not archives or not qvm or not destination.exists():
        raise RuntimeError(f"Retail baseq3 PK3, cgame.qvm or maps/q3dm1.bsp missing below {base}")
    probe = build("tests/bsp_render_data_map_probe.ml", "tr_surface_retail_probe.exe")
    result = run([probe, destination], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not result.startswith("PASS: BSP map rendered surfaces="):
        raise RuntimeError(result)
    return result, destination, len(archives)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/tr_surface_complete"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/renderer/tr_surface.c")
    facade = ROOT / "src/mq3/renderer/tr_surface_runtime.ml"
    source = facade.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"] if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", source)]
    if missing:
        raise RuntimeError("missing tr_surface facade symbols: " + ", ".join(missing))

    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_surface.c"
    (out / "tr_surface_complete_under_test.inc").write_text(extract(original, ["LodErrorForVolume"]), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/tr_surface_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    mini = run([build("tests/tr_surface_complete_oracle.ml", "tr_surface_complete_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("tr_surface unchanged-C LOD mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    contracts = run([build("tests/tr_surface_complete_contracts.ml", "tr_surface_complete_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 28 complete tr_surface contracts":
        raise RuntimeError(contracts)

    retail, retail_bsp, archive_count = retail_probe(args.data_root.resolve(), out)
    if args.full_regression:
        for script in [
            "test_surface_polychain.py", "test_surface_mesh.py", "test_surface_md3.py",
            "test_surface_grid.py", "test_surface_entities.py", "test_surface_trails.py",
            "test_surface_beam.py", "test_qvm_scene_geometry.py",
        ]:
            invoke(script)

    files = [original, facade, ROOT / "src/mq3/renderer/surface_grid.ml", harness,
             ROOT / "tests/tr_surface_complete_oracle.ml", ROOT / "tests/tr_surface_complete_contracts.ml"]
    report = {
        "passed": True,
        "symbols": len(entry["symbol_candidates"]),
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 28,
        "retail": retail,
        "retail_archives": archive_count,
        "retail_bsp_sha256": sha(retail_bsp),
        "scope": "All tr_surface.c symbols through a C-named native MiniLang facade; exact LOD-volume math; productive planar, triangle-soup, patch, polygon, MD3, sprite, beam, rail and lightning tessellation; original diagnostic/no-op/display-list edge behavior; Retail q3dm1 surface extraction.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['symbols']}/{report['symbols']} tr_surface symbols + {report['unchanged_c_records']} unchanged-C records + {report['contracts']} native contracts + Retail q3dm1")


if __name__ == "__main__":
    main()
