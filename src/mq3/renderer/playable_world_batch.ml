// SPDX-License-Identifier: GPL-2.0-or-later
// Retained world-space commands for native projection and rasterization.
package mq3.renderer.playable_world_batch
import std.ds.list as lists
import std.ds.hashmap as maps
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials
import mq3.compat.transcendental as trans
import mq3.compat.numeric as numeric
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.noise as rendererNoise
import mq3.shared.math as qmath
import mq3.renderer.playable_fog as playableFog
import mq3.renderer.playable_dynamic_lights as dynamicLights
import std.sort as sorting

/// Data record for `mq3.renderer.playable_world_batch.Batch`; groups `commands`, `sourceTriangles`, `drawableTriangles`, `skippedSky`.
struct Batch
  /// Operations or drawing commands queued by this record.
  commands
  /// Number of source triangles considered when preparing the batch.
  sourceTriangles
  /// Number of source triangles that can be submitted for drawing.
  drawableTriangles
  /// Number of sky primitives handled outside the normal material batch.
  skippedSky
end struct
/// Data record for `mq3.renderer.playable_world_batch.UvAffine`; groups `m00`, `m01`, `m10`, `m11`, `tx`, `ty`.
struct UvAffine
  /// Coefficient 0,0 of the affine texture-coordinate transform.
  m00
  /// Coefficient 0,1 of the affine texture-coordinate transform.
  m01
  /// Coefficient 1,0 of the affine texture-coordinate transform.
  m10
  /// Coefficient 1,1 of the affine texture-coordinate transform.
  m11
  /// Translation along the X texture-coordinate axis.
  tx
  /// Translation along the Y texture-coordinate axis.
  ty
end struct
/// Data record for `mq3.renderer.playable_world_batch.VertexCache`; groups `slots`, `frames`, `positions`, `uvs`, `colors`.
struct VertexCache
  /// Resource slots or backing arrays retained by this record.
  slots
  /// Generation stamps identifying valid cached vertex results.
  frames
  /// Evaluated vertex positions cached after the current material's deformation step.
  positions
  /// Texture coordinates generated for the pass or its vertices.
  uvs
  /// Evaluated stage colors cached for reusable source vertices in the current update generation.
  colors
end struct
/// Data record for `mq3.renderer.playable_world_batch.VertexIndexScratch`; groups `visited`, `slots`, `serial`.
struct VertexIndexScratch
  /// Per-vertex visitation markers used to avoid repeated work.
  visited
  /// Resource slots or backing arrays retained by this record.
  slots
  /// Generation number used to invalidate earlier visitation or cache markers.
  serial
end struct
/// Data record for `mq3.renderer.playable_world_batch.StagePass`; groups `commands`, `sourceUvs`, `sourceDeformUvs`, `sourcePositions`, `sourceIndexes`, `sourceNormals`, and 20 further fields.
struct StagePass
  /// Operations or drawing commands queued by this record.
  commands
  /// Original texture coordinates retained for animated texture updates.
  sourceUvs
  /// Base texture coordinates retained for vertex-deformation calculations.
  sourceDeformUvs
  /// Original vertex positions retained for time-dependent updates.
  sourcePositions
  /// Original vertex identifiers retained for cache reuse.
  sourceIndexes
  /// Original normals retained for deformation and lighting calculations.
  sourceNormals
  /// Original vertex colors retained before shader color generation.
  sourceColors
  /// Entity color values retained for entity-driven shader stages.
  sourceEntityColors
  /// Entity texture offsets retained for entity-driven modifiers.
  sourceEntityTexCoords
  /// Entity shader-time offsets retained for time-dependent effects.
  sourceShaderTimes
  /// Fog-volume index associated with each retained primitive.
  fogIndexes
  /// Fog modulation applied to this material stage relative to the primary stage.
  fogAdjustment
  /// Runtime material stage executed by this drawing pass.
  stage
  /// Index identifying the texture or BSP shader assigned to the surface.
  textureIndex
  /// Ordered vertex deformations applied by the shader.
  deforms
  /// Noise data used by animated normal-deformation effects.
  normalNoise
  /// Reusable transformed-vertex data shared by compatible stage updates.
  vertexCache
  /// Generation number identifying valid entries in the vertex cache.
  cacheSerial
  /// Whether this is the material's primary drawing pass.
  primary
  /// Whether depth testing accepts only fragments at the existing surface depth.
  depthEqual
  /// Shader ordering category used to schedule this material relative to other surfaces.
  sort
  /// Whether polygon-offset depth bias is applied while drawing.
  polygonOffset
  /// Offset in seconds applied to the material's shader time.
  timeOffset
  /// Upper limit applied to the shader's effect time; zero disables clamping.
  clampTime
  /// Whether initialization completed successfully.
  initialized
  /// Normals retained for view-dependent specular-alpha generation.
  specularNormals
end struct
/// Data record for `mq3.renderer.playable_world_batch.MaterialBatch`; groups `base`, `passes`, `sourceTriangles`, `drawableTriangles`, `emittedTriangles`, `skippedSky`, and 17 further fields.
struct MaterialBatch
  /// Base pass or value from which the current effect is derived.
  base
  /// Drawing passes required by the material or retained batch.
  passes
  /// Number of source triangles considered when preparing the batch.
  sourceTriangles
  /// Number of source triangles that can be submitted for drawing.
  drawableTriangles
  /// Number of triangles submitted after expanding material passes.
  emittedTriangles
  /// Number of sky primitives handled outside the normal material batch.
  skippedSky
  /// Number of drawing passes that use animated processing.
  animatedPasses
  /// Number of drawing passes that use uv modified processing.
  uvModifiedPasses
  /// Number of drawing passes that use blended processing.
  blendedPasses
  /// Number of drawing passes that use generator processing.
  generatorPasses
  /// Number of drawing passes that use alpha test processing.
  alphaTestPasses
  /// Number of drawing passes that use turbulent processing.
  turbulentPasses
  /// Number of drawing passes that use stretch processing.
  stretchPasses
  /// Number of drawing passes that use environment processing.
  environmentPasses
  /// Number of drawing passes that use filter processing.
  filterPasses
  /// Number of drawing passes that use destination alpha processing.
  destinationAlphaPasses
  /// Number of drawing passes that use clamped processing.
  clampedPasses
  /// Number of drawing passes that use deformed processing.
  deformedPasses
  /// Number of drawing passes that use polygon offset processing.
  polygonOffsetPasses
  /// Prepared geometry and commands for the fog contribution.
  fogBatch
  /// Fog volumes and shared fog resources used by the batch.
  fogCatalog
  /// Prepared geometry and commands for dynamic-light contributions.
  dlightBatch
  /// Shared textures and resources used by dynamic-light drawing.
  dlightCatalog
end struct

/// Creates error `7490` with message `"playable world batch: "+text`.
/// @param text Input used in the result expression `error(7490,"playable world batch: "+text)`.
function fail(text) return error(7490,"playable world batch: "+text) end function
/// Computes `(vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0)` for `mq3.renderer.playable_world_batch.vertexLight`.
/// @param vertex Record providing `vertex.color`.
function vertexLight(vertex) return (vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0) end function
/// Checks that a triangle texture index is in range and marked as sky in the texture-flag table.
/// @param triangle Triangle carrying the texture index to classify.
/// @param flags Boolean sky flags indexed by texture number.
/// @returns True only for an in-range texture index whose sky flag is set.
function inline isSky(triangle,flags as array) returns bool return triangle.textureIndex>=0 and triangle.textureIndex<len(flags) and flags[triangle.textureIndex] end function
/// Maximum number of BSP lightmaps retained for material preparation.
const MAX_BSP_LIGHTMAPS=256
/// Returns `slot` from `mq3.renderer.playable_world_batch.resolvedLightmapSlot`; earlier branches return `-1`.
/// @param triangle Record providing `triangle.lightmapIndex`.
function resolvedLightmapSlot(triangle) slot=triangle.lightmapIndex;if slot<0 or slot>=MAX_BSP_LIGHTMAPS then return -1 end if;return slot end function
/// Chooses base/lightmap slots and appends a resolved world triangle with appropriate vertex modulation.
/// @param commands Argument 1 supplied to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param triangle Record providing `triangle.vertices`.
/// @param baseSlot Argument 2 supplied to `mq3.platform.playable_window.appendTriangleBatchPositionColored`.
/// @param useLightmap Input tested by `useLightmap`.
function appendResolved(commands,triangle,baseSlot,useLightmap)
  va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2];lightmapSlot=-1;if useLightmap then lightmapSlot=resolvedLightmapSlot(triangle) end if
  colorA=va.color;colorB=vb.color;colorC=vc.color;if lightmapSlot>=0 then colorA=[255,255,255,255];colorB=colorA;colorC=colorA end if
  if baseSlot>=0 then return window.appendTriangleBatchPositionColored(commands,baseSlot,lightmapSlot,va.position,va.baseUV,va.lightmapUV,1.0,colorA,vb.position,vb.baseUV,vb.lightmapUV,1.0,colorB,vc.position,vc.baseUV,vc.lightmapUV,1.0,colorC,255,255,255) end if
  return window.appendSingleTextureTrianglePositionColored(commands,lightmapSlot,va.position,va.lightmapUV,1.0,colorA,vb.position,vb.lightmapUV,1.0,colorB,vc.position,vc.lightmapUV,1.0,colorC,255,255,255)
end function

// Compatibility builder: byte layout and single submission remain unchanged.
/// @param renderData Record providing `renderData.triangles`.
/// @param materialSlots Indexed input read at `triangle.textureIndex`.
/// @param skyTextureFlags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
function build(renderData,materialSlots,skyTextureFlags)
  if renderData==void or renderData.triangles==void or materialSlots==void or skyTextureFlags==void then return fail("missing render data or material tables") end if
  capacity=len(renderData.triangles);if capacity<1 then capacity=1 end if
  commands=window.createTriangleBatch(capacity);if commands is error then return commands end if;skippedSky=0
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    baseSlot=-1;if triangle.textureIndex>=0 and triangle.textureIndex<len(materialSlots) then baseSlot=materialSlots[triangle.textureIndex] end if
    commands=appendResolved(commands,triangle,baseSlot,true);if commands is error then return commands end if
  end for
  return Batch(commands,len(renderData.triangles),commands.count,skippedSky)
end function
/// Returns `window.submitWorldTriangleBatch(batch.commands,projection)` from `mq3.renderer.playable_world_batch.draw`; earlier branches return `fail("missing batch")`.
/// @param batch Record providing `batch.commands`.
/// @param projection Argument 2 supplied to `mq3.platform.playable_window.submitWorldTriangleBatch`.
function draw(batch,projection) if batch==void or batch.commands==void then return fail("missing batch") end if;return window.submitWorldTriangleBatch(batch.commands,projection) end function

/// Returns `void` from `mq3.renderer.playable_world_batch.materialFor`; earlier branches return `void`, `material`.
/// @param catalog Record providing `catalog.materials`.
/// @param textureIndex Input used by `for each material in catalog.materials if material.textureIndex==textureIndex then return material`.
function materialFor(catalog,textureIndex) if catalog==void then return void end if;for each material in catalog.materials if material.textureIndex==textureIndex then return material end if end for;return void end function
/// Detects shader stages that require dynamic handling because of lightmaps, animation, UV/color generation, or render state.
/// @param stage Record providing `stage.bspLightmap`, `stage.clampTexture`, `stage.depthWrite`, `stage.depthEqual`, `stage.slots`, `stage.uvMods`.
function dynamicStage(stage) return stage.bspLightmap or stage.clampTexture or not stage.depthWrite or stage.depthEqual or len(stage.slots)>1 or len(stage.uvMods)>0 or stage.blend!=materials.BLEND_OPAQUE or stage.alphaTest!=materials.ALPHA_TEST_NONE or stage.tcGen=="environment" or stage.tcGen=="vector" or (stage.rgbGen!="identity" and stage.rgbGen!="identitylighting") or stage.alphaGen!="identity" end function
/// Computes `material.polygonOffset or len(material.deforms)>0 or dynamicStage(stage)` for `mq3.renderer.playable_world_batch.dynamicMaterialStage`.
/// @param material Record providing `material.polygonOffset`, `material.deforms`.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_world_batch.dynamicStage`.
function dynamicMaterialStage(material,stage) return material.polygonOffset or len(material.deforms)>0 or dynamicStage(stage) end function
/// Returns `false` from `mq3.renderer.playable_world_batch.materialUsesBspLightmap`; earlier branches return `true`.
/// @param material Record providing `material.stages`.
function materialUsesBspLightmap(material) for each stage in material.stages if stage.bspLightmap then return true end if end for;return false end function
/// Tests whether an integer occurs in the supplied array.
/// @param values Integer array to search in iteration order.
/// @param wanted Integer value to find.
/// @returns True when any array element equals wanted; false otherwise.
function contains(values as array,wanted as int) returns bool for each value in values if value==wanted then return true end if end for;return false end function
/// Computes `left.sort<right.sort or (left.sort==right.sort and left.textureIndex<right.textureIndex)` for `mq3.renderer.playable_world_batch.materialBefore`.
/// @param left Record providing `left.sort`, `left.textureIndex`.
/// @param right Record providing `right.sort`, `right.textureIndex`.
function materialBefore(left,right) return left.sort<right.sort or (left.sort==right.sort and left.textureIndex<right.textureIndex) end function
/// Returns `result` from `mq3.renderer.playable_world_batch.sortedMaterials`.
/// @param values Argument 3 supplied to `copyArray`.
function sortedMaterials(values)
  result=array(len(values),void);if len(values)>0 then copyArray(result,0,values,0,len(values));sorting.sortBy(result,materialBefore) end if
  return result
end function
/// Builds `uploaded[slot]` in `mq3.renderer.playable_world_batch.uploadMaterialsFrom`; returns `count`.
/// @param catalog Record providing `catalog.materials`.
/// @param firstSlot Input tested by `slot>=firstSlot and not uploaded[slot]`.
function uploadMaterialsFrom(catalog,firstSlot)
  if catalog==void or catalog.materials==void then return fail("missing material catalog") end if
  uploaded=array(window.NATIVE_TEXTURE_SLOTS,false);count=0
  for each material in catalog.materials
    for each stage in material.stages
      if len(stage.slots)>0 then
      for index=0 to len(stage.slots)-1
        slot=stage.slots[index]
        if slot>=window.NATIVE_TEXTURE_SLOTS then return fail("material stage exceeds native texture range") end if
        if slot>=firstSlot and not uploaded[slot] then
          image=stage.images[index]
          if image==void or not window.uploadMaterialTexture(slot,image.pixels,image.width,image.height,not material.noMipMaps,not material.noPicMip) then return fail("could not upload material stage") end if
          uploaded[slot]=true;count=count+1
        end if
      end for
      end if
    end for
  end for
  return count
end function
/// Calls `mq3.renderer.playable_world_batch.uploadMaterialsFrom` with `(catalog,0)` and returns its result.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.playable_world_batch.uploadMaterialsFrom`.
function uploadMaterials(catalog) return uploadMaterialsFrom(catalog,0) end function
/// Computes `releaseMaterials` from `len(released)` using `mq3.renderer.playable_world_batch.contains`, `mq3.platform.playable_window.releaseTexture`.
/// @param catalog Record providing `catalog.materials`.
function releaseMaterials(catalog)
  if catalog==void or catalog.materials==void then return 0 end if
  released=[]
  for each material in catalog.materials
    for each stage in material.stages
      for each slot in stage.slots
        if not contains(released,slot) then window.releaseTexture(slot);released=released+[slot] end if
      end for
    end for
  end for
  return len(released)
end function
/// Returns `count` from `mq3.renderer.playable_world_batch.countStageTriangles`.
/// @param renderData Record providing `renderData.triangles`.
/// @param textureIndex Input used by `for each triangle in renderData.triangles if triangle.textureIndex==textureIndex and not isSky(triangle,flags) then count=count+1`.
/// @param flags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
function countStageTriangles(renderData,textureIndex,flags) count=0;for each triangle in renderData.triangles if triangle.textureIndex==textureIndex and not isSky(triangle,flags) then count=count+1 end if end for;return count end function
/// Builds `result[material.textureIndex]` in `mq3.renderer.playable_world_batch.materialTable`; returns `result`.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Record providing `catalog.materials`.
function materialTable(renderData,catalog)
  maximum=-1;for each material in catalog.materials if material.textureIndex>maximum then maximum=material.textureIndex end if end for;for each triangle in renderData.triangles if triangle.textureIndex>maximum then maximum=triangle.textureIndex end if end for
  if maximum<0 then return [] end if
  result=array(maximum+1,void);for each material in catalog.materials if material.textureIndex>=0 then result[material.textureIndex]=material end if end for;return result
end function
/// Builds `sizes[triangle.textureIndex]`, `result[index]`, `offsets[index]` in `mq3.renderer.playable_world_batch.groupedTriangles`; returns `result`.
/// @param renderData Record providing `renderData.triangles`.
/// @param flags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
/// @param count Argument 1 supplied to `array`.
function groupedTriangles(renderData,flags,count)
  if count==0 then return [] end if
  sizes=array(count,0)
  for each triangle in renderData.triangles if not isSky(triangle,flags) and triangle.textureIndex>=0 and triangle.textureIndex<count then sizes[triangle.textureIndex]=sizes[triangle.textureIndex]+1 end if end for
  result=array(count,void);offsets=array(count,0);for index=0 to count-1 result[index]=array(sizes[index],void) end for
  for each triangle in renderData.triangles if not isSky(triangle,flags) and triangle.textureIndex>=0 and triangle.textureIndex<count then index=triangle.textureIndex;result[index][offsets[index]]=triangle;offsets[index]=offsets[index]+1 end if end for
  return result
end function
/// Constructs `mq3.renderer.playable_world_batch.VertexIndexScratch` with `visited` = `[]`, `slots` = `[]`, `serial` = `0`.
function vertexIndexScratch() return VertexIndexScratch([],[],0) end function
/// Builds `mq3.renderer.playable_world_batch.VertexCache` after updating `scratch.visited`, `scratch.slots`, `scratch.serial`, `scratch.visited[sourceIndex]`.
/// @param sourceIndexes Sequence traversed as `triangle` while producing this result.
/// @param scratch Mutable record or buffer; this call updates `scratch.visited`, `scratch.slots`, `scratch.serial`, `scratch.visited[sourceIndex]`, `scratch.slots[sourceIndex]`.
function createVertexCacheWithScratch(sourceIndexes,scratch)
  maximum=-1;references=0
  for each triangle in sourceIndexes
    references=references+len(triangle)
    for each sourceIndex in triangle if sourceIndex>maximum then maximum=sourceIndex end if end for
  end for
  if maximum<0 then return void end if
  // A visible portal may contain a few vertices from a high BSP vertex ID.
  // Dense indexing would allocate maximum+1 entries for every shader pass.
  sparse=maximum>262144 and maximum+1>references*16
  sparseLookup=void
  if sparse then sparseLookup=maps.HashMap.new() else
    if scratch==void then scratch=vertexIndexScratch() end if
    if len(scratch.visited)<=maximum or len(scratch.slots)<=maximum or scratch.serial>=2147483647 then
      scratch.visited=array(maximum+1,0);scratch.slots=array(maximum+1,0);scratch.serial=0
    end if
    scratch.serial=scratch.serial+1
  end if
  slots=array(len(sourceIndexes),void);count=0;triangleIndex=0
  for each triangle in sourceIndexes
    triangleSlots=array(len(triangle),-1);corner=0
    for each sourceIndex in triangle
      slot=-1
      if sourceIndex>=0 then
        if sparse then
          found=sparseLookup.get(sourceIndex)
          // Store slot+1: MiniLang's dynamic void comparison also matches
          // integer zero, which would otherwise duplicate the first vertex.
          if found==void then slot=count;sparseLookup.set(sourceIndex,slot+1);count=count+1 else slot=found-1 end if
        else
          if scratch.visited[sourceIndex]!=scratch.serial then
            slot=count;scratch.visited[sourceIndex]=scratch.serial;scratch.slots[sourceIndex]=slot;count=count+1
          else slot=scratch.slots[sourceIndex] end if
        end if
      end if
      triangleSlots[corner]=slot;corner=corner+1
    end for
    slots[triangleIndex]=triangleSlots;triangleIndex=triangleIndex+1
  end for
  return VertexCache(slots,array(count,-1),array(count,void),array(count,void),array(count,void))
end function
/// Calls `mq3.renderer.playable_world_batch.createVertexCacheWithScratch` with `(sourceIndexes,vertexIndexScratch())` and returns its result.
/// @param sourceIndexes Value forwarded as `sourceIndexes` to `mq3.renderer.playable_world_batch.createVertexCacheWithScratch`.
function createVertexCache(sourceIndexes) return createVertexCacheWithScratch(sourceIndexes,vertexIndexScratch()) end function
/// Packs three float32 normals per triangle into 36-byte records for native specular updates.
/// @param sourceNormals Nested indexed data; outer entries read at `triangle`.
/// @param packed Argument 1 supplied to `mq3.platform.playable_window.writeBatchF32`.
function packSpecularNormalsInto(sourceNormals,packed)
  for triangle=0 to len(sourceNormals)-1
    for vertex=0 to 2
      normal=sourceNormals[triangle][vertex];offset=triangle*36+vertex*12
      for axis=0 to 2 window.writeBatchF32(packed,offset+axis*4,normal[axis]) end for
    end for
  end for
  return packed
end function
/// Calls `mq3.renderer.playable_world_batch.packSpecularNormalsInto` with `(sourceNormals,bytes(len(sourceNormals)*36,0))` and returns its result.
/// @param sourceNormals Value forwarded as `sourceNormals` to `mq3.renderer.playable_world_batch.packSpecularNormalsInto`.
function packedSpecularNormals(sourceNormals) return packSpecularNormalsInto(sourceNormals,bytes(len(sourceNormals)*36,0)) end function
/// Builds `mq3.renderer.playable_world_batch.StagePass` after updating `sourceUvs[outputIndex]`, `sourcePositions[outputIndex]`, `sourceIndexes[outputIndex]`, `sourceDeformUvs[outputIndex]`.
/// @param triangles Sequence traversed as `triangle` while producing this result.
/// @param material Record providing `material.deforms`, `material.stages`, `material.textureIndex`, `material.sort`, `material.polygonOffset`, `material.timeOffset`.
/// @param stage Initial value for `mq3.renderer.playable_world_batch.StagePass.stage`.
/// @param primary Initial value for `mq3.renderer.playable_world_batch.StagePass.primary`.
/// @param depthEqual Initial value for `mq3.renderer.playable_world_batch.StagePass.depthEqual`.
/// @param indexScratch Value forwarded as `scratch` to `mq3.renderer.playable_world_batch.createVertexCacheWithScratch`.
function buildStagePassTriangles(triangles,material,stage,primary,depthEqual,indexScratch)
  count=len(triangles);if count<1 then return void end if
  commands=window.createTriangleBatch(count);sourceUvs=array(count,void);sourceDeformUvs=array(count,void);sourcePositions=array(count,void);sourceIndexes=array(count,void);sourceNormals=array(count,void);sourceColors=array(count,void);sourceEntityColors=array(count,void);sourceEntityTexCoords=array(count,void);sourceShaderTimes=array(count,void);outputIndex=0
  for each triangle in triangles
      if stage.bspLightmap then
        va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2]
        commands=window.appendSingleTextureTrianglePosition(commands,resolvedLightmapSlot(triangle),va.position,va.lightmapUV,vertexLight(va),vb.position,vb.lightmapUV,vertexLight(vb),vc.position,vc.lightmapUV,vertexLight(vc),va.color[0],va.color[1],va.color[2])
        sourceUvs[outputIndex]=[va.lightmapUV,vb.lightmapUV,vc.lightmapUV]
      else
        commands=appendResolved(commands,triangle,stage.slots[0],primary)
        sourceUvs[outputIndex]=[triangle.vertices[0].baseUV,triangle.vertices[1].baseUV,triangle.vertices[2].baseUV]
      end if
      if commands is error then return commands end if
      sourcePositions[outputIndex]=[triangle.vertices[0].position,triangle.vertices[1].position,triangle.vertices[2].position]
      sourceIndexes[outputIndex]=[triangle.vertices[0].sourceIndex,triangle.vertices[1].sourceIndex,triangle.vertices[2].sourceIndex]
      // A regular pass reads the same immutable base UVs for shading and
      // deforms. Lightmap stages need their own lightmap UV triplet above.
      if stage.bspLightmap then sourceDeformUvs[outputIndex]=[triangle.vertices[0].baseUV,triangle.vertices[1].baseUV,triangle.vertices[2].baseUV]
      else sourceDeformUvs[outputIndex]=sourceUvs[outputIndex] end if
      sourceNormals[outputIndex]=[triangle.vertices[0].normal,triangle.vertices[1].normal,triangle.vertices[2].normal]
      sourceColors[outputIndex]=[triangle.vertices[0].color,triangle.vertices[1].color,triangle.vertices[2].color]
      sourceEntityColors[outputIndex]=[triangle.vertices[0].entityColor,triangle.vertices[1].entityColor,triangle.vertices[2].entityColor]
      sourceEntityTexCoords[outputIndex]=[triangle.vertices[0].entityTexCoord,triangle.vertices[1].entityTexCoord,triangle.vertices[2].entityTexCoord]
      sourceShaderTimes[outputIndex]=[triangle.vertices[0].shaderTime,triangle.vertices[1].shaderTime,triangle.vertices[2].shaderTime];outputIndex=outputIndex+1
  end for
  normalNoise=void;if (stage.tcGen=="environment" or stage.alphaGen=="lightingspecular") and hasDeform(material.deforms,"normal") then normalNoise=rendererNoise.create() end if
  vertexCache=void;if not hasDeform(material.deforms,"autosprite") and not hasDeform(material.deforms,"autosprite2") then vertexCache=createVertexCacheWithScratch(sourceIndexes,indexScratch) end if
  firstStage=void;if len(material.stages)>0 then firstStage=material.stages[0] end if
  specularNormals=void
  if stage.tcGen=="texture" and stage.rgbGen=="identity" and stage.alphaGen=="lightingspecular" and len(stage.uvMods)==0 and len(stage.slots)==1 and len(material.deforms)==0 and not stage.bspLightmap then specularNormals=packedSpecularNormals(sourceNormals) end if
  return StagePass(commands,sourceUvs,sourceDeformUvs,sourcePositions,sourceIndexes,sourceNormals,sourceColors,sourceEntityColors,sourceEntityTexCoords,sourceShaderTimes,[],materials.fogAdjustment(firstStage,stage),stage,material.textureIndex,material.deforms,normalNoise,vertexCache,0,primary,depthEqual,material.sort,material.polygonOffset,material.timeOffset,material.clampTime,false,specularNormals)
end function
/// Computes `buildStagePass` from `buildStagePassTriangles(triangles,material,stage,primary,depthEqual,vertexIndexScratch())` using `mq3.renderer.playable_world_batch.isSky`, `mq3.renderer.playable_world_batch.buildStagePassTriangles`, `mq3.renderer.playable_world_batch.vertexIndexScratch`.
/// @param renderData Record providing `renderData.triangles`.
/// @param material Record providing `material.textureIndex`.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`.
/// @param primary Value forwarded as `primary` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`.
/// @param depthEqual Value forwarded as `depthEqual` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`.
/// @param flags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
function buildStagePass(renderData,material,stage,primary,depthEqual,flags)
  triangles=[];for each triangle in renderData.triangles if triangle.textureIndex==material.textureIndex and not isSky(triangle,flags) then triangles=triangles+[triangle] end if end for
  return buildStagePassTriangles(triangles,material,stage,primary,depthEqual,vertexIndexScratch())
end function

// BSP and MD3 triangles typically arrive in material runs. Resolve the
// opaque primary once per run and keep the original submission order.
/// @param base Value forwarded as `commands` to `mq3.renderer.playable_world_batch.appendResolved`.
/// @param renderData Record providing `renderData.triangles`.
/// @param lookup Indexed input read at `texture`.
/// @param skyTextureFlags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
function fillMaterialBase(base,renderData,lookup,skyTextureFlags)
  skippedSky=0;haveMaterial=false;lastTexture=-1;emit=true;slot=-1;useLightmap=true
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    texture=triangle.textureIndex
    if not haveMaterial or texture!=lastTexture then
      haveMaterial=true;lastTexture=texture;emit=true;slot=-1;useLightmap=true
      material=void;if texture>=0 and texture<len(lookup) then material=lookup[texture] end if
      if material!=void and len(material.stages)>0 then
        stage=material.stages[0];emit=not dynamicMaterialStage(material,stage)
        if emit then slot=stage.slots[0];useLightmap=not materialUsesBspLightmap(material) end if
      end if
    end if
    if emit then written=appendResolved(base,triangle,slot,useLightmap);if written is error then return written end if end if
  end for
  return skippedSky
end function

// Static opaque primaries stay in the bit-identical base stream. Dynamic and
// supported blended stages become retained passes with their source UVs.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Record providing `catalog.materials`.
/// @param skyTextureFlags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.groupedTriangles`.
function buildMaterials(renderData,catalog,skyTextureFlags)
  if renderData==void or renderData.triangles==void or catalog==void or catalog.materials==void or skyTextureFlags==void then return fail("missing material batch inputs") end if
  lookup=materialTable(renderData,catalog);groups=groupedTriangles(renderData,skyTextureFlags,len(lookup))
  capacity=len(renderData.triangles);if capacity<1 then capacity=1 end if
  base=window.createTriangleBatch(capacity);if base is error then return base end if
  skippedSky=fillMaterialBase(base,renderData,lookup,skyTextureFlags);if skippedSky is error then return skippedSky end if
  drawable=len(renderData.triangles)-skippedSky
  passes=lists.List.withCapacity(len(catalog.materials));indexScratch=vertexIndexScratch();animated=0;modified=0;blended=0;generated=0;alphaTested=0;turbulentCount=0;stretchCount=0;environmentCount=0;filterCount=0;destinationAlphaCount=0;clampedCount=0;deformedCount=0;polygonOffsetCount=0;emitted=base.count
  for each material in sortedMaterials(catalog.materials)
    if len(material.stages)==0 or material.textureIndex<0 or material.textureIndex>=len(groups) then continue end if
    triangles=groups[material.textureIndex];if len(triangles)==0 then continue end if
    primaryWrites=material.stages[0].depthWrite
    for stageIndex=0 to len(material.stages)-1
      stage=material.stages[stageIndex];if stageIndex==0 and not dynamicMaterialStage(material,stage) then continue end if
      pass=buildStagePassTriangles(triangles,material,stage,stageIndex==0 and not materialUsesBspLightmap(material),stage.depthEqual or (stageIndex>0 and primaryWrites),indexScratch);if pass is error then return pass end if
      if pass!=void then
        passes.add(pass);emitted=emitted+pass.commands.count
        if len(stage.slots)>1 then animated=animated+1 end if;if len(stage.uvMods)>0 then modified=modified+1 end if;if stage.blend!=materials.BLEND_OPAQUE then blended=blended+1 end if
        if stage.rgbGen=="wave" then generated=generated+1 end if
        if stage.alphaTest!=materials.ALPHA_TEST_NONE then alphaTested=alphaTested+1 end if
        if stage.tcGen=="environment" then environmentCount=environmentCount+1 end if
        if stage.blend==materials.BLEND_FILTER then filterCount=filterCount+1 end if
        if stage.blend==materials.BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA then destinationAlphaCount=destinationAlphaCount+1 end if
        if stage.clampTexture then clampedCount=clampedCount+1 end if
        if len(material.deforms)>0 then deformedCount=deformedCount+1 end if
        if material.polygonOffset then polygonOffsetCount=polygonOffsetCount+1 end if
        for each mod in stage.uvMods if mod.kind=="turb" then turbulentCount=turbulentCount+1;break end if end for
        for each mod in stage.uvMods if mod.kind=="stretch" then stretchCount=stretchCount+1;break end if end for
      end if
    end for
  end for
  return MaterialBatch(base,passes.toArray(),len(renderData.triangles),drawable,emitted,skippedSky,animated,modified,blended,generated,alphaTested,turbulentCount,stretchCount,environmentCount,filterCount,destinationAlphaCount,clampedCount,deformedCount,polygonOffsetCount,void,void,void,void)
end function

// Refreshes a retained material batch when triangle/material topology is
// unchanged.  The byte buffers and nested source arrays keep their storage;
// callers fall back to buildMaterials when this returns false.
/// @param pass Mutable record or buffer; this call updates `pass.commands`, `pass.initialized`, `pass.sourceUvs[outputIndex][0]`, `pass.sourceUvs[outputIndex][1]`, `pass.sourceUvs[outputIndex][2]`.
/// @param renderData Record providing `renderData.triangles`.
function refreshStagePass(pass,renderData)
  expected=len(pass.sourcePositions);pass.commands=window.resetTriangleBatch(pass.commands);pass.initialized=false;outputIndex=0;indexTopologyChanged=false
  for each triangle in renderData.triangles
    if triangle.textureIndex!=pass.textureIndex then continue end if
    if outputIndex>=expected then return false end if
    if pass.stage.bspLightmap then
      va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2]
      pass.commands=window.appendSingleTextureTrianglePosition(pass.commands,resolvedLightmapSlot(triangle),va.position,va.lightmapUV,vertexLight(va),vb.position,vb.lightmapUV,vertexLight(vb),vc.position,vc.lightmapUV,vertexLight(vc),va.color[0],va.color[1],va.color[2])
      pass.sourceUvs[outputIndex][0]=va.lightmapUV;pass.sourceUvs[outputIndex][1]=vb.lightmapUV;pass.sourceUvs[outputIndex][2]=vc.lightmapUV
    else
      pass.commands=appendResolved(pass.commands,triangle,pass.stage.slots[0],pass.primary)
      for corner=0 to 2 pass.sourceUvs[outputIndex][corner]=triangle.vertices[corner].baseUV end for
    end if
    if pass.commands is error then return pass.commands end if
    for corner=0 to 2
      if pass.sourceIndexes[outputIndex][corner]!=triangle.vertices[corner].sourceIndex then indexTopologyChanged=true end if
      vertex=triangle.vertices[corner];pass.sourcePositions[outputIndex][corner]=vertex.position;pass.sourceIndexes[outputIndex][corner]=vertex.sourceIndex;pass.sourceDeformUvs[outputIndex][corner]=vertex.baseUV;pass.sourceNormals[outputIndex][corner]=vertex.normal;pass.sourceColors[outputIndex][corner]=vertex.color;pass.sourceEntityColors[outputIndex][corner]=vertex.entityColor;pass.sourceEntityTexCoords[outputIndex][corner]=vertex.entityTexCoord;pass.sourceShaderTimes[outputIndex][corner]=vertex.shaderTime
    end for
    outputIndex=outputIndex+1
  end for
  if outputIndex!=expected then return false end if
  // Equal triangle counts do not imply equal indexed topology (LOD/model or
  // portal clipping may change sharing). Old cache slots must never survive.
  if indexTopologyChanged and not hasDeform(pass.deforms,"autosprite") and not hasDeform(pass.deforms,"autosprite2") then pass.vertexCache=createVertexCache(pass.sourceIndexes) end if
  if pass.specularNormals!=void then packSpecularNormalsInto(pass.sourceNormals,pass.specularNormals) end if
  return true
end function
/// Updates `batch.base`, `batch.sourceTriangles`, `batch.drawableTriangles`, `batch.emittedTriangles`, `batch.skippedSky` in `mq3.renderer.playable_world_batch.refreshMaterials`; returns `batch`.
/// @param batch Mutable record or buffer; this call updates `batch.base`, `batch.sourceTriangles`, `batch.drawableTriangles`, `batch.emittedTriangles`, `batch.skippedSky`.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Record providing `catalog.materials`.
/// @param skyTextureFlags Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`.
function refreshMaterials(batch,renderData,catalog,skyTextureFlags)
  if batch==void or batch.base==void or batch.passes==void or renderData==void or renderData.triangles==void or catalog==void or catalog.materials==void or skyTextureFlags==void then return fail("missing retained material batch inputs") end if
  if len(renderData.triangles)>batch.base.capacity then return false end if
  lookup=materialTable(renderData,catalog);counts=array(len(lookup),0)
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(counts) and not isSky(triangle,skyTextureFlags) then counts[triangle.textureIndex]=counts[triangle.textureIndex]+1 end if end for
  expectedPasses=0
  for each material in catalog.materials
    if material.textureIndex>=0 and material.textureIndex<len(counts) and counts[material.textureIndex]>0 and len(material.stages)>0 then
      for stageIndex=0 to len(material.stages)-1
        if stageIndex>0 or dynamicMaterialStage(material,material.stages[stageIndex]) then expectedPasses=expectedPasses+1 end if
      end for
    end if
  end for
  if expectedPasses!=len(batch.passes) then return false end if
  oldBaseCount=batch.base.count;batch.base=window.resetTriangleBatch(batch.base)
  skippedSky=fillMaterialBase(batch.base,renderData,lookup,skyTextureFlags);if skippedSky is error then return skippedSky end if
  drawable=len(renderData.triangles)-skippedSky
  if batch.base.count!=oldBaseCount then return false end if
  emitted=batch.base.count
  for each pass in batch.passes
    if pass.textureIndex<0 or pass.textureIndex>=len(counts) or counts[pass.textureIndex]!=len(pass.sourcePositions) then return false end if
    // A same-name R_RemapShader can leave the retained stage topology intact
    // while changing only the shader object's timeOffset.  Keep that mutable
    // RB_BeginSurface clock on the cached pass instead of requiring a rebuild.
    material=lookup[pass.textureIndex];if material==void then return false end if;pass.timeOffset=material.timeOffset;pass.clampTime=material.clampTime
    refreshed=refreshStagePass(pass,renderData);if refreshed is error then return refreshed end if;if not refreshed then return false end if;emitted=emitted+pass.commands.count
  end for
  batch.sourceTriangles=len(renderData.triangles);batch.drawableTriangles=drawable;batch.emittedTriangles=emitted;batch.skippedSky=skippedSky;return batch
end function
/// Updates `batch.fogBatch`, `batch.fogCatalog` in `mq3.renderer.playable_world_batch.attachFog`; returns `fogBatch.commands.count`.
/// @param batch Mutable record or buffer; this call updates `batch.fogBatch`, `batch.fogCatalog`.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Value assigned to `batch.fogCatalog`.
function attachFog(batch,renderData,catalog)
  if batch==void or renderData==void or catalog==void then return fail("fog attachment requires batch, render data and catalog") end if
  fogBatch=playableFog.build(renderData,catalog);if fogBatch is error then return fogBatch end if;batch.fogBatch=fogBatch;batch.fogCatalog=catalog
  for each pass in batch.passes
    pass.fogIndexes=array(pass.commands.count,0);pass.initialized=false;fogSlot=0
    for each triangle in renderData.triangles if triangle.textureIndex==pass.textureIndex and fogSlot<pass.commands.count then pass.fogIndexes[fogSlot]=triangle.fogIndex;fogSlot=fogSlot+1 end if end for
  end for
  return fogBatch.commands.count
end function
/// Updates `batch.dlightBatch`, `batch.dlightCatalog` in `mq3.renderer.playable_world_batch.attachDynamicLights`; returns `len(lightBatch.triangles)`.
/// @param batch Mutable record or buffer; this call updates `batch.dlightBatch`, `batch.dlightCatalog`.
/// @param renderData Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.build`.
/// @param receiveFlags Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.build`.
/// @param catalog Value assigned to `batch.dlightCatalog`.
function attachDynamicLights(batch,renderData,receiveFlags,catalog)
  if batch==void or renderData==void or catalog==void then return fail("dynamic-light attachment requires batch, render data and catalog") end if
  lightBatch=dynamicLights.build(renderData,receiveFlags);if lightBatch is error then return lightBatch end if;batch.dlightBatch=lightBatch;batch.dlightCatalog=catalog;return len(lightBatch.triangles)
end function
/// Updates `batch.dlightBatch`, `batch.dlightCatalog` in `mq3.renderer.playable_world_batch.attachDynamicLightsOriented`; returns `len(lightBatch.triangles)`.
/// @param batch Mutable record or buffer; this call updates `batch.dlightBatch`, `batch.dlightCatalog`.
/// @param renderData Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`.
/// @param receiveFlags Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`.
/// @param catalog Value assigned to `batch.dlightCatalog`.
/// @param origins Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`.
/// @param axes Argument 4 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`.
/// @param bounds Argument 5 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`.
function attachDynamicLightsOriented(batch,renderData,receiveFlags,catalog,origins,axes,bounds)
  if batch==void or renderData==void or catalog==void then return fail("oriented dynamic-light attachment requires batch, render data and catalog") end if
  lightBatch=dynamicLights.buildOriented(renderData,receiveFlags,origins,axes,bounds);if lightBatch is error then return lightBatch end if;batch.dlightBatch=lightBatch;batch.dlightCatalog=catalog;return len(lightBatch.triangles)
end function

/// Constructs `mq3.renderer.playable_world_batch.UvAffine` with `m00` = `1.0`, `m01` = `0.0`, `m10` = `0.0`, `m11` = `1.0` and the supplied remaining values.
/// @returns The value `UvAffine(1.0,0.0,0.0,1.0,0.0,0.0)`.
function identityAffine() returns UvAffine return UvAffine(1.0,0.0,0.0,1.0,0.0,0.0) end function
/// Builds `result.tx`, `result.ty` in `mq3.renderer.playable_world_batch.affineFor`; returns `result`.
/// @param stage Record providing `stage.uvMods`.
/// @param nowMilliseconds Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`.
function affineFor(stage,nowMilliseconds)
  result=identityAffine();seconds=nowMilliseconds*0.001
  for each mod in stage.uvMods
    if mod.kind=="scroll" then
      s=mod.a*seconds;s=s-materials.floorNumber(s);t=mod.b*seconds;t=t-materials.floorNumber(t);result.tx=result.tx+s;result.ty=result.ty+t
    else if mod.kind=="scale" then result=UvAffine(result.m00*mod.a,result.m01*mod.a,result.m10*mod.b,result.m11*mod.b,result.tx*mod.a,result.ty*mod.b)
    else if mod.kind=="rotate" then
      radians=0.0-mod.a*seconds*3.14159265358979323846/180.0;sine=trans.sin(radians);cosine=trans.cos(radians)
      m00=cosine*result.m00-sine*result.m10;m01=cosine*result.m01-sine*result.m11;m10=sine*result.m00+cosine*result.m10;m11=sine*result.m01+cosine*result.m11
      tx=cosine*(result.tx-0.5)-sine*(result.ty-0.5)+0.5;ty=sine*(result.tx-0.5)+cosine*(result.ty-0.5)+0.5;result=UvAffine(m00,m01,m10,m11,tx,ty)
    else if mod.kind=="stretch" then p=1.0/materials.waveSample(mod.wave,nowMilliseconds);offset=0.5-0.5*p;result=UvAffine(result.m00*p,result.m01*p,result.m10*p,result.m11*p,result.tx*p+offset,result.ty*p+offset)
    else if mod.kind=="transform" then result=UvAffine(mod.a*result.m00+mod.c*result.m10,mod.a*result.m01+mod.c*result.m11,mod.b*result.m00+mod.d*result.m10,mod.b*result.m01+mod.d*result.m11,mod.a*result.tx+mod.c*result.ty+mod.e,mod.b*result.tx+mod.d*result.ty+mod.f)
    end if
  end for
  return result
end function
/// Applies a 2-by-2 UV transform and translation to one texture-coordinate pair.
/// @param transform Affine UV matrix and translation.
/// @param uv Input U/V coordinate pair.
/// @returns The transformed [u, v] coordinate pair.
function applyAffine(transform as UvAffine,uv as array) returns array return [uv[0]*transform.m00+uv[1]*transform.m01+transform.tx,uv[0]*transform.m10+uv[1]*transform.m11+transform.ty] end function
/// Returns `false` from `mq3.renderer.playable_world_batch.hasTurbulence`; earlier branches return `true`.
/// @param stage Record providing `stage.uvMods`.
function hasTurbulence(stage) for each mod in stage.uvMods if mod.kind=="turb" then return true end if end for;return false end function
/// Returns `false` from `mq3.renderer.playable_world_batch.hasEntityTranslate`; earlier branches return `true`.
/// @param stage Record providing `stage.uvMods`.
function hasEntityTranslate(stage) for each mod in stage.uvMods if mod.kind=="entitytranslate" then return true end if end for;return false end function
/// Tests whether any deformation in the sequence has the requested kind.
/// @param deforms Deformation records to inspect.
/// @param kind Exact deformation kind to match.
/// @returns True when a matching deformation exists; false otherwise.
function hasDeform(deforms as array,kind as string) returns bool for each deform in deforms if deform.kind==kind then return true end if end for;return false end function
/// Returns `false` from `mq3.renderer.playable_world_batch.containsPosition`; earlier branches return `true`.
/// @param values Sequence traversed as `value` while producing this result.
/// @param wanted Input used by `for each value in values if value==wanted then return true`.
function containsPosition(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
/// Returns `false` from `mq3.renderer.playable_world_batch.passHasFog`; earlier branches return `false`, `true`.
/// @param pass Record providing `pass.fogAdjustment`, `pass.fogIndexes`.
function passHasFog(pass)
  if pass.fogAdjustment=="none" then return false end if
  for each fogIndex in pass.fogIndexes if fogIndex>0 then return true end if end for
  return false
end function
// A retained pass exists for render-state reasons as well as for changing
// vertex data.  Blend, alpha-test, clamp, depth and polygon-offset state do
// not require MiniLang to rewrite every vertex every frame.  Keep those
// command bytes until topology/source data changes; animated, view-dependent
// and fog-modulated passes continue through the exact Quake update path.
/// @param pass Record providing `pass.stage`, `pass.deforms`.
/// @param fogCatalog Input used in the result expression `fogCatalog!=void and passHasFog(pass)`.
function passChanges(pass,fogCatalog)
  stage=pass.stage
  if len(stage.slots)>1 or len(pass.deforms)>0 then return true end if
  if stage.tcGen=="environment" then return true end if
  for each mod in stage.uvMods
    if mod.kind!="scale" and mod.kind!="transform" then return true end if
  end for
  if stage.rgbGen=="wave" then return true end if
  if stage.alphaGen=="wave" or stage.alphaGen=="portal" or stage.alphaGen=="lightingspecular" then return true end if
  return fogCatalog!=void and passHasFog(pass)
end function

// AutospriteDeform rebuilds each independent pair of triangles as one square
// whose left/up axes follow the view. BSP extraction expands indexes, so the
// four original corners are recovered from each consecutive triangle pair.
/// @param pass Record providing `pass.commands`, `pass.sourcePositions`.
/// @param triangleIndex Input used by `first=triangleIndex-triangleIndex%2`.
/// @param leftDir Three-component vector read at indices 0, 1, and 2.
/// @param upDir Three-component vector read at indices 0, 1, and 2.
function autospriteQuad(pass,triangleIndex,leftDir,upDir)
  first=triangleIndex-triangleIndex%2;if first+1>=pass.commands.count then return void end if
  unique=[]
  for each positions in [pass.sourcePositions[first],pass.sourcePositions[first+1]]
    for each position in positions if not containsPosition(unique,position) then unique=unique+[position] end if end for
  end for
  if len(unique)!=4 then return void end if
  mid=[0.0,0.0,0.0];for each position in unique for axis=0 to 2 mid[axis]=mid[axis]+position[axis]*0.25 end for end for
  dx=unique[0][0]-mid[0];dy=unique[0][1]-mid[1];dz=unique[0][2]-mid[2];radius=numeric.fsqrt(dx*dx+dy*dy+dz*dz)*0.707
  left=[leftDir[0]*radius,leftDir[1]*radius,leftDir[2]*radius];up=[upDir[0]*radius,upDir[1]*radius,upDir[2]*radius]
  return [[mid[0]+left[0]+up[0],mid[1]+left[1]+up[1],mid[2]+left[2]+up[2]],[mid[0]-left[0]+up[0],mid[1]-left[1]+up[1],mid[2]-left[2]+up[2]],[mid[0]-left[0]-up[0],mid[1]-left[1]-up[1],mid[2]-left[2]-up[2]],[mid[0]+left[0]-up[0],mid[1]+left[1]-up[1],mid[2]+left[2]-up[2]]]
end function
/// Maps a triangle-local vertex onto one of four autosprite quad corners using triangle parity.
/// @param triangleIndex Triangle index; parity selects the first or second quad triangle.
/// @param vertex Triangle-local vertex selector, normally 0, 1, or 2.
/// @returns Quad corner from [0,1,3] for even triangles or [3,1,2] for odd triangles.
function autospriteCorner(triangleIndex as int,vertex as int) returns int
  if triangleIndex%2==0 then if vertex==0 then return 0 else if vertex==1 then return 1 else return 3 end if end if
  if vertex==0 then return 3 else if vertex==1 then return 1 else return 2 end if
end function
/// Returns `[[0.0,1.0],[1.0,0.0],[1.0,1.0]][vertex]` from `mq3.renderer.playable_world_batch.autospriteUV`; earlier branches return `[[0.0,0.0],[1.0,0.0],[0.0,1.0]][vertex]`.
/// @param triangleIndex Input tested by `triangleIndex%2==0`.
/// @param vertex Input tested by `triangleIndex%2==0`.
function autospriteUV(triangleIndex,vertex) if triangleIndex%2==0 then return [[0.0,0.0],[1.0,0.0],[0.0,1.0]][vertex] end if;return [[0.0,1.0],[1.0,0.0],[1.0,1.0]][vertex] end function
/// Returns `[2,3]` from `mq3.renderer.playable_world_batch.edgeVertices`; earlier branches return `[0,1]`, `[0,2]`, `[0,3]`, and 2 further fields.
/// @param index Tetrahedron-edge selector: 0..4 select the first five pairs; other values select [2,3].
function edgeVertices(index)
  if index==0 then return [0,1] else if index==1 then return [0,2] else if index==2 then return [0,3] else if index==3 then return [1,2] else if index==4 then return [1,3] else return [2,3] end if
end function

// Autosprite2Deform keeps the long axis fixed and rotates only the two short
// edges toward the view. Source indexes preserve Quake's directed-edge test.
/// @param pass Record providing `pass.commands`, `pass.sourceIndexes`, `pass.sourcePositions`.
/// @param triangleIndex Input used by `first=triangleIndex-triangleIndex%2`.
/// @param forward Three-component vector read at indices 0, 1, and 2.
function autosprite2Quad(pass,triangleIndex,forward)
  first=triangleIndex-triangleIndex%2;if first+1>=pass.commands.count then return void end if
  sequence=pass.sourceIndexes[first]+pass.sourceIndexes[first+1];base=sequence[0]
  for each index in sequence if index<base then base=index end if end for
  positions=[void,void,void,void]
  for localTriangle=0 to 1
    for vertex=0 to 2
      local=pass.sourceIndexes[first+localTriangle][vertex]-base
      if local<0 or local>3 then return void end if;positions[local]=pass.sourcePositions[first+localTriangle][vertex]
    end for
  end for
  for each position in positions if position==void then return void end if end for
  lengths=[999999.0,999999.0];nums=[0,0]
  for edgeIndex=0 to 5
    edge=edgeVertices(edgeIndex);a=positions[edge[0]];b=positions[edge[1]];dx=a[0]-b[0];dy=a[1]-b[1];dz=a[2]-b[2];length=dx*dx+dy*dy+dz*dz
    if length<lengths[0] then lengths[1]=lengths[0];nums[1]=nums[0];lengths[0]=length;nums[0]=edgeIndex else if length<lengths[1] then lengths[1]=length;nums[1]=edgeIndex end if
  end for
  mids=[]
  for selected=0 to 1 edge=edgeVertices(nums[selected]);a=positions[edge[0]];b=positions[edge[1]];mids=mids+[[0.5*(a[0]+b[0]),0.5*(a[1]+b[1]),0.5*(a[2]+b[2])]] end for
  major=[mids[1][0]-mids[0][0],mids[1][1]-mids[0][1],mids[1][2]-mids[0][2]]
  minor=[major[1]*forward[2]-major[2]*forward[1],major[2]*forward[0]-major[0]*forward[2],major[0]*forward[1]-major[1]*forward[0]]
  minorLength=numeric.fsqrt(minor[0]*minor[0]+minor[1]*minor[1]+minor[2]*minor[2]);if minorLength<=0.0 then return void end if;minor=[minor[0]/minorLength,minor[1]/minorLength,minor[2]/minorLength]
  result=[positions[0],positions[1],positions[2],positions[3]]
  for selected=0 to 1
    edge=edgeVertices(nums[selected]);half=0.5*numeric.fsqrt(lengths[selected]);directed=false
    for cursor=0 to 4 if sequence[cursor]==base+edge[0] and sequence[cursor+1]==base+edge[1] then directed=true;break end if end for
    sign=1.0;if directed then sign=0.0-1.0 end if
    result[edge[0]]=[mids[selected][0]+sign*half*minor[0],mids[selected][1]+sign*half*minor[1],mids[selected][2]+sign*half*minor[2]]
    result[edge[1]]=[mids[selected][0]-sign*half*minor[0],mids[selected][1]-sign*half*minor[1],mids[selected][2]-sign*half*minor[2]]
  end for
  return [base,result]
end function
/// Computes `deformedPosition` from `[position[0],position[1],position[2]]` using `mq3.renderer.playable_materials.waveSampleOffset`, `mq3.renderer.playable_materials.waveSample`, `mq3.renderer.shader_parser.Wave`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param normal Three-component vector read at indices 0, 1, and 2.
/// @param uv Indexed input read at `0`.
/// @param deforms Sequence traversed as `deform` while producing this result.
/// @param nowMilliseconds Argument 2 supplied to `mq3.renderer.playable_materials.waveSampleOffset`.
function deformedPosition(position,normal,uv,deforms,nowMilliseconds)
  result=[position[0],position[1],position[2]]
  for each deform in deforms
    if deform.kind=="wave" then
      phaseOffset=0.0;if deform.wave.frequency!=0.0 then phaseOffset=(result[0]+result[1]+result[2])*deform.spread end if;scale=materials.waveSampleOffset(deform.wave,nowMilliseconds,phaseOffset)
      result=[result[0]+normal[0]*scale,result[1]+normal[1]*scale,result[2]+normal[2]*scale]
    else if deform.kind=="move" then
      scale=materials.waveSample(deform.wave,nowMilliseconds);result=[result[0]+deform.vector[0]*scale,result[1]+deform.vector[1]*scale,result[2]+deform.vector[2]*scale]
    else if deform.kind=="bulge" then
      phase=(uv[0]*deform.bulgeWidth+nowMilliseconds*0.001*deform.bulgeSpeed)/(2.0*3.14159265358979323846)
      scale=materials.waveSampleOffset(shaderParser.Wave(1,0.0,deform.bulgeHeight,0.0,0.0),0,phase)
      result=[result[0]+normal[0]*scale,result[1]+normal[1]*scale,result[2]+normal[2]*scale]
    end if
  end for
  return result
end function
/// Builds `result[0]`, `result[1]`, `result[2]` in `mq3.renderer.playable_world_batch.deformedNormal`; returns `result`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param normal Three-component vector read at indices 0, 1, and 2.
/// @param deforms Sequence traversed as `deform` while producing this result.
/// @param nowMilliseconds Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param noise Argument 1 supplied to `mq3.renderer.noise.get4f`.
function deformedNormal(position,normal,deforms,nowMilliseconds,noise)
  result=[normal[0],normal[1],normal[2]]
  if noise==void then return result end if
  for each deform in deforms
    if deform.kind=="normal" then
      x=numeric.fmul(position[0],0.98);y=numeric.fmul(position[1],0.98);z=numeric.fmul(position[2],0.98);time=numeric.fmul(numeric.fmul(numeric.f32(nowMilliseconds),0.001),deform.wave.frequency);amplitude=deform.wave.amplitude
      result[0]=numeric.fadd(result[0],numeric.fmul(amplitude,rendererNoise.get4f(noise,x,y,z,time)))
      result[1]=numeric.fadd(result[1],numeric.fmul(amplitude,rendererNoise.get4f(noise,numeric.fadd(100.0,x),y,z,time)))
      result[2]=numeric.fadd(result[2],numeric.fmul(amplitude,rendererNoise.get4f(noise,numeric.fadd(200.0,x),y,z,time)))
      inverse=qmath.Q_rsqrt(qmath.DotProduct(result,result));result=[numeric.fmul(result[0],inverse),numeric.fmul(result[1],inverse),numeric.fmul(result[2],inverse)]
    end if
  end for
  return result
end function
// RB_CalcSpecularAlpha keeps this hard-coded light origin in the original
// renderer and raises the reflected view coefficient to the fourth power.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param normal Argument 1 supplied to `mq3.shared.math.DotProduct`.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
function specularAlpha(position,normal,viewOrigin)
  light=[numeric.fsub(-960.0,position[0]),numeric.fsub(1980.0,position[1]),numeric.fsub(96.0,position[2])];lightScale=qmath.Q_rsqrt(qmath.DotProduct(light,light));light=[numeric.fmul(light[0],lightScale),numeric.fmul(light[1],lightScale),numeric.fmul(light[2],lightScale)]
  dot=qmath.DotProduct(normal,light);reflected=[numeric.fsub(numeric.fmul(numeric.fmul(normal[0],2.0),dot),light[0]),numeric.fsub(numeric.fmul(numeric.fmul(normal[1],2.0),dot),light[1]),numeric.fsub(numeric.fmul(numeric.fmul(normal[2],2.0),dot),light[2])]
  viewer=[numeric.fsub(viewOrigin[0],position[0]),numeric.fsub(viewOrigin[1],position[1]),numeric.fsub(viewOrigin[2],position[2])];viewScale=qmath.Q_rsqrt(qmath.DotProduct(viewer,viewer));value=numeric.fmul(qmath.DotProduct(reflected,viewer),viewScale)
  if value<0.0 then return 0 end if;value=numeric.fmul(value,value);value=numeric.fmul(value,value);result=numeric.trunc32(numeric.fmul(value,255.0));if result>255 then result=255 end if;return result
end function
/// Updates `pass.initialized`, `pass.cacheSerial` in `mq3.renderer.playable_world_batch.updatePassAxesFog`; returns `slot`.
/// @param pass Mutable record or buffer; this call updates `pass.initialized`, `pass.cacheSerial`.
/// @param viewOrigin Argument 3 supplied to `mq3.platform.playable_window.updateSpecularPass`.
/// @param leftDir Value forwarded as `leftDir` to `mq3.renderer.playable_world_batch.autospriteQuad`.
/// @param upDir Value forwarded as `upDir` to `mq3.renderer.playable_world_batch.autospriteQuad`.
/// @param nowMilliseconds Argument 2 supplied to `mq3.renderer.playable_materials.slotAt`.
/// @param fogCatalog Record providing `fogCatalog.fogs`.
function updatePassAxesFog(pass,viewOrigin,leftDir,upDir,nowMilliseconds,fogCatalog)
  slot=materials.slotAt(pass.stage,nowMilliseconds);if pass.initialized and not passChanges(pass,fogCatalog) then return slot end if
  if pass.specularNormals!=void and (fogCatalog==void or not passHasFog(pass)) then
    updated=window.updateSpecularPass(pass.commands,pass.specularNormals,viewOrigin);if updated is error then return updated end if
    pass.initialized=true;return slot
  end if
  transform=affineFor(pass.stage,nowMilliseconds);turbulent=hasTurbulence(pass.stage);entityTranslate=hasEntityTranslate(pass.stage);autosprite=hasDeform(pass.deforms,"autosprite");autosprite2=hasDeform(pass.deforms,"autosprite2");quad=void;quad2=void
  cacheEpoch=0;if pass.vertexCache!=void then pass.cacheSerial=pass.cacheSerial+1;cacheEpoch=pass.cacheSerial end if
  forward=[leftDir[1]*upDir[2]-leftDir[2]*upDir[1],leftDir[2]*upDir[0]-leftDir[0]*upDir[2],leftDir[0]*upDir[1]-leftDir[1]*upDir[0]];spriteNormal=[0.0-forward[0],0.0-forward[1],0.0-forward[2]]
  stage=pass.stage
  hasDeforms=len(pass.deforms)>0
  hasUvMods=len(stage.uvMods)>0
  environment=stage.tcGen=="environment"
  vectorCoords=stage.tcGen=="vector"
  specular=stage.alphaGen=="lightingspecular"
  deformNormals=pass.normalNoise!=void and (environment or specular)
  constantColor=(stage.rgbGen=="identity" or stage.rgbGen=="identitylighting" or stage.rgbGen=="const") and (stage.alphaGen=="identity" or stage.alphaGen=="skip" or stage.alphaGen=="const")
  uniformColor=void
  cache=pass.vertexCache
  previousTime=void
  triangleNow=0.0
  for triangleIndex=0 to pass.commands.count-1
    times=pass.sourceShaderTimes[triangleIndex]
    triangleShaderTime=times[0]
    if triangleIndex==0 or triangleShaderTime!=previousTime then
      triangleNow=materials.shaderMilliseconds(nowMilliseconds,triangleShaderTime,pass.timeOffset,pass.clampTime)
      slot=materials.slotAt(stage,triangleNow)
      previousTime=triangleShaderTime
    end if
    offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES;if not stage.bspLightmap then window.writeBatchI32(pass.commands.data,offset,slot) end if
    if triangleIndex%2==0 then if autosprite then quad=autospriteQuad(pass,triangleIndex,leftDir,upDir) else if autosprite2 then quad2=autosprite2Quad(pass,triangleIndex,forward) end if end if
    for vertex=0 to 2
      stageColor=void
      position=void
      uv=void
      cacheSlot=-1
      if cache!=void then cacheSlot=cache.slots[triangleIndex][vertex] end if
      if cacheSlot>=0 and cache.frames[cacheSlot]==cacheEpoch then
        position=cache.positions[cacheSlot]
        uv=cache.uvs[cacheSlot]
        stageColor=cache.colors[cacheSlot]
      else
        position=pass.sourcePositions[triangleIndex][vertex]
        sourceUv=pass.sourceUvs[triangleIndex][vertex]
        sourceNormal=pass.sourceNormals[triangleIndex][vertex]
        colorTriangle=triangleIndex
        colorVertex=vertex
        shaderTime=times[vertex]
        if autosprite and quad!=void then
          position=quad[autospriteCorner(triangleIndex,vertex)]
          sourceUv=autospriteUV(triangleIndex,vertex)
          sourceNormal=spriteNormal
          colorTriangle=triangleIndex-triangleIndex%2
          colorVertex=0
          shaderTime=pass.sourceShaderTimes[colorTriangle][0]
        end if
        if autosprite2 and quad2!=void then position=quad2[1][pass.sourceIndexes[triangleIndex][vertex]-quad2[0]] end if
        entityNow=triangleNow
        if shaderTime!=triangleShaderTime then entityNow=materials.shaderMilliseconds(nowMilliseconds,shaderTime,pass.timeOffset,pass.clampTime) end if
        if hasDeforms then position=deformedPosition(position,sourceNormal,pass.sourceDeformUvs[triangleIndex][vertex],pass.deforms,entityNow) end if
        if deformNormals then sourceNormal=deformedNormal(position,sourceNormal,pass.deforms,entityNow,pass.normalNoise) end if
        if environment then sourceUv=materials.environmentUV(position,sourceNormal,viewOrigin) else if vectorCoords then sourceUv=materials.vectorUV(stage,position) end if
        uv=sourceUv
        if hasUvMods then
          if turbulent or entityTranslate or shaderTime!=0.0 or pass.timeOffset!=0.0 or pass.clampTime!=0.0 then
            uv=materials.transformUVEntityAt(stage,sourceUv,position,pass.sourceEntityTexCoords[colorTriangle][colorVertex],0.0,entityNow)
          else
            uv=applyAffine(transform,sourceUv)
          end if
        end if
        stageColor=uniformColor
        if stageColor==void then
          stageColor=materials.stageColorAtEntity(stage,pass.sourceColors[colorTriangle][colorVertex],pass.sourceEntityColors[colorTriangle][colorVertex],position,viewOrigin,entityNow)
          if specular then stageColor[3]=specularAlpha(position,sourceNormal,viewOrigin) end if
          if constantColor then uniformColor=stageColor end if
        end if
        if cacheSlot>=0 then
          cache.frames[cacheSlot]=cacheEpoch
          cache.positions[cacheSlot]=position
          cache.uvs[cacheSlot]=uv
          cache.colors[cacheSlot]=stageColor
        end if
      end if
      if pass.fogAdjustment!="none" and fogCatalog!=void and triangleIndex<len(pass.fogIndexes) then
        fogIndex=pass.fogIndexes[triangleIndex]
        if fogIndex>0 and fogIndex<len(fogCatalog.fogs) then stageColor=materials.modulateForFog(stageColor,playableFog.density(fogCatalog.fogs[fogIndex],position,viewOrigin,forward),pass.fogAdjustment) end if
      end if
      updated=window.updateStageVertex(pass.commands,triangleIndex,vertex,position,uv,stageColor);if updated is error then return updated end if
    end for
  end for
  pass.initialized=true
  return slot
end function
/// Calls `mq3.renderer.playable_world_batch.updatePassAxesFog` with `(pass,viewOrigin,leftDir,upDir,nowMilliseconds,void)` and returns its result.
/// @param pass Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
/// @param leftDir Value forwarded as `leftDir` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
/// @param upDir Value forwarded as `upDir` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
function updatePassAxes(pass,viewOrigin,leftDir,upDir,nowMilliseconds) return updatePassAxesFog(pass,viewOrigin,leftDir,upDir,nowMilliseconds,void) end function
/// Calls `mq3.renderer.playable_world_batch.updatePassAxes` with `(pass,viewOrigin,[0.0,1.0,0.0],[0.0,0.0,1.0],nowMilliseconds)` and returns its result.
/// @param pass Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassAxes`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.playable_world_batch.updatePassAxes`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxes`.
function updatePassView(pass,viewOrigin,nowMilliseconds) return updatePassAxes(pass,viewOrigin,[0.0,1.0,0.0],[0.0,0.0,1.0],nowMilliseconds) end function
/// Calls `mq3.renderer.playable_world_batch.updatePassView` with `(pass,[0.0,0.0,0.0],nowMilliseconds)` and returns its result.
/// @param pass Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassView`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassView`.
function updatePass(pass,nowMilliseconds) return updatePassView(pass,[0.0,0.0,0.0],nowMilliseconds) end function
/// Draws opaque base geometry and ordered shader passes, inserting dynamic lighting and applying view-dependent fog.
/// @param batch Record providing `batch.base`, `batch.passes`, `batch.dlightBatch`, `batch.dlightCatalog`, `batch.fogCatalog`, `batch.fogBatch`.
/// @param projection Record providing `projection.position`, `projection.right`, `projection.up`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxesFog`.
/// @param lights Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.draw`.
/// @param area Argument 3 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`.
function drawMaterialsLitTarget(batch,projection,nowMilliseconds,lights,area)
  if batch==void or batch.base==void or batch.passes==void or nowMilliseconds<0 then return fail("invalid material draw") end if
  drawn=0;value=0;multitexture.setState(multitexture.BLEND_OPAQUE,false,true);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(false);multitexture.setPolygonOffset(false)
  if batch.base.count>0 then if area==void then value=window.submitWorldTriangleBatch(batch.base,projection) else value=window.submitWorldTriangleBatchViewport(batch.base,projection,area) end if;if value is error then return value end if;drawn=drawn+value end if
  lightsDrawn=false
  for each pass in batch.passes
    if not lightsDrawn and pass.sort>3.0 then if batch.dlightBatch!=void and lights!=void and len(lights)>0 then if area==void then value=dynamicLights.draw(batch.dlightBatch,batch.dlightCatalog,lights,projection) else value=dynamicLights.drawViewport(batch.dlightBatch,batch.dlightCatalog,lights,projection,area) end if;if value is error then return value end if;drawn=drawn+value end if;lightsDrawn=true end if
    updatePassAxesFog(pass,projection.position,[0.0-projection.right[0],0.0-projection.right[1],0.0-projection.right[2]],projection.up,nowMilliseconds,batch.fogCatalog);multitexture.setState(pass.stage.blend,pass.depthEqual,pass.stage.depthWrite);multitexture.setAlphaTest(pass.stage.alphaTest);multitexture.setTextureClamp(pass.stage.clampTexture);multitexture.setPolygonOffset(pass.polygonOffset)
    if area==void then value=window.submitWorldTriangleBatch(pass.commands,projection) else value=window.submitWorldTriangleBatchViewport(pass.commands,projection,area) end if;if value is error then return value end if;drawn=drawn+value
  end for
  if not lightsDrawn and batch.dlightBatch!=void and lights!=void and len(lights)>0 then if area==void then value=dynamicLights.draw(batch.dlightBatch,batch.dlightCatalog,lights,projection) else value=dynamicLights.drawViewport(batch.dlightBatch,batch.dlightCatalog,lights,projection,area) end if;if value is error then return value end if;drawn=drawn+value end if
  if batch.fogBatch!=void then if area==void then value=playableFog.draw(batch.fogBatch,batch.fogCatalog,projection) else value=playableFog.drawViewport(batch.fogBatch,batch.fogCatalog,projection,area) end if;if value is error then return value end if;drawn=drawn+value end if
  multitexture.setState(multitexture.BLEND_OPAQUE,false,true);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(false);multitexture.setPolygonOffset(false);return drawn
end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,lights,void)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
function drawMaterialsLit(batch,projection,nowMilliseconds,lights) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,lights,void) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,[],void)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
function drawMaterials(batch,projection,nowMilliseconds) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,[],void) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,lights,area)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param area Value forwarded as `area` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
function drawMaterialsLitViewport(batch,projection,nowMilliseconds,lights,area) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,lights,area) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,[],area)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
/// @param area Value forwarded as `area` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`.
function drawMaterialsViewport(batch,projection,nowMilliseconds,area) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,[],area) end function
