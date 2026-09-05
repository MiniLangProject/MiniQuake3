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
    parser.add_argument("--extended",action="store_true",help="Include all CD collision/patch/movement differential gates")
    args=parser.parse_args()
    if args.extended and not args.data_root: parser.error("--extended requires --data-root")
    scripts=[("build.py",[]),("test_numeric.py",[]),("test_math.py",[]),("test_core.py",[]),
             ("test_vm.py",[]),("test_archives.py",["--data-root",str(args.data_root)] if args.data_root else []),
             ("test_rejections.py",[]),("test_brush.py",[]),("test_shared_game.py",[]),("test_entitystate.py",[])]
    if args.data_root:
        scripts.append(("test_maps.py",[str(args.data_root)]))
        scripts.append(("test_runtime_trace.py",[str(args.data_root)]))
        scripts.append(("test_runtime_pmove.py",[str(args.data_root)]))
        scripts.append(("test_runtime_spatial.py",[str(args.data_root)]))
    if args.extended:
        scripts.extend([("test_patches.py",[str(args.data_root)]),
                        ("test_collision.py",[str(args.data_root),"--no-curves"]),
                        ("test_collision.py",[str(args.data_root)]),
                        ("test_movement.py",[str(args.data_root),"--count","4096","--no-curves"]),
                        ("test_movement.py",[str(args.data_root),"--count","4096"]),
                        ("test_pmove.py",[str(args.data_root),"--count","4096","--no-curves"]),
                        ("test_pmove.py",[str(args.data_root),"--count","4096"]),
                        ("test_spatial.py",[str(args.data_root),"--no-curves"]),
                        ("test_spatial.py",[str(args.data_root)]),
                        ("test_visibility.py",[str(args.data_root)]),
                        ("test_server_world.py",[str(args.data_root),"--no-curves"]),
                        ("test_server_world.py",[str(args.data_root)]),
                        ("test_transitions.py",[str(args.data_root),"--no-curves"]),
                        ("test_transitions.py",[str(args.data_root)])])
    for name,arguments in scripts:
        print("[verify] "+name,flush=True)
        subprocess.run([sys.executable,ROOT / "scripts" / name,*arguments],check=True,cwd=ROOT)
    subprocess.run(["git","-C",str(ROOT / "Quake-III-Arena-original-source"),"diff","--exit-code"],check=True)
    result={"passed":True,"scope":"implemented foundations only; full game port remains incomplete",
            "gates":[{"script":name,"arguments":arguments} for name,arguments in scripts],"binary_sha256":sha(ROOT / "build/MiniQuake3.exe")}
    (ROOT / "build/verification.json").write_text(json.dumps(result,indent=2)+"\n")
    print("PASS: all selected gates; full game acceptance is still pending.")

if __name__=="__main__":main()
