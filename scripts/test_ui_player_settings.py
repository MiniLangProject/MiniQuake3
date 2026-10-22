"""Unchanged-C differential oracle and native contracts for ui_playersettings.c."""
from pathlib import Path
import subprocess
import sys
import zipfile

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ["PlayerSettings_Cache", "PlayerSettings_DrawEffects", "PlayerSettings_DrawHandicap", "PlayerSettings_DrawName", "PlayerSettings_DrawPlayer", "PlayerSettings_MenuEvent", "PlayerSettings_MenuInit", "PlayerSettings_MenuKey", "PlayerSettings_SaveChanges", "PlayerSettings_SetMenuItems", "UI_PlayerSettingsMenu"]
ORACLE_FUNCTIONS = ["PlayerSettings_SaveChanges", "PlayerSettings_MenuKey", "PlayerSettings_SetMenuItems", "PlayerSettings_MenuEvent"]
ASSETS = [f"menu/art/{name}.tga" for name in ["frame2_l","frame1_r","model_0","model_1","back_0","back_1","fx_base","fx_red","fx_yel","fx_grn","fx_teal","fx_blue","fx_cyan","fx_white"]]

def build_minilang(source, output):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)

def verify_assets(data_root):
    pak=Path(data_root)/"baseq3/pak0.pk3"
    if not pak.is_file(): raise FileNotFoundError(f"retail pak0.pk3 missing: {pak}")
    with zipfile.ZipFile(pak) as archive: names={name.lower() for name in archive.namelist()}
    missing=[name for name in ASSETS if name not in names]
    if missing: raise AssertionError(f"retail player-settings assets missing: {missing}")

def main():
    data_root=Path(sys.argv[1]) if len(sys.argv)>1 else Path("D:/Quake3")
    output=ROOT/"build/reference/ui_player_settings";output.mkdir(parents=True,exist_ok=True)
    source=ROOT/"Quake-III-Arena-original-source/code/q3_ui/ui_playersettings.c"
    (output/"ui_player_settings_under_test.inc").write_text(extract(source,ORACLE_FUNCTIONS),encoding="utf-8",newline="\n")
    host=ROOT/"tests/reference/ui_player_settings_oracle.c";exe=output/"oracle.exe"
    run(["cl","/nologo","/Od","/MT","/W4","/WX","/wd4100","/wd4244","/D_CRT_SECURE_NO_WARNINGS",f"/I{output}",host,f"/Fe:{exe}","/link","/Brepro"],output,msvc_env("x86"),output/"oracle-build.log")
    native=run([exe],output,log=output/"oracle.log")
    build_minilang("tests/ui_player_settings_oracle.ml","ui_player_settings_oracle.exe");build_minilang("tests/ui_player_settings_contracts.ml","ui_player_settings_contracts.exe")
    mini=run([ROOT/"build/ui_player_settings_oracle.exe"],ROOT/"build",log=output/"minilang.log");assert native==mini,(native,mini)
    contracts=run([ROOT/"build/ui_player_settings_contracts.exe"],ROOT/"build",log=output/"contracts.log");assert contracts.startswith("PASS:"),contracts
    module=ROOT/"src/mq3/client/ui_player_settings.ml";text=module.read_text(encoding="utf-8");missing=[name for name in FUNCTIONS if f"// {name}" not in text];assert not missing,missing;verify_assets(data_root)
    print("PASS: unchanged ui_playersettings C decisions match MiniLang");print(contracts.strip());print(f"PASS: {len(FUNCTIONS)} ui_playersettings symbols covered");print(f"PASS: {len(ASSETS)} retail player-settings assets verified");print(f"original_sha256={sha(source)}");print(f"minilang_sha256={sha(module)}")

if __name__=="__main__": main()
