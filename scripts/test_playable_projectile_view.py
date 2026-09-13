"""Build and run snapshot-driven enemy projectile rendering contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> int:
    out = ROOT / "build/reference/playable_projectile_view"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/playable_projectile_view_contracts.ml", "--output",
         "playable_projectile_view_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    contracts = run(
        [ROOT / "build/playable_projectile_view_contracts.exe"],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    expected = "PASS: 36 playable-projectile-view contracts"
    if contracts != expected:
        raise RuntimeError(contracts)
    files = [
        ROOT / "src/mq3/client/playable_projectile_view.ml",
        ROOT / "tests/playable_projectile_view_contracts.ml",
    ]
    result = {
        "passed": True,
        "contracts": 36,
        "scope": (
            "Snapshot-driven enemy projectile trails, screen-space glows and "
            "fading impact crosses for the playable Win32 line renderer."
        ),
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path)
            for path in files
        },
    }
    (out / "result.json").write_text(
        json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(expected)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
