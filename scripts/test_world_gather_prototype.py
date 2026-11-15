"""TEST ONLY: exact retail full-map face gather against production world batches."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
from inventory import sha
from toolchain import ROOT, msvc_env


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path, default=ROOT / "build/baseq3/pak0.pk3")
    parser.add_argument("--compile-only", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/world_gather_prototype"
    out.mkdir(parents=True, exist_ok=True)
    env = {key.upper(): value for key, value in msvc_env("x64").items()}
    compiler = shutil.which("cl.exe", path=env["PATH"])
    native_exe = out / "gather_native.exe"
    subprocess.run([compiler, "/nologo", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/playable_world_gather_native.c"), "/Fe:" + str(native_exe),
                    "/Fo:" + str(out / "gather_native.obj")], cwd=out, env=env, check=True)
    subprocess.run([compiler, "/nologo", "/LD", "/TC", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/playable_world_gather_prototype.h"), "/Fo:" + str(out / "gather_dll.obj"),
                    "/link", "/Brepro", "/out:" + str(out / "playable_world_gather_prototype.dll")],
                   cwd=out, env=env, check=True)
    frozen = ROOT / "artifacts/toolchain"
    exe = out / "playable_world_gather_prototype.exe"
    command = [str(frozen / "build/mlc_win64.exe"), str(ROOT / "tests/playable_world_gather_prototype.ml"), str(exe),
               "-I", str(ROOT / "tests/retained_world_prototype"), "-I", str(ROOT / "src"), "-I", str(frozen),
               "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"]
    with (out / "compile.log").open("w") as log:
        subprocess.run(command, cwd=out, stdout=log, stderr=subprocess.STDOUT, check=True, timeout=900)
    if args.compile_only:
        print("READY: isolated test-only world-gather DLL/ML compiled; no production sources changed or window opened")
        return
    subprocess.run([str(native_exe)], cwd=out, env=env, check=True)
    runtime = os.environ.copy()
    runtime["PATH"] = str(ROOT / "build") + os.pathsep + runtime.get("PATH", "")
    result = subprocess.run([str(exe), str(args.pak.resolve())], cwd=out, env=runtime,
                            capture_output=True, text=True, timeout=180)
    (out / "stdout.log").write_text(result.stdout)
    (out / "stderr.log").write_text(result.stderr)
    if result.returncode:
        raise RuntimeError(f"gather proof failed {result.returncode}: {result.stdout}\n{result.stderr}")
    print(result.stdout.strip())
    if "PASS: 291 test-only retained-world gather differential cases; production unchanged" not in result.stdout:
        raise RuntimeError("missing complete retail/synthetic gather proof")
    paths = [ROOT / "tests/playable_world_gather_prototype.h", ROOT / "tests/playable_world_gather_native.c",
             ROOT / "tests/playable_world_gather_prototype.ml", ROOT / "tests/retained_world_prototype/mq3/tests/retained_world.ml",
             ROOT / "src/mq3/renderer/playable_world_batch.ml", ROOT / "src/mq3/renderer/world_surface_selection.ml"]
    report = {"passed": True, "scope": "test-only full-map raw/updated stage and fog stream gather in selected-face order",
              "cases": 291, "stdout": result.stdout.splitlines(), "pak_sha256": sha(args.pak),
              "sources": {str(path.relative_to(ROOT)): sha(path) for path in paths},
              "limits": ["autosprite/autosprite2 updates require the production fallback",
                         "full-stage updates prove semantics; sparse dynamic updates are not implemented",
                         "no production ML or shipping native module imports this prototype"]}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
