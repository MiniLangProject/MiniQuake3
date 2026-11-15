"""Verify opt-in native hardware timing without changing the shipping DLL."""
import shutil
import subprocess
from toolchain import ROOT, msvc_env


def main():
    out = ROOT / "build/reference/render_profile"
    out.mkdir(parents=True, exist_ok=True)
    env = {key.upper(): value for key, value in msvc_env("x64").items()}
    env["MQ3_RENDERER"] = "hardware"
    for name in ("MQ3_RENDER_PROFILE", "MQ3_RENDER_PROFILE_FILE", "MQ3_CAPTURE", "MQ3_RENDER_TRACE"):
        env.pop(name, None)
    compiler = shutil.which("cl.exe", path=env["PATH"])
    exe = out / "playable_render_profile_native.exe"
    subprocess.run([compiler, "/nologo", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/playable_render_profile_native.c"), "/Fe:" + str(exe),
                    "/Fo:" + str(out / "playable_render_profile_native.obj"),
                    "/link", "user32.lib", "gdi32.lib", "winmm.lib"], cwd=out, env=env, check=True)
    result = subprocess.run([str(exe), str(out / "profile.log")], cwd=out, env=env,
                            text=True, capture_output=True, timeout=30)
    if result.returncode:
        raise RuntimeError(f"render profile gate failed {result.returncode}: {result.stdout}{result.stderr}")
    expected = "PASS: render profile default-off zero clock calls, exact draw/swap/frame accounting, bounded storage and shutdown-only dump"
    if result.stdout.strip() != expected:
        raise RuntimeError(result.stdout)
    if "MQ3_RENDER_PROFILE version=1 frames=1 recorded=1" not in result.stderr:
        raise RuntimeError("missing opt-in stderr dump without MQ3_RENDER_PROFILE_FILE")
    print(expected)


if __name__ == "__main__":
    main()
