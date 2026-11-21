// SPDX-License-Identifier: GPL-2.0-or-later
// Adapts original QVM refEntity/poly geometry to the native multi-pass batch.
package mq3.renderer.qvm_scene_batch

import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.playable_world_batch as worldBatch
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import std.ds.hashmap as maps

const RF_DEPTHHACK=8
const PROJECTION_SHADOW_SHADER="$mq3/projectionShadow"

struct Prepared geometry batch depthHackGeometry depthHackBatch dynamicGeometry shadowBatch shadowCount end struct

function fail(message) return error(7681,"QVM scene batch: "+message) end function
function convertedVertex(triangle,corner,sourceIndex)
  return renderData.RenderVertex(triangle.positions[corner],triangle.texCoords[corner],triangle.lightmapCoords[corner],triangle.normals[corner],triangle.colors[corner],triangle.entityColor,triangle.entityTexCoord,triangle.shaderTime,sourceIndex)
end function
function fallbackVertexBase(catalog)
  maximum=-1
  for each resolved in catalog.triangles ids=resolved.triangle.vertexIds;if ids!=void and len(ids)==3 then for each id in ids if id>maximum then maximum=id end if end for end if end for
  return maximum+1
end function
function sourceVertexId(triangle,corner,fallback)
  if triangle.vertexIds!=void and len(triangle.vertexIds)==3 and triangle.vertexIds[corner]>=0 then return triangle.vertexIds[corner] end if
  return fallback
end function
function depthHack(triangle) return (triangle.renderfx&RF_DEPTHHACK)!=0 end function
function renderable(resolved) return resolved.materialIndex>=0 or resolved.triangle.shaderName!=PROJECTION_SHADOW_SHADER end function
function selectedCount(catalog,wantDepthHack)
  count=0;for each resolved in catalog.triangles if renderable(resolved) and depthHack(resolved.triangle)==wantDepthHack then count=count+1 end if end for;return count
end function
function dynamicSelected(catalog,resolved)
  index=resolved.materialIndex;return resolved.triangle.dynamicLight and not depthHack(resolved.triangle) and index>=0 and index<len(catalog.materials) and catalog.materials[index].sort<=3.0
end function
function dynamicCount(catalog) count=0;for each resolved in catalog.triangles if dynamicSelected(catalog,resolved) then count=count+1 end if end for;return count end function
function shadowPolicyKey(entityIndex,surfaceIndex) return entityIndex*1048576+surfaceIndex end function
// RB_ShadowTessEnd only receives opaque surfaces (SS_OPAQUE) outside fog.
// Cache that decision once per material-resolved MD3 surface rather than once
// per generated volume triangle. An unresolved shader is Baseq3's default
// opaque shader.
function shadowPolicies(catalog)
  result=maps.HashMap.new()
  for each resolved in catalog.triangles
    source=resolved.triangle;if source.shaderName==PROJECTION_SHADOW_SHADER then continue end if
    key=shadowPolicyKey(source.entityIndex,source.surfaceIndex)
    if result.get(key)!=void then continue end if
    opaque=source.fogIndex<=0
    if resolved.materialIndex>=0 then opaque=opaque and resolved.materialIndex<len(catalog.materials) and catalog.materials[resolved.materialIndex].sort==3.0 end if
    result.set(key,opaque)
  end for
  return result
end function
function policyOpaque(policies,entityIndex,surfaceIndex)
  return policies.get(shadowPolicyKey(entityIndex,surfaceIndex))==true
end function
function buildShadowBatch(catalog,sceneGeometry,existing)
  if sceneGeometry==void or sceneGeometry.shadowTriangles==void or sceneGeometry.shadowTriangleCount==0 then return void end if
  policies=shadowPolicies(catalog);count=0;for index=0 to sceneGeometry.shadowTriangleCount-1 shadow=sceneGeometry.shadowTriangles[index];if policyOpaque(policies,shadow.entityIndex,shadow.surfaceIndex) then count=count+1 end if end for
  if count==0 then return void end if
  batch=existing;if batch==void or batch.capacity<count then batch=window.createTriangleBatch(count);if batch is error then return batch end if else batch=window.resetTriangleBatch(batch) end if
  zero=[0.0,0.0]
  for index=0 to sceneGeometry.shadowTriangleCount-1
    shadow=sceneGeometry.shadowTriangles[index];if not policyOpaque(policies,shadow.entityIndex,shadow.surfaceIndex) then continue end if
    points=shadow.positions;batch=window.appendSingleTextureTrianglePosition(batch,-1,points[0],zero,1.0,points[1],zero,1.0,points[2],zero,1.0,255,255,255);if batch is error then return batch end if
  end for
  return batch
end function
function convertMode(catalog,wantDepthHack)
  if catalog==void or catalog.triangles==void then return fail("material catalog is required") end if
  triangles=array(selectedCount(catalog,wantDepthHack),void);triangleIndex=0;fallbackBase=fallbackVertexBase(catalog)
  for each resolved in catalog.triangles
    if not renderable(resolved) or depthHack(resolved.triangle)!=wantDepthHack then continue end if
    source=resolved.triangle;base=triangleIndex*3
    vertices=[convertedVertex(source,0,sourceVertexId(source,0,fallbackBase+base)),convertedVertex(source,1,sourceVertexId(source,1,fallbackBase+base+1)),convertedVertex(source,2,sourceVertexId(source,2,fallbackBase+base+2))]
    triangles[triangleIndex]=renderData.RenderTriangle(vertices,resolved.materialIndex,source.lightmapIndex,source.fogIndex,-1,triangleIndex);triangleIndex=triangleIndex+1
  end for
  return renderData.RenderData(triangles,0,len(triangles),0,false,0)
end function
function convert(catalog) return convertMode(catalog,false) end function
function convertDynamic(catalog)
  triangles=array(dynamicCount(catalog),void);triangleIndex=0;fallbackBase=fallbackVertexBase(catalog)
  for each resolved in catalog.triangles
    if not dynamicSelected(catalog,resolved) then continue end if
    source=resolved.triangle;base=triangleIndex*3;vertices=[convertedVertex(source,0,sourceVertexId(source,0,fallbackBase+base)),convertedVertex(source,1,sourceVertexId(source,1,fallbackBase+base+1)),convertedVertex(source,2,sourceVertexId(source,2,fallbackBase+base+2))]
    triangles[triangleIndex]=renderData.RenderTriangle(vertices,resolved.materialIndex,source.lightmapIndex,source.fogIndex,-1,triangleIndex);triangleIndex=triangleIndex+1
  end for
  return renderData.RenderData(triangles,0,len(triangles),0,false,0)
end function
function updateConvertedVertex(target,triangle,corner,sourceIndex)
  target.position=triangle.positions[corner];target.baseUV=triangle.texCoords[corner];target.lightmapUV=triangle.lightmapCoords[corner];target.normal=triangle.normals[corner];target.color=triangle.colors[corner];target.entityColor=triangle.entityColor;target.entityTexCoord=triangle.entityTexCoord;target.shaderTime=triangle.shaderTime;target.sourceIndex=sourceIndex;return target
end function
function refreshGeometryMode(geometry,catalog,wantDepthHack)
  if geometry==void or geometry.triangles==void or len(geometry.triangles)!=selectedCount(catalog,wantDepthHack) then return false end if
  triangleIndex=0;fallbackBase=fallbackVertexBase(catalog)
  for each resolved in catalog.triangles
    if not renderable(resolved) or depthHack(resolved.triangle)!=wantDepthHack then continue end if
    target=geometry.triangles[triangleIndex];source=resolved.triangle
    if target==void or target.vertices==void or len(target.vertices)!=3 then return false end if
    base=triangleIndex*3
    for corner=0 to 2 target.vertices[corner]=updateConvertedVertex(target.vertices[corner],source,corner,sourceVertexId(source,corner,fallbackBase+base+corner)) end for
    target.textureIndex=resolved.materialIndex;target.lightmapIndex=source.lightmapIndex;target.fogIndex=source.fogIndex;target.faceIndex= -1;target.triangleIndex=triangleIndex;triangleIndex=triangleIndex+1
  end for
  geometry.triangleCount=len(geometry.triangles);return geometry
end function
function refreshGeometry(geometry,catalog) return refreshGeometryMode(geometry,catalog,false) end function
function refreshDynamicGeometry(geometry,catalog)
  if geometry==void or geometry.triangles==void or len(geometry.triangles)!=dynamicCount(catalog) then return false end if
  triangleIndex=0;fallbackBase=fallbackVertexBase(catalog)
  for each resolved in catalog.triangles
    if not dynamicSelected(catalog,resolved) then continue end if
    target=geometry.triangles[triangleIndex];source=resolved.triangle;if target==void or target.vertices==void or len(target.vertices)!=3 then return false end if;base=triangleIndex*3
    for corner=0 to 2 target.vertices[corner]=updateConvertedVertex(target.vertices[corner],source,corner,sourceVertexId(source,corner,fallbackBase+base+corner)) end for
    target.textureIndex=resolved.materialIndex;target.lightmapIndex=source.lightmapIndex;target.fogIndex=source.fogIndex;target.faceIndex= -1;target.triangleIndex=triangleIndex;triangleIndex=triangleIndex+1
  end for
  geometry.triangleCount=len(geometry.triangles);return geometry
end function
function buildWithGeometry(catalog,sceneGeometry)
  geometry=convertMode(catalog,false);if geometry is error then return geometry end if
  depthGeometry=convertMode(catalog,true);if depthGeometry is error then return depthGeometry end if
  dynamicGeometry=convertDynamic(catalog);if dynamicGeometry is error then return dynamicGeometry end if
  skyFlags=array(len(catalog.materials),false);batch=worldBatch.buildMaterials(geometry,catalog,skyFlags);if batch is error then return batch end if
  depthBatch=worldBatch.buildMaterials(depthGeometry,catalog,skyFlags);if depthBatch is error then return depthBatch end if
  shadowBatch=buildShadowBatch(catalog,sceneGeometry,void);if shadowBatch is error then return shadowBatch end if;shadowCount=0;if shadowBatch!=void then shadowCount=shadowBatch.count end if
  return Prepared(geometry,batch,depthGeometry,depthBatch,dynamicGeometry,shadowBatch,shadowCount)
end function
function build(catalog) return buildWithGeometry(catalog,void) end function
function refreshWithGeometry(prepared,catalog,sceneGeometry)
  if prepared==void or catalog==void or catalog.triangles==void then return fail("prepared batch and material catalog are required") end if
  geometry=refreshGeometry(prepared.geometry,catalog);if geometry is error then return geometry end if
  if geometry==false then return buildWithGeometry(catalog,sceneGeometry) end if
  skyFlags=array(len(catalog.materials),false);batch=worldBatch.refreshMaterials(prepared.batch,geometry,catalog,skyFlags);if batch is error then return batch end if
  if batch==false then return buildWithGeometry(catalog,sceneGeometry) end if
  depthGeometry=refreshGeometryMode(prepared.depthHackGeometry,catalog,true);if depthGeometry is error then return depthGeometry end if
  if depthGeometry==false then return buildWithGeometry(catalog,sceneGeometry) end if
  depthBatch=worldBatch.refreshMaterials(prepared.depthHackBatch,depthGeometry,catalog,skyFlags);if depthBatch is error then return depthBatch end if
  if depthBatch==false then return buildWithGeometry(catalog,sceneGeometry) end if
  dynamicGeometry=refreshDynamicGeometry(prepared.dynamicGeometry,catalog);if dynamicGeometry is error then return dynamicGeometry end if;if dynamicGeometry==false then return buildWithGeometry(catalog,sceneGeometry) end if
  shadowBatch=buildShadowBatch(catalog,sceneGeometry,prepared.shadowBatch);if shadowBatch is error then return shadowBatch end if;shadowCount=0;if shadowBatch!=void then shadowCount=shadowBatch.count end if
  prepared.geometry=geometry;prepared.batch=batch;prepared.depthHackGeometry=depthGeometry;prepared.depthHackBatch=depthBatch;prepared.dynamicGeometry=dynamicGeometry;prepared.shadowBatch=shadowBatch;prepared.shadowCount=shadowCount;return prepared
end function
function refresh(prepared,catalog) return refreshWithGeometry(prepared,catalog,void) end function
function attachFog(prepared,catalog)
  if prepared==void or prepared.batch==void or prepared.geometry==void then return fail("prepared batch is required") end if
  if catalog==void then return 0 end if
  attached=worldBatch.attachFog(prepared.batch,prepared.geometry,catalog);if attached is error then return attached end if
  depthAttached=worldBatch.attachFog(prepared.depthHackBatch,prepared.depthHackGeometry,catalog);if depthAttached is error then return depthAttached end if
  return attached+depthAttached
end function
function attachDynamicLights(prepared,catalog,lightCatalog)
  if prepared==void or prepared.batch==void or prepared.dynamicGeometry==void then return fail("prepared batch is required") end if
  if lightCatalog==void then return 0 end if
  count=dynamicCount(catalog);origins=array(count,void);axes=array(count,void);bounds=array(count,void);index=0
  for each resolved in catalog.triangles if dynamicSelected(catalog,resolved) then origins[index]=resolved.triangle.dynamicLightOrigin;axes[index]=resolved.triangle.dynamicLightAxis;bounds[index]=resolved.triangle.dynamicLightBounds;index=index+1 end if end for
  receiveFlags=array(len(catalog.materials),true);return worldBatch.attachDynamicLightsOriented(prepared.batch,prepared.dynamicGeometry,receiveFlags,lightCatalog,origins,axes,bounds)
end function
function upload(catalog) return worldBatch.uploadMaterials(catalog) end function
function release(catalog) return worldBatch.releaseMaterials(catalog) end function
function draw(prepared,projection,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterials(prepared.batch,projection,nowMilliseconds);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterials(prepared.depthHackBatch,projection,nowMilliseconds);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
function drawViewport(prepared,projection,area,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterialsViewport(prepared.batch,projection,nowMilliseconds,area);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterialsViewport(prepared.depthHackBatch,projection,nowMilliseconds,area);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
function drawLit(prepared,projection,nowMilliseconds,lights)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterialsLit(prepared.batch,projection,nowMilliseconds,lights);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterials(prepared.depthHackBatch,projection,nowMilliseconds);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
function drawLitViewport(prepared,projection,area,nowMilliseconds,lights)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterialsLitViewport(prepared.batch,projection,nowMilliseconds,lights,area);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterialsViewport(prepared.depthHackBatch,projection,nowMilliseconds,area);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
// RB_ShadowTessEnd increments front-facing volume sides and decrements back
// sides; mirrored portal views reverse those cull passes. RB_ShadowFinish then
// overlays 60% black wherever the resulting stencil value is non-zero.
function drawStencilShadows(prepared,projection,area,mirror)
  if prepared.shadowBatch==void or prepared.shadowCount==0 then return 0 end if
  stateValue=multitexture.setState(multitexture.BLEND_OPAQUE,false,false);if stateValue is error then return stateValue end if
  stateValue=multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);if stateValue is error then return stateValue end if
  stateValue=multitexture.setPolygonOffset(false);if stateValue is error then return stateValue end if
  if not window.clearStencil(area) then return fail("could not clear stencil shadow viewport") end if
  first=1;second=2;if mirror then first=3;second=4 end if
  if not window.setStencilPass(first) then return fail("could not enable front stencil shadow pass") end if
  front=window.submitWorldTriangleBatchViewport(prepared.shadowBatch,projection,area)
  if front is error then window.setStencilPass(0);return front end if
  if not window.setStencilPass(second) then window.setStencilPass(0);return fail("could not enable back stencil shadow pass") end if
  back=window.submitWorldTriangleBatchViewport(prepared.shadowBatch,projection,area);restored=window.setStencilPass(0)
  if back is error then return back end if;if not restored then return fail("could not restore normal raster pass") end if
  finished=window.finishStencilShadow(area);if finished<0 then return fail("could not finish stencil shadows") end if
  return front+back
end function
function drawLitViewportShadows(prepared,projection,area,nowMilliseconds,lights,mirror)
  drawn=drawLitViewport(prepared,projection,area,nowMilliseconds,lights);if drawn is error then return drawn end if
  shadows=drawStencilShadows(prepared,projection,area,mirror);if shadows is error then return shadows end if;return drawn+shadows
end function
