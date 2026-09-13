#!/usr/bin/env python3
"""Build the original-QVM scene-to-geometry bridge contracts."""
import subprocess,sys
from toolchain import ROOT,run

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_scene_geometry_contracts.ml','--output','qvm_scene_geometry_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/qvm_scene_geometry_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 15 QVM scene geometry contracts':raise RuntimeError(value)
    print(value)
if __name__=='__main__':main()
