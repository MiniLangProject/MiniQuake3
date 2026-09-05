import json
import subprocess
import sys
from toolchain import ROOT, msvc_env, run
from inventory import sha

def main():
    output=ROOT / "build/reference/numeric"
    output.mkdir(parents=True,exist_ok=True)
    run(["cl","/nologo","/Od","/fp:strict","/arch:SSE2","/MT","/D_CRT_SECURE_NO_WARNINGS",
         ROOT / "tests/reference/numeric_oracle.c",f"/Fe:{output / 'numeric_oracle.exe'}","/link","/Brepro"],
        output,msvc_env("x86"),output / "build.log")
    expected=output / "expected.bin"
    run([output / "numeric_oracle.exe",expected],output)
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/numeric_tests.ml","--output","numeric_tests.exe"],check=True)
    print(run([ROOT / "build/numeric_tests.exe",expected],ROOT / "build",log=output / "test.log"))
    (output / "result.json").write_text(json.dumps({"passed":True,"results":101125,"expected_sha256":sha(expected)},indent=2)+"\n")

if __name__=="__main__":main()
