"""Verify input -> SV_Frame -> CL_Frame desktop composition."""
import subprocess
import sys
from toolchain import ROOT

def main():
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/engine_loop_contracts.ml","--output","engine_loop_contracts.exe"],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/"build/engine_loop_contracts.exe"],cwd=ROOT,text=True,capture_output=True,check=True)
    output=result.stdout.strip()
    if output!="PASS: 15 engine-loop integration contracts": raise AssertionError(output)
    print(output)

if __name__=="__main__": main()
