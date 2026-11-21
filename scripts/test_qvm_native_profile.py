"""Check optional C-only QVM timing without replacing the production DLL."""
import json
import subprocess

from inventory import sha
from toolchain import ROOT, msvc_env, run


def main():
    output = ROOT / "build/reference/qvm_native_profile"
    output.mkdir(parents=True, exist_ok=True)
    executable = output / "qvm_native_profile.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/W4", "/WX", "/MT",
         ROOT / "tests/qvm_native_profile.c", f"/Fe:{executable}", "/link", "/Brepro"],
        output, msvc_env("x64"), output / "build.log")
    for mode, label in enumerate(("disabled", "enabled", "frame")):
        result = subprocess.run([executable, str(mode)], cwd=output,
                                capture_output=True, text=True, check=True)
        (output / (label + ".log")).write_text(
            result.stdout + result.stderr, encoding="utf-8")
        expected = "PASS: native QVM profile disabled/reentrant/trap/budget/MXCSR contracts"
        if result.stdout.strip() != expected:
            raise RuntimeError(result.stdout)
        if mode == 1:
            if "returns=2 errors=1 instructions=9" not in result.stderr or "id=3 yields=2 resumes=2" not in result.stderr:
                raise RuntimeError("missing reentrant QVM/trap diagnostic counters: " + result.stderr)
        elif mode == 2:
            expected = ("frame=2 work_ms=12 vm=4:16 id=7 calls=1", "frame=2 vm=4:16 id=3 calls=1",
                        "frame=-1 work_ms=0 vm=4:16 id=7 calls=4", "returns=3 errors=1 instructions=13")
            if "frame=1 " in result.stderr or not all(value in result.stderr for value in expected):
                raise RuntimeError("missing or unfiltered QVM frame counters: " + result.stderr)
        elif result.stderr:
            raise RuntimeError("disabled profiler produced output: " + result.stderr)
    (output / "result.json").write_text(json.dumps({
        "passed": True, "modes": 3, "nested_calls": 2, "trap_id": 3,
        "scope": "No disabled allocation/output/control timestamp; independent nested timestamps; exact instructions, yields, resumes and budget error; caller MXCSR restored in both modes.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in
                    [ROOT / "native/qvm_exec.c", ROOT / "tests/qvm_native_profile.c"]},
    }, indent=2) + "\n", encoding="utf-8")
    print("PASS: optional native QVM profiler disabled/reentrant/trap/budget/MXCSR coverage")


if __name__ == "__main__":
    main()
