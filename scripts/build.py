"""Build MiniLang code using the frozen toolchain and the small ABI bridge."""
import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, msvc_env, run
from inventory import sha

def qvm_source_profile():
    original = ROOT / "Quake-III-Arena-original-source"
    suffixes = {".c", ".h", ".asm", ".q3asm"}
    roots = (original / "code/game", original / "code/cgame", original / "code/q3_ui",
             original / "code/ui", original / "q3asm")
    return {str(path.relative_to(original)).replace("\\", "/"): sha(path)
            for folder in roots for path in folder.rglob("*") if path.is_file() and path.suffix.lower() in suffixes}

def valid_qvm_cache(folder, names):
    profile_path = folder / "profile.json"
    if not profile_path.is_file(): return False
    try: profile = json.loads(profile_path.read_text())
    except (OSError, ValueError): return False
    modules = {item.get("name"): item for item in profile.get("modules", [])}
    if profile.get("sources") != qvm_source_profile(): return False
    for name in names:
        path = folder / name
        record = modules.get(name)
        if not path.is_file() or not record: return False
        if record.get("size") != path.stat().st_size or record.get("sha256") != sha(path): return False
    return True

def minilang_inputs(source_path, compiler):
    sources = {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path)
               for path in (ROOT / "src").rglob("*.ml") if path.is_file()}
    try: source_name = str(source_path.relative_to(ROOT)).replace("\\", "/")
    except ValueError: source_name = str(source_path.resolve())
    sources[source_name] = sha(source_path)
    return {"sources": sources, "compiler": sha(compiler),
            "toolchain_profile": sha(ROOT / "docs/reference/toolchain.json"),
            "flags": ["-I", "src", "-I", "artifacts/toolchain",
                      "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "64m"]}

def valid_minilang_cache(output_path, stamp_path, inputs):
    if not output_path.is_file() or not stamp_path.is_file(): return False
    try: previous = json.loads(stamp_path.read_text())
    except (OSError, ValueError): return False
    return previous.get("inputs") == inputs and previous.get("binary") == sha(output_path)

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
    winmain=output / "miniquake3_winmain.dll"
    winmain_stamp=output / "winmain-abi-inputs.json"
    winmain_inputs={"source":sha(ROOT / "native/win_main_win32.c"),"compiler":inputs["compiler"],
                    "flags":"/LD /O2 /W4 /WX /MT /Brepro user32.lib winmm.lib"}
    winmain_previous=json.loads(winmain_stamp.read_text()) if winmain_stamp.exists() else {}
    if not winmain.exists() or winmain_previous.get("inputs")!=winmain_inputs or winmain_previous.get("binary")!=sha(winmain):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild miniquake3_winmain.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT", ROOT / "native/win_main_win32.c",
             "/link", "/Brepro", "user32.lib", "winmm.lib", f"/out:{winmain}"],
            output, env, output / "winmain-abi-build.log")
        winmain_stamp.write_text(json.dumps({"inputs":winmain_inputs,"binary":sha(winmain)},indent=2)+"\n")
    playable=output / "playable_window.dll"
    playable_stamp=output / "playable-window-inputs.json"
    playable_inputs={"source":sha(ROOT / "native/playable_win32.c"),"compiler":inputs["compiler"],
                     "flags":"/LD /O2 /W4 /WX /MT /Brepro user32.lib gdi32.lib winmm.lib"}
    playable_previous=json.loads(playable_stamp.read_text()) if playable_stamp.exists() else {}
    if not playable.exists() or playable_previous.get("inputs")!=playable_inputs or playable_previous.get("binary")!=sha(playable):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild playable_window.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT", ROOT / "native/playable_win32.c",
             "/link", "/Brepro", "user32.lib", "gdi32.lib", "winmm.lib", f"/out:{playable}"],
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
    ambient=output / "playable_ambient.dll"
    ambient_stamp=output / "playable-ambient-inputs.json"
    ambient_inputs={"source":sha(ROOT / "native/playable_ambient_win32.c"),"compiler":inputs["compiler"],
                    "flags":"/LD /O2 /W4 /WX /MT /Brepro winmm.lib"}
    ambient_previous=json.loads(ambient_stamp.read_text()) if ambient_stamp.exists() else {}
    if not ambient.exists() or ambient_previous.get("inputs")!=ambient_inputs or ambient_previous.get("binary")!=sha(ambient):
        if not compiler_path: raise RuntimeError("MSVC cl.exe is required to rebuild playable_ambient.dll")
        run(["cl", "/nologo", "/LD", "/O2", "/W4", "/WX", "/MT", ROOT / "native/playable_ambient_win32.c",
             "/link", "/Brepro", "winmm.lib", f"/out:{ambient}"],
            output, env, output / "playable-ambient-build.log")
        ambient_stamp.write_text(json.dumps({"inputs":ambient_inputs,"binary":sha(ambient)},indent=2)+"\n")
    frozen = ROOT / "artifacts/toolchain"
    compiler = frozen / "build/mlc_win64.exe"
    if not compiler.exists():
        raise RuntimeError("Run scripts/inventory.py to freeze the compiler first")
    profile=json.loads((ROOT / "docs/reference/toolchain.json").read_text())
    for record in profile["inputs"]:
        path=frozen / record["path"]
        if not path.is_file() or sha(path)!=record["sha256"]:
            raise RuntimeError("Frozen compiler input changed: "+record["path"])
    source_path=Path(args.source);source_path=source_path if source_path.is_absolute() else ROOT/source_path
    output_path=Path(args.output);output_path=output_path if output_path.is_absolute() else output/output_path
    compile_stamp=output_path.with_name(output_path.name+".inputs.json")
    compile_inputs=minilang_inputs(source_path,compiler)
    if not valid_minilang_cache(output_path,compile_stamp,compile_inputs):
        run([compiler, source_path, output_path, "-I", ROOT / "src", "-I", frozen,
             "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "64m"],
             output, log=output / (output_path.name + ".compile.log"), timeout=480)
        compile_stamp.write_text(json.dumps({"inputs":compile_inputs,"binary":sha(output_path)},indent=2)+"\n")
    if source_path.resolve() == (ROOT / "src/main.ml").resolve() and output_path.resolve() == (output / "MiniQuake3.exe").resolve():
        source_qvms = output / "reference" / "qvms"
        qvm_names = ("ui.qvm", "qagame.qvm", "cgame.qvm")
        if not valid_qvm_cache(source_qvms, qvm_names):
            subprocess.run([sys.executable, ROOT / "scripts" / "build_qvms.py"], cwd=ROOT, check=True)
        packaged_qvms = output / "qvms"
        packaged_qvms.mkdir(exist_ok=True)
        for name in qvm_names:
            shutil.copy2(source_qvms / name, packaged_qvms / name)
    print(f"Built {args.output}")

if __name__ == "__main__":
    main()
