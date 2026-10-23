"""Exact cm_load.c loader/query differential over the retail BSP corpus."""
import argparse
import json
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run

SYMBOLS = (
    "CM_BoundBrush", "CM_Checksum", "CM_ClearMap", "CM_ClipHandleToModel",
    "CM_EntityString", "CM_InitBoxHull", "CM_InlineModel", "CM_LeafArea",
    "CM_LeafCluster", "CM_LoadMap", "CM_LumpChecksum", "CM_ModelBounds",
    "CM_NumClusters", "CM_NumInlineModels", "CM_TempBoxModel",
    "CMod_LoadBrushSides", "CMod_LoadBrushes", "CMod_LoadEntityString",
    "CMod_LoadLeafBrushes", "CMod_LoadLeafSurfaces", "CMod_LoadLeafs",
    "CMod_LoadNodes", "CMod_LoadPatches", "CMod_LoadPlanes",
    "CMod_LoadShaders", "CMod_LoadSubmodels", "CMod_LoadVisibility",
    "SetPlaneSignbits",
)


def build_original(output):
    source = ROOT / "Quake-III-Arena-original-source/code"
    sources = [source / "qcommon" / name for name in (
        "cm_load.c", "cm_trace.c", "cm_test.c", "cm_patch.c", "cm_polylib.c", "md4.c")]
    sources += [source / "game" / name for name in ("q_math.c", "q_shared.c")]
    sources += [ROOT / "tests/reference/collision_oracle.c",
                ROOT / "tests/reference/cm_load_complete_oracle.c"]
    run(["cl", "/nologo", "/Od", "/Gy", "/fp:strict", "/arch:SSE2", "/MT",
         "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS", "/DMQ3_ORACLE_LIBRARY",
         f"/I{source / 'qcommon'}", f"/I{source / 'game'}", *sources,
         f"/Fe:{output / 'cm_load_complete_oracle.exe'}", "/link", "/OPT:REF",
         "/Brepro", "/stack:8388608"], output, msvc_env("x86"), output / "build.log")
    return sources


def checked_output(command, cwd, log):
    return run(command, cwd, log=log, timeout=600).replace("\r\n", "\n")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("data_root", type=Path)
    parser.add_argument("--map", action="append", help="map stem; default is every pak0 BSP")
    args = parser.parse_args()

    output = ROOT / "build/reference/cm_load_complete"
    output.mkdir(parents=True, exist_ok=True)
    original_sources = build_original(output)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cm_load_complete_oracle.ml", "--output",
                    "cm_load_complete_oracle.exe"], check=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cm_load_complete_contracts.ml", "--output",
                    "cm_load_complete_contracts.exe"], check=True)

    implementation = (ROOT / "src/mq3/collision/world.ml").read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if f"function {name}(" not in implementation]
    if missing:
        raise RuntimeError("missing cm_load symbols: " + ", ".join(missing))

    maps = []
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        names = sorted(n for n in archive.namelist()
                       if n.startswith("maps/") and n.endswith(".bsp"))
        for name in names:
            if args.map and Path(name).stem not in args.map:
                continue
            folder = output / Path(name).stem
            folder.mkdir(exist_ok=True)
            target = folder / "map.bsp"
            target.write_bytes(archive.read(name))
            expected = checked_output([output / "cm_load_complete_oracle.exe", target],
                                      folder, folder / "original.log")
            actual = checked_output([ROOT / "build/cm_load_complete_oracle.exe", target],
                                    ROOT / "build", folder / "minilang.log")
            if actual != expected:
                (folder / "expected.txt").write_text(expected, encoding="utf-8")
                (folder / "actual.txt").write_text(actual, encoding="utf-8")
                raise RuntimeError(f"cm_load differential mismatch for {name}")
            print(f"{name}: PASS ({len(expected.splitlines())} exact records)", flush=True)
            maps.append({"map": name, "bsp_sha256": sha(target),
                         "records": len(expected.splitlines()),
                         "oracle_sha256": sha(folder / "original.log"),
                         "minilang_sha256": sha(folder / "minilang.log")})
    if not maps:
        raise RuntimeError("No maps matched")

    contract_map = output / Path(maps[0]["map"]).stem / "map.bsp"
    contracts = checked_output([ROOT / "build/cm_load_complete_contracts.exe", contract_map],
                               ROOT / "build", output / "contracts.log").strip()
    if contracts != "PASS: 20 cm_load complete contracts":
        raise RuntimeError("unexpected contract result: " + contracts)
    result = {
        "passed": True,
        "profile": "unchanged original x86 cm_load.c loader and public query surface",
        "symbols": list(SYMBOLS),
        "symbol_count": len(SYMBOLS),
        "contracts": 20,
        "maps": maps,
        "records": sum(item["records"] for item in maps),
        "original_sources": {path.relative_to(ROOT).as_posix(): sha(path)
                             for path in original_sources},
        "minilang_sources": {
            "src/mq3/collision/world.ml": sha(ROOT / "src/mq3/collision/world.ml"),
            "tests/cm_load_complete_oracle.ml": sha(ROOT / "tests/cm_load_complete_oracle.ml"),
            "tests/cm_load_complete_contracts.ml": sha(ROOT / "tests/cm_load_complete_contracts.ml"),
        },
    }
    (output / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: {len(SYMBOLS)} cm_load symbols, {len(maps)} retail maps, "
          f"{result['records']} exact records, 20 contracts")


if __name__ == "__main__":
    main()
