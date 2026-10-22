#!/usr/bin/env python3
"""Unchanged be_aas_cluster.c oracle, native contracts, and retail AAS probe."""
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "AAS_AddTeleporterPortals", "AAS_CanMergeAreas", "AAS_CanMergeFaces",
    "AAS_CheckAreaForPossiblePortals", "AAS_ClearCluster", "AAS_ConnectedAreas",
    "AAS_ConnectedAreas_r", "AAS_CountForcedClusterPortals", "AAS_CreatePortals",
    "AAS_CreateViewPortals", "AAS_FindClusters", "AAS_FindPossiblePortals",
    "AAS_FloodClusterAreasUsingReachabilities", "AAS_FloodClusterAreas_r",
    "AAS_FloodClusterReachabilities", "AAS_FloodCluster_r",
    "AAS_GetAdjacentAreasWithLessPresenceTypes_r", "AAS_InitClustering",
    "AAS_MapContainsTeleporters", "AAS_NonConvexEdges", "AAS_NonConvexFaces",
    "AAS_NumberClusterAreas", "AAS_NumberClusterPortals", "AAS_RemoveAllPortals",
    "AAS_RemoveClusterAreas", "AAS_RemoveNotClusterClosingPortals",
    "AAS_RemovePortalsClusterReference", "AAS_RemoveTeleporterPortals",
    "AAS_SetViewPortalsAsClusterPortals", "AAS_TestPortals", "AAS_UpdatePortal",
]
ORACLE_FUNCTIONS = [
    "AAS_RemoveClusterAreas", "AAS_ClearCluster", "AAS_RemovePortalsClusterReference",
    "AAS_UpdatePortal", "AAS_NumberClusterPortals", "AAS_RemoveAllPortals",
    "AAS_TestPortals", "AAS_CreateViewPortals", "AAS_SetViewPortalsAsClusterPortals",
]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/botlib/be_aas_cluster.c"
    module = ROOT / "src/mq3/botlib/aas_clustering.ml"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    module_text = module.read_text(encoding="utf-8")
    for name in FUNCTIONS:
        assert name in source_text, f"missing original symbol {name}"
        assert f"function {name}(" in module_text, f"missing MiniLang symbol {name}"

    out = ROOT / "build/reference/aas_clustering"
    out.mkdir(parents=True, exist_ok=True)
    (out / "be_aas_cluster_under_test.inc").write_text(
        extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n"
    )
    native = out / "oracle.exe"
    host = ROOT / "tests/reference/aas_clustering_oracle.c"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100",
         "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "build.log",
    )
    expected = run([native], out, log=out / "native.log")
    oracle = build("tests/aas_clustering_oracle.ml", "aas_clustering_oracle.exe")
    actual = run([oracle], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"AAS clustering oracle mismatch\nC:\n{expected}\nMiniLang:\n{actual}")
    contracts = run(
        [build("tests/aas_clustering_contracts.ml", "aas_clustering_contracts.exe")],
        ROOT / "build", log=out / "contracts.log",
    ).strip()
    if not contracts.startswith("PASS: ") or not contracts.endswith(" native AAS clustering contracts (31 symbols)"):
        raise RuntimeError(contracts)

    retail = ""
    if args.data_root:
        baseq3 = args.data_root / "baseq3" if (args.data_root / "baseq3").is_dir() else args.data_root
        pak = baseq3 / "pak0.pk3"
        if not pak.is_file():
            raise RuntimeError(f"missing retail archive {pak}")
        retail = run(
            [build("tests/aas_clustering_retail_probe.ml", "aas_clustering_retail_probe.exe"), pak],
            ROOT / "build", log=out / "retail.log",
        ).strip()
        if not retail.startswith("PASS: 6 retail q3dm7 clustering contracts"):
            raise RuntimeError(retail)

    files = [source, module, host, ROOT / "tests/aas_clustering_oracle.ml",
             ROOT / "tests/aas_clustering_contracts.ml", ROOT / "tests/aas_clustering_retail_probe.ml"]
    result = {
        "passed": True, "source_functions": len(FUNCTIONS),
        "unchanged_c_functions": len(ORACLE_FUNCTIONS), "contracts": contracts,
        "retail": retail or None, "functions": FUNCTIONS,
        "scope": "Complete be_aas_cluster.c clustering, portal discovery, BSPC geometry helpers, legacy flood behavior, teleporter portals, numbering and initialization.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: 31 AAS clustering symbols + {len(ORACLE_FUNCTIONS)} unchanged-C functions")
    print(contracts)
    if retail:
        print(retail)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
