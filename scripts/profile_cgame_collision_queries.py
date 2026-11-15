"""Compare productive memoized Retail-QVM queries to unchanged host services."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--frames", type=int, default=120)
    parser.add_argument("--repeats", type=int, default=1000)
    args = parser.parse_args()
    pak = args.data_root.resolve() / "baseq3/pak0.pk3"
    output = ROOT / "build/reference/cgame_collision_query_probe"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_collision_query_probe.ml", "--output", "cgame_collision_query_probe.exe"],
                   cwd=ROOT, check=True)
    environment = os.environ.copy()
    environment.pop("MQ3_QVM_PROFILE", None)
    value = run([ROOT / "build/cgame_collision_query_probe.exe", pak,
                 ROOT / "build/reference/qvms", args.frames, args.repeats],
                ROOT / "build", environment, output / "retail.log", timeout=300)
    if "PASS: headless Retail collision queries " not in value:
        raise RuntimeError(value)
    (output / "result.json").write_text(json.dumps({
        "passed": True, "frames": args.frames, "repeats": args.repeats,
        "data_root": str(args.data_root.resolve()), "pak_sha256": sha(pak), "output": value,
        "probe_sha256": sha(ROOT / "build/cgame_collision_query_probe.exe"),
        "source_sha256": sha(ROOT / "tests/cgame_collision_query_probe.ml"),
        "native_sha256": sha(ROOT / "build/miniquake3_qvm.dll"),
        "scope": "Every productive memoized cgame-QVM trace/mark query is compared byte-for-byte with its unchanged MiniLang host service across real frames. Productive bounded-cache, reference, core and serialization replays are separate diagnostic timings, not FPS acceptance.",
    }, indent=2) + "\n", encoding="utf-8")
    print(value, end="")


if __name__ == "__main__":
    main()
