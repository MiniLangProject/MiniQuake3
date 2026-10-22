#!/usr/bin/env python3
"""Complete tr_model.c facade, unchanged-C, native and Retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def invoke(name: str, *args: object) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / name, *map(str, args)], cwd=ROOT, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/tr_model_complete"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/renderer/tr_model.c")
    facade = ROOT / "src/mq3/renderer/tr_model_runtime.ml"
    source = facade.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"] if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", source)]
    if missing:
        raise RuntimeError("missing tr_model facade symbols: " + ", ".join(missing))

    contracts = run([build("tests/tr_model_complete_contracts.ml", "tr_model_complete_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 23 complete tr_model contracts":
        raise RuntimeError(contracts)

    pak = (args.data_root / "baseq3/pak0.pk3").resolve()
    if not pak.is_file():
        raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
    retail = run([build("tests/tr_model_retail_probe.ml", "tr_model_retail_probe.exe"), pak], ROOT / "build", log=out / "retail.log", timeout=600).strip()
    if not retail.startswith("PASS: retail tr_model models=4 "):
        raise RuntimeError(retail)

    # Existing model-tags gate compiles the unchanged R_GetTag, R_LerpTag and
    # R_ModelBounds bodies from tr_model.c and compares their records exactly.
    invoke("test_model_tags.py")
    exact_result = json.loads((ROOT / "build/reference/model_tags/result.json").read_text(encoding="utf-8"))
    if args.full_regression:
        invoke("test_md3_asset.py", "--pak", pak)
        invoke("test_md4_animation.py")
        invoke("test_qvm_model_bounds.py")
        invoke("test_qvm_renderer_traps.py", "--pak", pak)

    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_model.c"
    files = [original, facade, ROOT / "src/mq3/format/md3.ml", ROOT / "src/mq3/renderer/model_tags.ml",
             ROOT / "src/mq3/renderer/model_bounds.ml", ROOT / "tests/tr_model_complete_contracts.ml",
             ROOT / "tests/tr_model_retail_probe.ml"]
    report = {
        "passed": True,
        "symbols": len(entry["symbol_candidates"]),
        "unchanged_c_records": exact_result["records"],
        "contracts": 23,
        "retail": retail,
        "retail_pak_sha256": sha(pak),
        "scope": "All tr_model.c symbols through a C-named native MiniLang facade; checked MD3 and MD4 loading, surface limits and canonical names, three-level MD3 registration and caching, null/default handles, registration lifecycle, model listing, tag lookup/interpolation and first-frame/brush bounds; unchanged-C tag/bounds comparison and four Retail pak0 models.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['symbols']}/{report['symbols']} tr_model symbols + {report['unchanged_c_records']} unchanged-C records + {report['contracts']} native contracts + Retail models")


if __name__ == "__main__":
    main()
