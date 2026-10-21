#!/usr/bin/env python3
"""Generate the complete original-source to MiniLang parity inventory.

The ledger is the authoritative per-file record.  This view deliberately keeps
native source coverage separate from functions that are available by executing
the unchanged game/cgame/ui QVMs through the MiniLang interpreter.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path

from toolchain import ROOT

LEDGER = ROOT / "PORT_LEDGER.json"
REPORT = ROOT / "docs" / "ORIGINAL_PARITY_REPORT.md"
JSON_REPORT = ROOT / "build" / "parity-inventory.json"
IN_SCOPE = {"runtime", "missionpack", "platform"}
SOURCE_SUFFIXES = {".c", ".h", ".asm"}


def domain(source: str) -> str:
    parts = source.replace("\\", "/").split("/")
    if len(parts) >= 2 and parts[0] == "code":
        return parts[1]
    return parts[0]


def mapped(candidate: str, mappings: list[dict]) -> bool:
    needle = candidate.lower()
    for item in mappings:
        original = str(item.get("original", "")).lower()
        if needle == original or needle in original:
            return True
    return False


def build_inventory() -> dict:
    ledger = json.loads(LEDGER.read_text(encoding="utf-8"))
    files = [
        item
        for item in ledger["files"]
        if item.get("category") in IN_SCOPE and Path(item["source"]).suffix.lower() in SOURCE_SUFFIXES
    ]
    rows = []
    for item in files:
        candidates = list(item.get("symbol_candidates", []))
        mappings = list(item.get("symbol_mapping", []))
        rows.append(
            {
                "source": item["source"],
                "domain": domain(item["source"]),
                "category": item.get("category", ""),
                "status": item.get("status", "not_started"),
                "candidate_symbols": candidates,
                "mapped_symbols": [name for name in candidates if mapped(name, mappings)],
                "unmapped_symbols": [name for name in candidates if not mapped(name, mappings)],
                "targets": list(item.get("target", [])),
                "tests": list(item.get("tests", [])),
            }
        )
    status = Counter(row["status"] for row in rows)
    by_domain: dict[str, Counter] = defaultdict(Counter)
    for row in rows:
        by_domain[row["domain"]][row["status"]] += 1
    return {
        "schema": 1,
        "upstream_commit": ledger.get("upstream_commit", ""),
        "scope_categories": sorted(IN_SCOPE),
        "source_suffixes": sorted(SOURCE_SUFFIXES),
        "summary": {"files": len(rows), "status": dict(sorted(status.items()))},
        "domains": {name: dict(sorted(values.items())) for name, values in sorted(by_domain.items())},
        "files": rows,
    }


def markdown(inventory: dict) -> str:
    states = ["ported", "partial", "not_started", "retained_original"]
    lines = [
        "# Vollständiger Original-/Port-Abgleich",
        "",
        "Diese Datei wird mit `python scripts/parity_inventory.py` aus",
        "`PORT_LEDGER.json` erzeugt. Sie zählt jede C-, Header- und ASM-Originaldatei",
        "der Kategorien Runtime, Plattform und Missionpack genau einmal.",
        "",
        "Die Spalte **Quellport** beschreibt native MiniLang-Abdeckung. Die unveränderten",
        "Baseq3-Module `qagame.qvm`, `cgame.qvm` und `ui.qvm` laufen zusätzlich im",
        "MiniLang-QVM-Interpreter. Dadurch können Spielfunktionen produktiv vorhanden sein,",
        "obwohl die jeweilige C-Datei noch nicht als nativer MiniLang-Quellport gilt.",
        "",
        "## Zusammenfassung",
        "",
        "| Bereich | Dateien | Portiert | Teilweise | Nicht begonnen | Original behalten |",
        "|---|---:|---:|---:|---:|---:|",
    ]
    for name, values in inventory["domains"].items():
        total = sum(values.values())
        lines.append(
            f"| `{name}` | {total} | {values.get('ported', 0)} | {values.get('partial', 0)} | "
            f"{values.get('not_started', 0)} | {values.get('retained_original', 0)} |"
        )
    summary = inventory["summary"]
    values = summary["status"]
    lines += [
        f"| **Gesamt** | **{summary['files']}** | **{values.get('ported', 0)}** | "
        f"**{values.get('partial', 0)}** | **{values.get('not_started', 0)}** | "
        f"**{values.get('retained_original', 0)}** |",
        "",
        "`partial` bedeutet, dass mindestens ein Originalpfad belegt ist, aber weiterhin",
        "offene Symbole oder ausdrücklich dokumentierte Grenzen bestehen. `not_started`",
        "ist eine echte Quellport-Lücke; Builddateien und Drittanbieterquellen sind nicht",
        "Teil dieser Tabelle.",
        "",
        "## Datei- und Symbolmatrix",
        "",
        "| Originaldatei | Bereich | Quellport | Symbole | Gemappt | Offen |",
        "|---|---|---|---:|---:|---:|",
    ]
    for row in inventory["files"]:
        lines.append(
            f"| `{row['source']}` | `{row['domain']}` | `{row['status']}` | "
            f"{len(row['candidate_symbols'])} | {len(row['mapped_symbols'])} | {len(row['unmapped_symbols'])} |"
        )
    lines += [
        "",
        "## Offene Originalsymbole",
        "",
        "Die folgende vollständige Liste dient als Arbeitswarteschlange. Leere",
        "Symbolinventare müssen beim nächsten Audit direkt aus der Originaldatei ergänzt",
        "werden; sie sind kein Nachweis vollständiger Parität.",
        "",
    ]
    for row in inventory["files"]:
        if row["status"] in {"ported", "retained_original"} and not row["unmapped_symbols"]:
            continue
        open_symbols = ", ".join(f"`{name}`" for name in row["unmapped_symbols"])
        if not open_symbols:
            open_symbols = "*(Symbolinventar ergänzen)*"
        lines.append(f"- `{row['source']}` ({row['status']}): {open_symbols}")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="fail if the checked-in report is stale")
    args = parser.parse_args()
    inventory = build_inventory()
    content = markdown(inventory)
    if args.check:
        if not REPORT.exists() or REPORT.read_text(encoding="utf-8") != content:
            raise SystemExit("docs/ORIGINAL_PARITY_REPORT.md is stale; run scripts/parity_inventory.py")
        print(f"PASS: parity inventory covers {inventory['summary']['files']} original runtime/platform files")
        return 0
    REPORT.write_text(content, encoding="utf-8", newline="\n")
    JSON_REPORT.parent.mkdir(parents=True, exist_ok=True)
    JSON_REPORT.write_text(json.dumps(inventory, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"Wrote {REPORT.relative_to(ROOT)} for {inventory['summary']['files']} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
