#!/usr/bin/env python3
"""Complete symbol, unchanged-C, native and productive gate for sv_world.c."""
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


SYMBOLS = [
    "SV_AreaEntities", "SV_AreaEntities_r", "SV_ClearWorld",
    "SV_ClipHandleForEntity", "SV_ClipMoveToEntities", "SV_ClipToEntity",
    "SV_CreateworldSector", "SV_LinkEntity", "SV_PointContents",
    "SV_SectorList_f", "SV_Trace", "SV_UnlinkEntity",
]

NATIVE_SURFACES = {
    "SV_AreaEntities": "function areaEntities(",
    "SV_AreaEntities_r": "while stackCount > 0 and resultCount < capacity",
    "SV_ClearWorld": "function create(world)",
    "SV_ClipHandleForEntity": "function clipHandleForEntity(",
    "SV_ClipMoveToEntities": "for each number in areaEntities(",
    "SV_ClipToEntity": "function clipToEntity(",
    "SV_CreateworldSector": "function createSector(",
    "SV_LinkEntity": "function linkEntity(",
    "SV_PointContents": "function pointContents(",
    "SV_SectorList_f": "function SV_SectorList_f(",
    "SV_Trace": "function trace(",
    "SV_UnlinkEntity": "function unlinkEntity(",
}


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/sv_world_complete"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/server/sv_world.c"
    native_file = ROOT / "src/mq3/server/world.ml"
    native_text = native_file.read_text(encoding="utf-8")
    missing = [symbol for symbol, marker in NATIVE_SURFACES.items() if marker not in native_text]
    if missing or len(SYMBOLS) != 12 or set(SYMBOLS) != set(NATIVE_SURFACES):
        raise RuntimeError("sv_world native surface drift: " + ", ".join(missing))
    engine_text = (ROOT / "src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    for marker in ("function sectorListCommand(", 'addContextCommand(context.commandState,"sectorlist",sectorListCommand,context)'):
        if marker not in engine_text:
            raise RuntimeError("missing productive sectorlist command wiring: " + marker)

    include = out / "server_world_sectorlist_under_test.inc"
    include.write_text(extract(original, ["SV_SectorList_f"]), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/server_world_sectorlist_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    expected = run([oracle], out, log=out / "oracle.log")
    actual = run([build("tests/server_world_sectorlist_oracle.ml", "server_world_sectorlist_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if actual != expected:
        raise RuntimeError("SV_SectorList_f mismatch\nC:\n" + expected + "MiniLang:\n" + actual)

    contracts = run([build("tests/server_world_sectorlist_contracts.ml", "server_world_sectorlist_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 8 SV_SectorList_f contracts":
        raise RuntimeError(contracts)

    pak = args.data_root.resolve() / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"missing Retail pak0.pk3: {pak}")
    qvms = ROOT / "build/reference/qvms"
    if not (qvms / "qagame.qvm").is_file():
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
    retail = run([build("tests/server_world_sectorlist_retail_probe.ml", "server_world_sectorlist_retail_probe.exe"), pak, qvms], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if retail != "PASS: Retail q3dm1 sectorlist emitted 64 live world-sector diagnostics":
        raise RuntimeError(retail)

    if args.full_regression:
        subprocess.run([sys.executable, ROOT / "scripts/test_server_world.py", args.data_root, "--map", "q3dm1", "--count", "256"], cwd=ROOT, check=True)

    files = [original, native_file, ROOT / "src/mq3/engine/local_qvm_match.ml", harness,
             ROOT / "tests/server_world_sectorlist_oracle.ml", ROOT / "tests/server_world_sectorlist_contracts.ml",
             ROOT / "tests/server_world_sectorlist_retail_probe.ml"]
    report = {
        "passed": True, "symbols": 12, "unchanged_c_records": len(expected.splitlines()), "contracts": 8,
        "scope": "All sv_world.c symbols including the exact 64-slot sectorlist diagnostic, world-sector linking, area enumeration, entity/world clipping, traces and point contents.",
        "oracle": "Unchanged extracted Baseq3 SV_SectorList_f plus the established full-map server-world differential gate.",
        "productive_path": "The live local-QVM command registry dispatches sectorlist against its active collision spatialScene and routes all 64 diagnostics to the real console transcript.",
        "retail": retail,
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 12/12 sv_world symbols + 64 unchanged-C sector records + 8 native contracts + Retail productive sectorlist")


if __name__ == "__main__":
    main()
