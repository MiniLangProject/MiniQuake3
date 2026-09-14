"""Build and exercise live AAS runtime queries against retail q3dm1."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", required=True, type=Path)
    args = parser.parse_args()
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/aas_runtime_retail_probe.ml", "--output", "aas_runtime_retail_probe.exe"],
        cwd=ROOT, check=True,
    )
    output = run([ROOT / "build/aas_runtime_retail_probe.exe", args.data_root / "baseq3/pak0.pk3"], ROOT / "build").strip()
    if not output.startswith("PASS: q3dm1 AAS runtime checks="):
        raise RuntimeError(output)
    print(output)


if __name__ == "__main__":
    main()
