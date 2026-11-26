// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Winding operations needed by the original patch bevel generator.
package mq3.collision.winding
import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.qcommon.headers as qcommonHeaders

const SIDE_FRONT=qcommonHeaders.SIDE_FRONT
const SIDE_BACK=qcommonHeaders.SIDE_BACK
const SIDE_ON=qcommonHeaders.SIDE_ON
const SIDE_CROSS=qcommonHeaders.SIDE_CROSS
const ON_EPSILON=qcommonHeaders.ON_EPSILON
const MAX_MAP_BOUNDS=qcommonHeaders.MAX_MAP_BOUNDS
const MAX_POINTS_ON_WINDING=qcommonHeaders.MAX_POINTS_ON_WINDING
const MAX_HULL_POINTS=128

/// ManagedWinding record for collision.winding, containing `points`, `capacity`, `freed`.
struct ManagedWinding points capacity freed end struct

/// Compute collision.winding.clonePoint as `[value[0], value[1], value[2]]`.
/// @param value Value used in `value[0]` and `value[1]`.
function clonePoint(value) return [value[0],value[1],value[2]] end function
/// Compute clone points in collision.winding; the normal completion returns `result`.
/// @param points Sequence traversed as `point` by the loop in `clonePoints`.
function clonePoints(points) result=[];for each point in points result=result+[clonePoint(point)] end for;return result end function

// Managed equivalents of the original zone-allocation helpers. Productive
// collision code uses plain point arrays; these retain the original lifetime
// errors for callers that need the explicit AllocWinding/FreeWinding surface.
/// @param points Initial `capacity` field stored in the returned or constructed `mq3.collision.winding.ManagedWinding` record.
function AllocWinding(points)
  if points<0 or points>MAX_POINTS_ON_WINDING then return error(3504,"AllocWinding: invalid point capacity") end if
  return ManagedWinding([],points,false)
end function
/// Update `value.freed`, `value.points` in collision.winding.
///
/// Validation failures include `FreeWinding: freed a freed winding`.
/// Direct state writes: `value.freed`, `value.points`.
/// @param value Record exposing `freed`. Updated in place: `freed`, `points`.
function FreeWinding(value)
  if value==void or value.freed then return error(3504,"FreeWinding: freed a freed winding") end if
  value.freed=true;value.points=[];return void
end function
/// Compute pw in collision.winding; the normal completion returns `lines`.
/// @param points Sequence traversed as `point` by the loop in `pw`.
function pw(points) lines=[];for each point in points lines=lines+[str(point[0])+","+str(point[1])+","+str(point[2])] end for;return lines end function

/// Compute collision.winding.add as `[n.fadd(a[0], b[0]), n.fadd(a[1], b[1]), n.fadd(a[2], b[2])]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function add(a,b)
  return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]
end function
/// Compute collision.winding.subtract as `[n.fsub(a[0], b[0]), n.fsub(a[1], b[1]), n.fsub(a[2], b[2])]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function subtract(a,b)
  return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]
end function
/// Compute collision.winding.negate as `[n.bitsFloat((n.floatBits(a[0]) ^ 2147483648)), n.bitsFloat((n.floatBits(a[1]) ^ 2147483648)), n.bitsFloat((n.floatBits(a[2]) ^ 2147483648))]`.
/// @param a A used in `a[0]` and `a[1]`.
function negate(a)
  return [n.bitsFloat(n.floatBits(a[0])^0x80000000),n.bitsFloat(n.floatBits(a[1])^0x80000000),n.bitsFloat(n.floatBits(a[2])^0x80000000)]
end function

/// Apply `mq3.shared.math.Q_fabs`, `mq3.shared.math.VectorNormalize2`, `mq3.shared.math.VectorMA` for base in collision.winding.
///
/// Validation failures include `Winding: no plane axis`.
/// @param normal B passed as `b` to `mq3.shared.math.VectorMA`.
/// @param distance Scale passed as `scale` to `mq3.shared.math.VectorScale`.
function base(normal, distance)
  largest = -65535.0; axis = -1
  for i = 0 to 2
    value = q.Q_fabs(normal[i])
    if value > largest then largest = value; axis = i end if
  end for
  if axis < 0 then return error(3504,"Winding: no plane axis") end if
  up = [0.0,0.0,1.0]
  if axis == 2 then up = [1.0,0.0,0.0] end if
  up = q.VectorNormalize2(q.VectorMA(up,n.fneg(q.DotProduct(up,normal)),normal))
  origin = q.VectorScale(normal,distance)
  right = q.CrossProduct(up,normal)
  up = q.VectorScale(up,65535.0); right = q.VectorScale(right,65535.0)
  return [add(subtract(origin,right),up),add(add(origin,right),up),subtract(add(origin,right),up),subtract(subtract(origin,right),up)]
end function

/// Compute bounds in collision.winding; the normal completion returns `[mins, maxs]`.
/// @param points Sequence traversed as `point` by the loop in `bounds`.
function bounds(points)
  mins = [99999.0,99999.0,99999.0]; maxs = [-99999.0,-99999.0,-99999.0]
  for each point in points
    for axis = 0 to 2
      if point[axis] < mins[axis] then mins[axis] = point[axis] end if
      if point[axis] > maxs[axis] then maxs[axis] = point[axis] end if
    end for
  end for
  return [mins,maxs]
end function

/// Remove colinear points in collision.winding; the normal completion returns `result`.
/// @param points Points passed as `points` to `mq3.collision.winding.clonePoints`.
function RemoveColinearPoints(points)
  if len(points)<3 then return clonePoints(points) end if
  result=[]
  for i=0 to len(points)-1
    next=(i+1)%len(points);previous=(i+len(points)-1)%len(points)
    v1=q.VectorNormalize2(subtract(points[next],points[i]));v2=q.VectorNormalize2(subtract(points[i],points[previous]))
    if q.DotProduct(v1,v2)<0.999 then result=result+[clonePoint(points[i])] end if
  end for
  return result
end function

/// Compute winding plane in collision.winding; the normal completion returns `[normal, q.DotProduct(points[0], normal)]`.
///
/// Validation failures include `WindingPlane: fewer than three points`.
/// @param points Points used in `points[1]` and `points[0]`.
function WindingPlane(points)
  if len(points)<3 then return error(3504,"WindingPlane: fewer than three points") end if
  v1=subtract(points[1],points[0]);v2=subtract(points[2],points[0]);normal=q.VectorNormalize2(q.CrossProduct(v2,v1))
  return [normal,q.DotProduct(points[0],normal)]
end function

/// Compute winding area in collision.winding; the normal completion returns `total`.
/// @param points Points used in `points[0]` and `points[i]`.
function WindingArea(points)
  if len(points)<3 then return 0.0 end if
  total=0.0
  for i=2 to len(points)-1
    d1=subtract(points[i-1],points[0]);d2=subtract(points[i],points[0]);total=n.fadd(total,n.fmul(0.5,q.VectorLength(q.CrossProduct(d1,d2))))
  end for
  return total
end function

/// Return `mq3.collision.winding.bounds(points)` from `collision.winding.WindingBounds`.
/// @param points Points passed as `points` to `mq3.collision.winding.bounds`.
function WindingBounds(points) return bounds(points) end function
/// Compute winding center in collision.winding; the normal completion returns `q.VectorScale(center, n.fdiv(1.0, n.f32(len(points))))`.
///
/// Validation failures include `WindingCenter: empty winding`.
/// @param points Points used in `len(points)` and `(len(points) == 0)`.
function WindingCenter(points)
  if len(points)==0 then return error(3504,"WindingCenter: empty winding") end if
  center=[0.0,0.0,0.0];for each point in points center=add(point,center) end for;return q.VectorScale(center,n.fdiv(1.0,n.f32(len(points))))
end function
/// Return `mq3.collision.winding.base(normal, distance)` from `collision.winding.BaseWindingForPlane`.
/// @param normal Normal passed as `normal` to `mq3.collision.winding.base`.
/// @param distance Distance passed as `distance` to `mq3.collision.winding.base`.
function BaseWindingForPlane(normal,distance) return base(normal,distance) end function
/// Return `mq3.collision.winding.clonePoints(points)` from `collision.winding.CopyWinding`.
/// @param points Points passed as `points` to `mq3.collision.winding.clonePoints`.
function CopyWinding(points) return clonePoints(points) end function
/// Compute reverse winding in collision.winding; the normal completion returns `result`.
/// @param points Points used in `len(points)` and `(len(points) - 1)`.
function ReverseWinding(points) result=[];for i=0 to len(points)-1 result=result+[clonePoint(points[len(points)-1-i])] end for;return result end function

/// Compute classify in collision.winding; the normal completion returns `[dists, sides, counts]`.
/// @param points Sequence traversed as `point` by the loop in `classify`.
/// @param normal Right three-element vector.
/// @param distance Right floating-point operand.
/// @param epsilon Floating-point value whose binary32 sign is toggled.
function classify(points,normal,distance,epsilon)
  dists=[];sides=[];counts=[0,0,0]
  for each point in points
    dot=n.fsub(q.DotProduct(point,normal),distance);side=SIDE_ON
    if dot>epsilon then side=SIDE_FRONT else if dot<n.fneg(epsilon) then side=SIDE_BACK end if
    dists=dists+[dot];sides=sides+[side];counts[side]=counts[side]+1
  end for
  return [dists,sides,counts]
end function

/// Compute split point in collision.winding; the normal completion returns `mid`.
/// @param p1 P 1 used in `p1[axis]` and `n.fsub(p2[axis], p1[axis])`.
/// @param p2 P 2 used in `p2[axis]` and `n.fsub(p2[axis], p1[axis])`.
/// @param d1 Left floating-point operand.
/// @param d2 Right floating-point operand.
/// @param normal Normal used in `normal[axis]` and `(normal[axis] == 1.0)`.
/// @param distance Floating-point value whose binary32 sign is toggled.
function splitPoint(p1,p2,d1,d2,normal,distance)
  fraction=n.fdiv(d1,n.fsub(d1,d2));mid=array(3,0.0)
  for axis=0 to 2
    if normal[axis]==1.0 then mid[axis]=distance
    else if normal[axis]==-1.0 then mid[axis]=n.fneg(distance)
    else mid[axis]=n.fadd(p1[axis],n.fmul(fraction,n.fsub(p2[axis],p1[axis]))) end if
  end for
  return mid
end function

/// Compute clip winding epsilon in collision.winding; the normal completion returns `[front, back]`.
///
/// Validation failures include `ClipWinding: point limit exceeded`.
/// @param points Points passed as `points` to `mq3.collision.winding.classify`.
/// @param normal Normal passed as `normal` to `mq3.collision.winding.classify`.
/// @param distance Distance passed as `distance` to `mq3.collision.winding.classify`.
/// @param epsilon Epsilon passed as `epsilon` to `mq3.collision.winding.classify`.
function ClipWindingEpsilon(points,normal,distance,epsilon)
  if len(points)==0 then return [void,void] end if
  classified=classify(points,normal,distance,epsilon);dists=classified[0];sides=classified[1];counts=classified[2]
  if counts[SIDE_FRONT]==0 then return [void,CopyWinding(points)] end if
  if counts[SIDE_BACK]==0 then return [CopyWinding(points),void] end if
  front=[];back=[]
  for i=0 to len(points)-1
    side=sides[i];point=points[i]
    if side==SIDE_ON then front=front+[clonePoint(point)];back=back+[clonePoint(point)]
    else
      if side==SIDE_FRONT then front=front+[clonePoint(point)] else back=back+[clonePoint(point)] end if
      next=(i+1)%len(points);if sides[next]!=SIDE_ON and sides[next]!=side then mid=splitPoint(point,points[next],dists[i],dists[next],normal,distance);front=front+[clonePoint(mid)];back=back+[clonePoint(mid)] end if
    end if
  end for
  limit=len(points)+4;if len(front)>limit or len(back)>limit or len(front)>MAX_POINTS_ON_WINDING or len(back)>MAX_POINTS_ON_WINDING then return error(3504,"ClipWinding: point limit exceeded") end if
  return [front,back]
end function

/// Compute chop winding in place in collision.winding; the normal completion returns `split[0]`.
/// @param points Points passed as `points` to `mq3.collision.winding.ClipWindingEpsilon`.
/// @param normal Normal passed as `normal` to `mq3.collision.winding.ClipWindingEpsilon`.
/// @param distance Distance passed as `distance` to `mq3.collision.winding.ClipWindingEpsilon`.
/// @param epsilon Epsilon passed as `epsilon` to `mq3.collision.winding.ClipWindingEpsilon`.
function ChopWindingInPlace(points,normal,distance,epsilon)
  split=ClipWindingEpsilon(points,normal,distance,epsilon);if split is error then return split end if;return split[0]
end function
/// Return `mq3.collision.winding.ChopWindingInPlace(points, normal, distance, ON_EPSILON)` from `collision.winding.ChopWinding`.
/// @param points Points passed as `points` to `mq3.collision.winding.ChopWindingInPlace`.
/// @param normal Normal passed as `normal` to `mq3.collision.winding.ChopWindingInPlace`.
/// @param distance Distance passed as `distance` to `mq3.collision.winding.ChopWindingInPlace`.
function ChopWinding(points,normal,distance) return ChopWindingInPlace(points,normal,distance,ON_EPSILON) end function

/// Check winding in collision.winding; the normal completion returns `true`.
///
/// Validation failures include `CheckWinding: fewer than three points`; `CheckWinding: area below one`; `CheckWinding: bogus range`.
/// @param points Points passed as `points` to `mq3.collision.winding.WindingArea`.
function CheckWinding(points)
  if len(points)<3 then return error(3504,"CheckWinding: fewer than three points") end if
  area=WindingArea(points);if area<1.0 then return error(3504,"CheckWinding: area below one") end if
  plane=WindingPlane(points);if plane is error then return plane end if;faceNormal=plane[0];faceDistance=plane[1]
  for i=0 to len(points)-1
    point=points[i]
    for axis=0 to 2 if point[axis]>MAX_MAP_BOUNDS or point[axis]<-MAX_MAP_BOUNDS then return error(3504,"CheckWinding: bogus range") end if end for
    distance=n.fsub(q.DotProduct(point,faceNormal),faceDistance);if distance<n.fneg(ON_EPSILON) or distance>ON_EPSILON then return error(3504,"CheckWinding: point off plane") end if
    next=(i+1)%len(points);direction=subtract(points[next],point);if q.VectorLength(direction)<ON_EPSILON then return error(3504,"CheckWinding: degenerate edge") end if
    edgeNormal=q.VectorNormalize2(q.CrossProduct(faceNormal,direction));edgeDistance=n.fadd(q.DotProduct(point,edgeNormal),ON_EPSILON)
    for j=0 to len(points)-1 if j!=i and q.DotProduct(points[j],edgeNormal)>edgeDistance then return error(3504,"CheckWinding: non-convex") end if end for
  end for
  return true
end function

/// Compute winding on plane side in collision.winding; the normal completion returns `SIDE_ON`.
/// @param points Sequence traversed as `point` by the loop in `WindingOnPlaneSide`.
/// @param normal Right three-element vector.
/// @param distance Right floating-point operand.
function WindingOnPlaneSide(points,normal,distance)
  front=false;back=false
  for each point in points
    value=n.fsub(q.DotProduct(point,normal),distance)
    if value<n.fneg(ON_EPSILON) then if front then return SIDE_CROSS end if;back=true
    else if value>ON_EPSILON then if back then return SIDE_CROSS end if;front=true end if
  end for
  if back then return SIDE_BACK end if;if front then return SIDE_FRONT end if;return SIDE_ON
end function

/// Add winding to convex hull in collision.winding; the normal completion returns `hullPoints`.
///
/// Validation failures include `AddWindingToConvexHull: point limit`.
/// @param points Points passed as `points` to `mq3.collision.winding.CopyWinding`.
/// @param hull Points passed as `points` to `mq3.collision.winding.CopyWinding`.
/// @param normal A passed as `a` to `mq3.shared.math.CrossProduct`.
function AddWindingToConvexHull(points,hull,normal)
  if hull==void or len(hull)==0 then return CopyWinding(points) end if
  hullPoints=CopyWinding(hull)
  for each point in points
    count=len(hullPoints);if count>=MAX_HULL_POINTS then return error(3504,"AddWindingToConvexHull: point limit") end if
    directions=[];sides=[];outside=false
    for j=0 to count-1
      next=(j+1)%count;direction=q.VectorNormalize2(subtract(hullPoints[next],hullPoints[j]));directions=directions+[q.CrossProduct(normal,direction)]
    end for
    for j=0 to count-1
      distance=q.DotProduct(subtract(point,hullPoints[j]),directions[j]);if distance>=ON_EPSILON then outside=true end if;sides=sides+[distance>=n.fneg(ON_EPSILON)]
    end for
    if outside then
      transition=-1;for j=0 to count-1 if not sides[j] and sides[(j+1)%count] then transition=j;break end if end for
      if transition>=0 then
        nextHull=[clonePoint(point)];start=(transition+1)%count
        for k=0 to count-1
          at=(start+k)%count;following=(at+1)%count
          if not (sides[at] and sides[following]) then nextHull=nextHull+[clonePoint(hullPoints[following])] end if
        end for
        if len(nextHull)>MAX_HULL_POINTS then return error(3504,"AddWindingToConvexHull: point limit") end if;hullPoints=nextHull
      end if
    end if
  end for
  return hullPoints
end function

/// Compute chop in collision.winding; the normal completion returns `result`.
///
/// Validation failures include `Winding: point limit exceeded`.
/// @param points Points used in `points[i]` and `len(points)`.
/// @param normal Right three-element vector.
/// @param distance Right floating-point operand.
function chop(points, normal, distance)
  if len(points) == 0 then return [] end if
  dists = array(len(points)+1,0.0); sides = array(len(points)+1,0)
  counts = [0,0,0]; epsilon = n.f32(0.1)
  i = 0
  while i < len(points)
    dot = n.fsub(q.DotProduct(points[i],normal),distance)
    dists[i] = dot
    side = 2
    if dot > epsilon then side = 0 else if dot < -epsilon then side = 1 end if
    sides[i] = side;counts[side] = counts[side]+1
    i = i+1
  end while
  sides[i] = sides[0];dists[i] = dists[0]
  if counts[0] == 0 then return [] end if
  if counts[1] == 0 then return points end if
  result = []
  i = 0
  while i < len(points)
    p1 = points[i]
    if sides[i] == 2 then result = result+[p1];i = i+1;continue end if
    if sides[i] == 0 then result = result+[p1] end if
    if sides[i+1] == 2 or sides[i+1] == sides[i] then i = i+1;continue end if
    p2 = points[(i+1)%len(points)]
    dot = n.fdiv(dists[i],n.fsub(dists[i],dists[i+1]))
    mid = array(3,0.0)
    for axis = 0 to 2
      if normal[axis] == 1 then
        mid[axis] = distance
      else if normal[axis] == -1 then
        mid[axis] = n.fneg(distance)
      else
        mid[axis] = n.fadd(p1[axis],n.fmul(dot,n.fsub(p2[axis],p1[axis])))
      end if
    end for
    result = result+[mid]
    i = i+1
  end while
  if len(result) > len(points)+4 or len(result) > 64 then return error(3504,"Winding: point limit exceeded") end if
  return result
end function
