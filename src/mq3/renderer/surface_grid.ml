// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side curved-grid LOD selection and tessellation from renderer/tr_surface.c.
package mq3.renderer.surface_grid

import mq3.compat.numeric as numeric

/// Data record for `mq3.renderer.surface_grid.GridVertex`; groups `xyz`, `normal`, `st`, `lightmap`, `color`.
struct GridVertex
  /// Three-dimensional position of this vertex.
  xyz
  /// Interpolated normal of a tessellated curved-patch vertex.
  normal
  /// Two-dimensional texture coordinates associated with the vertex.
  st
  /// Baked-lighting texture coordinates or resource associated with this vertex or patch.
  lightmap
  /// Vertex color interpolated across the curved-patch control grid.
  color
end struct
/// Data record for `mq3.renderer.surface_grid.Grid`; groups `width`, `height`, `widthLodError`, `heightLodError`, `verts`.
struct Grid
  /// Number of columns in the patch vertex grid.
  width
  /// Number of rows in the patch vertex grid.
  height
  /// Per-column geometric error used when selecting patch detail.
  widthLodError
  /// Per-row geometric error used when selecting patch detail.
  heightLodError
  /// Row-major vertex grid used for curved-patch detail selection and tessellation.
  verts
end struct
/// Data record for `mq3.renderer.surface_grid.Batch`; groups `xyz`, `normals`, `texCoords`, `colors`, `vertexDlightBits`, `indexes`, and 3 further fields.
struct Batch
  /// Three-dimensional vertex positions used by this geometry record.
  xyz
  /// Vertex normals used when lighting or transforming the geometry.
  normals
  /// Base and lightmap coordinates emitted for the selected rows and columns of a patch grid.
  texCoords
  /// Interpolated vertex colors for the tessellated curved-patch batch.
  colors
  /// Per-vertex mask of dynamic lights that can affect the geometry.
  vertexDlightBits
  /// Triangle indices connecting adjacent cells of the selected patch-grid tessellation.
  indexes
  /// Number of vertices currently stored or submitted.
  numVertexes
  /// Number of indices currently stored or submitted.
  numIndexes
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct
/// Data record for `mq3.renderer.surface_grid.Submission`; groups `widthTable`, `heightTable`, `batches`, `flushes`, `numVertexes`, `numIndexes`, and 1 further field.
struct Submission
  /// Selected grid columns retained at the current patch detail level.
  widthTable
  /// Selected grid rows retained at the current patch detail level.
  heightTable
  /// Geometry batches produced when the surface exceeds a single buffer.
  batches
  /// Number of batch flushes needed to submit the geometry.
  flushes
  /// Number of vertices currently stored or submitted.
  numVertexes
  /// Number of indices currently stored or submitted.
  numIndexes
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct

/// Constructs `mq3.renderer.surface_grid.GridVertex` with `color` = `[color[0]&255,color[1]&255,color[2]&255,color[3]&255]` and the supplied remaining values.
/// @param xyz Initial value for `mq3.renderer.surface_grid.GridVertex.xyz`.
/// @param normal Initial value for `mq3.renderer.surface_grid.GridVertex.normal`.
/// @param st Initial value for `mq3.renderer.surface_grid.GridVertex.st`.
/// @param lightmap Initial value for `mq3.renderer.surface_grid.GridVertex.lightmap`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function vertex(xyz,normal,st,lightmap,color)
  return GridVertex(xyz,normal,st,lightmap,[color[0]&255,color[1]&255,color[2]&255,color[3]&255])
end function

/// Constructs `mq3.renderer.surface_grid.Grid` from `width`, `height`, `widthLodError`, `heightLodError`, `verts`.
/// @param width Initial value for `mq3.renderer.surface_grid.Grid.width`.
/// @param height Initial value for `mq3.renderer.surface_grid.Grid.height`.
/// @param widthLodError Initial value for `mq3.renderer.surface_grid.Grid.widthLodError`.
/// @param heightLodError Initial value for `mq3.renderer.surface_grid.Grid.heightLodError`.
/// @param verts Initial value for `mq3.renderer.surface_grid.Grid.verts`.
function grid(width,height,widthLodError,heightLodError,verts)
  return Grid(width,height,widthLodError,heightLodError,verts)
end function

/// Computes `value!=void and len(value)==2` for `mq3.renderer.surface_grid.valid2`.
/// @param value Input used in the result expression `value!=void and len(value)==2`.
function valid2(value) return value!=void and len(value)==2 end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.surface_grid.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Computes `value!=void and len(value)==4` for `mq3.renderer.surface_grid.valid4`.
/// @param value Input used in the result expression `value!=void and len(value)==4`.
function valid4(value) return value!=void and len(value)==4 end function
/// Computes `value!=void and valid3(value.xyz) and valid3(value.normal) and valid2(value.st) and valid2(value.lightmap) and valid4(value.color)` for `mq3.renderer.surface_grid.validVertex`.
/// @param value Record providing `value.xyz`, `value.normal`, `value.st`, `value.lightmap`, `value.color`.
function validVertex(value)
  return value!=void and valid3(value.xyz) and valid3(value.normal) and valid2(value.st) and valid2(value.lightmap) and valid4(value.color)
end function

/// Checks grid dimensions, LOD-error table lengths, total vertex count, and every grid vertex.
/// @param value Record providing `value.width`, `value.height`, `value.widthLodError`, `value.heightLodError`, `value.verts`.
function validateGrid(value)
  if value==void or value.width<2 or value.height<2 then return error(7300,"grid dimensions must be at least two") end if
  if value.widthLodError==void or len(value.widthLodError)!=value.width then return error(7301,"grid width LOD table mismatch") end if
  if value.heightLodError==void or len(value.heightLodError)!=value.height then return error(7302,"grid height LOD table mismatch") end if
  if value.verts==void or len(value.verts)!=value.width*value.height then return error(7303,"grid vertex count mismatch") end if
  for i=0 to len(value.verts)-1
    if not validVertex(value.verts[i]) then return error(7304,"malformed grid vertex") end if
  end for
  return true
end function

// RB_SurfaceGrid always retains both outer edges and keeps an interior row or
// column when its subdivision error is within the current volume LOD error.
/// @param size Input tested by `size>2`.
/// @param lodErrors Indexed input read at `i`.
/// @param lodError Input tested by `lodErrors[i]<=lodError`.
function selectAxis(size,lodErrors,lodError)
  selected=[0]
  // MiniLang's inclusive descending range would visit entries for a two-point
  // axis.  Baseq3's C loop executes zero times when size == 2.
  if size>2 then
    for i=1 to size-2
      if lodErrors[i]<=lodError then selected=selected+[i] end if
    end for
  end if
  return selected+[size-1]
end function

/// Constructs `mq3.renderer.surface_grid.Batch` with `xyz` = `[]`, `normals` = `[]`, `texCoords` = `[]`, `colors` = `[]` and the supplied remaining values.
/// @param dlightBits Initial value for `mq3.renderer.surface_grid.Batch.dlightBits`.
function emptyBatch(dlightBits)
  return Batch([],[],[],[],[],[],0,0,dlightBits)
end function

/// Updates `batch.xyz`, `batch.normals`, `batch.texCoords`, `batch.colors`, `batch.vertexDlightBits` in `mq3.renderer.surface_grid.appendVertex`.
/// @param batch Mutable record or buffer; this call updates `batch.xyz`, `batch.normals`, `batch.texCoords`, `batch.colors`, `batch.vertexDlightBits`.
/// @param current Record providing `current.xyz`, `current.normal`, `current.st`, `current.lightmap`, `current.color`.
/// @param needsNormal Input tested by `needsNormal`.
/// @param dlightBits Input used by `batch.vertexDlightBits=batch.vertexDlightBits+[dlightBits]`.
function appendVertex(batch,current,needsNormal,dlightBits)
  batch.xyz=batch.xyz+[[current.xyz[0],current.xyz[1],current.xyz[2]]]
  if needsNormal then
    batch.normals=batch.normals+[[current.normal[0],current.normal[1],current.normal[2]]]
  else
    batch.normals=batch.normals+[void]
  end if
  batch.texCoords=batch.texCoords+[[current.st[0],current.st[1],current.lightmap[0],current.lightmap[1]]]
  batch.colors=batch.colors+[[current.color[0]&255,current.color[1]&255,current.color[2]&255,current.color[3]&255]]
  batch.vertexDlightBits=batch.vertexDlightBits+[dlightBits]
  batch.numVertexes=batch.numVertexes+1
end function

// Mirrors RB_SurfaceGrid's conservative row capacity calculation. Consecutive
// batches repeat their boundary row so every batch remains independently drawable.
/// @param value Record providing `value.width`, `value.widthLodError`, `value.height`, `value.heightLodError`, `value.verts`.
/// @param lodError Value forwarded as `lodError` to `mq3.renderer.surface_grid.selectAxis`.
/// @param maxVertexes Input tested by `maxVertexes<1 or maxIndexes<1`.
/// @param maxIndexes Input tested by `maxVertexes<1 or maxIndexes<1`.
/// @param needsNormal Value forwarded as `needsNormal` to `mq3.renderer.surface_grid.appendVertex`.
/// @param dlightBits Initial value for `mq3.renderer.surface_grid.Submission.dlightBits`.
function submit(value,lodError,maxVertexes,maxIndexes,needsNormal,dlightBits)
  valid=validateGrid(value);if valid is error then return valid end if
  if maxVertexes<1 or maxIndexes<1 then return error(7305,"invalid grid tessellation capacity") end if
  widthTable=selectAxis(value.width,value.widthLodError,lodError)
  heightTable=selectAxis(value.height,value.heightLodError,lodError)
  lodWidth=len(widthTable);lodHeight=len(heightTable)
  if numeric.trunc32(maxVertexes/lodWidth)<2 then return error(7306,"grid capacity cannot hold one strip") end if
  // The original formula reserves lodWidth*6 indexes per selected row. A value
  // of one cannot advance used, so reject it rather than reproduce an endless loop.
  if numeric.trunc32(maxIndexes/(lodWidth*6))<2 then return error(7307,"grid index capacity cannot advance") end if
  batches=[];used=0;totalVertexes=0;totalIndexes=0
  while used<lodHeight-1
    vrows=numeric.trunc32(maxVertexes/lodWidth)
    irows=numeric.trunc32(maxIndexes/(lodWidth*6))
    rows=irows
    if vrows<irows+1 then rows=vrows-1 end if
    if used+rows>lodHeight then rows=lodHeight-used end if
    batchDlightBits=0
    if len(batches)==0 then batchDlightBits=dlightBits end if
    batch=emptyBatch(batchDlightBits)
    for i=0 to rows-1
      sourceRow=heightTable[used+i]
      for j=0 to lodWidth-1
        current=value.verts[sourceRow*value.width+widthTable[j]]
        appendVertex(batch,current,needsNormal,dlightBits)
      end for
    end for
    h=rows-1;w=lodWidth-1
    for i=0 to h-1
      for j=0 to w-1
        v1=i*lodWidth+j+1;v2=v1-1;v3=v2+lodWidth;v4=v3+1
        batch.indexes=batch.indexes+[v2,v3,v1,v1,v3,v4]
        batch.numIndexes=batch.numIndexes+6
      end for
    end for
    batches=batches+[batch]
    totalVertexes=totalVertexes+batch.numVertexes
    totalIndexes=totalIndexes+batch.numIndexes
    used=used+rows-1
  end while
  return Submission(widthTable,heightTable,batches,len(batches)-1,totalVertexes,totalIndexes,dlightBits)
end function
