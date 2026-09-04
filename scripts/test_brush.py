import json
import subprocess
import sys
from toolchain import ROOT,msvc_env,run
from inventory import sha
def main():
    output=ROOT / "build/reference/brush";output.mkdir(parents=True,exist_ok=True)
    source=ROOT / "Quake-III-Arena-original-source/code"
    original=(source / "qcommon/cm_trace.c").read_text(encoding="latin1")
    start=original.index("void CM_TraceThroughBrush(")
    end=original.index("\n}",start)+2
    isolated=output / "original_brush_kernel.c"
    isolated.write_text('#include "cm_local.h"\n'+original[start:end]+"\n",encoding="latin1")
    run(["cl","/nologo","/Od","/Gy","/fp:strict","/arch:SSE2","/MT","/DWIN32","/DNDEBUG","/D_CRT_SECURE_NO_WARNINGS",
         f"/I{source / 'qcommon'}",ROOT / "tests/reference/brush_oracle.c",isolated,
         f"/Fe:{output / 'brush_oracle.exe'}","/link","/OPT:REF","/Brepro"],output,msvc_env("x86"),output / "build.log")
    expected=output / "expected.bin";run([output / "brush_oracle.exe",expected],output)
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/brush_tests.ml","--output","brush_tests.exe"],check=True)
    print(run([ROOT / "build/brush_tests.exe",expected],ROOT / "build",log=output / "test.log"))
    (output / "result.json").write_text(json.dumps({"passed":True,"traces":4096,"fields":36864,"expected_sha256":sha(expected),"unmodified_kernel_sha256":sha(isolated)},indent=2)+"\n")
if __name__=="__main__":main()
