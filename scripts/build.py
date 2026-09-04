"""Build MiniLang code using the frozen toolchain and the small ABI bridge."""
import argparse
import json
import shutil
from pathlib import Path
from toolchain import ROOT, msvc_env, run
from inventory import sha

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", default="src/main.ml")
    parser.add_argument("--output", default="MiniQuake3.exe")
    args = parser.parse_args()
    output = ROOT / "build"
    output.mkdir(exist_ok=True)
    env = msvc_env("x64")
    abi=output / "miniquake3_abi.dll"
    stamp=output / "abi-inputs.json"
    inputs={"source":sha(ROOT / "native/abi.c"),"compiler":sha(Path(shutil.which("cl",path=env["PATH"]))),
            "flags":"/LD /O2 /fp:strict /MT /Brepro"}
    previous=json.loads(stamp.read_text()) if stamp.exists() else {}
    if not abi.exists() or previous.get("inputs")!=inputs or previous.get("binary")!=sha(abi):
        run(["cl", "/nologo", "/LD", "/O2", "/fp:strict", "/MT", ROOT / "native/abi.c",
             "/link", "/Brepro", f"/out:{abi}"], output, env, output / "abi-build.log")
        stamp.write_text(json.dumps({"inputs":inputs,"binary":sha(abi)},indent=2)+"\n")
    frozen = ROOT / "artifacts/toolchain"
    compiler = frozen / "build/mlc_win64.exe"
    if not compiler.exists():
        raise RuntimeError("Run scripts/inventory.py to freeze the compiler first")
    profile=json.loads((ROOT / "docs/reference/toolchain.json").read_text())
    for record in profile["inputs"]:
        path=frozen / record["path"]
        if not path.is_file() or sha(path)!=record["sha256"]:
            raise RuntimeError("Frozen compiler input changed: "+record["path"])
    run([compiler, ROOT / args.source, output / args.output, "-I", ROOT / "src", "-I", frozen,
         "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "64m"],
         output, log=output / (args.output + ".compile.log"), timeout=240)
    print(f"Built {args.output}")

if __name__ == "__main__":
    main()
