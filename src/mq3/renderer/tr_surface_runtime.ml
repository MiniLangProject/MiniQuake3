// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for renderer/tr_surface.c.  The productive
// scene path and this facade share the same surface kernels; this file keeps
// the original C entry-point names available without a C compatibility shim.
package mq3.renderer.tr_surface_runtime

import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.renderer.surface_polychain as polychain
import mq3.renderer.surface_mesh as mesh
import mq3.renderer.surface_md3 as md3
import mq3.renderer.surface_grid as grid
import mq3.renderer.surface_entities as entities
import mq3.renderer.surface_trails as trails
import mq3.renderer.surface_beam as beam

const RT_SPRITE=2
const RT_BEAM=3
const RT_RAIL_CORE=4
const RT_RAIL_RINGS=5
const RT_LIGHTNING=6

/// Data record for `mq3.renderer.tr_surface_runtime.AxisLine`; groups `start`, `finish`, `color`.
struct AxisLine start finish color end struct
/// Data record for `mq3.renderer.tr_surface_runtime.AxisSurface`; groups `lines`, `lineWidth`.
struct AxisSurface lines lineWidth end struct
/// Data record for `mq3.renderer.tr_surface_runtime.DisplayListCall`; groups `listNum`.
struct DisplayListCall listNum end struct
/// Data record for `mq3.renderer.tr_surface_runtime.EntityInput`; groups `reType`, `origin`, `oldOrigin`, `radius`, `rotation`, `shaderRGBA`.
struct EntityInput reType origin oldOrigin radius rotation shaderRGBA end struct
/// Data record for `mq3.renderer.tr_surface_runtime.ViewInput`; groups `origin`, `axis`, `isMirror`.
struct ViewInput origin axis isMirror end struct

/// Creates error `7780` with message `"tr_surface: "+text`.
/// @param text Input used in the result expression `error(7780,"tr_surface: "+text)`.
function fail(text) return error(7780,"tr_surface: "+text) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.tr_surface_runtime.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Computes `value!=void and len(value)==3 and valid3(value[0]) and valid3(value[1]) and valid3(value[2])` for `mq3.renderer.tr_surface_runtime.validAxis`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function validAxis(value) return value!=void and len(value)==3 and valid3(value[0]) and valid3(value[1]) and valid3(value[2]) end function

/// Calls `mq3.renderer.surface_polychain.checkOverflow` with `(buffer,vertexes,indexes)` and returns its result.
/// @param buffer Argument 1 supplied to `mq3.renderer.surface_polychain.checkOverflow`.
/// @param vertexes Argument 2 supplied to `mq3.renderer.surface_polychain.checkOverflow`.
/// @param indexes Argument 3 supplied to `mq3.renderer.surface_polychain.checkOverflow`.
function RB_CheckOverflow(buffer,vertexes,indexes) return polychain.checkOverflow(buffer,vertexes,indexes) end function
/// Calls `mq3.renderer.surface_entities.addQuadStampExt` with `(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.
/// @param origin Argument 1 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param left Argument 2 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param up Argument 3 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param color Argument 4 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param viewForward Argument 5 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param s1 Argument 6 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param t1 Argument 7 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param s2 Argument 8 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param t2 Argument 9 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param currentVertexes Argument 10 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param currentIndexes Argument 11 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param maxVertexes Argument 12 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
/// @param maxIndexes Argument 13 supplied to `mq3.renderer.surface_entities.addQuadStampExt`.
function RB_AddQuadStampExt(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return entities.addQuadStampExt(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
/// Calls `mq3.renderer.surface_entities.addQuadStamp` with `(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.
/// @param origin Argument 1 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param left Argument 2 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param up Argument 3 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param color Argument 4 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param viewForward Argument 5 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param currentVertexes Argument 6 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param currentIndexes Argument 7 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param maxVertexes Argument 8 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
/// @param maxIndexes Argument 9 supplied to `mq3.renderer.surface_entities.addQuadStamp`.
function RB_AddQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return entities.addQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
/// Builds a camera-facing sprite using the view axes, mirror state, entity color, and tessellation capacities.
/// @param entity Record providing `entity.origin`, `entity.radius`, `entity.rotation`, `entity.shaderRGBA`.
/// @param view Record providing `view.axis`, `view.isMirror`.
/// @param currentVertexes Argument 9 supplied to `mq3.renderer.surface_entities.surfaceSprite`.
/// @param currentIndexes Argument 10 supplied to `mq3.renderer.surface_entities.surfaceSprite`.
/// @param maxVertexes Argument 11 supplied to `mq3.renderer.surface_entities.surfaceSprite`.
/// @param maxIndexes Argument 12 supplied to `mq3.renderer.surface_entities.surfaceSprite`.
function RB_SurfaceSprite(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if entity==void or view==void or not validAxis(view.axis) then return fail("malformed sprite context") end if
  return entities.surfaceSprite(entity.origin,entity.radius,entity.rotation,entity.shaderRGBA,view.axis[1],view.axis[2],view.axis[0],view.isMirror,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
/// Calls `mq3.renderer.surface_polychain.append` with `(buffer,vertices)` and returns its result.
/// @param buffer Argument 1 supplied to `mq3.renderer.surface_polychain.append`.
/// @param vertices Argument 2 supplied to `mq3.renderer.surface_polychain.append`.
function RB_SurfacePolychain(buffer,vertices) return polychain.append(buffer,vertices) end function
/// Calls `mq3.renderer.surface_mesh.submitTriangles` with `(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)` and returns its result.
/// @param surface Argument 1 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param smpFrame Argument 2 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param needsNormal Argument 3 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param currentVertexes Argument 4 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param currentIndexes Argument 5 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param maxVertexes Argument 6 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param maxIndexes Argument 7 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
/// @param currentDlightBits Argument 8 supplied to `mq3.renderer.surface_mesh.submitTriangles`.
function RB_SurfaceTriangles(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  return mesh.submitTriangles(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
end function
/// Returns `beam.build(entity.origin,entity.oldOrigin)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceBeam`; earlier branches return `fail("missing beam entity")`.
/// @param entity Record providing `entity.origin`, `entity.oldOrigin`.
function RB_SurfaceBeam(entity) if entity==void then return fail("missing beam entity") end if;return beam.build(entity.origin,entity.oldOrigin) end function
/// Calls `mq3.renderer.surface_trails.railCoreRaw` with `(start,finish,up,lengthValue,spanWidth,color)` and returns its result.
/// @param start Argument 1 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param finish Argument 2 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param up Argument 3 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param lengthValue Argument 4 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param spanWidth Argument 5 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param color Argument 6 supplied to `mq3.renderer.surface_trails.railCoreRaw`.
function DoRailCore(start,finish,up,lengthValue,spanWidth,color) return trails.railCoreRaw(start,finish,up,lengthValue,spanWidth,color) end function
/// Calls `mq3.renderer.surface_trails.railDiscs` with `(numSegments,start,direction,right,up,spanWidth,color)` and returns its result.
/// @param numSegments Argument 1 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param start Argument 2 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param direction Argument 3 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param right Argument 4 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param up Argument 5 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param spanWidth Argument 6 supplied to `mq3.renderer.surface_trails.railDiscs`.
/// @param color Argument 7 supplied to `mq3.renderer.surface_trails.railDiscs`.
function DoRailDiscs(numSegments,start,direction,right,up,spanWidth,color) return trails.railDiscs(numSegments,start,direction,right,up,spanWidth,color) end function
/// Returns `trails.railRings(entity.oldOrigin,entity.origin,segmentLength,spanWidth,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`; earlier branches return `fail("missing rail-ring entity")`.
/// @param entity Record providing `entity.oldOrigin`, `entity.origin`, `entity.shaderRGBA`.
/// @param segmentLength Argument 3 supplied to `mq3.renderer.surface_trails.railRings`.
/// @param spanWidth Argument 4 supplied to `mq3.renderer.surface_trails.railRings`.
function RB_SurfaceRailRings(entity,segmentLength,spanWidth) if entity==void then return fail("missing rail-ring entity") end if;return trails.railRings(entity.oldOrigin,entity.origin,segmentLength,spanWidth,entity.shaderRGBA) end function
/// Returns `trails.railCore(entity.oldOrigin,entity.origin,view.origin,spanWidth,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceRailCore`; earlier branches return `fail("missing rail-core context")`.
/// @param entity Record providing `entity.oldOrigin`, `entity.origin`, `entity.shaderRGBA`.
/// @param view Record providing `view.origin`.
/// @param spanWidth Argument 4 supplied to `mq3.renderer.surface_trails.railCore`.
function RB_SurfaceRailCore(entity,view,spanWidth) if entity==void or view==void then return fail("missing rail-core context") end if;return trails.railCore(entity.oldOrigin,entity.origin,view.origin,spanWidth,entity.shaderRGBA) end function
/// Returns `trails.lightning(entity.origin,entity.oldOrigin,view.origin,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceLightningBolt`; earlier branches return `fail("missing lightning context")`.
/// @param entity Record providing `entity.origin`, `entity.oldOrigin`, `entity.shaderRGBA`.
/// @param view Record providing `view.origin`.
function RB_SurfaceLightningBolt(entity,view) if entity==void or view==void then return fail("missing lightning context") end if;return trails.lightning(entity.origin,entity.oldOrigin,view.origin,entity.shaderRGBA) end function

// The C routine mutates vec4_t rows.  Returning normalized vec3 rows gives
// callers the same values while keeping the MiniLang API allocation safe.
/// @param normals Indexed input read at `index`.
/// @param count Input tested by `normals==void or count<0 or count>len(normals)`.
function VectorArrayNormalize(normals,count)
  if normals==void or count<0 or count>len(normals) then return fail("normal array count outside input") end if
  result=[]
  for index=0 to count-1
    value=normals[index];if not valid3(value) and (value==void or len(value)!=4) then return fail("malformed normal") end if
    result=result+[md3.normalizeFast([value[0],value[1],value[2]])]
  end for
  return result
end function
/// Calls `mq3.renderer.surface_md3.lerpVertexes` with `(surface,frame,oldFrame,backlerp)` and returns its result.
/// @param surface Argument 1 supplied to `mq3.renderer.surface_md3.lerpVertexes`.
/// @param frame Argument 2 supplied to `mq3.renderer.surface_md3.lerpVertexes`.
/// @param oldFrame Argument 3 supplied to `mq3.renderer.surface_md3.lerpVertexes`.
/// @param backlerp Argument 4 supplied to `mq3.renderer.surface_md3.lerpVertexes`.
function LerpMeshVertexes(surface,frame,oldFrame,backlerp) return md3.lerpVertexes(surface,frame,oldFrame,backlerp) end function
/// Calls `mq3.renderer.surface_md3.submit` with `(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)` and returns its result.
/// @param surface Argument 1 supplied to `mq3.renderer.surface_md3.submit`.
/// @param frame Argument 2 supplied to `mq3.renderer.surface_md3.submit`.
/// @param oldFrame Argument 3 supplied to `mq3.renderer.surface_md3.submit`.
/// @param backlerp Argument 4 supplied to `mq3.renderer.surface_md3.submit`.
/// @param currentVertexes Argument 5 supplied to `mq3.renderer.surface_md3.submit`.
/// @param currentIndexes Argument 6 supplied to `mq3.renderer.surface_md3.submit`.
/// @param maxVertexes Argument 7 supplied to `mq3.renderer.surface_md3.submit`.
/// @param maxIndexes Argument 8 supplied to `mq3.renderer.surface_md3.submit`.
/// @param dlightBits Argument 9 supplied to `mq3.renderer.surface_md3.submit`.
function RB_SurfaceMesh(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)
  return md3.submit(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)
end function
/// Calls `mq3.renderer.surface_mesh.submitFace` with `(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)` and returns its result.
/// @param surface Argument 1 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param smpFrame Argument 2 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param needsNormal Argument 3 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param currentVertexes Argument 4 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param currentIndexes Argument 5 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param maxVertexes Argument 6 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param maxIndexes Argument 7 supplied to `mq3.renderer.surface_mesh.submitFace`.
/// @param currentDlightBits Argument 8 supplied to `mq3.renderer.surface_mesh.submitFace`.
function RB_SurfaceFace(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  return mesh.submitFace(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
end function

// Exact LodErrorForVolume transform and clamp.  axis rows are the entity's
// local basis and viewForward is viewParms.or.axis[0].
/// @param local Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`.
/// @param radius Argument 2 supplied to `mq3.compat.numeric.fsub`.
/// @param lodCurveError Argument 1 supplied to `mq3.compat.numeric.fdiv`.
/// @param entityOrigin Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`.
/// @param entityAxis Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.validAxis`.
/// @param viewOrigin Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`.
/// @param viewForward Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`.
function LodErrorForVolume(local,radius,lodCurveError,entityOrigin,entityAxis,viewOrigin,viewForward)
  if not valid3(local) or not valid3(entityOrigin) or not validAxis(entityAxis) or not valid3(viewOrigin) or not valid3(viewForward) then return fail("malformed LOD context") end if
  if lodCurveError<0.0 then return 0.0 end if
  world=[]
  for component=0 to 2
    value=n.fadd(n.fadd(n.fmul(local[0],entityAxis[0][component]),n.fmul(local[1],entityAxis[1][component])),n.fmul(local[2],entityAxis[2][component]))
    world=world+[n.fadd(value,entityOrigin[component])]
  end for
  delta=[n.fsub(world[0],viewOrigin[0]),n.fsub(world[1],viewOrigin[1]),n.fsub(world[2],viewOrigin[2])];distance=qmath.DotProduct(delta,viewForward)
  if distance<0.0 then distance=n.fneg(distance) end if;distance=n.fsub(distance,radius);if distance<1.0 then distance=1.0 end if
  return n.fdiv(lodCurveError,distance)
end function
/// Computes `RB_SurfaceGrid` from `grid.submit(surface,value,maxVertexes,maxIndexes,needsNormal,dlightBits)` using `mq3.renderer.tr_surface_runtime.LodErrorForVolume`, `mq3.renderer.surface_grid.submit`.
/// @param surface Argument 1 supplied to `mq3.renderer.surface_grid.submit`.
/// @param lodOrigin Value forwarded as `local` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param lodRadius Value forwarded as `radius` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param lodCurveError Value forwarded as `lodCurveError` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param entityOrigin Value forwarded as `entityOrigin` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param entityAxis Value forwarded as `entityAxis` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param viewForward Value forwarded as `viewForward` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`.
/// @param maxVertexes Argument 3 supplied to `mq3.renderer.surface_grid.submit`.
/// @param maxIndexes Argument 4 supplied to `mq3.renderer.surface_grid.submit`.
/// @param needsNormal Argument 5 supplied to `mq3.renderer.surface_grid.submit`.
/// @param dlightBits Argument 6 supplied to `mq3.renderer.surface_grid.submit`.
function RB_SurfaceGrid(surface,lodOrigin,lodRadius,lodCurveError,entityOrigin,entityAxis,viewOrigin,viewForward,maxVertexes,maxIndexes,needsNormal,dlightBits)
  value=LodErrorForVolume(lodOrigin,lodRadius,lodCurveError,entityOrigin,entityAxis,viewOrigin,viewForward);if value is error then return value end if
  return grid.submit(surface,value,maxVertexes,maxIndexes,needsNormal,dlightBits)
end function

// Original null-model diagnostic geometry: three 16-unit colored axes.  It is
// exposed only for RT_MODEL fallback diagnostics and never substitutes a BSP,
// MD3 or generated entity surface in the productive renderer.
function RB_SurfaceAxis()
  return AxisSurface([AxisLine([0.0,0.0,0.0],[16.0,0.0,0.0],[255,0,0,255]),AxisLine([0.0,0.0,0.0],[0.0,16.0,0.0],[0,255,0,255]),AxisLine([0.0,0.0,0.0],[0.0,0.0,16.0],[0,0,255,255])],3.0)
end function

// Complete procedural entity dispatch from RB_SurfaceEntity.
/// @param entity Record providing `entity.reType`.
/// @param view Value forwarded as `view` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`.
/// @param currentVertexes Value forwarded as `currentVertexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`.
/// @param currentIndexes Value forwarded as `currentIndexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`.
/// @param maxVertexes Value forwarded as `maxVertexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`.
/// @param maxIndexes Value forwarded as `maxIndexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`.
/// @param railSegmentLength Value forwarded as `segmentLength` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`.
/// @param railWidth Value forwarded as `spanWidth` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`.
/// @param railCoreWidth Value forwarded as `spanWidth` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailCore`.
function RB_SurfaceEntity(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes,railSegmentLength,railWidth,railCoreWidth)
  if entity==void or view==void then return fail("missing entity context") end if
  if entity.reType==RT_SPRITE then return RB_SurfaceSprite(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes) end if
  if entity.reType==RT_BEAM then return RB_SurfaceBeam(entity) end if
  if entity.reType==RT_RAIL_CORE then return RB_SurfaceRailCore(entity,view,railCoreWidth) end if
  if entity.reType==RT_RAIL_RINGS then return RB_SurfaceRailRings(entity,railSegmentLength,railWidth) end if
  if entity.reType==RT_LIGHTNING then return RB_SurfaceLightningBolt(entity,view) end if
  return RB_SurfaceAxis()
end function
/// Calls `mq3.renderer.tr_surface_runtime.fail` with `("bad surface tessellated")` and returns its result.
/// @param surface Unused compatibility argument retained by this entry point.
function RB_SurfaceBad(surface) return fail("bad surface tessellated") end function

// The active Baseq3 build intentionally makes flares a no-op in tr_surface.c;
// flare visibility/drawing is handled by the dedicated flare renderer.
/// @param surface Unused compatibility argument retained by this entry point.
function RB_SurfaceFlare(surface) return void end function
// Display lists are a real legacy backend command, retained as a typed command
// so a GL backend can issue qglCallList after RB_BeginSurface state setup.
/// @param surface Record providing `surface.listNum`.
function RB_SurfaceDisplayList(surface) if surface==void or surface.listNum<0 then return fail("invalid display list") end if;return DisplayListCall(surface.listNum) end function
/// Returns `void` for the `mq3.renderer.tr_surface_runtime.RB_SurfaceSkip` compatibility entry point.
/// @param surface Unused compatibility argument retained by this entry point.
function RB_SurfaceSkip(surface) return void end function
