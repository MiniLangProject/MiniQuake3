#!/usr/bin/env python3
"""Build the original-QVM scene-to-geometry bridge contracts."""
import subprocess,sys
from toolchain import ROOT,run

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_scene_geometry_contracts.ml','--output','qvm_scene_geometry_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/qvm_scene_geometry_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 51 QVM scene geometry contracts':raise RuntimeError(value)
    retained=ROOT/'build/reference/bodies/cd_q3dm12.bsp'
    if retained.exists():
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_inline_model_map_probe.ml','--output','qvm_inline_model_map_probe.exe'],cwd=ROOT,check=True)
        probe=run([ROOT/'build/qvm_inline_model_map_probe.exe',retained],ROOT/'build').strip()
        if not probe.startswith('PASS: inline BSP models=63 '):raise RuntimeError(probe)
    print(value)
if __name__=='__main__':main()
