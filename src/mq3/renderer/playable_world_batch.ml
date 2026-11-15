// SPDX-License-Identifier: GPL-2.0-or-later
// Retained world-space commands for native projection and rasterization.
package mq3.renderer.playable_world_batch
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

struct Batch commands sourceTriangles drawableTriangles skippedSky end struct
struct UvAffine m00 m01 m10 m11 tx ty end struct
struct VertexCache slots frames positions normals uvs colors end struct
struct StagePass commands sourceUvs sourceDeformUvs sourcePositions sourceIndexes sourceNormals sourceLights sourceColors sourceEntityColors sourceEntityTexCoords sourceShaderTimes fogIndexes fogAdjustment stage textureIndex deforms normalNoise vertexCache cacheSerial primary depthEqual sort polygonOffset timeOffset clampTime initialized end struct
struct MaterialBatch base passes sourceTriangles drawableTriangles emittedTriangles skippedSky animatedPasses uvModifiedPasses blendedPasses generatorPasses alphaTestPasses turbulentPasses stretchPasses environmentPasses filterPasses destinationAlphaPasses clampedPasses deformedPasses polygonOffsetPasses fogBatch fogCatalog dlightBatch dlightCatalog end struct

function fail(text) return error(7490,"playable world batch: "+text) end function
function vertexLight(vertex) return (vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0) end function
function isSky(triangle,flags) return triangle.textureIndex>=0 and triangle.textureIndex<len(flags) and flags[triangle.textureIndex] end function
function resolvedLightmapSlot(triangle) slot=triangle.lightmapIndex;if slot<0 or slot>=64 then return -1 end if;return slot end function
function appendResolved(commands,triangle,baseSlot,useLightmap)
  va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2];lightmapSlot=-1;if useLightmap then lightmapSlot=resolvedLightmapSlot(triangle) end if
  colorA=va.color;colorB=vb.color;colorC=vc.color;if lightmapSlot>=0 then colorA=[255,255,255,255];colorB=colorA;colorC=colorA end if
  if baseSlot>=0 then return window.appendTriangleBatchPositionColored(commands,baseSlot,lightmapSlot,va.position,va.baseUV,va.lightmapUV,1.0,colorA,vb.position,vb.baseUV,vb.lightmapUV,1.0,colorB,vc.position,vc.baseUV,vc.lightmapUV,1.0,colorC,255,255,255) end if
  return window.appendSingleTextureTrianglePositionColored(commands,lightmapSlot,va.position,va.lightmapUV,1.0,colorA,vb.position,vb.lightmapUV,1.0,colorB,vc.position,vc.lightmapUV,1.0,colorC,255,255,255)
end function

// Compatibility builder: byte layout and single submission remain unchanged.
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
function draw(batch,projection) if batch==void or batch.commands==void then return fail("missing batch") end if;return window.submitWorldTriangleBatch(batch.commands,projection) end function

function materialFor(catalog,textureIndex) if catalog==void then return void end if;for each material in catalog.materials if material.textureIndex==textureIndex then return material end if end for;return void end function
function dynamicStage(stage) return stage.bspLightmap or stage.clampTexture or not stage.depthWrite or stage.depthEqual or len(stage.slots)>1 or len(stage.uvMods)>0 or stage.blend!=materials.BLEND_OPAQUE or stage.alphaTest!=materials.ALPHA_TEST_NONE or stage.tcGen=="environment" or stage.tcGen=="vector" or (stage.rgbGen!="identity" and stage.rgbGen!="identitylighting") or stage.alphaGen!="identity" end function
function dynamicMaterialStage(material,stage) return material.polygonOffset or len(material.deforms)>0 or dynamicStage(stage) end function
function materialUsesBspLightmap(material) for each stage in material.stages if stage.bspLightmap then return true end if end for;return false end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
function materialBefore(left,right) return left.sort<right.sort or (left.sort==right.sort and left.textureIndex<right.textureIndex) end function
function sortedMaterials(values)
  result=array(len(values),void);if len(values)>0 then copyArray(result,0,values,0,len(values));sorting.sortBy(result,materialBefore) end if
  return result
end function
function uploadMaterials(catalog)
  if catalog==void or catalog.materials==void then return fail("missing material catalog") end if
  uploaded=[]
  for each material in catalog.materials
    for each stage in material.stages
      if len(stage.slots)>0 then
      for index=0 to len(stage.slots)-1
        slot=stage.slots[index]
        if not contains(uploaded,slot) then
          image=stage.images[index]
          if image==void or not window.uploadTextureMipmapped(slot,image.pixels,image.width,image.height,not material.noMipMaps) then return fail("could not upload material stage") end if
          uploaded=uploaded+[slot]
        end if
      end for
      end if
    end for
  end for
  return len(uploaded)
end function
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
function countStageTriangles(renderData,textureIndex,flags) count=0;for each triangle in renderData.triangles if triangle.textureIndex==textureIndex and not isSky(triangle,flags) then count=count+1 end if end for;return count end function
function materialTable(renderData,catalog)
  maximum=-1;for each material in catalog.materials if material.textureIndex>maximum then maximum=material.textureIndex end if end for;for each triangle in renderData.triangles if triangle.textureIndex>maximum then maximum=triangle.textureIndex end if end for
  if maximum<0 then return [] end if
  result=array(maximum+1,void);for each material in catalog.materials if material.textureIndex>=0 then result[material.textureIndex]=material end if end for;return result
end function
function groupedTriangles(renderData,flags,count)
  if count==0 then return [] end if
  sizes=array(count,0)
  for each triangle in renderData.triangles if not isSky(triangle,flags) and triangle.textureIndex>=0 and triangle.textureIndex<count then sizes[triangle.textureIndex]=sizes[triangle.textureIndex]+1 end if end for
  result=array(count,void);offsets=array(count,0);for index=0 to count-1 result[index]=array(sizes[index],void) end for
  for each triangle in renderData.triangles if not isSky(triangle,flags) and triangle.textureIndex>=0 and triangle.textureIndex<count then index=triangle.textureIndex;result[index][offsets[index]]=triangle;offsets[index]=offsets[index]+1 end if end for
  return result
end function
function createVertexCache(sourceIndexes)
  maximum=-1
  for each triangle in sourceIndexes for each sourceIndex in triangle if sourceIndex>maximum then maximum=sourceIndex end if end for end for
  if maximum<0 then return void end if
  lookup=array(maximum+1,-1);slots=array(len(sourceIndexes),void);count=0;triangleIndex=0
  for each triangle in sourceIndexes
    triangleSlots=array(len(triangle),-1);corner=0
    for each sourceIndex in triangle
      slot=-1
      if sourceIndex>=0 then slot=lookup[sourceIndex];if slot<0 then slot=count;lookup[sourceIndex]=slot;count=count+1 end if end if
      triangleSlots[corner]=slot;corner=corner+1
    end for
    slots[triangleIndex]=triangleSlots;triangleIndex=triangleIndex+1
  end for
  return VertexCache(slots,array(count,-1),array(count,void),array(count,void),array(count,void),array(count,void))
end function
function buildStagePassTriangles(triangles,material,stage,primary,depthEqual)
  count=len(triangles);if count<1 then return void end if
  commands=window.createTriangleBatch(count);sourceUvs=array(count,void);sourceDeformUvs=array(count,void);sourcePositions=array(count,void);sourceIndexes=array(count,void);sourceNormals=array(count,void);sourceLights=array(count,void);sourceColors=array(count,void);sourceEntityColors=array(count,void);sourceEntityTexCoords=array(count,void);sourceShaderTimes=array(count,void);outputIndex=0
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
      sourceDeformUvs[outputIndex]=[triangle.vertices[0].baseUV,triangle.vertices[1].baseUV,triangle.vertices[2].baseUV]
      sourceNormals[outputIndex]=[triangle.vertices[0].normal,triangle.vertices[1].normal,triangle.vertices[2].normal]
      sourceLights[outputIndex]=[vertexLight(triangle.vertices[0]),vertexLight(triangle.vertices[1]),vertexLight(triangle.vertices[2])]
      sourceColors[outputIndex]=[triangle.vertices[0].color,triangle.vertices[1].color,triangle.vertices[2].color]
      sourceEntityColors[outputIndex]=[triangle.vertices[0].entityColor,triangle.vertices[1].entityColor,triangle.vertices[2].entityColor]
      sourceEntityTexCoords[outputIndex]=[triangle.vertices[0].entityTexCoord,triangle.vertices[1].entityTexCoord,triangle.vertices[2].entityTexCoord]
      sourceShaderTimes[outputIndex]=[triangle.vertices[0].shaderTime,triangle.vertices[1].shaderTime,triangle.vertices[2].shaderTime];outputIndex=outputIndex+1
  end for
  normalNoise=void;if (stage.tcGen=="environment" or stage.alphaGen=="lightingspecular") and hasDeform(material.deforms,"normal") then normalNoise=rendererNoise.create() end if
  vertexCache=void;if not hasDeform(material.deforms,"autosprite") and not hasDeform(material.deforms,"autosprite2") then vertexCache=createVertexCache(sourceIndexes) end if
  firstStage=void;if len(material.stages)>0 then firstStage=material.stages[0] end if
  return StagePass(commands,sourceUvs,sourceDeformUvs,sourcePositions,sourceIndexes,sourceNormals,sourceLights,sourceColors,sourceEntityColors,sourceEntityTexCoords,sourceShaderTimes,[],materials.fogAdjustment(firstStage,stage),stage,material.textureIndex,material.deforms,normalNoise,vertexCache,0,primary,depthEqual,material.sort,material.polygonOffset,material.timeOffset,material.clampTime,false)
end function
function buildStagePass(renderData,material,stage,primary,depthEqual,flags)
  triangles=[];for each triangle in renderData.triangles if triangle.textureIndex==material.textureIndex and not isSky(triangle,flags) then triangles=triangles+[triangle] end if end for
  return buildStagePassTriangles(triangles,material,stage,primary,depthEqual)
end function

// Static opaque primaries stay in the bit-identical base stream. Dynamic and
// supported blended stages become retained passes with their source UVs.
function buildMaterials(renderData,catalog,skyTextureFlags)
  if renderData==void or renderData.triangles==void or catalog==void or catalog.materials==void or skyTextureFlags==void then return fail("missing material batch inputs") end if
  lookup=materialTable(renderData,catalog);groups=groupedTriangles(renderData,skyTextureFlags,len(lookup))
  capacity=len(renderData.triangles);if capacity<1 then capacity=1 end if
  base=window.createTriangleBatch(capacity);if base is error then return base end if;skippedSky=0;drawable=0
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    drawable=drawable+1;material=void;if triangle.textureIndex>=0 and triangle.textureIndex<len(lookup) then material=lookup[triangle.textureIndex] end if
    if material==void or len(material.stages)==0 then base=appendResolved(base,triangle,-1,true)
    else if not dynamicMaterialStage(material,material.stages[0]) then base=appendResolved(base,triangle,material.stages[0].slots[0],not materialUsesBspLightmap(material)) end if
    if base is error then return base end if
  end for
  passes=[];animated=0;modified=0;blended=0;generated=0;alphaTested=0;turbulentCount=0;stretchCount=0;environmentCount=0;filterCount=0;destinationAlphaCount=0;clampedCount=0;deformedCount=0;polygonOffsetCount=0;emitted=base.count
  for each material in sortedMaterials(catalog.materials)
    primaryWrites=false;if len(material.stages)>0 then primaryWrites=material.stages[0].depthWrite end if
    for stageIndex=0 to len(material.stages)-1
      stage=material.stages[stageIndex];if not dynamicMaterialStage(material,stage) then continue end if
      triangles=[];if material.textureIndex>=0 and material.textureIndex<len(groups) then triangles=groups[material.textureIndex] end if
      pass=buildStagePassTriangles(triangles,material,stage,stageIndex==0 and not materialUsesBspLightmap(material),stage.depthEqual or (stageIndex>0 and primaryWrites));if pass is error then return pass end if
      if pass!=void then
        passes=passes+[pass];emitted=emitted+pass.commands.count
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
  return MaterialBatch(base,passes,len(renderData.triangles),drawable,emitted,skippedSky,animated,modified,blended,generated,alphaTested,turbulentCount,stretchCount,environmentCount,filterCount,destinationAlphaCount,clampedCount,deformedCount,polygonOffsetCount,void,void,void,void)
end function

// Refreshes a retained material batch when triangle/material topology is
// unchanged.  The byte buffers and nested source arrays keep their storage;
// callers fall back to buildMaterials when this returns false.
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
      vertex=triangle.vertices[corner];pass.sourcePositions[outputIndex][corner]=vertex.position;pass.sourceIndexes[outputIndex][corner]=vertex.sourceIndex;pass.sourceDeformUvs[outputIndex][corner]=vertex.baseUV;pass.sourceNormals[outputIndex][corner]=vertex.normal;pass.sourceLights[outputIndex][corner]=vertexLight(vertex);pass.sourceColors[outputIndex][corner]=vertex.color;pass.sourceEntityColors[outputIndex][corner]=vertex.entityColor;pass.sourceEntityTexCoords[outputIndex][corner]=vertex.entityTexCoord;pass.sourceShaderTimes[outputIndex][corner]=vertex.shaderTime
    end for
    outputIndex=outputIndex+1
  end for
  if outputIndex!=expected then return false end if
  // Equal triangle counts do not imply equal indexed topology (LOD/model or
  // portal clipping may change sharing). Old cache slots must never survive.
  if indexTopologyChanged and not hasDeform(pass.deforms,"autosprite") and not hasDeform(pass.deforms,"autosprite2") then pass.vertexCache=createVertexCache(pass.sourceIndexes) end if
  return true
end function
function refreshMaterials(batch,renderData,catalog,skyTextureFlags)
  if batch==void or batch.base==void or batch.passes==void or renderData==void or renderData.triangles==void or catalog==void or catalog.materials==void or skyTextureFlags==void then return fail("missing retained material batch inputs") end if
  if len(renderData.triangles)>batch.base.capacity then return false end if
  lookup=materialTable(renderData,catalog);counts=array(len(lookup),0)
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(counts) and not isSky(triangle,skyTextureFlags) then counts[triangle.textureIndex]=counts[triangle.textureIndex]+1 end if end for
  expectedPasses=0
  for each material in catalog.materials
    if material.textureIndex>=0 and material.textureIndex<len(counts) and counts[material.textureIndex]>0 then for each stage in material.stages if dynamicMaterialStage(material,stage) then expectedPasses=expectedPasses+1 end if end for end if
  end for
  if expectedPasses!=len(batch.passes) then return false end if
  oldBaseCount=batch.base.count;batch.base=window.resetTriangleBatch(batch.base);skippedSky=0;drawable=0
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    drawable=drawable+1;material=void;if triangle.textureIndex>=0 and triangle.textureIndex<len(lookup) then material=lookup[triangle.textureIndex] end if
    if material==void or len(material.stages)==0 then batch.base=appendResolved(batch.base,triangle,-1,true)
    else if not dynamicMaterialStage(material,material.stages[0]) then batch.base=appendResolved(batch.base,triangle,material.stages[0].slots[0],not materialUsesBspLightmap(material)) end if
    if batch.base is error then return batch.base end if
  end for
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
function attachFog(batch,renderData,catalog)
  if batch==void or renderData==void or catalog==void then return fail("fog attachment requires batch, render data and catalog") end if
  fogBatch=playableFog.build(renderData,catalog);if fogBatch is error then return fogBatch end if;batch.fogBatch=fogBatch;batch.fogCatalog=catalog
  for each pass in batch.passes
    pass.fogIndexes=array(pass.commands.count,0);pass.initialized=false;fogSlot=0
    for each triangle in renderData.triangles if triangle.textureIndex==pass.textureIndex and fogSlot<pass.commands.count then pass.fogIndexes[fogSlot]=triangle.fogIndex;fogSlot=fogSlot+1 end if end for
  end for
  return fogBatch.commands.count
end function
function attachDynamicLights(batch,renderData,receiveFlags,catalog)
  if batch==void or renderData==void or catalog==void then return fail("dynamic-light attachment requires batch, render data and catalog") end if
  lightBatch=dynamicLights.build(renderData,receiveFlags);if lightBatch is error then return lightBatch end if;batch.dlightBatch=lightBatch;batch.dlightCatalog=catalog;return len(lightBatch.triangles)
end function
function attachDynamicLightsOriented(batch,renderData,receiveFlags,catalog,origins,axes,bounds)
  if batch==void or renderData==void or catalog==void then return fail("oriented dynamic-light attachment requires batch, render data and catalog") end if
  lightBatch=dynamicLights.buildOriented(renderData,receiveFlags,origins,axes,bounds);if lightBatch is error then return lightBatch end if;batch.dlightBatch=lightBatch;batch.dlightCatalog=catalog;return len(lightBatch.triangles)
end function

function identityAffine() return UvAffine(1.0,0.0,0.0,1.0,0.0,0.0) end function
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
function applyAffine(transform,uv) return [uv[0]*transform.m00+uv[1]*transform.m01+transform.tx,uv[0]*transform.m10+uv[1]*transform.m11+transform.ty] end function
function hasTurbulence(stage) for each mod in stage.uvMods if mod.kind=="turb" then return true end if end for;return false end function
function hasEntityTranslate(stage) for each mod in stage.uvMods if mod.kind=="entitytranslate" then return true end if end for;return false end function
function hasDeform(deforms,kind) for each deform in deforms if deform.kind==kind then return true end if end for;return false end function
function containsPosition(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
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
function autospriteCorner(triangleIndex,vertex)
  if triangleIndex%2==0 then if vertex==0 then return 0 else if vertex==1 then return 1 else return 3 end if end if
  if vertex==0 then return 3 else if vertex==1 then return 1 else return 2 end if
end function
function autospriteUV(triangleIndex,vertex) if triangleIndex%2==0 then return [[0.0,0.0],[1.0,0.0],[0.0,1.0]][vertex] end if;return [[0.0,1.0],[1.0,0.0],[1.0,1.0]][vertex] end function
function edgeVertices(index)
  if index==0 then return [0,1] else if index==1 then return [0,2] else if index==2 then return [0,3] else if index==3 then return [1,2] else if index==4 then return [1,3] else return [2,3] end if
end function

// Autosprite2Deform keeps the long axis fixed and rotates only the two short
// edges toward the view. Source indexes preserve Quake's directed-edge test.
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
function specularAlpha(position,normal,viewOrigin)
  light=[numeric.fsub(-960.0,position[0]),numeric.fsub(1980.0,position[1]),numeric.fsub(96.0,position[2])];lightScale=qmath.Q_rsqrt(qmath.DotProduct(light,light));light=[numeric.fmul(light[0],lightScale),numeric.fmul(light[1],lightScale),numeric.fmul(light[2],lightScale)]
  dot=qmath.DotProduct(normal,light);reflected=[numeric.fsub(numeric.fmul(numeric.fmul(normal[0],2.0),dot),light[0]),numeric.fsub(numeric.fmul(numeric.fmul(normal[1],2.0),dot),light[1]),numeric.fsub(numeric.fmul(numeric.fmul(normal[2],2.0),dot),light[2])]
  viewer=[numeric.fsub(viewOrigin[0],position[0]),numeric.fsub(viewOrigin[1],position[1]),numeric.fsub(viewOrigin[2],position[2])];viewScale=qmath.Q_rsqrt(qmath.DotProduct(viewer,viewer));value=numeric.fmul(qmath.DotProduct(reflected,viewer),viewScale)
  if value<0.0 then return 0 end if;value=numeric.fmul(value,value);value=numeric.fmul(value,value);result=numeric.trunc32(numeric.fmul(value,255.0));if result>255 then result=255 end if;return result
end function
function updatePassAxesFog(pass,viewOrigin,leftDir,upDir,nowMilliseconds,fogCatalog)
  slot=materials.slotAt(pass.stage,nowMilliseconds);if pass.initialized and not passChanges(pass,fogCatalog) then return slot end if
  transform=affineFor(pass.stage,nowMilliseconds);turbulent=hasTurbulence(pass.stage);entityTranslate=hasEntityTranslate(pass.stage);autosprite=hasDeform(pass.deforms,"autosprite");autosprite2=hasDeform(pass.deforms,"autosprite2");quad=void;quad2=void
  cacheEpoch=0;if pass.vertexCache!=void then pass.cacheSerial=pass.cacheSerial+1;cacheEpoch=pass.cacheSerial end if
  forward=[leftDir[1]*upDir[2]-leftDir[2]*upDir[1],leftDir[2]*upDir[0]-leftDir[0]*upDir[2],leftDir[0]*upDir[1]-leftDir[1]*upDir[0]];spriteNormal=[0.0-forward[0],0.0-forward[1],0.0-forward[2]]
  for triangleIndex=0 to pass.commands.count-1
    triangleShaderTime=pass.sourceShaderTimes[triangleIndex][0];triangleNow=materials.shaderMilliseconds(nowMilliseconds,triangleShaderTime,pass.timeOffset,pass.clampTime);slot=materials.slotAt(pass.stage,triangleNow)
    offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES;if not pass.stage.bspLightmap then window.writeBatchI32(pass.commands.data,offset,slot) end if
    if triangleIndex%2==0 then if autosprite then quad=autospriteQuad(pass,triangleIndex,leftDir,upDir) else if autosprite2 then quad2=autosprite2Quad(pass,triangleIndex,forward) end if end if
    for vertex=0 to 2
      sourcePosition=pass.sourcePositions[triangleIndex][vertex];sourceUv=pass.sourceUvs[triangleIndex][vertex];sourceNormal=pass.sourceNormals[triangleIndex][vertex];vertexColor=pass.sourceColors[triangleIndex][vertex];entityColor=pass.sourceEntityColors[triangleIndex][vertex];entityTexCoord=pass.sourceEntityTexCoords[triangleIndex][vertex];shaderTime=pass.sourceShaderTimes[triangleIndex][vertex]
      if autosprite and quad!=void then sourcePosition=quad[autospriteCorner(triangleIndex,vertex)];sourceUv=autospriteUV(triangleIndex,vertex);sourceNormal=spriteNormal;vertexColor=pass.sourceColors[triangleIndex-triangleIndex%2][0];entityColor=pass.sourceEntityColors[triangleIndex-triangleIndex%2][0];entityTexCoord=pass.sourceEntityTexCoords[triangleIndex-triangleIndex%2][0];shaderTime=pass.sourceShaderTimes[triangleIndex-triangleIndex%2][0] end if
      if autosprite2 and quad2!=void then sourcePosition=quad2[1][pass.sourceIndexes[triangleIndex][vertex]-quad2[0]] end if
      position=sourcePosition;uv=void;stageColor=void;cacheSlot=-1;if pass.vertexCache!=void then cacheSlot=pass.vertexCache.slots[triangleIndex][vertex] end if
      if cacheSlot>=0 and pass.vertexCache.frames[cacheSlot]==cacheEpoch then position=pass.vertexCache.positions[cacheSlot];sourceNormal=pass.vertexCache.normals[cacheSlot];uv=pass.vertexCache.uvs[cacheSlot];stageColor=pass.vertexCache.colors[cacheSlot]
      else
        entityNow=materials.shaderMilliseconds(nowMilliseconds,shaderTime,pass.timeOffset,pass.clampTime)
        position=deformedPosition(sourcePosition,sourceNormal,pass.sourceDeformUvs[triangleIndex][vertex],pass.deforms,entityNow)
        if pass.stage.tcGen=="environment" or pass.stage.alphaGen=="lightingspecular" then sourceNormal=deformedNormal(position,sourceNormal,pass.deforms,entityNow,pass.normalNoise) end if
        if pass.stage.tcGen=="environment" then sourceUv=materials.environmentUV(position,sourceNormal,viewOrigin) else if pass.stage.tcGen=="vector" then sourceUv=materials.vectorUV(pass.stage,position) end if
        if turbulent or entityTranslate or shaderTime!=0.0 or pass.timeOffset!=0.0 or pass.clampTime!=0.0 then uv=materials.transformUVEntityAt(pass.stage,sourceUv,position,entityTexCoord,0.0,entityNow) else uv=applyAffine(transform,sourceUv) end if
        stageColor=materials.stageColorAtEntity(pass.stage,vertexColor,entityColor,position,viewOrigin,entityNow)
        if pass.stage.alphaGen=="lightingspecular" then stageColor[3]=specularAlpha(position,sourceNormal,viewOrigin) end if
        if cacheSlot>=0 then pass.vertexCache.frames[cacheSlot]=cacheEpoch;pass.vertexCache.positions[cacheSlot]=position;pass.vertexCache.normals[cacheSlot]=sourceNormal;pass.vertexCache.uvs[cacheSlot]=uv;pass.vertexCache.colors[cacheSlot]=stageColor end if
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
function updatePassAxes(pass,viewOrigin,leftDir,upDir,nowMilliseconds) return updatePassAxesFog(pass,viewOrigin,leftDir,upDir,nowMilliseconds,void) end function
function updatePassView(pass,viewOrigin,nowMilliseconds) return updatePassAxes(pass,viewOrigin,[0.0,1.0,0.0],[0.0,0.0,1.0],nowMilliseconds) end function
function updatePass(pass,nowMilliseconds) return updatePassView(pass,[0.0,0.0,0.0],nowMilliseconds) end function
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
function drawMaterialsLit(batch,projection,nowMilliseconds,lights) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,lights,void) end function
function drawMaterials(batch,projection,nowMilliseconds) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,[],void) end function
function drawMaterialsLitViewport(batch,projection,nowMilliseconds,lights,area) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,lights,area) end function
function drawMaterialsViewport(batch,projection,nowMilliseconds,area) return drawMaterialsLitTarget(batch,projection,nowMilliseconds,[],area) end function
