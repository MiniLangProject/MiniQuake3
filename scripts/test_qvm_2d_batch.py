"""Focused contracts for the native QVM 2D command adapter."""
import subprocess
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_2d_batch_contracts.ml','--output','qvm_2d_batch_contracts.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/qvm_2d_batch_contracts.exe'],cwd=ROOT/'build',check=True,text=True,capture_output=True).stdout.strip()
    if result!='PASS: 28 QVM 2D batch contracts':
        raise RuntimeError(result)
    print(result)

if __name__=='__main__': main()
