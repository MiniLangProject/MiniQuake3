"""Unchanged-C vmMain dispatch oracle and native contracts for q3_ui/ui_main.c."""
import re
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS=["UI_RegisterCvars","UI_UpdateCvars","vmMain"]

def build_minilang(source,output):
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source",source,"--output",output],cwd=ROOT,check=True)

def source_cvars(source):
    text=source.read_text(encoding="utf-8");start=text.index("static cvarTable_t");end=text.index("// bk001129",start+1)
    return re.findall(r'\{\s*&\w+,\s*"([^"]+)",\s*"([^"]*)",\s*([^}]+)\}',text[start:end])

def main():
    output=ROOT/"build/reference/ui_main";output.mkdir(parents=True,exist_ok=True);source=ROOT/"Quake-III-Arena-original-source/code/q3_ui/ui_main.c"
    (output/"ui_main_under_test.inc").write_text(extract(source,["vmMain"]),encoding="utf-8",newline="\n")
    host=ROOT/"tests/reference/ui_main_oracle.c";exe=output/"oracle.exe";run(["cl","/nologo","/Od","/MT","/W4","/WX","/wd4100",f"/I{output}",host,f"/Fe:{exe}","/link","/Brepro"],output,msvc_env("x86"),output/"oracle-build.log");native=run([exe],output,log=output/"oracle.log")
    build_minilang("tests/ui_main_oracle.ml","ui_main_oracle.exe");build_minilang("tests/ui_main_contracts.ml","ui_main_contracts.exe");mini=run([ROOT/"build/ui_main_oracle.exe"],ROOT/"build",log=output/"minilang.log");assert native==mini,(native,mini);contracts=run([ROOT/"build/ui_main_contracts.exe"],ROOT/"build",log=output/"contracts.log");assert contracts.startswith("PASS:"),contracts
    module=ROOT/"src/mq3/client/ui_main.ml";text=module.read_text(encoding="utf-8");missing=[name for name in FUNCTIONS if f"// {name}" not in text];assert not missing,missing;cvars=source_cvars(source);assert len(cvars)==47,len(cvars);assert all((f'"{name}"' in text or name.startswith("server")) and f'"{default}"' in text for name,default,_ in cvars);assert 'for i=1 to 16' in text and '"server"+str(i)' in text
    print("PASS: unchanged q3_ui vmMain dispatch matches MiniLang");print(contracts.strip());print(f"PASS: {len(FUNCTIONS)} ui_main symbols and {len(cvars)} original cvars covered");print(f"original_sha256={sha(source)}");print(f"minilang_sha256={sha(module)}")

if __name__=="__main__":main()
