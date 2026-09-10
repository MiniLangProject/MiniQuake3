"""Build and run deterministic player-projectile contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    output = ROOT / "build/reference/playable_player_projectiles"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_player_projectiles_contracts.ml", "--output", "playable_player_projectiles_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run(
        [ROOT / "build/playable_player_projectiles_contracts.exe"],
        ROOT / "build",
        log=output / "contracts.log",
    ).strip()
    expected = "PASS: 32 playable player-projectile contracts"
    if value != expected:
        raise RuntimeError(value)
    files = [
        ROOT / "src/mq3/client/playable_player_projectiles.ml",
        ROOT / "tests/playable_player_projectiles_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 32,
        "scope": "Stock rocket, plasma, grenade and BFG profiles; deterministic flight and gravity; BSP/target collision; EF_BOUNCE_HALF grenade reflection, damping and floor settling; direct and radius damage; unique impacts and fuse expiry.",
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
