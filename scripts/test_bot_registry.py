"""Direct deterministic parity for the Baseq3 bot and arena registry."""
import json
import re
import struct
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run

CASES = ["parse_and_lookup", "linebreak_and_capacity", "default_file_order", "custom_files", "file_boundaries"]

def build_native(out):
    code = ROOT / "Quake-III-Arena-original-source/code"
    sources = [ROOT / "tests/reference/bot_registry_oracle.c", code / "game/q_shared.c"]
    run(["cl", "/nologo", "/Od", "/Gy", "/fp:strict", "/MT", "/DWIN32", "/DNDEBUG",
         f'/I{code / "game"}', *sources, f'/Fe:{out / "bot_registry_oracle.exe"}',
         "/link", "/OPT:REF", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    return sources + [code / "game/g_bot.c"]

def main():
    out = ROOT / "build/reference/bot_registry"
    out.mkdir(parents=True, exist_ok=True)
    sources = build_native(out)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/reference/bot_registry_tests.ml",
                    "--output", "bot_registry_reference_tests.exe"], check=True)
    records = []
    for case_id, name in enumerate(CASES, 1):
        expected = out / (name + ".expected")
        run([out / "bot_registry_oracle.exe", str(case_id), expected], out, log=out / (name + ".oracle.log"))
        result = run([ROOT / "build/bot_registry_reference_tests.exe", str(case_id), expected], ROOT / "build",
                     log=out / (name + ".test.log")).strip()
        match = re.search(r"PASS: (\d+) bot registry words", result)
        assert match, result
        data = expected.read_bytes()
        words = struct.unpack("<" + "i" * (len(data) // 4), data)
        assert words[0] == 0x42524547 and words[1] == case_id and int(match[1]) == len(words)
        records.append({"name": name, "exact_words": len(words), "sha256": sha(expected)})
        print(name + ": " + result, flush=True)
    result = {
        "passed": True,
        "scenario_count": len(records),
        "exact_words": sum(row["exact_words"] for row in records),
        "scenarios": records,
        "scope": "Unchanged Baseq3 g_bot.c registry bodies against MiniLang for parser boundaries, default and custom file order, arena numbering, diagnostics, and case-insensitive lookups.",
        "original_sources": {path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        "tests": {path.relative_to(ROOT).as_posix(): sha(path) for path in (ROOT / "scripts/test_bot_registry.py", ROOT / "tests/reference/bot_registry_tests.ml")},
        "oracle_sha256": sha(out / "bot_registry_oracle.exe"),
        "test_sha256": sha(ROOT / "build/bot_registry_reference_tests.exe"),
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(records)} bot registry scenarios / {result['exact_words']} exact words")

if __name__ == "__main__":
    main()
