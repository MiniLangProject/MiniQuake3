// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Patch collision tests from cm_patch.c. Geometry is generated in MiniLang.
package mq3.collision.patchtrace
import mq3.compat.numeric as n
import mq3.qcommon.headers as qcommonHeaders
import mq3.shared.math as q
import mq3.collision.patchmesh as mesh
import mq3.collision.winding as w

/// Adjusted record for collision.patchtrace, containing `plane`, `start`, `finish`.
struct Adjusted
  plane
  start
  finish
end struct
/// Clip record for collision.patchtrace, containing `enter`, `leave`, `hit`.
struct Clip
  enter
  leave
  hit
end struct
/// DebugState record for collision.patchtrace, containing `patch`, `facet`.
struct DebugState
  patch
  facet
end struct

/// Create `mq3.collision.patchtrace.DebugState` with patch=void; facet=- 1.
function CM_ClearLevelPatches() return DebugState(void,-1) end function
/// Compute draw debug surface in collision.patchtrace; the normal completion returns `result`.
/// @param state Record exposing `patch`, `facet`.
function CM_DrawDebugSurface(state)
  if state==void or state.patch==void then return [] end if
  result=[];index=0
  while index<len(state.patch.facets)
    if state.facet<0 or state.facet==index then
      points=mesh.facetWinding(state.patch,state.patch.facets[index],true)
      if len(points)>0 then result=result+[points] end if
    end if
    index=index+1
  end while
  return result
end function

/// Project the box support corner selected by the plane sign bits onto the plane normal.
/// @param work Trace work record with three-element mins and maxs bounds.
/// @param signbits Low three bits select maxs instead of mins for X, Y, and Z.
/// @param normal Three-element plane-normal vector.
/// @returns The binary32 dot product of the selected corner and the normal.
function cornerDot(work,signbits as int,normal as array) returns float
  x=work.mins[0];y=work.mins[1];z=work.mins[2]
  if (signbits&1)!=0 then x=work.maxs[0] end if
  if (signbits&2)!=0 then y=work.maxs[1] end if
  if (signbits&4)!=0 then z=work.maxs[2] end if
  return n.dot3(x,y,z,normal[0],normal[1],normal[2])
end function

/// Compute adjusted in collision.patchtrace; the normal completion returns `Adjusted(mesh.Plane(normal, distance, p.signbits), a, b)`.
/// @param work Record exposing `start`, `finish`, `capsule`, `radius`, `capsuleOffset`.
/// @param original Record exposing `signbits`.
/// @param inward Inward operand used by `adjusted`; its reads are shown in the implementation.
/// @param border Border operand used by `adjusted`; its reads are shown in the implementation.
function adjusted(work,original,inward,border)
  p = original
  if inward then p = mesh.inverted(p,false) end if
  normal = p.normal;distance = p.distance;a = work.start;b = work.finish
  if work.capsule then
    distance = n.fadd(distance,work.radius)
    if q.DotProduct(normal,work.capsuleOffset) > 0 then
      a = w.subtract(a,work.capsuleOffset);b = w.subtract(b,work.capsuleOffset)
    else
      a = w.add(a,work.capsuleOffset);b = w.add(b,work.capsuleOffset)
    end if
  else
    offset = cornerDot(work,original.signbits,normal)
    if border then distance = n.fadd(distance,q.Q_fabs(offset)) else distance = n.fsub(distance,offset) end if
  end if
  return Adjusted(mesh.Plane(normal,distance,p.signbits),a,b)
end function

/// Check plane in collision.patchtrace; the normal completion returns `true`.
///
/// Direct state writes: `clip.hit`, `clip.enter`, `clip.leave`.
/// @param adjusted Record exposing `plane`, `start`, `finish`.
/// @param clip Record exposing `enter`, `leave`. Updated in place: `hit`, `enter`, `leave`.
function checkPlane(adjusted,clip)
  clip.hit = false
  p = adjusted.plane
  d1 = n.fsub(q.DotProduct(adjusted.start,p.normal),p.distance)
  d2 = n.fsub(q.DotProduct(adjusted.finish,p.normal),p.distance)
  if d1 > 0 and (d2 >= qcommonHeaders.SURFACE_CLIP_EPSILON or d2 >= d1) then return false end if
  if d1 <= 0 and d2 <= 0 then return true end if
  if d1 > d2 then
    fraction = n.f32((d1-qcommonHeaders.SURFACE_CLIP_EPSILON)/n.fsub(d1,d2))
    if fraction < 0 then fraction = n.f32(0) end if
    if fraction > clip.enter then clip.enter = fraction;clip.hit = true end if
  else
    fraction = n.f32((d1+qcommonHeaders.SURFACE_CLIP_EPSILON)/n.fsub(d1,d2))
    if fraction > 1 then fraction = n.f32(1) end if
    if fraction < clip.leave then clip.leave = fraction end if
  end if
  return true
end function
/// Return `mq3.collision.patchtrace.checkPlane(adjusted, clip)` from `collision.patchtrace.CM_CheckFacetPlane`.
/// @param adjusted Adjusted passed as `adjusted` to `mq3.collision.patchtrace.checkPlane`.
/// @param clip Clip passed as `clip` to `mq3.collision.patchtrace.checkPlane`.
function CM_CheckFacetPlane(adjusted,clip) return checkPlane(adjusted,clip) end function

/// Trace point in collision.patchtrace.
/// @param work Record exposing `isPoint`, `start`, `finish`, `trace`.
/// @param patch Record exposing `planes`, `facets`.
/// @param playerCurveClip Player curve clip used in `(not playerCurveClip or not work.isPoint)`.
function tracePoint(work,patch,playerCurveClip)
  if not playerCurveClip or not work.isPoint then return void end if
  front = array(len(patch.planes),false);intersections = array(len(patch.planes),0.0)
  i = 0
  while i < len(patch.planes)
    p = patch.planes[i]
    offset = cornerDot(work,p.signbits,p.normal)
    d1 = n.fadd(n.fsub(q.DotProduct(work.start,p.normal),p.distance),offset)
    d2 = n.fadd(n.fsub(q.DotProduct(work.finish,p.normal),p.distance),offset)
    front[i] = d1 > 0
    intersect = n.f32(99999)
    if d1 != d2 then
      intersect = n.fdiv(d1,n.fsub(d1,d2))
      if intersect <= 0 then intersect = n.f32(99999) end if
    end if
    intersections[i] = intersect;i = i+1
  end while
  for each facet in patch.facets
    if not front[facet.surface] then continue end if
    intersect = intersections[facet.surface]
    if intersect < 0 or intersect > work.trace.fraction then continue end if
    valid = true;j = 0
    while j < len(facet.borders)
      k = facet.borders[j]
      if front[k] != (facet.inward[j] != 0) then
        if intersections[k] > intersect then valid = false;break end if
      else
        if intersections[k] < intersect then valid = false;break end if
      end if
      j = j+1
    end while
    if valid then
      p = patch.planes[facet.surface]
      offset = cornerDot(work,p.signbits,p.normal)
      d1 = n.fadd(n.fsub(q.DotProduct(work.start,p.normal),p.distance),offset)
      d2 = n.fadd(n.fsub(q.DotProduct(work.finish,p.normal),p.distance),offset)
      fraction = n.f32((d1-qcommonHeaders.SURFACE_CLIP_EPSILON)/n.fsub(d1,d2))
      if fraction < 0 then fraction = n.f32(0) end if
      work.trace.fraction = fraction;work.trace.normal = p.normal;work.trace.distance = p.distance
      // Original patch hits leave plane type/signbits from the preceding trace.
    end if
  end for
  return void
end function
/// Return `mq3.collision.patchtrace.tracePoint(work, patch, playerCurveClip)` from `collision.patchtrace.CM_TracePointThroughPatchCollide`.
/// @param work Work passed as `work` to `mq3.collision.patchtrace.tracePoint`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchtrace.tracePoint`.
/// @param playerCurveClip Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.tracePoint`.
function CM_TracePointThroughPatchCollide(work,patch,playerCurveClip) return tracePoint(work,patch,playerCurveClip) end function

/// Trace patchtrace in collision.patchtrace.
/// @param work Record exposing `isPoint`, `trace`.
/// @param patch Record exposing `facets`, `planes`.
/// @param playerCurveClip Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.CM_TracePointThroughPatchCollide`.
function trace(work,patch,playerCurveClip)
  if work.isPoint then return CM_TracePointThroughPatchCollide(work,patch,playerCurveClip) end if
  clip=Clip(-1.0,1.0,false)
  for each facet in patch.facets
    clip.enter=-1.0;clip.leave=1.0;clip.hit=false
    hitnum = -1;best = void
    candidate = adjusted(work,patch.planes[facet.surface],false,false)
    if not CM_CheckFacetPlane(candidate,clip) then continue end if
    if clip.hit then best = candidate.plane end if
    j = 0;valid = true
    while j < len(facet.borders)
      candidate = adjusted(work,patch.planes[facet.borders[j]],facet.inward[j]!=0,true)
      if not CM_CheckFacetPlane(candidate,clip) then valid = false;break end if
      if clip.hit then hitnum = j;best = candidate.plane end if
      j = j+1
    end while
    if not valid or hitnum == len(facet.borders)-1 then continue end if
    if clip.enter < clip.leave and clip.enter >= 0 and clip.enter < work.trace.fraction then
      work.trace.fraction = clip.enter;work.trace.normal = best.normal;work.trace.distance = best.distance
    end if
  end for
  return void
end function
/// Return `mq3.collision.patchtrace.trace(work, patch, playerCurveClip)` from `collision.patchtrace.CM_TraceThroughPatchCollide`.
/// @param work Work passed as `work` to `mq3.collision.patchtrace.trace`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchtrace.trace`.
/// @param playerCurveClip Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.trace`.
function CM_TraceThroughPatchCollide(work,patch,playerCurveClip) return trace(work,patch,playerCurveClip) end function

/// Test position test in collision.patchtrace; the normal completion returns `false`.
/// @param work Record exposing `isPoint`.
/// @param patch Record exposing `facets`, `planes`.
function positionTest(work,patch)
  if work.isPoint then return false end if
  for each facet in patch.facets
    candidate = adjusted(work,patch.planes[facet.surface],false,false)
    if n.fsub(q.DotProduct(candidate.plane.normal,candidate.start),candidate.plane.distance) > 0 then continue end if
    valid = true;j = 0
    while j < len(facet.borders)
      candidate = adjusted(work,patch.planes[facet.borders[j]],facet.inward[j]!=0,true)
      if n.fsub(q.DotProduct(candidate.plane.normal,candidate.start),candidate.plane.distance) > 0 then valid = false;break end if
      j = j+1
    end while
    if valid then return true end if
  end for
  return false
end function
/// Return `mq3.collision.patchtrace.positionTest(work, patch)` from `collision.patchtrace.CM_PositionTestInPatchCollide`.
/// @param work Work passed as `work` to `mq3.collision.patchtrace.positionTest`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchtrace.positionTest`.
function CM_PositionTestInPatchCollide(work,patch) return positionTest(work,patch) end function
