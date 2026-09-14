#!/usr/bin/env python3
import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()

    original = (ROOT / "Quake-III-Arena-original-source/code/botlib/be_ai_weap.c").read_text(encoding="latin-1")
    for anchor in (
        "int BotChooseBestFightWeapon(int weaponstate, int *inventory)",
        "weight = FuzzyWeight(inventory, ws->weaponweightconfig, index);",
        "if (weight > bestweight)",
        "void BotGetWeaponInfo(int weaponstate, int weapon, weaponinfo_t *weaponinfo)",
        "Com_Memcpy(weaponinfo, &weaponconfig->weaponinfo[weapon], sizeof(weaponinfo_t));",
    ):
        if anchor not in original:
            raise SystemExit("FAIL: missing original weapon AI anchor: " + anchor)
    server = (ROOT / "Quake-III-Arena-original-source/code/server/sv_game.c").read_text(encoding="latin-1")
    for anchor in (
        "case BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON:",
        "return botlib_export->ai.BotChooseBestFightWeapon( args[1], VMA(2) );",
        "case BOTLIB_AI_GET_WEAPON_INFO:",
        "botlib_export->ai.BotGetWeaponInfo( args[1], args[2], VMA(3) );",
    ):
        if anchor not in server:
            raise SystemExit("FAIL: missing sv_game.c weapon ABI anchor: " + anchor)

    out = ROOT / "build/reference/ai_weapon_combat"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "ai_weapon_combat_oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", ROOT / "tests/reference/ai_weapon_combat_oracle.c", f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    native_result = run([native], out).strip()
    if native_result != "PASS: 15 native weapon-combat ABI observations":
        raise SystemExit(native_result)

    contract = run([build("tests/ai_weapon_combat_contracts.ml", "ai_weapon_combat_contracts.exe")], ROOT / "build").strip()
    if contract != "PASS: 17 AI weapon-combat contracts":
        raise SystemExit(contract)
    print(native_result)
    print(contract)

    if args.pak:
        retail = run([build("tests/ai_weapon_combat_retail_probe.ml", "ai_weapon_combat_retail_probe.exe"), args.pak.resolve()], ROOT / "build").strip()
        if retail != "PASS: retail Sarge weapon combat checks=8 best=3 abi=552":
            raise SystemExit(retail)
        print(retail)


if __name__ == "__main__":
    main()
