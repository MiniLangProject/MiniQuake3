"""Build and verify Baseq3-anchored projectile trails and software lights."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> int:
    out = ROOT / "build/reference/playable_projectile_fx"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/playable_projectile_fx_contracts.ml", "--output",
         "playable_projectile_fx_contracts.exe"],
        cwd=ROOT, check=True,
    )
    contracts = run([ROOT / "build/playable_projectile_fx_contracts.exe"],
                    ROOT / "build", log=out / "contracts.log").strip()
    expected = "PASS: 31 playable projectile-fx contracts"
    if contracts != expected:
        raise RuntimeError(contracts)

    source = (ROOT / "Quake-III-Arena-original-source/code/cgame/cg_weapons.c").read_text(
        encoding="utf-8", errors="replace")
    anchors = [
        "step = 50;", "weaponInfo->missileTrailFunc = CG_RocketTrail;",
        "weaponInfo->missileDlight = 200;", "weaponInfo->wiTrailTime = 2000;",
        "weaponInfo->trailRadius = 64;", "weaponInfo->missileTrailFunc = CG_GrenadeTrail;",
        "weaponInfo->wiTrailTime = 700;", "weaponInfo->trailRadius = 32;",
        "le->endTime = le->startTime + 600;", "light = 300;",
    ]
    missing = [anchor for anchor in anchors if anchor not in source]
    if missing:
        raise RuntimeError(f"missing original Baseq3 anchors: {missing}")
    files = [ROOT / "src/mq3/client/playable_projectile_fx.ml",
             ROOT / "tests/playable_projectile_fx_contracts.ml"]
    result = {
        "passed": True, "contracts": 31, "baseq3_anchors": len(anchors),
        "scope": "50 ms rocket/grenade smoke, plasma motes, rocket missile light and rocket/grenade explosion-light overlays.",
        "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(expected)
    print(f"PASS: {len(anchors)} original Baseq3 projectile-fx anchors")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
