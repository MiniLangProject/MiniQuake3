"""Verify concrete ClientMessage -> ClientCommand/dispatcher/UserMove wiring."""
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT

def main():
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/server_client_input_contracts.ml","--output","server_client_input_contracts.exe"],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/"build/server_client_input_contracts.exe"],cwd=ROOT,text=True,capture_output=True,check=True)
    output=result.stdout.strip()
    if output!="PASS: 14 server client-input integration contracts": raise AssertionError(output)
    print(output)

if __name__=="__main__": main()
