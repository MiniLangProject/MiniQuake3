"""Verify the complete native code/botlib/l_precomp.c adapter."""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


def build_ml(source: str, output: str) -> None:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    out = ROOT / "build/reference/l_precomp"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/botlib/l_precomp.c")
    symbols = entry["symbol_candidates"]
    if len(symbols) != 82:
        raise RuntimeError(f"unexpected ledger symbol count: {len(symbols)}")
    original = ROOT / "Quake-III-Arena-original-source/code/botlib/l_precomp.c"
    module = ROOT / "src/mq3/botlib/l_precomp.ml"
    original_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8-sig")
    absent = [name for name in symbols if not re.search(rf"\b{re.escape(name)}\s*\(", original_text)]
    missing = [name for name in symbols if not re.search(rf"(?m)^function\s+{re.escape(name)}\s*\(", module_text)]
    if absent or missing:
        raise RuntimeError(f"symbol mismatch original={absent} minilang={missing}")
    for anchor in (
        "DEFINEHASHSIZE", "PC_ExpandBuiltinDefine", "PC_DollarDirective_evalint",
        "PC_ReadTokenHandle", "PC_CheckOpenSourceHandles", "__LINE__", "__FILE__",
        "#include without file name", "out of operator space",
    ):
        if anchor not in original_text:
            raise RuntimeError(f"missing l_precomp source anchor: {anchor}")

    oracle_source = ROOT / "tests/reference/l_precomp_oracle.c"
    oracle_exe = out / "l_precomp_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS", oracle_source,
         f"/Fe:{oracle_exe}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "oracle-build.log",
    )
    oracle = run([oracle_exe], out, log=out / "oracle.log").strip()
    if oracle != "PASS: 25 unchanged-C l_precomp observations":
        raise RuntimeError(oracle)

    build_ml("tests/l_precomp_contracts.ml", "l_precomp_contracts.exe")
    native = run([ROOT / "build/l_precomp_contracts.exe"], ROOT, log=out / "contracts.log").strip()
    if native != "PASS: 49 l_precomp native contracts":
        raise RuntimeError(native)

    build_ml("tests/l_precomp_retail_probe.ml", "l_precomp_retail_probe.exe")
    pak = args.data_root / "baseq3/pak0.pk3"
    retail = run([ROOT / "build/l_precomp_retail_probe.exe", pak], ROOT, log=out / "retail.log").strip()
    if not retail.startswith("PASS: 6 retail l_precomp probes"):
        raise RuntimeError(retail)

    files = [module, ROOT / "src/mq3/vm/cgame_pc_traps.ml", oracle_source,
             ROOT / "tests/l_precomp_contracts.ml", ROOT / "tests/l_precomp_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(symbols),
        "oracle": oracle,
        "native": native,
        "retail": retail,
        "scope": "All l_precomp.c entry points over the shared productive pc_parser lexer, macro, include and conditional-expression core.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in [original, *files]},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 82/82 l_precomp symbols + 25 C + 49 native + 6 retail contracts")


if __name__ == "__main__":
    main()
