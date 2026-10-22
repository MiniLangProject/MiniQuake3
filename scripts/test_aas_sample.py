"""Build the unchanged-C oracle and native/retail be_aas_sample contracts."""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


SYMBOLS = [
    "AAS_AASLinkEntity",
    "AAS_AllocAASLink",
    "AAS_AreaCluster",
    "AAS_AreaEntityCollision",
    "AAS_AreaGroundFace",
    "AAS_AreaInfo",
    "AAS_AreaPresenceType",
    "AAS_BBoxAreas",
    "AAS_BoxOnPlaneSide2",
    "AAS_BoxOriginDistanceFromPlane",
    "AAS_DeAllocAASLink",
    "AAS_FacePlane",
    "AAS_FreeAASLinkHeap",
    "AAS_FreeAASLinkedEntities",
    "AAS_InitAASLinkHeap",
    "AAS_InitAASLinkedEntities",
    "AAS_InsideFace",
    "AAS_LinkEntityClientBBox",
    "AAS_PlaneFromNum",
    "AAS_PointAreaNum",
    "AAS_PointInsideFace",
    "AAS_PointPresenceType",
    "AAS_PointReachabilityAreaIndex",
    "AAS_PresenceTypeBoundingBox",
    "AAS_TraceAreas",
    "AAS_TraceClientBBox",
    "AAS_TraceEndFace",
    "AAS_UnlinkFromAreas",
]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    output = ROOT / "build/reference/aas_sample"
    output.mkdir(parents=True, exist_ok=True)

    original = ROOT / "Quake-III-Arena-original-source/code/botlib/be_aas_sample.c"
    module = ROOT / "src/mq3/botlib/aas_sample.ml"
    original_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8-sig")
    absent = [name for name in SYMBOLS if not re.search(rf"\b{re.escape(name)}\s*\(", original_text)]
    missing = [name for name in SYMBOLS if not re.search(rf"(?m)^function\s+{re.escape(name)}\s*\(", module_text)]
    if absent:
        raise RuntimeError(f"symbols absent from original: {absent}")
    if missing:
        raise RuntimeError(f"symbols absent from MiniLang adapter: {missing}")

    oracle_source = ROOT / "tests/reference/aas_sample_oracle.c"
    oracle_exe = output / "aas_sample_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", oracle_source, f"/Fe:{oracle_exe}", "/link", "/Brepro"],
        output,
        msvc_env("x64"),
        output / "oracle-build.log",
    )
    oracle = run([oracle_exe], output, log=output / "oracle.log").strip()
    if oracle != "PASS: 10 unchanged-C AAS sample observations":
        raise RuntimeError(oracle)

    pak = args.data_root / "baseq3/pak0.pk3"
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/aas_sample_contracts.ml", "--output", "aas_sample_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    native = run([ROOT / "build/aas_sample_contracts.exe", pak], ROOT, log=output / "contracts.log").strip()
    if native != "PASS: 25 AAS sample native contracts":
        raise RuntimeError(native)

    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/aas_sample_retail_probe.ml", "--output", "aas_sample_retail_probe.exe"],
        cwd=ROOT,
        check=True,
    )
    retail = run([ROOT / "build/aas_sample_retail_probe.exe", pak], ROOT, log=output / "retail.log").strip()
    if not retail.startswith("PASS: 6 q3dm1 AAS sample contracts"):
        raise RuntimeError(retail)

    files = [
        original,
        module,
        oracle_source,
        ROOT / "tests/aas_sample_contracts.ml",
        ROOT / "tests/aas_sample_retail_probe.ml",
    ]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "oracle": oracle,
        "native": native,
        "retail": retail,
        "scope": "All be_aas_sample.c ledger symbols, including link ownership, AAS geometry/sampling, static client traces, and typed dynamic-entity collision services.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (output / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 28/28 be_aas_sample symbols + 10 C + 25 native + 6 retail contracts")


if __name__ == "__main__":
    main()
