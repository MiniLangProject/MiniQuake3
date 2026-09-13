import subprocess
import sys
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def main():
    out=ROOT/'build/reference/font_abi';out.mkdir(parents=True,exist_ok=True)
    data=bytearray(20548)
    data[48:48+len(b'fonts/fontImage_16_0.tga')]=b'fonts/fontImage_16_0.tga'
    data[80+48:80+48+len(b'fonts/fontImage_16_1.tga')]=b'fonts/fontImage_16_1.tga'
    data[255*80+44:255*80+48]=(777).to_bytes(4,'little')
    pak=out/'font-test.pk3'
    with zipfile.ZipFile(pak,'w',compression=zipfile.ZIP_STORED) as zf: zf.writestr('fonts/fontImage_16.dat',data)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/font_abi_contracts.ml','--output','font_abi_contracts.exe'],cwd=ROOT,check=True)
    value=subprocess.run([ROOT/'build/font_abi_contracts.exe',pak],cwd=ROOT/'build',check=True,text=True,capture_output=True).stdout.strip()
    if value!='PASS: 10 font ABI contracts': raise RuntimeError(value)
    print(value)
if __name__=='__main__': main()
