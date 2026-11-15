"""Check bulk MD3 numerical paths against the exact MiniLang reference kernels."""
import subprocess
import sys
import shutil
from toolchain import ROOT, run, msvc_env


def main():
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/native_md3_contracts.ml", "--output", "native_md3_contracts.exe"],
                   cwd=ROOT, check=True)
    result = run([ROOT / "build/native_md3_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 7168 native MD3 exact vector contracts":
        raise RuntimeError(result)
    print(result)
    if sys.platform == "win32":
        out = ROOT / "build/native_md3"
        out.mkdir(exist_ok=True)
        env = {key.upper(): value for key, value in msvc_env().items()}
        compiler = shutil.which("cl.exe", path=env["PATH"])
        probe = out / "native_md3_fp_control.exe"
        subprocess.run([compiler, "/nologo", "/O2", "/fp:strict", "/W4", "/WX", "/MT",
                        str(ROOT / "tests/native_md3_fp_control.c"),
                        "/Fe:" + str(probe), "/Fo:" + str(out / "native_md3_fp_control.obj")],
                       cwd=out, env=env, check=True)
        value = run([probe], out).strip()
        if value != "PASS: native MD3 MXCSR independence (16 modes, 160 calls, exact restoration)":
            raise RuntimeError(value)
        print(value)


if __name__ == "__main__":
    main()
