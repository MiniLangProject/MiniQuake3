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
    match=(ROOT/"src/mq3/engine/local_qvm_match.ml").read_text(encoding="utf-8")
    for anchor in ["bindingConfig.install(","consoleInput.create(","function bindingConfigText(","function loadBindingConfig(","function clientTextKey(","function clientTextChar("]:
        if anchor not in match: raise RuntimeError("productive binding integration missing: "+anchor)
    files=[original,harness,ROOT/"src/mq3/client/console_input.ml",ROOT/"src/mq3/client/key_bindings_config.ml",ROOT/"src/mq3/engine/local_qvm_match.ml",ROOT/"tests/console_input_oracle.ml",ROOT/"tests/console_input_contracts.ml"]
    report={"passed":True,"records":len(native.splitlines()),"contracts":22,"function":"Field_CharEvent / Field_KeyDownEvent / Key_WriteBindings plus Console_Key and Message_Key contracts","scope":"Full 256-byte field editor, history and scroll controls, console command/chat submission, message/tell submission, and bind/unbind/config serialization in the productive command registry.","remaining":"Native character generation and visible console rendering are separate presentation/platform work.","sources":{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/"result.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8",newline="\n")
    print(f"PASS: {report['records']} exact Baseq3 console records + {report['contracts']} contracts")
if __name__=="__main__": main()
