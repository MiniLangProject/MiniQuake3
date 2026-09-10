// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side polygon fan submission from renderer/tr_surface.c RB_SurfacePolychain.
package mq3.renderer.surface_polychain

const SHADER_MAX_VERTEXES=1000
const SHADER_MAX_INDEXES=6000

struct Vertex xyz st modulate end struct
struct Buffer maxVertexes maxIndexes xyz texCoords colors indexes numVertexes numIndexes flushes end struct

function vertex(x,y,z,s,t,r,g,b,a)
  return Vertex([x,y,z],[s,t],[r&255,g&255,b&255,a&255])
end function

function create(maxVertexes,maxIndexes)
  if maxVertexes<1 or maxIndexes<1 then return error(7170,"invalid tessellation capacity") end if
  return Buffer(maxVertexes,maxIndexes,[],[],[],[],0,0,0)
end function

function clear(buffer)
  buffer.xyz=[];buffer.texCoords=[];buffer.colors=[];buffer.indexes=[]
  buffer.numVertexes=0;buffer.numIndexes=0
end function

// Mirrors RB_CheckOverflow's strict '< MAX' checks and surface restart.
function checkOverflow(buffer,vertices,indexes)
  if vertices<0 or indexes<0 then return error(7171,"negative tessellation request") end if
  if buffer.numVertexes+vertices<buffer.maxVertexes and buffer.numIndexes+indexes<buffer.maxIndexes then return false end if
  clear(buffer);buffer.flushes=buffer.flushes+1
  if vertices>=buffer.maxVertexes then return error(7172,"polygon exceeds vertex capacity") end if
  if indexes>=buffer.maxIndexes then return error(7173,"polygon exceeds index capacity") end if
  return true
end function

// Copies positions, base texture coordinates and packed color, then emits a fan.
function append(buffer,vertices)
  if buffer==void or vertices==void then return error(7174,"missing polygon or buffer") end if
  count=len(vertices)
  if count<3 then return error(7175,"polygon needs at least three vertices") end if
  neededIndexes=3*(count-2)
  overflow=checkOverflow(buffer,count,neededIndexes)
  if overflow is error then return overflow end if
  base=buffer.numVertexes
  for i=0 to count-1
    current=vertices[i]
    if current==void or len(current.xyz)!=3 or len(current.st)!=2 or len(current.modulate)!=4 then return error(7176,"malformed polygon vertex") end if
    buffer.xyz=buffer.xyz+[[current.xyz[0],current.xyz[1],current.xyz[2]]]
    buffer.texCoords=buffer.texCoords+[[current.st[0],current.st[1]]]
    buffer.colors=buffer.colors+[[current.modulate[0]&255,current.modulate[1]&255,current.modulate[2]&255,current.modulate[3]&255]]
    buffer.numVertexes=buffer.numVertexes+1
  end for
  for i=0 to count-3
    buffer.indexes=buffer.indexes+[base,base+i+1,base+i+2]
    buffer.numIndexes=buffer.numIndexes+3
  end for
  return neededIndexes/3
end function
