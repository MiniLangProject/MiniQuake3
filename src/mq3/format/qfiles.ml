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
/// Pcx record for format.qfiles, containing `manufacturer`, `version`, `encoding`, `bitsPerPixel`, `xmin`, `ymin`, and 11 further fields.
struct Pcx manufacturer version encoding bitsPerPixel xmin ymin xmax ymax hres vres palette reserved colorPlanes bytesPerLine paletteType filler data end struct
/// TargaHeader record for format.qfiles, containing `idLength`, `colormapType`, `imageType`, `colormapIndex`, `colormapLength`, `colormapSize`, and 6 further fields.
struct TargaHeader idLength colormapType imageType colormapIndex colormapLength colormapSize xOrigin yOrigin width height pixelSize attributes end struct
/// Md3Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `name`.
struct Md3Frame bounds localOrigin radius name end struct
/// Md3Tag record for format.qfiles, containing `name`, `origin`, `axis`.
struct Md3Tag name origin axis end struct
/// Md3Surface record for format.qfiles, containing `ident`, `name`, `flags`, `numFrames`, `numShaders`, `numVerts`, and 6 further fields.
struct Md3Surface ident name flags numFrames numShaders numVerts numTriangles ofsTriangles ofsShaders ofsSt ofsXyzNormals ofsEnd end struct
/// Md3Shader record for format.qfiles, containing `name`, `shaderIndex`.
struct Md3Shader name shaderIndex end struct
/// Md3Triangle record for format.qfiles, containing `indexes`.
struct Md3Triangle indexes end struct
/// Md3St record for format.qfiles, containing `st`.
struct Md3St st end struct
/// Md3XyzNormal record for format.qfiles, containing `xyz`, `normal`.
struct Md3XyzNormal xyz normal end struct
/// Md3Header record for format.qfiles, containing `ident`, `version`, `name`, `flags`, `numFrames`, `numTags`, and 6 further fields.
struct Md3Header ident version name flags numFrames numTags numSurfaces numSkins ofsFrames ofsTags ofsSurfaces ofsEnd end struct
/// Md4Weight record for format.qfiles, containing `boneIndex`, `boneWeight`, `offset`.
struct Md4Weight boneIndex boneWeight offset end struct
/// Md4Vertex record for format.qfiles, containing `normal`, `texCoords`, `numWeights`, `weights`.
struct Md4Vertex normal texCoords numWeights weights end struct
/// Md4Triangle record for format.qfiles, containing `indexes`.
struct Md4Triangle indexes end struct
/// Md4Surface record for format.qfiles, containing `ident`, `name`, `shader`, `shaderIndex`, `ofsHeader`, `numVerts`, and 6 further fields.
struct Md4Surface ident name shader shaderIndex ofsHeader numVerts ofsVerts numTriangles ofsTriangles numBoneReferences ofsBoneReferences ofsEnd end struct
/// Md4Bone record for format.qfiles, containing `matrix`.
struct Md4Bone matrix end struct
/// Md4Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `bones`.
struct Md4Frame bounds localOrigin radius bones end struct
/// Md4Lod record for format.qfiles, containing `numSurfaces`, `ofsSurfaces`, `ofsEnd`.
struct Md4Lod numSurfaces ofsSurfaces ofsEnd end struct
/// Md4Header record for format.qfiles, containing `ident`, `version`, `name`, `numFrames`, `numBones`, `ofsBoneNames`, and 4 further fields.
struct Md4Header ident version name numFrames numBones ofsBoneNames ofsFrames numLods ofsLods ofsEnd end struct
/// Lump record for format.qfiles, containing `fileofs`, `filelen`.
struct Lump fileofs filelen end struct
/// Dheader record for format.qfiles, containing `ident`, `version`, `lumps`.
struct Dheader ident version lumps end struct
/// Dmodel record for format.qfiles, containing `mins`, `maxs`, `firstSurface`, `numSurfaces`, `firstBrush`, `numBrushes`.
struct Dmodel mins maxs firstSurface numSurfaces firstBrush numBrushes end struct
/// Dshader record for format.qfiles, containing `shader`, `surfaceFlags`, `contentFlags`.
struct Dshader shader surfaceFlags contentFlags end struct
/// Dplane record for format.qfiles, containing `normal`, `dist`.
struct Dplane normal dist end struct
/// Dnode record for format.qfiles, containing `planeNum`, `children`, `mins`, `maxs`.
struct Dnode planeNum children mins maxs end struct
/// Dleaf record for format.qfiles, containing `cluster`, `area`, `mins`, `maxs`, `firstLeafSurface`, `numLeafSurfaces`, and 2 further fields.
struct Dleaf cluster area mins maxs firstLeafSurface numLeafSurfaces firstLeafBrush numLeafBrushes end struct
/// Dbrushside record for format.qfiles, containing `planeNum`, `shaderNum`.
struct Dbrushside planeNum shaderNum end struct
/// Dbrush record for format.qfiles, containing `firstSide`, `numSides`, `shaderNum`.
struct Dbrush firstSide numSides shaderNum end struct
/// Dfog record for format.qfiles, containing `shader`, `brushNum`, `visibleSide`.
struct Dfog shader brushNum visibleSide end struct
/// DrawVert record for format.qfiles, containing `xyz`, `st`, `lightmap`, `normal`, `color`.
struct DrawVert xyz st lightmap normal color end struct
/// Dsurface record for format.qfiles, containing `shaderNum`, `fogNum`, `surfaceType`, `firstVert`, `numVerts`, `firstIndex`, and 10 further fields.
struct Dsurface shaderNum fogNum surfaceType firstVert numVerts firstIndex numIndexes lightmapNum lightmapX lightmapY lightmapWidth lightmapHeight lightmapOrigin lightmapVecs patchWidth patchHeight end struct

/// List the 32 names in format.qfiles.typeNames, beginning with `vmHeader_t`, `pcx_t`, `TargaHeader`, `md3Frame_t`.
function typeNames()
  return ["vmHeader_t","pcx_t","TargaHeader","md3Frame_t","md3Tag_t","md3Surface_t","md3Shader_t","md3Triangle_t","md3St_t","md3XyzNormal_t","md3Header_t","md4Weight_t","md4Vertex_t","md4Triangle_t","md4Surface_t","md4Bone_t","md4Frame_t","md4LOD_t","md4Header_t","lump_t","dheader_t","dmodel_t","dshader_t","dplane_t","dnode_t","dleaf_t","dbrushside_t","dbrush_t","dfog_t","drawVert_t","mapSurfaceType_t","dsurface_t"]
end function

/// Compute lump range in format.qfiles; the normal completion returns `[lump.fileofs, lump.filelen]`.
///
/// Validation failures include `qfiles lump index`; `qfiles lump range`.
/// @param header Record exposing `lumps`.
/// @param index Zero-based index into `header.lumps`.
/// @param totalSize Total size used in `(lump.filelen > totalSize)` and `(totalSize - lump.filelen)`.
function lumpRange(header,index,totalSize)
  if header==void or index<0 or index>=len(header.lumps) then return error(7951,"qfiles lump index") end if
  lump=header.lumps[index];if lump.fileofs<0 or lump.filelen<0 or lump.filelen>totalSize or lump.fileofs>totalSize-lump.filelen then return error(7951,"qfiles lump range") end if
  return [lump.fileofs,lump.filelen]
end function
