#!/usr/bin/env python3
"""Differential coverage for Baseq3 key-binding command expansion."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main() -> None:
    out = ROOT / "build/reference/key_binding_dispatch"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_keys.c"
    extracted = extract(original, ["CL_AddKeyUpCommands", "CL_KeyEvent"])
    (out / "key_binding_dispatch_under_test.inc").write_text(extracted, encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/key_binding_dispatch_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/W3", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/key_binding_dispatch_oracle.ml", "--output", "key_binding_dispatch_oracle.exe"], cwd=ROOT, check=True)
    mini = run([ROOT / "build/key_binding_dispatch_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("key binding-dispatch mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/key_binding_dispatch_contracts.ml", "--output", "key_binding_dispatch_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/key_binding_dispatch_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 14 key binding-dispatch contracts":
        raise RuntimeError(contracts)
    dispatch = ROOT / "src/mq3/client/key_binding_dispatch.ml"
    events = ROOT / "src/mq3/client/input_command_events.ml"
    preview = ROOT / "src/mq3/client/qvm_preview_app.ml"
    match = ROOT / "src/mq3/engine/local_qvm_match.ml"
    for path, anchors in [(events, ["eventBindingDispatch.commands("]), (preview, ["timestampedInput.applyBound(", "match.keyBinding(", "match.queueInputCommand("]), (match, ["function keyBinding(", "function setKeyBinding(", "function queueInputCommand("])]:
        text = path.read_text(encoding="utf-8")
        for anchor in anchors:
            if anchor not in text:
                raise RuntimeError(f"productive binding integration missing in {path.name}: {anchor}")
    files = [original, harness, dispatch, events, preview, match,
             ROOT / "tests/key_binding_dispatch_oracle.ml", ROOT / "tests/key_binding_dispatch_contracts.ml"]
    report = {
        "passed": True,
        "records": len(native.splitlines()),
        "contracts": 14,
        "function": "CL_KeyEvent / CL_AddKeyUpCommands binding expansion",
        "scope": "Timestamped +/- commands, semicolon compounds, down-only commands, native-to-Quake key translation and all gameplay movement/button targets are driven by the shared binding state writable by ui.qvm.",
        "remaining": "Console/message catcher line editing and config.cfg binding loading remain separate client work.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 binding-dispatch records + {report['contracts']} contracts")


if __name__ == "__main__":
    main()
