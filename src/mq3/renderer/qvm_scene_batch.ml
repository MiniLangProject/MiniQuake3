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

/// Data record for `mq3.renderer.qvm_scene_batch.Prepared`; groups `geometry`, `batch`, `depthHackGeometry`, `depthHackBatch`, `dynamicGeometry`, `shadowBatch`, and 1 further field.
struct Prepared geometry batch depthHackGeometry depthHackBatch dynamicGeometry shadowBatch shadowCount end struct

/// Creates error `7681` with message `"QVM scene batch: "+message`.
/// @param message Input used in the result expression `error(7681,"QVM scene batch: "+message)`.
function fail(message) return error(7681,"QVM scene batch: "+message) end function
/// Forwards `convertedVertex` to `mq3.renderer.bsp_render_data.RenderVertex` and returns its result.
/// @param triangle Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`.
/// @param corner Vertex index used consistently across source triangle attribute arrays.
/// @param sourceIndex Argument 9 supplied to `mq3.renderer.bsp_render_data.RenderVertex`.
function convertedVertex(triangle,corner,sourceIndex)
  return renderData.RenderVertex(triangle.positions[corner],triangle.texCoords[corner],triangle.lightmapCoords[corner],triangle.normals[corner],triangle.colors[corner],triangle.entityColor,triangle.entityTexCoord,triangle.shaderTime,sourceIndex)
end function
/// Uses a valid nonnegative source vertex ID when available, otherwise preserving the supplied fallback.
/// @param triangle Source triangle with an optional three-entry vertexIds array.
/// @param corner Triangle-local corner index.
/// @param fallback Vertex ID used when source identities are absent or invalid.
/// @returns The stored nonnegative vertex ID, or fallback.
function sourceVertexId(triangle,corner as int,fallback as int) returns int
  if triangle.vertexIds!=void and len(triangle.vertexIds)==3 and triangle.vertexIds[corner]>=0 then return triangle.vertexIds[corner] end if
  return fallback
end function
/// Tests the RF_DEPTHHACK render flag on a source triangle.
/// @param triangle Source triangle carrying entity rendering flags.
/// @returns True when RF_DEPTHHACK is set.
function inline depthHack(triangle) returns bool return (triangle.renderfx&RF_DEPTHHACK)!=0 end function
/// Rejects unresolved projection-shadow triangles while retaining ordinary unresolved geometry.
/// @param resolved Material-resolution record with materialIndex and source triangle.
/// @returns True for a resolved material or a non-projection-shadow triangle.
function renderable(resolved) returns bool return resolved.materialIndex>=0 or resolved.triangle.shaderName!=PROJECTION_SHADOW_SHADER end function
/// Tests whether a resolved triangle requests dynamic lighting and references an opaque-enough catalog material.
/// @param catalog Record providing `catalog.materials`.
/// @param resolved Record providing `resolved.materialIndex`, `resolved.triangle`.
/// @returns True when the source requests dynamic lighting and its valid material has sort <= 3.0.
function inline receivesDynamicLight(catalog,resolved) returns bool
  index=resolved.materialIndex
  return resolved.triangle.dynamicLight and index>=0 and index<len(catalog.materials) and catalog.materials[index].sort<=3.0
end function
/// Computes `entityIndex*1048576+surfaceIndex` for `mq3.renderer.qvm_scene_batch.shadowPolicyKey`.
/// @param entityIndex Input used in the result expression `entityIndex*1048576+surfaceIndex`.
/// @param surfaceIndex Input used in the result expression `entityIndex*1048576+surfaceIndex`.
function shadowPolicyKey(entityIndex,surfaceIndex) return entityIndex*1048576+surfaceIndex end function
// RB_ShadowTessEnd only receives opaque surfaces (SS_OPAQUE) outside fog.
// Cache that decision once per material-resolved MD3 surface rather than once
// per generated volume triangle. An unresolved shader is Baseq3's default
// opaque shader.
/// @param catalog Record providing `catalog.triangles`, `catalog.materials`.
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
/// Computes `policies.get(shadowPolicyKey(entityIndex,surfaceIndex))==true` for `mq3.renderer.qvm_scene_batch.policyOpaque`.
/// @param policies Record providing `policies.get`.
/// @param entityIndex Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_batch.shadowPolicyKey`.
/// @param surfaceIndex Value forwarded as `surfaceIndex` to `mq3.renderer.qvm_scene_batch.shadowPolicyKey`.
function policyOpaque(policies,entityIndex,surfaceIndex)
  return policies.get(shadowPolicyKey(entityIndex,surfaceIndex))==true
end function
/// Computes `buildShadowBatch` from `existing` using `mq3.renderer.qvm_scene_batch.shadowPolicies`, `mq3.renderer.qvm_scene_batch.policyOpaque`, `mq3.platform.playable_window.createTriangleBatch`.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.shadowPolicies`.
/// @param sceneGeometry Record providing `sceneGeometry.shadowTriangles`, `sceneGeometry.shadowTriangleCount`.
/// @param existing Input used by `batch=existing`.
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
/// Builds `triangles[i]` in `mq3.renderer.qvm_scene_batch.sizeGeometry`; returns `renderData.RenderData(triangles,0,count,0,false,0)`.
/// @param previous Record providing `previous.triangles`, `previous.triangleCount`.
/// @param count Argument 1 supplied to `array`.
function sizeGeometry(previous,count as int)
  if previous!=void and len(previous.triangles)==count then return previous end if
  triangles=array(count,void)
  if previous!=void then
    shared=count;if previous.triangleCount<shared then shared=previous.triangleCount end if
    i=0
    while i<shared
      triangles[i]=previous.triangles[i];i=i+1
    end while
  end if
  return renderData.RenderData(triangles,0,count,0,false,0)
end function
/// Updates `target.position`, `target.baseUV`, `target.lightmapUV`, `target.normal`, `target.color` in `mq3.renderer.qvm_scene_batch.updateConvertedVertex`; returns `target`.
/// @param target Mutable record or buffer; this call updates `target.position`, `target.baseUV`, `target.lightmapUV`, `target.normal`, `target.color`.
/// @param triangle Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`.
/// @param corner Input used by `target.position=triangle.positions[corner]`.
/// @param sourceIndex Value assigned to `target.sourceIndex`.
function updateConvertedVertex(target,triangle,corner as int,sourceIndex as int)
  target.position=triangle.positions[corner];target.baseUV=triangle.texCoords[corner];target.lightmapUV=triangle.lightmapCoords[corner];target.normal=triangle.normals[corner];target.color=triangle.colors[corner];target.entityColor=triangle.entityColor;target.entityTexCoord=triangle.entityTexCoord;target.shaderTime=triangle.shaderTime;target.sourceIndex=sourceIndex
  return target
end function
/// Updates `geometry.triangles[index]` in `mq3.renderer.qvm_scene_batch.writeTriangle`.
/// @param geometry Mutable record or buffer; this call updates `geometry.triangles[index]`.
/// @param index Argument 6 supplied to `mq3.renderer.bsp_render_data.RenderTriangle`.
/// @param resolved Record providing `resolved.triangle`, `resolved.materialIndex`.
/// @param fallbackBase Input used by `fallback=fallbackBase+index*3`.
function writeTriangle(geometry,index as int,resolved,fallbackBase as int)
  source=resolved.triangle;target=geometry.triangles[index];fallback=fallbackBase+index*3
  if target==void then
    vertices=array(3,void)
    for corner=0 to 2 vertices[corner]=convertedVertex(source,corner,sourceVertexId(source,corner,fallback+corner)) end for
    geometry.triangles[index]=renderData.RenderTriangle(vertices,resolved.materialIndex,source.lightmapIndex,source.fogIndex,-1,index)
  else
    for corner=0 to 2 updateConvertedVertex(target.vertices[corner],source,corner,sourceVertexId(source,corner,fallback+corner)) end for
    target.textureIndex=resolved.materialIndex;target.lightmapIndex=source.lightmapIndex;target.fogIndex=source.fogIndex
  end if
  return void
end function
// Each view owns its vertex records. Preserve catalog order within each pass
// and allocate fallback IDs above every source ID, including filtered surfaces.
/// @param prepared Mutable record or buffer; this call updates `prepared.geometry`, `prepared.depthHackGeometry`, `prepared.dynamicGeometry`.
/// @param catalog Record providing `catalog.triangles`.
function prepareGeometry(prepared,catalog)
  regular=0;depth=0;dynamic=0;maximum=-1
  for each resolved in catalog.triangles
    source=resolved.triangle;ids=source.vertexIds
    if ids!=void and len(ids)==3 then
      for each id in ids if id>maximum then maximum=id end if end for
    end if
    if not renderable(resolved) then continue end if
    if depthHack(source) then depth=depth+1 else
      regular=regular+1
      if receivesDynamicLight(catalog,resolved) then dynamic=dynamic+1 end if
    end if
  end for
  prepared.geometry=sizeGeometry(prepared.geometry,regular)
  prepared.depthHackGeometry=sizeGeometry(prepared.depthHackGeometry,depth)
  prepared.dynamicGeometry=sizeGeometry(prepared.dynamicGeometry,dynamic)
  fallbackBase=maximum+1;regular=0;depth=0;dynamic=0
  for each resolved in catalog.triangles
    if not renderable(resolved) then continue end if
    if depthHack(resolved.triangle) then
      writeTriangle(prepared.depthHackGeometry,depth,resolved,fallbackBase);depth=depth+1
    else
      writeTriangle(prepared.geometry,regular,resolved,fallbackBase);regular=regular+1
      if receivesDynamicLight(catalog,resolved) then
        writeTriangle(prepared.dynamicGeometry,dynamic,resolved,fallbackBase);dynamic=dynamic+1
      end if
    end if
  end for
  return prepared
end function
/// Returns `prepared.geometry` from `mq3.renderer.qvm_scene_batch.convert`; earlier branches return `fail("material catalog is required")`.
/// @param catalog Record providing `catalog.triangles`.
function convert(catalog)
  if catalog==void or catalog.triangles==void then return fail("material catalog is required") end if
  prepared=prepareGeometry(Prepared(void,void,void,void,void,void,0),catalog)
  return prepared.geometry
end function
/// Computes `prepareMaterials` from `worldBatch.buildMaterials(geometry,catalog,skyFlags)` using `mq3.renderer.playable_world_batch.refreshMaterials`, `mq3.renderer.playable_world_batch.buildMaterials`.
/// @param previous Record providing `previous.sourceTriangles`.
/// @param geometry Record providing `geometry.triangleCount`.
/// @param catalog Argument 3 supplied to `mq3.renderer.playable_world_batch.refreshMaterials`.
/// @param skyFlags Argument 4 supplied to `mq3.renderer.playable_world_batch.refreshMaterials`.
function prepareMaterials(previous,geometry,catalog,skyFlags)
  if previous!=void then
    if geometry.triangleCount==0 and previous.sourceTriangles==0 then return previous end if
    refreshed=worldBatch.refreshMaterials(previous,geometry,catalog,skyFlags)
    if refreshed is error then return refreshed end if
    if refreshed!=false then return refreshed end if
  end if
  return worldBatch.buildMaterials(geometry,catalog,skyFlags)
end function
/// Updates `prepared.batch`, `prepared.depthHackBatch`, `prepared.shadowBatch`, `prepared.shadowCount` in `mq3.renderer.qvm_scene_batch.refreshWithGeometry`; returns `prepared`.
/// @param prepared Mutable record or buffer; this call updates `prepared.batch`, `prepared.depthHackBatch`, `prepared.shadowBatch`, `prepared.shadowCount`.
/// @param catalog Record providing `catalog.triangles`, `catalog.materials`.
/// @param sceneGeometry Value forwarded as `sceneGeometry` to `mq3.renderer.qvm_scene_batch.buildShadowBatch`.
function refreshWithGeometry(prepared,catalog,sceneGeometry)
  if prepared==void or catalog==void or catalog.triangles==void then return fail("prepared batch and material catalog are required") end if
  prepareGeometry(prepared,catalog)
  skyFlags=array(len(catalog.materials),false)
  batch=prepareMaterials(prepared.batch,prepared.geometry,catalog,skyFlags);if batch is error then return batch end if
  depth=prepareMaterials(prepared.depthHackBatch,prepared.depthHackGeometry,catalog,skyFlags);if depth is error then return depth end if
  shadow=buildShadowBatch(catalog,sceneGeometry,prepared.shadowBatch);if shadow is error then return shadow end if
  prepared.batch=batch;prepared.depthHackBatch=depth;prepared.shadowBatch=shadow;prepared.shadowCount=0
  if shadow!=void then prepared.shadowCount=shadow.count end if
  return prepared
end function
/// Calls `mq3.renderer.qvm_scene_batch.refreshWithGeometry` with `(Prepared(void,void,void,void,void,void,0),catalog,sceneGeometry)` and returns its result.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`.
/// @param sceneGeometry Value forwarded as `sceneGeometry` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`.
function buildWithGeometry(catalog,sceneGeometry)
  return refreshWithGeometry(Prepared(void,void,void,void,void,void,0),catalog,sceneGeometry)
end function
/// Calls `mq3.renderer.qvm_scene_batch.buildWithGeometry` with `(catalog,void)` and returns its result.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.buildWithGeometry`.
function build(catalog) return buildWithGeometry(catalog,void) end function
/// Calls `mq3.renderer.qvm_scene_batch.refreshWithGeometry` with `(prepared,catalog,void)` and returns its result.
/// @param prepared Value forwarded as `prepared` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`.
function refresh(prepared,catalog) return refreshWithGeometry(prepared,catalog,void) end function
/// Computes `attachFog` from `attached+depthAttached` using `mq3.renderer.playable_world_batch.attachFog`.
/// @param prepared Record providing `prepared.batch`, `prepared.geometry`, `prepared.depthHackBatch`, `prepared.depthHackGeometry`.
/// @param catalog Argument 3 supplied to `mq3.renderer.playable_world_batch.attachFog`.
function attachFog(prepared,catalog)
  if prepared==void or prepared.batch==void or prepared.geometry==void then return fail("prepared batch is required") end if
  if catalog==void then return 0 end if
  attached=worldBatch.attachFog(prepared.batch,prepared.geometry,catalog);if attached is error then return attached end if
  depthAttached=worldBatch.attachFog(prepared.depthHackBatch,prepared.depthHackGeometry,catalog);if depthAttached is error then return depthAttached end if
  return attached+depthAttached
end function
/// Builds `origins[index]`, `axes[index]`, `bounds[index]` in `mq3.renderer.qvm_scene_batch.attachDynamicLights`.
/// @param prepared Record providing `prepared.batch`, `prepared.dynamicGeometry`.
/// @param catalog Record providing `catalog.triangles`, `catalog.materials`.
/// @param lightCatalog Argument 4 supplied to `mq3.renderer.playable_world_batch.attachDynamicLightsOriented`.
function attachDynamicLights(prepared,catalog,lightCatalog)
  if prepared==void or prepared.batch==void or prepared.dynamicGeometry==void then return fail("prepared batch is required") end if
  if lightCatalog==void then return 0 end if
  count=prepared.dynamicGeometry.triangleCount;origins=array(count,void);axes=array(count,void);bounds=array(count,void);index=0
  for each resolved in catalog.triangles if not depthHack(resolved.triangle) and receivesDynamicLight(catalog,resolved) then origins[index]=resolved.triangle.dynamicLightOrigin;axes[index]=resolved.triangle.dynamicLightAxis;bounds[index]=resolved.triangle.dynamicLightBounds;index=index+1 end if end for
  receiveFlags=array(len(catalog.materials),true);return worldBatch.attachDynamicLightsOriented(prepared.batch,prepared.dynamicGeometry,receiveFlags,lightCatalog,origins,axes,bounds)
end function
/// Calls `mq3.renderer.playable_world_batch.uploadMaterials` with `(catalog)` and returns its result.
/// @param catalog Argument 1 supplied to `mq3.renderer.playable_world_batch.uploadMaterials`.
function upload(catalog) return worldBatch.uploadMaterials(catalog) end function
/// Calls `mq3.renderer.playable_world_batch.releaseMaterials` with `(catalog)` and returns its result.
/// @param catalog Argument 1 supplied to `mq3.renderer.playable_world_batch.releaseMaterials`.
function release(catalog) return worldBatch.releaseMaterials(catalog) end function
/// Computes `draw` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterials`, `mq3.platform.playable_window.setDepthRange`.
/// @param prepared Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`.
/// @param projection Record providing `projection.nearDistance`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterials`.
function draw(prepared,projection,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterials(prepared.batch,projection,nowMilliseconds);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterials(prepared.depthHackBatch,projection,nowMilliseconds);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
/// Computes `drawViewport` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsViewport`, `mq3.platform.playable_window.setDepthRange`.
/// @param prepared Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`.
/// @param projection Record providing `projection.nearDistance`.
/// @param area Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsViewport`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsViewport`.
function drawViewport(prepared,projection,area,nowMilliseconds)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterialsViewport(prepared.batch,projection,nowMilliseconds,area);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterialsViewport(prepared.depthHackBatch,projection,nowMilliseconds,area);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
/// Computes `drawLit` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsLit`, `mq3.platform.playable_window.setDepthRange`, `mq3.renderer.playable_world_batch.drawMaterials`.
/// @param prepared Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`.
/// @param projection Record providing `projection.nearDistance`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
function drawLit(prepared,projection,nowMilliseconds,lights)
  if prepared==void or prepared.batch==void then return fail("prepared batch is required") end if
  drawn=worldBatch.drawMaterialsLit(prepared.batch,projection,nowMilliseconds,lights);if drawn is error then return drawn end if
  if prepared.depthHackGeometry.triangleCount==0 then return drawn end if
  if not window.setDepthRange(0.3,projection.nearDistance) then return fail("could not enable RF_DEPTHHACK depth range") end if
  depthDrawn=worldBatch.drawMaterials(prepared.depthHackBatch,projection,nowMilliseconds);restored=window.setDepthRange(1.0,projection.nearDistance)
  if depthDrawn is error then return depthDrawn end if;if not restored then return fail("could not restore world depth range") end if;return drawn+depthDrawn
end function
/// Computes `drawLitViewport` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`, `mq3.platform.playable_window.setDepthRange`, `mq3.renderer.playable_world_batch.drawMaterialsViewport`.
/// @param prepared Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`.
/// @param projection Record providing `projection.nearDistance`.
/// @param area Argument 5 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`.
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
/// @param prepared Record providing `prepared.shadowBatch`, `prepared.shadowCount`.
/// @param projection Argument 2 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`.
/// @param area Argument 1 supplied to `mq3.platform.playable_window.clearStencil`.
/// @param mirror Input tested by `mirror`.
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
/// Computes `drawLitViewportShadows` from `drawn+shadows` using `mq3.renderer.qvm_scene_batch.drawLitViewport`, `mq3.renderer.qvm_scene_batch.drawStencilShadows`.
/// @param prepared Value forwarded as `prepared` to `mq3.renderer.qvm_scene_batch.drawLitViewport`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.qvm_scene_batch.drawLitViewport`.
/// @param area Value forwarded as `area` to `mq3.renderer.qvm_scene_batch.drawLitViewport`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.qvm_scene_batch.drawLitViewport`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.qvm_scene_batch.drawLitViewport`.
/// @param mirror Value forwarded as `mirror` to `mq3.renderer.qvm_scene_batch.drawStencilShadows`.
function drawLitViewportShadows(prepared,projection,area,nowMilliseconds,lights,mirror)
  drawn=drawLitViewport(prepared,projection,area,nowMilliseconds,lights);if drawn is error then return drawn end if
  shadows=drawStencilShadows(prepared,projection,area,mirror);if shadows is error then return shadows end if;return drawn+shadows
end function
