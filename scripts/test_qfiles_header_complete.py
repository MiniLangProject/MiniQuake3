#!/usr/bin/env python3
"""Complete qfiles.h constants, layouts and managed format ownership gate."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

TYPES=("vmHeader_t","pcx_t","TargaHeader","md3Frame_t","md3Tag_t","md3Surface_t","md3Shader_t","md3Triangle_t","md3St_t","md3XyzNormal_t","md3Header_t","md4Weight_t","md4Vertex_t","md4Triangle_t","md4Surface_t","md4Bone_t","md4Frame_t","md4LOD_t","md4Header_t","lump_t","dheader_t","dmodel_t","dshader_t","dplane_t","dnode_t","dleaf_t","dbrushside_t","dbrush_t","dfog_t","drawVert_t","mapSurfaceType_t","dsurface_t")
CONSTANTS=("SHADER_MAX_VERTEXES","SHADER_MAX_INDEXES","MAX_QPATH","VM_MAGIC","MD3_IDENT","MD3_VERSION","MD3_MAX_LODS","MD3_MAX_TRIANGLES","MD3_MAX_VERTS","MD3_MAX_SHADERS","MD3_MAX_FRAMES","MD3_MAX_SURFACES","MD3_MAX_TAGS","MD3_XYZ_SCALE","MD4_IDENT","MD4_VERSION","MD4_MAX_BONES","BSP_IDENT","BSP_VERSION","MAX_MAP_MODELS","MAX_MAP_BRUSHES","MAX_MAP_ENTITIES","MAX_MAP_ENTSTRING","MAX_MAP_SHADERS","MAX_MAP_AREAS","MAX_MAP_FOGS","MAX_MAP_PLANES","MAX_MAP_NODES","MAX_MAP_BRUSHSIDES","MAX_MAP_LEAFS","MAX_MAP_LEAFFACES","MAX_MAP_LEAFBRUSHES","MAX_MAP_PORTALS","MAX_MAP_LIGHTING","MAX_MAP_LIGHTGRID","MAX_MAP_VISIBILITY","MAX_MAP_DRAW_SURFS","MAX_MAP_DRAW_VERTS","MAX_MAP_DRAW_INDEXES","MAX_KEY","MAX_VALUE","ANGLE_UP","ANGLE_DOWN","LIGHTMAP_WIDTH","LIGHTMAP_HEIGHT","MAX_WORLD_COORD","MIN_WORLD_COORD","WORLD_SIZE","HEADER_LUMPS","MST_BAD","MST_PLANAR","MST_PATCH","MST_TRIANGLE_SOUP","MST_FLARE")

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/qfiles_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/qcommon/qfiles.h';port=ROOT/'src/mq3/format/qfiles.ml'
 original=header.read_text(encoding='latin1');native=port.read_text(encoding='utf-8')
 missing_source=[name for name in TYPES+CONSTANTS if not re.search(r'\b'+re.escape(name)+r'\b',original)]
 missing_port=[name for name in TYPES if name not in native]+[name for name in CONSTANTS if not re.search(r'\bconst\s+'+re.escape(name)+r'\b',native)]
 if missing_source or missing_port: raise RuntimeError(f'qfiles.h coverage source={missing_source} port={missing_port}')
 oracle=out/'qfiles_header_oracle.exe'
 run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/qfiles_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n')
 actual=run([build('tests/qfiles_header_oracle.ml','qfiles_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('qfiles.h unchanged-C mismatch')
 contracts=run([build('tests/qfiles_header_contracts.ml','qfiles_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 15 qfiles.h ABI contracts': raise RuntimeError(contracts)
 files=[header,port,ROOT/'tests/reference/qfiles_header_oracle.c',ROOT/'tests/qfiles_header_oracle.ml',ROOT/'tests/qfiles_header_contracts.ml']
 result={'passed':True,'types':len(TYPES),'constants':len(CONSTANTS),'exact_records':len(expected.splitlines()),'contracts':15,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: qfiles.h {len(TYPES)} ABI types + {len(CONSTANTS)} constants + {len(expected.splitlines())} exact records + 15 contracts')
if __name__=='__main__':main()
