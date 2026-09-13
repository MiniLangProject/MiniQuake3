"""Focused contracts for native input ownership of the retail ui.qvm."""
import subprocess
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/original_ui_session_contracts.ml','--output','original_ui_session_contracts.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/original_ui_session_contracts.exe'],cwd=ROOT/'build',check=True,text=True,capture_output=True).stdout.strip()
    if result!='PASS: 18 original UI session contracts':
        raise RuntimeError(result)
    print(result)

if __name__=='__main__': main()
