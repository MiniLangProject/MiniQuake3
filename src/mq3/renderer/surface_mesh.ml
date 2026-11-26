// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Static triangle and planar-face submission from renderer/tr_surface.c.
package mq3.renderer.surface_mesh

/// Data record for `mq3.renderer.surface_mesh.Vertex`; groups `xyz`, `normal`, `st`, `lightmap`, `color`.
struct Vertex
  /// Three-dimensional position of this vertex.
  xyz
  /// Static mesh vertex normal used by lighting and material coordinate generation.
  normal
  /// Two-dimensional texture coordinates associated with the vertex.
  st
  /// Baked-lighting texture coordinates or resource associated with this vertex or patch.
  lightmap
  /// Authored vertex color retained with the static mesh position and texture coordinates.
  color
end struct
/// Data record for `mq3.renderer.surface_mesh.TriangleSurface`; groups `verts`, `indexes`, `dlightBits`.
struct TriangleSurface
  /// Source vertex records referenced by the static triangle surface's index list.
  verts
  /// Source triangle index list referencing the static surface's vertex records.
  indexes
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct
/// Data record for `mq3.renderer.surface_mesh.FaceSurface`; groups `normal`, `points`, `indexes`, `dlightBits`.
struct FaceSurface
  /// Plane normal shared by the vertices of this planar face.
  normal
  /// Points defining the face, polygon, or clipping result.
  points
  /// Triangle index list defining the planar face's polygon tessellation.
  indexes
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct
/// Data record for `mq3.renderer.surface_mesh.Submission`; groups `xyz`, `normals`, `texCoords`, `colors`, `vertexDlightBits`, `indexes`, and 6 further fields.
struct Submission
  /// Three-dimensional vertex positions used by this geometry record.
  xyz
  /// Vertex normals used when lighting or transforming the geometry.
  normals
  /// Texture-coordinate arrays emitted with the submitted static mesh vertices.
  texCoords
  /// Vertex colors emitted from a static mesh into the tessellation submission.
  colors
  /// Per-vertex mask of dynamic lights that can affect the geometry.
  vertexDlightBits
  /// Mesh triangle indices rebased into the destination tessellation buffer.
  indexes
  /// First vertex slot used by the submitted geometry.
  baseVertex
  /// First index slot used by the submitted geometry.
  baseIndex
  /// Number of vertices currently stored or submitted.
  numVertexes
  /// Number of indices currently stored or submitted.
  numIndexes
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
  /// Whether the current batch was flushed before this geometry was appended.
  flushed
end struct

/// Constructs `mq3.renderer.surface_mesh.Vertex` with `color` = `[color[0]&255,color[1]&255,color[2]&255,color[3]&255]` and the supplied remaining values.
/// @param xyz Initial value for `mq3.renderer.surface_mesh.Vertex.xyz`.
/// @param normal Initial value for `mq3.renderer.surface_mesh.Vertex.normal`.
/// @param st Initial value for `mq3.renderer.surface_mesh.Vertex.st`.
/// @param lightmap Initial value for `mq3.renderer.surface_mesh.Vertex.lightmap`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function vertex(xyz,normal,st,lightmap,color)
  return Vertex(xyz,normal,st,lightmap,[color[0]&255,color[1]&255,color[2]&255,color[3]&255])
end function
/// Constructs `mq3.renderer.surface_mesh.TriangleSurface` from `verts`, `indexes`, `dlightBits`.
/// @param verts Initial value for `mq3.renderer.surface_mesh.TriangleSurface.verts`.
/// @param indexes Initial value for `mq3.renderer.surface_mesh.TriangleSurface.indexes`.
/// @param dlightBits Initial value for `mq3.renderer.surface_mesh.TriangleSurface.dlightBits`.
function triangles(verts,indexes,dlightBits) return TriangleSurface(verts,indexes,dlightBits) end function
/// Constructs `mq3.renderer.surface_mesh.FaceSurface` from `normal`, `points`, `indexes`, `dlightBits`.
/// @param normal Initial value for `mq3.renderer.surface_mesh.FaceSurface.normal`.
/// @param points Initial value for `mq3.renderer.surface_mesh.FaceSurface.points`.
/// @param indexes Initial value for `mq3.renderer.surface_mesh.FaceSurface.indexes`.
/// @param dlightBits Initial value for `mq3.renderer.surface_mesh.FaceSurface.dlightBits`.
function face(normal,points,indexes,dlightBits) return FaceSurface(normal,points,indexes,dlightBits) end function
/// Computes `v!=void and len(v)==2` for `mq3.renderer.surface_mesh.valid2`.
/// @param v Input used in the result expression `v!=void and len(v)==2`.
function valid2(v) return v!=void and len(v)==2 end function
/// Computes `v!=void and len(v)==3` for `mq3.renderer.surface_mesh.valid3`.
/// @param v Input used in the result expression `v!=void and len(v)==3`.
function valid3(v) return v!=void and len(v)==3 end function
/// Computes `v!=void and len(v)==4` for `mq3.renderer.surface_mesh.valid4`.
/// @param v Input used in the result expression `v!=void and len(v)==4`.
function valid4(v) return v!=void and len(v)==4 end function
/// Computes `v!=void and valid3(v.xyz) and valid3(v.normal) and valid2(v.st) and valid2(v.lightmap) and valid4(v.color)` for `mq3.renderer.surface_mesh.validVertex`.
/// @param v Record providing `v.xyz`, `v.normal`, `v.st`, `v.lightmap`, `v.color`.
function validVertex(v) return v!=void and valid3(v.xyz) and valid3(v.normal) and valid2(v.st) and valid2(v.lightmap) and valid4(v.color) end function
/// Returns `value[smpFrame]` from `mq3.renderer.surface_mesh.lightBits`; earlier branches return `error(7380,"surface needs two SMP dlight masks")`, `error(7381,"SMP frame outside zero or one")`.
/// @param value Indexed input read at `smpFrame`.
/// @param smpFrame Input tested by `smpFrame<0 or smpFrame>1`.
function lightBits(value,smpFrame)
  if value==void or len(value)!=2 then return error(7380,"surface needs two SMP dlight masks") end if
  if smpFrame<0 or smpFrame>1 then return error(7381,"SMP frame outside zero or one") end if
  return value[smpFrame]
end function
/// Requires a nonempty triangle-index sequence whose every vertex index lies below the supplied vertex count.
/// @param indexes Sequence traversed as `index` while producing this result.
/// @param count Input tested by `index<0 or index>=count`.
function checkIndexes(indexes,count)
  if indexes==void or len(indexes)<1 or len(indexes)%3!=0 then return error(7382,"surface indexes must contain triangles") end if
  for each index in indexes
    if index<0 or index>=count then return error(7383,"surface index out of range") end if
  end for
  return true
end function
/// Computes `checkCapacity` from `currentVertexes+vertexCount>=maxVertexes or currentIndexes+indexCount>=maxIndexes`.
/// @param vertexCount Input tested by `vertexCount>=maxVertexes or indexCount>=maxIndexes`.
/// @param indexCount Input tested by `vertexCount>=maxVertexes or indexCount>=maxIndexes`.
/// @param currentVertexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param currentIndexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param maxVertexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param maxIndexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
function checkCapacity(vertexCount,indexCount,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1 then return error(7384,"invalid tessellation counts") end if
  // RB_CheckOverflow uses strict '< SHADER_MAX_*' fit checks and rejects an
  // individual request at or beyond either sentinel after flushing.
  if vertexCount>=maxVertexes or indexCount>=maxIndexes then return error(7385,"surface exceeds tessellation capacity") end if
  return currentVertexes+vertexCount>=maxVertexes or currentIndexes+indexCount>=maxIndexes
end function
/// Builds `mq3.renderer.surface_mesh.Submission` for `mq3.renderer.surface_mesh.build`.
/// @param verts Sequence traversed as `v` while producing this result.
/// @param indexes Sequence traversed as `index` while producing this result.
/// @param normalOverride Input tested by `normalOverride!=void`.
/// @param needsNormal Input tested by `needsNormal`.
/// @param dlightBits Input used by `vertexLights=vertexLights+[dlightBits]`.
/// @param baseVertex Initial value for `mq3.renderer.surface_mesh.Submission.baseVertex`.
/// @param baseIndex Initial value for `mq3.renderer.surface_mesh.Submission.baseIndex`.
/// @param flushed Initial value for `mq3.renderer.surface_mesh.Submission.flushed`.
/// @param aggregateDlights Initial value for `mq3.renderer.surface_mesh.Submission.dlightBits`.
function build(verts,indexes,normalOverride,needsNormal,dlightBits,baseVertex,baseIndex,flushed,aggregateDlights)
  xyz=[];normals=[];texCoords=[];colors=[];vertexLights=[];rebased=[]
  for each v in verts
    xyz=xyz+[[v.xyz[0],v.xyz[1],v.xyz[2]]]
    if needsNormal then
      normal=v.normal;if normalOverride!=void then normal=normalOverride end if
      normals=normals+[[normal[0],normal[1],normal[2]]]
    else normals=normals+[void]
    end if
    texCoords=texCoords+[[v.st[0],v.st[1],v.lightmap[0],v.lightmap[1]]]
    colors=colors+[[v.color[0]&255,v.color[1]&255,v.color[2]&255,v.color[3]&255]]
    vertexLights=vertexLights+[dlightBits]
  end for
  for each index in indexes rebased=rebased+[baseVertex+index] end for
  return Submission(xyz,normals,texCoords,colors,vertexLights,rebased,baseVertex,baseIndex,baseVertex+len(verts),baseIndex+len(indexes),aggregateDlights,flushed)
end function

// RB_SurfaceTriangles ORs its dlight mask before RB_CHECKOVERFLOW. Therefore a
// flush clears the aggregate mask, although each copied vertex keeps the mask.
/// @param value Record providing `value.verts`, `value.indexes`, `value.dlightBits`.
/// @param smpFrame Value forwarded as `smpFrame` to `mq3.renderer.surface_mesh.lightBits`.
/// @param needsNormal Value forwarded as `needsNormal` to `mq3.renderer.surface_mesh.build`.
/// @param currentVertexes Value forwarded as `currentVertexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param currentIndexes Value forwarded as `currentIndexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param maxVertexes Value forwarded as `maxVertexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param maxIndexes Value forwarded as `maxIndexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param currentDlightBits Input used by `aggregate=currentDlightBits|bits`.
function submitTriangles(value,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  if value==void or value.verts==void or len(value.verts)<1 then return error(7386,"triangle surface has no vertices") end if
  for each v in value.verts if not validVertex(v) then return error(7387,"malformed triangle vertex") end if end for
  valid=checkIndexes(value.indexes,len(value.verts));if valid is error then return valid end if
  bits=lightBits(value.dlightBits,smpFrame);if bits is error then return bits end if
  flushed=checkCapacity(len(value.verts),len(value.indexes),currentVertexes,currentIndexes,maxVertexes,maxIndexes);if flushed is error then return flushed end if
  baseVertex=currentVertexes;baseIndex=currentIndexes;aggregate=currentDlightBits|bits
  if flushed then baseVertex=0;baseIndex=0;aggregate=0 end if
  return build(value.verts,value.indexes,void,needsNormal,bits,baseVertex,baseIndex,flushed,aggregate)
end function

// RB_SurfaceFace checks overflow first and then adds its dlight mask. Every
// point uses the plane normal because the packed face points carry no normals.
/// @param value Record providing `value.normal`, `value.points`, `value.indexes`, `value.dlightBits`.
/// @param smpFrame Value forwarded as `smpFrame` to `mq3.renderer.surface_mesh.lightBits`.
/// @param needsNormal Value forwarded as `needsNormal` to `mq3.renderer.surface_mesh.build`.
/// @param currentVertexes Value forwarded as `currentVertexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param currentIndexes Value forwarded as `currentIndexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param maxVertexes Value forwarded as `maxVertexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param maxIndexes Value forwarded as `maxIndexes` to `mq3.renderer.surface_mesh.checkCapacity`.
/// @param currentDlightBits Input used by `aggregate=currentDlightBits`.
function submitFace(value,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  if value==void or not valid3(value.normal) or value.points==void or len(value.points)<1 then return error(7388,"malformed planar face") end if
  for each v in value.points if not validVertex(v) then return error(7389,"malformed face point") end if end for
  valid=checkIndexes(value.indexes,len(value.points));if valid is error then return valid end if
  bits=lightBits(value.dlightBits,smpFrame);if bits is error then return bits end if
  flushed=checkCapacity(len(value.points),len(value.indexes),currentVertexes,currentIndexes,maxVertexes,maxIndexes);if flushed is error then return flushed end if
  baseVertex=currentVertexes;baseIndex=currentIndexes;aggregate=currentDlightBits
  if flushed then baseVertex=0;baseIndex=0;aggregate=0 end if
  aggregate=aggregate|bits
  return build(value.points,value.indexes,value.normal,needsNormal,bits,baseVertex,baseIndex,flushed,aggregate)
end function
