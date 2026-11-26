#!/usr/bin/env python3
"""Inventory MiniLang function contracts without changing source semantics.

The scanner recognizes declarations (including struct methods) and balances
the parameter parentheses. It is an inventory, not a type inference engine:
only a compiled call graph and runtime evidence can establish safe contracts.
"""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path

from toolchain import ROOT


DECL = re.compile(
    r"^\s*(?P<prefix>(?:(?:static|override|iterator|lazy|async|synchronized)\s+)*)"
    r"function\s+(?P<inline>inline\s+)?(?P<name>[A-Za-z_]\w*)\s*\(",
    re.MULTILINE,
)
TYPE = re.compile(r"\bas\s+([A-Za-z_]\w*(?:<[^>]+>)?\??)\s*(?:=|$)")
RETURN = re.compile(r"^\s*returns\s+([A-Za-z_]\w*(?:<[^>]+>)?\??)(?=\s|$)")
CALL = re.compile(r"\b([A-Za-z_]\w*)\s*\(")
QUALIFIED_CALL = re.compile(r"\b([A-Za-z_]\w*)\.([A-Za-z_]\w*)\s*\(")
IMPORT = re.compile(r"^\s*import\s+(mq3(?:\.[A-Za-z_]\w*)+)(?:\s+as\s+([A-Za-z_]\w*))?", re.MULTILINE)
RETURN_EXPR = re.compile(r"\breturn\b[ \t]*([^;\r\n]*?)\s*(?=\bend (?:if|for|while|function)\b|$|;)", re.MULTILINE)
LITERAL = re.compile(r'^(?:true|false|[+-]?(?:0x[0-9a-fA-F]+|\d+)(?:\.\d+)?|"(?:[^"\\]|\\.)*")$')
PROFILED_AREAS = (
    ("src/mq3/compat/numeric.ml", "shared integer and binary32 helpers"),
    ("src/mq3/collision/", "collision/brush/leaf queries"),
    ("src/mq3/vm/syscall_cgame", "Cgame collision traps"),
    ("src/mq3/vm/syscall_qagame_world", "Qagame world traces"),
    ("src/mq3/renderer/", "scene preparation and submission"),
    ("src/mq3/botlib/", "bot routing and AAS"),
    ("src/mq3/engine/local_qvm_match.ml", "local QVM host"),
    ("src/mq3/client/qvm_preview_app.ml", "desktop frame host"),
)


def closing_paren(source: str, start: int) -> int:
    depth = 1
    quote = ""
    escaped = False
    for index in range(start, len(source)):
        ch = source[index]
        if quote:
            if escaped:
                escaped = False
            elif ch == "\\":
                escaped = True
            elif ch == quote:
                quote = ""
        elif ch in ('"', "'"):
            quote = ch
        elif ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0:
                return index
    raise ValueError("unclosed function parameter list")


def parameters(signature: str) -> list[str]:
    if not signature.strip():
        return []
    result = []
    start = 0
    nesting = 0
    for index, ch in enumerate(signature):
        if ch in "([{":
            nesting += 1
        elif ch in ")]}":
            nesting -= 1
        elif ch == "," and nesting == 0:
            result.append(signature[start:index].strip())
            start = index + 1
    result.append(signature[start:].strip())
    return result


def return_shape(body: str) -> str:
    """Conservative lexical triage, explicitly not a type proof."""
    if re.search(r"\b(?:error|fail|try)\s*\(|\bis error\b", body):
        return "error_possible"
    if re.search(r"\bfunction\b", body):
        return "dynamic_or_nested"
    returns = [match.group(1).strip() for match in RETURN_EXPR.finditer(body)]
    if not returns or all(value in ("", "void") for value in returns):
        return "void_candidate"
    if returns and all(LITERAL.fullmatch(value) for value in returns):
        return "literal_scalar_candidate"
    return "dynamic_or_unproven"


def inventory(source_root: Path) -> list[dict]:
    found = []
    source_calls = {}
    qualified_calls = Counter()
    for file in sorted(source_root.rglob("*.ml")):
        source = file.read_text(encoding="utf-8")
        relative = file.relative_to(ROOT).as_posix()
        source_calls[relative] = Counter(CALL.findall(source))
        aliases = {alias or package.rsplit(".", 1)[-1]: package
                   for package, alias in IMPORT.findall(source)}
        for alias, name in QUALIFIED_CALL.findall(source):
            package = aliases.get(alias)
            if package:
                qualified_calls[("src/" + package.replace(".", "/") + ".ml", name)] += 1
        for match in DECL.finditer(source):
            end = closing_paren(source, match.end())
            params = parameters(source[match.end():end])
            line_end = source.find("\n", end + 1)
            if line_end < 0:
                line_end = len(source)
            rest = source[end + 1:line_end]
            return_match = RETURN.match(rest)
            function_end = source.find("end function", end + 1)
            body = source[end + 1:function_end if function_end >= 0 else len(source)]
            types = []
            for param in params:
                typed = TYPE.search(param)
                types.append(typed.group(1) if typed else None)
            found.append({
                "file": relative,
                "line": source.count("\n", 0, match.start()) + 1,
                "name": match.group("name"),
                "parameters": types,
                "return": return_match.group(1) if return_match else None,
                "inline": bool(match.group("inline")),
                "return_shape": return_shape(body),
            })
    for row in found:
        row["static_local_calls"] = max(0, source_calls[row["file"]][row["name"]] - 1)
        row["static_qualified_calls"] = qualified_calls[(row["file"], row["name"])]
        row["static_call_sites"] = row["static_local_calls"] + row["static_qualified_calls"]
        row["profiled_area"] = next((area for prefix, area in PROFILED_AREAS
                                     if row["file"].startswith(prefix)), None)
    return found


def attach_profile(rows: list[dict], profile_path: Path | None) -> tuple[int, int]:
    """Apply observed qualified call counts; ambiguous bare names stay unassigned."""
    name_occurrences = Counter(row["name"] for row in rows)
    observed = {}
    if profile_path:
        profile_line = re.compile(r"^\[call-profile\] name=(\S+) calls=(\d+)$")
        for line in profile_path.read_text(encoding="utf-8").splitlines():
            matched = profile_line.match(line)
            if matched:
                observed[matched.group(1)] = int(matched.group(2))
    for row in rows:
        qualified = row["file"].removeprefix("src/").removesuffix(".ml").replace("/", ".") + "." + row["name"]
        # Imported functions in the Retail replay have fully qualified names.
        # Bare names can occur for a top-level fixture; map those only when
        # unique across the source tree.
        row["runtime_calls"] = observed.get(qualified)
        if row["runtime_calls"] is None and name_occurrences[row["name"]] == 1:
            row["runtime_calls"] = observed.get(row["name"])
        row["priority"] = ("P1_measured" if row["runtime_calls"] is not None and row["runtime_calls"] >= 10000
                           else "P2_profiled_area" if row["profiled_area"] and row["static_call_sites"] >= 10
                           else "P3_review")
    return (sum(row["runtime_calls"] is not None for row in rows),
            sum(name in observed and count > 1 for name, count in name_occurrences.items()))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, help="Write machine-readable inventory JSON")
    parser.add_argument("--top", type=int, default=10, help="Show this many files with missing contracts")
    parser.add_argument("--call-profile", type=Path,
                        help="Optional [call-profile] output from a --profile-calls game replay")
    args = parser.parse_args()
    rows = inventory(ROOT / "src/mq3")
    profile_matches, ambiguous_names = attach_profile(rows, args.call_profile)
    total = len(rows)
    typed_return = sum(row["return"] is not None for row in rows)
    typed_parameters = sum(t is not None for row in rows for t in row["parameters"])
    all_parameters = sum(len(row["parameters"]) for row in rows)
    complete = sum(row["return"] is not None and all(t is not None for t in row["parameters"]) for row in rows)
    inline = sum(row["inline"] for row in rows)
    missing = Counter(row["file"] for row in rows
                      if row["return"] is None or any(t is None for t in row["parameters"]))
    summary = {
        "functions": total,
        "parameters": all_parameters,
        "typed_parameters": typed_parameters,
        "typed_returns": typed_return,
        "complete_signatures": complete,
        "explicit_inline": inline,
        "files": len({row["file"] for row in rows}),
        "largest_untyped_files": missing.most_common(args.top),
        "return_shapes": dict(Counter(row["return_shape"] for row in rows)),
        "priorities": dict(Counter(row["priority"] for row in rows)),
        "runtime_profile_matches": profile_matches,
        "ambiguous_profile_names": ambiguous_names,
        "top_static_call_sites": [
            {"file": row["file"], "name": row["name"], "static_call_sites": row["static_call_sites"]}
            for row in sorted(rows, key=lambda value: value["static_call_sites"], reverse=True)[:args.top]
        ],
    }
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps({"summary": summary, "functions": rows}, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
