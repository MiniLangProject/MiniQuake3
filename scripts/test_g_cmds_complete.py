"""Complete g_cmds.c facade, raw QAGame dispatch, C differential and Retail probe."""
import argparse
import json
import py_compile
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, run


DIFFERENTIAL_CASES = [
    "router_empty_unknown_and_case",
    "chat_voice_recipient_filters_game_4",
    "cheat_toggle_flags_and_noclip",
    "router_team_follow_and_score_sequence",
    "router_teamvote_two_sides_and_argv_name_join",
]


def retail_assets(data_root: Path, out: Path):
    archives = sorted((data_root / "baseq3").glob("*.pk3"))
    qvm = None
    bsp = None
    bsp_path = out / "q3dm1.bsp"
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            if qvm is None and "vm/qagame.qvm" in names:
                qvm = archive.read(names["vm/qagame.qvm"])
            if bsp is None and "maps/q3dm1.bsp" in names:
                bsp = archive.read(names["maps/q3dm1.bsp"])
    if qvm is None or bsp is None:
        raise RuntimeError("Retail qagame.qvm or maps/q3dm1.bsp missing")
    bsp_path.write_bytes(bsp)
    return archives, qvm, bsp_path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, default=Path("D:/Quake3"))
    parser.add_argument("--skip-differential", action="store_true")
    args = parser.parse_args()
    py_compile.compile(__file__, doraise=True)
    out = ROOT / "build/reference/g_cmds_complete"
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(item for item in ledger["files"] if item["source"] == "code/game/g_cmds.c")
    module = ROOT / "src/mq3/game/g_cmds.ml"
    text = module.read_text(encoding="utf-8")
    missing = [name for name in entry["symbol_candidates"]
               if not re.search(r"(?m)^function\s+" + re.escape(name) + r"\s*\(", text)]
    if missing:
        raise RuntimeError("g_cmds symbols missing: " + ", ".join(missing))
    for anchor in ("ClientCommandText", "ClientCommandState", "commands.tokenizeString", "dispatch.command"):
        if anchor not in text:
            raise RuntimeError("missing productive QAGame bridge: " + anchor)

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/g_cmds_complete_contracts.ml", "--output",
                    "g_cmds_complete_contracts.exe"], cwd=ROOT, check=True)
    synthetic = out / "empty.bsp"
    synthetic.write_bytes(tiny_bsp())
    contract_exe = ROOT / "build/g_cmds_complete_contracts.exe"
    contract = run([contract_exe, synthetic], ROOT / "build", log=out / "contracts.log").strip()
    if contract != "PASS: 11 g_cmds complete contracts":
        raise RuntimeError(contract)

    archives, qvm, retail_bsp = retail_assets(args.data_root, out)
    retail = run([contract_exe, retail_bsp], ROOT / "build", log=out / "retail.log").strip()
    if retail != contract:
        raise RuntimeError(retail)

    differential = []
    if not args.skip_differential:
        for index, name in enumerate(DIFFERENTIAL_CASES):
            command = [sys.executable, ROOT / "scripts/test_client_commands.py", "--case", name]
            if index:
                command.append("--reuse-build")
            output = run(command, ROOT, log=out / f"differential-{index}.log", timeout=900)
            if "PASS:" not in output:
                raise RuntimeError(output)
            differential.append(output.strip().splitlines()[-1])

    original = ROOT / "Quake-III-Arena-original-source/code/game/g_cmds.c"
    sources = [original, module, ROOT / "src/mq3/game/client_commands.ml",
               ROOT / "src/mq3/game/chat_commands.ml", ROOT / "src/mq3/game/utility_commands.ml",
               ROOT / "tests/g_cmds_complete_contracts.ml"]
    result = {
        "passed": True,
        "symbols": len(entry["symbol_candidates"]),
        "contracts": 11,
        "retail_contracts": 11,
        "differential_cases": differential,
        "retail_qagame_bytes": len(qvm),
        "retail_qagame_sha256": __import__("hashlib").sha256(qvm).hexdigest(),
        "retail_map_sha256": sha(retail_bsp),
        "retail_archives": {path.name: sha(path) for path in archives},
        "scope": "All g_cmds.c symbols through the production game kernels, plus raw reliable-command tokenization into ClientCommand. Representative dispatcher families compare unchanged Baseq3 C; contracts run on synthetic and Retail q3dm1 BSPs with Retail qagame.qvm present.",
        "sources": {path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    suffix = f" + {len(differential)} unchanged-C scenarios" if differential else ""
    print(f"PASS: {result['symbols']}/37 g_cmds symbols + 11 native + 11 Retail contracts{suffix}")


if __name__ == "__main__":
    main()
