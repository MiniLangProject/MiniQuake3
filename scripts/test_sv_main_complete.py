"""Complete sv_main.c native parity and productive localhost OOB gate."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SOURCE = ROOT / "Quake-III-Arena-original-source/code/server/sv_main.c"
UNCOVERED = [
    "SV_ExpandNewlines", "SV_ReplacePendingServerCommands", "SV_AddServerCommand",
    "SV_SendServerCommand", "SV_MasterHeartbeat", "SV_MasterShutdown", "SVC_Status",
    "SVC_Info", "SV_FlushRedirect", "SVC_RemoteCommand",
]
ALL = UNCOVERED + [
    "SV_ConnectionlessPacket", "SV_PacketEvent", "SV_CalcPings", "SV_CheckTimeouts",
    "SV_CheckPaused", "SV_Frame",
]
COMPONENT_GATES = [
    ("test_connectionless.py", "connectionless"),
    ("test_server_packet_event.py", "server_packet_event"),
    ("test_server_client_pings.py", "server_client_pings"),
    ("test_server_timeouts.py", "server_timeouts"),
    ("test_server_pause.py", "server_pause"),
    ("test_server_frame.py", "server_frame"),
]


def main():
    out = ROOT / "build/reference/sv_main_complete"
    out.mkdir(parents=True, exist_ok=True)
    text = SOURCE.read_text(encoding="utf-8", errors="replace")
    missing = [name for name in ALL if name not in text]
    if missing:
        raise RuntimeError("missing sv_main.c symbols: " + ", ".join(missing))
    (out / "sv_main_under_test.inc").write_text(extract(SOURCE, UNCOVERED), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/sv_main_complete_oracle.c"
    exe = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/DWIN32", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{out}", harness, f"/Fe:{exe}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([exe], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_main_complete_oracle.ml",
                    "--output", "sv_main_complete_oracle.exe"], cwd=ROOT, check=True)
    ported = run([ROOT / "build/sv_main_complete_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != ported:
        left, right = native.splitlines(), ported.splitlines()
        for index in range(max(len(left), len(right))):
            a = left[index] if index < len(left) else "<missing>"
            b = right[index] if index < len(right) else "<missing>"
            if a != b:
                raise RuntimeError(f"sv_main mismatch record {index+1}\nC: {a}\nM: {b}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_main_complete_contracts.ml",
                    "--output", "sv_main_complete_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/sv_main_complete_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 30 sv_main complete contracts":
        raise RuntimeError(contracts)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/sv_main_productive_probe.ml",
                    "--output", "sv_main_productive_probe.exe"], cwd=ROOT, check=True)
    productive = run([ROOT / "build/sv_main_productive_probe.exe"], ROOT / "build", log=out / "productive.log").strip()
    if productive != "PASS: 8 productive sv_main localhost UDP contracts":
        raise RuntimeError(productive)
    established_records = 0
    established_contracts = 0
    for gate, result_dir in COMPONENT_GATES:
        subprocess.run([sys.executable, ROOT / "scripts" / gate], cwd=ROOT, check=True)
        component = json.loads((ROOT / "build/reference" / result_dir / "result.json").read_text(encoding="utf-8"))
        if not component.get("passed"):
            raise RuntimeError(f"failed established sv_main gate: {gate}")
        established_records += component["records"]
        established_contracts += component["contracts"]
    files = [SOURCE, harness, ROOT / "src/mq3/server/main_runtime.ml",
             ROOT / "tests/sv_main_complete_oracle.ml", ROOT / "tests/sv_main_complete_contracts.ml",
             ROOT / "tests/sv_main_productive_probe.ml"]
    report = {
        "passed": True, "symbols": len(ALL), "unchanged_c_records": len(native.splitlines()) + established_records,
        "native_contracts": 30 + established_contracts, "productive_contracts": 8,
        "scope": "All 16 sv_main.c functions: ten previously open command/master/query/rcon bodies plus the established exact connectionless, packet, ping, timeout, pause and frame ports. Productive getinfo/getstatus/rcon traverse localhost Winsock UDP, ServerNetworkIngress, SV_PacketEvent and the native connectionless dispatcher.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(ALL)}/{len(ALL)} sv_main symbols + {report['unchanged_c_records']} unchanged-C records + {report['native_contracts']} native + 8 productive contracts")


if __name__ == "__main__":
    main()
