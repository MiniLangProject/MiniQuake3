"""Build focused QVM scene-material binding-cache contracts."""
import subprocess
import sys
from toolchain import ROOT, run


def main():
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_scene_materials_contracts.ml", "--output", "qvm_scene_materials_contracts.exe"], cwd=ROOT, check=True)
    value = run([ROOT / "build/qvm_scene_materials_contracts.exe"], ROOT / "build").strip()
    if value != "PASS: 22 QVM scene material contracts":
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
