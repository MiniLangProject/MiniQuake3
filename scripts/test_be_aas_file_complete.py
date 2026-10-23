#!/usr/bin/env python3
"""Complete aasfile.h ABI and be_aas_file.c behavior/retail gate."""
from __future__ import annotations

import argparse
import json
import re
import struct
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run

FUNCTIONS=("AAS_SwapAASData","AAS_DumpAASData","AAS_FileInfo","AAS_LoadAASLump","AAS_DData","AAS_LoadAASFile","AAS_WriteAASLump","AAS_WriteAASFile")
HEADER_TYPES=("aas_bbox_t","aas_reachability_t","aas_areasettings_t","aas_portal_t","aas_portalindex_t","aas_cluster_t","aas_vertex_t","aas_plane_t","aas_edge_t","aas_edgeindex_t","aas_face_t","aas_faceindex_t","aas_area_t","aas_node_t","aas_lump_t","aas_header_t")
TYPE_MARKERS={
    'aas_bbox_t':r'\bstruct\s+BBox\b','aas_reachability_t':r'\bstruct\s+Reachability\b','aas_areasettings_t':r'\bstruct\s+AreaSettings\b',
    'aas_portal_t':r'\bstruct\s+Portal\b','aas_portalindex_t':r'\bfunction\s+portalIndex\s*\(','aas_cluster_t':r'\bstruct\s+Cluster\b',
    'aas_vertex_t':r'\bfunction\s+vertex\s*\(','aas_plane_t':r'\bstruct\s+Plane\b','aas_edge_t':r'\bfunction\s+edge\s*\(',
    'aas_edgeindex_t':r'\bfunction\s+edgeIndex\s*\(','aas_face_t':r'\bstruct\s+Face\b','aas_faceindex_t':r'\bfunction\s+faceIndex\s*\(',
    'aas_area_t':r'\bstruct\s+Area\b','aas_node_t':r'\bstruct\s+Node\b','aas_lump_t':r'\bstruct\s+Lump\b','aas_header_t':r'\bstruct\s+Header\b',
}
STRIDES=(32,12,20,8,4,24,4,48,28,44,12,20,4,16)

def fixture(version: int) -> bytes:
    lumps=[
        struct.pack('<ii6f',2,0,-16,-16,-24,16,16,32),
        struct.pack('<6f',1,2,3,4,5,6),
        struct.pack('<4fi',0,0,1,64,2),
        struct.pack('<4i',0,0,0,1),struct.pack('<i',1),
        struct.pack('<12i',0,0,0,0,0,0,0,4,1,0,0,1),struct.pack('<i',1),
        struct.pack('<3i9f',0,0,0,0,0,0,0,0,0,0,0,0)+struct.pack('<3i9f',1,1,0,-8,-8,-8,8,8,16,0,0,4),
        struct.pack('<14i',0,0,0,0,0,0,0,0,1,2,0,1,1,1),
        struct.pack('<3i6fiH2x',0,0,0,0,0,0,0,0,0,0,0)+struct.pack('<3i6fiH2x',1,1,1,1,2,3,4,5,6,2,5),
        struct.pack('<6i',0,0,0,0,-1,0),struct.pack('<5i',0,0,0,0,0),b'',struct.pack('<4i',0,0,0,0),
    ]
    header=bytearray(124);struct.pack_into('<III',header,0,0x53414145,version,0x12345678);offset=124
    for index,blob in enumerate(lumps): struct.pack_into('<II',header,12+index*8,offset,len(blob));offset+=len(blob)
    if version==5:
        for index in range(116): header[8+index]^=(index*119)&255
    return bytes(header)+b''.join(lumps)

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/be_aas_file_complete';out.mkdir(parents=True,exist_ok=True)
    original_c=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_file.c';original_h=ROOT/'Quake-III-Arena-original-source/code/botlib/aasfile.h'
    port_c=ROOT/'src/mq3/botlib/be_aas_file.ml';port_h=ROOT/'src/mq3/format/aas.ml';c_text=port_c.read_text(encoding='utf-8');h_text=port_h.read_text(encoding='utf-8')
    missing=[name for name in FUNCTIONS if not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',c_text)]
    if missing: raise RuntimeError('missing be_aas_file symbols: '+', '.join(missing))
    defines=re.findall(r'^#define\s+([A-Z][A-Z0-9_]*)',original_h.read_text(encoding='utf-8'),re.M)
    missing=[name for name in defines if not re.search(r'\bconst\s+'+re.escape(name)+r'\s*=',h_text)]
    if missing: raise RuntimeError('missing aasfile.h constants: '+', '.join(missing))
    missing=[name for name,marker in TYPE_MARKERS.items() if not re.search(marker,h_text)]
    if missing: raise RuntimeError('missing aasfile.h layouts/accessors: '+', '.join(missing))
    native=out/'oracle.exe';run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',ROOT/'tests/reference/be_aas_file_complete_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native_text=run([native],out,log=out/'oracle.log').strip()
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/be_aas_file_complete_oracle.ml','--output','be_aas_file_complete_oracle.exe'],cwd=ROOT,check=True)
    port_text=run([ROOT/'build/be_aas_file_complete_oracle.exe'],ROOT/'build',log=out/'port-oracle.log').strip()
    if port_text!=native_text: raise RuntimeError('AAS file oracle mismatch\nC:\n'+native_text+'\nMiniLang:\n'+port_text)
    v4=out/'synthetic-v4.aas';v5=out/'synthetic-v5.aas';v4.write_bytes(fixture(4));v5.write_bytes(fixture(5))
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/be_aas_file_complete_contracts.ml','--output','be_aas_file_complete_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/be_aas_file_complete_contracts.exe',v4,v5],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 23 complete be_aas_file/aasfile contracts': raise RuntimeError(contracts)
    retail=None
    if args.data_root:
        pak=args.data_root/'baseq3/pak0.pk3'
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/be_aas_file_complete_retail_probe.ml','--output','be_aas_file_complete_retail_probe.exe'],cwd=ROOT,check=True)
        retail=run([ROOT/'build/be_aas_file_complete_retail_probe.exe',pak],ROOT/'build',log=out/'retail.log').strip()
        if retail!='PASS: retail AAS file roundtrips=30 bytes=59580980 records=6235985': raise RuntimeError(retail)
    sources=[original_h,original_c,port_h,port_c,ROOT/'tests/reference/be_aas_file_complete_oracle.c',ROOT/'tests/be_aas_file_complete_oracle.ml',ROOT/'tests/be_aas_file_complete_contracts.ml',ROOT/'tests/be_aas_file_complete_retail_probe.ml']
    result={'passed':True,'functions':len(FUNCTIONS),'header_constants':len(defines),'header_types':len(HEADER_TYPES),'oracle_lines':len(native_text.splitlines()),'contracts':23,'retail':retail,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(FUNCTIONS)}/8 be_aas_file symbols + {len(defines)} aasfile constants / {len(HEADER_TYPES)} layouts + 2 unchanged-C oracle records + 23 contracts')
    if retail: print(retail)
    return 0

if __name__=='__main__': raise SystemExit(main())
