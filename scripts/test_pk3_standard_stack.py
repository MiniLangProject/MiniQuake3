#!/usr/bin/env python3
"""Verify all-PK3 discovery, alphabetical precedence and source-aware reads."""

from pathlib import Path
import subprocess
import sys
import zipfile

from toolchain import ROOT


def write_pak(path: Path, files: dict[str, bytes]) -> None:
    with zipfile.ZipFile(path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for name, data in files.items():
            archive.writestr(name, data)


def main() -> int:
    out = ROOT / "build" / "reference" / "pk3_standard_stack"
    fixture = out / "baseq3"
    fixture.mkdir(parents=True, exist_ok=True)
    write_pak(fixture / "pak0.pk3", {"shared.txt": b"pak0", "pak0-only.txt": b"base"})
    write_pak(fixture / "pak1.pk3", {"shared.txt": b"pak1", "pak1-only.txt": b"patch"})
    write_pak(fixture / "zzz_custom.pk3", {"shared.txt": b"custom", "custom-only.txt": b"custom"})
    subprocess.run(
        [sys.executable, ROOT / "scripts" / "build.py", "--source", "tests/pk3_standard_stack_contracts.ml", "--output", "pk3_standard_stack_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    result = subprocess.run(
        [ROOT / "build" / "pk3_standard_stack_contracts.exe", fixture],
        cwd=ROOT / "build",
        check=True,
        capture_output=True,
        text=True,
    )
    expected = "PASS: 5 standard PK3 stack contracts"
    if result.stdout.strip() != expected:
        raise RuntimeError(result.stdout + result.stderr)
    print(expected)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
