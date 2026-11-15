"""Exercise actual WGL hardware draws, including near clipping and occlusion."""
from pathlib import Path
import shutil
import subprocess
import sys
import re
from toolchain import ROOT, msvc_env


def main():
    if sys.platform != "win32":
        print("SKIP: hardware renderer requires Windows WGL")
        return
    out = ROOT / "build/hardware_renderer"
    out.mkdir(parents=True, exist_ok=True)
    original=(ROOT/'Quake-III-Arena-original-source/code/renderer/tr_local.h').read_text(encoding='utf-8')
    defines=re.findall(r'^#define\s+GLS_(?:SRCBLEND|DSTBLEND)_\w+\s+0x[0-9a-fA-F]+.*$',original,re.MULTILINE)
    if len(defines)!=19:
        raise RuntimeError('original Baseq3 blend-factor definition inventory changed')
    (out/'original_blend_factors.h').write_text('/* Unchanged GLS definitions from original renderer/tr_local.h. */\n'+'\n'.join(defines)+'\n',encoding='utf-8')
    env = {key.upper(): value for key, value in msvc_env().items()}
    env["MQ3_RENDERER"] = "hardware"
    env.pop("MQ3_CAPTURE", None)
    compiler = shutil.which("cl.exe", path=env["PATH"])
    exe = out / "hardware_renderer.exe"
    subprocess.run([compiler, "/nologo", "/O2", "/fp:strict", "/W4", "/WX",
                    '/I'+str(out),
                    str(ROOT / "tests/playable_hardware_renderer_native.c"),
                    "/Fe:" + str(exe), "/Fo:" + str(out / "hardware_renderer.obj"),
                    "/link", "user32.lib", "gdi32.lib", "winmm.lib"],
                   cwd=out, env=env, check=True)
    subprocess.run([str(exe)], cwd=out, env=env, check=True, timeout=30)


if __name__ == "__main__":
    main()
