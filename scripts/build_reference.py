"""Compile original 32-bit native game modules, preserving the source checkout.

This is a modern MSVC reference profile, not a claim of retail-binary identity.
"""
import json
import argparse
import xml.etree.ElementTree as ET
from pathlib import Path
from toolchain import ROOT, msvc_env, run
from inventory import sha

def project_sources(project, config="Release|Win32"):
    sources = []
    for node in ET.parse(project).findall(".//File"):
        path = project.parent / node.attrib["RelativePath"]
        if path.suffix.lower() not in (".c", ".cpp"):
            continue
        excluded = any(c.get("Name") == config and c.get("ExcludedFromBuild") == "TRUE"
                       for c in node.findall("FileConfiguration"))
        if not excluded:
            sources.append(path.resolve())
    return sources

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--observer",action="store_true")
    args=parser.parse_args()
    env = msvc_env("x86")
    code = ROOT / "Quake-III-Arena-original-source/code"
    output = ROOT / "build/reference"
    output.mkdir(parents=True, exist_ok=True)
    manifest = {"architecture": "x86", "floating_point": "/fp:strict /arch:SSE2", "optimization": "/Od", "modules": []}
    for group, name in (("game", "qagamex86"), ("cgame", "cgamex86"), ("q3_ui", "uix86")):
        folder = output / group
        folder.mkdir(exist_ok=True)
        sources = project_sources(code / group / (group + ".vcproj"))
        command = ["cl", "/nologo", "/c", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/GS-",
                   "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS", "/D_CRT_NONSTDC_NO_WARNINGS", *sources]
        run(command, folder, env, folder / "compile.log")
        definition = code / group / ("game.def" if group == "game" else "cgame.def" if group == "cgame" else "ui.def")
        binary = output / (name + ".dll")
        run(["link", "/nologo", "/dll", "/machine:x86", "/Brepro", f"/def:{definition}",
             f"/out:{binary}", *sorted(folder.glob("*.obj")), "winmm.lib"], folder, env, folder / "link.log")
        manifest["modules"].append({"name": binary.name, "sha256": sha(binary),
                                    "sources": [str(p.relative_to(code)).replace("\\", "/") for p in sources]})
        print(f"Built original {binary.name}")
    objects = []
    for group, project in (("engine", code / "quake3.vcproj"),
                           ("renderer", code / "renderer/renderer.vcproj"),
                           ("botlib", code / "botlib/botlib.vcproj")):
        folder = output / group
        folder.mkdir(exist_ok=True)
        sources = project_sources(project)
        extra=[]
        if group=="engine" and args.observer:
            original_main=code / "win32/win_main.c"
            text=original_main.read_text(encoding="latin1")
            if text.count("Com_Frame();")!=1: raise RuntimeError("Reference frame hook no longer unique")
            patched=folder / "win_main.c"
            patched.write_text("void MQ3_ReferenceFrame(void);\n"+text.replace("Com_Frame();","Com_Frame(); MQ3_ReferenceFrame();"),encoding="latin1")
            sources=[patched if p==original_main else p for p in sources]
            sources.append(ROOT / "tests/reference/frame_observer.c")
            extra=[f"/I{code / 'win32'}",f"/I{code / 'server'}"]
        run(["cl", "/nologo", "/c", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/GS-",
             "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS", "/D_CRT_NONSTDC_NO_WARNINGS",
             *(["/DBOTLIB"] if group == "botlib" else []),
             *extra,
             *sources], folder, env, folder / "compile.log")
        objects.extend(folder / (p.stem+".obj") for p in sources)
    binary = output / ("quake3-observer.exe" if args.observer else "quake3-reference.exe")
    run(["link", "/nologo", "/machine:x86", "/Brepro", "/subsystem:windows", "/stack:8388608",
         f"/out:{binary}", *objects, "winmm.lib", "wsock32.lib", "user32.lib", "gdi32.lib",
         "advapi32.lib", "ole32.lib", "uuid.lib"], output, env, output / "engine-link.log")
    manifest["engine"] = {"name": binary.name, "sha256": sha(binary)}
    print(f"Built original {binary.name}")
    manifest["observer"] = args.observer
    (output / ("observer-profile.json" if args.observer else "profile.json")).write_text(json.dumps(manifest, indent=2) + "\n")

if __name__ == "__main__":
    main()
