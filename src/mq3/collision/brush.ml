// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CM_TraceThroughBrush kernel from qcommon/cm_trace.c. BSP traversal is separate.
package mq3.collision.brush
import mq3.compat.numeric as n
import mq3.shared.math as q

/// Clip a swept box against packed convex-brush planes using strict binary32 arithmetic.
/// @param planes Read-only normal/distance records, four binary32 values per plane.
/// @param planeBytes Packed-plane byte length, divisible by 16.
/// @param ax X component of the sweep start.
/// @param ay Y component of the sweep start.
/// @param az Z component of the sweep start.
/// @param bx X component of the sweep end.
/// @param by Y component of the sweep end.
/// @param bz Z component of the sweep end.
/// @param lx X component of the moving box minimum.
/// @param ly Y component of the moving box minimum.
/// @param lz Z component of the moving box minimum.
/// @param hx X component of the moving box maximum.
/// @param hy Y component of the moving box maximum.
/// @param hz Z component of the moving box maximum.
/// @param limit Current nearest-hit fraction limiting the sweep.
/// @param output Writable buffer for the binary32 collision fraction when a hit is reported.
/// @returns The native brush-classification status; a negative result rejects invalid input, and statuses at least 3 also write the hit fraction.
extern function clipConvexNative(planes as ptr,planeBytes as i32,ax as double,ay as double,az as double,bx as double,by as double,bz as double,lx as double,ly as double,lz as double,hx as double,hy as double,hz as double,limit as double,output as bytes) from "miniquake3_qvm.dll" symbol "mq3_trace_convex_brush" returns i32

/// Plane record for collision.brush, containing `normal`, `distance`, `flags`.
struct Plane
  normal
  distance
  flags
end struct

/// Trace record for collision.brush, containing `fraction`, `normal`, `distance`, `surfaceFlags`, `contents`, `startsolid`, and 2 further fields.
struct Trace
  fraction
  normal
  distance
  surfaceFlags
  contents
  startsolid
  allsolid
  planeMetadata
end struct

/// Create `mq3.collision.brush.Trace` with fraction=n.f32(1); normal=[0.0, 0.0, 0.0]; distance=0.0; surfaceFlags=0; contents=0; startsolid=false; allsolid=false; planeMetadata=0.
function emptyTrace()
  return Trace(n.f32(1), [0.0,0.0,0.0], 0.0, 0, 0, false, false,0)
end function

// BASIC MATH from cm_trace.c.  These stay here beside the brush kernel so
// capsule primitives and their differential tests share the exact binary32
// operation ordering of the original C translation unit.
/// @param point Point used in `point[0]` and `point[1]`.
/// @param start A passed as `a` to `mq3.shared.math.VectorMA`.
/// @param direction Right three-element vector.
function projectPointOntoVector(point, start, direction)
  delta = [n.fsub(point[0],start[0]),n.fsub(point[1],start[1]),n.fsub(point[2],start[2])]
  scale = q.DotProduct(delta,direction)
  return q.VectorMA(start,scale,direction)
end function

/// Compute vector distance squared in collision.brush; the normal completion returns `q.DotProduct(delta, delta)`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function vectorDistanceSquared(a,b)
  delta = [n.fsub(b[0],a[0]),n.fsub(b[1],a[1]),n.fsub(b[2],a[2])]
  return q.DotProduct(delta,delta)
end function

/// Compute distance from line squared in collision.brush; the normal completion returns `q.DotProduct(delta, delta)`.
/// @param point Point passed as `point` to `mq3.collision.brush.projectPointOntoVector`.
/// @param lineStart Start passed as `start` to `mq3.collision.brush.projectPointOntoVector`.
/// @param lineEnd Line end used in `lineEnd[axis]` and `lineEnd[outside]`.
/// @param direction Direction passed as `direction` to `mq3.collision.brush.projectPointOntoVector`.
function distanceFromLineSquared(point,lineStart,lineEnd,direction)
  projected = projectPointOntoVector(point,lineStart,direction)
  outside = -1
  for axis = 0 to 2
    if (projected[axis] > lineStart[axis] and projected[axis] > lineEnd[axis]) or (projected[axis] < lineStart[axis] and projected[axis] < lineEnd[axis]) then outside=axis;break end if
  end for
  endpoint = projected
  if outside >= 0 then
    if q.Q_fabs(n.fsub(projected[outside],lineStart[outside])) < q.Q_fabs(n.fsub(projected[outside],lineEnd[outside])) then endpoint=lineStart else endpoint=lineEnd end if
  end if
  delta = [n.fsub(point[0],endpoint[0]),n.fsub(point[1],endpoint[1]),n.fsub(point[2],endpoint[2])]
  return q.DotProduct(delta,delta)
end function

/// Compute square root float in collision.brush; the normal completion returns `n.fmul(number, y)`.
/// @param number Left floating-point operand.
function squareRootFloat(number)
  x = n.fmul(number,0.5)
  y = n.f32(number)
  bits = n.i32(n.floatBits(y))
  bits = n.i32(0x5f3759df - (bits >> 1))
  y = n.bitsFloat(bits)
  y = n.fmul(y,n.fsub(1.5,n.fmul(n.fmul(x,y),y)))
  y = n.fmul(y,n.fsub(1.5,n.fmul(n.fmul(x,y),y)))
  return n.fmul(number,y)
end function

/// Return `mq3.collision.brush.projectPointOntoVector(point, start, direction)` from `collision.brush.CM_ProjectPointOntoVector`.
/// @param point Point passed as `point` to `mq3.collision.brush.projectPointOntoVector`.
/// @param start Start passed as `start` to `mq3.collision.brush.projectPointOntoVector`.
/// @param direction Direction passed as `direction` to `mq3.collision.brush.projectPointOntoVector`.
function CM_ProjectPointOntoVector(point,start,direction) return projectPointOntoVector(point,start,direction) end function
/// Return `mq3.collision.brush.distanceFromLineSquared(point, lineStart, lineEnd, direction)` from `collision.brush.CM_DistanceFromLineSquared`.
/// @param point Point passed as `point` to `mq3.collision.brush.distanceFromLineSquared`.
/// @param lineStart Line start passed as `lineStart` to `mq3.collision.brush.distanceFromLineSquared`.
/// @param lineEnd Line end passed as `lineEnd` to `mq3.collision.brush.distanceFromLineSquared`.
/// @param direction Direction passed as `direction` to `mq3.collision.brush.distanceFromLineSquared`.
function CM_DistanceFromLineSquared(point,lineStart,lineEnd,direction) return distanceFromLineSquared(point,lineStart,lineEnd,direction) end function
/// Return `mq3.collision.brush.vectorDistanceSquared(a, b)` from `collision.brush.CM_VectorDistanceSquared`.
/// @param a A passed as `a` to `mq3.collision.brush.vectorDistanceSquared`.
/// @param b B passed as `b` to `mq3.collision.brush.vectorDistanceSquared`.
function CM_VectorDistanceSquared(a,b) return vectorDistanceSquared(a,b) end function
/// Return `mq3.collision.brush.squareRootFloat(number)` from `collision.brush.SquareRootFloat`.
/// @param number Number passed as `number` to `mq3.collision.brush.squareRootFloat`.
function SquareRootFloat(number) return squareRootFloat(number) end function

// The support point is consumed by one dot product. Keep the coordinates
// scalar so clipping a brush does not allocate a corner for every plane.
/// @param normal Normal used in `normal[0]` and `normal[1]`.
/// @param mins Mins used in `mins[0]` and `mins[1]`.
/// @param maxs Maxs used in `maxs[0]` and `maxs[1]`.
function boxSupportDot(normal as array,mins as array,maxs as array)
  x=mins[0];y=mins[1];z=mins[2]
  if normal[0]<0.0 then x=maxs[0] end if
  if normal[1]<0.0 then y=maxs[1] end if
  if normal[2]<0.0 then z=maxs[2] end if
  return n.dot3(x,y,z,normal[0],normal[1],normal[2])
end function

/// Set trace plane in collision.brush; updates `trace.normal`, `trace.distance`, `trace.surfaceFlags`.
///
/// Direct state writes: `trace.normal`, `trace.distance`, `trace.surfaceFlags`, `trace.planeMetadata`.
/// @param trace Updated in place: `normal`, `distance`, `surfaceFlags`, `planeMetadata`.
/// @param plane Record exposing `normal`, `distance`, `flags`.
function setTracePlane(trace,plane)
  trace.normal=plane.normal;trace.distance=plane.distance;trace.surfaceFlags=plane.flags
  kind=3;signbits=0
  for axis=0 to 2
    if plane.normal[axis]==1 and kind==3 then kind=axis end if
    if plane.normal[axis]<0 then signbits=signbits|(1<<axis) end if
  end for
  trace.planeMetadata=kind|(signbits<<8)
  return void
end function

/// Compute pack planes in collision.brush; the normal completion returns `result`.
/// @param planes Planes used in `len(planes)` and `(len(planes) * 16)`.
function packPlanes(planes)
  result=bytes(len(planes)*16,0);at=0
  for each plane in planes
    for axis=0 to 2
      n.writeU32(result,at+axis*4,n.floatBits(plane.normal[axis]))
    end for
    n.writeU32(result,at+12,n.floatBits(plane.distance));at=at+16
  end for
  return result
end function

/// Trace packed in collision.brush; the normal completion returns `trace`.
///
/// Direct state writes: `trace.startsolid`, `trace.allsolid`, `trace.fraction`, `trace.contents`.
/// @param trace Record exposing `fraction`. Updated in place: `startsolid`, `allsolid`, `fraction`, `contents`.
/// @param planes Planes passed as `planes` to `mq3.collision.brush.traceThroughBrush`.
/// @param packed Packed used in `len(packed)` and `nativeBytesPtr(packed)`.
/// @param contents Contents passed as `contents` to `mq3.collision.brush.traceThroughBrush`.
/// @param start Start passed as `start` to `mq3.collision.brush.traceThroughBrush`.
/// @param finish Finish passed as `finish` to `mq3.collision.brush.traceThroughBrush`.
/// @param mins Mins passed as `mins` to `mq3.collision.brush.traceThroughBrush`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.brush.traceThroughBrush`.
/// @param scratch Writable buffer for the binary32 collision fraction when a hit is reported.
function tracePacked(trace,planes,packed,contents,start,finish,mins,maxs,scratch)
  if len(planes)==0 then return trace end if
  hit=clipConvexNative(nativeBytesPtr(packed),len(packed),start[0],start[1],start[2],finish[0],finish[1],finish[2],mins[0],mins[1],mins[2],maxs[0],maxs[1],maxs[2],trace.fraction,scratch)
  if hit<0 then return traceThroughBrush(trace,planes,contents,start,finish,mins,maxs,false,0.0,void) end if
  if hit==1 or hit==2 then
    trace.startsolid=true
    if hit==2 then trace.allsolid=true;trace.fraction=0.0;trace.contents=contents end if
  else if hit>=3 then
    trace.fraction=n.bitsFloat(n.readU32(scratch,0));trace.contents=contents
    setTracePlane(trace,planes[hit-3])
  end if
  return trace
end function

/// Trace through brush in collision.brush; the normal completion returns `trace`.
///
/// Direct state writes: `trace.startsolid`, `trace.allsolid`, `trace.fraction`, `trace.contents`.
/// @param trace Record exposing `fraction`. Updated in place: `startsolid`, `allsolid`, `fraction`, `contents`.
/// @param planes Planes used in `len(planes)` and `(len(planes) == 0)`.
/// @param contents Contents operand used by `traceThroughBrush`; its reads are shown in the implementation.
/// @param start Left three-element vector.
/// @param finish Left three-element vector.
/// @param mins Mins passed as `mins` to `mq3.collision.brush.boxSupportDot`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.brush.boxSupportDot`.
/// @param capsule Capsule operand used by `traceThroughBrush`; its reads are shown in the implementation.
/// @param radius Right floating-point operand.
/// @param capsuleOffset Right three-element vector.
function traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
  if len(planes) == 0 then return trace end if
  enterFraction = n.f32(-1)
  leaveFraction = n.f32(1)
  startout = false
  getout = false
  lead = void
  for each plane in planes
    distance = plane.distance
    d1 = 0.0
    d2 = 0.0
    if capsule then
      distance = n.fadd(distance, radius)
      dot = q.DotProduct(plane.normal, capsuleOffset)
      startPoint = array(3, 0.0)
      endPoint = array(3, 0.0)
      for axis = 0 to 2
        if dot > 0.0 then
          startPoint[axis] = n.fsub(start[axis], capsuleOffset[axis])
          endPoint[axis] = n.fsub(finish[axis], capsuleOffset[axis])
        else
          startPoint[axis] = n.fadd(start[axis], capsuleOffset[axis])
          endPoint[axis] = n.fadd(finish[axis], capsuleOffset[axis])
        end if
      end for
      d1 = n.fsub(q.DotProduct(startPoint, plane.normal), distance)
      d2 = n.fsub(q.DotProduct(endPoint, plane.normal), distance)
    else
      distance = n.fsub(distance,boxSupportDot(plane.normal,mins,maxs))
      d1 = n.fsub(q.DotProduct(start, plane.normal), distance)
      d2 = n.fsub(q.DotProduct(finish, plane.normal), distance)
    end if
    if d2 > 0.0 then getout = true end if
    if d1 > 0.0 then startout = true end if
    if d1 > 0.0 and (d2 >= 0.125 or d2 >= d1) then return trace end if
    if d1 <= 0.0 and d2 <= 0.0 then continue end if
    if d1 > d2 then
      // SURFACE_CLIP_EPSILON is a C double literal. The numerator and division
      // use double precision before the final float assignment in the original.
      fraction = n.f32((d1 - 0.125) / n.fsub(d1, d2))
      if fraction < 0.0 then fraction = n.f32(0) end if
      if fraction > enterFraction then enterFraction = fraction; lead = plane end if
    else
      fraction = n.f32((d1 + 0.125) / n.fsub(d1, d2))
      if fraction > 1.0 then fraction = n.f32(1) end if
      if fraction < leaveFraction then leaveFraction = fraction end if
    end if
  end for
  if not startout then
    trace.startsolid = true
    if not getout then trace.allsolid = true; trace.fraction = n.f32(0); trace.contents = contents end if
    return trace
  end if
  if enterFraction < leaveFraction and enterFraction > -1.0 and enterFraction < trace.fraction then
    if enterFraction < 0.0 then enterFraction = n.f32(0) end if
    trace.fraction = enterFraction
    trace.contents = contents
    setTracePlane(trace,lead)
  end if
  return trace
end function

/// Return `mq3.collision.brush.traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)` from `collision.brush.CM_TraceThroughBrush`.
/// @param trace Trace passed as `trace` to `mq3.collision.brush.traceThroughBrush`.
/// @param planes Planes passed as `planes` to `mq3.collision.brush.traceThroughBrush`.
/// @param contents Contents passed as `contents` to `mq3.collision.brush.traceThroughBrush`.
/// @param start Start passed as `start` to `mq3.collision.brush.traceThroughBrush`.
/// @param finish Finish passed as `finish` to `mq3.collision.brush.traceThroughBrush`.
/// @param mins Mins passed as `mins` to `mq3.collision.brush.traceThroughBrush`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.brush.traceThroughBrush`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.brush.traceThroughBrush`.
/// @param radius Radius passed as `radius` to `mq3.collision.brush.traceThroughBrush`.
/// @param capsuleOffset Capsule offset passed as `capsuleOffset` to `mq3.collision.brush.traceThroughBrush`.
function CM_TraceThroughBrush(trace,planes,contents,start,finish,mins,maxs,capsule,radius,capsuleOffset)
  return traceThroughBrush(trace,planes,contents,start,finish,mins,maxs,capsule,radius,capsuleOffset)
end function
