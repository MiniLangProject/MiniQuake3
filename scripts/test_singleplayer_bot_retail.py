"""Verify original spmap mode starts the Retail arena opponent beside the human."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/singleplayer_bot_retail_probe.ml", "--output",
                    "singleplayer_bot_retail_probe.exe"], cwd=ROOT, check=True)
    for map_name, mode in (("q3dm0", "probe"), ("q3dm0", "unprovoked"), ("q3dm1", "probe")):
        result = run([ROOT / "build/singleplayer_bot_retail_probe.exe",
                      (args.data_root / "baseq3/pak0.pk3").resolve(),
                      ROOT / "build/reference/qvms", map_name, mode], ROOT, timeout=240).strip()
        checks = 16 if mode == "unprovoked" else 15
        if not any(line.startswith(f"PASS: {checks} singleplayer {map_name} bot and human contracts bot50ms=") for line in result.splitlines()):
            raise RuntimeError(result)
        score_line = next((line for line in result.splitlines() if line.startswith("SCORE_REPLY: scores ")), "")
        fields = score_line.split()
        if len(fields) < 5 or int(fields[2]) < 2 or len(fields) < 5 + 14 * int(fields[2]):
            raise RuntimeError(f"incomplete original qagame scoreboard: {score_line}")
        clients = {int(fields[5 + 14 * index]) for index in range(int(fields[2]))}
        if not {0, 1}.issubset(clients):
            raise RuntimeError(f"human and arena opponent absent from scoreboard: {score_line}")
        print(result)

if __name__ == "__main__":
    main()
