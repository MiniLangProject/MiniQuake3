#!/usr/bin/env python3
"""Mount an original fixture mod over locally installed Retail packages."""

import argparse
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
from zipfile import ZIP_DEFLATED, ZipFile

from toolchain import ROOT


def write_package(path: Path, contents: dict[str, bytes]) -> None:
    with ZipFile(path, "w", ZIP_DEFLATED) as archive:
        for name, data in contents.items():
            archive.writestr(name, data)


def marker_module(marker: int) -> bytes:
    bytecode = struct.pack("<BiBiBi", 3, 64, 8, marker, 4, 64)
    header = struct.pack("<8I", 0x12721444, 3, 32, len(bytecode), 32 + len(bytecode), 4, 0, 65532)
    return header + bytecode + bytes(4)


def create_fixture(root: Path) -> None:
    for name in ("fixturemod", "assetmod", "badmod", "nativemod"):
        (root / name).mkdir()

    fixture = root / "fixturemod"
    (fixture / "scripts").mkdir()
    (fixture / "vm").mkdir()
    (fixture / "description.txt").write_text("Fixture for mod mounting", encoding="ascii")
    (fixture / "scripts" / "fixture.cfg").write_bytes(b"loose fixture file")
    (fixture / "mod-layer.txt").write_bytes(b"low priority loose file")
    (fixture / "vm" / "cgame.qvm").write_bytes(marker_module(211))
    (fixture / "helper.dll").write_bytes(b"This is a fixture, not a DLL.")
    write_package(fixture / "pak0.pk3", {"mod-layer.txt": b"lowest package"})
    write_package(fixture / "pak1.pk3", {
        "mod-layer.txt": b"highest package",
        "default.cfg": b"fixture override",
        "vm/cgame.qvm": marker_module(239),
    })
    (root / "assetmod" / "fixture_asset.txt").write_bytes(b"Fixture mod data")
    write_package(root / "badmod" / "bad.pk3", {"vm/ui.qvm": b"not a QVM"})
    write_package(root / "nativemod" / "native.pk3", {"fixture_data.txt": b"code needs QVM"})
    (root / "nativemod" / "qagamex86.dll").write_bytes(b"This marks a native-only module.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", required=True, type=Path)
    parser.add_argument("--qvms", type=Path)
    parser.add_argument("--reuse-build", action="store_true")
    args = parser.parse_args()
    base = args.data_root.resolve()
    if (base / "baseq3").is_dir():
        base /= "baseq3"
    if not (base / "pak0.pk3").is_file():
        parser.error(f"missing Retail pak0.pk3 in {base}")
    build = ROOT / "build"
    binary = build / "mod_stack_retail_probe.exe"
    qvms = args.qvms.resolve() if args.qvms else build / "qvms"
    names = ("qagame.qvm", "cgame.qvm", "ui.qvm")
    if args.qvms is None and not all((qvms / name).is_file() for name in names):
        qvms = build / "reference/qvms"
        if not all((qvms / name).is_file() for name in names):
            subprocess.run([sys.executable, ROOT / "scripts" / "build_qvms.py"], cwd=ROOT, check=True)
    if not all((qvms / name).is_file() for name in names):
        parser.error(f"missing original QVM modules in {qvms}")
    if not args.reuse_build:
        subprocess.run(
            [sys.executable, ROOT / "scripts" / "build_release.py",
             "--source", "tests/mod_stack_retail_probe.ml", "--output", binary.name],
            cwd=ROOT,
            check=True,
        )
    with tempfile.TemporaryDirectory(prefix="mq3-mod-fixture-", dir=build) as temporary:
        install = Path(temporary)
        create_fixture(install)
        result = subprocess.run(
            [binary, base, install, qvms],
            cwd=build,
            capture_output=True,
            encoding="utf-8",
            errors="replace",
            timeout=90,
        )
        print(result.stdout, end="")
        if result.returncode or "PASS: 19 Retail mod mount" not in result.stdout:
            print(result.stderr, end="", file=sys.stderr)
            raise RuntimeError("Retail mod stack did not complete")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
