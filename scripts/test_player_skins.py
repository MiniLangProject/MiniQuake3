#!/usr/bin/env python3
"""Build player .skin contracts and optionally probe a retail pak0.pk3."""
from __future__ import annotations

import argparse
import zipfile
from pathlib import Path

from toolchain import ROOT, run


def tga(b: int, g: int, r: int) -> bytes:
    header = bytearray(18)
    header[2] = 2
    header[12] = header[14] = 1
    header[16] = 24
    return bytes(header) + bytes((b, g, r))


def build(source: str, output: str) -> Path:
    executable = ROOT / "build" / output
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    run([
        compiler, ROOT / source, executable, "-I", ROOT / "src", "-I",
        ROOT / "artifacts/toolchain", "--heap-reserve", "1g",
        "--heap-commit", "32m", "--gc-limit", "64m",
    ], ROOT / "build", log=ROOT / "build" / (output + ".compile.log"))
    return executable


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path, help="optional retail baseq3/pak0.pk3")
    args = parser.parse_args()
    fixture = ROOT / "build/reference/player_skins/fixture.pk3"
    fixture.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(fixture, "w", zipfile.ZIP_DEFLATED) as archive:
        archive.writestr("models/players/sarge/lower_default.skin", "l_legs,models/players/sarge/band.tga\r\ntag_torso,\r\n")
        archive.writestr("models/players/sarge/upper_default.skin", "tag_head,\r\ntag_weapon,\r\nu_rshoulder,models/players/sarge/boot\r\nu_torso,models/players/sarge/band_shader\r\ntag_torso,\r\n")
        archive.writestr("models/players/sarge/head_default.skin", "tag_head,\r\nh_cigar,models/players/sarge/cigar.tga\r\nh_head,models/players/sarge/band.tga\r\n")
        archive.writestr("models/players/sarge/band.tga", tga(1, 2, 3))
        archive.writestr("models/players/sarge/boot.tga", tga(4, 5, 6))
        archive.writestr("models/players/sarge/cigar.tga", tga(10, 20, 30))
        archive.writestr("scripts/player.shader", "models/players/sarge/band_shader { { map models/players/sarge/band.tga } }")
    contract = build("tests/player_skins_contracts.ml", "player_skins_contracts.exe")
    output = run([contract, fixture], ROOT / "build").strip()
    expected = "PASS: 25 player skin contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)
    if args.pak:
        probe = build("tests/player_skins_retail_probe.ml", "player_skins_retail_probe.exe")
        print(run([probe, args.pak], ROOT / "build", timeout=240).strip())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
