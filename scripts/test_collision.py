"""Compare actual CM_BoxTrace/CM_PointContents on CD maps, with both curve profiles."""
import argparse
import json
import math
import random
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,msvc_env,run
from inventory import sha

def build_oracle(output,movement=False,patches=False,pmove=False,spatial=False,visibility=False,server_world=False,shared_game=False):
    source=ROOT / "Quake-III-Arena-original-source/code"
    sources=[source / "qcommon" / name for name in
             ("cm_load.c","cm_trace.c","cm_test.c","cm_patch.c","cm_polylib.c","md4.c")]
    sources += [source / "game" / name for name in ("q_math.c","q_shared.c")]
    extra=[]
    if movement or pmove:
        sources += [source / "game" / name for name in ("bg_slidemove.c","bg_misc.c")]
        extra=["/DMQ3_ORACLE_LIBRARY",ROOT / ("tests/reference/pmove_oracle.c" if pmove else "tests/reference/movement_oracle.c")]
    if pmove or server_world:
        schema=json.loads((ROOT/'docs/reference/playerstate.json').read_text())
        checks=['#include <stddef.h>',f'typedef char check_ps_size[(sizeof(playerState_t)=={schema["size"]})?1:-1];']
        for field in schema['fields']:
            name=field['name'];offset=field['offset'];size=field['count']*4
            checks += [f'typedef char check_ps_{name}[(offsetof(playerState_t,{name})=={offset} && sizeof(((playerState_t*)0)->{name})=={size})?1:-1];']
        (output/'playerstate_offsets.inc').write_text('\n'.join(checks)+'\n')
        # Compile the actual original Win32 assembly function, without its OS host.
        snap=(source / 'win32/win_shared.c').read_text().split('void Sys_SnapVector( float *v )')[1].split('/*\n================')[0]
        start=snap.index('{');depth=0;end=start
        for end in range(start,len(snap)):
            if snap[end]=='{':depth+=1
            elif snap[end]=='}':
                depth-=1
                if depth==0:break
        (output / 'snapvector.inc').write_text('void Sys_SnapVector( float *v )'+snap[start:end+1]+'\n')
        extra += [f'/I{output}']
    if patches:
        extra=["/DMQ3_ORACLE_LIBRARY",ROOT / "tests/reference/patch_oracle.c"]
    if spatial or visibility:
        extra=["/DMQ3_ORACLE_LIBRARY",ROOT / ('tests/reference/visibility_oracle.c' if visibility else 'tests/reference/spatial_oracle.c')]
    if shared_game:
        sources += [source/'game/bg_misc.c']
        extra=["/DMQ3_ORACLE_LIBRARY",ROOT/'tests/reference/shared_game_oracle.c']
    if server_world:
        sources += [source/'game'/name for name in ('bg_pmove.c','bg_slidemove.c','bg_misc.c')]
        # Extract the three complete, unchanged address helpers. Linking all of
        # sv_game.c would pull in unrelated VM/syscall/server dependencies.
        import re
        game=(source/'server/sv_game.c').read_text()
        helpers=[]
        for name in ('SV_GentityNum','SV_SvEntityForGentity','SV_GEntityForSvEntity'):
            match=re.search(r'^\w+\s*\*\s*'+name+r'\([^\n]+\{',game,re.M)
            if not match:raise RuntimeError('Cannot find original helper '+name)
            start=match.start();depth=1;end=match.end()
            while depth:
                if game[end]=='{':depth+=1
                elif game[end]=='}':depth-=1
                end+=1
            helpers.append(game[start:end])
        (output/'server_helpers.inc').write_text('\n\n'.join(helpers)+'\n')
        extra=["/DMQ3_ORACLE_LIBRARY",f'/I{output}',ROOT/'tests/reference/server_world_oracle.c']
    run(["cl","/nologo","/Od","/Gy","/fp:strict","/arch:SSE2","/MT","/DWIN32","/DNDEBUG",
         "/D_CRT_SECURE_NO_WARNINGS",f"/I{source / 'qcommon'}",f"/I{source / 'game'}",
         ROOT / "tests/reference/collision_oracle.c",*sources,*extra,
         f"/Fe:{output / 'collision_oracle.exe'}","/link","/OPT:REF","/Brepro","/stack:8388608"],
        output,msvc_env("x86"),output / "build.log")
    headers=[source/'game'/name for name in ('q_shared.h','bg_public.h','bg_local.h','surfaceflags.h')]
    reported=sources[:]
    if movement or pmove:reported.append(source/'game/bg_pmove.c')
    if pmove or server_world:reported.append(source/'win32/win_shared.c')
    if pmove or server_world or shared_game:reported+=headers
    if server_world:reported += [source/'server/sv_world.c',source/'server/sv_game.c',source/'server/server.h',source/'game/g_public.h']
    return reported

def cases(data,count,seed):
    rng=random.Random(seed)
    offsets=[struct.unpack_from("<ii",data,8+i*8) for i in range(17)]
    modeloff,modellength=offsets[7]
    leafpos,leaflen=offsets[4]
    queries=[]
    for i in range(count):
        model=(i//8)%(modellength//40) if i%8==0 else 0
        bounds=struct.unpack_from("<6f",data,modeloff+model*40)
        if model==0 and i%5!=0:
            leaf=rng.randrange(leaflen//48)
            bounds=struct.unpack_from("<6i",data,leafpos+leaf*48+8)
        start=[rng.uniform(bounds[j],bounds[j+3]) for j in range(3)]
        end=[start[j]+rng.uniform(-400,400) for j in range(3)]
        if i%5==0: end=[rng.uniform(bounds[j],bounds[j+3]) for j in range(3)]
        if i%7==0: end=start[:]
        mins,maxs=([-15,-15,-24],[15,15,32]) if i%3 else ([0,0,0],[0,0,0])
        if i%13==0: mins,maxs=[-2,-8,-3],[5,9,1]
        mask=[-1,1,0x2010001,0x2000001,0x38,0x10000,0][i%7]
        queries.append(struct.pack("<12f3i",*start,*end,*mins,*maxs,model,mask,int(i%4==0)))
    # Cross the centers of quadratic control cells, including stationary boxes
    # and point/capsule sweeps. This directly exercises curved surface contacts.
    surfaceoff,surfacelen=offsets[13];vertoff,_=offsets[10]
    for off in range(surfaceoff,surfaceoff+surfacelen,104):
        if struct.unpack_from("<i",data,off+8)[0]!=2: continue
        first=struct.unpack_from("<i",data,off+12)[0]
        width,height=struct.unpack_from("<ii",data,off+96)
        points=[struct.unpack_from("<3f",data,vertoff+(first+j)*44) for j in range(width*height)]
        weights=[0.25,0.5,0.25]
        center=[sum(points[j*width+k][axis]*weights[j]*weights[k] for j in range(3) for k in range(3)) for axis in range(3)]
        u=[points[2][axis]-points[0][axis] for axis in range(3)]
        v=[points[2*width][axis]-points[0][axis] for axis in range(3)]
        normal=[v[1]*u[2]-v[2]*u[1],v[2]*u[0]-v[0]*u[2],v[0]*u[1]-v[1]*u[0]]
        length=math.sqrt(sum(x*x for x in normal))
        if length<0.001: normal=[0,0,1]
        else: normal=[x/length for x in normal]
        for mode in range(4):
            start=[center[j]+normal[j]*64 for j in range(3)]
            end=[center[j]-normal[j]*64 for j in range(3)]
            mins,maxs=([0,0,0],[0,0,0]) if mode==0 else ([-15,-15,-24],[15,15,32])
            if mode==3: start=center;end=center
            queries.append(struct.pack("<12f3i",*start,*end,*mins,*maxs,0,-1,int(mode==2)))
    return b"".join(queries)

def main():
    p=argparse.ArgumentParser();p.add_argument("data_root",type=Path)
    p.add_argument("--map",action="append");p.add_argument("--count",type=int,default=1024)
    p.add_argument("--no-curves",action="store_true")
    p.add_argument("--oracle-only",action="store_true");args=p.parse_args()
    no_curves="1" if args.no_curves else "0"
    output=ROOT / "build/reference/collision" / ("no_curves" if args.no_curves else "curves");output.mkdir(parents=True,exist_ok=True)
    sources=build_oracle(output)
    if args.oracle_only: return
    subprocess.run([sys.executable,ROOT / "scripts/build.py","--source","tests/collision_tests.ml","--output","collision_tests.exe"],check=True)
    records=[]
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        names=sorted(n for n in archive.namelist() if n.startswith("maps/") and n.endswith(".bsp"))
        for index,name in enumerate(names):
            if args.map and Path(name).stem not in args.map: continue
            data=archive.read(name);folder=output / Path(name).stem;folder.mkdir(exist_ok=True)
            bsp=folder / "map.bsp";bsp.write_bytes(data)
            inputs=folder / "inputs.bin";inputs.write_bytes(cases(data,args.count,0x513000+index))
            expected=folder / "expected.bin"
            run([output / "collision_oracle.exe",bsp,inputs,expected,no_curves],folder,log=folder / "oracle.log")
            print(name+": "+run([ROOT / "build/collision_tests.exe",bsp,inputs,expected,no_curves],ROOT / "build",log=folder / "test.log",timeout=600).strip(),flush=True)
            records.append({"map":name,"cases":inputs.stat().st_size//60,"bsp_sha256":sha(bsp),"input_sha256":sha(inputs),"expected_sha256":sha(expected)})
    if not records: raise RuntimeError("No maps matched")
    total=sum(r["cases"] for r in records)
    result={"passed":True,"profile":"original x86 CM_BoxTrace, cm_noCurves="+no_curves+"; world and inline BSP models",
            "maps":records,"traces":total,"exact_fields":total*16,
            "original_sources":{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output / "result.json").write_text(json.dumps(result,indent=2)+"\n")

if __name__=="__main__":main()
