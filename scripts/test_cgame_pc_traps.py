"""Verify typed Baseq3 cgame precompiler traps and their central dispatcher bridge."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/cgame_pc_traps"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code"
    source = original / "client/cl_cgame.c"
    parser_source = original / "botlib/l_precomp.c"
    public = original / "cgame/cg_public.h"
    productive_host = ROOT / "src/mq3/engine/local_qvm_match.ml"
    anchors = {
        source: (
            "case CG_PC_ADD_GLOBAL_DEFINE:", "botlib_export->PC_AddGlobalDefine( VMA(1) )",
            "case CG_PC_LOAD_SOURCE:", "botlib_export->PC_LoadSourceHandle( VMA(1) )",
            "case CG_PC_FREE_SOURCE:", "botlib_export->PC_FreeSourceHandle( args[1] )",
            "case CG_PC_READ_TOKEN:", "botlib_export->PC_ReadTokenHandle( args[1], VMA(2) )",
            "case CG_PC_SOURCE_FILE_AND_LINE:", "botlib_export->PC_SourceFileAndLine( args[1], VMA(2), VMA(3) )",
        ),
        parser_source: ("int PC_ReadTokenHandle(int handle, pc_token_t *pc_token)",
                        "int PC_SourceFileAndLine(int handle, char *filename, int *line)"),
    }
    for path, values in anchors.items():
        text = path.read_text(encoding="latin-1")
        for value in values:
            if value not in text:
                raise RuntimeError(f"missing original cgame PC anchor {value!r} in {path.name}")
    host_text = productive_host.read_text(encoding="utf-8")
    if "syscalls.pcServices=cgamePc.registryServices(context.pcRegistry)" not in host_text:
        raise RuntimeError("productive local cgame host does not attach the typed PC trap service")

    harness = ROOT / "tests/reference/cgame_pc_traps_oracle.c"
    oracle = out / "oracle.exe"
    includes = [f"/I{original / name}" for name in ("game", "cgame")]
    run(["cl", "/nologo", "/Od", "/MT", "/DWIN32", *includes, harness,
         f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_pc_traps_oracle.ml", "--output", "cgame_pc_traps_oracle.exe"],
                   cwd=ROOT, check=True)
    mini = run([ROOT / "build/cgame_pc_traps_oracle.exe"], ROOT / "build",
               log=out / "minilang-oracle.log")
    if native != mini:
        raise RuntimeError("cgame PC-trap differential mismatch\nC:\n" + native + "MiniLang:\n" + mini)

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_pc_traps_contracts.ml", "--output", "cgame_pc_traps_contracts.exe"],
                   cwd=ROOT, check=True)
    contracts = run([ROOT / "build/cgame_pc_traps_contracts.exe"], ROOT / "build",
                    log=out / "contracts.log").strip()
    if contracts != "PASS: 29 cgame PC-trap contracts":
        raise RuntimeError(contracts)

    files = [source, parser_source, public, harness,
             ROOT / "tests/cgame_pc_traps_oracle.ml", ROOT / "src/mq3/vm/cgame_pc_traps.ml",
             ROOT / "src/mq3/vm/syscall_cgame.ml", productive_host,
             ROOT / "tests/cgame_pc_traps_contracts.ml"]
    report = {
        "passed": True, "records": 3, "contracts": 29,
        "scope": "CG_PC_ADD_GLOBAL_DEFINE through CG_PC_SOURCE_FILE_AND_LINE, including exact pc_token_t ABI output and a typed central cgame dispatcher service.",
        "oracle": "Baseq3 headers freeze all five trap ordinals plus pc_token_t size, offsets and scalar representation; unchanged CL_CgameSystemCalls and botlib parser routes are required.",
        "safety": "Masked strings, callback availability, token layout, output spans, MAX_QPATH termination, invalid handles and the extended-host fallback are checked.",
        "remaining": "Parser language semantics remain covered by the broader PC parser suite; all five traps are attached to the productive local cgame host.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 cgame PC records + {report['contracts']} cgame PC-trap contracts")


if __name__ == "__main__":
    main()
