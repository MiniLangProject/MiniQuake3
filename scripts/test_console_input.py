#!/usr/bin/env python3
"""Differential and integration coverage for Baseq3 console/message editing."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def main() -> None:
    out=ROOT/"build/reference/console_input";out.mkdir(parents=True,exist_ok=True)
    original=ROOT/"Quake-III-Arena-original-source/code/client/cl_keys.c"
    extracted=extract(original,["Field_KeyDownEvent","Field_CharEvent","Key_WriteBindings"])
    (out/"console_input_under_test.inc").write_text(extracted,encoding="utf-8",newline="\n")
    harness=ROOT/"tests/reference/console_input_oracle.c";oracle=out/"oracle.exe"
    run(["cl","/nologo","/Od","/MT","/W3",f"/I{out}",harness,f"/Fe:{oracle}","/link","/Brepro"],out,msvc_env("x86"),out/"oracle-build.log")
    native=run([oracle],out,log=out/"oracle.log")
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/console_input_oracle.ml","--output","console_input_oracle.exe"],cwd=ROOT,check=True)
    mini=run([ROOT/"build/console_input_oracle.exe"],ROOT/"build",log=out/"minilang.log")
    if native!=mini: raise RuntimeError("console input mismatch\nC:\n"+native+"MiniLang:\n"+mini)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/console_input_contracts.ml","--output","console_input_contracts.exe"],cwd=ROOT,check=True)
    contracts=run([ROOT/"build/console_input_contracts.exe"],ROOT/"build",log=out/"contracts.log").strip()
    if contracts!="PASS: 22 console input/config contracts": raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/console_input_display_contracts.ml","--output","console_input_display_contracts.exe"],cwd=ROOT,check=True)
    display_contracts=run([ROOT/"build/console_input_display_contracts.exe"],ROOT/"build",log=out/"display-contracts.log").strip()
    if display_contracts!="PASS: 8 console display contracts": raise RuntimeError(display_contracts)
    match=(ROOT/"src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    for anchor in ["bindingConfig.install(","consoleInput.create(","function bindingConfigText(","function loadBindingConfig(","function clientTextKey(","function clientTextChar("]:
        if anchor not in match: raise RuntimeError("productive binding integration missing: "+anchor)
    preview=(ROOT/"src/mq3/client/qvm_preview_app.ml").read_text(encoding="utf-8");native_window=(ROOT/"native/playable_win32.c").read_text(encoding="utf-8")
    for anchor in ["window.INPUT_CHAR","match.toggleClientConsole(","match.clientTextKey(","consoleDisplay.draw("]:
        if anchor not in preview: raise RuntimeError("productive native text integration missing: "+anchor)
    for anchor in ["case WM_CHAR:","PLAYABLE_INPUT_CHAR"]:
        if anchor not in native_window: raise RuntimeError("Win32 character translation missing: "+anchor)
    files=[original,harness,ROOT/"native/playable_win32.c",ROOT/"src/mq3/platform/playable_window.ml",ROOT/"src/mq3/client/console_input.ml",ROOT/"src/mq3/client/console_input_display.ml",ROOT/"src/mq3/client/key_bindings_config.ml",ROOT/"src/mq3/client/qvm_preview_app.ml",ROOT/"src/mq3/engine/local_qvm_match.ml",ROOT/"tests/console_input_oracle.ml",ROOT/"tests/console_input_contracts.ml",ROOT/"tests/console_input_display_contracts.ml"]
    report={"passed":True,"records":len(native.splitlines()),"contracts":30,"function":"Field_CharEvent / Field_KeyDownEvent / Key_WriteBindings plus Console_Key, Message_Key and WM_CHAR contracts","scope":"Full field editing, console/message catcher dispatch, Win32 layout-resolved character events, visible retail-font input overlays, command/chat/tell submission, and binding cfg serialization in the productive Windows QVM path.","remaining":"Full scrolling console transcript and notify-line presentation remain in cl_console.c scope.","sources":{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/"result.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8",newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 console records + {report['contracts']} contracts")
if __name__=="__main__": main()
