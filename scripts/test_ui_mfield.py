"""Unchanged-C differential oracle and native contracts for ui_mfield.c."""
from pathlib import Path
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ["MField_CharEvent", "MField_Clear", "MField_Draw", "MField_KeyDownEvent", "MField_Paste", "MenuField_Draw", "MenuField_Init", "MenuField_Key"]

def build_minilang(source, output):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)

def main():
    output = ROOT / "build/reference/ui_mfield"; output.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_mfield.c"
    (output / "ui_mfield_under_test.inc").write_text(extract(source, FUNCTIONS), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_mfield_oracle.c"; exe = output / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/W4", "/WX", "/wd4100", "/wd4244", "/D_CRT_SECURE_NO_WARNINGS", f"/I{output}", host, f"/Fe:{exe}", "/link", "/Brepro"], output, msvc_env("x86"), output / "oracle-build.log")
    native = run([exe], output, log=output / "oracle.log")
    build_minilang("tests/ui_mfield_oracle.ml", "ui_mfield_oracle.exe"); build_minilang("tests/ui_mfield_contracts.ml", "ui_mfield_contracts.exe")
    mini = run([ROOT / "build/ui_mfield_oracle.exe"], ROOT / "build", log=output / "minilang.log"); assert native == mini, (native, mini)
    contracts = run([ROOT / "build/ui_mfield_contracts.exe"], ROOT / "build", log=output / "contracts.log"); assert contracts.startswith("PASS:"), contracts
    module = ROOT / "src/mq3/client/ui_mfield.ml"; text = module.read_text(encoding="utf-8"); missing=[name for name in FUNCTIONS if f"// {name}" not in text]; assert not missing, missing
    print("PASS: unchanged ui_mfield C decisions match MiniLang"); print(contracts.strip()); print(f"PASS: {len(FUNCTIONS)} ui_mfield symbols covered"); print(f"original_sha256={sha(source)}"); print(f"minilang_sha256={sha(module)}")

if __name__ == "__main__": main()
