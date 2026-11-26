// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MD3 front-end frame repair and projected-radius LOD selection from tr_mesh.c.
package mq3.renderer.md3_entity

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import mq3.renderer.view_math as viewMath

/// Computes the tangent of a radian angle through the C runtime.
/// @param value Input angle in radians.
/// @returns The tangent of the input angle.
extern function tan(value as double) from "ucrtbase.dll" returns double

const RF_WRAP_FRAMES=512

/// Data record for `mq3.renderer.md3_entity.Frames`; groups `frame`, `oldFrame`, `wrapped`, `repaired`.
struct Frames frame oldFrame wrapped repaired end struct

/// Creates error `7695` with message `"MD3 entity: "+message`.
/// @param message Input used in the result expression `error(7695,"MD3 entity: "+message)`.
function fail(message) return error(7695,"MD3 entity: "+message) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.md3_entity.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Returns `value%divisor` from `mq3.renderer.md3_entity.cRemainder`; earlier branches return `0-((0-value)%divisor)`.
/// @param value Input tested by `value<0`.
/// @param divisor Input tested by `value<0`.
function cRemainder(value,divisor) if value<0 then return 0-((0-value)%divisor) end if;return value%divisor end function

// R_AddMD3Surfaces first wraps continuous animation frames, then repairs both
// frame indexes to zero together if either remains outside the model.
/// @param numFrames Value forwarded as `divisor` to `mq3.renderer.md3_entity.cRemainder`.
/// @param frame Initial value for `mq3.renderer.md3_entity.Frames.frame`.
/// @param oldFrame Initial value for `mq3.renderer.md3_entity.Frames.oldFrame`.
/// @param renderfx Input tested by `(renderfx&RF_WRAP_FRAMES)!=0`.
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
/// @param mins Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
/// @param maxs Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
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
/// @param radius Input used by `r=radius`.
/// @param location Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
/// @param viewOrigin Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
/// @param viewForward Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
/// @param projection Indexed input read at `5`, `9`, `13`, `7`.
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
/// @param numLods Argument 2 supplied to `mq3.compat.numeric.fmul`.
/// @param mins Value forwarded as `mins` to `mq3.renderer.md3_entity.radiusFromBounds`.
/// @param maxs Value forwarded as `maxs` to `mq3.renderer.md3_entity.radiusFromBounds`.
/// @param origin Value forwarded as `location` to `mq3.renderer.md3_entity.projectRadius`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.md3_entity.projectRadius`.
/// @param viewForward Value forwarded as `viewForward` to `mq3.renderer.md3_entity.projectRadius`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.md3_entity.projectRadius`.
/// @param lodScale Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param lodBias Input used by `lod=lod+lodBias`.
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

// R_ComputeFogNum from tr_mesh.c.  Fog zero is the renderer's no-fog slot;
// real BSP fogs start at one.  The original deliberately uses only the
// selected frame's sphere and entity origin (not the entity axes), and treats
// a sphere that merely touches a fog bound as outside that fog.
/// @param fogs Indexed input read at `fogIndex`.
/// @param origin Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`.
/// @param frame Record providing `frame.localOrigin`, `frame.radius`.
/// @param noWorldModel Input tested by `noWorldModel`.
function computeFogNum(fogs,origin,frame,noWorldModel)
  if noWorldModel then return 0 end if
  if fogs==void then return 0 end if
  if not valid3(origin) or frame==void or not valid3(frame.localOrigin) or frame.radius<0.0 then return fail("invalid fog sphere") end if
  localOrigin=[];for axis=0 to 2 localOrigin=localOrigin+[numeric.fadd(origin[axis],frame.localOrigin[axis])] end for
  for fogIndex=1 to len(fogs)-1
    fog=fogs[fogIndex];if fog==void or fog.bounds==void or len(fog.bounds)!=2 or not valid3(fog.bounds[0]) or not valid3(fog.bounds[1]) then return fail("invalid fog bounds") end if
    intersects=true
    for axis=0 to 2
      if numeric.fsub(localOrigin[axis],frame.radius)>=fog.bounds[1][axis] or numeric.fadd(localOrigin[axis],frame.radius)<=fog.bounds[0][axis] then intersects=false;break end if
    end for
    if intersects then return fogIndex end if
  end for
  return 0
end function

// Control-flow core of R_CullModel.  The sphere tests can produce an early
// definitive answer only for normalized axes; clipped or disagreeing frame
// spheres fall through to the merged-frame box exactly like Baseq3.
/// @param sameFrame Input tested by `sameFrame`.
/// @param nonNormalizedAxes Input tested by `not nonNormalizedAxes`.
/// @param newSphere Input tested by `newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN`.
/// @param oldSphere Input tested by `newSphere==oldSphere and (newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN)`.
/// @param boxCull Input used in the result expression `boxCull`.
function cullModelDecision(sameFrame,nonNormalizedAxes,newSphere,oldSphere,boxCull)
  if not nonNormalizedAxes then
    if sameFrame then
      if newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN then return newSphere end if
    else
      if newSphere==oldSphere and (newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN) then return newSphere end if
    end if
  end if
  return boxCull
end function

/// Builds `bounds[0]`, `bounds[1]` in `mq3.renderer.md3_entity.cullModel`; returns `cullModelDecision(frame==oldFrame,nonNormalizedAxes,newSphere,oldSphere,boxCull)`.
/// @param frames Indexed input read at `frame`, `oldFrame`.
/// @param frame Input tested by `frames==void or frame<0 or oldFrame<0 or frame>=len(frames) or oldFrame>=len(frames)`.
/// @param oldFrame Input tested by `frames==void or frame<0 or oldFrame<0 or frame>=len(frames) or oldFrame>=len(frames)`.
/// @param origin Argument 1 supplied to `mq3.renderer.view_math.orientation`.
/// @param axis Argument 2 supplied to `mq3.renderer.view_math.orientation`.
/// @param nonNormalizedAxes Value forwarded as `nonNormalizedAxes` to `mq3.renderer.md3_entity.cullModelDecision`.
/// @param frustum Argument 4 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
/// @param noCull Argument 5 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
function cullModel(frames,frame,oldFrame,origin,axis,nonNormalizedAxes,frustum,noCull)
  if frames==void or frame<0 or oldFrame<0 or frame>=len(frames) or oldFrame>=len(frames) then return fail("cull frame outside model") end if
  if frustum==void then return viewMath.CULL_CLIP end if
  orientation=viewMath.orientation(origin,axis);newValue=frames[frame];oldValue=frames[oldFrame]
  newSphere=viewMath.CULL_CLIP;oldSphere=viewMath.CULL_CLIP
  if not nonNormalizedAxes then
    newSphere=viewMath.cullLocalPointAndRadius(newValue.localOrigin,newValue.radius,orientation,frustum,noCull);if newSphere is error then return newSphere end if
    oldSphere=newSphere
    if frame!=oldFrame then oldSphere=viewMath.cullLocalPointAndRadius(oldValue.localOrigin,oldValue.radius,orientation,frustum,noCull);if oldSphere is error then return oldSphere end if end if
    if (frame==oldFrame and (newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN)) or (frame!=oldFrame and newSphere==oldSphere and (newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN)) then return newSphere end if
  end if
  bounds=[[],[]]
  for axisIndex=0 to 2
    minimum=oldValue.mins[axisIndex];if newValue.mins[axisIndex]<minimum then minimum=newValue.mins[axisIndex] end if
    maximum=oldValue.maxs[axisIndex];if newValue.maxs[axisIndex]>maximum then maximum=newValue.maxs[axisIndex] end if
    bounds[0]=bounds[0]+[minimum];bounds[1]=bounds[1]+[maximum]
  end for
  boxCull=viewMath.cullLocalBox(bounds,orientation,frustum,noCull);if boxCull is error then return boxCull end if
  return cullModelDecision(frame==oldFrame,nonNormalizedAxes,newSphere,oldSphere,boxCull)
end function

// R_SetupProjection fields used by ProjectRadius.  This keeps the original
// float stores around tan() and matrix construction; all unused fields stay
// zero except projection[11], which supplies clip W = distance.
/// @param fovY Input tested by `fovY<=0.0 or fovY>=180.0 or zNear<=0.0`.
/// @param zNear Argument 1 supplied to `mq3.compat.numeric.fmul`.
function lodProjection(fovY,zNear)
  if fovY<=0.0 or fovY>=180.0 or zNear<=0.0 then return fail("invalid LOD projection") end if
  ymax=numeric.f32(numeric.fmul(zNear,tan(fovY*3.14159265358979323846/360.0)));ymin=numeric.fneg(ymax);height=numeric.fsub(ymax,ymin)
  projection=array(16,0.0);projection[5]=numeric.fdiv(numeric.fmul(2.0,zNear),height);projection[11]= -1.0;return projection
end function
