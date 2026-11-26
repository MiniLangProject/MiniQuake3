// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// World-polygon projection used by the original CG_CM_MARKFRAGMENTS trap.
package mq3.renderer.mark_fragments

import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as renderData
import mq3.collision.world as collision
import std.ds.list as lists
import std.ds.set as sets

const MAX_VERTS_ON_POLY=64
const MAX_MARK_SURFACES=64
const MAX_CACHED_MARK_TRIANGLES=4096
const MAX_CACHED_FACE_TRIANGLES=16384
const MIN_FACE_CACHE_TRIANGLES=768
const SURF_NOIMPACT=0x10
const SURF_NOMARKS=0x20
const CONTENTS_FOG=0x40
const FACE_STRIDE=104
const SHADER_STRIDE=72

/// Data record for `mq3.renderer.mark_fragments.Plane`; groups `normal`, `distance`.
struct Plane normal distance end struct
/// Data record for `mq3.renderer.mark_fragments.Fragment`; groups `firstPoint`, `numPoints`.
struct Fragment firstPoint numPoints end struct
/// Data record for `mq3.renderer.mark_fragments.Result`; groups `points`, `fragments`, `candidateSurfaces`, `testedTriangles`.
struct Result points fragments candidateSurfaces testedTriangles end struct
/// Data record for `mq3.renderer.mark_fragments.GeometryCache`; groups `map`, `data`, `dataPointer`, `slots`, `faceVisits`, `faceSerial`, and 5 further fields.
struct GeometryCache map data dataPointer slots faceVisits faceSerial faceMap faceDataPointer faceTriangles faceTriangleCount faceCacheEnabled end struct
/// Data record for `mq3.renderer.mark_fragments.FaceBatch`; groups `faces`, `triangles`.
struct FaceBatch faces triangles end struct

/// Constructs `mq3.renderer.mark_fragments.GeometryCache` with `map` = `void`, `data` = `void`, `dataPointer` = `0`, `slots` = `array(32,void)` and the supplied remaining values.
function geometryCache() return GeometryCache(void,void,0,array(32,void),void,0,void,0,void,0,false) end function

// A moving impact can hit the same ordered set of static faces with different
// clip planes. Keep only small batches. Projection bounds, clipping and output
// limits are still evaluated for each impact.
/// @param map Record providing `map.data`, `map.counts`.
/// @param faces Argument 2 supplied to `mq3.renderer.bsp_render_data.extractRetainedWithPatchError`.
/// @param cache Mutable record or buffer; this call updates `cache.slots`, `cache.faceTriangles`, `cache.faceTriangleCount`, `cache.faceCacheEnabled`, `cache.map`.
function markTriangles(map,faces,cache)
  if len(faces)==0 then return [] end if
  slot=0
  if cache!=void then
    pointer=nativeBytesPtr(map.data)
    if cache.map!=map or cache.dataPointer!=pointer then
      cache.slots=array(len(cache.slots),void)
      cache.faceTriangles=array(map.counts[13],void);cache.faceTriangleCount=0;cache.faceCacheEnabled=false
      cache.map=map;cache.data=map.data;cache.dataPointer=pointer
    end if
    for each face in faces slot=(slot*31+face+1)%len(cache.slots) end for
    batch=cache.slots[slot]
    if batch!=void and batch.faces==faces then return batch.triangles end if
  end if
  if cache==void or not cache.faceCacheEnabled then
    geometry=renderData.extractRetainedWithPatchError(map,faces,131072,renderData.DEFAULT_PATCH_ERROR)
    if geometry is error then return geometry end if
    triangles=geometry.triangles
    if cache!=void then
      if len(triangles)>MIN_FACE_CACHE_TRIANGLES and not geometry.truncated then
        cache.faceCacheEnabled=true;offset=0
        for index=0 to len(faces)-1
          face=faces[index]
          duplicate=false
          if index>0 then for previous=0 to index-1 if faces[previous]==face then duplicate=true;break end if end for end if
          if duplicate then continue end if
          if cache.faceTriangles[face]!=void then continue end if
          first=offset
          while offset<len(triangles) and triangles[offset].faceIndex==face offset=offset+1 end while
          count=offset-first
          if cache.faceTriangleCount+count<=MAX_CACHED_FACE_TRIANGLES then
            part=array(count,void)
            if count>0 then copyArray(part,0,triangles,first,count) end if
            cache.faceTriangles[face]=part;cache.faceTriangleCount=cache.faceTriangleCount+count
          end if
        end for
      end if
      if len(triangles)<=MAX_CACHED_MARK_TRIANGLES then cache.slots[slot]=FaceBatch(faces,triangles) end if
    end if
    return triangles
  end if
  // Different impact bounds often produce overlapping ordered face lists.
  // Decode each immutable face once, then assemble the exact selected order.
  parts=array(len(faces),void);total=0
  for index=0 to len(faces)-1
    face=faces[index]
    if face<0 or face>=len(cache.faceTriangles) then return renderData.extractRetainedWithPatchError(map,[face],131072,renderData.DEFAULT_PATCH_ERROR) end if
    duplicate=false
    if index>0 then for previous=0 to index-1 if faces[previous]==face then duplicate=true;break end if end for end if
    if duplicate then continue end if
    part=cache.faceTriangles[face]
    if part==void then
      geometry=renderData.extractRetainedWithPatchError(map,[face],131072,renderData.DEFAULT_PATCH_ERROR)
      if geometry is error then return geometry end if
      part=geometry.triangles
      if cache.faceTriangleCount+len(part)<=MAX_CACHED_FACE_TRIANGLES then cache.faceTriangles[face]=part;cache.faceTriangleCount=cache.faceTriangleCount+len(part) end if
    end if
    parts[index]=part;total=total+len(part)
  end for
  if total>131072 then total=131072 end if
  triangles=array(total,void);offset=0
  for each part in parts
    if part==void or offset>=total then continue end if
    count=len(part);if offset+count>total then count=total-offset end if
    if count>0 then copyArray(triangles,offset,part,0,count);offset=offset+count end if
  end for
  if len(triangles)<=MAX_CACHED_MARK_TRIANGLES then cache.slots[slot]=FaceBatch(faces,triangles) end if
  return triangles
end function

/// Creates error `7693` with message `"mark fragments: "+message`.
/// @param message Input used in the result expression `error(7693,"mark fragments: "+message)`.
function fail(message) return error(7693,"mark fragments: "+message) end function
/// Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.mark_fragments.dot`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
/// Returns `[value[0]/length,value[1]/length,value[2]/length]` from `mq3.renderer.mark_fragments.normalize`; earlier branches return `[0.0,0.0,0.0]`.
/// @param value Value forwarded as `a` to `mq3.renderer.mark_fragments.dot`.
function normalize(value)
  length=n.fsqrt(dot(value,value));if length<=0.0 then return [0.0,0.0,0.0] end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
/// Calls `mq3.compat.numeric.readI32` with `(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)` and returns its result.
/// @param map Record providing `map.data`, `map.offsets`.
/// @param faceIndex Input used in the result expression `n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)`.
/// @param relative Input used in the result expression `n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)`.
function faceValue(map,faceIndex,relative) return n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative) end function
/// Calls `mq3.compat.numeric.bitsFloat` with `(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))` and returns its result.
/// @param map Record providing `map.data`, `map.offsets`.
/// @param faceIndex Input used in the result expression `n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))`.
/// @param relative Input used in the result expression `n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))`.
function faceFloat(map,faceIndex,relative) return n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)) end function
/// Calls `mq3.compat.numeric.readI32` with `(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)` and returns its result.
/// @param map Record providing `map.data`, `map.offsets`.
/// @param shaderIndex Input used in the result expression `n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)`.
/// @param relative Input used in the result expression `n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)`.
function shaderValue(map,shaderIndex,relative) return n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative) end function

/// Builds `mins[axis]`, `maxs[axis]` in `mq3.renderer.mark_fragments.projectionBounds`; returns `[mins,maxs]`.
/// @param points Nested indexed data; outer entries read at `0`.
/// @param projection Indexed input read at `axis`.
/// @param direction Indexed input read at `axis`.
function projectionBounds(points,projection,direction)
  mins=[points[0][0],points[0][1],points[0][2]];maxs=[points[0][0],points[0][1],points[0][2]]
  for each point in points
    for axis=0 to 2
      value=point[axis];projected=point[axis]+projection[axis];behind=point[axis]-20.0*direction[axis]
      if value<mins[axis] then mins[axis]=value end if;if value>maxs[axis] then maxs[axis]=value end if
      if projected<mins[axis] then mins[axis]=projected end if;if projected>maxs[axis] then maxs[axis]=projected end if
      if behind<mins[axis] then mins[axis]=behind end if;if behind>maxs[axis] then maxs[axis]=behind end if
    end for
  end for
  return [mins,maxs]
end function

/// Builds `planes[index]`, `planes[len(points)]`, `planes[len(points)+1]` in `mq3.renderer.mark_fragments.projectionPlanes`; returns `planes`.
/// @param points Indexed input read at `index`, `(index+1)%len(points)`, `0`.
/// @param projection Value forwarded as `value` to `mq3.renderer.mark_fragments.normalize`.
function projectionPlanes(points,projection)
  direction=normalize(projection)
  planes=array(len(points)+2,void)
  reverseX=0.0-projection[0];reverseY=0.0-projection[1];reverseZ=0.0-projection[2]
  for index=0 to len(points)-1
    current=points[index];following=points[(index+1)%len(points)]
    edgeX=following[0]-current[0];edgeY=following[1]-current[1];edgeZ=following[2]-current[2]
    normalX=edgeY*reverseZ-edgeZ*reverseY;normalY=edgeZ*reverseX-edgeX*reverseZ;normalZ=edgeX*reverseY-edgeY*reverseX
    length=n.fsqrt(normalX*normalX+normalY*normalY+normalZ*normalZ)
    if length<=0.0 then normalX=0.0;normalY=0.0;normalZ=0.0 else normalX=normalX/length;normalY=normalY/length;normalZ=normalZ/length end if
    planes[index]=Plane([normalX,normalY,normalZ],normalX*current[0]+normalY*current[1]+normalZ*current[2])
  end for
  planes[len(points)]=Plane(direction,dot(direction,points[0])-32.0)
  inverse=[0.0-direction[0],0.0-direction[1],0.0-direction[2]]
  planes[len(points)+1]=Plane(inverse,dot(inverse,points[0])-20.0)
  return planes
end function

// R_ChopPolyBehindPlane keeps front/on points and uses a 0.5 unit epsilon.
/// @param points Indexed input read at `index`, `next`.
/// @param plane Record providing `plane.normal`, `plane.distance`.
function clipPlane(points,plane)
  if len(points)==0 or len(points)>=MAX_VERTS_ON_POLY-2 then return [] end if
  front=0;back=0
  for index=0 to len(points)-1
    distance=dot(points[index],plane.normal)-plane.distance
    if distance>0.5 then front=front+1 else if distance< -0.5 then back=back+1 end if
  end for
  if front==0 then return [] end if;if back==0 then return points end if
  output=lists.List.withCapacity(len(points)+2)
  for index=0 to len(points)-1
    next=(index+1)%len(points);point=points[index];other=points[next]
    distance=dot(point,plane.normal)-plane.distance;side=2
    if distance>0.5 then side=0 else if distance< -0.5 then side=1 end if
    if side==2 then output.add(point);continue end if
    if side==0 then output.add(point) end if
    nextDistance=dot(other,plane.normal)-plane.distance;nextSide=2
    if nextDistance>0.5 then nextSide=0 else if nextDistance< -0.5 then nextSide=1 end if
    if nextSide==2 or nextSide==side then continue end if
    denominator=distance-nextDistance;fraction=0.0;if denominator!=0.0 then fraction=distance/denominator end if
    output.add([point[0]+fraction*(other[0]-point[0]),point[1]+fraction*(other[1]-point[1]),point[2]+fraction*(other[2]-point[2])])
  end for
  return output.toArray()
end function
/// Returns `output` from `mq3.renderer.mark_fragments.clipTriangle`.
/// @param vertices Input used by `output=vertices`.
/// @param planes Sequence traversed as `plane` while producing this result.
function clipTriangle(vertices,planes)
  output=vertices
  for each plane in planes output=clipPlane(output,plane);if len(output)==0 then break end if end for
  return output
end function

// The clipper rejects most triangles of a repeated combat face list before
// any polygon work, so the prism test reads the three positions directly
// instead of materializing the vertex array the clipper needs afterwards.
/// @param first Indexed input read at `axis`.
/// @param second Indexed input read at `axis`.
/// @param third Indexed input read at `axis`.
/// @param mins Indexed input read at `axis`.
/// @param maxs Indexed input read at `axis`.
function triangleBoundsOverlap(first,second,third,mins,maxs)
  for axis=0 to 2
    low=first[axis];high=low
    if second[axis]<low then low=second[axis] end if;if second[axis]>high then high=second[axis] end if
    if third[axis]<low then low=third[axis] end if;if third[axis]>high then high=third[axis] end if
    if high<mins[axis] or low>maxs[axis] then return false end if
  end for
  return true
end function
/// Filters decal targets by supported BSP face kind, shader impact/mark flags, and contents.
/// @param map Record providing `map.offsets`, `map.data`.
/// @param faceIndex Value forwarded as `faceIndex` to `mq3.renderer.mark_fragments.faceValue`.
/// @param direction Three-component vector read at indices 0, 1, and 2.
/// @param mins Three-component vector read at indices 0, 1, and 2.
/// @param maxs Three-component vector read at indices 0, 1, and 2.
function eligibleFace(map,faceIndex,direction,mins,maxs)
  kind=faceValue(map,faceIndex,8);if kind!=renderData.MST_PLANAR and kind!=renderData.MST_PATCH then return false end if
  shader=faceValue(map,faceIndex,0);flags=shaderValue(map,shader,64);contents=shaderValue(map,shader,68)
  if (flags&(SURF_NOIMPACT|SURF_NOMARKS))!=0 or (contents&CONTENTS_FOG)!=0 then return false end if
  if kind==renderData.MST_PLANAR then
    normalX=faceFloat(map,faceIndex,84);normalY=faceFloat(map,faceIndex,88);normalZ=faceFloat(map,faceIndex,92)
    firstVertex=faceValue(map,faceIndex,12);at=map.offsets[10]+firstVertex*44
    pointX=n.bitsFloat(n.readU32(map.data,at));pointY=n.bitsFloat(n.readU32(map.data,at+4));pointZ=n.bitsFloat(n.readU32(map.data,at+8))
    distance=normalX*pointX+normalY*pointY+normalZ*pointZ
    low=0.0;high=0.0
    if normalX>=0.0 then low=low+normalX*mins[0];high=high+normalX*maxs[0] else low=low+normalX*maxs[0];high=high+normalX*mins[0] end if
    if normalY>=0.0 then low=low+normalY*mins[1];high=high+normalY*maxs[1] else low=low+normalY*maxs[1];high=high+normalY*mins[1] end if
    if normalZ>=0.0 then low=low+normalZ*mins[2];high=high+normalZ*maxs[2] else low=low+normalZ*maxs[2];high=high+normalZ*mins[2] end if
    if not (low<distance and high>=distance) or normalX*direction[0]+normalY*direction[1]+normalZ*direction[2]> -0.5 then return false end if
  end if
  return true
end function
/// Updates `cache.faceVisits`, `cache.faceSerial`, `cache.faceMap`, `cache.faceDataPointer`, `cache.faceVisits[faceIndex]` in `mq3.renderer.mark_fragments.candidateFaces`; returns `result.toArray()`.
/// @param map Record providing `map.data`, `map.counts`.
/// @param world Record providing `world.leaves`.
/// @param mins Argument 2 supplied to `mq3.collision.world.enumerateLeaves`.
/// @param maxs Argument 3 supplied to `mq3.collision.world.enumerateLeaves`.
/// @param direction Value forwarded as `direction` to `mq3.renderer.mark_fragments.eligibleFace`.
/// @param cache Mutable record or buffer; this call updates `cache.faceVisits`, `cache.faceSerial`, `cache.faceMap`, `cache.faceDataPointer`, `cache.faceVisits[faceIndex]`.
function candidateFaces(map,world,mins,maxs,direction,cache)
  leaves=collision.enumerateLeaves(world,mins,maxs)
  seen=void
  if cache!=void then
    pointer=nativeBytesPtr(map.data)
    if cache.faceMap!=map or cache.faceDataPointer!=pointer or cache.faceVisits==void or len(cache.faceVisits)!=map.counts[13] or cache.faceSerial>=254 then
      cache.faceVisits=bytes(map.counts[13],0);cache.faceSerial=0;cache.faceMap=map;cache.faceDataPointer=pointer
    end if
    cache.faceSerial=cache.faceSerial+1
  else
    seen=sets.HashSet.new()
  end if
  result=lists.List.withCapacity(MAX_MARK_SURFACES)
  for each leafIndex in leaves
    for each faceIndex in world.leaves[leafIndex].surfaces
      if cache!=void then
        if cache.faceVisits[faceIndex]==cache.faceSerial then continue end if
        cache.faceVisits[faceIndex]=cache.faceSerial
      else
        if seen.has(faceIndex) then continue end if
        seen.add(faceIndex)
      end if
      if eligibleFace(map,faceIndex,direction,mins,maxs) then
        result.add(faceIndex)
        if result.size>=MAX_MARK_SURFACES then return result.toArray() end if
      end if
    end for
  end for
  return result.toArray()
end function

/// Calls `mq3.renderer.mark_fragments.projectWithCache` with `(map,world,sourcePoints,projection,maxPoints,maxFragments,void)` and returns its result.
/// @param map Value forwarded as `map` to `mq3.renderer.mark_fragments.projectWithCache`.
/// @param world Value forwarded as `world` to `mq3.renderer.mark_fragments.projectWithCache`.
/// @param sourcePoints Value forwarded as `sourcePoints` to `mq3.renderer.mark_fragments.projectWithCache`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.mark_fragments.projectWithCache`.
/// @param maxPoints Value forwarded as `maxPoints` to `mq3.renderer.mark_fragments.projectWithCache`.
/// @param maxFragments Value forwarded as `maxFragments` to `mq3.renderer.mark_fragments.projectWithCache`.
function project(map,world,sourcePoints,projection,maxPoints,maxFragments)
  return projectWithCache(map,world,sourcePoints,projection,maxPoints,maxFragments,void)
end function
/// Builds `mq3.renderer.mark_fragments.Result` using `fragments.add`, `outputPoints.add`, `outputPoints.toArray`.
/// @param map Value forwarded as `map` to `mq3.renderer.mark_fragments.candidateFaces`.
/// @param world Value forwarded as `world` to `mq3.renderer.mark_fragments.candidateFaces`.
/// @param sourcePoints Value forwarded as `points` to `mq3.renderer.mark_fragments.projectionBounds`.
/// @param projection Value forwarded as `value` to `mq3.renderer.mark_fragments.normalize`.
/// @param maxPoints Input tested by `maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072`.
/// @param maxFragments Input tested by `maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072`.
/// @param cache Value forwarded as `cache` to `mq3.renderer.mark_fragments.candidateFaces`.
function projectWithCache(map,world,sourcePoints,projection,maxPoints,maxFragments,cache)
  if map==void or world==void or sourcePoints==void or len(sourcePoints)<3 or projection==void or len(projection)!=3 then return fail("invalid projection input") end if
  if maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072 then return fail("invalid output capacity") end if
  for each point in sourcePoints if point==void or len(point)!=3 then return fail("mark point needs three coordinates") end if end for
  points=sourcePoints;if len(points)>MAX_VERTS_ON_POLY then points=slice(points,0,MAX_VERTS_ON_POLY) end if
  direction=normalize(projection);if direction==[0.0,0.0,0.0] then return Result([],[],0,0) end if
  bounds=projectionBounds(sourcePoints,projection,direction);planes=projectionPlanes(points,projection);faces=candidateFaces(map,world,bounds[0],bounds[1],direction,cache)
  // The clipper reads source positions without mutating them. Decode shared
  // mesh vertices once per face, as in the retained world renderer.
  triangles=markTriangles(map,faces,cache)
  if triangles is error then return triangles end if
  outputPoints=lists.List.new();fragments=lists.List.new();tested=0
  previousFace=-1;kind=0;mins=bounds[0];maxs=bounds[1]
  for each triangle in triangles
    if triangle.faceIndex!=previousFace then
      previousFace=triangle.faceIndex
      kind=faceValue(map,previousFace,8)
    end if
    if kind!=renderData.MST_PLANAR and kind!=renderData.MST_PATCH then continue end if
    first=triangle.vertices[0].position;second=triangle.vertices[1].position;third=triangle.vertices[2].position
    if not triangleBoundsOverlap(first,second,third,mins,maxs) then continue end if
    if kind==renderData.MST_PATCH then
      // R_MarkFragments checks the patch triangle normal against the
      // projection direction; the scalar form keeps rejected triangles free
      // of scratch vectors.
      edgeX=first[0]-second[0];edgeY=first[1]-second[1];edgeZ=first[2]-second[2]
      otherX=third[0]-second[0];otherY=third[1]-second[1];otherZ=third[2]-second[2]
      normalX=edgeY*otherZ-edgeZ*otherY;normalY=edgeZ*otherX-edgeX*otherZ;normalZ=edgeX*otherY-edgeY*otherX
      length=n.fsqrt(normalX*normalX+normalY*normalY+normalZ*normalZ)
      if length<=0.0 then normalX=0.0;normalY=0.0;normalZ=0.0 else normalX=normalX/length;normalY=normalY/length;normalZ=normalZ/length end if
      limit=-0.05;if triangle.triangleIndex%2==0 then limit=-0.1 end if
      if normalX*direction[0]+normalY*direction[1]+normalZ*direction[2]>=limit then continue end if
    end if
    tested=tested+1;vertices=[first,second,third];clipped=clipTriangle(vertices,planes);if len(clipped)==0 then continue end if
    if fragments.size>=maxFragments then break end if
    if outputPoints.size+len(clipped)>maxPoints then continue end if
    fragments.add(Fragment(outputPoints.size,len(clipped)))
    for each point in clipped outputPoints.add(point) end for
  end for
  return Result(outputPoints.toArray(),fragments.toArray(),len(faces),tested)
end function
