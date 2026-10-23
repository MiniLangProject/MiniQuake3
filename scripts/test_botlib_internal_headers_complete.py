#!/usr/bin/env python3
"""Complete ownership, unchanged-C ABI, and retail evidence for internal botlib headers."""
from __future__ import annotations

import argparse
import json
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


HEADERS = """be_aas_bsp.h be_aas_cluster.h be_aas_debug.h be_aas_def.h
be_aas_entity.h be_aas_file.h be_aas_funcs.h be_aas_main.h be_aas_move.h
be_aas_optimize.h be_aas_reach.h be_aas_route.h be_aas_routealt.h
be_aas_sample.h be_ai_weight.h be_interface.h l_log.h l_memory.h l_precomp.h
l_script.h l_struct.h l_utils.h""".split()
EXPECTED = [22, 119, 110, 25, 227, 5, 236]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def exported_list(text: str, function: str) -> list[str]:
    match = re.search(
        r"function\s+" + re.escape(function) + r"\(\)\s+return\s+\[(.*?)\]\s+end function",
        text,
        re.S,
    )
    if not match:
        raise RuntimeError(f"missing {function} inventory")
    return re.findall(r'"([^"]+)"', match.group(1))


def retail_aas_probe(data_root: Path) -> dict[str, int]:
    baseq3 = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    maps = areas = reaches = 0
    for archive in sorted(baseq3.glob("*.pk3")):
        with zipfile.ZipFile(archive) as pak:
            for name in pak.namelist():
                if not name.lower().endswith(".aas"):
                    continue
                data = pak.read(name)
                if len(data) < 124:
                    raise RuntimeError(f"truncated retail AAS: {name}")
                ident, version = struct.unpack_from("<II", data)
                if ident != 0x53414145 or version not in (4, 5):
                    raise RuntimeError(f"unsupported retail AAS: {name}")
                header = bytearray(data[:124])
                if version == 5:
                    for index in range(116):
                        header[8 + index] ^= (index * 119) & 255
                area_offset, area_length = struct.unpack_from("<II", header, 12 + 8 * 8)
                reach_offset, reach_length = struct.unpack_from("<II", header, 12 + 9 * 8)
                if area_offset + area_length > len(data) or area_length % 28:
                    raise RuntimeError(f"invalid area lump: {name}")
                if reach_offset + reach_length > len(data) or reach_length % 44:
                    raise RuntimeError(f"invalid reachability lump: {name}")
                maps += 1
                areas += area_length // 28
                reaches += reach_length // 44
    if maps == 0 or areas == 0 or reaches == 0:
        raise RuntimeError(f"retail AAS corpus missing below {baseq3}")
    return {"maps": maps, "areas": areas, "reachabilities": reaches}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    source_root = ROOT / "Quake-III-Arena-original-source/code/botlib"
    facade = ROOT / "src/mq3/botlib/internal_headers.ml"
    text = facade.read_text(encoding="utf-8")
    inventories = {
        "headers": exported_list(text, "headerNames"),
        "macros": exported_list(text, "macroNames"),
        "constants": exported_list(text, "constantNames"),
        "types": exported_list(text, "typeNames"),
        "declarations": exported_list(text, "declarationNames"),
        "globals": exported_list(text, "globalNames"),
        "fields": exported_list(text, "fieldNames"),
    }
    counts = [len(inventories[key]) for key in ("headers", "macros", "constants", "types", "declarations", "globals", "fields")]
    if counts != EXPECTED or inventories["headers"] != HEADERS:
        raise RuntimeError(f"botlib header inventory drift: {counts}")
    original = "\n".join((source_root / name).read_text(encoding="latin1") for name in HEADERS)
    absent = [name for key in ("macros", "types", "declarations", "globals") for name in inventories[key]
              if not re.search(r"\b" + re.escape(name) + r"\b", original)]
    absent += [field for field in inventories["fields"] if not re.search(r"\b" + re.escape(field.split(".", 1)[1]) + r"\b", original)]
    if absent:
        raise RuntimeError(f"facade symbols absent from original headers: {absent[:20]}")
    productive = "\n".join(
        path.read_text(encoding="utf-8")
        for path in (ROOT / "src/mq3/botlib").glob("*.ml")
        if path.name != facade.name
    )
    missing_productive = [name for name in inventories["declarations"] if not re.search(r"\b" + re.escape(name) + r"\b", productive)]
    if missing_productive:
        raise RuntimeError(f"unowned botlib declarations: {missing_productive}")
    required = {
        "src/mq3/botlib/l_precomp.ml": ["botlibHeaders.INDENT_IF", "botlibHeaders.INDENT_IFNDEF"],
        "src/mq3/botlib/ai_map_goals.ml": ["botlibHeaders.MAX_EPAIRKEY"],
    }
    for relative, needles in required.items():
        module = (ROOT / relative).read_text(encoding="utf-8")
        for needle in needles:
            if needle not in module:
                raise RuntimeError(f"{relative} does not consume canonical {needle}")

    out = ROOT / "build/reference/botlib_internal_headers"
    out.mkdir(parents=True, exist_ok=True)
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/WX",
         ROOT / "tests/reference/botlib_internal_headers_oracle.c", f"/Fe:{oracle}", "/link", "/Brepro"],
        ROOT,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    expected = run([oracle], out, log=out / "oracle.log").replace("\r\n", "\n")
    actual = run(
        [build("tests/botlib_internal_headers_oracle.ml", "botlib_internal_headers_oracle.exe")],
        ROOT / "build",
        log=out / "minilang.log",
    ).replace("\r\n", "\n")
    if expected != actual:
        (out / "expected.txt").write_text(expected, encoding="utf-8")
        (out / "actual.txt").write_text(actual, encoding="utf-8")
        raise RuntimeError("internal botlib header unchanged-C mismatch")
    contracts = run(
        [build("tests/botlib_internal_headers_contracts.ml", "botlib_internal_headers_contracts.exe")],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    if contracts != "PASS: 23 botlib internal header contracts":
        raise RuntimeError(contracts)
    retail = None
    if args.data_root:
        retail = retail_aas_probe(args.data_root)

    files = [source_root / name for name in HEADERS] + [
        facade,
        ROOT / "tests/reference/botlib_internal_headers_oracle.c",
        ROOT / "tests/botlib_internal_headers_oracle.ml",
        ROOT / "tests/botlib_internal_headers_contracts.ml",
    ]
    result = {
        "passed": True,
        "inventory": dict(zip(("headers", "macros", "constants", "types", "declarations", "globals", "fields"), counts)),
        "oracle_records": len(expected.splitlines()),
        "contracts": 23,
        "retail": retail,
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    suffix = ""
    if retail:
        suffix = f" + {retail['maps']} retail AAS maps/{retail['areas']} areas/{retail['reachabilities']} reaches"
    print("PASS: 22 botlib headers / 119 macros + 110 constants + 25 types + 227 declarations + 236 fields + EC + 23 contracts" + suffix)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
