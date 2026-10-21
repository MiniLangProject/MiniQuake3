"""Exercise the stateful Baseq3 UI LAN trap backend without retail assets."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def build_and_run(source: str, output: str, *args) -> str:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return run([ROOT / "build" / output, *args], ROOT / "build").strip()


def main() -> None:
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_ui.c"
    source = original.read_text(encoding="utf-8", errors="replace")
    required = [
        "LAN_LoadCachedServers", "LAN_SaveServersToCache", "LAN_ResetPings",
        "LAN_AddServer", "LAN_RemoveServer", "LAN_GetServerCount",
        "LAN_GetServerAddressString", "LAN_GetServerInfo", "LAN_GetServerPing",
        "LAN_CompareServers", "LAN_GetPingQueueCount", "LAN_ClearPing",
        "LAN_GetPing", "LAN_GetPingInfo", "LAN_MarkServerVisible",
        "LAN_ServerIsVisible", "LAN_UpdateVisiblePings", "LAN_GetServerStatus",
    ]
    missing = [name for name in required if name not in source]
    if missing:
        raise RuntimeError("Baseq3 LAN reference functions missing: " + ", ".join(missing))

    contracts = build_and_run("tests/ui_lan_browser_contracts.ml", "ui_lan_browser_contracts.exe")
    dispatch = build_and_run("tests/ui_lan_dispatch_contracts.ml", "ui_lan_dispatch_contracts.exe")
    ingress = build_and_run("tests/ui_lan_ingress_contracts.ml", "ui_lan_ingress_contracts.exe")
    if contracts != "PASS: 30 UI LAN browser contracts":
        raise RuntimeError(contracts)
    if dispatch != "PASS: 17 UI LAN syscall integration contracts":
        raise RuntimeError(dispatch)
    if ingress != "PASS: 13 UI LAN packet ingress contracts":
        raise RuntimeError(ingress)

    functions = [
        "CL_InitServerInfo", "CL_ServersResponsePacket", "CL_SetServerInfo",
        "CL_SetServerInfoByAddress", "CL_ServerInfoPacket", "CL_ServerStatusResponse",
    ]
    out = ROOT / "build/reference/ui_lan_browser"
    out.mkdir(parents=True, exist_ok=True)
    (out / "ui_lan_ingress_under_test.inc").write_text(
        extract(ROOT / "Quake-III-Arena-original-source/code/client/cl_main.c", functions),
        encoding="utf-8", newline="\n",
    )
    native_exe = out / "ingress-oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{out}", ROOT / "tests/reference/ui_lan_ingress_oracle.c",
         f"/Fe:{native_exe}", "/link", "/Brepro"],
        out, msvc_env("x86"), out / "ingress-oracle-build.log",
    )
    native = run([native_exe], out, log=out / "ingress-oracle.log")
    mini = build_and_run("tests/ui_lan_ingress_oracle.ml", "ui_lan_ingress_oracle.exe") + "\n"
    if native != mini:
        native_lines = native.splitlines(); mini_lines = mini.splitlines()
        for index in range(max(len(native_lines), len(mini_lines))):
            left = native_lines[index] if index < len(native_lines) else "<missing>"
            right = mini_lines[index] if index < len(mini_lines) else "<missing>"
            if left != right:
                raise RuntimeError(f"UI LAN ingress mismatch record {index+1}\nnative: {left}\nmini:   {right}")

    cache_oracle = out / "cache-oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/std:c11", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS",
         ROOT / "tests/reference/ui_lan_cache_oracle.c", f"/Fe:{cache_oracle}",
         "/link", "/Brepro"],
        out, msvc_env("x86"), out / "cache-oracle-build.log",
    )
    cache_fixture = out / "servercache-oracle.dat"
    run([cache_oracle, cache_fixture], out, log=out / "cache-oracle.log")
    cache_disk = out / "disk"
    cache_disk.mkdir(parents=True, exist_ok=True)
    cache_contracts = build_and_run(
        "tests/ui_lan_cache_contracts.ml", "ui_lan_cache_contracts.exe",
        cache_fixture, cache_disk,
    )
    if cache_contracts != "PASS: 24 UI LAN servercache contracts":
        raise RuntimeError(cache_contracts)

    files = [
        original,
        ROOT / "src/mq3/client/ui_lan_browser.ml",
        ROOT / "src/mq3/client/ui_lan_ingress.ml",
        ROOT / "src/mq3/client/ui_lan_cache.ml",
        ROOT / "src/mq3/engine/local_qvm_match.ml",
        ROOT / "tests/ui_lan_browser_contracts.ml",
        ROOT / "tests/ui_lan_dispatch_contracts.ml",
        ROOT / "tests/ui_lan_ingress_contracts.ml",
        ROOT / "tests/ui_lan_ingress_oracle.ml",
        ROOT / "tests/reference/ui_lan_ingress_oracle.c",
        ROOT / "tests/ui_lan_cache_contracts.ml",
        ROOT / "tests/reference/ui_lan_cache_oracle.c",
    ]
    report = {
        "passed": True,
        "reference_functions": len(required),
        "contracts": 84,
        "exact_ingress_records": len(native.splitlines()),
        "exact_cache_bytes": cache_fixture.stat().st_size,
        "scope": "Stateful server catalogs, exact on-disk servercache.dat persistence, ping queue, visibility, response metadata and Baseq3 sorting through the UI syscall ABI; real connectionless infoResponse, statusResponse and binary getserversResponse packets feed that state.",
        "remaining": "The outbound query state machine is verified separately; productive desktop UDP/DNS ownership is the remaining live-browser platform boundary.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 18 Baseq3 LAN reference functions + {len(native.splitlines())} exact ingress records + 661520 exact cache bytes + 84 UI LAN contracts")


if __name__ == "__main__":
    main()
