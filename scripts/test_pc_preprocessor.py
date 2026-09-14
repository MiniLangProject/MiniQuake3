import subprocess
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/pc_preprocessor_contracts.ml','--output','pc_preprocessor_contracts.exe'],cwd=ROOT,check=True)
    value=subprocess.run([ROOT/'build/pc_preprocessor_contracts.exe'],cwd=ROOT/'build',check=True,text=True,capture_output=True).stdout.strip()
    if value!='PASS: 13 PC preprocessor contracts': raise RuntimeError(value)
    print(value)
if __name__=='__main__': main()
