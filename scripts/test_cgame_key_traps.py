"""Verify the four Baseq3 cgame key traps and their stateful service bridge."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/cgame_key_traps"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code"
    source = original / "client/cl_cgame.c"
    keys_source = original / "client/cl_keys.c"
    ui_source = original / "client/cl_ui.c"
    anchors = {
        source: (
            "case CG_KEY_ISDOWN:", "return Key_IsDown( args[1] );",
            "case CG_KEY_GETCATCHER:", "return Key_GetCatcher();",
            "case CG_KEY_SETCATCHER:", "Key_SetCatcher( args[1] );",
            "case CG_KEY_GETKEY:", "return Key_GetKey( VMA(1) );",
        ),
        keys_source: ("qboolean Key_IsDown( int keynum )", "int Key_GetKey(const char *binding)"),
        ui_source: ("int Key_GetCatcher( void )", "void Key_SetCatcher( int catcher )"),
    }
    for path, values in anchors.items():
        text = path.read_text(encoding="latin-1")
        for value in values:
            if value not in text:
                raise RuntimeError(f"missing original key anchor {value!r} in {path.name}")

    local_match = (ROOT / "src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    local_ui = (ROOT / "src/mq3/engine/local_qvm_ui.ml").read_text(encoding="utf-8")
    for value in ("syscalls.keyServices=cgameKeys.stateServices(context.cgameKeys)",
                  "function uiKeyDown(context,key) return cgameKeys.isDown(context.cgameKeys,key)"):
        if value not in local_match:
            raise RuntimeError(f"missing productive local-QVM key integration {value!r}")
    if "localMatch.setKeyDown(state,key,down)" not in local_ui:
        raise RuntimeError("native UI input does not update the shared cgame key state")

    harness = ROOT / "tests/reference/cgame_key_traps_oracle.c"
    oracle = out / "oracle.exe"
    includes = [f"/I{original / name}" for name in ("game", "cgame", "qcommon", "renderer")]
    run(["cl", "/nologo", "/Od", "/MT", "/DWIN32", *includes, harness,
         f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_key_traps_oracle.ml", "--output", "cgame_key_traps_oracle.exe"],
                   cwd=ROOT, check=True)
    mini = run([ROOT / "build/cgame_key_traps_oracle.exe"], ROOT / "build",
               log=out / "minilang-oracle.log")
    if native != mini:
        raise RuntimeError("cgame key-trap differential mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_key_traps_contracts.ml", "--output", "cgame_key_traps_contracts.exe"],
                   cwd=ROOT, check=True)
    contracts = run([ROOT / "build/cgame_key_traps_contracts.exe"], ROOT / "build",
                    log=out / "contracts.log").strip()
    if contracts != "PASS: 25 cgame key-trap contracts":
        raise RuntimeError(contracts)

    files = [source, keys_source, ui_source, original / "cgame/cg_public.h", harness,
             ROOT / "tests/cgame_key_traps_oracle.ml", ROOT / "src/mq3/vm/cgame_key_traps.ml",
             ROOT / "src/mq3/engine/local_qvm_match.ml", ROOT / "src/mq3/engine/local_qvm_ui.ml",
             ROOT / "tests/cgame_key_traps_contracts.ml"]
    report = {
        "passed": True, "records": 4, "contracts": 25,
        "scope": "CG_KEY_ISDOWN, CG_KEY_GETCATCHER, CG_KEY_SETCATCHER and CG_KEY_GETKEY with shared 256-key state, catcher ownership and case-insensitive first-binding lookup.",
        "oracle": "Baseq3 cg_public.h supplies exact trap ordinals; a C oracle exercises the state transitions and the original source anchors require all four unchanged CL_CgameSystemCalls routes.",
        "safety": "VM argument vectors, masked strings, NUL termination, callback availability and key-number bounds are validated.",
        "remaining": "The QVM preview feeds native UI key transitions into this shared state; a future full client input loop still needs binding-command and console-catcher ownership beyond that preview path.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 key-trap records + {report['contracts']} cgame key-trap contracts")


if __name__ == "__main__":
    main()
