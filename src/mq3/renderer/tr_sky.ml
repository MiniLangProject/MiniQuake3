// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang port of code/renderer/tr_sky.c. Geometry is returned to the host
// instead of being submitted through the original immediate-mode OpenGL API.
package mq3.renderer.tr_sky

import mq3.compat.numeric as n

extern function acos(value as double) from "ucrtbase.dll" returns double
extern function floor(value as double) from "ucrtbase.dll" returns double
extern function ceil(value as double) from "ucrtbase.dll" returns double

const SKY_SUBDIVISIONS=8
const HALF_SKY_SUBDIVISIONS=4
const ON_EPSILON=0.1
const MAX_CLIP_VERTS=64

struct Bounds minS minT maxS maxT end struct
struct SkyVertex xyz st end struct
struct Mesh vertices indexes end struct
struct SkySide image axis mesh end struct
struct CloudTable coords factors end struct
struct SkyShader outerbox cloudHeight stages end struct
struct StageResult skybox clouds sun skyRendered depthMin depthMax end struct

function clearSkyBox()
  return Bounds(array(6,9999.0),array(6,9999.0),array(6,-9999.0),array(6,-9999.0))
end function

function absolute(value) if value<0.0 then return 0.0-value end if;return value end function
function absoluteIndex(value) if value<0 then return 0-value end if;return value end function
function copy3(value) return [value[0],value[1],value[2]] end function
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function

function addSkyPolygon(bounds,vecs)
  sum=[0.0,0.0,0.0]
  for each value in vecs sum[0]=sum[0]+value[0];sum[1]=sum[1]+value[1];sum[2]=sum[2]+value[2] end for
  ax=absolute(sum[0]);ay=absolute(sum[1]);az=absolute(sum[2]);axis=4
  if ax>ay and ax>az then if sum[0]<0.0 then axis=1 else axis=0 end if
  else if ay>az and ay>ax then if sum[1]<0.0 then axis=3 else axis=2 end if
  else if sum[2]<0.0 then axis=5 end if
  vecToSt=[[-2,3,1],[2,3,-1],[1,3,2],[-1,3,-2],[-2,-1,3],[-2,1,-3]]
  for each value in vecs
    denominatorIndex=vecToSt[axis][2];denominator=value[absoluteIndex(denominatorIndex)-1];if denominatorIndex<0 then denominator=0.0-denominator end if
    if denominator<0.001 then continue end if
    sIndex=vecToSt[axis][0];s=value[absoluteIndex(sIndex)-1]/denominator;if sIndex<0 then s=0.0-s end if
    tIndex=vecToSt[axis][1];t=value[absoluteIndex(tIndex)-1]/denominator;if tIndex<0 then t=0.0-t end if
    if s<bounds.minS[axis] then bounds.minS[axis]=s end if;if s>bounds.maxS[axis] then bounds.maxS[axis]=s end if
    if t<bounds.minT[axis] then bounds.minT[axis]=t end if;if t>bounds.maxT[axis] then bounds.maxT[axis]=t end if
  end for
  return axis
end function

function clipSkyPolygon(bounds,vecs,stage)
  if len(vecs)>MAX_CLIP_VERTS-2 then return error(7840,"ClipSkyPolygon: MAX_CLIP_VERTS") end if
  if stage==6 then addSkyPolygon(bounds,vecs);return true end if
  normals=[[1.0,1.0,0.0],[1.0,-1.0,0.0],[0.0,-1.0,1.0],[0.0,1.0,1.0],[1.0,0.0,1.0],[-1.0,0.0,1.0]]
  distances=[];sides=[];front=false;back=false
  for each value in vecs
    distance=dot(value,normals[stage]);side=0
    if distance>ON_EPSILON then side=1;front=true else if distance<0.0-ON_EPSILON then side=-1;back=true end if
    distances=distances+[distance];sides=sides+[side]
  end for
  if not front or not back then return clipSkyPolygon(bounds,vecs,stage+1) end if
  first=[];second=[]
  for i=0 to len(vecs)-1
    next=(i+1)%len(vecs);value=vecs[i];side=sides[i]
    if side>=0 then first=first+[copy3(value)] end if;if side<=0 then second=second+[copy3(value)] end if
    if side==0 or sides[next]==0 or sides[next]==side then continue end if
    fraction=distances[i]/(distances[i]-distances[next]);other=vecs[next]
    point=[value[0]+fraction*(other[0]-value[0]),value[1]+fraction*(other[1]-value[1]),value[2]+fraction*(other[2]-value[2])]
    first=first+[copy3(point)];second=second+[copy3(point)]
  end for
  result=clipSkyPolygon(bounds,first,stage+1);if result is error then return result end if
  return clipSkyPolygon(bounds,second,stage+1)
end function

function rbClipSkyPolygons(points,indexes,viewOrigin)
  bounds=clearSkyBox()
  i=0
  while i<=len(indexes)-3
    polygon=[]
    for j=0 to 2 value=points[indexes[i+j]];polygon=polygon+[[value[0]-viewOrigin[0],value[1]-viewOrigin[1],value[2]-viewOrigin[2]]] end for
    result=clipSkyPolygon(bounds,polygon,0);if result is error then return result end if
    i=i+3
  end while
  return bounds
end function

function makeSkyVec(s,t,axis,zFar,skyMin,skyMax)
  stToVec=[[3,-1,2],[-3,1,2],[1,3,2],[-1,-3,2],[-2,-1,3],[2,-1,-3]]
  size=zFar/1.75;base=[s*size,t*size,size];xyz=[0.0,0.0,0.0]
  for j=0 to 2 k=stToVec[axis][j];xyz[j]=base[absoluteIndex(k)-1];if k<0 then xyz[j]=0.0-xyz[j] end if end for
  u=(s+1.0)*0.5;v=(t+1.0)*0.5
  if u<skyMin then u=skyMin else if u>skyMax then u=skyMax end if
  if v<skyMin then v=skyMin else if v>skyMax then v=skyMax end if
  return SkyVertex(xyz,[u,1.0-v])
end function

function quantizedBounds(bounds,axis,minT)
  minS=n.trunc32(floor(bounds.minS[axis]*HALF_SKY_SUBDIVISIONS));minY=n.trunc32(floor(bounds.minT[axis]*HALF_SKY_SUBDIVISIONS))
  maxS=n.trunc32(ceil(bounds.maxS[axis]*HALF_SKY_SUBDIVISIONS));maxY=n.trunc32(ceil(bounds.maxT[axis]*HALF_SKY_SUBDIVISIONS))
  if minS<0-HALF_SKY_SUBDIVISIONS then minS=0-HALF_SKY_SUBDIVISIONS end if;if minS>HALF_SKY_SUBDIVISIONS then minS=HALF_SKY_SUBDIVISIONS end if
  if maxS<0-HALF_SKY_SUBDIVISIONS then maxS=0-HALF_SKY_SUBDIVISIONS end if;if maxS>HALF_SKY_SUBDIVISIONS then maxS=HALF_SKY_SUBDIVISIONS end if
  if minY<minT then minY=minT end if;if minY>HALF_SKY_SUBDIVISIONS then minY=HALF_SKY_SUBDIVISIONS end if
  if maxY<minT then maxY=minT end if;if maxY>HALF_SKY_SUBDIVISIONS then maxY=HALF_SKY_SUBDIVISIONS end if
  return [[minS,minY],[maxS,maxY]]
end function

function drawSkySide(image,axis,mins,maxs,zFar)
  vertices=[];indexes=[];width=maxs[0]-mins[0]+1
  for t=mins[1] to maxs[1] for s=mins[0] to maxs[0] vertices=vertices+[makeSkyVec(s/HALF_SKY_SUBDIVISIONS,t/HALF_SKY_SUBDIVISIONS,axis,zFar,0.0,1.0)] end for end for
  for t=0 to maxs[1]-mins[1]-1 for s=0 to width-2 a=t*width+s;b=a+width;indexes=indexes+[a,b,a+1,b,b+1,a+1] end for end for
  return SkySide(image,axis,Mesh(vertices,indexes))
end function

function drawSkyBox(shader,bounds,zFar)
  order=[0,2,1,3,4,5];sides=[]
  for axis=0 to 5
    range=quantizedBounds(bounds,axis,0-HALF_SKY_SUBDIVISIONS);if range[0][0]>=range[1][0] or range[0][1]>=range[1][1] then continue end if
    sides=sides+[drawSkySide(shader.outerbox[order[axis]],axis,range[0],range[1],zFar)]
  end for
  return sides
end function

function fillCloudySkySide(mesh,axis,mins,maxs,zFar,origin,table,addIndexes)
  start=len(mesh.vertices);width=maxs[0]-mins[0]+1
  for t=mins[1] to maxs[1] for s=mins[0] to maxs[0]
    value=makeSkyVec(s/HALF_SKY_SUBDIVISIONS,t/HALF_SKY_SUBDIVISIONS,axis,zFar,1.0/256.0,255.0/256.0)
    value.xyz=[value.xyz[0]+origin[0],value.xyz[1]+origin[1],value.xyz[2]+origin[2]];value.st=[table.coords[axis][t+HALF_SKY_SUBDIVISIONS][s+HALF_SKY_SUBDIVISIONS][0],table.coords[axis][t+HALF_SKY_SUBDIVISIONS][s+HALF_SKY_SUBDIVISIONS][1]]
    mesh.vertices=mesh.vertices+[value]
  end for end for
  if addIndexes then for t=0 to maxs[1]-mins[1]-1 for s=0 to width-2 a=start+t*width+s;b=a+width;mesh.indexes=mesh.indexes+[a,b,a+1,b,b+1,a+1] end for end for end if
  return mesh
end function

function fillCloudBox(shader,bounds,zFar,origin,table,stage,mesh)
  for axis=0 to 5
    if axis==5 then continue end if
    range=quantizedBounds(bounds,axis,0-HALF_SKY_SUBDIVISIONS);if range[0][0]>=range[1][0] or range[0][1]>=range[1][1] then continue end if
    mesh=fillCloudySkySide(mesh,axis,range[0],range[1],zFar,origin,table,stage==0)
  end for
  return mesh
end function

function rBuildCloudData(shader,bounds,zFar,origin,table)
  mesh=Mesh([],[]);if shader.cloudHeight==0.0 then return mesh end if
  for stage=0 to shader.stages-1 mesh=fillCloudBox(shader,bounds,zFar,origin,table,stage,mesh) end for
  return mesh
end function

function rInitSkyTexCoords(heightCloud)
  coords=array(6,void);factors=array(6,void);radius=4096.0
  for axis=0 to 5
    coords[axis]=array(SKY_SUBDIVISIONS+1,void);factors[axis]=array(SKY_SUBDIVISIONS+1,void)
    for t=0 to SKY_SUBDIVISIONS
      coords[axis][t]=array(SKY_SUBDIVISIONS+1,void);factors[axis][t]=array(SKY_SUBDIVISIONS+1,0.0)
      for s=0 to SKY_SUBDIVISIONS
        sky=makeSkyVec((s-HALF_SKY_SUBDIVISIONS)/HALF_SKY_SUBDIVISIONS,(t-HALF_SKY_SUBDIVISIONS)/HALF_SKY_SUBDIVISIONS,axis,1024.0,0.0,1.0).xyz
        square=dot(sky,sky);z=sky[2];inside=z*z*radius*radius+2.0*sky[0]*sky[0]*radius*heightCloud+sky[0]*sky[0]*heightCloud*heightCloud+2.0*sky[1]*sky[1]*radius*heightCloud+sky[1]*sky[1]*heightCloud*heightCloud+2.0*z*z*radius*heightCloud+z*z*heightCloud*heightCloud
        p=(0.0-2.0*z*radius+2.0*n.fsqrt(inside))/(2.0*square);factors[axis][t][s]=p
        value=[sky[0]*p,sky[1]*p,sky[2]*p+radius];length=n.fsqrt(dot(value,value));if length!=0.0 then value=[value[0]/length,value[1]/length,value[2]/length] end if
        coords[axis][t][s]=[n.f32(acos(value[0])),n.f32(acos(value[1]))]
      end for
    end for
  end for
  return CloudTable(coords,factors)
end function

function perpendicular(direction)
  axis=[1.0,0.0,0.0];if absolute(direction[0])>0.9 then axis=[0.0,1.0,0.0] end if
  projection=dot(axis,direction);value=[axis[0]-projection*direction[0],axis[1]-projection*direction[1],axis[2]-projection*direction[2]];length=n.fsqrt(dot(value,value));return [value[0]/length,value[1]/length,value[2]/length]
end function

function rbDrawSun(skyRendered,drawSun,zFar,direction)
  if not skyRendered or not drawSun then return Mesh([],[]) end if
  dist=zFar/1.75;size=dist*0.4;center=[direction[0]*dist,direction[1]*dist,direction[2]*dist];a=perpendicular(direction);b=[direction[1]*a[2]-direction[2]*a[1],direction[2]*a[0]-direction[0]*a[2],direction[0]*a[1]-direction[1]*a[0]];a=[a[0]*size,a[1]*size,a[2]*size];b=[b[0]*size,b[1]*size,b[2]*size]
  vertices=[SkyVertex([center[0]-a[0]-b[0],center[1]-a[1]-b[1],center[2]-a[2]-b[2]],[0.0,0.0]),SkyVertex([center[0]+a[0]-b[0],center[1]+a[1]-b[1],center[2]+a[2]-b[2]],[0.0,1.0]),SkyVertex([center[0]+a[0]+b[0],center[1]+a[1]+b[1],center[2]+a[2]+b[2]],[1.0,1.0]),SkyVertex([center[0]-a[0]+b[0],center[1]-a[1]+b[1],center[2]-a[2]+b[2]],[1.0,0.0])]
  return Mesh(vertices,[0,1,2,0,2,3])
end function

function rbStageIteratorSky(points,indexes,viewOrigin,shader,zFar,fastSky,showSky,table,drawSun,sunDirection)
  if fastSky then return StageResult([],Mesh([],[]),Mesh([],[]),false,0.0,1.0) end if
  bounds=rbClipSkyPolygons(points,indexes,viewOrigin);if bounds is error then return bounds end if
  box=drawSkyBox(shader,bounds,zFar);clouds=rBuildCloudData(shader,bounds,zFar,viewOrigin,table);sun=rbDrawSun(true,drawSun,zFar,sunDirection);depth=1.0;if showSky then depth=0.0 end if
  return StageResult(box,clouds,sun,true,depth,depth)
end function
