#!/usr/bin/env python3
"""Complete bg_lib.h, bg_local.h and g_rankings.h ownership gate."""
import json
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


def build(source, output):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def exported(text, function):
    match = re.search(r"function\s+" + re.escape(function) + r"\(\)\s+return\s+\[(.*?)\]\s+end function", text, re.S)
    if not match:
        raise RuntimeError(f"missing {function}")
    return re.findall(r'"([A-Za-z_][A-Za-z0-9_]*)"', match.group(1))


def main():
    source = ROOT / "Quake-III-Arena-original-source/code/game"
    facade = ROOT / "src/mq3/game/game_internal_headers.ml"
    text = facade.read_text(encoding="utf-8")
    lib = (source / "bg_lib.h").read_text(encoding="latin1")
    local = (source / "bg_local.h").read_text(encoding="latin1")
    rankings = (source / "g_rankings.h").read_text(encoding="latin1")
    inventories = {
        "lib_macros": exported(text, "bgLibMacroNames"),
        "lib_types": exported(text, "bgLibTypeNames"),
        "lib_functions": exported(text, "bgLibFunctionNames"),
        "local_constants": exported(text, "bgLocalConstantNames"),
        "pml_fields": exported(text, "pmlFieldNames"),
        "local_functions": exported(text, "bgLocalFunctionNames"),
        "local_globals": exported(text, "bgLocalGlobalNames"),
        "ranking_keys": exported(text, "rankingKeyNames"),
    }
    expected = {"lib_macros":17,"lib_types":3,"lib_functions":31,"local_constants":6,"pml_fields":12,"local_functions":5,"local_globals":14,"ranking_keys":257}
    counts = {key:len(value) for key,value in inventories.items()}
    if counts != expected:
        raise RuntimeError(f"header inventory drift: {counts}")
    for name in inventories["lib_macros"] + inventories["lib_types"] + inventories["lib_functions"]:
        if not re.search(r"\b" + re.escape(name) + r"\b", lib): raise RuntimeError(f"bg_lib.h missing {name}")
    for name in inventories["local_constants"] + inventories["pml_fields"] + inventories["local_functions"] + inventories["local_globals"]:
        if not re.search(r"\b" + re.escape(name) + r"\b", local): raise RuntimeError(f"bg_local.h missing {name}")
    original_keys = re.findall(r"^\s*#define\s+(QGR_KEY_[A-Z0-9_]+)\s+[0-9]+\s*$", rankings, re.M)
    if original_keys != inventories["ranking_keys"]:
        raise RuntimeError("g_rankings.h key inventory/order mismatch")
    consumers = {
        "src/mq3/game/pmove.ml":"internal.TIMER_LAND",
        "src/mq3/game/movement.ml":"internal.STEPSIZE",
        "src/mq3/game/arenas.ml":"internal.TIMER_GESTURE",
        "src/mq3/game/rankings.ml":"internal.QGR_KEY_MATCH_RATING",
    }
    for relative, marker in consumers.items():
        if marker not in (ROOT / relative).read_text(encoding="utf-8"):
            raise RuntimeError(f"productive consumer missing {marker}: {relative}")

    out = ROOT / "build/reference/game_internal_headers"
    out.mkdir(parents=True, exist_ok=True)
    exe = out / "game_internal_headers_oracle.exe"
    run(["cl","/nologo","/Od","/MT","/W4","/WX",ROOT / "tests/reference/game_internal_headers_oracle.c",f"/Fe:{exe}","/link","/Brepro"], ROOT, msvc_env("x86"), out / "oracle-build.log")
    c_output = run([exe], out, log=out / "oracle.log").replace("\r\n","\n")
    ml_output = run([build("tests/game_internal_headers_oracle.ml","game_internal_headers_oracle.exe")], ROOT / "build", log=out / "minilang.log").replace("\r\n","\n")
    if c_output != ml_output:
        (out / "expected.txt").write_text(c_output, encoding="utf-8")
        (out / "actual.txt").write_text(ml_output, encoding="utf-8")
        raise RuntimeError("game internal header unchanged-C mismatch")
    contracts = run([build("tests/game_internal_headers_contracts.ml","game_internal_headers_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 16 game internal header contracts": raise RuntimeError(contracts)
    files = [source / name for name in ("bg_lib.h","bg_local.h","g_rankings.h")] + [facade,ROOT / "tests/reference/game_internal_headers_oracle.c",ROOT / "tests/game_internal_headers_oracle.ml",ROOT / "tests/game_internal_headers_contracts.ml"]
    result={"passed":True,"headers":3,"inventory":counts,"exact_records":len(c_output.splitlines()),"contracts":16,"sources":{str(path.relative_to(ROOT)).replace("\\","/"):sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result,indent=2)+"\n",encoding="utf-8",newline="\n")
    print("PASS: bg_lib.h + bg_local.h + g_rankings.h / 17 macros + 3 types + 36 declarations + 14 globals + 269 fields/keys + EC + 16 contracts")


if __name__ == "__main__": main()
