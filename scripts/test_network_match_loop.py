"""Exercise a complete localhost client-command/server-snapshot protocol loop."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    originals = [
        ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c",
        ROOT / "Quake-III-Arena-original-source/code/client/cl_main.c",
        ROOT / "Quake-III-Arena-original-source/code/client/cl_parse.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_client.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_main.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_snapshot.c",
        ROOT / "Quake-III-Arena-original-source/code/qcommon/net_chan.c",
    ]
    anchors = ["CL_SendCmd", "CL_PacketEvent", "SV_PacketEvent", "SV_ExecuteClientMessage",
               "SV_UserMove", "SV_SendClientSnapshot", "SV_WriteSnapshotToClient", "CL_ParseSnapshot",
               "Netchan_Process"]
    joined = "\n".join(path.read_text(encoding="utf-8", errors="replace") for path in originals)
    missing = [anchor for anchor in anchors if anchor not in joined]
    if missing:
        raise RuntimeError("missing Baseq3 match-loop anchors: " + ", ".join(missing))
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/network_match_loop_contracts.ml", "--output", "network_match_loop_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/network_match_loop_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 48 live network match-loop contracts":
        raise RuntimeError(result)
    files = originals + [ROOT / "src/mq3/client/network_match_loop.ml", ROOT / "src/mq3/client/send_cmd.ml",
                         ROOT / "src/mq3/server/netchan.ml", ROOT / "tests/network_match_loop_contracts.ml"]
    report = {
        "passed": True,
        "reference_anchors": len(anchors),
        "contracts": 48,
        "scope": "Seven real localhost Protocol-68 client frames through CL_SendCmd, server netchan/message/user-move and snapshots into CL_ParseSnapshot. Covers packetdup command recovery, duplicate rejection, a lost server snapshot recovered from a retained delta base, explicit no-delta full fallback, reliable acknowledgements, and both packet rings.",
        "remaining": "The orchestration accepts a snapshot builder callback; binding that callback to the live game entity/playerstate world remains the outer engine host responsibility.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/network_match_loop"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 9 Baseq3 match-loop anchors + 48 live contracts")


if __name__ == "__main__":
    main()
