#!/usr/bin/env python3
"""Focused ABI/declaration/productive-surface gate for code/server/server.h."""
from __future__ import annotations

import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


HEADER = ROOT / "Quake-III-Arena-original-source/code/server/server.h"

CONSTANTS = {
    "PERS_SCORE": 0,
    "MAX_ENT_CLUSTERS": 16,
    "MAX_CHALLENGES": 1024,
    "AUTHORIZE_TIMEOUT": 5000,
    "MAX_MASTERS": 8,
    "MAX_MASTER_SERVERS": 5,
}
ENUMS = {
    "serverState_t": ["SS_DEAD", "SS_LOADING", "SS_GAME"],
    "clientState_t": ["CS_FREE", "CS_ZOMBIE", "CS_CONNECTED", "CS_PRIMED", "CS_ACTIVE"],
}
STRUCTS = [
    "svEntity_t", "server_t", "clientSnapshot_t", "netchan_buffer_t",
    "client_t", "challenge_t", "serverStatic_t",
]
CVARS = [
    "sv_fps", "sv_timeout", "sv_zombietime", "sv_rconPassword", "sv_privatePassword",
    "sv_allowDownload", "sv_maxclients", "sv_privateClients", "sv_hostname", "sv_master",
    "sv_reconnectlimit", "sv_showloss", "sv_padPackets", "sv_killserver", "sv_mapname",
    "sv_mapChecksum", "sv_serverid", "sv_maxRate", "sv_minPing", "sv_maxPing", "sv_gametype",
    "sv_pure", "sv_floodProtect", "sv_lanForceRate", "sv_strictAuth",
]
PROTOTYPES = [
    "SV_FinalMessage", "SV_SendServerCommand", "SV_AddOperatorCommands", "SV_RemoveOperatorCommands",
    "SV_MasterHeartbeat", "SV_MasterShutdown", "SV_SetConfigstring", "SV_GetConfigstring",
    "SV_SetUserinfo", "SV_GetUserinfo", "SV_ChangeMaxClients", "SV_SpawnServer", "SV_GetChallenge",
    "SV_DirectConnect", "SV_AuthorizeIpPacket", "SV_ExecuteClientMessage", "SV_UserinfoChanged",
    "SV_ClientEnterWorld", "SV_DropClient", "SV_ExecuteClientCommand", "SV_ClientThink",
    "SV_WriteDownloadToClient", "SV_Heartbeat_f", "SV_AddServerCommand",
    "SV_UpdateServerCommandsToClient", "SV_WriteFrameToClient", "SV_SendMessageToClient",
    "SV_SendClientMessages", "SV_SendClientSnapshot", "SV_NumForGentity", "SV_GentityNum",
    "SV_GameClientNum", "SV_SvEntityForGentity", "SV_GEntityForSvEntity", "SV_InitGameProgs",
    "SV_ShutdownGameProgs", "SV_RestartGameProgs", "SV_inPVS", "SV_BotFrame",
    "SV_BotAllocateClient", "SV_BotFreeClient", "SV_BotInitCvars", "SV_BotLibSetup",
    "SV_BotLibShutdown", "SV_BotGetSnapshotEntity", "SV_BotGetConsoleMessage",
    "BotImport_DebugPolygonCreate", "BotImport_DebugPolygonDelete", "SV_ClearWorld",
    "SV_UnlinkEntity", "SV_LinkEntity", "SV_ClipHandleForEntity", "SV_SectorList_f",
    "SV_AreaEntities", "SV_PointContents", "SV_Trace", "SV_ClipToEntity", "SV_Netchan_Transmit",
    "SV_Netchan_TransmitNextFragment", "SV_Netchan_Process",
]

# Each public C prototype is tied to executable MiniLang code.  A marker is
# intentionally a function declaration, never a comment or future-work token.
SURFACES = {
    "SV_FinalMessage": ("src/mq3/server/init_runtime.ml", "function SV_FinalMessage("),
    "SV_SendServerCommand": ("src/mq3/server/main_runtime.ml", "function SV_SendServerCommand("),
    "SV_AddOperatorCommands": ("src/mq3/server/operator_commands.ml", "function SV_AddOperatorCommands("),
    "SV_RemoveOperatorCommands": ("src/mq3/server/operator_commands.ml", "function SV_RemoveOperatorCommands("),
    "SV_MasterHeartbeat": ("src/mq3/server/main_runtime.ml", "function SV_MasterHeartbeat("),
    "SV_MasterShutdown": ("src/mq3/server/main_runtime.ml", "function SV_MasterShutdown("),
    "SV_SetConfigstring": ("src/mq3/server/init_runtime.ml", "function SV_SetConfigstring("),
    "SV_GetConfigstring": ("src/mq3/server/init_runtime.ml", "function SV_GetConfigstring("),
    "SV_SetUserinfo": ("src/mq3/server/init_runtime.ml", "function SV_SetUserinfo("),
    "SV_GetUserinfo": ("src/mq3/server/init_runtime.ml", "function SV_GetUserinfo("),
    "SV_ChangeMaxClients": ("src/mq3/server/init_runtime.ml", "function SV_ChangeMaxClients("),
    "SV_SpawnServer": ("src/mq3/server/init_runtime.ml", "function SV_SpawnServer("),
    "SV_GetChallenge": ("src/mq3/server/oob_connect.ml", "function getChallenge("),
    "SV_DirectConnect": ("src/mq3/server/oob_connect.ml", "function directConnect("),
    "SV_AuthorizeIpPacket": ("src/mq3/server/oob_connect.ml", "function SV_AuthorizeIpPacket("),
    "SV_ExecuteClientMessage": ("src/mq3/server/client_message.ml", "function execute(serverState,clientState,host,msg)"),
    "SV_UserinfoChanged": ("src/mq3/server/client_lifecycle.ml", "function SV_UserinfoChanged("),
    "SV_ClientEnterWorld": ("src/mq3/server/client_lifecycle.ml", "function SV_ClientEnterWorld("),
    "SV_DropClient": ("src/mq3/server/client_lifecycle.ml", "function SV_DropClient("),
    "SV_ExecuteClientCommand": ("src/mq3/server/client_command_dispatch.ml", "function execute(host,clientState,text,clientOk,serverState)"),
    "SV_ClientThink": ("src/mq3/server/user_move.ml", "function clientThink("),
    "SV_WriteDownloadToClient": ("src/mq3/server/download.ml", "function writeToClient("),
    "SV_Heartbeat_f": ("src/mq3/server/operator_commands.ml", "function SV_Heartbeat_f("),
    "SV_AddServerCommand": ("src/mq3/server/main_runtime.ml", "function SV_AddServerCommand("),
    "SV_UpdateServerCommandsToClient": ("src/mq3/server/reliable_commands.ml", "function updateServerCommandsToClient("),
    "SV_WriteFrameToClient": ("src/mq3/server/snapshot_send.ml", "function writeSnapshotToClient("),
    "SV_SendMessageToClient": ("src/mq3/server/snapshot_send.ml", "function sendMessageToClient("),
    "SV_SendClientMessages": ("src/mq3/server/snapshot_schedule.ml", "function sendClientMessages("),
    "SV_SendClientSnapshot": ("src/mq3/server/snapshot_send.ml", "function sendClientSnapshot("),
    "SV_NumForGentity": ("src/mq3/server/game_interface.ml", "function SV_NumForGentity("),
    "SV_GentityNum": ("src/mq3/server/game_interface.ml", "function SV_GentityNum("),
    "SV_GameClientNum": ("src/mq3/server/game_interface.ml", "function SV_GameClientNum("),
    "SV_SvEntityForGentity": ("src/mq3/server/game_interface.ml", "function SV_SvEntityForGentity("),
    "SV_GEntityForSvEntity": ("src/mq3/server/game_interface.ml", "function SV_GEntityForSvEntity("),
    "SV_InitGameProgs": ("src/mq3/server/game_vm.ml", "function initialize("),
    "SV_ShutdownGameProgs": ("src/mq3/server/game_vm.ml", "function shutdown("),
    "SV_RestartGameProgs": ("src/mq3/server/game_vm.ml", "function restart("),
    "SV_inPVS": ("src/mq3/server/world.ml", "function inPVS("),
    "SV_BotFrame": ("src/mq3/botlib/server_imports.ml", "function SV_BotFrame("),
    "SV_BotAllocateClient": ("src/mq3/botlib/server_imports.ml", "function SV_BotAllocateClient("),
    "SV_BotFreeClient": ("src/mq3/botlib/server_imports.ml", "function SV_BotFreeClient("),
    "SV_BotInitCvars": ("src/mq3/botlib/server_imports.ml", "function SV_BotInitCvars("),
    "SV_BotLibSetup": ("src/mq3/botlib/server_imports.ml", "function SV_BotLibSetup("),
    "SV_BotLibShutdown": ("src/mq3/botlib/server_imports.ml", "function SV_BotLibShutdown("),
    "SV_BotGetSnapshotEntity": ("src/mq3/botlib/server_imports.ml", "function SV_BotGetSnapshotEntity("),
    "SV_BotGetConsoleMessage": ("src/mq3/botlib/server_imports.ml", "function SV_BotGetConsoleMessage("),
    "BotImport_DebugPolygonCreate": ("src/mq3/botlib/server_imports.ml", "function BotImport_DebugPolygonCreate("),
    "BotImport_DebugPolygonDelete": ("src/mq3/botlib/server_imports.ml", "function BotImport_DebugPolygonDelete("),
    "SV_ClearWorld": ("src/mq3/server/world.ml", "function create(world)"),
    "SV_UnlinkEntity": ("src/mq3/server/world.ml", "function unlinkEntity("),
    "SV_LinkEntity": ("src/mq3/server/world.ml", "function linkEntity("),
    "SV_ClipHandleForEntity": ("src/mq3/server/world.ml", "function clipHandleForEntity("),
    "SV_SectorList_f": ("src/mq3/server/world.ml", "function SV_SectorList_f("),
    "SV_AreaEntities": ("src/mq3/server/world.ml", "function areaEntities("),
    "SV_PointContents": ("src/mq3/server/world.ml", "function pointContents("),
    "SV_Trace": ("src/mq3/server/world.ml", "function trace("),
    "SV_ClipToEntity": ("src/mq3/server/world.ml", "function clipToEntity("),
    "SV_Netchan_Transmit": ("src/mq3/server/netchan.ml", "function transmit("),
    "SV_Netchan_TransmitNextFragment": ("src/mq3/server/netchan.ml", "function transmitNextFragment("),
    "SV_Netchan_Process": ("src/mq3/server/netchan.ml", "function process(clientState,data,maxsize)"),
}


def build(source: str, output: str):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return ROOT / "build" / output


def header_surface(text: str) -> None:
    for name, expected in CONSTANTS.items():
        match = re.search(rf"^#define\s+{name}\s+([0-9]+)", text, re.MULTILINE)
        if not match or int(match.group(1)) != expected:
            raise RuntimeError(f"server.h constant drift: {name}")

    typedefs = re.findall(r"typedef\s+(struct(?:\s+\w+)?|enum)\s*\{(.*?)\}\s*(\w+)\s*;", text, re.DOTALL)
    structs = [name for kind, _, name in typedefs if kind.startswith("struct")]
    if structs != STRUCTS:
        raise RuntimeError(f"server.h struct drift: expected {STRUCTS}, got {structs}")
    enum_bodies = {name: body for kind, body, name in typedefs if kind == "enum"}
    if set(enum_bodies) != set(ENUMS):
        raise RuntimeError(f"server.h enum drift: {sorted(enum_bodies)}")
    for name, expected in ENUMS.items():
        body = re.sub(r"//[^\n]*|/\*.*?\*/", "", enum_bodies[name], flags=re.DOTALL)
        actual = [part.strip().split("=")[0].strip() for part in body.split(",") if part.strip()]
        if actual != expected:
            raise RuntimeError(f"server.h enum member drift: {name}: {actual}")

    cvars = re.findall(r"^extern\s+cvar_t\s*\*\s*(sv_\w+)(?:\s*\[[^]]+\])?\s*;", text, re.MULTILINE)
    if cvars != CVARS:
        raise RuntimeError(f"server.h cvar drift: expected {CVARS}, got {cvars}")

    declarations = re.findall(
        r"^[\t ]*[A-Za-z_][A-Za-z0-9_\t *]*?(?:QDECL[\t ]+)?"
        r"((?:SV_|BotImport_)[A-Za-z0-9_]+)[\t ]*\([^;]*\)[\t ]*;",
        text, re.MULTILINE,
    )
    if declarations != PROTOTYPES:
        raise RuntimeError(f"server.h prototype drift: expected {PROTOTYPES}, got {declarations}")


def main() -> None:
    out = ROOT / "build/reference/server_header_abi"
    out.mkdir(parents=True, exist_ok=True)
    text = HEADER.read_text(encoding="utf-8", errors="replace")
    header_surface(text)

    if set(SURFACES) != set(PROTOTYPES):
        raise RuntimeError("productive surface map does not cover the server.h prototype set")
    missing = []
    for symbol, (relative, marker) in SURFACES.items():
        path = ROOT / relative
        if not path.is_file() or marker not in path.read_text(encoding="utf-8"):
            missing.append(f"{symbol} ({relative}: {marker})")
    if missing:
        raise RuntimeError("server.h productive surface drift: " + ", ".join(missing))

    harness = ROOT / "tests/reference/server_header_abi_oracle.c"
    oracle = out / "oracle.exe"
    include_root = ROOT / "Quake-III-Arena-original-source/code"
    run([
        "cl", "/nologo", "/Od", "/MT", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS",
        f"/I{include_root / 'server'}", f"/I{include_root / 'game'}", f"/I{include_root / 'qcommon'}",
        harness, f"/Fe:{oracle}", "/link", "/Brepro",
    ], out, msvc_env("x86"), out / "oracle-build.log")
    expected = run([oracle], out, log=out / "oracle.log")
    actual = run([build("tests/server_header_abi_oracle.ml", "server_header_abi_oracle.exe")],
                 ROOT / "build", log=out / "minilang.log")
    if actual != expected:
        left, right = expected.splitlines(), actual.splitlines()
        for index in range(max(len(left), len(right))):
            a = left[index] if index < len(left) else "<missing>"
            b = right[index] if index < len(right) else "<missing>"
            if a != b:
                raise RuntimeError(f"server.h ABI mismatch record {index + 1}\nC: {a}\nMiniLang: {b}")

    contracts = run([build("tests/server_header_abi_contracts.ml", "server_header_abi_contracts.exe")],
                    ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 22 server.h ABI/productive contracts":
        raise RuntimeError(contracts)

    files = {HEADER, harness, ROOT / "src/mq3/server/abi.ml",
             ROOT / "tests/server_header_abi_oracle.ml", ROOT / "tests/server_header_abi_contracts.ml"}
    files.update(ROOT / relative for relative, _ in SURFACES.values())
    report = {
        "passed": True,
        "constants": len(CONSTANTS), "enum_members": sum(map(len, ENUMS.values())),
        "structs": len(STRUCTS), "cvars": len(CVARS), "prototypes": len(PROTOTYPES),
        "unchanged_c_abi_records": len(expected.splitlines()), "native_productive_contracts": 22,
        "abi": "MSVC x86 field offsets and sizes from the unchanged original server.h; MiniLang values are managed and use explicit protocol serializers at binary boundaries.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sorted(files)},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: server.h 7/7 structs + 6/6 constants + 8/8 enum members + 25/25 cvars + 60/60 productive prototypes + 124 ABI records + 22 contracts")


if __name__ == "__main__":
    main()
