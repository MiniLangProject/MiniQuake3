// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete public file-format ABI from code/qcommon/qfiles.h.
package mq3.format.qfiles

/// Maximum number of vertices retained in a shader surface batch.
const SHADER_MAX_VERTEXES=1000
/// Maximum number of index elements retained in a shader surface batch.
const SHADER_MAX_INDEXES=6000
/// Maximum character capacity reserved for a Quake asset path.
const MAX_QPATH=64
/// Magic value identifying the supported QVM bytecode format.
const VM_MAGIC=0x12721444

/// Magic value identifying an MD3 animated model.
const MD3_IDENT=0x33504449
/// Serialized format or interface version expected by qfiles.
const MD3_VERSION=15
/// Maximum number of lods supported by the MD3 model format.
const MD3_MAX_LODS=3
/// Maximum number of triangles supported by the MD3 model format.
const MD3_MAX_TRIANGLES=8192
/// Maximum number of verts supported by the MD3 model format.
const MD3_MAX_VERTS=4096
/// Maximum number of shaders supported by the MD3 model format.
const MD3_MAX_SHADERS=256
/// Maximum number of frames supported by the MD3 model format.
const MD3_MAX_FRAMES=1024
/// Maximum number of surfaces supported by the MD3 model format.
const MD3_MAX_SURFACES=32
/// Maximum number of tags supported by the MD3 model format.
const MD3_MAX_TAGS=16
/// Scale converting stored MD3 vertex coordinates to model-space units.
const MD3_XYZ_SCALE=0.015625

/// Magic value identifying an MD4 skinned model.
const MD4_IDENT=0x34504449
/// Serialized format or interface version expected by qfiles.
const MD4_VERSION=1
/// Maximum number of bones supported by the MD4 model format.
const MD4_MAX_BONES=128

/// Magic value identifying a Quake III BSP map.
const BSP_IDENT=0x50534249
/// Serialized format or interface version expected by qfiles.
const BSP_VERSION=46
/// Maximum number of inline BSP model records supported by the BSP format.
const MAX_MAP_MODELS=0x400
/// Maximum number of collision brush records supported by the BSP format.
const MAX_MAP_BRUSHES=0x8000
/// Maximum number of map entity definitions supported by the BSP format.
const MAX_MAP_ENTITIES=0x800
/// Maximum byte size of map entity text in the BSP format.
const MAX_MAP_ENTSTRING=0x40000
/// Maximum number of BSP shader references supported by the BSP format.
const MAX_MAP_SHADERS=0x400
/// MAX_MAP_AREA_BYTES in q_shared must match!
const MAX_MAP_AREAS=0x100
/// Maximum number of fog volume records supported by the BSP format.
const MAX_MAP_FOGS=0x100
/// Maximum number of BSP plane records supported by the BSP format.
const MAX_MAP_PLANES=0x20000
/// Maximum number of BSP tree nodes supported by the BSP format.
const MAX_MAP_NODES=0x20000
/// Maximum number of collision brush sides supported by the BSP format.
const MAX_MAP_BRUSHSIDES=0x20000
/// Maximum number of BSP leaf records supported by the BSP format.
const MAX_MAP_LEAFS=0x20000
/// Maximum number of surface references in BSP leaves supported by the BSP format.
const MAX_MAP_LEAFFACES=0x20000
/// Maximum number of brush references in BSP leaves supported by the BSP format.
const MAX_MAP_LEAFBRUSHES=0x40000
/// Maximum number of map portal records supported by the BSP format.
const MAX_MAP_PORTALS=0x20000
/// Maximum byte size of lightmap pixels in the BSP format.
const MAX_MAP_LIGHTING=0x800000
/// Maximum byte size of light-grid samples in the BSP format.
const MAX_MAP_LIGHTGRID=0x800000
/// Maximum byte size of cluster visibility data in the BSP format.
const MAX_MAP_VISIBILITY=0x200000
/// Maximum number of renderable surface records supported by the BSP format.
const MAX_MAP_DRAW_SURFS=0x20000
/// Maximum number of renderable vertex records supported by the BSP format.
const MAX_MAP_DRAW_VERTS=0x80000
/// Maximum number of triangle vertex indices supported by the BSP format.
const MAX_MAP_DRAW_INDEXES=0x80000
/// Maximum length of a key in the BSP entity text.
const MAX_KEY=32
/// Maximum length of a value in the BSP entity text.
const MAX_VALUE=1024
/// Special entity-angle value indicating a vertically upward direction.
const ANGLE_UP=-1
/// Special entity-angle value indicating a vertically downward direction.
const ANGLE_DOWN=-2
/// Width in texels of one BSP lightmap image.
const LIGHTMAP_WIDTH=128
/// Height in texels of one BSP lightmap image.
const LIGHTMAP_HEIGHT=128
/// Largest accepted coordinate component for map geometry.
const MAX_WORLD_COORD=131072
/// Smallest accepted coordinate component for map geometry.
const MIN_WORLD_COORD=-131072
/// Serialized byte size of world in this file format.
const WORLD_SIZE=262144

/// Lump-directory index for entities in the serialized map.
const LUMP_ENTITIES=0
/// Lump-directory index for shaders in the serialized map.
const LUMP_SHADERS=1
/// Lump-directory index for planes in the serialized map.
const LUMP_PLANES=2
/// Lump-directory index for nodes in the serialized map.
const LUMP_NODES=3
/// Lump-directory index for leafs in the serialized map.
const LUMP_LEAFS=4
/// Lump-directory index for leafsurfaces in the serialized map.
const LUMP_LEAFSURFACES=5
/// Lump-directory index for leafbrushes in the serialized map.
const LUMP_LEAFBRUSHES=6
/// Lump-directory index for models in the serialized map.
const LUMP_MODELS=7
/// Lump-directory index for brushes in the serialized map.
const LUMP_BRUSHES=8
/// Lump-directory index for brushsides in the serialized map.
const LUMP_BRUSHSIDES=9
/// Lump-directory index for drawverts in the serialized map.
const LUMP_DRAWVERTS=10
/// Lump-directory index for drawindexes in the serialized map.
const LUMP_DRAWINDEXES=11
/// Lump-directory index for fogs in the serialized map.
const LUMP_FOGS=12
/// Lump-directory index for surfaces in the serialized map.
const LUMP_SURFACES=13
/// Lump-directory index for lightmaps in the serialized map.
const LUMP_LIGHTMAPS=14
/// Lump-directory index for lightgrid in the serialized map.
const LUMP_LIGHTGRID=15
/// Lump-directory index for visibility in the serialized map.
const LUMP_VISIBILITY=16
/// Number of entries in the BSP file lump directory.
const HEADER_LUMPS=17

/// BSP surface-kind identifier for bad.
const MST_BAD=0
/// BSP surface-kind identifier for planar.
const MST_PLANAR=1
/// BSP surface-kind identifier for patch.
const MST_PATCH=2
/// BSP surface-kind identifier for triangle soup.
const MST_TRIANGLE_SOUP=3
/// BSP surface-kind identifier for flare.
const MST_FLARE=4

// Managed mirrors keep the original member order. Variable-sized tails are
// represented by ordinary arrays and all on-disk decoding remains explicit.
struct VmHeader
  /// Magic value identifying the supported QVM bytecode format.
  vmMagic
  /// Number of instructions declared by the QVM bytecode header.
  instructionCount
  /// Byte offset of QVM instructions from the beginning of the file.
  codeOffset
  /// Length of the QVM instruction section in bytes.
  codeLength
  /// Byte offset of initialized QVM data from the beginning of the file.
  dataOffset
  /// Length of the initialized QVM data section in bytes.
  dataLength
  /// Byte length of the literal-data region that must not be byte-swapped.
  litLength
  /// Size in bytes of the zero-initialized memory appended after the file data.
  bssLength
end struct
/// Pcx record for format.qfiles, containing `manufacturer`, `version`, `encoding`, `bitsPerPixel`, `xmin`, `ymin`, and 11 further fields.
struct Pcx
  /// PCX manufacturer marker identifying the file format.
  manufacturer
  /// PCX file-format version stored in the header.
  version
  /// PCX pixel-data encoding identifier.
  encoding
  /// Number of bits per pixel in each PCX color plane.
  bitsPerPixel
  /// Minimum horizontal image coordinate stored in the PCX header.
  xmin
  /// Minimum vertical image coordinate stored in the PCX header.
  ymin
  /// Maximum horizontal image coordinate stored in the PCX header.
  xmax
  /// Maximum vertical image coordinate stored in the PCX header.
  ymax
  /// Nominal horizontal image resolution stored in the PCX header.
  hres
  /// Nominal vertical image resolution stored in the PCX header.
  vres
  /// PCX header color-palette entries.
  palette
  /// Reserved PCX header byte retained for format compatibility.
  reserved
  /// Number of separately encoded PCX color planes.
  colorPlanes
  /// Encoded bytes reserved for each PCX scanline in one color plane.
  bytesPerLine
  /// PCX palette interpretation identifier.
  paletteType
  /// Reserved padding bytes in the PCX file header.
  filler
  /// Encoded PCX image data following the header.
  data
end struct
/// TargaHeader record for format.qfiles, containing `idLength`, `colormapType`, `imageType`, `colormapIndex`, `colormapLength`, `colormapSize`, and 6 further fields.
struct TargaHeader
  /// Length in bytes of the TGA image-identification string.
  idLength
  /// TGA color-map presence flag.
  colormapType
  /// TGA image encoding type.
  imageType
  /// Index of the first entry in the TGA color map.
  colormapIndex
  /// Number of entries in the TGA color map.
  colormapLength
  /// Bits stored for each entry in the TGA color map.
  colormapSize
  /// Horizontal image-origin coordinate stored in the TGA header.
  xOrigin
  /// Vertical image-origin coordinate stored in the TGA header.
  yOrigin
  /// Image width in pixels.
  width
  /// Image height in pixels.
  height
  /// Bits stored for each TGA image pixel.
  pixelSize
  /// TGA descriptor bits controlling orientation and attribute depth.
  attributes
end struct
/// Md3Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `name`.
struct Md3Frame
  /// Model-local minimum and maximum corners enclosing every surface in this frame.
  bounds
  /// Model-local center used for the frame bounding sphere.
  localOrigin
  /// Radius of the represented sphere or capsule.
  radius
  /// Frame name stored in the MD3 animation record.
  name
end struct
/// Md3Tag record for format.qfiles, containing `name`, `origin`, `axis`.
struct Md3Tag
  /// Attachment-tag name used to connect model parts.
  name
  /// Model-space position of this attachment tag.
  origin
  /// Three orientation axes defining the local coordinate frame.
  axis
end struct
/// Md3Surface record for format.qfiles, containing `ident`, `name`, `flags`, `numFrames`, `numShaders`, `numVerts`, and 6 further fields.
struct Md3Surface
  /// MD3 signature stored in this surface record.
  ident
  /// Surface name used to associate geometry with a skin.
  name
  /// Raw surface flags preserved from the MD3 file.
  flags
  /// Number of animation frames represented by this model, surface, or animation.
  numFrames
  /// Number of shader references stored for this model surface.
  numShaders
  /// Number of vertices described by this surface.
  numVerts
  /// Number of indexed triangles in this surface.
  numTriangles
  /// Byte offset of the triangle-index table from the start of the surface.
  ofsTriangles
  /// Byte offset from this surface header to its shader references.
  ofsShaders
  /// Byte offset from this surface header to texture coordinates shared by all frames.
  ofsSt
  /// Byte offset from this surface header to the per-frame packed positions and normals.
  ofsXyzNormals
  /// Byte offset of the end of this serialized record, relative to its start.
  ofsEnd
end struct
/// Md3Shader record for format.qfiles, containing `name`, `shaderIndex`.
struct Md3Shader
  /// Shader asset name referenced by the MD3 surface.
  name
  /// Runtime renderer shader handle associated with this model material.
  shaderIndex
end struct
/// Md3Triangle record for format.qfiles, containing `indexes`.
struct Md3Triangle
  /// Three vertex indexes defining the triangle.
  indexes
end struct
/// Md3St record for format.qfiles, containing `st`.
struct Md3St
  /// Two-dimensional texture coordinates.
  st
end struct
/// Md3XyzNormal record for format.qfiles, containing `xyz`, `normal`.
struct Md3XyzNormal
  /// XYZ position components stored by this vertex record.
  xyz
  /// Packed 16-bit latitude and longitude encoding of this MD3 vertex normal.
  normal
end struct
/// Md3Header record for format.qfiles, containing `ident`, `version`, `name`, `flags`, `numFrames`, `numTags`, and 6 further fields.
struct Md3Header
  /// Magic value identifying the MD3 model file.
  ident
  /// MD3 file-format version.
  version
  /// Model name stored in the MD3 header.
  name
  /// Raw model flags preserved from the MD3 header.
  flags
  /// Number of animation frames represented by this model, surface, or animation.
  numFrames
  /// Number of attachment tags stored for each model frame.
  numTags
  /// Number of surfaces described by this model or file record.
  numSurfaces
  /// Number of skin slots declared by the model header.
  numSkins
  /// Byte offset from the file header to the frame records.
  ofsFrames
  /// Byte offset from the file header to the attachment tags for all frames.
  ofsTags
  /// Byte offset from the file header to the first mesh surface.
  ofsSurfaces
  /// Byte offset of the end of this serialized record, relative to its start.
  ofsEnd
end struct
/// Md4Weight record for format.qfiles, containing `boneIndex`, `boneWeight`, `offset`.
struct Md4Weight
  /// Index into the surface bone-reference table for this skinning influence.
  boneIndex
  /// Fraction of the vertex position contributed by this bone influence.
  boneWeight
  /// Bone-local XYZ position transformed by this skinning weight.
  offset
end struct
/// Md4Vertex record for format.qfiles, containing `normal`, `texCoords`, `numWeights`, `weights`.
struct Md4Vertex
  /// Model-local normal vector blended with the skeletal vertex influences.
  normal
  /// Texture coordinates associated with the represented vertex or triangle.
  texCoords
  /// Number of bone weights attached to this skinned vertex.
  numWeights
  /// Bone weights that transform this skinned vertex.
  weights
end struct
/// Md4Triangle record for format.qfiles, containing `indexes`.
struct Md4Triangle
  /// Three vertex indexes defining the skinned triangle.
  indexes
end struct
/// Md4Surface record for format.qfiles, containing `ident`, `name`, `shader`, `shaderIndex`, `ofsHeader`, `numVerts`, and 6 further fields.
struct Md4Surface
  /// MD4 signature stored in this surface record.
  ident
  /// Name identifying the skinned surface.
  name
  /// Shader name or descriptor associated with this surface.
  shader
  /// Runtime renderer shader handle associated with this model material.
  shaderIndex
  /// Negative byte offset from this surface to the enclosing model header.
  ofsHeader
  /// Number of vertices described by this surface.
  numVerts
  /// Byte offset of the vertex table from the start of the surface.
  ofsVerts
  /// Number of indexed triangles in this surface.
  numTriangles
  /// Byte offset of the triangle-index table from the start of the surface.
  ofsTriangles
  /// Number of entries in the surface's bone-reference table.
  numBoneReferences
  /// Byte offset of the bone-reference table from the start of the surface.
  ofsBoneReferences
  /// Byte offset of the end of this serialized record, relative to its start.
  ofsEnd
end struct
/// Md4Bone record for format.qfiles, containing `matrix`.
struct Md4Bone
  /// Bone transform matrix stored for this animation frame.
  matrix
end struct
/// Md4Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `bones`.
struct Md4Frame
  /// Model-local minimum and maximum corners enclosing every surface and LOD in this frame.
  bounds
  /// Model-local center used for the frame bounding sphere.
  localOrigin
  /// Radius of the represented sphere or capsule.
  radius
  /// Bone transform matrices for this animation frame.
  bones
end struct
/// Md4Lod record for format.qfiles, containing `numSurfaces`, `ofsSurfaces`, `ofsEnd`.
struct Md4Lod
  /// Number of surfaces described by this model or file record.
  numSurfaces
  /// Byte offset from this LOD header to its first mesh surface.
  ofsSurfaces
  /// Byte offset of the end of this serialized record, relative to its start.
  ofsEnd
end struct
/// Md4Header record for format.qfiles, containing `ident`, `version`, `name`, `numFrames`, `numBones`, `ofsBoneNames`, and 4 further fields.
struct Md4Header
  /// Magic value identifying the MD4 model file.
  ident
  /// MD4 file-format version.
  version
  /// Model name stored in the MD4 header.
  name
  /// Number of animation frames represented by this model, surface, or animation.
  numFrames
  /// Number of skeleton bones represented by the model or frame.
  numBones
  /// Byte offset from the file header to fixed-length bone-name strings.
  ofsBoneNames
  /// Byte offset from the file header to the skeletal animation frames.
  ofsFrames
  /// Number of level-of-detail records in the model.
  numLods
  /// Byte offset of the level-of-detail table from the start of the model.
  ofsLods
  /// Byte offset of the end of this serialized record, relative to its start.
  ofsEnd
end struct
/// Lump record for format.qfiles, containing `fileofs`, `filelen`.
struct Lump
  /// Byte offset of the lump from the beginning of the file.
  fileofs
  /// Length of the serialized lump in bytes.
  filelen
end struct
/// Dheader record for format.qfiles, containing `ident`, `version`, `lumps`.
struct Dheader
  /// Magic value identifying the BSP map.
  ident
  /// BSP map-format version.
  version
  /// Directory records locating the BSP map data sections.
  lumps
end struct
/// Dmodel record for format.qfiles, containing `mins`, `maxs`, `firstSurface`, `numSurfaces`, `firstBrush`, `numBrushes`.
struct Dmodel
  /// Minimum XYZ corner of the inline model described by this serialized BSP record.
  mins
  /// Maximum XYZ corner of the inline model described by this serialized BSP record.
  maxs
  /// Index of the first surface belonging to this map model.
  firstSurface
  /// Number of surfaces described by this model or file record.
  numSurfaces
  /// Index of the first collision brush belonging to this map model.
  firstBrush
  /// Number of collision brushes referenced by this map element.
  numBrushes
end struct
/// Dshader record for format.qfiles, containing `shader`, `surfaceFlags`, `contentFlags`.
struct Dshader
  /// Shader name or descriptor associated with this surface.
  shader
  /// Surface-property flags reported for the intersected surface.
  surfaceFlags
  /// Contents bits describing collision and volume behavior.
  contentFlags
end struct
/// Dplane record for format.qfiles, containing `normal`, `dist`.
struct Dplane
  /// Unit normal of the splitting or brush plane stored in the BSP plane lump.
  normal
  /// Distance of the plane (normal vector * distance = point in plane).
  dist
end struct
/// Dnode record for format.qfiles, containing `planeNum`, `children`, `mins`, `maxs`.
struct Dnode
  /// BSP plane-lump index of the split represented by this serialized node.
  planeNum
  /// Child node indices, with negative values encoding minus one minus the BSP leaf index.
  children
  /// Minimum XYZ corner of the BSP subtree below this serialized node.
  mins
  /// Maximum XYZ corner of the BSP subtree below this serialized node.
  maxs
end struct
/// Dleaf record for format.qfiles, containing `cluster`, `area`, `mins`, `maxs`, `firstLeafSurface`, `numLeafSurfaces`, and 2 further fields.
struct Dleaf
  /// Visibility-cluster index of this leaf, or minus one for opaque space.
  cluster
  /// Portal-area index containing this BSP leaf.
  area
  /// Minimum XYZ corner of the region occupied by this serialized BSP leaf.
  mins
  /// Maximum XYZ corner of the region occupied by this serialized BSP leaf.
  maxs
  /// Index of the first surface reference for this BSP leaf.
  firstLeafSurface
  /// Number of surface references belonging to this BSP leaf.
  numLeafSurfaces
  /// Index of the first brush reference for this BSP leaf.
  firstLeafBrush
  /// Number of brush references belonging to this BSP leaf.
  numLeafBrushes
end struct
/// Dbrushside record for format.qfiles, containing `planeNum`, `shaderNum`.
struct Dbrushside
  /// BSP plane-lump index of the boundary represented by this brush side.
  planeNum
  /// Index of the shader referenced by this geometric element.
  shaderNum
end struct
/// Dbrush record for format.qfiles, containing `firstSide`, `numSides`, `shaderNum`.
struct Dbrush
  /// Index of the first bounding side of this brush.
  firstSide
  /// Number of planes bounding this collision brush.
  numSides
  /// Index of the shader referenced by this geometric element.
  shaderNum
end struct
/// Dfog record for format.qfiles, containing `shader`, `brushNum`, `visibleSide`.
struct Dfog
  /// Shader name or descriptor associated with this surface.
  shader
  /// Index of the collision brush defining this fog volume.
  brushNum
  /// Brush-side index exposed for fog clipping, or minus one when no side is selected.
  visibleSide
end struct
/// DrawVert record for format.qfiles, containing `xyz`, `st`, `lightmap`, `normal`, `color`.
struct DrawVert
  /// XYZ position components stored by this vertex record.
  xyz
  /// Two-dimensional texture coordinates.
  st
  /// Lightmap texture coordinates for this vertex.
  lightmap
  /// Surface normal used to light this BSP rendering vertex.
  normal
  /// Color components associated with the vertex or debug primitive.
  color
end struct
/// Dsurface record for format.qfiles, containing `shaderNum`, `fogNum`, `surfaceType`, `firstVert`, `numVerts`, `firstIndex`, and 10 further fields.
struct Dsurface
  /// Index of the shader referenced by this geometric element.
  shaderNum
  /// Index of the fog volume associated with this surface.
  fogNum
  /// BSP surface-kind identifier, such as planar, patch, or triangle mesh.
  surfaceType
  /// Index of the first vertex belonging to this surface.
  firstVert
  /// Number of vertices described by this surface.
  numVerts
  /// Index of the first index element belonging to this surface.
  firstIndex
  /// Number of index elements describing this surface.
  numIndexes
  /// Index of the lightmap used by this surface.
  lightmapNum
  /// Horizontal origin of this surface's rectangle in its lightmap image.
  lightmapX
  /// Vertical origin of this surface's rectangle in its lightmap image.
  lightmapY
  /// Width of this surface's lightmap rectangle, in texels.
  lightmapWidth
  /// Height of this surface's lightmap rectangle, in texels.
  lightmapHeight
  /// World-space origin used to generate the surface's lightmap coordinates.
  lightmapOrigin
  /// Lightmap projection vectors; patch surfaces reuse the first two vectors for LOD bounds.
  lightmapVecs
  /// Number of control points across the curved patch.
  patchWidth
  /// Number of control-point rows in the curved patch.
  patchHeight
end struct

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
