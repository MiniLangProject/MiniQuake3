"""Measure retained QVM scene-batch refresh against full reconstruction."""
import subprocess
import sys

from toolchain import ROOT, run


def main():
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_scene_batch_benchmark.ml", "--output", "qvm_scene_batch_benchmark.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/qvm_scene_batch_benchmark.exe"], ROOT / "build", timeout=240).strip()
    if not value.startswith("QVM scene batch benchmark:"):
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
