// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral geometry expansion for refEntity_t and poly submissions
// produced by the original cgame/ui QVMs.
package mq3.renderer.qvm_scene_geometry

import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.surface_entities as surfaceEntities
import mq3.renderer.view_math as viewMath
import mq3.renderer.surface_md3 as surfaceMd3
import mq3.renderer.playable_light_grid as lightGrid
import mq3.format.md3 as md3
import std.array as arrays

const RT_MODEL=0
const RT_SPRITE=2

struct Triangle positions texCoords normals colors modelHandle customSkin shaderHandle shaderName surfaceName entityIndex surfaceIndex end struct
struct Geometry triangles triangleCount modelEntities spriteEntities polySurfaces skippedInline skippedUnsupported sourceVertices vertexTransforms end struct
struct FrameEntry modelHandle surfaceIndex frame oldFrame backlerp xyz normals end struct
struct TransformEntry modelHandle surfaceIndex frame oldFrame backlerp origin axis positions normals lightAmbient lightDirected lightDirection lightAlpha colors end struct
struct FrameCache normalTable entries maxEntries hits misses transforms transformHits transformMisses end struct

function fail(message) return error(7670,"QVM scene geometry: "+message) end function
function normal() return [0.0,0.0,1.0] end function
function triangle(positions,coords,normals,colors,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex)
  return Triangle(positions,coords,normals,colors,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex)
end function
function modelAt(assetKinds,modelAssets,handle)
  if handle<=0 or handle>len(assetKinds) or assetKinds[handle-1]!="model" or handle>len(modelAssets) then return void end if
  return modelAssets[handle-1]
end function
function appendTriangle(output,value)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  target=output.triangles[output.triangleCount]
  if target==void then output.triangles[output.triangleCount]=value
  else
    for corner=0 to 2 target.positions[corner]=value.positions[corner];target.texCoords[corner]=value.texCoords[corner];target.normals[corner]=value.normals[corner];target.colors[corner]=value.colors[corner] end for
    target.modelHandle=value.modelHandle;target.customSkin=value.customSkin;target.shaderHandle=value.shaderHandle;target.shaderName=value.shaderName;target.surfaceName=value.surfaceName;target.entityIndex=value.entityIndex;target.surfaceIndex=value.surfaceIndex
  end if
  output.triangleCount=output.triangleCount+1;return void
end function
function appendIndexedModelTriangle(output,worldPositions,texCoords,worldNormals,vertexColors,defaultColor,a,b,c,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  target=output.triangles[output.triangleCount]
  if target==void then
    colors=[defaultColor,defaultColor,defaultColor];if vertexColors!=void then colors=[vertexColors[a],vertexColors[b],vertexColors[c]] end if
    target=triangle([worldPositions[a],worldPositions[b],worldPositions[c]],[texCoords[a],texCoords[b],texCoords[c]],[worldNormals[a],worldNormals[b],worldNormals[c]],colors,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex);output.triangles[output.triangleCount]=target
  else
    for corner=0 to 2 index=a;if corner==1 then index=b else if corner==2 then index=c end if;target.positions[corner]=worldPositions[index];target.texCoords[corner]=texCoords[index];target.normals[corner]=worldNormals[index];target.colors[corner]=defaultColor;if vertexColors!=void then target.colors[corner]=vertexColors[index] end if end for
    target.modelHandle=modelHandle;target.customSkin=customSkin;target.shaderHandle=shaderHandle;target.shaderName=shaderName;target.surfaceName=surfaceName;target.entityIndex=entityIndex;target.surfaceIndex=surfaceIndex
  end if
  output.triangleCount=output.triangleCount+1;return void
end function
function modelTriangleCount(model,maxTrianglesPerSurface)
  count=0
  for each surface in model.surfaces amount=surface.mesh.numTriangles;if amount>maxTrianglesPerSurface then amount=maxTrianglesPerSurface end if;count=count+amount end for
  return count
end function
function expectedTriangles(entities,polys,assetKinds,modelAssets,maxTrianglesPerSurface)
  count=0
  for each value in entities
    decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if
    if decoded.reType==RT_MODEL then model=modelAt(assetKinds,modelAssets,decoded.hModel);if model!=void and typeof(model)!="string" then count=count+modelTriangleCount(model,maxTrianglesPerSurface) end if
    else if decoded.reType==RT_SPRITE then count=count+2 end if
  end for
  for each poly in polys if len(poly.verts)>=3 then count=count+len(poly.verts)-2 end if end for
  return count
end function
function decodeEntities(entities)
  result=array(len(entities),void);index=0
  for each value in entities decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if;result[index]=decoded;index=index+1 end for
  return result
end function
function expectedDecodedTriangles(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface)
  count=0
  for each decoded in decodedEntities
    if decoded.reType==RT_MODEL then model=modelAt(assetKinds,modelAssets,decoded.hModel);if model!=void and typeof(model)!="string" then count=count+modelTriangleCount(model,maxTrianglesPerSurface) end if
    else if decoded.reType==RT_SPRITE then count=count+2 end if
  end for
  for each poly in polys if len(poly.verts)>=3 then count=count+len(poly.verts)-2 end if end for
  return count
end function
function transformTriangle(source,orientation,color,modelHandle,customSkin,shaderHandle,surfaceName,entityIndex,lighting)
  positions=array(3,void);normals=array(3,void)
  for corner=0 to 2
    point=viewMath.localPointToWorld(source.positions[corner],orientation);if point is error then return point end if
    direction=viewMath.localNormalToWorld(source.normals[corner],orientation);if direction is error then return direction end if
    positions[corner]=point;normals[corner]=direction
  end for
  colors=[color,color,color]
  if lighting!=void then colors=array(3,void);for corner=0 to 2 colors[corner]=lightGrid.vertexColor(lighting,normals[corner]);colors[corner][3]=color[3] end for end if
  return triangle(positions,source.texCoords,normals,colors,modelHandle,customSkin,shaderHandle,source.shaderName,surfaceName,entityIndex,source.surfaceIndex)
end function
function createNormalTable() return surfaceMd3.normalTable() end function
function createFrameCache(normalTable,maxEntries)
  if maxEntries<1 then return fail("frame cache needs positive capacity") end if
  if normalTable==void then normalTable=createNormalTable() end if
  return FrameCache(normalTable,[],maxEntries,0,0,[],0,0)
end function
function cachedFrame(cache,modelHandle,model,surfaceIndex,frame,oldFrame,backlerp,normalTable)
  if cache!=void then
    for each entry in cache.entries
      if entry.modelHandle==modelHandle and entry.surfaceIndex==surfaceIndex and entry.frame==frame and entry.oldFrame==oldFrame and entry.backlerp==backlerp then cache.hits=cache.hits+1;return entry end if
    end for
  end if
  table=normalTable;if cache!=void then table=cache.normalTable end if
  surface=model.surfaces[surfaceIndex];lerped=surfaceMd3.lerpVertexesCached(surface.mesh,frame,oldFrame,backlerp,table);if lerped is error then return lerped end if
  entry=FrameEntry(modelHandle,surfaceIndex,frame,oldFrame,backlerp,lerped[0],lerped[1])
  if cache!=void then
    if len(cache.entries)>=cache.maxEntries then cache.entries=arrays.slice(cache.entries,1,len(cache.entries)-1) end if
    cache.entries=cache.entries+[entry];cache.misses=cache.misses+1
  end if
  return entry
end function
function cachedTransform(cache,decoded,surfaceIndex,frameData)
  if cache!=void then
    for each entry in cache.transforms
      if entry.modelHandle==decoded.hModel and entry.surfaceIndex==surfaceIndex and entry.frame==decoded.frame and entry.oldFrame==decoded.oldframe and entry.backlerp==decoded.backlerp and entry.origin==decoded.origin and entry.axis==decoded.axis then cache.transformHits=cache.transformHits+1;return entry end if
    end for
  end if
  orientation=viewMath.orientation(decoded.origin,decoded.axis);count=len(frameData.xyz);worldPositions=array(count,void);worldNormals=array(count,void)
  for vertexIndex=0 to count-1
    point=viewMath.localPointToWorld(frameData.xyz[vertexIndex],orientation);if point is error then return point end if
    direction=viewMath.localNormalToWorld(frameData.normals[vertexIndex],orientation);if direction is error then return direction end if
    worldPositions[vertexIndex]=point;worldNormals[vertexIndex]=direction
  end for
  result=TransformEntry(decoded.hModel,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,decoded.origin,decoded.axis,worldPositions,worldNormals,void,void,void,-1,void)
  if cache!=void then
    if len(cache.transforms)>=cache.maxEntries then cache.transforms=arrays.slice(cache.transforms,1,len(cache.transforms)-1) end if
    cache.transforms=cache.transforms+[result];cache.transformMisses=cache.transformMisses+1
  end if
  return result
end function
function cachedVertexColors(entry,lighting,alpha)
  if entry.colors!=void and entry.lightAlpha==alpha and entry.lightAmbient==lighting.ambient and entry.lightDirected==lighting.directed and entry.lightDirection==lighting.direction then return entry.colors end if
  colors=array(len(entry.normals),void)
  for vertexIndex=0 to len(entry.normals)-1 color=lightGrid.vertexColor(lighting,entry.normals[vertexIndex]);color[3]=alpha;colors[vertexIndex]=color end for
  entry.lightAmbient=lighting.ambient;entry.lightDirected=lighting.directed;entry.lightDirection=lighting.direction;entry.lightAlpha=alpha;entry.colors=colors;return colors
end function
function addModelOptimized(output,decoded,model,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef)
  if decoded.frame<0 or decoded.frame>=model.numFrames or decoded.oldframe<0 or decoded.oldframe>=model.numFrames then return fail("MD3 frame outside model") end if
  if decoded.backlerp<0.0 or decoded.backlerp>1.0 then return fail("MD3 backlerp outside zero to one") end if
  lighting=void
  if grid!=void and refdef!=void and (refdef.flags&1)==0 then lightOrigin=decoded.origin;if (decoded.renderfx&128)!=0 then lightOrigin=decoded.lightingOrigin end if;lighting=lightGrid.entitySample(grid,lightOrigin) end if
  for surfaceIndex=0 to len(model.surfaces)-1
    surface=model.surfaces[surfaceIndex];limit=surface.mesh.numTriangles;if limit>maxTrianglesPerSurface then limit=maxTrianglesPerSurface end if
    if limit==0 then continue end if
    frameData=cachedFrame(cache,decoded.hModel,model,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,normalTable);if frameData is error then return frameData end if
    transformed=cachedTransform(cache,decoded,surfaceIndex,frameData);if transformed is error then return transformed end if;worldPositions=transformed.positions;worldNormals=transformed.normals;vertexColors=void
    if lighting!=void then vertexColors=cachedVertexColors(transformed,lighting,decoded.shaderRGBA[3]) end if
    output.sourceVertices=output.sourceVertices+surface.mesh.numVerts;output.vertexTransforms=output.vertexTransforms+surface.mesh.numVerts
    shaderName="";if len(surface.shaders)>0 then shaderName=surface.shaders[0] end if
    for triangleIndex=0 to limit-1
      base=triangleIndex*3;a=surface.mesh.triangles[base];b=surface.mesh.triangles[base+1];c=surface.mesh.triangles[base+2]
      stored=appendIndexedModelTriangle(output,worldPositions,surface.mesh.texCoords,worldNormals,vertexColors,decoded.shaderRGBA,a,b,c,decoded.hModel,decoded.customSkin,decoded.customShader,shaderName,surface.name,entityIndex,surfaceIndex);if stored is error then return stored end if
    end for
  end for
  output.modelEntities=output.modelEntities+1;return void
end function
function addSprite(output,decoded,refdef,entityIndex)
  if refdef==void or refdef.viewaxis==void or len(refdef.viewaxis)!=3 then return fail("sprite needs refdef view axes") end if
  submission=surfaceEntities.surfaceSprite(decoded.origin,decoded.radius,decoded.rotation,decoded.shaderRGBA,refdef.viewaxis[1],refdef.viewaxis[2],refdef.viewaxis[0],false,0,0,65536,65536)
  if submission is error then return submission end if
  for index=0 to 1
    positions=array(3,void);coords=array(3,void);normals=array(3,void)
    for corner=0 to 2
      vertex=submission.vertices[submission.indexes[index*3+corner]];positions[corner]=vertex.xyz;coords[corner]=vertex.tex0;normals[corner]=vertex.normal
    end for
    stored=appendTriangle(output,triangle(positions,coords,normals,[decoded.shaderRGBA,decoded.shaderRGBA,decoded.shaderRGBA],0,0,decoded.customShader,"","",entityIndex,0));if stored is error then return stored end if
  end for
  output.spriteEntities=output.spriteEntities+1;return void
end function
function addPolys(output,polys)
  for each poly in polys
    if len(poly.verts)>=3 then
      for index=1 to len(poly.verts)-2
        a=poly.verts[0];b=poly.verts[index];c=poly.verts[index+1]
        stored=appendTriangle(output,triangle([a.xyz,b.xyz,c.xyz],[a.st,b.st,c.st],[normal(),normal(),normal()],[a.modulate,b.modulate,c.modulate],0,0,poly.hShader,"","",-1,output.polySurfaces));if stored is error then return stored end if
      end for
    end if
    output.polySurfaces=output.polySurfaces+1
  end for
  return void
end function
function buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous)
  if entities==void or polys==void or assetKinds==void or modelAssets==void or maxTrianglesPerSurface<0 then return fail("invalid build input") end if
  decodedEntities=decodeEntities(entities);if decodedEntities is error then return decodedEntities end if
  capacity=expectedDecodedTriangles(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface)
  output=void
  if previous!=void and previous.triangles!=void and len(previous.triangles)==capacity then output=previous;output.triangleCount=0;output.modelEntities=0;output.spriteEntities=0;output.polySurfaces=0;output.skippedInline=0;output.skippedUnsupported=0;output.sourceVertices=0;output.vertexTransforms=0
  else output=Geometry(array(capacity,void),0,0,0,0,0,0,0,0) end if
  entityIndex=0
  for each decoded in decodedEntities
    if decoded.reType==RT_MODEL then
      model=modelAt(assetKinds,modelAssets,decoded.hModel)
      if model==void then output.skippedUnsupported=output.skippedUnsupported+1
      else if typeof(model)=="string" then output.skippedInline=output.skippedInline+1
      else added=addModelOptimized(output,decoded,model,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef);if added is error then return added end if
      end if
    else if decoded.reType==RT_SPRITE then added=addSprite(output,decoded,refdef,entityIndex);if added is error then return added end if
    else output.skippedUnsupported=output.skippedUnsupported+1
    end if
    entityIndex=entityIndex+1
  end for
  addedPolys=addPolys(output,polys);if addedPolys is error then return addedPolys end if
  return output
end function
function buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid) return buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void) end function
function buildRecordsCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable,grid) return buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void,normalTable,grid) end function
function buildRecordsWithFrameCache(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid)
  if cache==void then return fail("frame cache is required") end if
  return buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid)
end function
function buildRecordsWithFrameCacheReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous)
  if cache==void then return fail("frame cache is required") end if
  return buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous)
end function
function buildRecordsCached(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable) return buildRecordsCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable,void) end function
function buildRecords(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface) return buildRecordsCached(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void) end function
function build(scene,assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
  if scene==void then return fail("missing scene") end if
  return buildRecords(sceneQueue.sceneEntities(scene),sceneQueue.scenePolys(scene),assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
end function
