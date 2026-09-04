"""Inspect every original BSP and independently check key structural counts."""
import argparse
import json
import re
import struct
import zipfile
from pathlib import Path
from toolchain import ROOT,run

def main():
    parser=argparse.ArgumentParser();parser.add_argument("data_root",type=Path);args=parser.parse_args()
    output=ROOT / "build/reference/maps";output.mkdir(parents=True,exist_ok=True)
    results=[]
    for pk3 in sorted((args.data_root / "baseq3").glob("*.pk3")):
        with zipfile.ZipFile(pk3) as archive:
            for name in sorted(n for n in archive.namelist() if n.endswith(".bsp")):
                data=archive.read(name)
                expected=[struct.unpack_from("<i",data,12+lump*8)[0]//stride for lump,stride in ((7,40),(8,12),(13,104),(10,44))]
                text=run([ROOT / "build/MiniQuake3.exe","--inspect-map",pk3,name],ROOT / "build",log=output / (Path(name).stem+".log"))
                match=re.search(r"Models: (\d+) Brushes: (\d+)\s+Surfaces: (\d+) Vertices: (\d+)",text)
                if not match or list(map(int,match.groups()))!=expected:raise RuntimeError("Map count mismatch: "+name)
                results.append({"archive":pk3.name,"map":name,"counts":expected})
    (output / "result.json").write_text(json.dumps({"passed":True,"maps":results},indent=2)+"\n")
    print(f"PASS: {len(results)} original BSP maps loaded; structural counts match")

if __name__=="__main__":main()
