// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side quad stamping and sprite geometry from renderer/tr_surface.c.
package mq3.renderer.surface_entities

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

const PI=3.14159265358979323846

struct Vertex xyz normal tex0 tex1 color end struct
struct Submission vertices indexes baseVertex baseIndex numVertexes numIndexes flushed end struct

function valid3(value) return value!=void and len(value)==3 end function
function byteColor(value)
  if value==void or len(value)!=4 then return error(7400,"entity surface needs RGBA color") end if
  result=[]
  for i=0 to 3
    if value[i]<0 or value[i]>255 then return error(7401,"entity color component outside byte range") end if
    result=result+[value[i]&255]
  end for
  return result
end function
function vecScale(value,scale)
  return [numeric.fmul(value[0],scale),numeric.fmul(value[1],scale),numeric.fmul(value[2],scale)]
end function
function vecAdd(a,b)
  return [numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]
end function
function vecSub(a,b)
  return [numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]
end function

// RB_AddQuadStampExt emits two triangles. RB_CheckOverflow flushes even when
// the resulting count exactly reaches a SHADER_MAX_* sentinel.
function addQuadStampExt(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if not valid3(origin) or not valid3(left) or not valid3(up) or not valid3(viewForward) then return error(7402,"quad stamp needs four vec3 values") end if
  rgba=byteColor(color);if rgba is error then return rgba end if
  if currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1 then return error(7403,"invalid tessellation counts") end if
  if 4>=maxVertexes or 6>=maxIndexes then return error(7404,"quad stamp exceeds tessellation capacity") end if
  flushed=currentVertexes+4>=maxVertexes or currentIndexes+6>=maxIndexes
  baseVertex=currentVertexes;baseIndex=currentIndexes
  if flushed then baseVertex=0;baseIndex=0 end if
  normal=[numeric.fsub(0.0,viewForward[0]),numeric.fsub(0.0,viewForward[1]),numeric.fsub(0.0,viewForward[2])]
  s1=numeric.f32(s1);t1=numeric.f32(t1);s2=numeric.f32(s2);t2=numeric.f32(t2)
  a=vecAdd(vecAdd(origin,left),up)
  b=vecAdd(vecSub(origin,left),up)
  c=vecSub(vecSub(origin,left),up)
  d=vecSub(vecAdd(origin,left),up)
  vertices=[Vertex(a,normal,[s1,t1],[s1,t1],rgba),Vertex(b,normal,[s2,t1],[s2,t1],rgba),Vertex(c,normal,[s2,t2],[s2,t2],rgba),Vertex(d,normal,[s1,t2],[s1,t2],rgba)]
  indexes=[baseVertex,baseVertex+1,baseVertex+3,baseVertex+3,baseVertex+1,baseVertex+2]
  return Submission(vertices,indexes,baseVertex,baseIndex,baseVertex+4,baseIndex+6,flushed)
end function

function addQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return addQuadStampExt(origin,left,up,color,viewForward,0.0,0.0,1.0,1.0,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function

// RB_SurfaceSprite rotates the camera-facing left/up basis around the view
// axis, mirrors left for mirror views, then uses the standard quad stamp.
function surfaceSprite(origin,radius,rotation,color,viewLeft,viewUp,viewForward,isMirror,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if not valid3(origin) or not valid3(viewLeft) or not valid3(viewUp) or not valid3(viewForward) then return error(7405,"sprite needs origin and view axes") end if
  radius=numeric.f32(radius);rotation=numeric.f32(rotation)
  left=[0.0,0.0,0.0];up=[0.0,0.0,0.0]
  if rotation==0.0 then
    left=vecScale(viewLeft,radius);up=vecScale(viewUp,radius)
  else
    angle=numeric.f32(rotation*PI/180.0)
    sine=numeric.f32(trans.sin(angle));cosine=numeric.f32(trans.cos(angle))
    left=vecScale(viewLeft,numeric.fmul(cosine,radius))
    left=vecAdd(left,vecScale(viewUp,numeric.fmul(numeric.fneg(sine),radius)))
    up=vecScale(viewUp,numeric.fmul(cosine,radius))
    up=vecAdd(up,vecScale(viewLeft,numeric.fmul(sine,radius)))
  end if
  if isMirror then left=[numeric.fneg(left[0]),numeric.fneg(left[1]),numeric.fneg(left[2])] end if
  return addQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
