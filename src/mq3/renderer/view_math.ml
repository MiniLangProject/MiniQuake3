// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// View transforms and conservative frustum culling from renderer/tr_main.c.
package mq3.renderer.view_math

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

const CULL_IN=0
const CULL_CLIP=1
const CULL_OUT=2

struct Plane normal dist end struct
struct Orientation origin axis end struct
struct ClipWindow normalized window end struct

function plane(normal,dist) return Plane(normal,numeric.f32(dist)) end function
function orientation(origin,axis) return Orientation(origin,axis) end function
function valid3(value) return value!=void and len(value)==3 end function
function valid4(value) return value!=void and len(value)==4 end function

function validateOrientation(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 then return error(7380,"malformed renderer orientation") end if
  for i=0 to 2
    if not valid3(value.axis[i]) then return error(7381,"malformed renderer orientation axis") end if
  end for
  return true
end function

function validateFrustum(frustum)
  if frustum==void or len(frustum)!=4 then return error(7382,"renderer frustum needs four planes") end if
  for i=0 to 3
    if frustum[i]==void or not valid3(frustum[i].normal) then return error(7383,"malformed renderer frustum plane") end if
  end for
  return true
end function

function localNormalToWorld(local,value)
  if not valid3(local) then return error(7384,"local normal needs three components") end if
  valid=validateOrientation(value);if valid is error then return valid end if
  world=[]
  for i=0 to 2
    component=numeric.fadd(numeric.fadd(numeric.fmul(local[0],value.axis[0][i]),numeric.fmul(local[1],value.axis[1][i])),numeric.fmul(local[2],value.axis[2][i]))
    world=world+[component]
  end for
  return world
end function

function localPointToWorld(local,value)
  world=localNormalToWorld(local,value);if world is error then return world end if
  return [numeric.fadd(world[0],value.origin[0]),numeric.fadd(world[1],value.origin[1]),numeric.fadd(world[2],value.origin[2])]
end function

// Baseq3's R_WorldToLocal projects the supplied vector onto the axes. The
// caller subtracts the origin when a position rather than a vector is used.
function worldToLocal(world,value)
  if not valid3(world) then return error(7385,"world vector needs three components") end if
  valid=validateOrientation(value);if valid is error then return valid end if
  return [qmath.DotProduct(world,value.axis[0]),qmath.DotProduct(world,value.axis[1]),qmath.DotProduct(world,value.axis[2])]
end function

function matrixVector4(source,matrix)
  result=[]
  for i=0 to 3
    component=numeric.fadd(numeric.fadd(numeric.fadd(numeric.fmul(source[0],matrix[i]),numeric.fmul(source[1],matrix[i+4])),numeric.fmul(source[2],matrix[i+8])),numeric.fmul(source[3],matrix[i+12]))
    result=result+[component]
  end for
  return result
end function

function transformModelToClip(source,modelMatrix,projectionMatrix)
  if not valid3(source) then return error(7386,"model point needs three components") end if
  if modelMatrix==void or len(modelMatrix)!=16 or projectionMatrix==void or len(projectionMatrix)!=16 then return error(7387,"renderer transform needs two 4x4 matrices") end if
  eye=matrixVector4([source[0],source[1],source[2],1.0],modelMatrix)
  return [eye,matrixVector4(eye,projectionMatrix)]
end function

function transformClipToWindow(clip,viewportWidth,viewportHeight)
  if not valid4(clip) then return error(7388,"clip point needs four components") end if
  if viewportWidth<0 or viewportHeight<0 then return error(7389,"negative renderer viewport") end if
  x=numeric.fdiv(clip[0],clip[3]);y=numeric.fdiv(clip[1],clip[3])
  z=numeric.fdiv(numeric.fadd(clip[2],clip[3]),numeric.fmul(2.0,clip[3]))
  wx=numeric.fmul(numeric.fmul(0.5,numeric.fadd(1.0,x)),viewportWidth)
  wy=numeric.fmul(numeric.fmul(0.5,numeric.fadd(1.0,y)),viewportHeight)
  wx=numeric.f32(numeric.trunc32(wx+0.5));wy=numeric.f32(numeric.trunc32(wy+0.5))
  return ClipWindow([x,y,z],[wx,wy,z])
end function

function cullPointAndRadius(point,radius,frustum,noCull)
  if not valid3(point) then return error(7390,"cull point needs three components") end if
  if radius<0.0 then return error(7391,"negative cull radius") end if
  valid=validateFrustum(frustum);if valid is error then return valid end if
  if noCull then return CULL_CLIP end if
  mightBeClipped=false
  for i=0 to 3
    distance=numeric.fsub(qmath.DotProduct(point,frustum[i].normal),frustum[i].dist)
    if distance<numeric.fneg(radius) then return CULL_OUT
    else if distance<=radius then mightBeClipped=true end if
  end for
  if mightBeClipped then return CULL_CLIP end if
  return CULL_IN
end function

function cullLocalPointAndRadius(point,radius,value,frustum,noCull)
  transformed=localPointToWorld(point,value);if transformed is error then return transformed end if
  return cullPointAndRadius(transformed,radius,frustum,noCull)
end function

function cullLocalBox(bounds,value,frustum,noCull)
  if bounds==void or len(bounds)!=2 or not valid3(bounds[0]) or not valid3(bounds[1]) then return error(7392,"local bounds need two corners") end if
  valid=validateOrientation(value);if valid is error then return valid end if
  valid=validateFrustum(frustum);if valid is error then return valid end if
  if noCull then return CULL_CLIP end if
  transformed=[]
  for i=0 to 7
    local=[bounds[i&1][0],bounds[(i>>1)&1][1],bounds[(i>>2)&1][2]]
    transformed=transformed+[localPointToWorld(local,value)]
  end for
  anyBack=false
  for i=0 to 3
    front=false;back=false
    for j=0 to 7
      distance=qmath.DotProduct(transformed[j],frustum[i].normal)
      if distance>frustum[i].dist then front=true else back=true end if
    end for
    if not front then return CULL_OUT end if
    if back then anyBack=true end if
  end for
  if not anyBack then return CULL_IN end if
  return CULL_CLIP
end function
