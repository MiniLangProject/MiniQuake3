"""Rebuild 1.32b QVMs outside the original tree using its bundled lcc tools."""
import json
import os
import subprocess
from toolchain import ROOT, msvc_env, run
from inventory import sha

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
    manifest={"tools":[{"name":p.name,"sha256":sha(p)} for p in lcc.parent.glob("*.exe")],"modules":[]}
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
            run([lcc,"-DQ3_VM","-S","-Wf-target=bytecode","-Wf-g","-I"+str(source),
                 "-I"+str(original / "code/game"),"-I"+str(original / "code/cgame"),
                 "-I"+str(original / "code/ui"),"-o",assembly,path],
                 folder,compiler_env,folder / (line+".log"))
            objects.append(assembly)
        run([output / "q3asm.exe","-o",output / module,*objects],folder,log=folder / "assemble.log")
        binary=output / (module+".qvm")
        manifest["modules"].append({"name":binary.name,"sha256":sha(binary),"size":binary.stat().st_size})
        print("Built original "+binary.name)
    (output / "profile.json").write_text(json.dumps(manifest,indent=2)+"\n")

if __name__ == "__main__":
    main()
