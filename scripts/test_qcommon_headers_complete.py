#!/usr/bin/env python3
"""Complete declaration/ABI and Retail gate for six QCommon headers."""
from __future__ import annotations
import argparse, json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run

HEADERS = ("cm_local.h", "cm_patch.h", "cm_polylib.h", "cm_public.h", "qcommon.h", "unzip.h")

def clean(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
    return re.sub(r"//[^\n]*", " ", text)

def inventory(path: Path):
    text = clean(path.read_text(encoding="latin1"))
    macros = set(re.findall(r"^\s*#\s*define\s+([A-Za-z_]\w*)", text, re.M))
    enums = set()
    for body in re.findall(r"typedef\s+enum\s*\{(.*?)\}\s*\w+\s*;", text, re.S):
        enums.update(m.group(1) for part in body.split(",") if (m := re.match(r"\s*([A-Za-z_]\w*)", part)))
    types = set(re.findall(r"}\s*([A-Za-z_]\w*)\s*;", text))
    for statement in re.findall(r"\btypedef\b[^;]+;", text, re.S):
        if "{" in statement: continue
        fp = re.search(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", statement)
        if fp:
            types.add(fp.group(1)); continue
        body = re.sub(r"\[[^]]*\]", "", statement)
        match = re.search(r"([A-Za-z_]\w*)\s*;\s*$", body)
        if match: types.add(match.group(1))
    source = re.sub(r"^\s*#.*$", " ", text, flags=re.M)
    prototype = r"(?:^|;)\s*(?:extern\s+)?(?:const\s+)?(?:struct\s+\w+\s+)?(?:[A-Za-z_]\w*\s+|\*\s*|QDECL\s+)+([A-Za-z_]\w*)\s*\("
    functions = set(re.findall(prototype, source, re.M)); functions.discard("void")
    globals_ = set()
    for statement in source.split(";"):
        compact = " ".join(statement.split())
        if re.search(r"\bextern\b", compact) and "(" not in compact:
            match = re.search(r"([A-Za-z_]\w*)(?:\s*\[[^]]*\])?\s*$", compact)
            if match: globals_.add(match.group(1))
    fields = set()
    for match in re.finditer(r"typedef\s+struct(?:\s+\w+)?\s*\{(.*?)\}\s*([A-Za-z_]\w*)\s*;", source, re.S):
        body, typename = match.group(1), match.group(2)
        for statement in body.split(";"):
            fp = re.search(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", statement)
            if fp:
                fields.add(f"{typename}.{fp.group(1)}"); continue
            statement = re.sub(r"\[[^]]*\]", "", statement)
            for declarator in statement.split(","):
                identifiers = re.findall(r"[A-Za-z_]\w*", declarator)
                if identifiers: fields.add(f"{typename}.{identifiers[-1]}")
    return macros, enums, types, functions, globals_, fields

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source,
                    "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output

def invoke(name: str, *arguments: object) -> str:
    result = subprocess.run([sys.executable, ROOT / "scripts" / name, *map(str, arguments)],
                            cwd=ROOT, check=True, text=True, capture_output=True, timeout=900)
    return result.stdout.strip().splitlines()[-1]

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/qcommon"
    paths = {name: source / name for name in HEADERS}
    inventories = {name: inventory(path) for name, path in paths.items()}
    expected = [set().union(*(value[index] for value in inventories.values())) for index in range(6)]
    port = ROOT / "src/mq3/qcommon/headers.ml"
    port_text = port.read_text(encoding="utf-8")
    quoted = set(re.findall(r'"([^"\\]*(?:\\.[^"\\]*)*)"', port_text))
    labels = ("macros", "enums", "types", "functions", "globals", "fields")
    missing = {label: sorted(values - quoted) for label, values in zip(labels, expected) if values - quoted}
    if missing: raise RuntimeError(f"QCommon facade incomplete: {missing}")
    wiring = {
        ROOT / "src/mq3/collision/world.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/collision/winding.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/collision/patchmesh.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/collision/patchtrace.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/qcommon/netchan.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/qcommon/common.ml": "mq3.qcommon.headers",
        ROOT / "src/mq3/format/unzip.ml": "mq3.qcommon.headers",
    }
    for path, needle in wiring.items():
        if needle not in path.read_text(encoding="utf-8"): raise RuntimeError(f"missing productive wiring: {path}")
    out = ROOT / "build/reference/qcommon_headers"; out.mkdir(parents=True, exist_ok=True)
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/W3", "/DWIN32",
         "/I" + str(source), "/I" + str(source.parent / "game"),
         ROOT / "tests/reference/qcommon_headers_oracle.c", f"/Fe:{oracle}",
         "/link", "/Brepro"], ROOT, msvc_env("x86"), out / "oracle-build.log")
    unchanged = run([oracle], out, log=out / "oracle.log").replace("\r\n", "\n")
    actual = run([build("tests/qcommon_headers_oracle.ml", "qcommon_headers_oracle.exe")],
                 ROOT / "build", log=out / "minilang.log").replace("\r\n", "\n")
    if unchanged != actual:
        (out / "expected.txt").write_text(unchanged, encoding="utf-8")
        (out / "actual.txt").write_text(actual, encoding="utf-8")
        raise RuntimeError("QCommon unchanged x86 C ABI mismatch")
    contracts = run([build("tests/qcommon_headers_contracts.ml", "qcommon_headers_contracts.exe")],
                    ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 18 qcommon header contracts": raise RuntimeError(contracts)
    pak = args.data_root / "baseq3/pak0.pk3"
    if not pak.is_file(): raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
    cm_load = invoke("test_cm_load_complete.py", args.data_root, "--map", "q3dm1")
    cm_patch = invoke("test_cm_patch_complete.py", args.data_root, "--map", "q3dm1")
    cm_trace = invoke("test_cm_trace_complete.py", args.data_root)
    unzip = invoke("test_unzip_complete.py", "--data-root", args.data_root)
    files = list(paths.values()) + [port, *wiring.keys(), ROOT / "tests/reference/qcommon_headers_oracle.c",
            ROOT / "tests/qcommon_headers_oracle.ml", ROOT / "tests/qcommon_headers_contracts.ml"]
    result = {"passed": True, "headers": len(HEADERS),
              **{label: len(values) for label, values in zip(labels, expected)},
              "source_occurrences": [sum(len(value[index]) for value in inventories.values()) for index in range(6)],
              "unchanged_x86_records": len(unchanged.splitlines()), "contracts": 18,
              "retail": {"cm_load": cm_load, "cm_patch": cm_patch, "cm_trace": cm_trace, "unzip": unzip},
              "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 6 QCommon headers / {len(expected[0])} macros + {len(expected[1])} enums + "
          f"{len(expected[2])} types + {len(expected[3])} functions + {len(expected[4])} globals + "
          f"{len(expected[5])} fields + {len(unchanged.splitlines())} x86 ABI records + 18 contracts + Retail BSP/PK3")
    return 0

if __name__ == "__main__": raise SystemExit(main())
