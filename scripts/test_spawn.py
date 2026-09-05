"""Map spawn/filter/worldspawn/think parity; unported classes remain callbacks."""
import argparse
import collections
import json
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT,run
from inventory import sha
from spawn_oracle import build
from spawn_fixtures import bsp,map_text,pack
from test_pmove import FIELDS

def inspect(data):
    off=0;boundaries=collections.Counter();events=collections.Counter();states=[];probes=[]
    def ints(n):
        nonlocal off
        out=struct.unpack_from('<'+'I'*n,data,off);off+=n*4;return out
    def string():
        nonlocal off
        n=struct.unpack_from('<i',data,off)[0];off+=4
        if n==-1:return None
        if n<0 or off+n>len(data):raise RuntimeError('Invalid reference string')
        s=data[off:off+n].decode('ascii');off+=n;return s
    def entity():
        fields=ints(124);strings=[string() for _ in range(9)];return fields,strings
    while off<len(data):
        kind=ints(1)[0];events[kind]+=1
        if kind in (1,2,3):ints(1);string();string()
        elif kind==4:
            subtype,index=ints(2);row=entity();boundaries[row[1][0]]+=1
        elif kind in (5,6):entity()
        elif kind==7:ints(1)
        elif kind==8:
            time,num,spawning,vars,chars,warmup,location_linked,location_head=ints(8);rows=[entity() for _ in range(num-64+1)]
            states.append({'time':time,'num_entities':num,'active':sum(row[0][53]!=0 for row in rows),'pushes':sum(row[0][53]!=0 and row[0][2]==8 for row in rows),
                           'teleporters':sum(row[0][53]!=0 and row[0][2]==9 for row in rows),'pending_thinks':sum(row[0][114]!=0 for row in rows)})
        elif kind==9:
            ps=ints(117);row=entity();probes.append({'jumppad_ent':ps[FIELDS['jumppad_ent']['offset']//4],
                'teleport_bit':bool(ps[FIELDS['eFlags']['offset']//4]&4)})
        else:raise RuntimeError('Unknown record '+str(kind)+' at '+str(off))
    return {'events':dict(events),'dispatch_boundaries':dict(boundaries),'states':states,'trigger_probes':len(probes),
            'push_reactions':sum(bool(p['jumppad_ent']) for p in probes),'teleport_reactions':sum(p['teleport_bit'] for p in probes)}

def main():
    p=argparse.ArgumentParser();p.add_argument('data_root',type=Path);p.add_argument('--map',action='append');p.add_argument('--no-curves',action='store_true');p.add_argument('--reuse-build',action='store_true')
    args=p.parse_args();flag='1' if args.no_curves else '0';output=ROOT/'build/reference/spawn'/('no_curves' if args.no_curves else 'curves');sources=build(output)
    if not args.reuse_build:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/spawn_tests.ml','--output','spawn_tests.exe'],check=True)
    with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:
        names=sorted(n for n in archive.namelist() if n.startswith('maps/') and n.endswith('.bsp'))
    # Load one retail BSP at a time. Keeping every decompressed map live made
    # long Windows runs needlessly sensitive to process/allocator pressure.
    maps=[(name,None,None,range(5)) for name in names]
    maps.append(('spawn_fixture.bsp',bsp(),map_text().encode(),range(-1,9)))
    for index,gravity in enumerate(['0','-0','-800']):maps.append((f'spawn_gravity_{index}.bsp',bsp(),map_text(gravity).encode(),[0]))
    records=[]
    for name,data,text,modes in maps:
        if args.map and Path(name).stem not in args.map:continue
        if data is None:
            with zipfile.ZipFile(args.data_root/'baseq3/pak0.pk3') as archive:data=archive.read(name)
            entity_offset,entity_size=struct.unpack_from('<2i',data,8);text=data[entity_offset:entity_offset+entity_size]
        folder=output/Path(name).stem;folder.mkdir(exist_ok=True);mapfile=folder/'map.bsp';mapfile.write_bytes(data)
        for mode in modes:
            inputs=folder/f'mode_{mode}.bin';inputs.write_bytes(struct.pack('<2i',mode,mode&3)+pack(text));expected=folder/f'mode_{mode}.expected'
            expected.unlink(missing_ok=True)
            for attempt in range(3):
                try:
                    run([output/'spawn_oracle.exe',mapfile,inputs,expected,flag],output,log=folder/f'mode_{mode}.oracle.log')
                    break
                except RuntimeError as exc:
                    if attempt==2 or 'failed (3)' not in str(exc):raise
                    expected.unlink(missing_ok=True)
            result=run([ROOT/'build/spawn_tests.exe',mapfile,inputs,expected,flag],ROOT/'build',log=folder/f'mode_{mode}.test.log',timeout=600)
            match=re.search(r'(\d+) exact words / (\d+) string bytes',result)
            records.append({'map':name,'gametype':mode,'exact_words':int(match[1]),'string_bytes':int(match[2]),**inspect(expected.read_bytes()),
                'map_sha256':sha(mapfile),'inputs_sha256':sha(inputs),'expected_sha256':sha(expected)})
        print(f'{name}: PASS {len(modes)} game-mode spawn/think/trigger replays',flush=True)
    if not records:raise RuntimeError('No matching map')
    assert sum(r['push_reactions'] for r in records)>0 and sum(r['teleport_reactions'] for r in records)>0
    result={'passed':True,'profile':'complete original g_spawn.c, 34 actual spawn classes, all 35 baseq3 item dispatches, original G_RunThink/SV/CM and trigger callbacks; cm_noCurves='+flag,
        'scope_boundary':'14 unported normal spawn classes; item pickup/touch rules and complete map/game-server acceptance remain open',
        'map_mode_replays':len(records),'exact_words':sum(r['exact_words'] for r in records),'string_bytes':sum(r['string_bytes'] for r in records),
        'trigger_probes':sum(r['trigger_probes'] for r in records),'push_reactions':sum(r['push_reactions'] for r in records),'teleport_reactions':sum(r['teleport_reactions'] for r in records),
        'maps':records,'test_sha256':sha(ROOT/'build/spawn_tests.exe'),'extracted_functions_sha256':sha(output/'spawn_functions.inc'),
        'original_sources':{s.relative_to(ROOT).as_posix():sha(s) for s in sources}}
    (output/'result.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
