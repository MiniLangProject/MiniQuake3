// SPDX-License-Identifier: GPL-2.0-or-later
// Productive retained cache versus the original selected builder, headless.
import mq3.renderer.retained_world_batch as retained
import mq3.tests.retained_world as checkBytes
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.playable_world_batch as batches
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_dynamic_lights as lights
import mq3.renderer.playable_fog as fog
import mq3.renderer.bsp_render_data as render
import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.shared.math as qmath
import mq3.platform.playable_window as timer
function retainedProofFail(text) return error(7494,"retained retail: "+text) end function
function retainedProofCompare(actual,expected)
  if actual.sourceTriangles!=expected.sourceTriangles or actual.drawableTriangles!=expected.drawableTriangles or actual.skippedSky!=expected.skippedSky or actual.emittedTriangles!=expected.emittedTriangles or not checkBytes.same(actual.base,expected.base) or len(actual.passes)!=len(expected.passes) then return false end if
  if len(actual.passes)>0 then for index=0 to len(actual.passes)-1
    a=actual.passes[index];b=expected.passes[index]
    if a.textureIndex!=b.textureIndex or a.stage!=b.stage or a.depthEqual!=b.depthEqual or a.primary!=b.primary or a.sort!=b.sort or a.polygonOffset!=b.polygonOffset or not checkBytes.same(a.commands,b.commands) then return false end if
    if len(a.fogIndexes)!=len(b.fogIndexes) then return false end if
    if a.commands.count>len(a.sourcePositions) then return false end if
  end for end if
  if actual.fogBatch!=void and not checkBytes.same(actual.fogBatch.commands,expected.fogBatch.commands) then return false end if
  if actual.dlightBatch!=void and (len(actual.dlightBatch.triangles)!=len(expected.dlightBatch.triangles) or not checkBytes.same(actual.dlightBatch.commands,expected.dlightBatch.commands)) then return false end if
  return true
end function
function retainedProofDrawBytes(batch,origin,axes,now,fogCatalog,lightCatalog)
  left=[0.0-axes[1][0],0.0-axes[1][1],0.0-axes[1][2]]
  for each pass in batch.passes result=batches.updatePassAxesFog(pass,origin,left,axes[2],now,fogCatalog);if result is error then return result end if end for
  if batch.fogBatch!=void and batch.fogBatch.commands.count>0 then fog.update(batch.fogBatch,fogCatalog,origin,axes[0]) end if
  lights.update(batch.dlightBatch,lightCatalog,lights.Light([origin[0]+100.0,origin[1],origin[2]],400.0,[1.0,0.4,0.2],false))
  return true
end function
function retainedProofMap(archive,name)
  map=bsp.load(pk3.read(archive,"maps/"+name+".bsp"));if map is error then return map end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=materials.loadIndexed(archive,map,256,64,scripts[0],scripts[1]);if catalog is error then return catalog end if
  world=selection.buildCacheForPatches(map,render.DEFAULT_PATCH_ERROR,true);if world is error then return world end if
  flags=array(map.counts[1],false);receive=array(map.counts[1],false);twoSided=array(map.counts[1],false)
  for index=0 to len(flags)-1 flags[index]=sky.isSkyShaderIndexed(scripts[0],materials.shaderName(map,index));receive[index]=not flags[index] and (materials.shaderSurfaceFlags(map,index)&0x20000)==0 end for
  for each material in catalog.materials if material.textureIndex>=0 and material.textureIndex<len(twoSided) then twoSided[material.textureIndex]=material.twoSided;if material.sort>3.0 then receive[material.textureIndex]=false end if end if end for
  selection.setTwoSidedTextures(world,twoSided)
  fogCatalog=void;if map.counts[12]>0 then fogCatalog=fog.load(map,scripts[0]);if fogCatalog is error then return fogCatalog end if;fog.assignTexture(fogCatalog,319) end if
  lightCatalog=lights.createCatalog(320);started=timer.milliseconds();cache=retained.create(world,catalog,flags,fogCatalog,lightCatalog,receive);if cache is error then return cache end if;createMs=timer.milliseconds()-started
  cfg=selection.defaults(1280,720);cfg.horizontalFov=90.0;cfg.triangleBudget=world.totalTriangleCount;cfg.lodCurveError=250.0
  camera=viewer.camera([1024.0,1000.0,50.125],90.0,0.0,0.0,0.0);if name!="q3dm1" then camera.position=[0.0,0.0,80.0] end if
  cases=0;referenceMs=0;cacheMs=0;comparedBytes=0;coarseSelections=0
  for frame=0 to 71
    camera.yaw=90.0+frame*5;camera.pitch=(frame%3-1)*10.0;axes=qmath.AnglesToAxis([camera.pitch,camera.yaw,0.0]);cfg.runtime=axes
    cfg.lodCurveError=250.0;if (frame&1)==1 then cfg.lodCurveError=1.0 end if
    chosen=selection.prepareCached(world,camera,cfg);if chosen is error then return chosen end if
    if chosen.selection.rejectedBudget!=0 then return retainedProofFail("budget dropped geometry") end if
    for each face in chosen.selection.faceIndexes if face>=map.counts[13] then coarseSelections=coarseSelections+1 end if end for
    started=timer.milliseconds();actual=retained.select(cache,chosen);if actual is error then return actual end if;cacheMs=cacheMs+timer.milliseconds()-started
    for repetition=0 to 1
      started=timer.milliseconds();expected=batches.buildMaterials(chosen.renderData,catalog,flags);if expected is error then return expected end if
      if fogCatalog!=void then batches.attachFog(expected,chosen.renderData,fogCatalog) end if;batches.attachDynamicLights(expected,chosen.renderData,receive,lightCatalog);referenceMs=referenceMs+timer.milliseconds()-started
      now=1000+frame*113+repetition*17;origin=[camera.position[0]+repetition*0.125,camera.position[1],camera.position[2]]
      result=retainedProofDrawBytes(actual,origin,axes,now,fogCatalog,lightCatalog);if result is error then return result end if
      result=retainedProofDrawBytes(expected,origin,axes,now,fogCatalog,lightCatalog);if result is error then return result end if
      if not retainedProofCompare(actual,expected) then print "map="+name+" frame="+str(frame)+" repetition="+str(repetition);return retainedProofFail("updated selected command/state bytes differ") end if
      cases=cases+1;comparedBytes=comparedBytes+(actual.emittedTriangles+actual.dlightBatch.commands.count)*128
      actual=retained.select(cache,chosen);if actual is error then return actual end if
    end for
  end for
  print "MAP "+name+" cases="+str(cases)+" selections="+str(cache.selections)+" fallbacks="+str(cache.fallbacks)+" staticPrimes="+str(cache.staticPrimes)+" bytesCompared="+str(comparedBytes)+" createMs="+str(createMs)+" referenceBuildMs="+str(referenceMs)+" retainedSelectMs="+str(cacheMs)+" coarsePatchSelections="+str(coarseSelections)
  return cases
end function
function main(args)
  if len(args)!=1 then return retainedProofFail("expected retail pak0.pk3") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  count=retainedProofMap(archive,"q3dm1");if count is error then return count end if
  value=retainedProofMap(archive,"q3ctf1");if value is error then return value end if;count=count+value
  value=retainedProofMap(archive,"q3dm0");if value is error then return value end if;count=count+value
  print "PASS: "+str(count)+" productive retained-world retail differential cases (selected stage/fog/dlight bytes and reuse)"
  return 0
end function
