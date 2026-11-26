#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0-or-later
"""Validate a completed MiniDoc HTML/Markdown reference using only the stdlib.

Run from any directory:
    python docs/verification/verify_minidoc.py --revision <source-commit>

This checks generated output, not gameplay behavior or the truth of API prose.
"""
from __future__ import annotations

import argparse
from collections import Counter
import html
from html.parser import HTMLParser
import json
from pathlib import Path
import re
from urllib.parse import unquote, urlsplit
import xml.etree.ElementTree as ET


class Page(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.ids: list[str] = []
        self.links: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        values = dict(attrs)
        if values.get("id"):
            self.ids.append(values["id"])
        if tag == "a" and values.get("name") and values.get("name") != values.get("id"):
            self.ids.append(values["name"])
        for attribute in ("href", "src"):
            if values.get(attribute):
                self.links.append(values[attribute])

    handle_startendtag = handle_starttag


def markdown_prose(text: str) -> str:
    """Exclude fenced examples from link/anchor validation."""
    result = []
    fence = ""
    for line in text.splitlines():
        marker = re.match(r"^\s*(`{3,}|~{3,})", line)
        if marker:
            current = marker.group(1)
            if not fence:
                fence = current
            elif current[0] == fence[0] and len(current) >= len(fence):
                fence = ""
            continue
        if not fence:
            result.append(line)
    return "\n".join(result)


def markdown_page(text: str) -> Page:
    text = markdown_prose(text)
    page = Page()
    page.feed(text)
    seen: Counter[str] = Counter()
    for heading in re.findall(r"^#{1,6}\s+(.+?)(?:\s+#+)?$", text, re.MULTILINE):
        heading = re.sub(r"<[^>]+>", "", html.unescape(heading)).replace("`", "")
        slug = re.sub(r"[^\w\- ]", "", heading.lower()).replace(" ", "-")
        count = seen[slug]
        seen[slug] += 1
        page.ids.append(slug if count == 0 else f"{slug}-{count}")
    for target in re.findall(r"\[[^\]\n]*\]\(([^\s)]+)(?:\s+[^)]*)?\)", text):
        page.links.append(html.unescape(target.strip("<>")))
    return page


def verify(repo: Path, revision: str | None, version: str | None) -> dict:
    errors: list[str] = []
    roots = [repo / "docs/api/html", repo / "docs/api/markdown"]
    files: list[Path] = []
    manifests = []
    for root in roots:
        manifest = root / ".minidoc-output"
        if not manifest.is_file():
            errors.append(f"Missing output manifest: {manifest.relative_to(repo)}")
        names = manifest.read_text(encoding="utf-8").splitlines() if manifest.is_file() else []
        actual = {p.relative_to(root).as_posix() for p in root.rglob("*")
                  if p.is_file() and p != manifest}
        duplicates = [name for name, count in Counter(names).items() if count > 1]
        if duplicates:
            errors.append(f"Duplicate manifest entries in {root.name}: {duplicates[:10]}")
        unsafe = [name for name in names if not name or Path(name).is_absolute()
                  or ".." in Path(name).parts or "\\" in name]
        if unsafe:
            errors.append(f"Invalid manifest entries in {root.name}: {unsafe[:10]}")
        missing = sorted(set(names) - actual)
        unlisted = sorted(actual - set(names))
        if missing:
            errors.append(f"Missing generated files in {root.name}: {missing[:10]}")
        if unlisted and manifest.is_file():
            errors.append(f"Unlisted generated files in {root.name}: {unlisted[:10]}")
        files.extend(root / name for name in sorted(actual))
        manifests.append({"format": root.name, "files": len(actual)})

    required = ["html/index.html", "html/diagnostics.html", "html/metrics.html",
                "markdown/README.md", "markdown/Diagnostics.md", "markdown/Metrics.md"]
    for name in required:
        if not (repo / "docs/api" / name).is_file():
            errors.append(f"Missing required page: docs/api/{name}")
    for name in ("html/index.html", "markdown/README.md"):
        path = repo / "docs/api" / name
        if not path.is_file():
            continue
        text = path.read_text(encoding="utf-8")
        short_revision = revision[:12] if revision and re.fullmatch(r"[0-9a-fA-F]{40}", revision) else revision
        if revision and revision not in text and short_revision not in text:
            errors.append(f"Wrong source revision in {name}")
        if version and f"MiniDoc {version}" not in text:
            errors.append(f"Wrong generator version in {name}")

    pages: dict[Path, Page] = {}
    json_count = svg_count = 0
    for path in files:
        suffix = path.suffix.lower()
        if path.stat().st_size == 0:
            errors.append(f"Empty generated file: {path.relative_to(repo)}")
        try:
            if suffix == ".html":
                page = Page()
                text = path.read_text(encoding="utf-8")
                page.feed(text)
                if not re.search(r"</body>\s*</html>\s*$", text, re.IGNORECASE):
                    errors.append(f"Incomplete HTML document: {path.relative_to(repo)}")
                pages[path.resolve()] = page
            elif suffix == ".md":
                pages[path.resolve()] = markdown_page(path.read_text(encoding="utf-8"))
            elif suffix == ".json":
                data = json.loads(path.read_text(encoding="utf-8"))
                if path.name == "search-index.json":
                    if not isinstance(data, list):
                        errors.append("Search index must contain an array")
                    else:
                        page = Page()
                        for item in data:
                            if not isinstance(item, dict) or not isinstance(item.get("url"), str) or not item["url"]:
                                errors.append("Search entry is missing its URL")
                            else:
                                page.links.append(item["url"])
                        pages[path.resolve()] = page
                json_count += 1
            elif suffix == ".svg":
                tree = ET.parse(path)
                page = Page()
                for item in tree.iter():
                    if item.get("id"):
                        page.ids.append(item.get("id"))
                    for attribute in ("href", "{http://www.w3.org/1999/xlink}href"):
                        if item.get(attribute):
                            page.links.append(item.get(attribute))
                pages[path.resolve()] = page
                svg_count += 1
        except (UnicodeError, ValueError, ET.ParseError) as exc:
            errors.append(f"Malformed {path.relative_to(repo)}: {exc}")

    ids: dict[Path, set[str]] = {}
    for path, page in pages.items():
        repeated = [name for name, count in Counter(page.ids).items() if count > 1]
        if repeated:
            errors.append(f"Duplicate anchors in {path.relative_to(repo)}: {repeated[:10]}")
        ids[path] = set(page.ids)
    links_count = fragment_count = 0
    for path, page in pages.items():
        for link in page.links:
            parsed = urlsplit(link)
            if parsed.scheme or parsed.netloc:
                continue
            links_count += 1
            destination = (path.parent / unquote(parsed.path)).resolve() if parsed.path else path
            if not destination.is_file():
                errors.append(f"Broken local link in {path.relative_to(repo)}: {link}")
                continue
            if parsed.fragment:
                fragment_count += 1
                if destination not in ids or unquote(parsed.fragment) not in ids[destination]:
                    errors.append(f"Broken fragment in {path.relative_to(repo)}: {link}")
    return {"generated_files": len(files), "manifests": manifests,
            "local_links": links_count, "fragment_references": fragment_count,
            "json_files": json_count, "svg_files": svg_count,
            "expected_source_revision": revision, "expected_generator_version": version,
            "defects": len(errors), "errors": errors}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--revision")
    parser.add_argument("--generator-version")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify(args.repo.resolve(), args.revision, args.generator_version)
    encoded = json.dumps(result, indent=2) + "\n"
    if args.output:
        args.output.write_text(encoded, encoding="utf-8")
    print(encoded, end="")
    return 1 if result["defects"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
