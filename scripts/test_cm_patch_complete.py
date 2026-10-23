"""Complete unchanged-C cm_patch helper and retail geometry differential."""
import argparse
import json
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_collision import build_oracle
from toolchain import ROOT, msvc_env, run

SYMBOLS = (
    "CM_AddFacetBevels", "CM_CheckFacetPlane", "CM_ClearLevelPatches",
    "CM_ComparePoints", "CM_DrawDebugSurface", "CM_EdgePlaneNum",
    "CM_FindPlane", "CM_FindPlane2", "CM_GeneratePatchCollide",
    "CM_GridPlane", "CM_NeedsSubdivision", "CM_PatchCollideFromGrid",
    "CM_PlaneEqual", "CM_PlaneFromPoints", "CM_PointOnPlaneSide",
    "CM_PositionTestInPatchCollide", "CM_RemoveDegenerateColumns",
    "CM_SetBorderInward", "CM_SetGridWrapWidth", "CM_SignbitsForNormal",
    "CM_SnapVector", "CM_Subdivide", "CM_SubdivideGridColumns",
    "CM_TracePointThroughPatchCollide", "CM_TraceThroughPatchCollide",
    "CM_TransposeGrid", "CM_ValidateFacet",
)


def build_kernel_oracle(output):
    source = ROOT / "Quake-III-Arena-original-source/code"
    sources = [ROOT / "tests/reference/collision_oracle.c",
               ROOT / "tests/reference/cm_patch_complete_oracle.c",
               source / "qcommon/cm_polylib.c", source / "game/q_math.c",
               source / "game/q_shared.c"]
    # The oracle includes the unchanged cm_patch.c and only removes `static`
    # linkage so its file-local kernels can be called directly.
    run(["cl", "/nologo", "/Od", "/Gy", "/fp:strict", "/arch:SSE2", "/MT",
         "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS",
         "/DMQ3_ORACLE_LIBRARY", f"/I{source / 'qcommon'}", f"/I{source / 'game'}",
         *sources, f"/Fe:{output / 'cm_kernel_oracle.exe'}", "/link", "/OPT:REF",
         "/Brepro", "/stack:8388608"], output, msvc_env("x86"), output / "kernel-build.log")
    return sources + [source / "qcommon/cm_patch.c"]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("data_root", type=Path)
    parser.add_argument("--map", action="append", help="map stem; default is every pak0 BSP")
    args = parser.parse_args()
    output = ROOT / "build/reference/cm_patch_complete"
    output.mkdir(parents=True, exist_ok=True)

    sources = build_kernel_oracle(output)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cm_patch_complete_oracle.ml", "--output",
                    "cm_kernel_minilang.exe"], check=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cm_patch_complete_contracts.ml", "--output",
                    "cm_kernel_contracts.exe"], check=True)
    expected = run([output / "cm_kernel_oracle.exe"], output,
                   log=output / "kernel-original.log").replace("\r\n", "\n")
    actual = run([ROOT / "build/cm_kernel_minilang.exe"], ROOT / "build",
                 log=output / "kernel-minilang.log").replace("\r\n", "\n")
    if actual != expected:
        (output / "kernel-expected.txt").write_text(expected, encoding="utf-8")
        (output / "kernel-actual.txt").write_text(actual, encoding="utf-8")
        raise RuntimeError("cm_patch kernel differential mismatch")
    contracts = run([ROOT / "build/cm_kernel_contracts.exe"], ROOT / "build",
                    log=output / "contracts.log").strip()
    if contracts != "PASS: 25 cm_patch complete contracts":
        raise RuntimeError("unexpected contract result: " + contracts)

    implementation = "\n".join((ROOT / name).read_text(encoding="utf-8") for name in
                                ("src/mq3/collision/patchmesh.ml",
                                 "src/mq3/collision/patchtrace.ml"))
    missing = [name for name in SYMBOLS if f"function {name}(" not in implementation]
    if missing:
        raise RuntimeError("missing cm_patch symbols: " + ", ".join(missing))

    geometry = output / "geometry"
    geometry.mkdir(exist_ok=True)
    geometry_sources = build_oracle(geometry, patches=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/patch_tests.ml", "--output", "cm_geometry_tests.exe"], check=True)
    maps = []
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        for name in sorted(n for n in archive.namelist()
                           if n.startswith("maps/") and n.endswith(".bsp")):
            if args.map and Path(name).stem not in args.map:
                continue
            folder = geometry / Path(name).stem
            folder.mkdir(exist_ok=True)
            bsp = folder / "map.bsp"; bsp.write_bytes(archive.read(name))
            reference = folder / "expected.bin"
            run([geometry / "collision_oracle.exe", bsp, reference], folder,
                log=folder / "original.log", timeout=600)
            result = run([ROOT / "build/cm_geometry_tests.exe", bsp, reference],
                         ROOT / "build", log=folder / "minilang.log", timeout=600).strip()
            print(name + ": " + result, flush=True)
            maps.append({"map": name, "patches": int(result.split()[1]),
                         "exact_words": reference.stat().st_size // 4,
                         "bsp_sha256": sha(bsp), "expected_sha256": sha(reference)})
    if not maps:
        raise RuntimeError("No maps matched")
    result = {
        "passed": True,
        "profile": "unchanged x86 cm_patch.c static kernels plus exact retail patch geometry",
        "symbols": list(SYMBOLS), "symbol_count": len(SYMBOLS),
        "kernel_records": len(expected.splitlines()), "contracts": 25,
        "maps": maps, "patches": sum(item["patches"] for item in maps),
        "exact_words": sum(item["exact_words"] for item in maps),
        "original_sources": {path.relative_to(ROOT).as_posix(): sha(path)
                             for path in sources + geometry_sources},
    }
    (output / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: {len(SYMBOLS)} cm_patch symbols, {result['kernel_records']} kernel records, "
          f"{len(maps)} retail maps, {result['patches']} patches, 25 contracts")


if __name__ == "__main__":
    main()
