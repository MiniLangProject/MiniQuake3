"""Exercise transport-neutral outbound Baseq3 server-browser requests."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> None:
    source = ROOT / "Quake-III-Arena-original-source/code/client/cl_main.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    required = ["CL_LocalServers_f", "CL_GlobalServers_f", "CL_Ping_f", "CL_UpdateVisiblePings_f", "CL_ServerStatus"]
    missing = [name for name in required if name not in text]
    if missing:
        raise RuntimeError("Baseq3 outbound LAN functions missing: " + ", ".join(missing))
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/ui_lan_queries_contracts.ml", "--output", "ui_lan_queries_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = run([ROOT / "build/ui_lan_queries_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 23 UI LAN outbound query contracts":
        raise RuntimeError(result)
    files = [source, ROOT / "src/mq3/client/ui_lan_queries.ml", ROOT / "tests/ui_lan_queries_contracts.ml"]
    report = {
        "passed": True,
        "reference_functions": len(required),
        "contracts": 23,
        "scope": "Baseq3-shaped IPv4 local discovery, master getservers, getinfo ping scheduling, visible-server queries and getstatus resend through a transport-neutral send/resolve boundary.",
        "remaining": "The productive desktop host still has to bind DNS and UDP services; legacy IPX discovery is intentionally absent.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/ui_lan_queries"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 5 Baseq3 outbound LAN reference functions + 23 contracts")


if __name__ == "__main__":
    main()
