#include <stddef.h>
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/qcommon/qfiles.h"

int main(void) {
  printf("magic %u %u %u %u %d %d\n", VM_MAGIC, MD3_IDENT, MD4_IDENT, BSP_IDENT, MD3_VERSION, BSP_VERSION);
  printf("limits %d %d %d %d %d %d %d %d\n", SHADER_MAX_VERTEXES, SHADER_MAX_INDEXES, MD3_MAX_TRIANGLES, MD3_MAX_VERTS, MD3_MAX_FRAMES, MAX_MAP_ENTITIES, MAX_MAP_DRAW_VERTS, MAX_MAP_DRAW_INDEXES);
  printf("world %d %d %d %d %d %d\n", MIN_WORLD_COORD, MAX_WORLD_COORD, WORLD_SIZE, LIGHTMAP_WIDTH, LIGHTMAP_HEIGHT, HEADER_LUMPS);
  printf("lumps %d %d %d %d %d %d\n", LUMP_ENTITIES, LUMP_DRAWVERTS, LUMP_DRAWINDEXES, LUMP_SURFACES, LUMP_LIGHTGRID, LUMP_VISIBILITY);
  printf("sizes1 %u %u %u %u %u %u %u %u\n", (unsigned)sizeof(vmHeader_t), (unsigned)sizeof(pcx_t), (unsigned)sizeof(TargaHeader), (unsigned)sizeof(md3Frame_t), (unsigned)sizeof(md3Tag_t), (unsigned)sizeof(md3Surface_t), (unsigned)sizeof(md3Shader_t), (unsigned)sizeof(md3Header_t));
  printf("sizes2 %u %u %u %u %u %u %u %u\n", (unsigned)sizeof(md4Weight_t), (unsigned)sizeof(md4Vertex_t), (unsigned)sizeof(md4Surface_t), (unsigned)sizeof(md4Bone_t), (unsigned)sizeof(md4Frame_t), (unsigned)sizeof(md4LOD_t), (unsigned)sizeof(md4Header_t), (unsigned)sizeof(lump_t));
  printf("sizes3 %u %u %u %u %u %u %u %u\n", (unsigned)sizeof(dheader_t), (unsigned)sizeof(dmodel_t), (unsigned)sizeof(dshader_t), (unsigned)sizeof(dplane_t), (unsigned)sizeof(dnode_t), (unsigned)sizeof(dleaf_t), (unsigned)sizeof(dbrushside_t), (unsigned)sizeof(dbrush_t));
  printf("sizes4 %u %u %u %u\n", (unsigned)sizeof(dfog_t), (unsigned)sizeof(drawVert_t), (unsigned)sizeof(dsurface_t), (unsigned)offsetof(dsurface_t, patchWidth));
  return 0;
}
