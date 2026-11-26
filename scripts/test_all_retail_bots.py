"""Spawn and run every named Retail bot through original qagame and botlib QVMs."""
import argparse
import json
import re
import subprocess
import sys
import time
import zipfile
from pathlib import Path

from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    archive = (args.data_root / "baseq3/pak0.pk3").resolve()
    qvms = ROOT / "build/reference/qvms"
    with zipfile.ZipFile(archive) as pak:
        text = pak.read("scripts/bots.txt").decode("latin1")
        roster = []
        for block in re.findall(r"\{([^}]*)\}", text):
            name = re.search(r"\bname\s+(\w+)", block)
            character = re.search(r"\baifile\s+(\S+)", block)
            if name and character:
                roster.append((name.group(1), character.group(1)))
        missing = [character for _, character in roster
                   if "botfiles/" + character not in pak.namelist()]
    if len(roster) != 32 or missing:
        raise RuntimeError(f"unexpected Retail bot roster: {len(roster)} bots, missing={missing}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/retail_bot_roster_probe.ml", "--output",
                    "retail_bot_roster_probe.exe"], cwd=ROOT, check=True)
    exe = ROOT / "build/retail_bot_roster_probe.exe"
    rows = []
    for name, character in roster:
        started = time.perf_counter()
        result = subprocess.run([exe, archive, qvms, name, character], cwd=ROOT,
                                capture_output=True, text=True, timeout=90)
        match = re.search(rf"PASS bot={re.escape(name)} active=(\d+) frames=120", result.stdout)
        if result.returncode or not match:
            raise RuntimeError(f"{name}: exit={result.returncode}\n{result.stdout[-1200:]}\n{result.stderr[-600:]}")
        row = {"name": name, "character": character,
               "active_frames": int(match.group(1)),
               "wall_ms": round((time.perf_counter() - started) * 1000)}
        rows.append(row)
        print(f"PASS {name}: active={row['active_frames']}/120 elapsed={row['wall_ms']}ms", flush=True)
    report = ROOT / "build/reports/all_retail_bots.json"
    report.parent.mkdir(parents=True, exist_ok=True)
    report.write_text(json.dumps({"bots": rows}, indent=2) + "\n")
    print(f"PASS: all {len(rows)} Retail bots spawned and sent active commands")


if __name__ == "__main__":
    main()
