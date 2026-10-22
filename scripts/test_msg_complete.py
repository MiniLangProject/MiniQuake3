"""Full qcommon/msg.c symbol, differential, contract and retail gate."""
from __future__ import annotations

import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


SYMBOLS = [
    "MSG_BeginReading", "MSG_BeginReadingOOB", "MSG_Bitstream", "MSG_Clear",
    "MSG_Copy", "MSG_Init", "MSG_InitOOB", "MSG_NUinitHuffman",
    "MSG_ReadAngle16", "MSG_ReadBigString", "MSG_ReadBits", "MSG_ReadByte",
    "MSG_ReadChar", "MSG_ReadData", "MSG_ReadDelta", "MSG_ReadDeltaEntity",
    "MSG_ReadDeltaFloat", "MSG_ReadDeltaKey", "MSG_ReadDeltaKeyFloat",
    "MSG_ReadDeltaPlayerstate", "MSG_ReadDeltaUsercmd", "MSG_ReadDeltaUsercmdKey",
    "MSG_ReadFloat", "MSG_ReadLong", "MSG_ReadShort", "MSG_ReadString",
    "MSG_ReadStringLine", "MSG_ReportChangeVectors_f", "MSG_WriteAngle",
    "MSG_WriteAngle16", "MSG_WriteBigString", "MSG_WriteBits", "MSG_WriteByte",
    "MSG_WriteChar", "MSG_WriteData", "MSG_WriteDelta", "MSG_WriteDeltaEntity",
    "MSG_WriteDeltaFloat", "MSG_WriteDeltaKey", "MSG_WriteDeltaKeyFloat",
    "MSG_WriteDeltaPlayerstate", "MSG_WriteDeltaUsercmd", "MSG_WriteDeltaUsercmdKey",
    "MSG_WriteFloat", "MSG_WriteLong", "MSG_WriteShort", "MSG_WriteString",
    "MSG_initHuffman",
]


def mini(source: str, output: str, *args: str) -> str:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return run([ROOT / "build" / output, *args], ROOT / "build")


def existing(script: str) -> str:
    completed = subprocess.run(
        [sys.executable, ROOT / "scripts" / script], cwd=ROOT,
        check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    )
    print(completed.stdout, end="")
    return completed.stdout


def number(pattern: str, text: str) -> int:
    match = re.search(pattern, text)
    if not match:
        raise RuntimeError("missing test count: " + pattern)
    return int(match.group(1))


def main() -> None:
    original = ROOT / "Quake-III-Arena-original-source/code/qcommon/msg.c"
    module = ROOT / "src/mq3/qcommon/msg.ml"
    source = module.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if f"function {name}(" not in source]
    if missing or len(SYMBOLS) != 48 or len(set(SYMBOLS)) != 48:
        raise RuntimeError("msg.c symbol coverage mismatch: " + ", ".join(missing))

    out = ROOT / "build/reference/msg_complete"
    out.mkdir(parents=True, exist_ok=True)
    (out / "msg_complete_under_test.inc").write_text(
        extract(original, ["MSG_ReportChangeVectors_f"]), encoding="utf-8", newline="\n"
    )
    harness = ROOT / "tests/reference/msg_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    report_c = run([oracle], out, log=out / "oracle.log")
    report_ml = mini("tests/msg_complete_oracle.ml", "msg_complete_oracle.exe")
    if report_c != report_ml:
        raise RuntimeError("MSG_ReportChangeVectors_f mismatch\nC:\n" + report_c + "MiniLang:\n" + report_ml)

    contracts = mini("tests/msg_complete_contracts.ml", "msg_complete_contracts.exe").strip()
    if contracts != "PASS: 23 complete msg contracts":
        raise RuntimeError(contracts)
    retail = mini("tests/msg_retail_probe.ml", "msg_retail_probe.exe", "D:/Quake3").strip()
    if not retail.startswith("PASS: retail cgame.qvm "):
        raise RuntimeError(retail)

    primitive = existing("test_message.py")
    huffman = existing("test_huffman_message.py")
    scalar = existing("test_message_delta.py")
    state = existing("test_message_state_delta.py")
    exact_records = (
        number(r"PASS: (\d+) exact Baseq3 msg\.c", primitive)
        + number(r"PASS: (\d+) exact Baseq3 Huffman/message records", huffman)
        + number(r"PASS: (\d+) exact Baseq3 message-delta", scalar)
        + number(r"PASS: (\d+) exact Baseq3 entity/player delta", state)
        + len(report_c.splitlines())
    )
    inherited_contracts = (
        number(r"\+ (\d+) contracts", primitive)
        + number(r"\+ (\d+) contracts", huffman)
        + number(r"\+ (\d+) contracts", scalar)
        + number(r"\+ (\d+) contracts", state)
    )
    files = [
        original, module, harness, ROOT / "tests/msg_complete_oracle.ml",
        ROOT / "tests/msg_complete_contracts.ml", ROOT / "tests/msg_retail_probe.ml",
    ]
    result = {
        "passed": True,
        "symbols": 48,
        "unchanged_c_records": exact_records,
        "native_contracts": 23,
        "inherited_contracts": inherited_contracts,
        "retail": retail,
        "scope": "Complete msg.c facade over protocol-68 primitive/Huffman, scalar/key/usercmd delta, entity/playerstate delta and diagnostics paths.",
        "memory_boundary": "MiniLang messages own bounded byte arrays and immutable pretrained Huffman trees instead of exposing C pointer aliasing or process-global mutable msgHuff storage.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: 48 msg.c symbols + {exact_records} unchanged-C records + {23 + inherited_contracts} contracts + retail probe")


if __name__ == "__main__":
    main()
