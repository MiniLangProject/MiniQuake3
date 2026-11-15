"""Rebuild 1.32b QVMs outside the original tree using its bundled lcc tools."""
import json
import os
import subprocess
from toolchain import ROOT, msvc_env, run
from inventory import sha

def source_profile(original):
    suffixes={".c",".h",".asm",".q3asm"}
    roots=(original/"code/game",original/"code/cgame",original/"code/q3_ui",original/"code/ui",original/"q3asm")
    return {str(path.relative_to(original)).replace("\\","/"):sha(path)
            for folder in roots for path in folder.rglob("*") if path.is_file() and path.suffix.lower() in suffixes}

def main():
    original=ROOT / "Quake-III-Arena-original-source"
    output=ROOT / "build/reference/qvms"
    output.mkdir(parents=True,exist_ok=True)
    env=msvc_env("x86")
    run(["cl","/nologo","/O2","/MT","/DWIN32","/DNDEBUG","/D_CRT_SECURE_NO_WARNINGS",
         original / "q3asm/q3asm.c",original / "q3asm/cmdlib.c",f"/Fe:{output / 'q3asm.exe'}",
         "/link","/Brepro","user32.lib"],output,env,output / "assembler-build.log")
    lcc=original / "lcc/bin/lcc.exe"
    compiler_env=os.environ.copy()
    compiler_env["PATH"]=str(lcc.parent)+os.pathsep+compiler_env.get("PATH","")
    compiler_env.pop("INCLUDE",None)
    compiler_env.pop("LIBRARY",None)
    manifest={"tools":[{"name":p.name,"sha256":sha(p)} for p in lcc.parent.glob("*.exe")],"sources":source_profile(original),"modules":[]}
    for group,listname,module in (("game","game","qagame"),("cgame","cgame","cgame"),("q3_ui","ui","ui")):
        source=original / "code" / group
        folder=output / module
        folder.mkdir(exist_ok=True)
        listing=(source / (listname+".q3asm")).read_text().splitlines()[1:]
        objects=[]
        for line in listing:
            line=line.strip()
            if not line: continue
            if line.startswith(".."):
                # The checked-in syscall assembly defines negative trap numbers.
                syscall_file=source / (line[3:]+".asm")
                if group=="q3_ui" and not syscall_file.exists():
                    syscall_file=original / "code/ui" / (line[3:]+".asm")
                objects.append(syscall_file.resolve())
                continue
            path=source / (line+".c")
            if not path.exists(): path=original / "code/game" / (line+".c")
            assembly=folder / (line+".asm")
            # The original lcc driver builds its cpp command without quoting
            # arguments. Keep every path it forwards relative to the output
            # directory, so a checkout in e.g. "Anwendungsentwicklung mit KI"
            # builds unchanged original sources without a junction or copy.
            relative=lambda value: os.path.relpath(value,folder)
            run([lcc,"-DQ3_VM","-S","-Wf-target=bytecode","-Wf-g","-I"+relative(source),
                 "-I"+relative(original / "code/game"),"-I"+relative(original / "code/cgame"),
                 "-I"+relative(original / "code/ui"),"-o",assembly.name,relative(path)],
                 folder,compiler_env,folder / (line+".log"))
            objects.append(assembly)
        run([output / "q3asm.exe","-o",output / module,*objects],folder,log=folder / "assemble.log")
        binary=output / (module+".qvm")
        manifest["modules"].append({"name":binary.name,"sha256":sha(binary),"size":binary.stat().st_size})
        print("Built original "+binary.name)
    (output / "profile.json").write_text(json.dumps(manifest,indent=2)+"\n")

if __name__ == "__main__":
    main()
