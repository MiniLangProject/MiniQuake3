"""Verify the productive CL_GetServerCommand reliable-command stream."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c"
    text = original.read_text(encoding="utf-8", errors="replace")
    anchors = ["CL_GetServerCommand", "MAX_RELIABLE_COMMANDS", "bcs0", "bcs1", "bcs2",
               "CL_ConfigstringModified", "map_restart", "clientLevelShot"]
    missing = [anchor for anchor in anchors if anchor not in text]
    if missing:
        raise RuntimeError("missing Baseq3 server-command anchors: " + ", ".join(missing))
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/server_command_stream_contracts.ml", "--output", "server_command_stream_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/server_command_stream_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 26 server command-stream contracts":
        raise RuntimeError(result)
    files = [original, ROOT / "src/mq3/client/server_command_stream.ml", ROOT / "tests/server_command_stream_contracts.ml"]
    report = {
        "passed": True,
        "reference_anchors": len(anchors),
        "contracts": 26,
        "scope": "CL_GetServerCommand ring bounds, tokenization, big configstring assembly, config updates, disconnect, map restart and local levelshot policy.",
        "remaining": "Long-running network delivery is covered by the separate live match-loop gate; this gate isolates cgame command consumption.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/server_command_stream"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 8 Baseq3 server-command anchors + 26 contracts")


if __name__ == "__main__":
    main()
