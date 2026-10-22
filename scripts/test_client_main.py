"""Verify the complete native code/client/cl_main.c ownership adapter."""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run


SYMBOLS = [
    "CL_AddReliableCommand", "CL_BeginDownload", "CL_CDDialog", "CL_CDKeyValidate",
    "CL_ChangeReliableCommand", "CL_CheckForResend", "CL_CheckTimeout", "CL_CheckUserinfo",
    "CL_ClearPing", "CL_ClearState", "CL_Clientinfo_f", "CL_Configstrings_f", "CL_Connect_f",
    "CL_ConnectionlessPacket", "CL_DemoCompleted", "CL_DemoFilename", "CL_Disconnect",
    "CL_DisconnectPacket", "CL_Disconnect_f", "CL_DownloadsComplete", "CL_FlushMemory",
    "CL_ForwardCommandToServer", "CL_ForwardToServer_f", "CL_Frame", "CL_GetFreePing",
    "CL_GetPing", "CL_GetPingInfo", "CL_GetPingQueueCount", "CL_GetServerStatus",
    "CL_GlobalServers_f", "CL_Init", "CL_InitDownloads", "CL_InitRef", "CL_InitRenderer",
    "CL_InitServerInfo", "CL_LocalServers_f", "CL_MapLoading", "CL_MotdPacket", "CL_NextDemo",
    "CL_NextDownload", "CL_OpenedPK3List_f", "CL_PacketEvent", "CL_Ping_f", "CL_PlayDemo_f",
    "CL_Rcon_f", "CL_ReadDemoMessage", "CL_Reconnect_f", "CL_Record_f", "CL_RefMalloc",
    "CL_RefPrintf", "CL_ReferencedPK3List_f", "CL_RequestMotd", "CL_ResetPureClientAtServer",
    "CL_ScaledMilliseconds", "CL_SendPureChecksums", "CL_ServerInfoPacket", "CL_ServerStatus",
    "CL_ServerStatusResponse", "CL_ServerStatus_f", "CL_ServersResponsePacket", "CL_SetModel_f",
    "CL_SetServerInfo", "CL_SetServerInfoByAddress", "CL_Setenv_f", "CL_ShowIP_f", "CL_Shutdown",
    "CL_ShutdownAll", "CL_ShutdownRef", "CL_Snd_Restart_f", "CL_StartDemoLoop", "CL_StartHunkUsers",
    "CL_StopRecord_f", "CL_UpdateServerInfo", "CL_UpdateVisiblePings_f", "CL_Vid_Restart_f",
    "CL_WalkDemoExt", "CL_WriteDemoMessage", "packets",
]


def build_ml(source: str, output: str) -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    args = parser.parse_args()
    out = ROOT / "build/reference/client_main"
    out.mkdir(parents=True, exist_ok=True)

    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_main.c"
    module = ROOT / "src/mq3/client/client_main.ml"
    original_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8-sig")
    absent = []
    for name in SYMBOLS:
        if name == "packets":
            if not re.search(r"\bpackets\b", original_text):
                absent.append(name)
        elif not re.search(rf"\b{re.escape(name)}\s*\(", original_text):
            absent.append(name)
    missing = [name for name in SYMBOLS if not re.search(rf"(?m)^function\s+{re.escape(name)}\s*\(", module_text)]
    if absent or missing:
        raise RuntimeError(f"symbol mismatch original={absent} minilang={missing}")
    for anchor in (
        "MAX_RELIABLE_COMMANDS", "Client command overflow", "RETRANSMIT_TIMEOUT",
        "getserversResponse", "MAX_PINGREQUESTS", "MAX_SERVERSTATUSREQUESTS",
        "download ", "demo9999.tga", "Server connection timed out",
    ):
        if anchor not in original_text:
            raise RuntimeError(f"missing cl_main source anchor: {anchor}")

    oracle_source = ROOT / "tests/reference/client_main_oracle.c"
    oracle_exe = out / "client_main_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS",
         oracle_source, f"/Fe:{oracle_exe}", "/link", "/Brepro"],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    oracle = run([oracle_exe], out, log=out / "oracle.log").strip()
    if oracle != "PASS: 18 unchanged-C client_main observations":
        raise RuntimeError(oracle)

    build_ml("tests/client_main_contracts.ml", "client_main_contracts.exe")
    native = run([ROOT / "build/client_main_contracts.exe"], ROOT, log=out / "contracts.log").strip()
    if native != "PASS: 47 client_main native contracts":
        raise RuntimeError(native)

    build_ml("tests/client_main_retail_probe.ml", "client_main_retail_probe.exe")
    pak = args.data_root / "baseq3/pak0.pk3"
    retail = run([ROOT / "build/client_main_retail_probe.exe", pak], ROOT, log=out / "retail.log").strip()
    if not retail.startswith("PASS: 7 retail client_main probes"):
        raise RuntimeError(retail)

    files = [module, oracle_source, ROOT / "tests/client_main_contracts.ml", ROOT / "tests/client_main_retail_probe.ml"]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "oracle": oracle,
        "native": native,
        "retail": retail,
        "scope": "Full cl_main.c native state owner plus typed, retail-suppressible host actions; existing demo framing is reused directly.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in [original, *files]},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 78/78 client_main symbols + 18 C + 47 native + 7 retail contracts")


if __name__ == "__main__":
    main()
