// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side curved-grid LOD selection and tessellation from renderer/tr_surface.c.
package mq3.renderer.surface_grid

import mq3.compat.numeric as numeric

struct GridVertex xyz normal st lightmap color end struct
struct Grid width height widthLodError heightLodError verts end struct
struct Batch xyz normals texCoords colors vertexDlightBits indexes numVertexes numIndexes dlightBits end struct
struct Submission widthTable heightTable batches flushes numVertexes numIndexes dlightBits end struct

function vertex(xyz,normal,st,lightmap,color)
  return GridVertex(xyz,normal,st,lightmap,[color[0]&255,color[1]&255,color[2]&255,color[3]&255])
end function

function grid(width,height,widthLodError,heightLodError,verts)
  return Grid(width,height,widthLodError,heightLodError,verts)
end function

function valid2(value) return value!=void and len(value)==2 end function
function valid3(value) return value!=void and len(value)==3 end function
function valid4(value) return value!=void and len(value)==4 end function
function validVertex(value)
  return value!=void and valid3(value.xyz) and valid3(value.normal) and valid2(value.st) and valid2(value.lightmap) and valid4(value.color)
end function

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
function selectAxis(size,lodErrors,lodError)
  selected=[0]
  for i=1 to size-2
    if lodErrors[i]<=lodError then selected=selected+[i] end if
  end for
  return selected+[size-1]
end function

function emptyBatch(dlightBits)
  return Batch([],[],[],[],[],[],0,0,dlightBits)
end function

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
