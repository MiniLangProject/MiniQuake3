// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Static triangle and planar-face submission from renderer/tr_surface.c.
package mq3.renderer.surface_mesh

struct Vertex xyz normal st lightmap color end struct
struct TriangleSurface verts indexes dlightBits end struct
struct FaceSurface normal points indexes dlightBits end struct
struct Submission xyz normals texCoords colors vertexDlightBits indexes baseVertex baseIndex numVertexes numIndexes dlightBits flushed end struct

function vertex(xyz,normal,st,lightmap,color)
  return Vertex(xyz,normal,st,lightmap,[color[0]&255,color[1]&255,color[2]&255,color[3]&255])
end function
function triangles(verts,indexes,dlightBits) return TriangleSurface(verts,indexes,dlightBits) end function
function face(normal,points,indexes,dlightBits) return FaceSurface(normal,points,indexes,dlightBits) end function
function valid2(v) return v!=void and len(v)==2 end function
function valid3(v) return v!=void and len(v)==3 end function
function valid4(v) return v!=void and len(v)==4 end function
function validVertex(v) return v!=void and valid3(v.xyz) and valid3(v.normal) and valid2(v.st) and valid2(v.lightmap) and valid4(v.color) end function
function lightBits(value,smpFrame)
  if value==void or len(value)!=2 then return error(7380,"surface needs two SMP dlight masks") end if
  if smpFrame<0 or smpFrame>1 then return error(7381,"SMP frame outside zero or one") end if
  return value[smpFrame]
end function
function checkIndexes(indexes,count)
  if indexes==void or len(indexes)<1 or len(indexes)%3!=0 then return error(7382,"surface indexes must contain triangles") end if
  for each index in indexes
    if index<0 or index>=count then return error(7383,"surface index out of range") end if
  end for
  return true
end function
function checkCapacity(vertexCount,indexCount,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1 then return error(7384,"invalid tessellation counts") end if
  if vertexCount>maxVertexes or indexCount>maxIndexes then return error(7385,"surface exceeds tessellation capacity") end if
  return currentVertexes+vertexCount>maxVertexes or currentIndexes+indexCount>maxIndexes
end function
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
