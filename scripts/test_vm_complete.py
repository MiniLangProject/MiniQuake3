"""Complete qcommon/vm.c differential, native and productive runtime gate."""
from __future__ import annotations

import json
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

ORIGINAL = ROOT / "Quake-III-Arena-original-source/code/qcommon/vm.c"
PORT = ROOT / "src/mq3/vm/runtime.ml"
SYMBOLS = [
    "ParseHex", "VM_ArgPtr", "VM_Call", "VM_CallCompiled", "VM_Clear", "VM_Compile", "VM_Create",
    "VM_Debug", "VM_DllSyscall", "VM_ExplicitArgPtr", "VM_Free", "VM_Init", "VM_LoadSymbols",
    "VM_LogSyscalls", "VM_ProfileSort", "VM_Restart", "VM_SymbolForCompiledPointer", "VM_SymbolToValue",
    "VM_VM2C", "VM_ValueToFunctionSymbol", "VM_ValueToSymbol", "VM_VmInfo_f", "VM_VmProfile_f",
]
EXACT = [
    "VM_VM2C", "VM_Debug", "VM_ValueToSymbol", "VM_ValueToFunctionSymbol", "VM_SymbolToValue",
    "VM_SymbolForCompiledPointer", "ParseHex", "VM_ArgPtr", "VM_ExplicitArgPtr", "VM_ProfileSort",
]
PORT_MARKERS = {
    "ParseHex": "function parseHex(", "VM_ArgPtr": "function argPtr(", "VM_Call": "function call(",
    "VM_CallCompiled": "function callCompiled(", "VM_Clear": "function clear(", "VM_Compile": "function compile(",
    "VM_Create": "function loadMode(", "VM_Debug": "function debug(", "VM_DllSyscall": "function dllSyscall(",
    "VM_ExplicitArgPtr": "function explicitArgPtr(", "VM_Free": "function free(", "VM_Init": "function init(",
    "VM_LoadSymbols": "function loadSymbols(", "VM_LogSyscalls": "function logSyscalls(",
    "VM_ProfileSort": "function profileSort(", "VM_Restart": "function restart(",
    "VM_SymbolForCompiledPointer": "function symbolForCompiledPointer(", "VM_SymbolToValue": "function symbolToValue(",
    "VM_VM2C": "function vm2c(", "VM_ValueToFunctionSymbol": "function valueToFunctionSymbol(",
    "VM_ValueToSymbol": "function valueToSymbol(", "VM_VmInfo_f": "function info(",
    "VM_VmProfile_f": "function profile(",
}


def build(source: str, output: str) -> None:
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    run(
        [compiler, ROOT / source, ROOT / "build" / output, "-I", ROOT / "src", "-I", ROOT / "artifacts/toolchain",
         "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "64m"],
        ROOT, log=ROOT / "build" / (output + ".compile.log"), timeout=480,
    )


def fixture(path: Path) -> None:
    import struct
    code = bytes([3]) + struct.pack("<I", 64) + bytes([8]) + struct.pack("<I", 42) + bytes([4]) + struct.pack("<I", 64)
    path.write_bytes(struct.pack("<8I", 0x12721444, 3, 32, len(code), 32 + len(code), 4, 0, 65532) + code + struct.pack("<I", 7))


def main() -> int:
    source = ORIGINAL.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if name not in source]
    if missing:
        raise RuntimeError("Original VM symbol inventory changed: " + ", ".join(missing))
    port_source = PORT.read_text(encoding="utf-8")
    missing_port = [name for name, marker in PORT_MARKERS.items() if marker not in port_source]
    if missing_port or set(PORT_MARKERS) != set(SYMBOLS):
        raise RuntimeError("MiniLang VM symbol coverage incomplete: " + ", ".join(missing_port))
    out = ROOT / "build/reference/vm_complete"
    out.mkdir(parents=True, exist_ok=True)
    (out / "vm_complete_under_test.inc").write_text(extract(ORIGINAL, EXACT), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/vm_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/fp:strict", "/MT", "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"],
        out, msvc_env("x86"), out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    build("tests/vm_complete_oracle.ml", "vm_complete_oracle.exe")
    mini = run([ROOT / "build/vm_complete_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("vm.c helper differential mismatch\nnative:\n" + native + "\nMiniLang:\n" + mini)
    build("tests/vm_complete_contracts.ml", "vm_complete_contracts.exe")
    contracts = run([ROOT / "build/vm_complete_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 31 complete VM contracts":
        raise RuntimeError(contracts)
    image = out / "constant.qvm"
    fixture(image)
    build("tests/vm_runtime_contracts.ml", "vm_runtime_contracts.exe")
    lifecycle = run([ROOT / "build/vm_runtime_contracts.exe", image], ROOT / "build", log=out / "lifecycle.log").strip()
    if lifecycle != "PASS: 17 VM runtime contracts":
        raise RuntimeError(lifecycle)
    files = [
        ORIGINAL, PORT, ROOT / "src/mq3/engine/local_qvm_match.ml", harness,
        ROOT / "tests/vm_complete_oracle.ml", ROOT / "tests/vm_complete_contracts.ml", ROOT / "tests/vm_runtime_contracts.ml",
    ]
    result = {
        "passed": True,
        "symbols": 23,
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 31,
        "scope": "All 23 qcommon/vm.c symbols: initialization, slots, QVM load/compiled-mode execution, in-place restart, nested call context, DLL syscalls, argument pointers, map symbols, profiling/info, syscall logs, free/clear and productive cgame/UI mode wiring.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 23/23 vm.c symbols + {len(native.splitlines())} unchanged-C records + 31 native/productive contracts")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
