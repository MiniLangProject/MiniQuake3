"""Build and run BSP-collided preview-enemy movement contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def build(source, output):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )


def main():
    out = ROOT / "build/reference/playable_enemy_movement"
    out.mkdir(parents=True, exist_ok=True)
    build("tests/playable_enemy_movement_contracts.ml", "playable_enemy_movement_contracts.exe")
    value = run(
        [ROOT / "build/playable_enemy_movement_contracts.exe"],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    expected = "PASS: 22 playable enemy-movement contracts"
    if value != expected:
        raise RuntimeError(value)

    probe = None
    retained = ROOT / "build/reference/bodies/cd_q3dm1.bsp"
    if retained.exists():
        build("tests/playable_enemy_movement_map_probe.ml", "playable_enemy_movement_map_probe.exe")
        probe = run(
            [ROOT / "build/playable_enemy_movement_map_probe.exe", retained],
            ROOT / "build",
            log=out / "q3dm1.log",
        ).strip()
        if not probe.startswith("PASS: q3dm1 enemy movement targets="):
            raise RuntimeError(probe)

    files = [
        ROOT / "src/mq3/client/playable_enemy_movement.ml",
        ROOT / "tests/playable_enemy_movement_contracts.ml",
        ROOT / "tests/playable_enemy_movement_map_probe.ml",
    ]
    report = {
        "passed": True,
        "contracts": 22,
        "q3dm1": probe,
        "scope": "Player-sized BSP box movement for preview enemies with wall sliding, 18-unit stepping, ground binding and target/desired-delta adapters.",
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files
        },
    }
    (out / "result.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(expected)


if __name__ == "__main__":
    main()
