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

struct AxisLine start finish color end struct
struct AxisSurface lines lineWidth end struct
struct DisplayListCall listNum end struct
struct EntityInput reType origin oldOrigin radius rotation shaderRGBA end struct
struct ViewInput origin axis isMirror end struct

function fail(text) return error(7780,"tr_surface: "+text) end function
function valid3(value) return value!=void and len(value)==3 end function
function validAxis(value) return value!=void and len(value)==3 and valid3(value[0]) and valid3(value[1]) and valid3(value[2]) end function

function RB_CheckOverflow(buffer,vertexes,indexes) return polychain.checkOverflow(buffer,vertexes,indexes) end function
function RB_AddQuadStampExt(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return entities.addQuadStampExt(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
function RB_AddQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  return entities.addQuadStamp(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
function RB_SurfaceSprite(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if entity==void or view==void or not validAxis(view.axis) then return fail("malformed sprite context") end if
  return entities.surfaceSprite(entity.origin,entity.radius,entity.rotation,entity.shaderRGBA,view.axis[1],view.axis[2],view.axis[0],view.isMirror,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
end function
function RB_SurfacePolychain(buffer,vertices) return polychain.append(buffer,vertices) end function
function RB_SurfaceTriangles(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  return mesh.submitTriangles(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
end function
function RB_SurfaceBeam(entity) if entity==void then return fail("missing beam entity") end if;return beam.build(entity.origin,entity.oldOrigin) end function
function DoRailCore(start,finish,up,lengthValue,spanWidth,color) return trails.railCoreRaw(start,finish,up,lengthValue,spanWidth,color) end function
function DoRailDiscs(numSegments,start,direction,right,up,spanWidth,color) return trails.railDiscs(numSegments,start,direction,right,up,spanWidth,color) end function
function RB_SurfaceRailRings(entity,segmentLength,spanWidth) if entity==void then return fail("missing rail-ring entity") end if;return trails.railRings(entity.oldOrigin,entity.origin,segmentLength,spanWidth,entity.shaderRGBA) end function
function RB_SurfaceRailCore(entity,view,spanWidth) if entity==void or view==void then return fail("missing rail-core context") end if;return trails.railCore(entity.oldOrigin,entity.origin,view.origin,spanWidth,entity.shaderRGBA) end function
function RB_SurfaceLightningBolt(entity,view) if entity==void or view==void then return fail("missing lightning context") end if;return trails.lightning(entity.origin,entity.oldOrigin,view.origin,entity.shaderRGBA) end function

// The C routine mutates vec4_t rows.  Returning normalized vec3 rows gives
// callers the same values while keeping the MiniLang API allocation safe.
function VectorArrayNormalize(normals,count)
  if normals==void or count<0 or count>len(normals) then return fail("normal array count outside input") end if
  result=[]
  for index=0 to count-1
    value=normals[index];if not valid3(value) and (value==void or len(value)!=4) then return fail("malformed normal") end if
    result=result+[md3.normalizeFast([value[0],value[1],value[2]])]
  end for
  return result
end function
function LerpMeshVertexes(surface,frame,oldFrame,backlerp) return md3.lerpVertexes(surface,frame,oldFrame,backlerp) end function
function RB_SurfaceMesh(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)
  return md3.submit(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)
end function
function RB_SurfaceFace(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
  return mesh.submitFace(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)
end function

// Exact LodErrorForVolume transform and clamp.  axis rows are the entity's
// local basis and viewForward is viewParms.or.axis[0].
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
function RB_SurfaceEntity(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes,railSegmentLength,railWidth,railCoreWidth)
  if entity==void or view==void then return fail("missing entity context") end if
  if entity.reType==RT_SPRITE then return RB_SurfaceSprite(entity,view,currentVertexes,currentIndexes,maxVertexes,maxIndexes) end if
  if entity.reType==RT_BEAM then return RB_SurfaceBeam(entity) end if
  if entity.reType==RT_RAIL_CORE then return RB_SurfaceRailCore(entity,view,railCoreWidth) end if
  if entity.reType==RT_RAIL_RINGS then return RB_SurfaceRailRings(entity,railSegmentLength,railWidth) end if
  if entity.reType==RT_LIGHTNING then return RB_SurfaceLightningBolt(entity,view) end if
  return RB_SurfaceAxis()
end function
function RB_SurfaceBad(surface) return fail("bad surface tessellated") end function

// The active Baseq3 build intentionally makes flares a no-op in tr_surface.c;
// flare visibility/drawing is handled by the dedicated flare renderer.
function RB_SurfaceFlare(surface) return void end function
// Display lists are a real legacy backend command, retained as a typed command
// so a GL backend can issue qglCallList after RB_BeginSurface state setup.
function RB_SurfaceDisplayList(surface) if surface==void or surface.listNum<0 then return fail("invalid display list") end if;return DisplayListCall(surface.listNum) end function
function RB_SurfaceSkip(surface) return void end function
