#!/usr/bin/env python3
"""Complete unchanged-C and productive gate for code/win32/win_net.c."""
from __future__ import annotations

import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SYMBOLS = [
    "NET_Config", "NET_ErrorString", "NET_GetCvars", "NET_GetLocalAddress",
    "NET_IPSocket", "NET_IPXSocket", "NET_Init", "NET_OpenIP", "NET_OpenIPX",
    "NET_OpenSocks", "NET_Restart", "NET_Shutdown", "NET_Sleep",
    "NetadrToSockadr", "SockadrToNetadr", "Sys_GetPacket", "Sys_IsLANAddress",
    "Sys_SendPacket", "Sys_ShowIP", "Sys_StringToAdr", "Sys_StringToSockaddr",
]
EXACT = ["NET_ErrorString", "NetadrToSockadr", "SockadrToNetadr", "Sys_IsLANAddress"]


def build(source: str, output: str):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win_net_complete"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/win32/win_net.c"
    runtime = ROOT / "src/mq3/platform/win_net_runtime.ml"
    source = runtime.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", source)]
    if missing:
        raise RuntimeError("missing win_net runtime symbols: " + ", ".join(missing))

    include = out / "win_net_complete_under_test.inc"
    include.write_text(extract(original, EXACT), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/win_net_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{out}", harness, "ws2_32.lib", f"/Fe:{oracle}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    mini = run([build("tests/win_net_complete_oracle.ml", "win_net_complete_oracle.exe")],
               ROOT / "build", log=out / "minilang.log")
    if native != mini:
        left, right = native.splitlines(), mini.splitlines()
        for index, pair in enumerate(zip(left, right), 1):
            if pair[0] != pair[1]:
                raise RuntimeError(f"win_net mismatch record {index}\nC: {pair[0]}\nM: {pair[1]}")
        raise RuntimeError(f"win_net record count mismatch C={len(left)} MiniLang={len(right)}")

    contracts = run([build("tests/win_net_complete_contracts.ml", "win_net_complete_contracts.exe")],
                    ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 34 complete win_net contracts":
        raise RuntimeError(contracts)

    subprocess.run([sys.executable, ROOT / "scripts/test_udp_platform.py"], cwd=ROOT, check=True)
    native_source = (ROOT / "native/udp_win64.c").read_text(encoding="utf-8")
    required_native = [
        "WSAStartup", "WSACleanup", "ioctlsocket", "SO_BROADCAST", "GetAddrInfoW",
        "bind", "getsockname", "sendto", "recvfrom", "select", "gethostname",
        "getaddrinfo", "closesocket", "mq3_udp_error_name",
        "mq3_udp_socks5_open", "connect", "request[1]=3",
    ]
    missing_native = [name for name in required_native if name not in native_source]
    if missing_native:
        raise RuntimeError("missing productive Winsock anchors: " + ", ".join(missing_native))

    files = [
        original, runtime, ROOT / "src/mq3/platform/udp.ml", ROOT / "native/udp_win64.c",
        harness, ROOT / "tests/win_net_complete_oracle.ml",
        ROOT / "tests/win_net_complete_contracts.ml",
    ]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "exact_functions": EXACT,
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 34,
        "udp_regression_contracts": 13,
        "productive_anchors": len(required_native),
        "scope": "All 21 win_net.c entry points through a C-named MiniLang runtime and the Windows-x64 Winsock backend: lifecycle/config/restart, IPv4 address conversion and resolution, LAN classification, local-interface enumeration, nonblocking bind/broadcast/send/receive/select, oversize and error paths, plus qcommon loopback delivery.",
        "compatibility": "The retired AF_IPX entry points deterministically report unavailable on current Windows. SOCKS5 TCP negotiation and UDP associate/header routing remain available for the original optional proxy configuration.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(SYMBOLS)}/{len(SYMBOLS)} win_net symbols + {len(native.splitlines())} unchanged-C records + 34 contracts + 13 UDP regression contracts")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
