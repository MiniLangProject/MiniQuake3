"""Headless mixed-portal differential and append-cost benchmark."""
import re
import subprocess
import sys
from toolchain import ROOT, run


def main() -> None:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/portal_clip_large_contracts.ml", "--output", "portal_clip_large_contracts.exe"], cwd=ROOT, check=True)
    result = run([ROOT / "build/portal_clip_large_contracts.exe"], ROOT / "build").strip()
    if not re.search(r"PORTAL_CLIP input=8192 output=8193 fast_ms=\d+ former_array_ms=\d+", result) or not result.endswith("PASS: 2 large portal clip contracts"):
        raise RuntimeError(result)
    print(result)


if __name__ == "__main__":
    main()
