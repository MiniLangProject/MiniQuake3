"""Exercise the productive Winsock host for UI LAN discovery and queries."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    productive = ROOT / "src/mq3/engine/local_qvm_match.ml"
    host_text = productive.read_text(encoding="utf-8")
    required = [
        "uiLanUdp.open(context.uiLanIngress)",
        "uiLanQueries.updateVisiblePings(context.uiLanQueries,source)",
        "uiLanQueries.serverStatus(context.uiLanQueries,address)",
        "uiLanUdp.pump(value.context.uiLanUdp,64)",
        "uiLanUdp.close(value.context.uiLanUdp)",
    ]
    for anchor in required:
        if anchor not in host_text:
            raise RuntimeError(f"productive UI LAN UDP integration missing: {anchor}")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/ui_lan_udp_contracts.ml", "--output", "ui_lan_udp_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/ui_lan_udp_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 18 live UI LAN UDP contracts":
        raise RuntimeError(result)
    sources = [
        ROOT / "native/udp_win64.c",
        ROOT / "src/mq3/platform/udp.ml",
        ROOT / "src/mq3/qcommon/net_transport.ml",
        ROOT / "src/mq3/client/ui_lan_udp.ml",
        productive,
        ROOT / "tests/ui_lan_udp_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 18,
        "scope": "Productive Windows IPv4 DNS and dual nonblocking UDP host for UI LAN queries, including live getinfo/getstatus/master packets, bounded response pumping, broadcast discovery sends and local-QVM UI lifecycle wiring.",
        "boundary": "Two owned ephemeral sockets preserve Baseq3 NS_CLIENT/NS_SERVER selection. SO_BROADCAST is enabled explicitly; DNS is constrained to IPv4 datagram endpoints.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    out = ROOT / "build/reference/ui_lan_udp"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(result)


if __name__ == "__main__":
    main()
