"""End-to-end PK3 -> MiniLang BSP/patch loader -> trace CLI vs original C."""
import argparse
import ast
import json
import struct
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from test_collision import build_oracle
from inventory import sha

def main():
    parser=argparse.ArgumentParser();parser.add_argument("data_root",type=Path);args=parser.parse_args()
    output=ROOT / "build/reference/runtime_trace";output.mkdir(parents=True,exist_ok=True)
    build_oracle(output)
    archive=args.data_root / "baseq3/pak0.pk3"
    with zipfile.ZipFile(archive) as z: data=z.read("maps/q3dm1.bsp")
    bsp=output / "map.bsp";bsp.write_bytes(data)
    inputs=output / "input.bin";expected=output / "expected.bin"
    coordinates=[216,1328,128,216,1328,-1024]
    inputs.write_bytes(struct.pack("<12f3i",*coordinates,-15,-15,-24,15,15,32,0,0x2010001,0))
    run([output / "collision_oracle.exe",bsp,inputs,expected,"0"],output,log=output / "oracle.log")
    binary=ROOT / "build/MiniQuake3.exe"
    response=run([binary,"--trace-map",archive,"maps/q3dm1.bsp",*map(str,coordinates)],ROOT / "build",log=output / "test.log")
    lines=response.splitlines()
    fields={line.split(": ",1)[0]:line.split(": ",1)[1] for line in lines if ": " in line}
    normal,distance=fields["Normal"].split(" Distance: ")
    contents,flags=fields["Contents"].split(" Surface flags: ")
    startsolid,allsolid=fields["Start solid"].split(" All solid: ")
    floats=[float(fields["Fraction"]),*ast.literal_eval(normal),float(distance)]
    actual=struct.pack("<5f4I3f",*floats,int(flags),int(contents),int(startsolid=="true"),int(allsolid=="true"),*ast.literal_eval(fields["End"]))
    if actual!=expected.read_bytes()[:48]: raise RuntimeError("CLI result differs from original CM_BoxTrace")
    result={"passed":True,"binary_sha256":sha(binary),"map_sha256":sha(bsp),"expected_sha256":sha(expected),
            "exact_fields":12,"scope":"PK3-to-trace CLI with original player box and active curves","output":response}
    (output / "result.json").write_text(json.dumps(result,indent=2)+"\n")
    print("PASS: MiniLang PK3-to-trace CLI matches original C (12 exact fields)")
if __name__=="__main__":main()
