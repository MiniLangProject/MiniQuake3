"""Build retained QVM scene-batch refresh contracts."""
import subprocess
import sys

from toolchain import ROOT, run


def main():
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_scene_batch_contracts.ml", "--output", "qvm_scene_batch_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/qvm_scene_batch_contracts.exe"], ROOT / "build").strip()
    if value != "PASS: 15 QVM scene batch contracts":
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
