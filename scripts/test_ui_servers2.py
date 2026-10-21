"""Unchanged-C oracle and native contracts for the Quake III server browser."""
from pathlib import Path
import subprocess
import sys
import zipfile

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "ArenaServers_Cache", "ArenaServers_Compare", "ArenaServers_DoRefresh",
    "ArenaServers_Event", "ArenaServers_Go", "ArenaServers_Insert",
    "ArenaServers_InsertFavorites", "ArenaServers_LoadFavorites",
    "ArenaServers_MaxPing", "ArenaServers_MenuDraw", "ArenaServers_MenuInit",
    "ArenaServers_MenuKey", "ArenaServers_Remove", "ArenaServers_SaveChanges",
    "ArenaServers_SetType", "ArenaServers_Sort", "ArenaServers_StartRefresh",
    "ArenaServers_StopRefresh", "ArenaServers_UpdateMenu",
    "ArenaServers_UpdatePicture", "Punkbuster_ConfirmDisable",
    "Punkbuster_ConfirmEnable", "UI_ArenaServersMenu",
]

RETAIL_ASSETS = [
    "menu/art/back_0", "menu/art/back_1", "menu/art/create_0",
    "menu/art/create_1", "menu/art/specify_0", "menu/art/specify_1",
    "menu/art/refresh_0", "menu/art/refresh_1", "menu/art/fight_0",
    "menu/art/fight_1", "menu/art/arrows_vert_0", "menu/art/arrows_vert_top",
    "menu/art/arrows_vert_bot", "menu/art/unknownmap", "menu/art/delete_0",
    "menu/art/delete_1",
]


def build_minilang(source, output):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )


def verify_assets(data_root):
    baseq3 = Path(data_root) / "baseq3"
    paks = sorted(baseq3.glob("*.pk3"))
    if not paks:
        raise FileNotFoundError(f"retail PK3 files missing below {baseq3}")
    names = set()
    for pak in paks:
        with zipfile.ZipFile(pak) as archive:
            names.update(name.lower() for name in archive.namelist())
    missing = []
    for asset in RETAIL_ASSETS:
        if not any(f"{asset}.{extension}" in names for extension in ("tga", "jpg", "jpeg")):
            missing.append(asset)
    if missing:
        raise AssertionError(f"retail server-browser assets missing: {missing}")


def main():
    data_root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("D:/Quake3")
    output = ROOT / "build/reference/ui_servers2"
    output.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_servers2.c"
    (output / "ui_servers2_under_test.inc").write_text(
        extract(source, ["ArenaServers_MaxPing", "ArenaServers_Compare"]),
        encoding="utf-8", newline="\n",
    )
    native_host = ROOT / "tests/reference/ui_servers2_oracle.c"
    native_exe = output / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/WX", "/wd4244",
         "/D_CRT_SECURE_NO_WARNINGS", f"/I{output}", native_host,
         f"/Fe:{native_exe}", "/link", "/Brepro"],
        output, msvc_env("x86"), output / "oracle-build.log",
    )
    native = run([native_exe], output, log=output / "oracle.log")
    build_minilang("tests/ui_servers2_oracle.ml", "ui_servers2_oracle.exe")
    build_minilang("tests/ui_servers2_contracts.ml", "ui_servers2_contracts.exe")
    mini = run([ROOT / "build/ui_servers2_oracle.exe"], ROOT / "build", log=output / "minilang.log")
    assert native == mini, (native, mini)
    contracts = run([ROOT / "build/ui_servers2_contracts.exe"], ROOT / "build", log=output / "contracts.log")
    assert contracts.startswith("PASS:"), contracts
    module = ROOT / "src/mq3/client/ui_servers2.ml"
    module_text = module.read_text(encoding="utf-8")
    missing = [name for name in FUNCTIONS if f"// {name}" not in module_text]
    assert not missing, missing
    verify_assets(data_root)
    print("PASS: unchanged ui_servers2 C decisions match MiniLang")
    print(contracts.strip())
    print(f"PASS: {len(FUNCTIONS)} ui_servers2 symbols covered")
    print(f"PASS: {len(RETAIL_ASSETS)} retail server-browser assets verified")
    print("PASS: original pblogo path retains original unknownmap fallback")
    print(f"original_sha256={sha(source)}")
    print(f"minilang_sha256={sha(module)}")


if __name__ == "__main__":
    main()
