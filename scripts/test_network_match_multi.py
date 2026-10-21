"""Exercise two independent clients against one real localhost UDP server."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    originals = [
        ROOT / "Quake-III-Arena-original-source/code/client/cl_main.c",
        ROOT / "Quake-III-Arena-original-source/code/client/cl_parse.c",
        ROOT / "Quake-III-Arena-original-source/code/qcommon/net_chan.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_client.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_main.c",
        ROOT / "Quake-III-Arena-original-source/code/server/sv_snapshot.c",
    ]
    anchors = ["CL_CheckForResend", "CL_ConnectionlessPacket", "SV_GetChallenge", "SV_DirectConnect",
               "CL_ParsePacketEntities", "Netchan_Process", "SV_PacketEvent", "SV_UserMove",
               "SV_SendClientMessages", "SV_BuildClientSnapshot", "SV_AddEntitiesVisibleFromPoint"]
    joined = "\n".join(path.read_text(encoding="utf-8", errors="replace") for path in originals)
    missing = [anchor for anchor in anchors if anchor not in joined]
    if missing:
        raise RuntimeError("missing Baseq3 multi-client anchors: " + ", ".join(missing))
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/network_match_multi_contracts.ml", "--output", "network_match_multi_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/network_match_multi_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 67 live two-client match contracts":
        raise RuntimeError(result)
    files = originals + [ROOT / "src/mq3/client/network_handshake.ml", ROOT / "src/mq3/client/network_match_loop.ml", ROOT / "tests/network_match_multi_contracts.ml"]
    report = {
        "passed": True,
        "reference_anchors": len(anchors),
        "contracts": 67,
        "scope": "Two simultaneous Protocol-68 clients perform real Winsock getchallenge/challengeResponse and Huffman connect/connectResponse negotiation before handoff to separate client/server netchans. A 384-frame live soak then exercises 768 usercmds, deterministic client/snapshot loss and duplicates, packetdup recovery, independent reliable stream and packet-ring wrap, hundreds of delta snapshots, mutual entity visibility, and bidirectional CL_Frame/SV_Frame timeout-state projection.",
        "remaining": "The test snapshot builder models shared visibility explicitly; production PVS and game-world selection remain owned by the live server snapshot builder.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/network_match_multi"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 11 Baseq3 multi-client anchors + 67 live contracts")


if __name__ == "__main__":
    main()
