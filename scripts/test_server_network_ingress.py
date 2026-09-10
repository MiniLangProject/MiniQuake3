"""Exercise the productive server ingress adapter over real localhost UDP."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    out = ROOT / "build/reference/server_network_ingress"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/server_network_ingress_contracts.ml",
         "--output", "server_network_ingress_contracts.exe"],
        cwd=ROOT, check=True,
    )
    value = run([ROOT / "build/server_network_ingress_contracts.exe"], ROOT / "build",
                log=out / "contracts.log").strip()
    expected = "PASS: 19 server network-ingress contracts"
    if value != expected:
        raise RuntimeError(value)
    sources = [
        ROOT / "src/mq3/server/network_ingress.ml",
        ROOT / "src/mq3/server/packet_event.ml",
        ROOT / "src/mq3/server/netchan.ml",
        ROOT / "src/mq3/server/client_message.ml",
        ROOT / "src/mq3/qcommon/network_pump.ml",
        ROOT / "tests/server_network_ingress_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 19,
        "scope": "Real localhost UDP sequenced packets through NetworkPump, ServerPacketEvent, ServerNetchan and ServerClientMessage to EOF and injected client-command/move callbacks.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(value)


if __name__ == "__main__":
    main()
