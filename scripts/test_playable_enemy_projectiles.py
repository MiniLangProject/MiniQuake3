"""Build and run deterministic visible enemy-projectile contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    output = ROOT / "build/reference/playable_enemy_projectiles"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_enemy_projectiles_contracts.ml", "--output", "playable_enemy_projectiles_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run(
        [ROOT / "build/playable_enemy_projectiles_contracts.exe"],
        ROOT / "build",
        log=output / "contracts.log",
    ).strip()
    expected = "PASS: 25 playable enemy-projectile contracts"
    if value != expected:
        raise RuntimeError(value)
    files = [
        ROOT / "src/mq3/client/playable_enemy_projectiles.ml",
        ROOT / "tests/playable_enemy_projectiles_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 25,
        "scope": "Deterministic multi-projectile spawning from enemy AI attacks, timed flight, BSP point traces, player AABB/sphere sweeps, one-shot damage, trails and impacts.",
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path)
            for path in files
        },
    }
    (output / "result.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(expected)


if __name__ == "__main__":
    main()
