"""Build and run deterministic Baseq3-compatible playable shotgun contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def assert_original_source():
    weapon = (ROOT / "Quake-III-Arena-original-source/code/game/g_weapon.c").read_text(encoding="latin-1")
    public = (ROOT / "Quake-III-Arena-original-source/code/game/bg_public.h").read_text(encoding="latin-1")
    anchors = [
        (weapon, "#define\tDEFAULT_SHOTGUN_DAMAGE\t10"),
        (public, "#define DEFAULT_SHOTGUN_SPREAD\t700"),
        (public, "#define DEFAULT_SHOTGUN_COUNT\t11"),
        (weapon, "r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;"),
        (weapon, "u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;"),
        (weapon, "VectorMA( origin, 8192 * 16, forward, end);"),
    ]
    for content, anchor in anchors:
        if anchor not in content:
            raise RuntimeError(f"Original Baseq3 shotgun anchor changed or missing: {anchor!r}")


def main():
    assert_original_source()
    output = ROOT / "build/reference/playable_shotgun"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_shotgun_contracts.ml", "--output", "playable_shotgun_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/playable_shotgun_contracts.exe"], ROOT / "build", log=output / "contracts.log").strip()
    expected = "PASS: 20 playable-shotgun contracts"
    if value != expected:
        raise RuntimeError(value)
    files = [
        ROOT / "src/mq3/client/playable_shotgun.ml",
        ROOT / "tests/playable_shotgun_contracts.ml",
        ROOT / "Quake-III-Arena-original-source/code/game/g_weapon.c",
        ROOT / "Quake-III-Arena-original-source/code/game/bg_public.h",
    ]
    report = {
        "passed": True,
        "contracts": 20,
        "scope": "Unmodified Baseq3 shotgun constants and deterministic Q_crandom spread; 11 BSP traces, target shielding, per-pellet damage, kill/score mutation and trace-error atomicity.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (output / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(expected)


if __name__ == "__main__":
    main()
