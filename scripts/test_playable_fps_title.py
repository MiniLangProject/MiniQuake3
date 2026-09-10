"""Verify stable FPS caption sampling independently of the playable app."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    output = ROOT / "build/reference/playable_fps_title"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_fps_title_contracts.ml", "--output", "playable_fps_title_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run(
        [ROOT / "build/playable_fps_title_contracts.exe"], ROOT / "build",
        log=output / "contracts.log",
    ).strip()
    expected = "PASS: 14 playable FPS-title contracts"
    if value != expected:
        raise RuntimeError(value)
    files = [
        ROOT / "src/mq3/client/playable_fps_title.ml",
        ROOT / "src/mq3/platform/playable_window.ml",
        ROOT / "native/playable_win32.c",
        ROOT / "tests/playable_fps_title_contracts.ml",
        ROOT / "tests/playable_window_lifecycle.c",
    ]
    report = {
        "passed": True,
        "contracts": 14,
        "scope": "500 ms FPS sampling, rounded measurement, EMA smoothing and throttled UTF-8 Win32 captions.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (output / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(expected)


if __name__ == "__main__":
    main()
