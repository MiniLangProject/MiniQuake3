#!/usr/bin/env python3
"""Unchanged be_aas_optimize.c oracle, native contracts, and retail AAS evidence."""
from __future__ import annotations

import argparse
import json
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = ["AAS_KeepEdge", "AAS_OptimizeEdge", "AAS_KeepFace", "AAS_OptimizeFace", "AAS_OptimizeArea", "AAS_OptimizeAlloc", "AAS_OptimizeStore", "AAS_Optimize"]
STRIDES = (32, 12, 20, 8, 4, 24, 4, 48, 28, 44, 12, 20, 4, 16)


def retail_probe(data_root: Path) -> dict[str, int]:
    baseq3 = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    archives = sorted(baseq3.glob("*.pk3"))
    if not archives:
        raise RuntimeError(f"no retail PK3 archives under {baseq3}")
    maps = faces = ladders = reaches = elevators = jumppads = funcbobs = 0
    for archive in archives:
        with zipfile.ZipFile(archive) as pak:
            for name in pak.namelist():
                if not name.lower().endswith(".aas"):
                    continue
                data = pak.read(name)
                if len(data) < 124:
                    raise RuntimeError(f"truncated retail AAS: {name}")
                ident, version = struct.unpack_from("<II", data)
                if ident != 0x53414145 or version not in (4, 5):
                    raise RuntimeError(f"unsupported retail AAS header: {name}")
                header = bytearray(data[:124])
                if version == 5:
                    for index in range(116):
                        header[8 + index] ^= (index * 119) & 255
                lumps: list[tuple[int, int]] = []
                for lump, stride in enumerate(STRIDES):
                    offset, length = struct.unpack_from("<II", header, 12 + lump * 8)
                    if offset + length > len(data) or length % stride:
                        raise RuntimeError(f"invalid retail AAS lump: {name}:{lump}")
                    lumps.append((offset, length))
                face_offset, face_length = lumps[5]
                faces += face_length // 24
                for at in range(face_offset, face_offset + face_length, 24):
                    if struct.unpack_from("<i", data, at + 4)[0] & 2:
                        ladders += 1
                reach_offset, reach_length = lumps[9]
                reaches += reach_length // 44
                for at in range(reach_offset, reach_offset + reach_length, 44):
                    kind = struct.unpack_from("<i", data, at + 36)[0] & 0xFFFFFF
                    elevators += kind == 11
                    jumppads += kind == 18
                    funcbobs += kind == 19
                maps += 1
    if maps == 0 or faces == 0 or reaches == 0 or jumppads + funcbobs == 0:
        raise RuntimeError("retail AAS corpus lacks optimizer input evidence")
    return {"maps": maps, "faces": faces, "ladder_faces": ladders, "reachabilities": reaches, "elevators": elevators, "jumppads": jumppads, "funcbobs": funcbobs}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/botlib_aas_optimize"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/botlib/be_aas_optimize.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in text, name
    include = out / "be_aas_optimize_under_test.inc"
    include.write_text(extract(source, FUNCTIONS), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/botlib_aas_optimize_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/botlib_aas_optimize_oracle.ml", "botlib_aas_optimize_oracle.exe"), ("tests/botlib_aas_optimize_contracts.ml", "botlib_aas_optimize_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/botlib_aas_optimize_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/botlib_aas_optimize_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 29 native botlib AAS optimize contracts (8 symbols)", contracts
    retail = retail_probe(args.data_root) if args.data_root else None
    files = [source, host, ROOT / "src/mq3/botlib/aas_optimizer.ml", ROOT / "tests/botlib_aas_optimize_oracle.ml", ROOT / "tests/botlib_aas_optimize_contracts.ml"]
    result = {"passed": True, "differential_records": 12, "contracts": 29, "source_functions": 8, "functions": FUNCTIONS, "retail": retail, "scope": "Complete be_aas_optimize.c ladder topology compaction, signed edge/face reuse, area ranges, reachability remapping and encoded elevator/jumppad/funcbob preservation.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    suffix = "" if retail is None else f" + retail AAS maps={retail['maps']} ladders={retail['ladder_faces']} reaches={retail['reachabilities']}"
    print(f"PASS: 12 unchanged C AAS-optimize records + 29 contracts + 8 symbols{suffix}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
