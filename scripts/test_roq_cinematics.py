"""Build the RoQ container/video contracts and optional retail cinematic probe."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run


def build(source: str, output: str):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    contracts = build("tests/roq_contracts.ml", "roq_contracts.exe")
    value = run([contracts], ROOT / "build").strip()
    if value != "PASS: 12 RoQ media contracts":
        raise RuntimeError(value)
    print(value)
    if args.data_root:
        pak = args.data_root / "baseq3" / "pak0.pk3"
        retail = build("tests/cinematic_runtime_retail_probe.ml", "cinematic_runtime_retail_probe.exe")
        value = run([retail, pak], ROOT / "build", timeout=240).strip()
        if not value.startswith("PASS: retail RoQ"):
            raise RuntimeError(value)
        print(value)


if __name__ == "__main__":
    main()
