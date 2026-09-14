"""Build and run the AAS-independent BotLib lifecycle contracts."""
import subprocess
import sys
from toolchain import ROOT, run


def main():
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/botlib_lifecycle_runtime_contracts.ml", "--output", "botlib_lifecycle_runtime_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/botlib_lifecycle_runtime_contracts.exe"], ROOT / "build").strip()
    if value != "PASS: 12 botlib lifecycle runtime contracts":
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
