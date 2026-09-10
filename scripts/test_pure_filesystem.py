"""Direct original-C MD4 oracle plus deterministic PK3/search-path contracts."""
import json
import random
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT, msvc_env, run

def oracle(exe: Path, path: Path, key: int) -> tuple[int,int]:
    text=subprocess.run([exe,path,str(key)],capture_output=True,text=True,check=True).stdout
    return tuple(map(int,text.split()))

def crc_header(path: Path) -> bytes:
    with zipfile.ZipFile(path) as archive:
        return b"".join(struct.pack("<I",info.CRC) for info in archive.infolist() if info.file_size>0)

def main():
    output=ROOT/"build/reference/pure_filesystem"; output.mkdir(parents=True,exist_ok=True)
    env=msvc_env("x64"); oracle_exe=output/"md4_oracle.exe"
    run(["cl","/nologo","/O2","/MT",ROOT/"native/md4_oracle.c","/link","/Brepro",f"/out:{oracle_exe}"],output,env,output/"oracle-build.log")
    rng=random.Random(13268); sizes=[0,1,2,3,7,15,16,31,32,55,56,57,63,64,65,127,128,129,255,256,511,512,1023,4096]
    rows=[]
    for index,size in enumerate(sizes):
        path=output/f"data{index}.bin"; path.write_bytes(rng.randbytes(size)); key=rng.randrange(-2147483648,2147483648)
        plain,keyed=oracle(oracle_exe,path,key); rows.append((path,key,plain,keyed))
    manifest=output/"checksums.tsv"; manifest.write_text("".join("\t".join(map(str,row))+"\n" for row in rows))
    root=output/"root"; base=root/"baseq3"; base.mkdir(parents=True,exist_ok=True)
    (base/"loose.cfg").write_text("loose",encoding="ascii")
    pak0=base/"pak0.pk3"; pak1=base/"pak1.pk3"
    with zipfile.ZipFile(pak0,"w",zipfile.ZIP_DEFLATED) as z:
        z.writestr("common.txt",b"zero"); z.writestr("maps/a.bsp",b"a"); z.writestr("scripts/common.shader",b"old"); z.writestr("empty.dat",b"")
    with zipfile.ZipFile(pak1,"w",zipfile.ZIP_DEFLATED) as z:
        z.writestr("common.txt",b"one"); z.writestr("maps/b.bsp",b"b"); z.writestr("scripts/Common.shader",b"new")
    feed=-112233445
    headers=[]
    for index,pak in enumerate((pak0,pak1)):
        header=output/f"pak{index}.crc"; header.write_bytes(crc_header(pak)); headers.append(oracle(oracle_exe,header,feed))
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/pure_filesystem_contracts.ml","--output","pure_filesystem_contracts.exe"],check=True)
    args=[ROOT/"build/pure_filesystem_contracts.exe",manifest,root,pak0,pak1,feed,headers[0][0],headers[0][1],headers[1][0],headers[1][1]]
    result=run(args,ROOT/"build",log=output/"test.log",timeout=240)
    print(result.strip().splitlines()[-1])
    (output/"result.json").write_text(json.dumps({"passed":True,"checksum_cases":len(rows),"exact_checksum_values":len(rows)*2,"filesystem_contracts":25,"oracle":"unchanged code/qcommon/md4.c","scope":"automatic Windows game-directory enumeration, PK3 search priority/listing, loaded and referenced pak metadata, pure filtering, download comparison and keyed checksums"},indent=2)+"\n")

if __name__=="__main__": main()
