"""Keep q3dm0's paired Retail door models out of static world drawing."""
import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    archive = (args.data_root / "baseq3/pak0.pk3").resolve()
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/retail_door_world_probe.ml", "--output",
                    "retail_door_world_probe.exe"], cwd=ROOT, check=True)
    result = run([ROOT / "build/retail_door_world_probe.exe", archive], ROOT,
                 timeout=240).strip()
    if not result.startswith("PASS: q3dm0 world range=") or "movingDoorTriangles=12 staticCopies=0" not in result:
        raise RuntimeError(result)
    print(result)


if __name__ == "__main__":
    main()
