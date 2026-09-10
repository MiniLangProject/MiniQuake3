"""Verify named QVM lifecycle around the exact interpreter."""
import struct
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT

def fixture():
    # ENTER 64; CONST 42; LEAVE 64, with the minimum 64K VM memory.
    code=bytes([3])+struct.pack("<I",64)+bytes([8])+struct.pack("<I",42)+bytes([4])+struct.pack("<I",64)
    header=struct.pack("<8I",0x12721444,3,32,len(code),32+len(code),4,0,65532)
    return header+code+struct.pack("<I",7)

def main():
    output=ROOT/"build/reference/vm_runtime";output.mkdir(parents=True,exist_ok=True)
    image=output/"constant.qvm";image.write_bytes(fixture())
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/vm_runtime_contracts.ml","--output","vm_runtime_contracts.exe"],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/"build/vm_runtime_contracts.exe",image],cwd=ROOT,text=True,capture_output=True,check=True)
    text=result.stdout.strip()
    if text!="PASS: 17 VM runtime contracts": raise AssertionError(text)
    print(text)

if __name__=="__main__": main()
