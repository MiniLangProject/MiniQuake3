// SPDX-License-Identifier: GPL-2.0-or-later
// Headless diagnostic of the actual q3dm1 cgame/HUD/weapon scene hot path.
// No renderer implementation or QVM behavior is modified by this probe.
import mq3.engine.local_qvm_match as hotMatch
import mq3.vm.syscall_qagame_world as hotQworld
import mq3.client.cgame_clock as hotClock
import mq3.renderer.scene_queue as hotScene
import mq3.renderer.qvm_scene_geometry as hotGeo
import mq3.renderer.qvm_scene_materials as hotMats
import mq3.renderer.qvm_scene_batch as hotBatch
import mq3.renderer.playable_materials as hotMaterialDefs
import mq3.renderer.playable_world_batch as hotWorld
import mq3.renderer.entity_surface_policy as hotPolicy
import mq3.renderer.playable_light_grid as hotGrid
import mq3.platform.playable_window as hotWindow
import mq3.format.pk3 as hotPk3
import mq3.format.bsp as hotBsp
import std.ds.list as hotLists

struct HotQuery modelHandle surfaceIndex frame oldFrame backlerp origin axis end struct
struct HotRing entries count next hits misses visits end struct
struct HotView geometry batch catalog source end struct
function hotRequire(value,label) if not value then return error(7685,"Retail scene profile: "+label) end if;return true end function
function hotRing() return HotRing(array(256,void),0,0,0,0,0) end function
function hotFrameEqual(a,b) return a.modelHandle==b.modelHandle and a.surfaceIndex==b.surfaceIndex and a.frame==b.frame and a.oldFrame==b.oldFrame and a.backlerp==b.backlerp end function
function hotTransformEqual(a,b) return hotFrameEqual(a,b) and a.origin==b.origin and a.axis==b.axis end function
function hotObserve(ring,queries,transform)
  for each query in queries
    found=false
    if ring.count>0 then for slot=0 to ring.count-1
      ring.visits=ring.visits+1;entry=ring.entries[slot]
      if entry!=void and hotFrameEqual(entry,query) and (not transform or (entry.origin==query.origin and entry.axis==query.axis)) then found=true;break end if
    end for end if
    if found then ring.hits=ring.hits+1
    else ring.misses=ring.misses+1;ring.entries[ring.next]=query;ring.next=(ring.next+1)%256;if ring.count<256 then ring.count=ring.count+1 end if end if
  end for
  return void
end function
function hotQueries(view,state)
  queries=hotLists.List.withCapacity(16);frustum=hotGeo.refdefFrustum(view.refdef);if frustum is error then return frustum end if
  for each raw in view.scene.entities
    decoded=hotScene.decodeEntity(raw);if decoded is error then return decoded end if
    if decoded.reType!=0 or not hotPolicy.visible(decoded.reType,decoded.renderfx,false) then continue end if
    asset=hotGeo.modelAt(state.context.assetKinds,state.context.modelAssets,decoded.hModel)
    if asset==void or typeof(asset)=="string" or hotGeo.isInlineModel(asset) then continue end if
    selection=hotGeo.selectMd3(decoded,asset,view.refdef,frustum,5.0,0);if selection is error then return selection end if
    if selection.cull==2 then continue end if
    for surfaceIndex=0 to len(selection.model.surfaces)-1
      if selection.model.surfaces[surfaceIndex].mesh.numTriangles==0 then continue end if
      queries.add(HotQuery(decoded.hModel*4+selection.lod,surfaceIndex,selection.frames.frame,selection.frames.oldFrame,decoded.backlerp,decoded.origin,decoded.axis))
    end for
  end for
  return queries.toArray()
end function
function hotCatalogSnapshot(catalog)
  return hotMats.Catalog(catalog.triangles,catalog.materials,catalog.textures,catalog.scriptIndex,catalog.scriptCount,catalog.loadedSkins,catalog.bindings,catalog.resolvedTriangles,catalog.unresolvedTriangles,catalog.nextTextureSlot,catalog.recentBinding,catalog.shaderRemaps,catalog.imageCache)
end function
function hotBuffers(batch)
  buffers=hotLists.List.withCapacity(len(batch.passes)+1)
  if batch.base.count>0 then buffers.add(slice(batch.base.data,0,batch.base.count*128)) end if
  for each pass in batch.passes if pass.commands.count>0 then buffers.add(slice(pass.commands.data,0,pass.commands.count*128)) end if end for
  return buffers.toArray()
end function
function hotAllBuffers(prepared)
  result=hotLists.List.withCapacity(16)
  for each view in prepared for each batch in [view.batch.batch,view.batch.depthHackBatch] for each buffer in hotBuffers(batch) result.add(buffer) end for end for end for
  return result.toArray()
end function
function hotBuffersEqual(a,b)
  // Frozen MiniLang 1.2.8 compares bytes directly by contents, but nested
  // arrays of byte buffers by identity. Compare each buffer at its own level.
  if len(a)!=len(b) then return false end if
  for index=0 to len(a)-1 if a[index]!=b[index] then return false end if end for
  return true
end function
function hotLookup(entries,query)
  if len(entries)>0 then for slot=0 to len(entries)-1 entry=entries[slot];if entry!=void and hotTransformEqual(entry,query) then return slot end if end for end if;return -1
end function
function main(args)
  archive=hotPk3.open(args[0]);if archive is error then return archive end if
  map=hotBsp.load(hotPk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=hotMatch.bootWithQvms(archive,map,1000,args[1]);if state is error then return state end if
  joined=hotMatch.connectLocal(state,0);if joined is error then return joined end if
  for tick=1 to 2
    now=1000+tick*50;hotMatch.submitUsercmd(state,0,hotQworld.userCommand(now,[0,0,0],0,2,0,0,0));hotMatch.runFrame(state,now);hotMatch.snapshotProductive(state,0)
    if tick==1 then booted=hotMatch.bootCgame(state);if booted is error then return booted end if end if
    drawn=hotMatch.drawCgameProductive(state,now);if drawn is error then return drawn end if
  end for
  scripts=hotMaterialDefs.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=hotMats.buildIndexed(archive,[],state.context.assets,state.context.assetKinds,336,64,state.context.shaderRemaps,scripts);if catalog is error then return catalog end if
  cache=hotGeo.createFrameCache(void,256);if cache is error then return cache end if
  frameRing=hotRing();transformRing=hotRing();prepared=[void,void,void];expandedMs=0;materialMs=0;batchMs=0;unchangedBuffers=0;comparedBuffers=0;previousBuffers=void;lastQueries=hotLists.List.withCapacity(16)
  clock=hotClock.create(1100,state.context.snapshotNumber,state.context.latestSnapshot.serverTime);if clock is error then return clock end if
  simulationTime=1100;models=0;triangles=0;emitted=0;sourceVertices=0;sameFrameNonzero=0
  for frame=0 to 120
    now=1100+frame*16
    while simulationTime+50<=now
      simulationTime=simulationTime+50;hotMatch.submitUsercmd(state,0,hotQworld.userCommand(simulationTime,[0,0,0],0,2,0,0,0));hotMatch.runFrame(state,simulationTime);snapshot=hotMatch.snapshotProductive(state,0)
      published=hotClock.publishSnapshot(clock,state.context.snapshotNumber,snapshot.serverTime,0);if published is error then return published end if
    end while
    hotMatch.beginRendererFrame(state);frameTime=hotClock.frame(clock,now);if frameTime is error then return frameTime end if
    drawn=hotMatch.drawCgameProductiveInFrame(state,frameTime.serverTime);if drawn is error then return drawn end if
    models=0;triangles=0;emitted=0;sourceVertices=0;viewIndex=0
    if frame==120 then lastQueries.clear() end if
    for each view in state.context.renderViews
      queries=hotQueries(view,state);if queries is error then return queries end if
      hotObserve(frameRing,queries,false);hotObserve(transformRing,queries,true)
      for each query in queries if query.frame==query.oldFrame and query.backlerp!=0.0 then sameFrameNonzero=sameFrameNonzero+1 end if end for
      if frame==120 then for each query in queries lastQueries.add(query) end for end if
      ignored=hotGrid.setDynamicLights(state.context.lightGrid,view.scene.dlights)
      previous=prepared[viewIndex];oldGeometry=void;if previous!=void then oldGeometry=previous.geometry end if
      started=hotWindow.milliseconds();geometry=hotGeo.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,state.context.assetKinds,state.context.modelAssets,view.refdef,8192,cache,state.context.lightGrid,oldGeometry,1,void,5.0,0);afterGeo=hotWindow.milliseconds();if geometry is error then return geometry end if
      rebound=hotMats.refresh(catalog,archive,geometry.triangles,state.context.assets,state.context.assetKinds,400);afterMaterial=hotWindow.milliseconds();if rebound is error then return rebound end if
      batch=void;if previous==void then batch=hotBatch.buildWithGeometry(catalog,geometry) else batch=hotBatch.refreshWithGeometry(previous.batch,catalog,geometry) end if;afterBatch=hotWindow.milliseconds();if batch is error then return batch end if
      if frame>0 then expandedMs=expandedMs+afterGeo-started;materialMs=materialMs+afterMaterial-afterGeo;batchMs=batchMs+afterBatch-afterMaterial end if
      prepared[viewIndex]=HotView(geometry,batch,hotCatalogSnapshot(catalog),view);models=models+geometry.modelEntities;triangles=triangles+geometry.triangleCount;sourceVertices=sourceVertices+geometry.sourceVertices;emitted=emitted+batch.batch.emittedTriangles+batch.depthHackBatch.emittedTriangles;viewIndex=viewIndex+1
    end for
    checked=hotRequire(frameRing.hits==cache.hits and frameRing.misses==cache.misses and transformRing.hits==cache.transformHits and transformRing.misses==cache.transformMisses,"shadow lookup visits match productive cache counters exactly");if checked is error then return checked end if
    buffers=hotAllBuffers(prepared)
    if previousBuffers!=void and len(previousBuffers)==len(buffers) then for index=0 to len(buffers)-1 comparedBuffers=comparedBuffers+1;if buffers[index]==previousBuffers[index] then unchangedBuffers=unchangedBuffers+1 end if end for end if
    previousBuffers=buffers;state.context.soundCommands=[]
  end for
  checked=hotRequire(models==5 and triangles==524 and cache.transformCount==256,"complete 524-triangle productive Retail view retained");if checked is error then return checked end if
  print("PROFILE realFrames=120 models="+str(models)+" triangles="+str(triangles)+" sourceVertices="+str(sourceVertices)+" emitted="+str(emitted)+" expandMs="+str(expandedMs/120.0)+" materialMs="+str(materialMs/120.0)+" sceneBatchMs="+str(batchMs/120.0)+" buffers="+str(comparedBuffers)+" unchanged="+str(unchangedBuffers))
  print("CACHE frameHits="+str(cache.hits)+" frameMisses="+str(cache.misses)+" frameEntries="+str(cache.entryCount)+" frameVisits="+str(frameRing.visits)+" transformHits="+str(cache.transformHits)+" transformMisses="+str(cache.transformMisses)+" transformEntries="+str(cache.transformCount)+" transformVisits="+str(transformRing.visits)+" sameFrameNonzeroBacklerp="+str(sameFrameNonzero))
  // Isolate unchanged-topology conversion versus stage packing, then repack
  // only the already selected vertex records without rebuilding source maps.
  started=hotWindow.milliseconds()
  for repeat=1 to 120 for each view in prepared
    hotBatch.refreshGeometry(view.batch.geometry,view.catalog);hotBatch.refreshGeometryMode(view.batch.depthHackGeometry,view.catalog,true);hotBatch.refreshDynamicGeometry(view.batch.dynamicGeometry,view.catalog)
  end for end for
  convertMs=hotWindow.milliseconds()-started
  started=hotWindow.milliseconds()
  for repeat=1 to 120 for each view in prepared for each pair in [[view.batch.batch,view.batch.geometry],[view.batch.depthHackBatch,view.batch.depthHackGeometry]]
    refreshed=hotWorld.refreshMaterials(pair[0],pair[1],view.catalog,array(len(view.catalog.materials),false));if refreshed is error or refreshed==false then return error(7685,"retained Retail material topology unexpectedly changed") end if
  end for end for end for
  refreshMs=hotWindow.milliseconds()-started
  started=hotWindow.milliseconds()
  for repeat=1 to 120 for each view in prepared for each pair in [[view.batch.batch,view.batch.geometry],[view.batch.depthHackBatch,view.batch.depthHackGeometry]]
    for each pass in pair[0].passes refreshed=hotWorld.refreshStagePass(pass,pair[1]);if refreshed is error or not refreshed then return error(7685,"retained Retail stage unexpectedly changed") end if end for
  end for end for end for
  stagesMs=hotWindow.milliseconds()-started
  started=hotWindow.milliseconds()
  for repeat=1 to 120 for each view in prepared for each pair in [[view.batch.batch,view.batch.geometry],[view.batch.depthHackBatch,view.batch.depthHackGeometry]] for each pass in pair[0].passes
    if pass.stage.bspLightmap then return error(7685,"MD3 probe unexpectedly contains a BSP lightmap pass") end if
    pass.commands=hotWindow.resetTriangleBatch(pass.commands)
    for each triangle in pair[1].triangles if triangle.textureIndex==pass.textureIndex then pass.commands=hotWorld.appendResolved(pass.commands,triangle,pass.stage.slots[0],pass.primary);if pass.commands is error then return pass.commands end if end if end for
  end for end for end for end for
  packingMs=hotWindow.milliseconds()-started;afterBuffers=hotAllBuffers(prepared)
  exactBuffers=hotBuffersEqual(afterBuffers,previousBuffers)
  print("REPLAY frames=120 convertMs="+str(convertMs/120.0)+" refreshMaterialsMs="+str(refreshMs/120.0)+" refreshStagePassMs="+str(stagesMs/120.0)+" appendResolvedMs="+str(packingMs/120.0)+" exactBytes="+str(exactBuffers))
  if not exactBuffers then for bufferIndex=0 to len(afterBuffers)-1
    if afterBuffers[bufferIndex]!=previousBuffers[bufferIndex] then
      print("DIFF buffer="+str(bufferIndex)+" oldBytes="+str(len(previousBuffers[bufferIndex]))+" newBytes="+str(len(afterBuffers[bufferIndex])))
      for offset=0 to len(afterBuffers[bufferIndex])-1 if afterBuffers[bufferIndex][offset]!=previousBuffers[bufferIndex][offset] then print("DIFF offset="+str(offset)+" old="+str(previousBuffers[bufferIndex][offset])+" new="+str(afterBuffers[bufferIndex][offset]));break end if end for
    end if
  end for end if
  // The final real queries hit historical ring slots. Compare that exact
  // lookup with a prefiltered model/surface bucket, without changing caches.
  queries=lastQueries.toArray();buckets=array(len(queries),void)
  for index=0 to len(queries)-1 selected=hotLists.List.withCapacity(64);query=queries[index]
    for slot=0 to cache.transformCount-1 entry=cache.transforms[slot];if entry.modelHandle==query.modelHandle and entry.surfaceIndex==query.surfaceIndex then selected.add(entry) end if end for;buckets[index]=selected.toArray()
  end for
  checksum=0;started=hotWindow.milliseconds()
  for repeat=1 to 1000 for each query in queries if hotLookup(cache.transforms,query)<0 then return error(7685,"latest transform absent from ring") end if;checksum=checksum+1 end for end for
  ringMs=hotWindow.milliseconds()-started;started=hotWindow.milliseconds()
  for repeat=1 to 1000 for index=0 to len(queries)-1 if hotLookup(buckets[index],queries[index])<0 then return error(7685,"prefiltered transform bucket lost a match") end if;checksum=checksum+1 end for end for
  bucketMs=hotWindow.milliseconds()-started
  print("LOOKUP repeats=1000 queries="+str(len(queries))+" ringMs="+str(ringMs)+" bucketMs="+str(bucketMs)+" checksum="+str(checksum))
  started=hotWindow.milliseconds()
  for repeat=1 to 120 for each view in prepared
    left=view.source.refdef.viewaxis[1];up=view.source.refdef.viewaxis[2]
    for each materialBatch in [view.batch.batch,view.batch.depthHackBatch] for each pass in materialBatch.passes
      pass.initialized=false;updated=hotWorld.updatePassAxesFog(pass,view.source.refdef.vieworg,left,up,view.source.refdef.time+repeat*16,void);if updated is error then return updated end if
    end for end for
  end for end for
  print("UPDATEPASS frames=120 stageUpdateMs="+str((hotWindow.milliseconds()-started)/120.0))
  for viewIndex=0 to len(prepared)-1 view=prepared[viewIndex]
    for each pair in [[view.batch.batch,view.batch.geometry],[view.batch.depthHackBatch,view.batch.depthHackGeometry]] for each pass in pair[0].passes
      slots=0;if pass.vertexCache!=void then slots=len(pass.vertexCache.frames) end if
      print("PASSDESC view="+str(viewIndex)+" triangles="+str(pass.commands.count)+" vertexCacheSlots="+str(slots)+" shader="+view.catalog.materials[pass.textureIndex].shaderName+" rgb="+pass.stage.rgbGen+" alpha="+pass.stage.alphaGen+" uv="+pass.stage.tcGen+" deforms="+str(len(pass.deforms)))
    end for end for
  end for
  checked=hotRequire(exactBuffers,"all repacked native stage bytes are exact for unchanged Retail geometry");if checked is error then return checked end if
  hotMatch.shutdown(state);print("PASS: headless Retail scene hotpath diagnosis");return 0
end function
