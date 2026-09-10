"""Build and run playable warmup/limit/intermission contracts."""
import subprocess,sys
from toolchain import ROOT,run
def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_match_contracts.ml','--output','playable_match_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_match_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 25 playable match contracts': raise RuntimeError(value)
    print(value)
if __name__=='__main__': main()
