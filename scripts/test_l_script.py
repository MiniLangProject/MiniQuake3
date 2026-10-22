"""Verify the complete native code/botlib/l_script.c lexer port."""

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
    out = ROOT / "build/reference/l_script"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/botlib/l_script.c")
    symbols = entry["symbol_candidates"]
    if len(symbols) != 39:
        raise RuntimeError(f"unexpected ledger symbol count: {len(symbols)}")
    original = ROOT / "Quake-III-Arena-original-source/code/botlib/l_script.c"
    module = ROOT / "src/mq3/botlib/l_script.ml"
    original_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8-sig")
    absent = [name for name in symbols if not re.search(rf"\b{re.escape(name)}\s*\(", original_text)]
    missing = [name for name in symbols if not re.search(rf"(?m)^function\s+{re.escape(name)}\s*\(", module_text)]
    if absent or missing:
        raise RuntimeError(f"symbol mismatch original={absent} minilang={missing}")
    for anchor in (
        "SCFL_NOSTRINGWHITESPACES", "SCFL_NOSTRINGESCAPECHARS", "SCFL_PRIMITIVE",
        "TT_BINARY", "PS_CreatePunctuationTable", "PS_ReadEscapeCharacter",
        "ReadSignedFloat", "ScriptSkipTo", "LoadScriptMemory",
    ):
        if anchor not in original_text or anchor not in module_text:
            raise RuntimeError(f"missing l_script parity anchor: {anchor}")
    if "scriptFromSource(runtime,source)" not in module_text or "pc.Source(name,data,0,1,0)" not in module_text:
        raise RuntimeError("l_script must own the shared pc.Source cursor")

    oracle_source = ROOT / "tests/reference/l_script_oracle.c"
    oracle_exe = out / "l_script_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS", oracle_source,
         f"/Fe:{oracle_exe}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "oracle-build.log",
    )
    oracle = run([oracle_exe], out, log=out / "oracle.log").strip()
    if oracle != "PASS: 32 unchanged-C l_script observations":
        raise RuntimeError(oracle)

    build_ml("tests/l_script_contracts.ml", "l_script_contracts.exe")
    native = run([ROOT / "build/l_script_contracts.exe"], ROOT, log=out / "contracts.log").strip()
    if native != "PASS: 39 l_script native contracts":
        raise RuntimeError(native)

    build_ml("tests/l_script_retail_probe.ml", "l_script_retail_probe.exe")
    pak = args.data_root / "baseq3/pak0.pk3"
    retail = run([ROOT / "build/l_script_retail_probe.exe", pak], ROOT, log=out / "retail.log").strip()
    if not retail.startswith("PASS: 5 retail l_script probes"):
        raise RuntimeError(retail)

    files = [module, ROOT / "src/mq3/botlib/l_precomp.ml", oracle_source, ROOT / "tests/l_script_contracts.ml", ROOT / "tests/l_script_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(symbols),
        "oracle": oracle,
        "native": native,
        "retail": retail,
        "scope": "Complete l_script.c lexer over a shared pc.Source cursor, including flags, escapes, number variants, custom punctuations, token helpers and retail bot inputs.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in [original, *files]},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 39/39 l_script symbols + 32 unchanged-C + 39 native + 5 retail contracts")


if __name__ == "__main__":
    main()
