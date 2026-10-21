"""Verify productive CL_SendCmd packet construction and pacing."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c"
    text = original.read_text(encoding="utf-8", errors="replace")
    anchors = ["CL_CreateNewCommands", "CL_ReadyToSendPacket", "CL_WritePacket", "CL_SendCmd",
               "MSG_WriteDeltaUsercmdKey", "MAX_PACKET_USERCMDS", "cl_packetdup", "cl_maxpackets"]
    missing = [anchor for anchor in anchors if anchor not in text]
    if missing:
        raise RuntimeError("missing Baseq3 client-send anchors: " + ", ".join(missing))
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/client_send_cmd_contracts.ml", "--output", "client_send_cmd_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/client_send_cmd_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 39 client send-command contracts":
        raise RuntimeError(result)
    files = [original, ROOT / "src/mq3/client/send_cmd.ml", ROOT / "src/mq3/client/frame.ml",
             ROOT / "tests/client_send_cmd_contracts.ml"]
    report = {
        "passed": True,
        "reference_anchors": len(anchors),
        "contracts": 39,
        "scope": "Baseq3 CL_SendCmd command creation, packet pacing, reliable-command replay, packet duplication, delta/no-delta selection, keyed usercmd encoding, outPacket bookkeeping and productive CL_Netchan transmission.",
        "remaining": "Physical key/mouse accumulation into CL_CreateCmd remains a host callback; the QVM preview already creates equivalent usercmd fields from live input.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/client_send_cmd"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 8 Baseq3 client-send anchors + 39 contracts")


if __name__ == "__main__":
    main()
