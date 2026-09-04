"""Assemble QVM fixtures and compare MiniLang with original vm_interpreted.c."""
import json
import random
import struct
import subprocess
import sys
from toolchain import ROOT, msvc_env, run
from inventory import sha

OPS = "UNDEF IGNORE BREAK ENTER LEAVE CALL PUSH POP CONST LOCAL JUMP EQ NE LTI LEI GTI GEI LTU LEU GTU GEU EQF NEF LTF LEF GTF GEF LOAD1 LOAD2 LOAD4 STORE1 STORE2 STORE4 ARG BLOCK_COPY SEX8 SEX16 NEGI ADD SUB DIVI DIVU MODI MODU MULI MULU BAND BOR BXOR BCOM LSH RSHI RSHU NEGF ADDF SUBF DIVF MULF CVIF CVFI".split()
LONG = {"ENTER", "LEAVE", "CONST", "LOCAL", "BLOCK_COPY", *OPS[11:27]}

def assemble(instructions):
    code = bytearray()
    for item in instructions:
        op = item[0]
        code.append(OPS.index(op))
        if op in LONG:
            code.extend(struct.pack("<I", item[1] & 0xffffffff))
        elif op == "ARG":
            code.append(item[1])
    header = struct.pack("<8I", 0x12721444, len(instructions), 32, len(code), 32 + len(code), 64, 0, 65536)
    return header + code + bytes(range(64))

def main():
    output = ROOT / "build/reference/vm"
    output.mkdir(parents=True, exist_ok=True)
    env = msvc_env("x86")
    source = ROOT / "Quake-III-Arena-original-source/code/qcommon"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/DWIN32", "/DNDEBUG", "/D_CRT_SECURE_NO_WARNINGS",
         f"/I{source}", ROOT / "tests/reference/vm_oracle.c", source / "vm_interpreted.c",
         f"/Fe:{output / 'vm_oracle.exe'}", "/link", "/Brepro"], output, env, output / "build.log")
    cases = []
    def add(name, instructions):
        path = output / (f"{len(cases):04d}_" + name + ".qvm")
        path.write_bytes(assemble(instructions))
        cases.append(path)
    rng = random.Random(68)
    for op in OPS[38:49] + OPS[50:53] + OPS[54:58]:
        for i in range(12):
            a, b = rng.randrange(-0x80000000,0x80000000), rng.randrange(1,0x7fffffff)
            if op in OPS[50:53]: b &= 31
            if op in OPS[54:58]:
                a, b = [struct.unpack("<I",struct.pack("<f",rng.uniform(-10000,10000)))[0] for _ in range(2)]
            add(op, [("ENTER",64),("CONST",a),("CONST",b),(op,),("LEAVE",64)])
    for op in ("SEX8","SEX16","NEGI","NEGF","CVIF","CVFI","BCOM"):
        for value in (0,1,-1,127,128,255,32767,32768,0x80000000,0x7fffffff,0x3fe00000):
            add(op,[("ENTER",64),("CONST",value),(op,),("LEAVE",64)])
    for op in OPS[11:27]:
        for a,b in ((0,1),(1,0),(1,1),(-1,1),(0x80000000,0x7fffffff)):
            add(op,[("ENTER",64),("CONST",a),("CONST",b),(op,6),("CONST",0),("LEAVE",64),("CONST",1),("LEAVE",64)])
    for store,load in (("STORE1","LOAD1"),("STORE2","LOAD2"),("STORE4","LOAD4")):
        for address in (0,1,4,15):
            alignment={"STORE1":1,"STORE2":2,"STORE4":4}[store]
            aligned=address & ~(alignment-1)
            add(store,[("ENTER",64),("CONST",address),("CONST",0x87654321),(store,),
                       ("CONST",aligned),(load,),("LEAVE",64)])
    add("syscall",[("ENTER",64),("CONST",123),("ARG",8),("CONST",456),("ARG",12),("CONST",-4),("CALL",),("LEAVE",64)])
    add("call",[("ENTER",64),("CONST",4),("CALL",),("LEAVE",64),("ENTER",32),("CONST",42),("LEAVE",32)])
    add("local",[("ENTER",64),("LOCAL",72),("LOAD4",),("LEAVE",64)])
    add("jump",[("ENTER",64),("CONST",4),("JUMP",),("CONST",999),("CONST",42),("LEAVE",64)])
    add("copy",[("ENTER",64),("CONST",16),("CONST",0),("BLOCK_COPY",12),("CONST",20),("LOAD4",),("LEAVE",64)])
    add("push_pop",[("ENTER",64),("PUSH",),("POP",),("IGNORE",),("BREAK",),("CONST",42),("LEAVE",64)])
    add("bcom_slot",[("ENTER",64),("CONST",123),("CONST",45),("BCOM",),("POP",),("LEAVE",64)])
    # Batches keep command lines below the Windows length limit.
    results = bytearray()
    for start in range(0,len(cases),60):
        chunk=output / f"chunk{start}.bin"
        run([output / "vm_oracle.exe",chunk,*cases[start:start+60]],output)
        results.extend(chunk.read_bytes())
    expected=output / "expected.bin"
    expected.write_bytes(results)
    manifest=output / "cases.txt"
    manifest.write_text("\n".join(str(p) for p in cases)+"\n")
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/vm_tests.ml","--output","vm_tests.exe"],check=True)
    result=run([ROOT / "build/vm_tests.exe",manifest,expected],ROOT / "build",log=output / "test.log")
    print(result)
    (output / "result.json").write_text(json.dumps({"passed":True,"cases":len(cases),
        "reference_sha256":sha(expected),"oracle_sha256":sha(output / "vm_oracle.exe"),
        "test_sha256":sha(ROOT / "build/vm_tests.exe")},indent=2)+"\n")

if __name__ == "__main__":
    main()
