"""Exact patch geometry comparisons with original subdivision/facet/bevel code."""
import argparse
import json
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from inventory import sha

def main():
    p=argparse.ArgumentParser();p.add_argument("data_root",type=Path);p.add_argument("--map",action="append")
    args=p.parse_args();output=ROOT / "build/reference/patches";output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output,patches=True)
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/patch_tests.ml","--output","patch_tests.exe"],check=True)
    records=[]
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        names=sorted(n for n in archive.namelist() if n.startswith("maps/") and n.endswith(".bsp"))
        for name in names:
            if args.map and Path(name).stem not in args.map: continue
            data=archive.read(name);folder=output / Path(name).stem;folder.mkdir(exist_ok=True)
            bsp=folder / "map.bsp";bsp.write_bytes(data);expected=folder / "expected.bin"
            run([output / "collision_oracle.exe",bsp,expected],folder,log=folder / "oracle.log")
            print(name+": "+run([ROOT / "build/patch_tests.exe",bsp,expected],ROOT / "build",log=folder / "test.log",timeout=600).strip(),flush=True)
            records.append({"map":name,"patches":struct.unpack_from("<I",expected.read_bytes())[0],
                            "exact_fields":expected.stat().st_size//4,"bsp_sha256":sha(bsp),"expected_sha256":sha(expected)})
    if not records: raise RuntimeError("No maps matched")
    result={"passed":True,"maps":records,"patches":sum(r["patches"] for r in records),"exact_fields":sum(r["exact_fields"] for r in records),
            "original_sources":{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output / "result.json").write_text(json.dumps(result,indent=2)+"\n")
if __name__=="__main__":main()
