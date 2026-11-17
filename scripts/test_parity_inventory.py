#!/usr/bin/env python3
"""Fail closed when the pinned original checkout is missing, dirty or incomplete."""
import subprocess
import sys
import json
from collections import Counter
from pathlib import Path

from toolchain import ROOT
from parity_inventory import build_inventory, SOURCE_SUFFIXES


def validate_original_tree(original: Path, ledger: dict) -> set[str]:
    original = original.resolve()
    code = original / "code"
    if not code.is_dir():
        raise RuntimeError("Original code tree is missing; run git submodule update --init --recursive")
    sources = {p.relative_to(original).as_posix() for p in code.rglob("*")
               if p.is_file() and p.suffix.lower() in SOURCE_SUFFIXES}
    if not sources:
        raise RuntimeError("Original code tree contains no source files")
    try:
        top = subprocess.check_output(["git", "-C", str(original), "rev-parse", "--show-toplevel"], text=True).strip()
        revision = subprocess.check_output(["git", "-C", str(original), "rev-parse", "HEAD"], text=True).strip()
        dirty = subprocess.run(["git", "-C", str(original), "diff", "--quiet", "HEAD", "--", "code"], check=False).returncode
    except (OSError, subprocess.CalledProcessError) as exc:
        raise RuntimeError("Original source must be an initialized Git checkout") from exc
    if Path(top).resolve() != original:
        raise RuntimeError("Original directory resolves to a parent repository, not the original submodule")
    if revision != ledger.get("upstream_commit"):
        raise RuntimeError("Original revision differs from PORT_LEDGER.json: " + revision)
    if dirty:
        raise RuntimeError("Original source checkout has modified or missing tracked code")
    expected = {row["source"].replace("\\", "/") for row in ledger["files"]
                if row["source"].startswith("code/") and Path(row["source"]).suffix.lower() in SOURCE_SUFFIXES}
    missing, extra = expected - sources, sources - expected
    if missing or extra:
        raise RuntimeError("Original/ledger source-set mismatch; missing=" + repr(sorted(missing)) + "; unlisted=" + repr(sorted(extra)))
    return sources


def main() -> int:
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    counts = Counter(row["source"].replace("\\", "/") for row in ledger["files"])
    duplicates = sorted(name for name, count in counts.items() if count != 1)
    if duplicates:
        raise RuntimeError("Duplicate original-source ledger entries: " + ", ".join(duplicates))
    original_sources = validate_original_tree(ROOT / "Quake-III-Arena-original-source", ledger)
    subprocess.run([sys.executable, ROOT / "scripts/parity_inventory.py", "--check"], cwd=ROOT, check=True)
    inventory = build_inventory()
    for row in inventory["files"]:
        if row["status"] == "ported" and (not row["candidate_symbols"] or row["unmapped_symbols"]):
            raise RuntimeError("Unsubstantiated mapped status: " + row["source"])
    summary = inventory["summary"]
    if sum(summary["status"].values()) != summary["files"]:
        raise RuntimeError("Parity status totals do not cover the inventory")
    if summary["open_symbols"] != sum(len(row["unmapped_symbols"]) for row in inventory["files"]):
        raise RuntimeError("Open-symbol total is inconsistent")
    print(f"PASS: complete original/port source inventory ({len(original_sources)} code-tree sources, pinned clean checkout)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
