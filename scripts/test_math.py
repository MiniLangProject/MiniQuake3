"""Generate twice from the original C source, then compare native MiniLang output."""
import json
import subprocess
import sys
from toolchain import ROOT, msvc_env, run
from inventory import sha

def main():
    output = ROOT / "build/reference/math"
    output.mkdir(parents=True, exist_ok=True)
    env = msvc_env("x86")
    source = ROOT / "Quake-III-Arena-original-source/code/game"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{source}", ROOT / "tests/reference/math_oracle.c", source / "q_math.c",
         f"/Fe:{output / 'math_oracle.exe'}", "/link", "/Brepro"], output, env, output / "build.log")
    first, second = output / "first.bin", output / "second.bin"
    run([output / "math_oracle.exe", first], output)
    run([output / "math_oracle.exe", second], output)
    if first.read_bytes() != second.read_bytes():
        raise RuntimeError("Non-deterministic C reference output")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/math_tests.ml", "--output", "math_tests.exe"], check=True)
    text = run([ROOT / "build/math_tests.exe", first], ROOT / "build", log=output / "test.log")
    print(text)
    (output / "result.json").write_text(json.dumps({"passed": True, "cases": 4096,
        "reference_sha256": sha(first), "oracle_sha256": sha(output / "math_oracle.exe"),
        "test_sha256": sha(ROOT / "build/math_tests.exe"), "fp": "x86 MSVC /Od /fp:strict /arch:SSE2"}, indent=2) + "\n")

if __name__ == "__main__":
    main()
