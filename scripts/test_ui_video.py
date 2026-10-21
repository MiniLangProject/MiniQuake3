"""Unchanged-C differential oracle and native contracts for ui_video.c."""
from pathlib import Path
import subprocess
import sys
import zipfile

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "DriverInfo_Cache", "DriverInfo_Event", "DriverInfo_MenuDraw",
    "GraphicsOptions_ApplyChanges", "GraphicsOptions_Cache",
    "GraphicsOptions_CheckConfig", "GraphicsOptions_Event",
    "GraphicsOptions_GetInitialVideo", "GraphicsOptions_MenuDraw",
    "GraphicsOptions_MenuInit", "GraphicsOptions_SetMenuItems",
    "GraphicsOptions_TQEvent", "GraphicsOptions_UpdateMenuItems",
    "UI_DriverInfo_Menu", "UI_GraphicsOptionsMenu",
]

ORACLE_FUNCTIONS = [
    "GraphicsOptions_GetInitialVideo", "GraphicsOptions_CheckConfig",
    "GraphicsOptions_UpdateMenuItems", "GraphicsOptions_ApplyChanges",
    "GraphicsOptions_TQEvent", "GraphicsOptions_SetMenuItems",
]

ASSETS = [
    "menu/art/frame2_l.tga", "menu/art/frame1_r.tga",
    "menu/art/back_0.tga", "menu/art/back_1.tga",
    "menu/art/accept_0.tga", "menu/art/accept_1.tga",
]


def build_minilang(source, output):
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )


def verify_assets(data_root):
    pak = Path(data_root) / "baseq3/pak0.pk3"
    if not pak.is_file():
        raise FileNotFoundError(f"retail pak0.pk3 missing: {pak}")
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
    missing = [name for name in ASSETS if name not in names]
    if missing:
        raise AssertionError(f"retail video-menu assets missing: {missing}")


def main():
    data_root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("D:/Quake3")
    output = ROOT / "build/reference/ui_video"
    output.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_video.c"
    (output / "ui_video_under_test.inc").write_text(
        extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n"
    )
    native_host = ROOT / "tests/reference/ui_video_oracle.c"
    native_exe = output / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/MT", "/W4", "/WX", "/wd4100", "/wd4244",
         "/D_CRT_SECURE_NO_WARNINGS", f"/I{output}", native_host,
         f"/Fe:{native_exe}", "/link", "/Brepro"],
        output, msvc_env("x86"), output / "oracle-build.log",
    )
    native = run([native_exe], output, log=output / "oracle.log")

    build_minilang("tests/ui_video_oracle.ml", "ui_video_oracle.exe")
    build_minilang("tests/ui_video_contracts.ml", "ui_video_contracts.exe")
    mini = run([ROOT / "build/ui_video_oracle.exe"], ROOT / "build", log=output / "minilang.log")
    assert native == mini, (native, mini)
    contracts = run([ROOT / "build/ui_video_contracts.exe"], ROOT / "build", log=output / "contracts.log")
    assert contracts.startswith("PASS:"), contracts

    module = ROOT / "src/mq3/client/ui_video.ml"
    module_text = module.read_text(encoding="utf-8")
    missing = [name for name in FUNCTIONS if f"// {name}" not in module_text]
    assert not missing, missing
    verify_assets(data_root)

    print("PASS: unchanged ui_video C decisions match MiniLang")
    print(contracts.strip())
    print(f"PASS: {len(FUNCTIONS)} ui_video symbols covered")
    print(f"PASS: {len(ASSETS)} retail video-menu assets verified")
    print(f"original_sha256={sha(source)}")
    print(f"minilang_sha256={sha(module)}")


if __name__ == "__main__":
    main()
