"""Differential tests for original COM_ParseExt and Cvar_Get/Set2/Reset/CheatState."""
import json
import random
import subprocess
import sys
from toolchain import ROOT, msvc_env, run
from inventory import sha

def main():
    output=ROOT / "build/reference/core"
    output.mkdir(parents=True,exist_ok=True)
    source=ROOT / "Quake-III-Arena-original-source/code"
    env=msvc_env("x86")
    run(["cl","/nologo","/Od","/fp:strict","/arch:SSE2","/MT","/DWIN32","/DNDEBUG","/D_CRT_SECURE_NO_WARNINGS",
         f"/I{source / 'game'}",f"/I{source / 'qcommon'}",ROOT / "tests/reference/core_oracle.c",
         source / "qcommon/cvar.c",source / "game/q_shared.c",f"/Fe:{output / 'core_oracle.exe'}",
         "/link","/Brepro"],output,env,output / "build.log")
    parser_cases=[b'  // comment\n{ "classname" "worldspawn"\n key value }\n',
                  b'a\n\nb /* inside\ncomment */ c\r\nd "a b\\c" "" // tail\nend',
                  b'"unterminated',b'a\0ignored',b'/* unterminated',b'x'*1024+b' rest',
                  b'{one} two;three + 1.2e-3 \t // x\r\n " quoted "']
    rng=random.Random(132)
    operations=[("get","sv_cheats","1",72), ("set","sv_cheats","0",1),
                ("get","latched","1",32), ("set","latched","2",0),
                ("set","latched","1",0), ("get","latched","1",32),
                ("get","rom","1",64), ("set","rom","2",0),
                ("get","cheated","1",512), ("set","cheated","2",0),
                ("set","adopted","9",0), ("get","adopted","3",1),
                ("get","bad;name","2",1)]
    for i in range(500):
        name=rng.choice(["latched","rom","cheated","adopted","newvar","sv_cheats"])
        op=rng.choice(["get","set","set","reset","cheats"])
        if op=="cheats": name="cheated"
        flags=rng.choice([0,1,2,4,8,16,32,64,128,256,512,1024]) if op=="get" else rng.randrange(2)
        value=rng.choice(["0","1","2","-3","1.5","1e2","<empty>","5tail","string"])
        operations.append((op,name,value,flags))
    commands=output / "cvars.tsv"
    commands.write_text("".join("\t".join(map(str,row))+"\n" for row in operations))
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/core_tests.ml","--output","core_tests.exe"],check=True)
    results=[]
    tests=[("cvar",commands)]
    for index,data in enumerate(parser_cases):
        path=output / f"parser{index}.txt"
        path.write_bytes(data)
        tests.append(("parser",path))
    for mode,path in tests:
        expected=path.with_suffix(".bin")
        run([output / "core_oracle.exe",mode,path,expected],output)
        text=run([ROOT / "build/core_tests.exe",mode,path,expected],ROOT / "build",log=path.with_suffix(".log"))
        print(text.strip())
        results.append({"mode":mode,"input":path.name,"expected_sha256":sha(expected)})
    (output / "result.json").write_text(json.dumps({"passed":True,"cvar_operations":len(operations),
        "parser_calls":64*len(parser_cases),"cases":results},indent=2)+"\n")

if __name__ == "__main__":
    main()
