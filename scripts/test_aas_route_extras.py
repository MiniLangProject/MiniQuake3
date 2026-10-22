#!/usr/bin/env python3
"""Run native and MiniLang contracts for AAS traps 575-577."""
import struct
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run

STRIDES = (32, 12, 20, 8, 4, 24, 4, 48, 28, 44, 12, 20, 4, 16)


def fixture() -> bytes:
    planes = struct.pack("<4fi", 1.0, 0.0, 0.0, -0.5, 0)
    areas = b"".join(
        struct.pack("<3i9f", i, 0, 0, 0, 0, 0, 0, 0, 0, i * 10.0, 0, 0)
        for i in range(6)
    )
    # contents, flags, presence, cluster, cluster-area, reach count, first reach
    rows = [
        (0, 0, 6, 0, 0, 0, 0),
        (0, 0, 6, 1, 2, 1, 1),
        (0, 0, 6, 0, 0, 1, 2),
        (1, 0, 6, 0, 1, 1, 3),
        (0, 0, 6, 0, 2, 0, 4),
        (0, 0, 6, 0, 3, 0, 4),
    ]
    settings = b"".join(struct.pack("<7i", *row) for row in rows)

    def reach(area: int, start: float, finish: float, travel_time: int) -> bytes:
        return struct.pack(
            "<3i6fiH2x", area, 0, 0,
            start, 0.0, 0.0, finish, 0.0, 0.0,
            2, travel_time,
        )

    reaches = (
        reach(0, 0, 0, 0)
        + reach(2, 0, 10, 10)
        + reach(3, 10, 20, 20)
        + reach(4, 20, 30, 30)
    )
    nodes = struct.pack("<3i", 0, 0, 0) + struct.pack("<3i", 0, -1, 0)
    clusters = struct.pack("<4i", 0, 10, 0, 0) + struct.pack("<4i", 0, 20, 0, 0)
    lumps = [b"", b"", planes, b"", b"", b"", b"", areas, settings, reaches, nodes, b"", b"", clusters]
    assert all(len(blob) % stride == 0 for blob, stride in zip(lumps, STRIDES))
    header = bytearray(124)
    struct.pack_into("<III", header, 0, 0x53414145, 4, 0)
    offset = 124
    for index, blob in enumerate(lumps):
        struct.pack_into("<II", header, 12 + index * 8, offset, len(blob))
        offset += len(blob)
    return bytes(header) + b"".join(lumps)


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/aas_route_extras"
    out.mkdir(parents=True, exist_ok=True)
    data = out / "route_extras.aas"
    data.write_bytes(fixture())
    native = out / "aas_route_extra_oracle.exe"
    run(
        [
            "cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/WX",
            ROOT / "tests/reference/aas_route_extra_oracle.c",
            f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    observed = run([native], out).strip()
    expected = "PASS: 6 native Baseq3 AAS route-extra scenarios / 25 exact observations"
    if observed != expected:
        raise RuntimeError(observed)
    mini = run(
        [build("tests/aas_route_extra_contracts.ml", "aas_route_extra_contracts.exe"), data],
        ROOT / "build",
    ).strip()
    expected_mini = "PASS: 23 AAS route-extra contracts opcodes=575-577 lifecycle=4"
    if mini != expected_mini:
        raise RuntimeError(mini)
    print(observed)
    print(mini)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
