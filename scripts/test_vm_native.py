"""Exercise the native continuation backend against software binary32 and recursion."""
import json
import random
import struct
import subprocess
import sys
from pathlib import Path

from inventory import sha
from test_vm import assemble
from toolchain import ROOT


def main():
    output = ROOT / "build/reference/vm_native"
    output.mkdir(parents=True, exist_ok=True)
    for op, name in enumerate(("ADDF", "SUBF", "DIVF", "MULF", "CVIF", "CVFI"), 54):
        code = [("ENTER", 64), ("LOCAL", 72), ("LOAD4",)]
        if op < 58:
            code += [("LOCAL", 76), ("LOAD4",)]
        (output / f"float{op}.qvm").write_bytes(assemble(code + [(name,), ("LEAVE", 64)]))
    (output / "recursive.qvm").write_bytes(assemble([
        ("ENTER", 64), ("LOCAL", 72), ("LOAD4",), ("CONST", 0), ("EQ", 12),
        ("CONST", 0), ("ARG", 8), ("CONST", -4), ("CALL",), ("CONST", 1),
        ("ADD",), ("LEAVE", 64), ("CONST", 41), ("LEAVE", 64)]))
    (output / "loop.qvm").write_bytes(assemble([("ENTER", 64), ("CONST", 1), ("JUMP",)]))
    (output / "badload.qvm").write_bytes(assemble([
        ("ENTER", 64), ("CONST", 131071), ("LOAD4",), ("LEAVE", 64)]))
    edges = [0, 0x80000000, 1, 0x80000001, 0x007fffff, 0x00800000,
             0x807fffff, 0x80800000, 0x3f000000, 0xbf000000, 0x3f800000,
             0xbf800000, 0x7f7fffff, 0xff7fffff, 0x7f800000, 0xff800000,
             0x7fc00000, 0xffc00000, 0x7fa12345, 0xffa54321, 0x4f000000,
             0xcf000000, 0x4effffff, 0xceffffff]
    rng = random.Random(0x514d56)
    records = []
    for op in range(54, 58):
        records.extend((op, a, b) for a in edges for b in edges)
        records.extend((op, rng.getrandbits(32), rng.getrandbits(32)) for _ in range(4096))
    for op in (58, 59):
        records.extend((op, a, 0) for a in edges)
        records.extend((op, rng.getrandbits(32), 0) for _ in range(4096))
    cases = output / "cases.bin"
    cases.write_bytes(b"".join(struct.pack("<III", *record) for record in records))
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/vm_native_contracts.ml", "--output", "vm_native_contracts.exe"],
                   cwd=ROOT, check=True)
    result = subprocess.run([ROOT / "build/vm_native_contracts.exe", cases, output],
                            cwd=ROOT / "build", check=True, capture_output=True, text=True)
    expected = f"PASS: {len(records) + 6} native QVM float/reentrant/bounds contracts"
    if result.stdout.strip() != expected:
        raise AssertionError(result.stdout)
    (output / "result.json").write_text(json.dumps({
        "passed": True, "float_records": len(records), "continuation_contracts": 6,
        "cases_sha256": sha(cases), "native_sha256": sha(ROOT / "build/miniquake3_qvm.dll"),
    }, indent=2) + "\n")
    print(expected)


if __name__ == "__main__":
    main()
