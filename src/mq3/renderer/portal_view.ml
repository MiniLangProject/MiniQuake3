// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Portal orientation and reflected-camera semantics from renderer/tr_main.c.
package mq3.renderer.portal_view

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import mq3.renderer.surface_trails as trails

const RT_PORTALSURFACE=7

/// Data record for `mq3.renderer.portal_view.Orientation`; groups `origin`, `axis`.
struct Orientation origin axis end struct
/// Data record for `mq3.renderer.portal_view.View`; groups `surface`, `camera`, `pvsOrigin`, `mirror`, `origin`, `axis`, and 3 further fields.
struct View surface camera pvsOrigin mirror origin axis planeNormal planeDist entityIndex end struct

/// Creates error `7700` with message `"portal view: "+message`.
/// @param message Input used in the result expression `error(7700,"portal view: "+message)`.
function fail(message) return error(7700,"portal view: "+message) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.portal_view.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.portal_view.subtract`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function subtract(a,b) return [numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])] end function
/// Returns `[numeric.fneg(value[0]),numeric.fneg(value[1]),numeric.fneg(value[2])]` for `mq3.renderer.portal_view.negate`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function negate(value) return [numeric.fneg(value[0]),numeric.fneg(value[1]),numeric.fneg(value[2])] end function

/// Maps a point from the portal surface basis into the destination camera basis and origin.
/// @param input Value forwarded as `a` to `mq3.renderer.portal_view.subtract`.
/// @param surface Record providing `surface.origin`, `surface.axis`.
/// @param camera Record providing `camera.axis`, `camera.origin`.
function mirrorPoint(input,surface,camera)
  local=subtract(input,surface.origin);transformed=[0.0,0.0,0.0]
  for i=0 to 2 transformed=qmath.VectorMA(transformed,qmath.DotProduct(local,surface.axis[i]),camera.axis[i]) end for
  return [numeric.fadd(transformed[0],camera.origin[0]),numeric.fadd(transformed[1],camera.origin[1]),numeric.fadd(transformed[2],camera.origin[2])]
end function
/// Returns `transformed` from `mq3.renderer.portal_view.mirrorVector`.
/// @param input Argument 1 supplied to `mq3.shared.math.DotProduct`.
/// @param surface Record providing `surface.axis`.
/// @param camera Record providing `camera.axis`.
function mirrorVector(input,surface,camera)
  transformed=[0.0,0.0,0.0]
  for i=0 to 2 transformed=qmath.VectorMA(transformed,qmath.DotProduct(input,surface.axis[i]),camera.axis[i]) end for
  return transformed
end function

/// Builds `cameraAxis[1]`, `cameraAxis[2]` in `mq3.renderer.portal_view.portalOrientation`.
/// @param normal Value forwarded as `value` to `mq3.renderer.portal_view.valid3`.
/// @param dist Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param entities Indexed input read at `entityIndex`.
/// @param timeMilliseconds Argument 1 supplied to `mq3.compat.numeric.fdiv`.
function portalOrientation(normal,dist,entities,timeMilliseconds)
  if not valid3(normal) or entities==void then return fail("plane and entities are required") end if
  if len(entities)==0 then return void end if
  surfaceAxis0=[numeric.f32(normal[0]),numeric.f32(normal[1]),numeric.f32(normal[2])]
  surfaceAxis1=trails.perpendicularVector(surfaceAxis0);surfaceAxis2=qmath.CrossProduct(surfaceAxis0,surfaceAxis1)
  for entityIndex=0 to len(entities)-1
    entity=entities[entityIndex];if entity.reType!=RT_PORTALSURFACE then continue end if
    distance=numeric.fsub(qmath.DotProduct(entity.origin,normal),numeric.f32(dist));if distance>64.0 or distance< -64.0 then continue end if
    pvs=[entity.oldorigin[0],entity.oldorigin[1],entity.oldorigin[2]]
    if entity.oldorigin==entity.origin then
      surfaceOrigin=qmath.VectorScale(surfaceAxis0,numeric.f32(dist));surface=Orientation(surfaceOrigin,[surfaceAxis0,surfaceAxis1,surfaceAxis2])
      camera=Orientation([surfaceOrigin[0],surfaceOrigin[1],surfaceOrigin[2]],[negate(surfaceAxis0),surfaceAxis1,surfaceAxis2])
      return [surface,camera,pvs,true,entityIndex]
    end if
    projectedDistance=numeric.fsub(qmath.DotProduct(entity.origin,normal),numeric.f32(dist));surfaceOrigin=qmath.VectorMA(entity.origin,numeric.fneg(projectedDistance),surfaceAxis0)
    cameraAxis=[negate(entity.axis[0]),negate(entity.axis[1]),[entity.axis[2][0],entity.axis[2][1],entity.axis[2][2]]]
    rotation=0.0
    if entity.oldframe!=0 then
      if entity.frame!=0 then rotation=numeric.fmul(numeric.fdiv(timeMilliseconds,1000.0),entity.frame)
      else rotation=numeric.fadd(entity.skinNum,numeric.fmul(numeric.f32(trans.sin(numeric.fmul(timeMilliseconds,0.003))),4.0)) end if
    else if entity.skinNum!=0 then rotation=numeric.f32(entity.skinNum) end if
    if rotation!=0.0 then cameraAxis[1]=trails.rotateAroundVector(cameraAxis[0],cameraAxis[1],rotation);cameraAxis[2]=qmath.CrossProduct(cameraAxis[0],cameraAxis[1]) end if
    return [Orientation(surfaceOrigin,[surfaceAxis0,surfaceAxis1,surfaceAxis2]),Orientation([entity.oldorigin[0],entity.oldorigin[1],entity.oldorigin[2]],cameraAxis),pvs,false,entityIndex]
  end for
  return void
end function

/// Builds `mq3.renderer.portal_view.View` using `mq3.shared.math.DotProduct`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_view.portalOrientation`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_view.portalOrientation`.
/// @param entities Value forwarded as `entities` to `mq3.renderer.portal_view.portalOrientation`.
/// @param timeMilliseconds Value forwarded as `timeMilliseconds` to `mq3.renderer.portal_view.portalOrientation`.
/// @param viewOrigin Value forwarded as `value` to `mq3.renderer.portal_view.valid3`.
/// @param viewAxis Indexed input read at `i`.
function prepare(normal,dist,entities,timeMilliseconds,viewOrigin,viewAxis)
  if not valid3(viewOrigin) or viewAxis==void or len(viewAxis)!=3 then return fail("source view is malformed") end if
  found=portalOrientation(normal,dist,entities,timeMilliseconds);if found is error or found==void then return found end if
  surface=found[0];camera=found[1];outputAxis=[]
  for i=0 to 2 outputAxis=outputAxis+[mirrorVector(viewAxis[i],surface,camera)] end for
  planeNormal=negate(camera.axis[0]);planeDist=qmath.DotProduct(camera.origin,planeNormal)
  return View(surface,camera,found[2],found[3],mirrorPoint(viewOrigin,surface,camera),outputAxis,planeNormal,planeDist,found[4])
end function
