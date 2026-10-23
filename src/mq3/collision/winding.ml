// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Winding operations needed by the original patch bevel generator.
package mq3.collision.winding
import mq3.compat.numeric as n
import mq3.shared.math as q

const SIDE_FRONT=0
const SIDE_BACK=1
const SIDE_ON=2
const SIDE_CROSS=3
const ON_EPSILON=0.1
const MAX_MAP_BOUNDS=65535.0
const MAX_POINTS_ON_WINDING=64
const MAX_HULL_POINTS=128

struct ManagedWinding points capacity freed end struct

function clonePoint(value) return [value[0],value[1],value[2]] end function
function clonePoints(points) result=[];for each point in points result=result+[clonePoint(point)] end for;return result end function

// Managed equivalents of the original zone-allocation helpers. Productive
// collision code uses plain point arrays; these retain the original lifetime
// errors for callers that need the explicit AllocWinding/FreeWinding surface.
function AllocWinding(points)
  if points<0 or points>MAX_POINTS_ON_WINDING then return error(3504,"AllocWinding: invalid point capacity") end if
  return ManagedWinding([],points,false)
end function
function FreeWinding(value)
  if value==void or value.freed then return error(3504,"FreeWinding: freed a freed winding") end if
  value.freed=true;value.points=[];return void
end function
function pw(points) lines=[];for each point in points lines=lines+[str(point[0])+","+str(point[1])+","+str(point[2])] end for;return lines end function

function add(a,b)
  return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]
end function
function subtract(a,b)
  return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]
end function
function negate(a)
  return [n.bitsFloat(n.floatBits(a[0])^0x80000000),n.bitsFloat(n.floatBits(a[1])^0x80000000),n.bitsFloat(n.floatBits(a[2])^0x80000000)]
end function

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

function WindingPlane(points)
  if len(points)<3 then return error(3504,"WindingPlane: fewer than three points") end if
  v1=subtract(points[1],points[0]);v2=subtract(points[2],points[0]);normal=q.VectorNormalize2(q.CrossProduct(v2,v1))
  return [normal,q.DotProduct(points[0],normal)]
end function

function WindingArea(points)
  if len(points)<3 then return 0.0 end if
  total=0.0
  for i=2 to len(points)-1
    d1=subtract(points[i-1],points[0]);d2=subtract(points[i],points[0]);total=n.fadd(total,n.fmul(0.5,q.VectorLength(q.CrossProduct(d1,d2))))
  end for
  return total
end function

function WindingBounds(points) return bounds(points) end function
function WindingCenter(points)
  if len(points)==0 then return error(3504,"WindingCenter: empty winding") end if
  center=[0.0,0.0,0.0];for each point in points center=add(point,center) end for;return q.VectorScale(center,n.fdiv(1.0,n.f32(len(points))))
end function
function BaseWindingForPlane(normal,distance) return base(normal,distance) end function
function CopyWinding(points) return clonePoints(points) end function
function ReverseWinding(points) result=[];for i=0 to len(points)-1 result=result+[clonePoint(points[len(points)-1-i])] end for;return result end function

function classify(points,normal,distance,epsilon)
  dists=[];sides=[];counts=[0,0,0]
  for each point in points
    dot=n.fsub(q.DotProduct(point,normal),distance);side=SIDE_ON
    if dot>epsilon then side=SIDE_FRONT else if dot<n.fneg(epsilon) then side=SIDE_BACK end if
    dists=dists+[dot];sides=sides+[side];counts[side]=counts[side]+1
  end for
  return [dists,sides,counts]
end function

function splitPoint(p1,p2,d1,d2,normal,distance)
  fraction=n.fdiv(d1,n.fsub(d1,d2));mid=array(3,0.0)
  for axis=0 to 2
    if normal[axis]==1.0 then mid[axis]=distance
    else if normal[axis]==-1.0 then mid[axis]=n.fneg(distance)
    else mid[axis]=n.fadd(p1[axis],n.fmul(fraction,n.fsub(p2[axis],p1[axis]))) end if
  end for
  return mid
end function

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

function ChopWindingInPlace(points,normal,distance,epsilon)
  split=ClipWindingEpsilon(points,normal,distance,epsilon);if split is error then return split end if;return split[0]
end function
function ChopWinding(points,normal,distance) return ChopWindingInPlace(points,normal,distance,ON_EPSILON) end function

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

function WindingOnPlaneSide(points,normal,distance)
  front=false;back=false
  for each point in points
    value=n.fsub(q.DotProduct(point,normal),distance)
    if value<n.fneg(ON_EPSILON) then if front then return SIDE_CROSS end if;back=true
    else if value>ON_EPSILON then if back then return SIDE_CROSS end if;front=true end if
  end for
  if back then return SIDE_BACK end if;if front then return SIDE_FRONT end if;return SIDE_ON
end function

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
