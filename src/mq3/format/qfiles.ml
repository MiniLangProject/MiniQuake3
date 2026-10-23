// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete public file-format ABI from code/qcommon/qfiles.h.
package mq3.format.qfiles

const SHADER_MAX_VERTEXES=1000
const SHADER_MAX_INDEXES=6000
const MAX_QPATH=64
const VM_MAGIC=0x12721444

const MD3_IDENT=0x33504449
const MD3_VERSION=15
const MD3_MAX_LODS=3
const MD3_MAX_TRIANGLES=8192
const MD3_MAX_VERTS=4096
const MD3_MAX_SHADERS=256
const MD3_MAX_FRAMES=1024
const MD3_MAX_SURFACES=32
const MD3_MAX_TAGS=16
const MD3_XYZ_SCALE=0.015625

const MD4_IDENT=0x34504449
const MD4_VERSION=1
const MD4_MAX_BONES=128

const BSP_IDENT=0x50534249
const BSP_VERSION=46
const MAX_MAP_MODELS=0x400
const MAX_MAP_BRUSHES=0x8000
const MAX_MAP_ENTITIES=0x800
const MAX_MAP_ENTSTRING=0x40000
const MAX_MAP_SHADERS=0x400
const MAX_MAP_AREAS=0x100
const MAX_MAP_FOGS=0x100
const MAX_MAP_PLANES=0x20000
const MAX_MAP_NODES=0x20000
const MAX_MAP_BRUSHSIDES=0x20000
const MAX_MAP_LEAFS=0x20000
const MAX_MAP_LEAFFACES=0x20000
const MAX_MAP_LEAFBRUSHES=0x40000
const MAX_MAP_PORTALS=0x20000
const MAX_MAP_LIGHTING=0x800000
const MAX_MAP_LIGHTGRID=0x800000
const MAX_MAP_VISIBILITY=0x200000
const MAX_MAP_DRAW_SURFS=0x20000
const MAX_MAP_DRAW_VERTS=0x80000
const MAX_MAP_DRAW_INDEXES=0x80000
const MAX_KEY=32
const MAX_VALUE=1024
const ANGLE_UP=-1
const ANGLE_DOWN=-2
const LIGHTMAP_WIDTH=128
const LIGHTMAP_HEIGHT=128
const MAX_WORLD_COORD=131072
const MIN_WORLD_COORD=-131072
const WORLD_SIZE=262144

const LUMP_ENTITIES=0
const LUMP_SHADERS=1
const LUMP_PLANES=2
const LUMP_NODES=3
const LUMP_LEAFS=4
const LUMP_LEAFSURFACES=5
const LUMP_LEAFBRUSHES=6
const LUMP_MODELS=7
const LUMP_BRUSHES=8
const LUMP_BRUSHSIDES=9
const LUMP_DRAWVERTS=10
const LUMP_DRAWINDEXES=11
const LUMP_FOGS=12
const LUMP_SURFACES=13
const LUMP_LIGHTMAPS=14
const LUMP_LIGHTGRID=15
const LUMP_VISIBILITY=16
const HEADER_LUMPS=17

const MST_BAD=0
const MST_PLANAR=1
const MST_PATCH=2
const MST_TRIANGLE_SOUP=3
const MST_FLARE=4

// Managed mirrors keep the original member order. Variable-sized tails are
// represented by ordinary arrays and all on-disk decoding remains explicit.
struct VmHeader vmMagic instructionCount codeOffset codeLength dataOffset dataLength litLength bssLength end struct
struct Pcx manufacturer version encoding bitsPerPixel xmin ymin xmax ymax hres vres palette reserved colorPlanes bytesPerLine paletteType filler data end struct
struct TargaHeader idLength colormapType imageType colormapIndex colormapLength colormapSize xOrigin yOrigin width height pixelSize attributes end struct
struct Md3Frame bounds localOrigin radius name end struct
struct Md3Tag name origin axis end struct
struct Md3Surface ident name flags numFrames numShaders numVerts numTriangles ofsTriangles ofsShaders ofsSt ofsXyzNormals ofsEnd end struct
struct Md3Shader name shaderIndex end struct
struct Md3Triangle indexes end struct
struct Md3St st end struct
struct Md3XyzNormal xyz normal end struct
struct Md3Header ident version name flags numFrames numTags numSurfaces numSkins ofsFrames ofsTags ofsSurfaces ofsEnd end struct
struct Md4Weight boneIndex boneWeight offset end struct
struct Md4Vertex normal texCoords numWeights weights end struct
struct Md4Triangle indexes end struct
struct Md4Surface ident name shader shaderIndex ofsHeader numVerts ofsVerts numTriangles ofsTriangles numBoneReferences ofsBoneReferences ofsEnd end struct
struct Md4Bone matrix end struct
struct Md4Frame bounds localOrigin radius bones end struct
struct Md4Lod numSurfaces ofsSurfaces ofsEnd end struct
struct Md4Header ident version name numFrames numBones ofsBoneNames ofsFrames numLods ofsLods ofsEnd end struct
struct Lump fileofs filelen end struct
struct Dheader ident version lumps end struct
struct Dmodel mins maxs firstSurface numSurfaces firstBrush numBrushes end struct
struct Dshader shader surfaceFlags contentFlags end struct
struct Dplane normal dist end struct
struct Dnode planeNum children mins maxs end struct
struct Dleaf cluster area mins maxs firstLeafSurface numLeafSurfaces firstLeafBrush numLeafBrushes end struct
struct Dbrushside planeNum shaderNum end struct
struct Dbrush firstSide numSides shaderNum end struct
struct Dfog shader brushNum visibleSide end struct
struct DrawVert xyz st lightmap normal color end struct
struct Dsurface shaderNum fogNum surfaceType firstVert numVerts firstIndex numIndexes lightmapNum lightmapX lightmapY lightmapWidth lightmapHeight lightmapOrigin lightmapVecs patchWidth patchHeight end struct

function typeNames()
  return ["vmHeader_t","pcx_t","TargaHeader","md3Frame_t","md3Tag_t","md3Surface_t","md3Shader_t","md3Triangle_t","md3St_t","md3XyzNormal_t","md3Header_t","md4Weight_t","md4Vertex_t","md4Triangle_t","md4Surface_t","md4Bone_t","md4Frame_t","md4LOD_t","md4Header_t","lump_t","dheader_t","dmodel_t","dshader_t","dplane_t","dnode_t","dleaf_t","dbrushside_t","dbrush_t","dfog_t","drawVert_t","mapSurfaceType_t","dsurface_t"]
end function

function lumpRange(header,index,totalSize)
  if header==void or index<0 or index>=len(header.lumps) then return error(7951,"qfiles lump index") end if
  lump=header.lumps[index];if lump.fileofs<0 or lump.filelen<0 or lump.filelen>totalSize or lump.fileofs>totalSize-lump.filelen then return error(7951,"qfiles lump range") end if
  return [lump.fileofs,lump.filelen]
end function
