"""Check retained console glyph bytes and original-shader pixel equivalence."""
import subprocess
import sys
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/baseq3_glyph_batch"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/baseq3_glyph_batch_contracts.ml", "--output", "baseq3_glyph_batch_contracts.exe"], cwd=ROOT, check=True)
    data = out / "glyphs.bin"
    contracts = run([ROOT / "build/baseq3_glyph_batch_contracts.exe", data], ROOT / "build").strip()
    if contracts != "PASS: 14 Baseq3 glyph-batch contracts":
        raise RuntimeError(contracts)
    native = out / "baseq3_glyph_batch_native.exe"
    run(["cl", "/nologo", "/O2", "/W4", "/WX", ROOT / "tests/baseq3_glyph_batch_native.c",
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{native}"], out, msvc_env("x64"), out / "build.log")
    pixels = run([native, data], out, log=out / "pixels.log").strip()
    if pixels != "Baseq3 glyph batch alpha/color/shadow pixels: PASS":
        raise RuntimeError(pixels)
    print(contracts)
    print(pixels)


if __name__ == "__main__":
    main()
