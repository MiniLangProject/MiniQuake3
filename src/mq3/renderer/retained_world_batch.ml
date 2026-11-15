// SPDX-License-Identifier: GPL-2.0-or-later
// One-map retained world packets. Selection and shader algorithms stay owned
// by the existing modules; only selected records/metadata are gathered.
package mq3.renderer.retained_world_batch
import mq3.renderer.playable_world_batch as batches
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.native_world_selection as nativeWorld
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_fog as fog
import mq3.renderer.playable_dynamic_lights as lights
import mq3.platform.playable_window as window
import mq3.compat.numeric as n
extern function gatherNative(source as ptr,sourceBytes as i32,sourceCount as i32,target as ptr,targetBytes as i32,runs as ptr,runBytes as i32,selected as ptr,selectedBytes as i32,selectedCount as i32) from "playable_window.dll" symbol "playable_window_gather_world_records" returns i32
struct Stream source count runs firsts counts draw fullPass activePass primed end struct
struct Cache world catalog skyFlags fogCatalog lightCatalog receiveFlags full base streams fogStream dlightCommands fallbackFaces faces active last enabled reason selections fallbacks staticPrimes end struct
function fail(text) return error(7494,"retained world batch: "+text) end function
function blank(world,catalog,skyFlags,fogCatalog,lightCatalog,receiveFlags)
  return Cache(world,catalog,skyFlags,fogCatalog,lightCatalog,receiveFlags,void,void,[],void,void,[],void,void,void,false,"",0,0,0)
end function
function unsupported(material)
  return material!=void and (material.sort==1.0 or batches.hasDeform(material.deforms,"autosprite") or batches.hasDeform(material.deforms,"autosprite2"))
end function
function stageView(full,commands)
  count=full.commands.count;vertexCache=void
  if full.vertexCache!=void then
    original=full.vertexCache
    vertexCache=batches.VertexCache(array(count,void),original.frames,original.positions,original.normals,original.uvs,original.colors)
  end if
  return batches.StagePass(commands,array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),array(count,void),[],full.fogAdjustment,full.stage,full.textureIndex,full.deforms,full.normalNoise,vertexCache,0,full.primary,full.depthEqual,full.sort,full.polygonOffset,full.timeOffset,full.clampTime,false)
end function
function makeStream(state,data,commands,pass,mode,lookup)
  faceCount=len(state.world.trianglesByFace);firsts=array(faceCount,0);counts=array(faceCount,0);runs=bytes(faceCount*8,0);record=0
  for each triangle in data.triangles
    included=false
    if mode==2 then included=triangle.fogIndex>0 and triangle.fogIndex<len(state.fogCatalog.fogs) end if
    if mode!=2 and not batches.isSky(triangle,state.skyFlags) then
      if mode==1 then included=triangle.textureIndex==pass.textureIndex end if
      if mode==0 then
        material=void;if triangle.textureIndex>=0 and triangle.textureIndex<len(lookup) then material=lookup[triangle.textureIndex] end if
        included=material==void or len(material.stages)==0
        if not included then included=not batches.dynamicMaterialStage(material,material.stages[0]) end if
      end if
    end if
    if included then
      face=triangle.faceIndex;if face<0 or face>=faceCount then return fail("source face outside cache") end if
      if counts[face]==0 then firsts[face]=record end if
      if firsts[face]+counts[face]!=record then return fail("noncontiguous source face records") end if
      counts[face]=counts[face]+1;record=record+1
    end if
  end for
  if record!=commands.count then return fail("source topology differs from material builder") end if
  if faceCount>0 then for face=0 to faceCount-1 n.writeU32(runs,face*8,firsts[face]);n.writeU32(runs,face*8+4,counts[face]) end for end if
  capacity=commands.count;if capacity<1 then capacity=1 end if
  draw=window.createTriangleBatch(capacity);if draw is error then return draw end if
  primed=false
  if pass!=void and not batches.passChanges(pass,state.fogCatalog) and not batches.hasDeform(pass.deforms,"autosprite") and not batches.hasDeform(pass.deforms,"autosprite2") then
    updated=batches.updatePassAxesFog(pass,[0.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],0,state.fogCatalog);if updated is error then return updated end if;primed=true
  end if
  activePass=void;if pass!=void then activePass=stageView(pass,draw) end if
  return Stream(commands.data,commands.count,runs,firsts,counts,draw,pass,activePass,primed)
end function
function create(world,catalog,skyFlags,fogCatalog,lightCatalog,receiveFlags)
  if world==void or catalog==void or skyFlags==void or receiveFlags==void then return fail("world/material tables are required") end if
  state=blank(world,catalog,skyFlags,fogCatalog,lightCatalog,receiveFlags)
  // A large map may still have a small valid selected set. Cache capacity
  // must never turn that previously playable case into a map-load failure.
  if world.totalTriangleCount>window.TRIANGLE_BATCH_MAX_COUNT then state.reason="full map exceeds retained command capacity";return state end if
  indexes=array(len(world.trianglesByFace),0);if len(indexes)>0 then for index=0 to len(indexes)-1 indexes[index]=index end for end if
  chosen=selection.Selection(indexes,0,len(indexes),world.totalTriangleCount,false,0,0,0,0,0,0,0)
  data=selection.cachedRenderData(world,chosen);if data is error then return data end if
  full=batches.buildMaterials(data,catalog,skyFlags);if full is error then return full end if
  state.full=full
  if fogCatalog!=void then value=batches.attachFog(full,data,fogCatalog);if value is error then return value end if end if
  lookup=batches.materialTable(data,catalog);faceCount=len(world.trianglesByFace);state.fallbackFaces=array(faceCount,false)
  if faceCount>0 then for face=0 to faceCount-1
    texture=world.faceTextureIndexes[face]
    if texture>=0 and texture<len(lookup) then state.fallbackFaces[face]=unsupported(lookup[texture]) end if
  end for end if
  state.base=makeStream(state,data,full.base,void,0,lookup);if state.base is error then return state.base end if
  state.streams=array(len(full.passes),void)
  if len(full.passes)>0 then for index=0 to len(full.passes)-1
    stream=makeStream(state,data,full.passes[index].commands,full.passes[index],1,lookup);if stream is error then return stream end if
    state.streams[index]=stream;if stream.primed then state.staticPrimes=state.staticPrimes+1 end if
  end for end if
  if full.fogBatch!=void then state.fogStream=makeStream(state,data,full.fogBatch.commands,void,2,lookup);if state.fogStream is error then return state.fogStream end if end if
  activeFog=void
  if state.fogStream!=void then activeFog=fog.FogBatch(state.fogStream.draw,array(full.fogBatch.commands.count,void),array(full.fogBatch.commands.count,0)) end if
  activeLights=void
  if lightCatalog!=void then
    sourceLights=lights.build(data,receiveFlags);if sourceLights is error then return sourceLights end if
    state.dlightCommands=sourceLights.commands;activeLights=lights.Batch(state.dlightCommands,[],void,void,void)
  end if
  state.active=batches.MaterialBatch(state.base.draw,[],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,activeFog,fogCatalog,activeLights,lightCatalog)
  state.enabled=true;return state
end function
function gather(stream,packed,count)
  written=gatherNative(nativeBytesPtr(stream.source),len(stream.source),stream.count,nativeBytesPtr(stream.draw.data),len(stream.draw.data),nativeBytesPtr(stream.runs),len(stream.runs),nativeBytesPtr(packed),len(packed),count)
  if written<0 then return fail("native record gather rejected input code="+str(written)) end if
  stream.draw.count=written;return written
end function
function stageSources(stream,faces,fogCatalog)
  full=stream.fullPass;active=stream.activePass;outputIndex=0
  // These arrays hold triangle-row references, never copies of vertices.
  // Their capacity stays fixed; only commands.count is active. Fog indexes
  // retain an exact active length because passHasFog iterates that array.
  if fogCatalog!=void then active.fogIndexes=array(stream.draw.count,0) end if
  for each face in faces
    first=stream.firsts[face];count=stream.counts[face]
    if count>0 then for index=first to first+count-1
      active.sourceUvs[outputIndex]=full.sourceUvs[index];active.sourceDeformUvs[outputIndex]=full.sourceDeformUvs[index];active.sourcePositions[outputIndex]=full.sourcePositions[index];active.sourceIndexes[outputIndex]=full.sourceIndexes[index];active.sourceNormals[outputIndex]=full.sourceNormals[index];active.sourceLights[outputIndex]=full.sourceLights[index];active.sourceColors[outputIndex]=full.sourceColors[index];active.sourceEntityColors[outputIndex]=full.sourceEntityColors[index];active.sourceEntityTexCoords[outputIndex]=full.sourceEntityTexCoords[index];active.sourceShaderTimes[outputIndex]=full.sourceShaderTimes[index]
      if active.vertexCache!=void then active.vertexCache.slots[outputIndex]=full.vertexCache.slots[index] end if
      if fogCatalog!=void then active.fogIndexes[outputIndex]=full.fogIndexes[index] end if
      outputIndex=outputIndex+1
    end for end if
  end for
  if outputIndex!=stream.draw.count then return fail("active stage metadata differs from gathered records") end if
  // cacheSerial is intentionally monotonic across selections. Resetting it
  // would allow a prior selection's shared vertex-cache epoch to match.
  active.initialized=stream.primed;return active
end function
function refreshFog(state,faces)
  if state.fogStream==void then return true end if
  source=state.full.fogBatch;target=state.active.fogBatch;outputIndex=0;stream=state.fogStream
  for each face in faces
    first=stream.firsts[face];count=stream.counts[face]
    if count>0 then for index=first to first+count-1 target.sourcePositions[outputIndex]=source.sourcePositions[index];target.fogIndexes[outputIndex]=source.fogIndexes[index];outputIndex=outputIndex+1 end for end if
  end for
  if outputIndex!=target.commands.count then return fail("active fog metadata differs from gathered records") end if
  return true
end function
function refreshLights(state,data)
  if state.active.dlightBatch==void then return true end if
  count=0
  for each triangle in data.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(state.receiveFlags) and state.receiveFlags[triangle.textureIndex] then count=count+1 end if end for
  if count>state.dlightCommands.capacity then return fail("selected dynamic-light source exceeds full-map capacity") end if
  triangles=array(count,void);index=0
  for each triangle in data.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(state.receiveFlags) and state.receiveFlags[triangle.textureIndex] then triangles[index]=triangle;index=index+1 end if end for
  state.active.dlightBatch.triangles=triangles;return true
end function
function legacy(state,chosen)
  result=batches.buildMaterials(chosen.renderData,state.catalog,state.skyFlags);if result is error then return result end if
  if state.fogCatalog!=void then value=batches.attachFog(result,chosen.renderData,state.fogCatalog);if value is error then return value end if end if
  if state.lightCatalog!=void then value=batches.attachDynamicLights(result,chosen.renderData,state.receiveFlags,state.lightCatalog);if value is error then return value end if end if
  state.fallbacks=state.fallbacks+1;return result
end function
function counters(batch)
  batch.animatedPasses=0;batch.uvModifiedPasses=0;batch.blendedPasses=0;batch.generatorPasses=0;batch.alphaTestPasses=0;batch.turbulentPasses=0;batch.stretchPasses=0;batch.environmentPasses=0;batch.filterPasses=0;batch.destinationAlphaPasses=0;batch.clampedPasses=0;batch.deformedPasses=0;batch.polygonOffsetPasses=0
  for each pass in batch.passes
    stage=pass.stage
    if len(stage.slots)>1 then batch.animatedPasses=batch.animatedPasses+1 end if
    if len(stage.uvMods)>0 then batch.uvModifiedPasses=batch.uvModifiedPasses+1 end if
    if stage.blend!=materials.BLEND_OPAQUE then batch.blendedPasses=batch.blendedPasses+1 end if
    if stage.rgbGen=="wave" then batch.generatorPasses=batch.generatorPasses+1 end if
    if stage.alphaTest!=materials.ALPHA_TEST_NONE then batch.alphaTestPasses=batch.alphaTestPasses+1 end if
    if stage.tcGen=="environment" then batch.environmentPasses=batch.environmentPasses+1 end if
    if stage.blend==materials.BLEND_FILTER then batch.filterPasses=batch.filterPasses+1 end if
    if stage.blend==materials.BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA then batch.destinationAlphaPasses=batch.destinationAlphaPasses+1 end if
    if stage.clampTexture then batch.clampedPasses=batch.clampedPasses+1 end if
    if len(pass.deforms)>0 then batch.deformedPasses=batch.deformedPasses+1 end if
    if pass.polygonOffset then batch.polygonOffsetPasses=batch.polygonOffsetPasses+1 end if
    for each mod in stage.uvMods if mod.kind=="turb" then batch.turbulentPasses=batch.turbulentPasses+1;break end if end for
    for each mod in stage.uvMods if mod.kind=="stretch" then batch.stretchPasses=batch.stretchPasses+1;break end if end for
  end for
  return batch
end function
function select(state,chosen)
  if state==void or chosen==void or chosen.selection==void or chosen.renderData==void then return fail("cache and selected world are required") end if
  faces=chosen.selection.faceIndexes
  if state.last!=void and selection.sameFaces(state.faces,faces) then return state.last end if
  state.selections=state.selections+1;fallback=not state.enabled
  if not fallback then for each face in faces
    if face<0 or face>=len(state.fallbackFaces) then return fail("selected face outside full cache") end if
    if state.fallbackFaces[face] then fallback=true end if
  end for end if
  if fallback then
    result=legacy(state,chosen);if result is error then return result end if
    state.faces=faces;state.last=result;return result
  end if
  packed=nativeWorld.packIndexes(faces);value=gather(state.base,packed,len(faces));if value is error then return value end if
  activeCount=0
  for each stream in state.streams value=gather(stream,packed,len(faces));if value is error then return value end if;if value>0 then activeCount=activeCount+1 end if end for
  activePasses=array(activeCount,void);index=0;emitted=state.base.draw.count
  for each stream in state.streams if stream.draw.count>0 then
    pass=stageSources(stream,faces,state.fogCatalog);if pass is error then return pass end if
    activePasses[index]=pass;index=index+1;emitted=emitted+stream.draw.count
  end if end for
  if state.fogStream!=void then value=gather(state.fogStream,packed,len(faces));if value is error then return value end if;value=refreshFog(state,faces);if value is error then return value end if end if
  value=refreshLights(state,chosen.renderData);if value is error then return value end if
  batch=state.active;batch.passes=activePasses;batch.sourceTriangles=len(chosen.renderData.triangles);batch.skippedSky=0
  for each triangle in chosen.renderData.triangles if batches.isSky(triangle,state.skyFlags) then batch.skippedSky=batch.skippedSky+1 end if end for
  batch.drawableTriangles=batch.sourceTriangles-batch.skippedSky;batch.emittedTriangles=emitted;counters(batch)
  state.faces=faces;state.last=batch;return batch
end function
