"""Compare MiniLang ZIP/DEFLATE output with Python's independent zlib/zipfile."""
import argparse
import io
import json
import random
import subprocess
import sys
import zipfile
import zlib
from pathlib import Path
from toolchain import ROOT, run

class Unseekable(io.BytesIO):
    def seekable(self): return False
    def seek(self,*args): raise io.UnsupportedOperation("seek")

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--data-root",type=Path)
    args=parser.parse_args()
    output=ROOT / "build/reference/archives"
    output.mkdir(parents=True,exist_ok=True)
    rng=random.Random(1951)
    contents=[b"",b"a",b"hello quake "*1000,bytes(range(256))*500,
              rng.randbytes(40000),b"a"*70000, b"0123456789"*10000]
    cases=[]
    for index,data in enumerate(contents):
        expected=output / f"expected{index}.bin"
        expected.write_bytes(data)
        for strategy in (zlib.Z_DEFAULT_STRATEGY,zlib.Z_FIXED,zlib.Z_HUFFMAN_ONLY):
            for level in (0,6):
                compressor=zlib.compressobj(level,zlib.DEFLATED,-15,8,strategy)
                path=output / f"raw{index}_{strategy}_{level}.bin"
                path.write_bytes(compressor.compress(data)+compressor.flush())
                cases.append(("deflate",path,expected))
    for mode in (zipfile.ZIP_STORED,zipfile.ZIP_DEFLATED):
        for descriptor in (False,True):
            buffer=Unseekable() if descriptor else io.BytesIO()
            with zipfile.ZipFile(buffer,"w",compression=mode) as archive:
                archive.comment=b"PK\x05\x06 embedded false marker"
                for index,data in enumerate(contents): archive.writestr(f"test/{index}.bin",data)
            path=output / f"synthetic{mode}_{descriptor}.pk3"
            path.write_bytes(buffer.getvalue())
            for index in range(len(contents)):
                cases.append((path,f"TEST/{index}.BIN",output / f"expected{index}.bin"))
    if args.data_root:
        # Local extracted test data remain under ignored build/. No redistribution.
        for path in sorted((args.data_root / "baseq3").glob("*.pk3")):
            with zipfile.ZipFile(path) as archive:
                selected=[n for n in archive.namelist() if n in ("default.cfg","vm/qagame.qvm","maps/q3dm1.bsp","maps/q3dm1.aas")]
                selected += [n for n in archive.namelist() if n.endswith((".md3",".shader",".wav",".tga",".jpg"))][:10]
                for index,name in enumerate(selected):
                    expected=output / f"retail_{path.stem}_{index}.bin"
                    expected.write_bytes(archive.read(name))
                    cases.append((path,name,expected))
    manifest=output / "cases.tsv"
    manifest.write_text("".join("\t".join(map(str,row))+"\n" for row in cases))
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/archive_tests.ml","--output","archive_tests.exe"],check=True)
    result=run([ROOT / "build/archive_tests.exe",manifest],ROOT / "build",log=output / "test.log",timeout=240)
    print(result.strip().splitlines()[-1])
    (output / "result.json").write_text(json.dumps({"passed":True,"cases":len(cases),
        "oracle":"Python zipfile / zlib "+zlib.ZLIB_VERSION,
        "includes_user_assets":bool(args.data_root)},indent=2)+"\n")

if __name__ == "__main__":
    main()
