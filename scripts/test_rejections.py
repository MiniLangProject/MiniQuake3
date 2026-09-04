import io
import json
import random
import struct
import subprocess
import sys
import zipfile
from toolchain import ROOT,run
from test_vm import assemble

def main():
    output=ROOT / "build/reference/rejections"
    output.mkdir(parents=True,exist_ok=True)
    cases=[]
    def add(mode,name,data,argument="0"):
        path=output / name;path.write_bytes(data);cases.append((mode,path,argument))
    valid=assemble([("ENTER",64),("CONST",42),("LEAVE",64)])
    for length in range(32):add("loadvm",f"header{length}.qvm",valid[:length])
    for field,value in ((0,0),(4,0),(4,9999),(8,0),(12,0xffffffff),(16,0),(20,3),(24,0xffffffff),(28,0x7fffffff)):
        data=bytearray(valid);struct.pack_into("<I",data,field,value);add("loadvm",f"field{field}_{value}.qvm",data)
    add("loadvm","opcode.qvm",valid[:32]+b"\xff"+valid[33:])
    add("loadvm","jump.qvm",assemble([("ENTER",64),("CONST",1),("CONST",1),("EQ",999999),("CONST",42),("LEAVE",64)]))
    for name,ops in (("pop",[("ENTER",64),("POP",),("LEAVE",64)]),
        ("forever",[("ENTER",64),("CONST",1),("JUMP",)]),
        ("stack",[("ENTER",200000),("CONST",42),("LEAVE",200000)]),
        ("divide",[("ENTER",64),("CONST",1),("CONST",0),("DIVI",),("LEAVE",64)]),
        ("return",[("ENTER",64),("LEAVE",64)])):
        add("runvm",name+".qvm",assemble(ops))
    add("syscall","syscall.qvm",assemble([("ENTER",64),("CONST",-1),("CALL",),("LEAVE",64)]))
    for index,data,size in ((0,b"",0),(1,b"\x07",0),(2,b"\x01\x01\x00\x00\x00",1),
        (3,b"\x03",0),(4,b"\x03\x00",1),(5,b"\x03\x00\x00",0)):
        add("deflate",f"bad{index}.bin",data,str(size))
    for length in (0,1,8,21):add("pk3",f"short{length}.pk3",bytes(length))
    buffer=io.BytesIO()
    with zipfile.ZipFile(buffer,"w",compression=zipfile.ZIP_STORED) as archive:archive.writestr("test.txt",b"hello")
    validzip=buffer.getvalue();central=validzip.index(b"PK\x01\x02")
    for label,offset,value in (("directory",len(validzip)-6,0xffffff00),("crc",central+16,1),
                              ("method",central+10,99),("offset",central+42,0xffffff00)):
        data=bytearray(validzip)
        struct.pack_into("<I",data,offset,value)
        add("pk3" if label=="directory" else "entry",label+".pk3",data,"test.txt")
    for index in range(20):
        data=random.Random(index).randbytes(index*7)
        add("bsp",f"bsp{index}.bsp",data)
    manifest=output / "cases.tsv"
    manifest.write_text("".join("\t".join(map(str,row))+"\n" for row in cases))
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/rejection_tests.ml","--output","rejection_tests.exe"],check=True)
    print(run([ROOT / "build/rejection_tests.exe",manifest],ROOT / "build",log=output / "test.log"))
    (output / "result.json").write_text(json.dumps({"passed":True,"cases":len(cases)},indent=2)+"\n")

if __name__=="__main__":main()
