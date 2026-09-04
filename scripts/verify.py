"""Run the currently implemented port gates, failing on the first error.

Passing this suite does not mark the ten-step game port complete.
"""
import argparse
import json
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT
from inventory import sha

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--data-root",type=Path)
    args=parser.parse_args()
    scripts=[("build.py",[]),("test_numeric.py",[]),("test_math.py",[]),("test_core.py",[]),
             ("test_vm.py",[]),("test_archives.py",["--data-root",str(args.data_root)] if args.data_root else []),
             ("test_rejections.py",[]),("test_brush.py",[])]
    if args.data_root:
        scripts.append(("test_maps.py",[str(args.data_root)]))
    for name,arguments in scripts:
        print("[verify] "+name,flush=True)
        subprocess.run([sys.executable,ROOT / "scripts" / name,*arguments],check=True,cwd=ROOT)
    subprocess.run(["git","-C",str(ROOT / "Quake-III-Arena-original-source"),"diff","--exit-code"],check=True)
    result={"passed":True,"scope":"implemented foundations only; full game port remains incomplete",
            "gates":[name for name,_ in scripts],"binary_sha256":sha(ROOT / "build/MiniQuake3.exe")}
    (ROOT / "build/verification.json").write_text(json.dumps(result,indent=2)+"\n")
    print("PASS: all implemented foundation gates; full game acceptance is still pending.")

if __name__=="__main__":main()
