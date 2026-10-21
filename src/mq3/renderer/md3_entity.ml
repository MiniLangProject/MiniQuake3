// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MD3 front-end frame repair and projected-radius LOD selection from tr_mesh.c.
package mq3.renderer.md3_entity

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

const RF_WRAP_FRAMES=512

struct Frames frame oldFrame wrapped repaired end struct

function fail(message) return error(7695,"MD3 entity: "+message) end function
function valid3(value) return value!=void and len(value)==3 end function
function cRemainder(value,divisor) if value<0 then return 0-((0-value)%divisor) end if;return value%divisor end function

// R_AddMD3Surfaces first wraps continuous animation frames, then repairs both
// frame indexes to zero together if either remains outside the model.
function normalizeFrames(numFrames,frame,oldFrame,renderfx)
  if numFrames<1 then return fail("model needs at least one frame") end if
  wrapped=false
  if (renderfx&RF_WRAP_FRAMES)!=0 then
    frame=cRemainder(frame,numFrames);oldFrame=cRemainder(oldFrame,numFrames);wrapped=true
  end if
  repaired=false
  if frame<0 or frame>=numFrames or oldFrame<0 or oldFrame>=numFrames then frame=0;oldFrame=0;repaired=true end if
  return Frames(frame,oldFrame,wrapped,repaired)
end function

// RadiusFromBounds from q_shared.c. It selects the most distant corner from
// the origin before taking the Euclidean length.
function radiusFromBounds(mins,maxs)
  if not valid3(mins) or not valid3(maxs) then return fail("bounds need two three-component corners") end if
  corner=[]
  for axis=0 to 2
    a=mins[axis];if a<0.0 then a=numeric.fneg(a) end if
    b=maxs[axis];if b<0.0 then b=numeric.fneg(b) end if
    if b>a then a=b end if;corner=corner+[a]
  end for
  return numeric.fsqrt(qmath.DotProduct(corner,corner))
end function

// ProjectRadius uses the renderer's current view orientation and projection
// matrix. All intermediate stores remain binary32 as in the x86 Baseq3 path.
function projectRadius(radius,location,viewOrigin,viewForward,projection)
  if not valid3(location) or not valid3(viewOrigin) or not valid3(viewForward) then return fail("view vectors need three components") end if
  if projection==void or len(projection)!=16 then return fail("projection matrix needs sixteen components") end if
  c=qmath.DotProduct(viewForward,viewOrigin)
  dist=numeric.fsub(qmath.DotProduct(viewForward,location),c)
  if dist<=0.0 then return 0.0 end if
  r=radius;if r<0.0 then r=numeric.fneg(r) end if
  // p is (0, abs(radius), -dist), so only rows one and two contribute.
  projectedY=numeric.fadd(numeric.fadd(numeric.fmul(r,projection[5]),numeric.fmul(numeric.fneg(dist),projection[9])),projection[13])
  projectedW=numeric.fadd(numeric.fadd(numeric.fmul(r,projection[7]),numeric.fmul(numeric.fneg(dist),projection[11])),projection[15])
  result=numeric.fdiv(projectedY,projectedW)
  if result>1.0 then result=1.0 end if
  return result
end function

// R_ComputeLOD. A single-level model still applies r_lodbias and clamps it,
// matching the original rather than bypassing the common tail.
function computeLod(numLods,mins,maxs,origin,viewOrigin,viewForward,projection,lodScale,lodBias)
  if numLods<1 then return fail("model needs at least one LOD") end if
  lod=0
  if numLods>=2 then
    radius=radiusFromBounds(mins,maxs);if radius is error then return radius end if
    projected=projectRadius(radius,origin,viewOrigin,viewForward,projection);if projected is error then return projected end if
    flod=0.0
    if projected!=0.0 then
      scale=numeric.f32(lodScale);if scale>20.0 then scale=20.0 end if
      flod=numeric.fsub(1.0,numeric.fmul(projected,scale))
    end if
    flod=numeric.fmul(flod,numLods);lod=numeric.trunc32(flod)
    if lod<0 then lod=0 else if lod>=numLods then lod=numLods-1 end if
  end if
  lod=lod+lodBias
  if lod>=numLods then lod=numLods-1 end if
  if lod<0 then lod=0 end if
  return lod
end function
