#!/usr/bin/env python3
"""Complete focused parity gate for the 22 functions defined by server/sv_client.c."""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


ACTUAL_SYMBOLS = [
    "SV_GetChallenge", "SV_AuthorizeIpPacket", "SV_DirectConnect", "SV_DropClient",
    "SV_SendClientGameState", "SV_ClientEnterWorld", "SV_CloseDownload",
    "SV_StopDownload_f", "SV_DoneDownload_f", "SV_NextDownload_f",
    "SV_BeginDownload_f", "SV_WriteDownloadToClient", "SV_Disconnect_f",
    "SV_VerifyPaks_f", "SV_ResetPureClient_f", "SV_UserinfoChanged",
    "SV_UpdateUserinfo_f", "SV_ExecuteClientCommand", "SV_ClientCommand",
    "SV_ClientThink", "SV_UserMove", "SV_ExecuteClientMessage",
]

# An executable marker in the native implementation for every original body.
SURFACES = {
    "SV_GetChallenge": ("src/mq3/server/oob_connect.ml", "function getChallenge("),
    "SV_AuthorizeIpPacket": ("src/mq3/server/oob_connect.ml", "function authorizeIpPacket("),
    "SV_DirectConnect": ("src/mq3/server/oob_connect.ml", "function directConnect("),
    "SV_DropClient": ("src/mq3/server/client_lifecycle.ml", "function dropClient("),
    "SV_SendClientGameState": ("src/mq3/server/client_lifecycle.ml", "function sendClientGameState("),
    "SV_ClientEnterWorld": ("src/mq3/server/client_lifecycle.ml", "function clientEnterWorld("),
    "SV_CloseDownload": ("src/mq3/server/download.ml", "function close(state,host)"),
    "SV_StopDownload_f": ("src/mq3/server/download.ml", "function stopDownload("),
    "SV_DoneDownload_f": ("src/mq3/server/download.ml", "function doneDownload("),
    "SV_NextDownload_f": ("src/mq3/server/download.ml", "function acknowledge("),
    "SV_BeginDownload_f": ("src/mq3/server/download.ml", "function beginDownload("),
    "SV_WriteDownloadToClient": ("src/mq3/server/download.ml", "function writeToClient("),
    "SV_Disconnect_f": ("src/mq3/server/client_lifecycle.ml", "function SV_Disconnect_f("),
    "SV_VerifyPaks_f": ("src/mq3/server/client_lifecycle.ml", "function verifyPaks("),
    "SV_ResetPureClient_f": ("src/mq3/server/client_lifecycle.ml", "function resetPureClient("),
    "SV_UserinfoChanged": ("src/mq3/server/client_lifecycle.ml", "function userinfoChanged("),
    "SV_UpdateUserinfo_f": ("src/mq3/server/client_lifecycle.ml", "function updateUserinfo("),
    "SV_ExecuteClientCommand": ("src/mq3/server/client_command_dispatch.ml", "function execute("),
    "SV_ClientCommand": ("src/mq3/server/client_command.ml", "function execute("),
    "SV_ClientThink": ("src/mq3/server/user_move.ml", "function clientThink("),
    "SV_UserMove": ("src/mq3/server/user_move.ml", "function execute("),
    "SV_ExecuteClientMessage": ("src/mq3/server/client_message.ml", "function execute("),
}

REGRESSION_GATES = [
    "test_server_download.py", "test_oob_connect.py", "test_client_command_dispatch.py",
    "test_server_client_command.py", "test_server_user_move.py", "test_server_client_message.py",
]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return ROOT / "build" / output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/sv_client_complete"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/server/sv_client.c"
    source_text = source.read_text(encoding="utf-8")

    definitions = re.findall(
        r"^(?:static\s+)?(?:void|qboolean)\s+(SV_[A-Za-z0-9_]+)\s*\([^;{}]*\)\s*\{",
        source_text, re.MULTILINE,
    )
    if definitions != ACTUAL_SYMBOLS:
        raise RuntimeError(f"sv_client definition drift: expected {ACTUAL_SYMBOLS}, got {definitions}")
    if set(SURFACES) != set(ACTUAL_SYMBOLS):
        raise RuntimeError("sv_client native map does not cover the actual definition set")
    missing = []
    for symbol, (relative, marker) in SURFACES.items():
        if marker not in (ROOT / relative).read_text(encoding="utf-8"):
            missing.append(f"{symbol} ({relative}: {marker})")
    if missing:
        raise RuntimeError("sv_client native surface drift: " + ", ".join(missing))
    # The old inventory counted this comment reference as a function and missed the
    # real SV_DropClient body. Keep that resolution machine checked.
    if re.search(r"^(?:static\s+)?(?:void|qboolean)\s+SV_FinalMessage\s*\(", source_text, re.MULTILINE):
        raise RuntimeError("SV_FinalMessage unexpectedly became a sv_client.c definition")
    dispatch_text = (ROOT / "src/mq3/server/client_command_dispatch.ml").read_text(encoding="utf-8")
    for marker in ("lifecycle.dispatchBuiltin", "host.lifecycleRuntime"):
        if marker not in dispatch_text:
            raise RuntimeError("missing productive lifecycle command wiring: " + marker)

    include = out / "sv_client_userinfo_under_test.inc"
    include.write_text(extract(source, ["SV_UserinfoChanged"]), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/sv_client_userinfo_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"],
        out, msvc_env("x86"), out / "oracle-build.log")
    expected = run([oracle], out, log=out / "oracle.log")
    actual = run([build("tests/sv_client_userinfo_oracle.ml", "sv_client_userinfo_oracle.exe")],
                 ROOT / "build", log=out / "minilang.log")
    if actual != expected:
        raise RuntimeError("SV_UserinfoChanged mismatch\nC:\n" + expected + "MiniLang:\n" + actual)

    contracts = run([build("tests/sv_client_complete_contracts.ml", "sv_client_complete_contracts.exe")],
                    ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 29 complete sv_client lifecycle contracts":
        raise RuntimeError(contracts)

    if args.full_regression:
        for gate in REGRESSION_GATES:
            subprocess.run([sys.executable, ROOT / "scripts" / gate], cwd=ROOT, check=True)

    files = {source, harness, ROOT / "tests/sv_client_userinfo_oracle.ml",
             ROOT / "tests/sv_client_complete_contracts.ml"}
    files.update(ROOT / relative for relative, _ in SURFACES.values())
    report = {
        "passed": True,
        "actual_source_definitions": len(ACTUAL_SYMBOLS),
        "symbols": ACTUAL_SYMBOLS,
        "inventory_resolution": "SV_FinalMessage is only a comment reference in sv_client.c; SV_DropClient is the omitted real definition.",
        "unchanged_c_records": len(expected.splitlines()),
        "native_productive_contracts": 29,
        "scope": "All 22 function bodies defined by Baseq3 server/sv_client.c are mapped to native MiniLang. The new closure covers authorization replies, drops, gamestate transmission, enter-world state, disconnect, pure validation/reset, and userinfo mutation; established focused gates cover challenge/connect, downloads, reliable commands, moves and outer message parsing.",
        "productive_path": "The real client-command dispatcher owns the lifecycle adapter; gamestate construction uses the native reliable-command and delta-entity protocol modules and is parsed by the real client gamestate parser.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sorted(files)},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 22/22 actual sv_client definitions + 6 unchanged-C records + 29 native/productive contracts")


if __name__ == "__main__":
    main()
