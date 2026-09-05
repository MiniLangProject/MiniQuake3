import io
import json
import random
import struct
import subprocess
import sys
import zipfile
from toolchain import ROOT,run
from test_vm import assemble

def tiny_bsp(patch=False):
    lumps=[b"" for _ in range(17)]
    lumps[1]=struct.pack("<64sii",b"solid",0,1)
    planes=[(-1,0,0,16),(1,0,0,16),(0,-1,0,16),(0,1,0,16),(0,0,-1,16),(0,0,1,16)]
    lumps[2]=b"".join(struct.pack("<4f",*p) for p in planes)
    lumps[3]=struct.pack("<9i",1,-1,-2,-16,-16,-16,16,16,16)
    lumps[4]=b"".join(struct.pack("<12i",i,0,-16,-16,-16,16,16,16,0,int(patch),0,1) for i in range(2))
    lumps[5]=struct.pack("<i",0) if patch else b""
    lumps[6]=struct.pack("<i",0)
    lumps[7]=struct.pack("<6f4i",-16,-16,-16,16,16,16,0,int(patch),0,1)
    lumps[8]=struct.pack("<3i",0,6,0)
    lumps[9]=b"".join(struct.pack("<2i",i,0) for i in range(6))
    if patch:
        vertices=[]
        for j in range(3):
            for i in range(3): vertices.append(struct.pack("<10f4B",i*8,j*8,0,0,0,0,0,0,0,1,255,255,255,255))
        lumps[10]=b"".join(vertices)
        surface=bytearray(104);struct.pack_into("<i",surface,8,2);struct.pack_into("<i",surface,16,9)
        struct.pack_into("<2i",surface,96,3,3);lumps[13]=surface
    header=bytearray(struct.pack("<2i",0x50534249,46)+bytes(17*8));position=144
    for i,data in enumerate(lumps):
        struct.pack_into("<2i",header,8+i*8,position,len(data));position+=len(data)
    return header+b"".join(lumps)

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
    simple=tiny_bsp()
    add("collision_valid","valid_collision.bsp",simple)
    for label,lump,field,value in (("cycle",3,4,0),("child",3,4,99),("nan",2,0,0x7fc00000),
                                  ("infinity",2,12,0x7f800000),("short_brush",8,4,5)):
        data=bytearray(simple);offset=struct.unpack_from("<i",data,8+lump*8)[0]
        struct.pack_into("<I",data,offset+field,value);add("collision",label+".bsp",data)
    curved=tiny_bsp(patch=True)
    add("collision_valid","valid_patch.bsp",curved)
    for label,lump,field,value in (("even_patch",13,96,2),("large_patch",13,100,999999),
                                  ("nan_vertex",10,0,0x7fc00000),("small_patch",13,16,8)):
        data=bytearray(curved);offset=struct.unpack_from("<i",data,8+lump*8)[0]
        struct.pack_into("<I",data,offset+field,value);add("collision",label+".bsp",data)
    # A valid collision map is used to test invalid query parameters separately.
    for mode in ("trace_nan","trace_bounds","trace_model","trace_vector","trace_missing_curves"):
        add(mode,mode+".bsp",simple)
    for label,field,value in (("leaf_cluster",0,0xfffffffe),("leaf_area",4,256)):
        data=bytearray(simple);off=struct.unpack_from('<i',data,8+4*8)[0]
        struct.pack_into('<I',data,off+field,value);add('collision',label+'.bsp',data)
    for mode in ("temp_bounds","rotation_nan","transform_model","transform_bounds","leaf_capacity","brush_capacity",
                 "list_bounds","leaf_index","area_index","area_buffer","portal_index","portal_underflow"):
        add('spatial_'+mode,'spatial_'+mode+'.bsp',simple)
    # Structurally valid visibility storage with too few bits for its cluster count.
    data=bytearray(simple);off=struct.unpack_from('<i',data,8+4*8)[0]
    struct.pack_into('<i',data,off,8)
    struct.pack_into('<ii',data,8+16*8,len(data),17);data+=struct.pack('<ii',9,1)+bytes(9)
    add('collision','short_visibility_row.bsp',data)
    data=bytearray(simple);struct.pack_into('<ii',data,8+16*8,len(data),9);data+=struct.pack('<ii',1,1)+bytes(1)
    add('collision','visibility_cluster_mismatch.bsp',data)
    for count in (255,257):
        data=bytearray(simple);off=struct.unpack_from('<i',data,8+7*8)[0];model=data[off:off+40]
        struct.pack_into('<ii',data,8+7*8,len(data),count*40);data+=model*count
        add('collision',f'reserved_models_{count}.bsp',data)
    manifest=output / "cases.tsv"
    manifest.write_text("".join("\t".join(map(str,row))+"\n" for row in cases))
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/rejection_tests.ml","--output","rejection_tests.exe"],check=True)
    print(run([ROOT / "build/rejection_tests.exe",manifest],ROOT / "build",log=output / "test.log"))
    (output / "result.json").write_text(json.dumps({"passed":True,"cases":len(cases)-2,"valid_collision_controls":2},indent=2)+"\n")

if __name__=="__main__":main()
