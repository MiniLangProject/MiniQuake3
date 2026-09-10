"""Differential unchanged-Baseq3 and contract coverage for SV_UserMove."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    out = ROOT / "build/reference/server_user_move"
    out.mkdir(parents=True, exist_ok=True)
    server_source = ROOT / "Quake-III-Arena-original-source/code/server/sv_client.c"
    common_source = ROOT / "Quake-III-Arena-original-source/code/qcommon/common.c"
    (out / "server_user_move_under_test.inc").write_text(
        extract(server_source, ["SV_ClientThink", "SV_UserMove"]), encoding="utf-8", newline="\n"
    )
    (out / "hash_key_under_test.inc").write_text(
        extract(common_source, ["Com_HashKey"]), encoding="utf-8", newline="\n"
    )
    harness = ROOT / "tests/reference/server_user_move_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness,
         f"/Fe:{oracle}", "/link", "/Brepro"],
        out, msvc_env("x86"), out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/server_user_move_oracle.ml",
         "--output", "server_user_move_oracle.exe"], cwd=ROOT, check=True
    )
    mini = run([ROOT / "build/server_user_move_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("SV_UserMove mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/server_user_move_contracts.ml",
         "--output", "server_user_move_contracts.exe"], cwd=ROOT, check=True
    )
    value = run([ROOT / "build/server_user_move_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if value != "PASS: 30 server user-move contracts":
        raise RuntimeError(value)
    files = [server_source, common_source, harness, ROOT / "tests/server_user_move_oracle.ml",
             ROOT / "src/mq3/server/user_move.ml", ROOT / "tests/server_user_move_contracts.ml"]
    report = {
        "passed": True,
        "records": len(native.splitlines()),
        "contracts": 30,
        "functions": ["SV_UserMove", "SV_ClientThink", "Com_HashKey"],
        "scope": "Delta/full snapshot selection, command-count limits, checksum/message/reliable-command key, keyed usercmd decoding, frame acknowledgement time, pure authentication gates, primed world entry, drop/inactive handling, duplicate/map-restart ordering and post-kick lastUsercmd timing.",
        "oracle": "Unchanged extracted Baseq3 SV_UserMove, SV_ClientThink and Com_HashKey bodies with deterministic engine callbacks and scripted decoded commands; MiniLang contracts additionally drive the real protocol-68 keyed usercmd bitstream.",
        "remaining": "Game VM and live packet-loop callbacks are host integration boundaries.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 server user-move records + 30 contracts")


if __name__ == "__main__":
    main()
