"""Bounded BSP-query memo contracts plus original-QVM Retail differential replay."""
import argparse
import json
from pathlib import Path
import subprocess
import sys

from toolchain import ROOT, run
from inventory import sha


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/cgame_collision_cache"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_collision_cache_contracts.ml", "--output", "cgame_collision_cache_contracts.exe"],
                   cwd=ROOT, check=True)
    value = run([ROOT / "build/cgame_collision_cache_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if value != "PASS: 42 cgame collision-query memo contracts":
        raise RuntimeError(value)
    (out / "result.json").write_text(json.dumps({
        "passed": True, "contracts": 42,
        "scope": "Independent fake-host cache contracts; Retail gate additionally compares every productive QVM query to the unchanged MiniLang reference service.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in
                    [ROOT / "src/mq3/vm/cgame_collision_cache.ml", ROOT / "src/mq3/engine/local_qvm_match.ml",
                     ROOT / "tests/cgame_collision_cache_contracts.ml"]},
    }, indent=2) + "\n", encoding="utf-8")
    print(value)
    if args.data_root:
        subprocess.run([sys.executable, ROOT / "scripts/profile_cgame_collision_queries.py",
                        "--data-root", args.data_root.resolve(), "--frames", "120", "--repeats", "1000"],
                       cwd=ROOT, check=True)


if __name__ == "__main__":
    main()
