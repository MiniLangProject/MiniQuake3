"""Check decoded Retail image reuse, slot ownership and archive isolation."""
import argparse
from pathlib import Path
import subprocess
import sys
from toolchain import ROOT, run


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=ROOT / "build")
    args = parser.parse_args()
    pak = args.data_root.resolve() / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"Missing Retail pak: {pak}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_image_cache_retail_probe.ml", "--output", "qvm_image_cache_retail_probe.exe"], cwd=ROOT, check=True)
    result = run([ROOT / "build/qvm_image_cache_retail_probe.exe", pak], ROOT / "build").strip()
    if result != "PASS: 7 Retail image cache contracts":
        raise RuntimeError(result)
    print(result)


if __name__ == "__main__":
    main()
