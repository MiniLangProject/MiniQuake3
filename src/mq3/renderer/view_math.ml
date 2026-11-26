// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// View transforms and conservative frustum culling from renderer/tr_main.c.
package mq3.renderer.view_math

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath

/// Bounds classification indicating that the object lies entirely inside the view frustum.
const CULL_IN=0
/// Bounds classification indicating that the object intersects the view frustum.
const CULL_CLIP=1
/// Bounds classification indicating that the object lies entirely outside the view frustum.
const CULL_OUT=2

/// Data record for `mq3.renderer.view_math.Plane`; groups `normal`, `dist`.
struct Plane
  /// Plane normal transformed between the object's local basis and world space.
  normal
  /// Signed plane distance measured along its normal.
  dist
end struct
/// Data record for `mq3.renderer.view_math.Orientation`; groups `origin`, `axis`.
struct Orientation
  /// Translation used when converting points between the object's local basis and world space.
  origin
  /// Object basis used for local-to-world point, direction, and plane transformations.
  axis
end struct
/// Data record for `mq3.renderer.view_math.ClipWindow`; groups `normalized`, `window`.
struct ClipWindow
  /// Perspective-divided X/Y and depth Z remapped to the usual zero-to-one range; components are not clamped.
  normalized
  /// Viewport-relative pixel X/Y followed by the same remapped depth Z; only X/Y are rounded.
  window
end struct

/// Constructs `mq3.renderer.view_math.Plane` with `dist` = `numeric.f32(dist)` and the supplied remaining values.
/// @param normal Initial value for `mq3.renderer.view_math.Plane.normal`.
/// @param dist Argument 1 supplied to `mq3.compat.numeric.f32`.
function plane(normal,dist) return Plane(normal,numeric.f32(dist)) end function
/// Constructs `mq3.renderer.view_math.Orientation` from `origin`, `axis`.
/// @param origin Initial value for `mq3.renderer.view_math.Orientation.origin`.
/// @param axis Initial value for `mq3.renderer.view_math.Orientation.axis`.
function orientation(origin,axis) return Orientation(origin,axis) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.view_math.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Computes `value!=void and len(value)==4` for `mq3.renderer.view_math.valid4`.
/// @param value Input used in the result expression `value!=void and len(value)==4`.
function valid4(value) return value!=void and len(value)==4 end function

/// Checks a renderer orientation's three-component origin and three three-component basis axes.
/// @param value Record providing `value.origin`, `value.axis`.
function validateOrientation(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 then return error(7380,"malformed renderer orientation") end if
  for i=0 to 2
    if not valid3(value.axis[i]) then return error(7381,"malformed renderer orientation axis") end if
  end for
  return true
end function

/// Requires four nonmissing frustum planes with three-component normals.
/// @param frustum Indexed input read at `i`.
function validateFrustum(frustum)
  if frustum==void or len(frustum)!=4 then return error(7382,"renderer frustum needs four planes") end if
  for i=0 to 3
    if frustum[i]==void or not valid3(frustum[i].normal) then return error(7383,"malformed renderer frustum plane") end if
  end for
  return true
end function

/// Transforms a local direction through the orientation basis using compatibility float arithmetic, without translation.
/// @param local Value forwarded as `value` to `mq3.renderer.view_math.valid3`.
/// @param value Record providing `value.axis`.
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

/// Transforms a local point through the orientation basis and adds the world-space origin.
/// @param local Value forwarded as `local` to `mq3.renderer.view_math.localNormalToWorld`.
/// @param value Record providing `value.origin`.
function localPointToWorld(local,value)
  world=localNormalToWorld(local,value);if world is error then return world end if
  return [numeric.fadd(world[0],value.origin[0]),numeric.fadd(world[1],value.origin[1]),numeric.fadd(world[2],value.origin[2])]
end function

// Baseq3's R_WorldToLocal projects the supplied vector onto the axes. The
// caller subtracts the origin when a position rather than a vector is used.
/// @param world Value forwarded as `value` to `mq3.renderer.view_math.valid3`.
/// @param value Record providing `value.axis`.
function worldToLocal(world,value)
  if not valid3(world) then return error(7385,"world vector needs three components") end if
  valid=validateOrientation(value);if valid is error then return valid end if
  return [qmath.DotProduct(world,value.axis[0]),qmath.DotProduct(world,value.axis[1]),qmath.DotProduct(world,value.axis[2])]
end function

/// Multiplies a four-component vector by a column-major 4-by-4 matrix using compatibility float arithmetic.
/// @param source Indexed input read at `0`, `1`, `2`, `3`.
/// @param matrix Indexed input read at `i`, `i+4`, `i+8`, `i+12`.
function matrixVector4(source,matrix)
  result=[]
  for i=0 to 3
    component=numeric.fadd(numeric.fadd(numeric.fadd(numeric.fmul(source[0],matrix[i]),numeric.fmul(source[1],matrix[i+4])),numeric.fmul(source[2],matrix[i+8])),numeric.fmul(source[3],matrix[i+12]))
    result=result+[component]
  end for
  return result
end function

/// Computes `transformModelToClip` from `[eye,matrixVector4(eye,projectionMatrix)]` using `mq3.renderer.view_math.valid3`, `mq3.renderer.view_math.matrixVector4`.
/// @param source Value forwarded as `value` to `mq3.renderer.view_math.valid3`.
/// @param modelMatrix Value forwarded as `matrix` to `mq3.renderer.view_math.matrixVector4`.
/// @param projectionMatrix Value forwarded as `matrix` to `mq3.renderer.view_math.matrixVector4`.
function transformModelToClip(source,modelMatrix,projectionMatrix)
  if not valid3(source) then return error(7386,"model point needs three components") end if
  if modelMatrix==void or len(modelMatrix)!=16 or projectionMatrix==void or len(projectionMatrix)!=16 then return error(7387,"renderer transform needs two 4x4 matrices") end if
  eye=matrixVector4([source[0],source[1],source[2],1.0],modelMatrix)
  return [eye,matrixVector4(eye,projectionMatrix)]
end function

/// Perspective-divide a clip-space point and map it to viewport-relative pixel coordinates.
/// Stores X/W, Y/W, and (Z+W)/(2W) in normalized; window contains the mapped
/// pixel X/Y and the same depth. Pixel components use trunc(value + 0.5).
/// This operation does not clip the point, clamp depth, or add a viewport origin.
/// @param clip Four-component homogeneous point; the caller must supply a nonzero W component.
/// @param viewportWidth Nonnegative viewport width in pixels.
/// @param viewportHeight Nonnegative viewport height in pixels.
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

/// Validates and classifies a sphere against four frustum planes; disabled culling returns CULL_CLIP.
/// @param point Value forwarded as `value` to `mq3.renderer.view_math.valid3`.
/// @param radius Argument 1 supplied to `mq3.compat.numeric.fneg`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.view_math.validateFrustum`.
/// @param noCull Input tested by `noCull`.
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

/// Returns `cullPointAndRadius(transformed,radius,frustum,noCull)` from `mq3.renderer.view_math.cullLocalPointAndRadius`; earlier branches return `transformed`.
/// @param point Value forwarded as `local` to `mq3.renderer.view_math.localPointToWorld`.
/// @param radius Value forwarded as `radius` to `mq3.renderer.view_math.cullPointAndRadius`.
/// @param value Value forwarded as `value` to `mq3.renderer.view_math.localPointToWorld`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.view_math.cullPointAndRadius`.
/// @param noCull Value forwarded as `noCull` to `mq3.renderer.view_math.cullPointAndRadius`.
function cullLocalPointAndRadius(point,radius,value,frustum,noCull)
  transformed=localPointToWorld(point,value);if transformed is error then return transformed end if
  return cullPointAndRadius(transformed,radius,frustum,noCull)
end function

/// Transforms all eight local box corners and classifies them against the validated world-space frustum.
/// @param bounds Nested indexed data; outer entries read at `0`, `1`, `i&1`, `(i>>1)&1`.
/// @param value Value forwarded as `value` to `mq3.renderer.view_math.validateOrientation`.
/// @param frustum Value forwarded as `frustum` to `mq3.renderer.view_math.validateFrustum`.
/// @param noCull Input tested by `noCull`.
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

/// Construct the left, right, top, and bottom world-space frustum planes for a Quake camera.
/// Returns four side planes in that order; no near or far plane is added.
/// Malformed vector dimensions or a field of view outside (0, 180) produce errors.
/// @param origin Three-component camera origin in world units.
/// @param axis Camera basis in forward, left, up order, expected to be orthonormal.
/// @param fovX Full horizontal field of view in degrees, strictly between zero and 180.
/// @param fovY Full vertical field of view in degrees, strictly between zero and 180.
function setupFrustum(origin,axis,fovX,fovY)
  value=orientation(origin,axis);valid=validateOrientation(value);if valid is error then return valid end if
  if fovX<=0.0 or fovX>=180.0 or fovY<=0.0 or fovY>=180.0 then return error(7393,"renderer frustum needs valid fields of view") end if
  angle=numeric.fmul(numeric.fdiv(fovX,180.0),3.14159265358979323846);angle=numeric.fmul(angle,0.5)
  xs=numeric.f32(trans.sin(angle));xc=numeric.f32(trans.cos(angle))
  left=[numeric.fadd(numeric.fmul(axis[0][0],xs),numeric.fmul(axis[1][0],xc)),numeric.fadd(numeric.fmul(axis[0][1],xs),numeric.fmul(axis[1][1],xc)),numeric.fadd(numeric.fmul(axis[0][2],xs),numeric.fmul(axis[1][2],xc))]
  right=[numeric.fsub(numeric.fmul(axis[0][0],xs),numeric.fmul(axis[1][0],xc)),numeric.fsub(numeric.fmul(axis[0][1],xs),numeric.fmul(axis[1][1],xc)),numeric.fsub(numeric.fmul(axis[0][2],xs),numeric.fmul(axis[1][2],xc))]
  angle=numeric.fmul(numeric.fdiv(fovY,180.0),3.14159265358979323846);angle=numeric.fmul(angle,0.5)
  xs=numeric.f32(trans.sin(angle));xc=numeric.f32(trans.cos(angle))
  top=[numeric.fadd(numeric.fmul(axis[0][0],xs),numeric.fmul(axis[2][0],xc)),numeric.fadd(numeric.fmul(axis[0][1],xs),numeric.fmul(axis[2][1],xc)),numeric.fadd(numeric.fmul(axis[0][2],xs),numeric.fmul(axis[2][2],xc))]
  bottom=[numeric.fsub(numeric.fmul(axis[0][0],xs),numeric.fmul(axis[2][0],xc)),numeric.fsub(numeric.fmul(axis[0][1],xs),numeric.fmul(axis[2][1],xc)),numeric.fsub(numeric.fmul(axis[0][2],xs),numeric.fmul(axis[2][2],xc))]
  result=[];for each normal in [left,right,top,bottom] result=result+[plane(normal,qmath.DotProduct(origin,normal))] end for;return result
end function
