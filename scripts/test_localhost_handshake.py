"""Run a real UDP protocol-68 getchallenge/connect/Netchan handshake."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    out = ROOT / "build/reference/localhost_handshake"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/localhost_handshake_contracts.ml",
         "--output", "localhost_handshake_contracts.exe"],
        cwd=ROOT, check=True,
    )
    value = run([ROOT / "build/localhost_handshake_contracts.exe"], ROOT / "build",
                log=out / "contracts.log").strip()
    expected = "PASS: 20 localhost protocol-68 handshake contracts"
    if value != expected:
        raise RuntimeError(value)
    sources = [
        ROOT / "src/mq3/platform/udp.ml",
        ROOT / "src/mq3/qcommon/net_transport.ml",
        ROOT / "src/mq3/qcommon/huffman.ml",
        ROOT / "src/mq3/qcommon/netchan.ml",
        ROOT / "src/mq3/client/connectionless.ml",
        ROOT / "src/mq3/client/netchan.ml",
        ROOT / "src/mq3/server/connectionless.ml",
        ROOT / "src/mq3/server/oob_connect.ml",
        ROOT / "src/mq3/server/netchan.ml",
        ROOT / "tests/localhost_handshake_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 20,
        "scope": "Real localhost UDP getchallenge, challengeResponse, Huffman-offset-12 connect, connectResponse and first client-to-server sequenced Netchan packet.",
        "transport": "Two nonblocking Winsock UDP sockets bound to independent ephemeral 127.0.0.1 ports.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in sources},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(value)


if __name__ == "__main__":
    main()
