"""Exercise the productive client ingress adapter over real localhost UDP."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    out = ROOT / "build/reference/client_network_ingress"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/client_network_ingress_contracts.ml",
         "--output", "client_network_ingress_contracts.exe"],
        cwd=ROOT, check=True,
    )
    value = run([ROOT / "build/client_network_ingress_contracts.exe"], ROOT / "build",
                log=out / "contracts.log").strip()
    expected = "PASS: 21 client network-ingress contracts"
    if value != expected:
        raise RuntimeError(value)
    sources = [
        ROOT / "src/mq3/client/network_ingress.ml",
        ROOT / "src/mq3/client/packet_event.ml",
        ROOT / "src/mq3/client/netchan.ml",
        ROOT / "src/mq3/client/protocol_runtime.ml",
        ROOT / "src/mq3/client/server_message.ml",
        ROOT / "src/mq3/qcommon/network_pump.ml",
        ROOT / "tests/client_network_ingress_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 21,
        "scope": "Real localhost UDP packets through NetworkPump, ClientPacketEvent, ClientNetchan and ProtocolRuntime/ServerMessage, including reliable-command ring synchronization, OOB dispatch and demo recording.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(value)


if __name__ == "__main__":
    main()
