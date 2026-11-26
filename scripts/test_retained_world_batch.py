"""Exact productive retained-world sparse-update and retail selection gate."""
import argparse
from contextlib import contextmanager
import json
import os
from pathlib import Path
import shutil
import subprocess
from inventory import sha
from toolchain import ROOT, msvc_env
from build import build_file_lock


@contextmanager
def selected_compiler():
    """Keep the verified extraction stable until every compile has finished."""
    mode = os.environ.get("MQ3_BUILD_TOOLCHAIN", "frozen")
    if mode == "release":
        from build_release import prepare_compiler
        with build_file_lock(ROOT / "build/release-build.lock"):
            yield prepare_compiler()
    elif mode in ("", "frozen"):
        root = ROOT / "artifacts/toolchain"
        yield root / "build/mlc_win64.exe", root
    else:
        raise RuntimeError("Unknown MQ3_BUILD_TOOLCHAIN: " + mode)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/retained_world_batch"
    out.mkdir(parents=True, exist_ok=True)
    env = {key.upper(): value for key, value in msvc_env("x64").items()}
    compiler = shutil.which("cl.exe", path=env["PATH"])
    # All native objects/DLLs are isolated. This gate opens no game window and
    # never replaces the shipping libraries during a concurrent main build.
    subprocess.run([compiler, "/nologo", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/playable_world_gather_native.c"), "/Fe:" + str(out / "gather_native.exe"),
                    "/Fo:" + str(out / "gather_native.obj")], cwd=out, env=env, check=True)
    subprocess.run([str(out / "gather_native.exe")], cwd=out, env=env, check=True)
    subprocess.run([compiler, "/nologo", "/LD", "/TC", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "tests/playable_world_gather_prototype.h"), "/Fo:" + str(out / "comparison.obj"),
                    "/link", "/out:" + str(out / "playable_world_gather_prototype.dll")], cwd=out, env=env, check=True)
    subprocess.run([compiler, "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT",
                    str(ROOT / "native/playable_win32.c"), "/Fo:" + str(out / "window.obj"),
                    "/link", "user32.lib", "gdi32.lib", "winmm.lib", "/out:" + str(out / "playable_window.dll")],
                   cwd=out, env=env, check=True)
    runtime = os.environ.copy()
    runtime["PATH"] = str(ROOT / "build") + os.pathsep + runtime.get("PATH", "")

    def run_ml(name, arguments, mlcompiler, library_root):
        exe = out / (name + ".exe")
        with (out / (name + ".compile.log")).open("w") as log:
            subprocess.run([str(mlcompiler), str(ROOT / "tests" / (name + ".ml")), str(exe),
                            "-I", str(ROOT / "tests/retained_world_prototype"), "-I", str(ROOT / "src"), "-I", str(library_root),
                            "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m"],
                           cwd=out, stdout=log, stderr=subprocess.STDOUT, check=True, timeout=900)
        result = subprocess.run([str(exe), *map(str, arguments)], cwd=out, env=runtime, capture_output=True, text=True, timeout=180)
        (out / (name + ".log")).write_text(result.stdout + result.stderr)
        if result.returncode:
            raise RuntimeError(f"{name}: {result.stdout}\n{result.stderr}")
        print(result.stdout.strip(), flush=True)
        return result.stdout.strip()

    pak = args.pak or (args.data_root / "baseq3/pak0.pk3" if args.data_root else None)
    retail = None
    # The test-only comparison package is intentionally before src on -I.
    # Calling the general build script without that root cannot compile it.
    with selected_compiler() as (mlcompiler, library_root):
        contracts = run_ml("retained_world_batch_contracts", [], mlcompiler, library_root)
        if not contracts.startswith("PASS: 54 retained-world contracts"):
            raise RuntimeError(contracts)
        if pak:
            retail = run_ml("retained_world_batch_retail_probe", [pak.resolve()], mlcompiler, library_root)
            if "PASS: 432 productive retained-world retail differential cases" not in retail:
                raise RuntimeError(retail)
    paths = [ROOT / "src/mq3/renderer/retained_world_batch.ml", ROOT / "native/playable_world_gather.h",
             ROOT / "src/mq3/renderer/world_surface_selection.ml", ROOT / "src/mq3/renderer/world_patch_lod.ml",
             ROOT / "src/mq3/renderer/patch_stitch.ml",
             ROOT / "tests/retained_world_batch_contracts.ml", ROOT / "tests/retained_world_batch_retail_probe.ml",
             ROOT / "tests/playable_world_gather_native.c"]
    report = {"passed": True, "contracts": 54, "retail_cases": 432 if retail else 0,
              "retail": retail, "sources": {str(path.relative_to(ROOT)): sha(path) for path in paths},
              "toolchain_mode": os.environ.get("MQ3_BUILD_TOOLCHAIN", "frozen"),
              "scope": "full-map templates, camera-selected patch variants, retained portal materials, selected-face order, active-only stage updates, monotonic cache epochs, fog/dlight prefixes, capacity and autosprite fallbacks"}
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
