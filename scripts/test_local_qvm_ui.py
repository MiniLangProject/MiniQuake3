"""Retail integration probe for interactive native input into ui.qvm."""
import argparse
import subprocess
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--pak',type=Path,required=True)
    parser.add_argument('--qvms',type=Path,default=ROOT/'build/reference/qvms')
    args=parser.parse_args()
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/local_qvm_ui_retail_probe.ml','--output','local_qvm_ui_retail_probe.exe'],cwd=ROOT,check=True)
    completed=subprocess.run([ROOT/'build/local_qvm_ui_retail_probe.exe',args.pak.resolve(),args.qvms.resolve()],cwd=ROOT/'build',text=True,capture_output=True,timeout=240)
    out=ROOT/'build/reference/local_qvm_ui';out.mkdir(parents=True,exist_ok=True)
    (out/'retail.log').write_text(completed.stdout+completed.stderr,encoding='utf-8')
    if completed.returncode:
        raise RuntimeError(f'retail UI probe failed ({completed.returncode}):\n{completed.stdout}{completed.stderr}')
    result=completed.stdout.strip()
    if not result.startswith('PASS: retail interactive UI '):
        raise RuntimeError(result)
    print(result)

if __name__=='__main__': main()
