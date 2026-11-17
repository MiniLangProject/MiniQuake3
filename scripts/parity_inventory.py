#!/usr/bin/env python3
"""Generate the complete original-source to MiniLang parity inventory.

The ledger is the authoritative per-file record.  This view deliberately keeps
native source coverage separate from functions that are available by executing
the unchanged game/cgame/ui QVMs through the MiniLang interpreter.
"""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from toolchain import ROOT

LEDGER = ROOT / "PORT_LEDGER.json"
REPORT = ROOT / "docs" / "ORIGINAL_PARITY_REPORT.md"
JSON_REPORT = ROOT / "build" / "parity-inventory.json"
IN_SCOPE = {"runtime", "missionpack", "platform"}
# Include platform and missionpack implementation languages, not just C.
SOURCE_SUFFIXES = {".c", ".h", ".asm", ".cpp", ".cc", ".cxx", ".hpp", ".hxx", ".m", ".mm", ".s"}


def domain(source: str) -> str:
    parts = source.replace("\\", "/").split("/")
    if len(parts) >= 2 and parts[0] == "code":
        return parts[1]
    return parts[0]


def mapped(candidate: str, mappings: list[dict]) -> bool:
    """Match complete, case-sensitive symbol identities, never substrings.

    New records enumerate original_symbols. Historical records containing
    slash/comma-separated names are read as identifier tokens. Descriptions
    such as "all 31 cvar symbols" and covers_all_candidates do not establish
    the identity of any symbol and must be reconciled explicitly.
    """
    for item in mappings:
        explicit = item.get("original_symbols")
        if explicit is not None:
            if not isinstance(explicit, list) or not all(isinstance(x, str) for x in explicit):
                raise ValueError("original_symbols must be a list of symbol names")
            if candidate in explicit:
                return True
        elif candidate in re.findall(r"[A-Za-z_][A-Za-z_0-9]*", str(item.get("original", ""))):
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
        unmapped_symbols = [name for name in candidates if not mapped(name, mappings)]
        ledger_status = item.get("status", "not_started")
        # A file cannot be called completely ported while the same ledger row
        # still names original symbols for which no MiniLang mapping exists.
        # Keep the declared value for auditability, but derive all totals from
        # the stricter effective state.
        effective_status = ledger_status
        if ledger_status == "ported":
            if not candidates:
                effective_status = "unassessed"
            elif unmapped_symbols:
                effective_status = "partial"
        rows.append(
            {
                "source": item["source"],
                "domain": domain(item["source"]),
                "category": item.get("category", ""),
                "symbol_inventory": "enumerated" if candidates else "empty_not_proof_of_completion",
                "coverage_kinds": sorted({str(m.get("kind", "legacy_unclassified")) for m in mappings}),
                "runtime_integration": "not_inferred_from_symbol_mapping",
                "behavior_acceptance": "not_inferred_from_symbol_mapping",
                "scope_disposition": item.get("scope_disposition", "requires_review" if ledger_status == "not_started" else "in_inventory"),
                "status": effective_status,
                "ledger_status": ledger_status,
                "candidate_symbols": candidates,
                "mapped_symbols": [name for name in candidates if mapped(name, mappings)],
                "unmapped_symbols": unmapped_symbols,
                "targets": list(item.get("target", [])),
                "tests": list(item.get("tests", [])),
            }
        )
    status = Counter(row["status"] for row in rows)
    by_domain: dict[str, Counter] = defaultdict(Counter)
    for row in rows:
        by_domain[row["domain"]][row["status"]] += 1
    return {
        "schema": 2,
        "upstream_commit": ledger.get("upstream_commit", ""),
        "scope_categories": sorted(IN_SCOPE),
        "source_suffixes": sorted(SOURCE_SUFFIXES),
        "summary": {
            "files": len(rows),
            "status": dict(sorted(status.items())),
            "open_symbols": sum(len(row["unmapped_symbols"]) for row in rows),
            "status_corrections": sum(row["status"] != row["ledger_status"] for row in rows),
            "empty_symbol_inventories": sum(not row["candidate_symbols"] for row in rows),
        },
        "domains": {name: dict(sorted(values.items())) for name, values in sorted(by_domain.items())},
        "files": rows,
    }


def markdown(inventory: dict) -> str:
    lines = [
        "# Original-source mapping inventory",
        "",
        "Generated by `python scripts/parity_inventory.py` from `PORT_LEDGER.json`.",
        "All runtime, platform and missionpack source languages are included, including",
        "Objective-C, C++ and Unix assembly. Nothing is silently excluded by platform.",
        "",
        "**This is a symbol-mapping inventory, not an implementation-completion percentage.**",
        "The historical `ported` label below means that the recorded symbol candidates",
        "have identity mappings. ABI tables, wrappers, native implementations, original",
        "QVM execution, productive integration and behavioral acceptance are different",
        "claims. An ABI-table mapping does not prove a complete syscall implementation.",
        "Empty symbol inventories are `unassessed`, not automatically complete.",
        "Descriptions and blanket covers-all flags do not replace explicit identities.",
        "",
        "## Summary",
        "",
        "| Domain | Files | Mapped (`ported`) | Partial | Not started | Retained original | Unassessed |",
        "|---|---:|---:|---:|---:|---:|---:|",
    ]
    states = ["ported", "partial", "not_started", "retained_original", "unassessed"]
    for name, values in inventory["domains"].items():
        lines.append("| `" + name + "` | " + str(sum(values.values())) + " | " +
                     " | ".join(str(values.get(state, 0)) for state in states) + " |")
    summary = inventory["summary"]
    lines += ["| **Total** | **" + str(summary["files"]) + "** | " +
              " | ".join(str(summary["status"].get(state, 0)) for state in states) + " |",
              "", f"Unresolved symbol identities: **{summary['open_symbols']}**.",
              f"Empty symbol inventories: **{summary['empty_symbol_inventories']}**.",
              f"Effective status corrections: **{summary['status_corrections']}**.",
              "", "## File and symbol matrix", "",
              "| Original file | Effective | Declared | Candidates | Mapped | Unresolved | Coverage kind |",
              "|---|---|---|---:|---:|---:|---|"]
    for row in inventory["files"]:
        lines.append(f"| `{row['source']}` | `{row['status']}` | `{row['ledger_status']}` | "
                     f"{len(row['candidate_symbols'])} | {len(row['mapped_symbols'])} | "
                     f"{len(row['unmapped_symbols'])} | {', '.join(row['coverage_kinds']) or 'none'} |")
    lines += ["", "## Unresolved identities", "",
              "These are mapping gaps, not automatically missing runtime functions.", ""]
    for row in inventory["files"]:
        if row["unmapped_symbols"]:
            lines += ["### `" + row["source"] + "`", "",
                      ", ".join("`" + x + "`" for x in row["unmapped_symbols"]), ""]
    lines += ["## Source units awaiting a scope decision", "",
              "A Windows x64 implementation may deliberately replace a legacy host or",
              "assembler backend. Such a decision needs an explicit, reviewed record;",
              "a missing mapping is not silently classified as an equivalent replacement.", ""]
    for row in inventory["files"]:
        if row["scope_disposition"] == "requires_review":
            lines.append(f"- `{row['source']}`: {row['status']}; integration and acceptance not established.")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="fail if the checked-in report is stale")
    args = parser.parse_args()
    inventory = build_inventory()
    content = markdown(inventory)
    json_content = json.dumps(inventory, indent=2) + "\n"
    if args.check:
        if not REPORT.exists() or REPORT.read_text(encoding="utf-8") != content:
            raise SystemExit("docs/ORIGINAL_PARITY_REPORT.md is stale; run scripts/parity_inventory.py")
        print(f"PASS: parity inventory covers {inventory['summary']['files']} original runtime/platform files")
        return 0
    REPORT.write_text(content, encoding="utf-8", newline="\n")
    JSON_REPORT.parent.mkdir(parents=True, exist_ok=True)
    JSON_REPORT.write_text(json_content, encoding="utf-8", newline="\n")
    print(f"Wrote {REPORT.relative_to(ROOT)} for {inventory['summary']['files']} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
