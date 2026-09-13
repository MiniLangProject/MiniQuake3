// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// World-polygon projection used by the original CG_CM_MARKFRAGMENTS trap.
package mq3.renderer.mark_fragments

import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as renderData
import mq3.collision.world as collision

const MAX_VERTS_ON_POLY=64
const MAX_MARK_SURFACES=64
const SURF_NOIMPACT=0x10
const SURF_NOMARKS=0x20
const CONTENTS_FOG=0x40
const FACE_STRIDE=104
const SHADER_STRIDE=72

struct Plane normal distance end struct
struct Fragment firstPoint numPoints end struct
struct Result points fragments candidateSurfaces testedTriangles end struct

function fail(message) return error(7693,"mark fragments: "+message) end function
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
function subtract(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
function cross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
function normalize(value)
  length=n.fsqrt(dot(value,value));if length<=0.0 then return [0.0,0.0,0.0] end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
function faceValue(map,faceIndex,relative) return n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative) end function
function faceFloat(map,faceIndex,relative) return n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)) end function
function shaderValue(map,shaderIndex,relative) return n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative) end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

function projectionBounds(points,projection,direction)
  mins=[points[0][0],points[0][1],points[0][2]];maxs=[points[0][0],points[0][1],points[0][2]]
  for each point in points
    projected=[point[0]+projection[0],point[1]+projection[1],point[2]+projection[2]]
    behind=[point[0]-20.0*direction[0],point[1]-20.0*direction[1],point[2]-20.0*direction[2]]
    for axis=0 to 2
      if point[axis]<mins[axis] then mins[axis]=point[axis] end if;if point[axis]>maxs[axis] then maxs[axis]=point[axis] end if
      if projected[axis]<mins[axis] then mins[axis]=projected[axis] end if;if projected[axis]>maxs[axis] then maxs[axis]=projected[axis] end if
      if behind[axis]<mins[axis] then mins[axis]=behind[axis] end if;if behind[axis]>maxs[axis] then maxs[axis]=behind[axis] end if
    end for
  end for
  return [mins,maxs]
end function

function projectionPlanes(points,projection)
  direction=normalize(projection);planes=[]
  for index=0 to len(points)-1
    edge=subtract(points[(index+1)%len(points)],points[index]);normal=normalize(cross(edge,[0.0-projection[0],0.0-projection[1],0.0-projection[2]]))
    planes=planes+[Plane(normal,dot(normal,points[index]))]
  end for
  planes=planes+[Plane(direction,dot(direction,points[0])-32.0)]
  inverse=[0.0-direction[0],0.0-direction[1],0.0-direction[2]];planes=planes+[Plane(inverse,dot(inverse,points[0])-20.0)]
  return planes
end function

// R_ChopPolyBehindPlane keeps front/on points and uses a 0.5 unit epsilon.
function clipPlane(points,plane)
  if len(points)==0 or len(points)>=MAX_VERTS_ON_POLY-2 then return [] end if
  distances=[];sides=[];front=0;back=0
  for each point in points
    distance=dot(point,plane.normal)-plane.distance;side=2
    if distance>0.5 then side=0;front=front+1 else if distance< -0.5 then side=1;back=back+1 end if
    distances=distances+[distance];sides=sides+[side]
  end for
  if front==0 then return [] end if;if back==0 then return points end if
  output=[]
  for index=0 to len(points)-1
    next=(index+1)%len(points);point=points[index]
    if sides[index]==2 then output=output+[point];continue end if
    if sides[index]==0 then output=output+[point] end if
    if sides[next]==2 or sides[next]==sides[index] then continue end if
    denominator=distances[index]-distances[next];fraction=0.0;if denominator!=0.0 then fraction=distances[index]/denominator end if
    other=points[next];output=output+[[point[0]+fraction*(other[0]-point[0]),point[1]+fraction*(other[1]-point[1]),point[2]+fraction*(other[2]-point[2])]]
  end for
  return output
end function
function clipTriangle(vertices,planes)
  output=vertices
  for each plane in planes output=clipPlane(output,plane);if len(output)==0 then break end if end for
  return output
end function

function boundsOverlap(vertices,mins,maxs)
  for axis=0 to 2
    low=vertices[0][axis];high=low
    for index=1 to len(vertices)-1 if vertices[index][axis]<low then low=vertices[index][axis] end if;if vertices[index][axis]>high then high=vertices[index][axis] end if end for
    if high<mins[axis] or low>maxs[axis] then return false end if
  end for
  return true
end function
function planeCrossesBounds(normal,distance,mins,maxs)
  low=0.0;high=0.0
  for axis=0 to 2 if normal[axis]>=0.0 then low=low+normal[axis]*mins[axis];high=high+normal[axis]*maxs[axis] else low=low+normal[axis]*maxs[axis];high=high+normal[axis]*mins[axis] end if end for
  return low<distance and high>=distance
end function
function faceNormal(map,faceIndex) return [faceFloat(map,faceIndex,84),faceFloat(map,faceIndex,88),faceFloat(map,faceIndex,92)] end function
function eligibleFace(map,faceIndex,direction,mins,maxs)
  kind=faceValue(map,faceIndex,8);if kind!=renderData.MST_PLANAR and kind!=renderData.MST_PATCH then return false end if
  shader=faceValue(map,faceIndex,0);flags=shaderValue(map,shader,64);contents=shaderValue(map,shader,68)
  if (flags&(SURF_NOIMPACT|SURF_NOMARKS))!=0 or (contents&CONTENTS_FOG)!=0 then return false end if
  if kind==renderData.MST_PLANAR then
    normal=faceNormal(map,faceIndex);firstVertex=faceValue(map,faceIndex,12);at=map.offsets[10]+firstVertex*44;point=[n.bitsFloat(n.readU32(map.data,at)),n.bitsFloat(n.readU32(map.data,at+4)),n.bitsFloat(n.readU32(map.data,at+8))]
    if not planeCrossesBounds(normal,dot(normal,point),mins,maxs) or dot(normal,direction)> -0.5 then return false end if
  end if
  return true
end function
function candidateFaces(map,world,mins,maxs,direction)
  leaves=collision.enumerateLeaves(world,mins,maxs);seen=[];result=[]
  for each leafIndex in leaves
    for each faceIndex in world.leaves[leafIndex].surfaces
      if contains(seen,faceIndex) then continue end if;seen=seen+[faceIndex]
      if eligibleFace(map,faceIndex,direction,mins,maxs) then result=result+[faceIndex];if len(result)>=MAX_MARK_SURFACES then return result end if end if
    end for
  end for
  return result
end function

function project(map,world,sourcePoints,projection,maxPoints,maxFragments)
  if map==void or world==void or sourcePoints==void or len(sourcePoints)<3 or projection==void or len(projection)!=3 then return fail("invalid projection input") end if
  if maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072 then return fail("invalid output capacity") end if
  for each point in sourcePoints if point==void or len(point)!=3 then return fail("mark point needs three coordinates") end if end for
  points=sourcePoints;if len(points)>MAX_VERTS_ON_POLY then points=slice(points,0,MAX_VERTS_ON_POLY) end if
  direction=normalize(projection);if direction==[0.0,0.0,0.0] then return Result([],[],0,0) end if
  bounds=projectionBounds(sourcePoints,projection,direction);planes=projectionPlanes(points,projection);faces=candidateFaces(map,world,bounds[0],bounds[1],direction)
  geometry=renderData.extract(map,faces,131072);if geometry is error then return geometry end if
  outputPoints=[];fragments=[];tested=0
  for each triangle in geometry.triangles
    kind=faceValue(map,triangle.faceIndex,8);if kind!=renderData.MST_PLANAR and kind!=renderData.MST_PATCH then continue end if
    vertices=[triangle.vertices[0].position,triangle.vertices[1].position,triangle.vertices[2].position];if not boundsOverlap(vertices,bounds[0],bounds[1]) then continue end if
    if kind==renderData.MST_PATCH then normal=normalize(cross(subtract(vertices[0],vertices[1]),subtract(vertices[2],vertices[1])));limit=-0.05;if triangle.triangleIndex%2==0 then limit=-0.1 end if;if dot(normal,direction)>=limit then continue end if end if
    tested=tested+1;clipped=clipTriangle(vertices,planes);if len(clipped)==0 then continue end if
    if len(fragments)>=maxFragments then break end if;if len(outputPoints)+len(clipped)>maxPoints then continue end if
    fragments=fragments+[Fragment(len(outputPoints),len(clipped))];outputPoints=outputPoints+clipped
  end for
  return Result(outputPoints,fragments,len(faces),tested)
end function
