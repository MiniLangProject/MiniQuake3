"""Retail pak0/QVM integration probe for native 2D batches."""
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
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_2d_retail_probe.ml','--output','qvm_2d_retail_probe.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/qvm_2d_retail_probe.exe',args.pak.resolve(),args.qvms.resolve()],cwd=ROOT/'build',check=True,text=True,capture_output=True,timeout=240).stdout.strip()
    if not result.startswith('PASS: retail QVM 2D '):
        raise RuntimeError(result)
    print(result)

if __name__=='__main__': main()
