"""Validate actual MD3 indices through retained shader stages and portals."""
import subprocess
import sys
from toolchain import ROOT,run
def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md3_vertex_identity_contracts.ml','--output','md3_vertex_identity_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/md3_vertex_identity';out.mkdir(parents=True,exist_ok=True)
    result=run([ROOT/'build/md3_vertex_identity_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if result!='PASS: 19 MD3 vertex identity contracts (20 unique vertices, 36 corners, 16 stage-cache hits)':raise RuntimeError(result)
    print(result)
if __name__=='__main__':main()
