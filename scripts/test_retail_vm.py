"""Narrow asset-backed module ABI probes, explicitly not full module initialization."""
import json
import os
import subprocess
import sys
import argparse
from pathlib import Path
from toolchain import ROOT, run
from inventory import sha

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--qvm-root",type=Path,default=ROOT / "artifacts/reference/qvms")
    args=parser.parse_args()
    reference=ROOT / "build/reference/vm"
    oracle=reference / "vm_oracle.exe"
    label="cd" if args.qvm_root.resolve()==(ROOT / "artifacts/reference/qvms").resolve() else "rebuilt"
    output=reference / label
    output.mkdir(exist_ok=True)
    if not oracle.exists(): raise RuntimeError("Run scripts/test_vm.py first")
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/retail_vm_tests.ml","--output","retail_vm_tests.exe"],check=True)
    records=[]
    for name,command in (("qagame",1000),("cgame",1),("ui",0)):
        qvm=args.qvm_root.resolve() / (name+".qvm")
        expected=output / ("retail-"+name+".bin")
        env=os.environ.copy(); env["MQ3_VM_COMMAND"]=str(command)
        run([oracle,expected,qvm],output,env,output / ("retail-"+name+"-oracle.log"))
        result=run([ROOT / "build/retail_vm_tests.exe",qvm,str(command),expected],ROOT / "build",log=output / ("retail-"+name+".log"))
        print(result.strip())
        records.append({"module":name,"command":command,"passed":True,"qvm_sha256":sha(qvm)})
    (output / "result.json").write_text(json.dumps({"probes":records,"scope":"load and narrow ABI entry points only"},indent=2)+"\n")

if __name__ == "__main__":
    main()
