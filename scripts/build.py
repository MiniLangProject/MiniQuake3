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
    previous=json.loads(stamp.read_text()) if stamp.exists() else {}
    compiler_path=shutil.which("cl",path=env["PATH"])
    compiler_hash=sha(Path(compiler_path)) if compiler_path else previous.get("inputs",{}).get("compiler")
    if not compiler_hash:
        raise RuntimeError("MSVC cl.exe is unavailable and no verified native build cache exists")
    inputs={"source":sha(ROOT / "native/abi.c"),"compiler":compiler_hash,
            "flags":"/LD /O2 /fp:strict /MT /Brepro"}
    if not abi.exists() or previous.get("inputs")!=inputs or previous.get("binary")!=sha(abi):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild miniquake3_abi.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/fp:strict", "/MT", ROOT / "native/abi.c",
             "/link", "/Brepro", f"/out:{abi}"], output, env, output / "abi-build.log")
        stamp.write_text(json.dumps({"inputs":inputs,"binary":sha(abi)},indent=2)+"\n")
    udp=output / "miniquake3_udp.dll"
    udp_stamp=output / "udp-abi-inputs.json"
    udp_inputs={"source":sha(ROOT / "native/udp_win64.c"),"compiler":inputs["compiler"],
                "flags":"/LD /O2 /MT /Brepro ws2_32.lib"}
    udp_previous=json.loads(udp_stamp.read_text()) if udp_stamp.exists() else {}
    if not udp.exists() or udp_previous.get("inputs")!=udp_inputs or udp_previous.get("binary")!=sha(udp):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild miniquake3_udp.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/MT", ROOT / "native/udp_win64.c", "ws2_32.lib",
             "/link", "/Brepro", f"/out:{udp}"], output, env, output / "udp-abi-build.log")
        udp_stamp.write_text(json.dumps({"inputs":udp_inputs,"binary":sha(udp)},indent=2)+"\n")
    playable=output / "playable_window.dll"
    playable_stamp=output / "playable-window-inputs.json"
    playable_inputs={"source":sha(ROOT / "native/playable_win32.c"),"compiler":inputs["compiler"],
                     "flags":"/LD /O2 /W4 /WX /MT /Brepro user32.lib gdi32.lib"}
    playable_previous=json.loads(playable_stamp.read_text()) if playable_stamp.exists() else {}
    if not playable.exists() or playable_previous.get("inputs")!=playable_inputs or playable_previous.get("binary")!=sha(playable):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild playable_window.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT", ROOT / "native/playable_win32.c",
             "/link", "/Brepro", "user32.lib", "gdi32.lib", f"/out:{playable}"],
            output, env, output / "playable-window-build.log")
        playable_stamp.write_text(json.dumps({"inputs":playable_inputs,"binary":sha(playable)},indent=2)+"\n")
    audio=output / "playable_audio.dll"
    audio_stamp=output / "playable-audio-inputs.json"
    audio_inputs={"source":sha(ROOT / "native/playable_audio_win32.c"),"compiler":inputs["compiler"],
                  "flags":"/LD /O2 /W4 /WX /MT /Brepro winmm.lib"}
    audio_previous=json.loads(audio_stamp.read_text()) if audio_stamp.exists() else {}
    if not audio.exists() or audio_previous.get("inputs")!=audio_inputs or audio_previous.get("binary")!=sha(audio):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild playable_audio.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT", ROOT / "native/playable_audio_win32.c",
             "/link", "/Brepro", "winmm.lib", f"/out:{audio}"],
            output, env, output / "playable-audio-build.log")
        audio_stamp.write_text(json.dumps({"inputs":audio_inputs,"binary":sha(audio)},indent=2)+"\n")
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
