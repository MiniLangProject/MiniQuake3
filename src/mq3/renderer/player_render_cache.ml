// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic phase cache and triangle LOD for assembled MD3 players.
package mq3.renderer.player_render_cache

import mq3.compat.numeric as numeric
import mq3.renderer.player_model_assembly as player
import mq3.renderer.player_skins as skins
import mq3.renderer.view_math as viewMath
import std.array as arrays

const LOD_CULLED=0
const LOD_FAR=1
const LOD_MEDIUM=2
const LOD_FULL=3
const FULL_SURFACE_TRIANGLE_LIMIT=8192

struct Key lowerOldFrame lowerFrame lowerPhase upperOldFrame upperFrame upperPhase end struct
struct Entry key triangles end struct
struct LodPolicy fullDistance mediumDistance farDistance mediumStride farStride end struct
struct Lighting direction ambient directed end struct
struct DrawTriangle positions texCoords normals lights part surfaceIndex surfaceName shaderName imageName lod end struct
struct Cache models phaseCount maxEntries maxTrianglesPerTarget maxTargetsPerFrame entries hits misses builds evictions frameTargets frameTriangles detailed skinSet lodPolicy lighting frameCulled frameFull frameMedium frameFar sourceTriangles end struct
struct Stats entries hits misses builds evictions frameTargets frameTriangles frameCulled frameFull frameMedium frameFar sourceTriangles end struct

function fail(message) return error(7540,"player render cache: "+message) end function

function create(models,phaseCount,maxEntries,maxTrianglesPerTarget,maxTargetsPerFrame)
  if models==void or models.lower==void or models.upper==void or models.head==void then return fail("three MD3 model pieces required") end if
  if phaseCount<1 then return fail("phase count must be positive") end if
  if maxEntries<1 then return fail("entry budget must be positive") end if
  if maxTrianglesPerTarget<0 then return fail("negative triangle budget") end if
  if maxTargetsPerFrame<1 then return fail("target budget must be positive") end if
  return Cache(models,phaseCount,maxEntries,maxTrianglesPerTarget,maxTargetsPerFrame,[],0,0,0,0,0,0,false,void,void,void,0,0,0,0,0)
end function

function lodPolicy(fullDistance,mediumDistance,farDistance,mediumStride,farStride)
  if fullDistance<0.0 or mediumDistance<=fullDistance or farDistance<=mediumDistance then return fail("LOD distances must be increasing") end if
  if mediumStride<2 or farStride<=mediumStride then return fail("LOD strides must be increasing") end if
  return LodPolicy(numeric.f32(fullDistance),numeric.f32(mediumDistance),numeric.f32(farDistance),mediumStride,farStride)
end function

function lighting(direction,ambient,directed)
  if direction==void or len(direction)!=3 then return fail("light direction must have three components") end if
  lengthSquared=numeric.fadd(numeric.fadd(numeric.fmul(direction[0],direction[0]),numeric.fmul(direction[1],direction[1])),numeric.fmul(direction[2],direction[2]))
  if lengthSquared<=0.0 then return fail("light direction must be non-zero") end if
  if ambient<0.0 or ambient>1.0 or directed<0.0 or directed>1.0 or ambient+directed>1.0 then return fail("light levels outside zero to one") end if
  inverse=numeric.fdiv(1.0,numeric.fsqrt(lengthSquared))
  normal=[numeric.fmul(direction[0],inverse),numeric.fmul(direction[1],inverse),numeric.fmul(direction[2],inverse)]
  return Lighting(normal,numeric.f32(ambient),numeric.f32(directed))
end function

// Detailed caches retain every triangle at build time. LOD selection happens
// after lookup, so all targets sharing an animation pose share one interpolation.
function createDetailed(models,skinSet,phaseCount,maxEntries,maxTargetsPerFrame,policy,light)
  if skinSet==void or skinSet.lower==void or skinSet.upper==void or skinSet.head==void then return fail("three resolved player skins required") end if
  if policy==void or light==void then return fail("LOD policy and lighting required") end if
  value=create(models,phaseCount,maxEntries,FULL_SURFACE_TRIANGLE_LIMIT,maxTargetsPerFrame);if value is error then return value end if
  value.detailed=true;value.skinSet=skinSet;value.lodPolicy=policy;value.lighting=light
  return value
end function

function beginFrame(cache)
  if cache==void then return fail("missing cache") end if
  cache.frameTargets=0;cache.frameTriangles=0;cache.frameCulled=0;cache.frameFull=0;cache.frameMedium=0;cache.frameFar=0
  return cache
end function

function validateSample(value)
  if value==void then return fail("frame sample required") end if
  if value.oldFrame<0 or value.frame<0 then return fail("negative animation frame") end if
  if value.backlerp<0.0 or value.backlerp>1.0 then return fail("backlerp outside zero to one") end if
  return true
end function

// Round to the nearest one of phaseCount evenly spaced backlerp values.
// phaseCount=1 deliberately selects the current frame without interpolation.
function phaseFor(cache,value)
  valid=validateSample(value);if valid is error then return valid end if
  if cache.phaseCount==1 then return 0 end if
  phase=numeric.trunc32(value.backlerp*(cache.phaseCount-1)+0.5)
  if phase<0 then phase=0 end if
  if phase>=cache.phaseCount then phase=cache.phaseCount-1 end if
  return phase
end function

function phaseBacklerp(cache,phase)
  if cache.phaseCount==1 then return 0.0 end if
  return numeric.f32((phase*1.0)/(cache.phaseCount-1))
end function

function keyFor(cache,lowerSample,upperSample)
  lowerPhase=phaseFor(cache,lowerSample);if lowerPhase is error then return lowerPhase end if
  upperPhase=phaseFor(cache,upperSample);if upperPhase is error then return upperPhase end if
  return Key(lowerSample.oldFrame,lowerSample.frame,lowerPhase,upperSample.oldFrame,upperSample.frame,upperPhase)
end function

function sameKey(a,b)
  return a.lowerOldFrame==b.lowerOldFrame and a.lowerFrame==b.lowerFrame and a.lowerPhase==b.lowerPhase and a.upperOldFrame==b.upperOldFrame and a.upperFrame==b.upperFrame and a.upperPhase==b.upperPhase
end function

function find(cache,key)
  if len(cache.entries)>0 then
    for index=0 to len(cache.entries)-1
      if sameKey(cache.entries[index].key,key) then return cache.entries[index] end if
    end for
  end if
  return void
end function

// Evenly retain triangles across the stable lower/upper/head stream. This
// avoids starving later model pieces when the target budget is small.
function limitTriangles(triangles,budget)
  if len(triangles)<=budget then return triangles end if
  result=[]
  for index=0 to budget-1
    source=numeric.quotient(index*len(triangles),budget)
    result=result+[triangles[source]]
  end for
  return result
end function

function build(cache,key)
  lower=player.animation(key.lowerFrame,key.lowerOldFrame,phaseBacklerp(cache,key.lowerPhase))
  upper=player.animation(key.upperFrame,key.upperOldFrame,phaseBacklerp(cache,key.upperPhase))
  // Quake III player heads are static MD3 pieces, so they do not participate
  // in the key and always use their first frame.
  head=player.animation(0,0,0.0)
  assembled=player.assemble(cache.models,lower,upper,head,player.identityTransform());if assembled is error then return assembled end if
  triangles=player.render(assembled,cache.maxTrianglesPerTarget);if triangles is error then return triangles end if
  if not cache.detailed then triangles=limitTriangles(triangles,cache.maxTrianglesPerTarget) end if
  if len(cache.entries)>=cache.maxEntries then
    cache.entries=arrays.slice(cache.entries,1,len(cache.entries)-1);cache.evictions=cache.evictions+1
  end if
  entry=Entry(key,triangles);cache.entries=cache.entries+[entry];cache.builds=cache.builds+1
  if cache.detailed then cache.sourceTriangles=cache.sourceTriangles+len(triangles) end if
  return entry
end function

function localTriangleToTarget(source,target)
  positions=array(3,void);normals=array(3,void)
  for corner=0 to 2
    px=source.positions[corner][0];py=source.positions[corner][1];pz=source.positions[corner][2]
    point=[px*target.axis[0][0]+py*target.axis[1][0]+pz*target.axis[2][0]+target.origin[0],px*target.axis[0][1]+py*target.axis[1][1]+pz*target.axis[2][1]+target.origin[1],px*target.axis[0][2]+py*target.axis[1][2]+pz*target.axis[2][2]+target.origin[2]]
    nx=source.normals[corner][0];ny=source.normals[corner][1];nz=source.normals[corner][2]
    normal=[nx*target.axis[0][0]+ny*target.axis[1][0]+nz*target.axis[2][0],nx*target.axis[0][1]+ny*target.axis[1][1]+nz*target.axis[2][1],nx*target.axis[0][2]+ny*target.axis[1][2]+nz*target.axis[2][2]]
    positions[corner]=point;normals[corner]=normal
  end for
  return player.Triangle(positions,source.texCoords,normals,source.part,source.surfaceIndex,source.shaderName)
end function

function transformTriangles(triangles,target)
  // Fill a fixed result buffer. Appending here recopies the growing triangle
  // stream for every source triangle and dominates frames with full player LOD.
  result=array(len(triangles),void)
  if len(triangles)>0 then
    for index=0 to len(triangles)-1
      triangle=localTriangleToTarget(triangles[index],target);if triangle is error then return triangle end if
      result[index]=triangle
    end for
  end if
  return result
end function

// One call consumes one target from the current frame budget. Cache misses
// assemble/interpolate in identity space; hits only apply the target transform.
function renderTarget(cache,lowerSample,upperSample,target)
  if cache==void then return fail("missing cache") end if
  if cache.frameTargets>=cache.maxTargetsPerFrame then return fail("target budget exhausted") end if
  valid=player.validateTransform(target);if valid is error then return valid end if
  key=keyFor(cache,lowerSample,upperSample);if key is error then return key end if
  entry=find(cache,key)
  if entry==void then
    cache.misses=cache.misses+1;entry=build(cache,key);if entry is error then return entry end if
  else cache.hits=cache.hits+1 end if
  triangles=transformTriangles(entry.triangles,target);if triangles is error then return triangles end if
  cache.frameTargets=cache.frameTargets+1;cache.frameTriangles=cache.frameTriangles+len(triangles)
  return triangles
end function

function validPoint(value) return value!=void and len(value)==3 end function

function distance(a,b)
  if not validPoint(a) or not validPoint(b) then return fail("viewer and target origins need three components") end if
  dx=numeric.fsub(a[0],b[0]);dy=numeric.fsub(a[1],b[1]);dz=numeric.fsub(a[2],b[2])
  return numeric.fsqrt(numeric.fadd(numeric.fadd(numeric.fmul(dx,dx),numeric.fmul(dy,dy)),numeric.fmul(dz,dz)))
end function

function lodFor(cache,viewerOrigin,visible,target)
  if cache==void or not cache.detailed then return fail("detailed cache required") end if
  if not visible then return LOD_CULLED end if
  separation=distance(viewerOrigin,target.origin);if separation is error then return separation end if
  if separation<=cache.lodPolicy.fullDistance then return LOD_FULL end if
  if separation<=cache.lodPolicy.mediumDistance then return LOD_MEDIUM end if
  if separation<=cache.lodPolicy.farDistance then return LOD_FAR end if
  return LOD_CULLED
end function

function strideFor(cache,lod)
  if lod==LOD_FULL then return 1 end if
  if lod==LOD_MEDIUM then return cache.lodPolicy.mediumStride end if
  if lod==LOD_FAR then return cache.lodPolicy.farStride end if
  return 0
end function

// The source stream is grouped by part and surface. Resetting the stride at
// every boundary guarantees that even a tiny face/gear surface stays present.
function selectLodTriangles(cache,triangles,lod)
  stride=strideFor(cache,lod);if stride==0 then return [] end if
  if stride==1 then return triangles end if
  result=[];previousPart=-1;previousSurface=-1;within=0
  for each triangle in triangles
    if triangle.part!=previousPart or triangle.surfaceIndex!=previousSurface then previousPart=triangle.part;previousSurface=triangle.surfaceIndex;within=0 end if
    if within%stride==0 then result=result+[triangle] end if
    within=within+1
  end for
  return result
end function

function modelForPart(cache,part)
  if part==player.LOWER_PART then return cache.models.lower end if
  if part==player.UPPER_PART then return cache.models.upper end if
  if part==player.HEAD_PART then return cache.models.head end if
  return fail("unknown player part")
end function

function skinForPart(cache,part)
  if part==player.LOWER_PART then return cache.skinSet.lower end if
  if part==player.UPPER_PART then return cache.skinSet.upper end if
  if part==player.HEAD_PART then return cache.skinSet.head end if
  return fail("unknown player part")
end function

function bindingForSurface(cache,part,surfaceIndex)
  model=modelForPart(cache,part);if model is error then return model end if
  if surfaceIndex<0 or surfaceIndex>=len(model.surfaces) then return fail("surface outside player model") end if
  surfaceName=model.surfaces[surfaceIndex].name;skin=skinForPart(cache,part);if skin is error then return skin end if
  for each binding in skin.bindings
    if stringEqualsIgnoreCaseAscii(binding.surface,surfaceName) then return [surfaceName,binding] end if
  end for
  return fail("skin has no binding for "+surfaceName)
end function

function vertexLight(cache,normal)
  dot=numeric.fadd(numeric.fadd(numeric.fmul(normal[0],cache.lighting.direction[0]),numeric.fmul(normal[1],cache.lighting.direction[1])),numeric.fmul(normal[2],cache.lighting.direction[2]))
  if dot<0.0 then dot=0.0 end if
  value=numeric.fadd(cache.lighting.ambient,numeric.fmul(cache.lighting.directed,dot))
  if value>1.0 then value=1.0 end if
  return numeric.f32(value)
end function

function decorateTriangle(cache,triangle,lod)
  resolved=bindingForSurface(cache,triangle.part,triangle.surfaceIndex);if resolved is error then return resolved end if
  lights=[]
  for corner=0 to 2 lights=lights+[vertexLight(cache,triangle.normals[corner])] end for
  return DrawTriangle(triangle.positions,triangle.texCoords,triangle.normals,lights,triangle.part,triangle.surfaceIndex,resolved[0],resolved[1].shaderName,resolved[1].imageName,lod)
end function

// Visibility and distance are evaluated before consuming the per-frame target
// budget. Visible targets use the complete cached mesh at close range.
function renderTargetDetailed(cache,lowerSample,upperSample,target,viewerOrigin,visible)
  if cache==void or not cache.detailed then return fail("detailed cache required") end if
  valid=player.validateTransform(target);if valid is error then return valid end if
  lod=lodFor(cache,viewerOrigin,visible,target);if lod is error then return lod end if
  if lod==LOD_CULLED then cache.frameCulled=cache.frameCulled+1;return [] end if
  if cache.frameTargets>=cache.maxTargetsPerFrame then return fail("target budget exhausted") end if
  key=keyFor(cache,lowerSample,upperSample);if key is error then return key end if
  entry=find(cache,key)
  if entry==void then cache.misses=cache.misses+1;entry=build(cache,key);if entry is error then return entry end if else cache.hits=cache.hits+1 end if
  localTriangles=selectLodTriangles(cache,entry.triangles,lod)
  transformed=transformTriangles(localTriangles,target);if transformed is error then return transformed end if
  // Decoration preserves cardinality, so it can use the same linear fill.
  result=array(len(transformed),void)
  if len(transformed)>0 then
    for index=0 to len(transformed)-1
      output=decorateTriangle(cache,transformed[index],lod);if output is error then return output end if
      result[index]=output
    end for
  end if
  cache.frameTargets=cache.frameTargets+1;cache.frameTriangles=cache.frameTriangles+len(result)
  if lod==LOD_FULL then cache.frameFull=cache.frameFull+1 else if lod==LOD_MEDIUM then cache.frameMedium=cache.frameMedium+1 else cache.frameFar=cache.frameFar+1 end if
  return result
end function

function stats(cache)
  if cache==void then return fail("missing cache") end if
  return Stats(len(cache.entries),cache.hits,cache.misses,cache.builds,cache.evictions,cache.frameTargets,cache.frameTriangles,cache.frameCulled,cache.frameFull,cache.frameMedium,cache.frameFar,cache.sourceTriangles)
end function
