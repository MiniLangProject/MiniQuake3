"""Native helper ownership across all rounding/FTZ/DAZ modes and large bounds."""
import json
from inventory import sha
from toolchain import ROOT, msvc_env, run


def main():
    output = ROOT / "build/reference/native_qvm_boundaries"
    output.mkdir(parents=True, exist_ok=True)
    executable = output / "native_qvm_numeric_boundaries.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/W4", "/WX", "/MT",
         ROOT / "tests/native_qvm_numeric_boundaries.c", f"/Fe:{executable}", "/link", "/Brepro"],
        output, msvc_env("x64"), output / "build.log")
    result = run([executable], output, log=output / "contracts.log").strip()
    if result != "PASS: 251 native QVM helper rounding/status/INT_MAX contracts":
        raise RuntimeError(result)
    (output / "result.json").write_text(json.dumps({
        "passed": True, "contracts": 251, "control_modes": 16,
        "scope": "Camera/axis/patch/MD3 conversions and plane predicates use owned nearest/even with gradual underflow; exact caller MXCSR restored on success/miss/error; INT_MAX indexing/count/continuation inputs reject without accesses or overflow.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in
                    [ROOT / "native/qvm_exec.c", ROOT / "tests/native_qvm_numeric_boundaries.c"]},
    }, indent=2) + "\n", encoding="utf-8")
    print(result)


if __name__ == "__main__":
    main()
