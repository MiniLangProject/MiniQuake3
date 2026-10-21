"""Focused contracts for the native QVM 2D command adapter."""
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    fixture=ROOT/'build/qvm_2d_fixture.pk3'
    fixture.parent.mkdir(parents=True,exist_ok=True)
    header=bytearray(18);header[2]=2;header[12]=1;header[14]=1;header[16]=32;header[17]=8
    shader='gfx/old\n{\n {\n  map gfx/old.tga\n }\n}\ngfx/new\n{\n clampTime 0.75\n {\n  animMap 2 gfx/new.tga gfx/old.tga\n }\n}\n'
    with zipfile.ZipFile(fixture,'w',compression=zipfile.ZIP_STORED) as archive:
        archive.writestr('scripts/qvm2d.shader',shader)
        archive.writestr('gfx/old.tga',bytes(header)+bytes([0,0,255,255]))
        archive.writestr('gfx/new.tga',bytes(header)+bytes([0,255,0,255]))
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_2d_batch_contracts.ml','--output','qvm_2d_batch_contracts.exe'],cwd=ROOT,check=True)
    result=subprocess.run([ROOT/'build/qvm_2d_batch_contracts.exe',fixture.resolve()],cwd=ROOT/'build',check=True,text=True,capture_output=True).stdout.strip()
    if result!='PASS: 32 QVM 2D batch contracts':
        raise RuntimeError(result)
    print(result)

if __name__=='__main__': main()
