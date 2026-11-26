// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side quad stamping and sprite geometry from renderer/tr_surface.c.
package mq3.renderer.surface_entities

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

const PI=3.14159265358979323846

/// Data record for `mq3.renderer.surface_entities.Vertex`; groups `xyz`, `normal`, `tex0`, `tex1`, `color`.
struct Vertex xyz normal tex0 tex1 color end struct
/// Data record for `mq3.renderer.surface_entities.Submission`; groups `vertices`, `indexes`, `baseVertex`, `baseIndex`, `numVertexes`, `numIndexes`, and 1 further field.
struct Submission vertices indexes baseVertex baseIndex numVertexes numIndexes flushed end struct

/// Computes `value!=void and len(value)==3` for `mq3.renderer.surface_entities.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Validates four RGBA components in the byte range and returns their masked byte values.
/// @param value Indexed input read at `i`.
function byteColor(value)
  if value==void or len(value)!=4 then return error(7400,"entity surface needs RGBA color") end if
  result=[]
  for i=0 to 3
    if value[i]<0 or value[i]>255 then return error(7401,"entity color component outside byte range") end if
    result=result+[value[i]&255]
  end for
  return result
end function
/// Returns `[numeric.fmul(value[0],scale),numeric.fmul(value[1],scale),numeric.fmul(value[2],scale)]` for `mq3.renderer.surface_entities.vecScale`.
/// @param value Three-component vector read at indices 0, 1, and 2.
/// @param scale Argument 2 supplied to `mq3.compat.numeric.fmul`.
function vecScale(value,scale)
  return [numeric.fmul(value[0],scale),numeric.fmul(value[1],scale),numeric.fmul(value[2],scale)]
end function
/// Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_entities.vecAdd`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function vecAdd(a,b)
  return [numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]
end function
/// Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_entities.vecSub`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function vecSub(a,b)
  return [numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]
end function

// RB_AddQuadStampExt emits two triangles. RB_CheckOverflow flushes even when
// the resulting count exactly reaches a SHADER_MAX_* sentinel.
/// @param origin Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param left Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param up Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param color Value forwarded as `value` to `mq3.renderer.surface_entities.byteColor`.
/// @param viewForward Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param s1 Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param t1 Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param s2 Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param t2 Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param currentVertexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param currentIndexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param maxVertexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
/// @param maxIndexes Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`.
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

/// Calls `mq3.renderer.surface_entities.addQuadStampExt` with `(origin,left,up,color,viewForward,0.0,0.0,1.0,1.0,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.
/// @param origin Value forwarded as `origin` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param left Value forwarded as `left` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param up Value forwarded as `up` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param color Value forwarded as `color` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param viewForward Value forwarded as `viewForward` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param currentVertexes Value forwarded as `currentVertexes` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param currentIndexes Value forwarded as `currentIndexes` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param maxVertexes Value forwarded as `maxVertexes` to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param maxIndexes Value forwarded as `maxIndexes` to `mq3.renderer.surface_entities.addQuadStampExt`.
function addQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return addQuadStampExt(origin,left,up,color,viewForward,0.0,0.0,1.0,1.0,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function

// RB_SurfaceSprite rotates the camera-facing left/up basis around the view
// axis, mirrors left for mirror views, then uses the standard quad stamp.
/// @param origin Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param radius Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param rotation Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param color Value forwarded as `color` to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param viewLeft Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param viewUp Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param viewForward Value forwarded as `value` to `mq3.renderer.surface_entities.valid3`.
/// @param isMirror Input tested by `isMirror`.
/// @param currentVertexes Value forwarded as `currentVertexes` to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param currentIndexes Value forwarded as `currentIndexes` to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param maxVertexes Value forwarded as `maxVertexes` to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param maxIndexes Value forwarded as `maxIndexes` to `mq3.renderer.surface_entities.addQuadStamp`.
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
