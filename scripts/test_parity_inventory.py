#!/usr/bin/env python3
import subprocess
import sys
import json
from collections import Counter
from pathlib import Path

from toolchain import ROOT
from parity_inventory import build_inventory

SOURCE_SUFFIXES = {".c", ".h", ".asm"}


def main() -> int:
    original_root = ROOT / "Quake-III-Arena-original-source" / "code"
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    ledger_sources = [item["source"].replace("\\", "/") for item in ledger["files"]]
    counts = Counter(ledger_sources)
    duplicates = sorted(source for source, count in counts.items() if count != 1)
    if duplicates:
        raise RuntimeError("duplicate original-source ledger entries: " + ", ".join(duplicates))

    original_sources = {
        path.relative_to(ROOT / "Quake-III-Arena-original-source").as_posix()
        for path in original_root.rglob("*")
        if path.is_file() and path.suffix.lower() in SOURCE_SUFFIXES
    }
    missing = sorted(original_sources - set(ledger_sources))
    if missing:
        raise RuntimeError("original runtime source files missing from PORT_LEDGER.json: " + ", ".join(missing))

    subprocess.run([sys.executable, ROOT / "scripts/parity_inventory.py", "--check"], cwd=ROOT, check=True)
    inventory = build_inventory()
    false_complete = [
        row["source"]
        for row in inventory["files"]
        if row["status"] == "ported" and row["unmapped_symbols"]
    ]
    if false_complete:
        raise RuntimeError("effectively ported files still have unmapped symbols: " + ", ".join(false_complete))
    summary = inventory["summary"]
    if sum(summary["status"].values()) != summary["files"]:
        raise RuntimeError("parity status totals do not cover the complete inventory")
    if summary["open_symbols"] != sum(len(row["unmapped_symbols"]) for row in inventory["files"]):
        raise RuntimeError("open-symbol total is inconsistent")
    if summary["status_corrections"] != sum(row["status"] != row["ledger_status"] for row in inventory["files"]):
        raise RuntimeError("effective-status correction total is inconsistent")
    print(f"PASS: complete original/port source inventory ({len(original_sources)} code-tree sources)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
