// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-only acceptance probe: a deterministic 360-degree retail world
// rotation. This composes productive renderer modules; it runs no QVM, models,
// gameplay or input commands and must not be reported as complete-game FPS.
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.client.playable_viewer as viewer
import mq3.client.playable_sky as sky
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.retained_world_batch as retainedWorld
import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.playable_fog as fog
import mq3.renderer.playable_dynamic_lights as dlights
import mq3.renderer.qvm_viewport as viewport
import mq3.platform.playable_window as window
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
extern function queryCounter(output as bytes) from "kernel32.dll" symbol "QueryPerformanceCounter" returns i32
extern function queryFrequency(output as bytes) from "kernel32.dll" symbol "QueryPerformanceFrequency" returns i32
const WIDTH=1280
const HEIGHT=720
const FRAMES=360
struct Refdef x y width height fovX fovY vieworg viewaxis end struct
struct Observation frame yaw milliseconds chooseMs buildMs effectsMs renderMs faces retained drawable skippedSky sky world gpu drawCalls rebuilt cluster pvs end struct
function fail(message) window.shutdown();return error(7492,"retail world rotation: "+message) end function
function u64(data) return numeric.readU32(data,0)+numeric.readU32(data,4)*4294967296 end function
function ticks(buffer) queryCounter(buffer);return u64(buffer) end function
function effects(batch,triangles,fogCatalog,lightCatalog,receive)
  // Same productive calls as qvm_preview_app.attachWorldEffects.
  if fogCatalog!=void then value=worldBatch.attachFog(batch,triangles,fogCatalog);if value is error then return value end if end if
  if lightCatalog!=void then value=worldBatch.attachDynamicLights(batch,triangles,receive,lightCatalog);if value is error then return value end if end if
  return batch
end function
function main(args)
  if len(args)<1 or len(args)>2 then return fail("expected retail pak0.pk3 path and optional --reference") end if
  referenceMode=len(args)==2;if referenceMode and args[1]!="--reference" then return fail("unknown renderer probe option") end if
  timer=bytes(8,0);queryFrequency(timer);rate=u64(timer);startup=ticks(timer)
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=materials.loadIndexed(archive,map,materials.BASE_TEXTURE_SLOT_COUNT,materials.BASE_TEXTURE_FIRST_SLOT,scripts[0],scripts[1]);if catalog is error then return catalog end if
  nextSlot=materials.BASE_TEXTURE_FIRST_SLOT+catalog.textureCount
  skyCatalog=sky.loadMap(archive,map,scripts[0],nextSlot,336-nextSlot);if skyCatalog is error then return skyCatalog end if
  if skyCatalog==void or len(skyCatalog.layers)<1 then return fail("q3dm1 retail sky was not resolved") end if
  nextSlot=skyCatalog.firstTextureSlot+skyCatalog.textureCount;fogCatalog=void
  if map.counts[12]>0 then
    fogCatalog=fog.load(map,scripts[0]);if fogCatalog is error then return fogCatalog end if
    assigned=fog.assignTexture(fogCatalog,nextSlot);if assigned is error then return assigned end if;nextSlot=nextSlot+1
  end if
  lightCatalog=dlights.createCatalog(nextSlot);if lightCatalog is error then return lightCatalog end if
  skyFlags=array(map.counts[1],false);receive=array(map.counts[1],false);twoSided=array(map.counts[1],false)
  for index=0 to map.counts[1]-1
    name=materials.shaderName(map,index);if name is error then return name end if
    skyFlags[index]=sky.isSkyShaderIndexed(scripts[0],name)
    flags=materials.shaderSurfaceFlags(map,index);if flags is error then return flags end if
    receive[index]=not skyFlags[index] and (flags&0x20000)==0
  end for
  for each material in catalog.materials
    if material.textureIndex>=0 and material.textureIndex<len(twoSided) then twoSided[material.textureIndex]=material.twoSided;if material.sort>3.0 then receive[material.textureIndex]=false end if end if
  end for
  cfg=selection.defaults(WIDTH,HEIGHT);if cfg is error then return cfg end if;cfg.horizontalFov=90.0
  cache=selection.buildCache(map,cfg.patchError);if cache is error then return cache end if
  cfg.triangleBudget=cache.totalTriangleCount
  configured=selection.setTwoSidedTextures(cache,twoSided);if configured is error then return configured end if
  camera=viewer.camera([1024.0,1000.0,50.125],90.0,0.0,0.0,0.0)
  axes=qmath.AnglesToAxis([0.0,90.0,0.0]);cfg.runtime=axes
  refdef=Refdef(0,0,640,480,90.0,73.739795,camera.position,axes)
  chosen=selection.prepareCached(cache,camera,cfg);if chosen is error then return chosen end if
  retainedCache=void;batch=void
  if referenceMode then
    batch=worldBatch.buildMaterials(chosen.renderData,catalog,skyFlags);if batch is error then return batch end if
    attached=effects(batch,chosen.renderData,fogCatalog,lightCatalog,receive);if attached is error then return attached end if
  else
    retainedCache=retainedWorld.create(cache,catalog,skyFlags,fogCatalog,lightCatalog,receive);if retainedCache is error then return retainedCache end if
    batch=retainedWorld.select(retainedCache,chosen);if batch is error then return batch end if
  end if
  opened=window.open(WIDTH,HEIGHT);if opened is error then return opened end if
  window.inputActivate(false);window.inputClear();window.setTitle("MiniQuake3 | Retail world rotation renderer probe")
  window.glSetSwapInterval(0)
  uploaded=worldBatch.uploadMaterials(catalog);if uploaded is error then window.shutdown();return uploaded end if
  if map.counts[14]>64 then return fail("retail lightmap slots exceed productive limit") end if
  for index=0 to map.counts[14]-1
    pixels=renderData.lightmapRgba(map,index);if pixels is error then window.shutdown();return pixels end if
    if not window.uploadTexture(index,pixels,128,128) then return fail("retail lightmap upload failed") end if
  end for
  uploaded=sky.upload(skyCatalog);if uploaded is error then window.shutdown();return uploaded end if
  if fogCatalog!=void then uploaded=fog.upload(fogCatalog);if uploaded is error then window.shutdown();return uploaded end if end if
  uploaded=dlights.upload(lightCatalog);if uploaded is error then window.shutdown();return uploaded end if
  hardware=window.hardwareRenderer();backend="software";if hardware then backend="hardware" end if
  print "Renderer rotation backend="+backend+" vendor="+window.glInfo(0)+" renderer="+window.glInfo(1)
  path="retained";if referenceMode then path="reference" end if;print "WORLD_CACHE mode="+path
  startupMs=(ticks(timer)-startup)*1000.0/rate
  observations=array(FRAMES,void);faces=chosen.selection.faceIndexes;faceChanges=0;clusterChanges=0;lastCluster=chosen.selection.cameraCluster;retainedTotal=0;worldTotal=0;skyTotal=0;budgetDropped=0
  loopStarted=ticks(timer)
  for frame=0 to FRAMES-1
    started=ticks(timer)
    window.poll();if window.shouldClose() then return fail("window closed during measured rotation") end if
    // Deliberately ignore all desktop input: only this fixed camera schedule
    // can affect selection. A fixed origin does not cross PVS clusters.
    window.inputClear();camera.yaw=90.0+frame;axes=qmath.AnglesToAxis([0.0,camera.yaw,0.0]);cfg.runtime=axes;refdef.viewaxis=axes
    target=viewport.prepare(refdef,640,480,WIDTH,HEIGHT);if target is error then window.shutdown();return target end if
    next=selection.prepareCachedRetained(cache,camera,cfg,chosen);if next is error then window.shutdown();return next end if
    afterChoose=ticks(timer);afterBuild=afterChoose;afterEffects=afterChoose;rebuilt=0
    if not selection.sameFaces(faces,next.selection.faceIndexes) then
      if referenceMode then
        batch=worldBatch.buildMaterials(next.renderData,catalog,skyFlags);if batch is error then window.shutdown();return batch end if
        afterBuild=ticks(timer)
        attached=effects(batch,next.renderData,fogCatalog,lightCatalog,receive);if attached is error then window.shutdown();return attached end if
        afterEffects=ticks(timer)
      else
        batch=retainedWorld.select(retainedCache,next);if batch is error then window.shutdown();return batch end if
        afterBuild=ticks(timer);afterEffects=afterBuild
      end if
      faces=next.selection.faceIndexes;faceChanges=faceChanges+1;rebuilt=1
    end if
    chosen=next;budgetDropped=budgetDropped+chosen.selection.rejectedBudget
    retained=len(chosen.renderData.triangles)
    if retained!=chosen.selection.estimatedTriangleCount or batch.sourceTriangles!=retained or batch.drawableTriangles+batch.skippedSky!=retained then return fail("selected world geometry was lost") end if
    if lastCluster!=chosen.selection.cameraCluster then clusterChanges=clusterChanges+1;lastCluster=chosen.selection.cameraCluster end if
    window.beginFrame(0,0,0);window.clearDepth(0.0)
    skyDraw=sky.drawViewport(skyCatalog,axes,target.area,1000+frame*16);if skyDraw is error then window.shutdown();return skyDraw end if
    worldDraw=worldBatch.drawMaterialsLitViewport(batch,target.projection,1000+frame*16,[],target.area);if worldDraw is error then window.shutdown();return worldDraw end if
    fogDraw=0;if batch.fogBatch!=void then fogDraw=batch.fogBatch.commands.count end if
    if skyDraw!=len(skyCatalog.layers)*sky.GRID_COLUMNS*sky.GRID_ROWS*2 or worldDraw!=batch.emittedTriangles+fogDraw then return fail("retained world/sky commands were not fully submitted") end if
    gpu=0;calls=0;if hardware then gpu=window.hardwareTriangles();calls=window.hardwareDrawCalls();if gpu!=skyDraw+worldDraw then return fail("hardware submission lost world/sky triangles") end if end if
    window.present()
    pvs=0;if chosen.selection.pvsUsed then pvs=1 end if
    row=Observation(frame,camera.yaw,0.0,(afterChoose-started)*1000.0/rate,(afterBuild-afterChoose)*1000.0/rate,(afterEffects-afterBuild)*1000.0/rate,0.0,chosen.selection.selectedSurfaceCount,retained,batch.drawableTriangles,batch.skippedSky,skyDraw,worldDraw,gpu,calls,rebuilt,chosen.selection.cameraCluster,pvs)
    observations[frame]=row;retainedTotal=retainedTotal+retained;worldTotal=worldTotal+worldDraw;skyTotal=skyTotal+skyDraw
    finished=ticks(timer);row.milliseconds=(finished-started)*1000.0/rate;row.renderMs=(finished-afterEffects)*1000.0/rate
  end for
  loopElapsed=(ticks(timer)-loopStarted)*1000.0/rate
  sky.release(skyCatalog);fog.release(fogCatalog);dlights.release(lightCatalog);worldBatch.releaseMaterials(catalog);window.shutdown()
  if budgetDropped!=0 or faceChanges<90 or retainedTotal<=0 then return error(7492,"rotation did not retain geometry and stress frequent faceset rebuilds") end if
  for each row in observations
    print "FRAME|"+str(row.frame)+"|"+str(row.yaw)+"|"+str(row.milliseconds)+"|"+str(row.chooseMs)+"|"+str(row.buildMs)+"|"+str(row.effectsMs)+"|"+str(row.renderMs)+"|"+str(row.faces)+"|"+str(row.retained)+"|"+str(row.drawable)+"|"+str(row.skippedSky)+"|"+str(row.sky)+"|"+str(row.world)+"|"+str(row.gpu)+"|"+str(row.drawCalls)+"|"+str(row.rebuilt)+"|"+str(row.cluster)+"|"+str(row.pvs)
  end for
  selections=0;fallbacks=0;primes=0;if retainedCache!=void then selections=retainedCache.selections;fallbacks=retainedCache.fallbacks;primes=retainedCache.staticPrimes end if
  print "WORLD_CACHE selections="+str(selections)+" fallbacks="+str(fallbacks)+" staticPrimes="+str(primes)
  print "PASS: retail world rotation frames="+str(FRAMES)+" faceChanges="+str(faceChanges)+" pvsClusterChanges="+str(clusterChanges)+" retainedTriangles="+str(retainedTotal)+" worldSubmitted="+str(worldTotal)+" skySubmitted="+str(skyTotal)+" budgetDropped="+str(budgetDropped)+" startupMs="+str(startupMs)+" elapsedMs="+str(loopElapsed)
  return 0
end function
