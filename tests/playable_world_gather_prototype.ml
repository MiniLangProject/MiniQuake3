// SPDX-License-Identifier: GPL-2.0-or-later
// Headless proof only: full-map retained streams gathered in selected BSP
// face order, compared against the unchanged production builder API.
import mq3.tests.retained_world as prototype
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.native_world_selection as nativeWorld
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_fog as fog
import mq3.renderer.bsp_render_data as render
import mq3.client.playable_sky as sky
import mq3.client.playable_viewer as viewer
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import mq3.renderer.shader_parser as shader
import mq3.platform.playable_window as timer
function fail(text) return error(7493,"retained prototype proof: "+text) end function
function subset(cache,indexes)
  chosen=selection.Selection(indexes,0,len(indexes),0,false,0,0,0,0,0,0,0)
  return selection.cachedRenderData(cache,chosen)
end function
function mapProof(archive,mapName)
  map=bsp.load(pk3.read(archive,"maps/"+mapName+".bsp"));if map is error then return map end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=materials.loadIndexed(archive,map,256,64,scripts[0],scripts[1]);if catalog is error then return catalog end if
  world=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if world is error then return world end if
  allFaces=array(len(world.trianglesByFace),0);for index=0 to len(allFaces)-1 allFaces[index]=index end for
  data=subset(world,allFaces);if data is error then return data end if
  skyFlags=array(map.counts[1],false);twoSided=array(map.counts[1],false)
  for index=0 to len(skyFlags)-1 skyFlags[index]=sky.isSkyShaderIndexed(scripts[0],materials.shaderName(map,index)) end for
  for each material in catalog.materials if material.textureIndex>=0 and material.textureIndex<len(twoSided) then twoSided[material.textureIndex]=material.twoSided end if end for
  selection.setTwoSidedTextures(world,twoSided)
  fogCatalog=void;if map.counts[12]>0 then fogCatalog=fog.load(map,scripts[0]);if fogCatalog is error then return fogCatalog end if;assigned=fog.assignTexture(fogCatalog,319);if assigned is error then return assigned end if end if
  started=timer.milliseconds();retained=prototype.build(data,catalog,skyFlags,len(allFaces),fogCatalog);if retained is error then return retained end if;cacheMs=timer.milliseconds()-started
  cfg=selection.defaults(1280,720);cfg.horizontalFov=90.0;cfg.triangleBudget=world.totalTriangleCount
  camera=viewer.camera([1024.0,1000.0,50.125],90.0,0.0,0.0,0.0)
  if mapName!="q3dm1" then camera.position=[0.0,0.0,80.0] end if
  cases=0;fallbacks=0;recordBytes=0;referenceMs=0;gatherMs=0;facesChanged=0;oldFaces=void
  for frame=0 to 71
    camera.yaw=90.0+frame*5;camera.pitch=(frame%3-1)*10.0;axes=qmath.AnglesToAxis([camera.pitch,camera.yaw,0.0]);cfg.runtime=axes
    chosen=selection.chooseCached(world,camera,cfg);if chosen is error then return chosen end if
    if chosen.rejectedBudget!=0 then return fail("world triangle budget dropped surfaces") end if
    if not selection.sameFaces(oldFaces,chosen.faceIndexes) then facesChanged=facesChanged+1 end if;oldFaces=chosen.faceIndexes
    selectedData=selection.cachedRenderData(world,chosen);if selectedData is error then return selectedData end if
    started=timer.milliseconds();reference=worldBatch.buildMaterials(selectedData,catalog,skyFlags);if reference is error then return reference end if
    if fogCatalog!=void then attached=worldBatch.attachFog(reference,selectedData,fogCatalog);if attached is error then return attached end if end if
    referenceMs=referenceMs+timer.milliseconds()-started
    packed=nativeWorld.packIndexes(chosen.faceIndexes)
    started=timer.milliseconds();gathered=prototype.gather(retained,packed,len(chosen.faceIndexes),false);if gathered is error then return gathered end if;gatherMs=gatherMs+timer.milliseconds()-started
    rawCount=gathered
    matched=prototype.match(retained,reference,false);if matched is error then print "map="+mapName+" frame="+str(frame)+" raw";return matched end if
    now=1000+frame*113;left=[0.0-axes[1][0],0.0-axes[1][1],0.0-axes[1][2]]
    updated=prototype.updateAll(retained,camera.position,left,axes[2],axes[0],now,fogCatalog);if updated is error then return updated end if
    for each pass in reference.passes updated=worldBatch.updatePassAxesFog(pass,camera.position,left,axes[2],now,fogCatalog);if updated is error then return updated end if end for
    if reference.fogBatch!=void and reference.fogBatch.commands.count>0 then fog.update(reference.fogBatch,fogCatalog,camera.position,axes[0]) end if
    gathered=prototype.gather(retained,packed,len(chosen.faceIndexes),true);if gathered is error then return gathered end if
    matched=prototype.match(retained,reference,true);if matched is error then print "map="+mapName+" frame="+str(frame)+" updated";return matched end if
    compared=gathered
    for each stream in retained.stages if not stream.supportsUpdates then compared=compared-stream.draw.count end if end for
    fallbacks=fallbacks+matched;cases=cases+2;recordBytes=recordBytes+(rawCount+compared)*128
  end for
  // Reverse PVS-discovered face order deliberately. Sorting selected faces is
  // forbidden even when it would make a full-map stream contiguous.
  chosen=selection.chooseCached(world,camera,cfg);reverse=array(len(chosen.faceIndexes),0)
  if len(reverse)>0 then for index=0 to len(reverse)-1 reverse[index]=chosen.faceIndexes[len(reverse)-1-index] end for end if
  reversedData=subset(world,reverse);reference=worldBatch.buildMaterials(reversedData,catalog,skyFlags);if reference is error then return reference end if
  if fogCatalog!=void then attached=worldBatch.attachFog(reference,reversedData,fogCatalog);if attached is error then return attached end if end if
  packed=nativeWorld.packIndexes(reverse);gathered=prototype.gather(retained,packed,len(reverse),false);if gathered is error then return gathered end if
  matched=prototype.match(retained,reference,false);if matched is error then return matched end if;cases=cases+1
  print "MAP "+mapName+" cases="+str(cases)+" fullTriangles="+str(len(data.triangles))+" fullPasses="+str(len(retained.stages))+" facesChanged="+str(facesChanged)+" autoFallbackStages="+str(fallbacks)+" bytesCompared="+str(recordBytes)+" cacheBuildMs="+str(cacheMs)+" referenceBuildMs="+str(referenceMs)+" gatherMs="+str(gatherMs)
  return cases
end function
function syntheticProof()
  image=materials.Image(1,1,bytes([255,255,255,255]));wave=shader.Wave(5,0.2,0.7,0.3,1.25)
  stage=materials.RuntimeStage(["effect"],[image],[81],0.0,[materials.UvMod("scroll",0.13,-0.23,0.0,0.0,0.0,0.0,shader.blankWave())],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"environment","wave",wave,"wave",wave,[255,255,255,255],false,false,false,false,256.0,[])
  deform=shader.Deform("wave",0.02,wave,[0.0,0.0,0.0],0.0,0.0,0.0)
  material=materials.Material(0,"synthetic","effect",image,81,[stage],[deform],true,3.0,false,false,0.0,0.0)
  catalog=materials.Catalog([material],0,1,1,1,0,1);triangles=array(6,void)
  for index=0 to 5
    a=render.RenderVertex([index*3.0,0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0,1.0],[20+index,40,60,255],[255,255,255,255],[0.0,0.0],0.0,index*3)
    b=render.RenderVertex([index*3.0+1.0,0.0,0.0],[1.0,0.0],[0.0,0.0],[0.0,0.0,1.0],[50,80+index,90,128],[255,255,255,255],[0.0,0.0],0.0,index*3+1)
    c=render.RenderVertex([index*3.0,1.0,0.0],[0.0,1.0],[0.0,0.0],[0.0,0.0,1.0],[100,140,180+index,64],[255,255,255,255],[0.0,0.0],0.0,index*3+2)
    triangles[index]=render.RenderTriangle([a,b,c],0,-1,0,index>>1,index)
  end for
  data=render.RenderData(triangles,3,6,0,false,0);retained=prototype.build(data,catalog,[false],3,void);if retained is error then return retained end if
  order=[2,0];chosen=render.RenderData([triangles[4],triangles[5],triangles[0],triangles[1]],2,4,0,false,0)
  reference=worldBatch.buildMaterials(chosen,catalog,[false]);packed=nativeWorld.packIndexes(order)
  origin=[2.0,-5.0,8.0];left=[0.0,1.0,0.0];up=[0.0,0.0,1.0];forward=[1.0,0.0,0.0]
  prototype.updateAll(retained,origin,left,up,forward,2113,void)
  for each pass in reference.passes worldBatch.updatePassAxesFog(pass,origin,left,up,2113,void) end for
  result=prototype.gather(retained,packed,len(order),true);if result is error then return result end if
  matched=prototype.match(retained,reference,true);if matched is error then return matched end if
  material.deforms=[shader.Deform("autosprite",0.0,shader.blankWave(),[0.0,0.0,0.0],0.0,0.0,0.0)]
  sprite=prototype.build(data,catalog,[false],3,void);if sprite is error then return sprite end if
  if sprite.stages[0].supportsUpdates then return fail("autosprite pair dependence must retain the production fallback") end if
  print "SYNTHETIC dynamic UV/wave/environment/deform byte parity; autosprite updates explicitly require fallback"
  return 1
end function
function main(args)
  if len(args)!=1 then return fail("expected retail pak0.pk3 path") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  count=mapProof(archive,"q3dm1");if count is error then return count end if
  more=mapProof(archive,"q3ctf1");if more is error then return more end if;count=count+more
  more=syntheticProof();if more is error then return more end if;count=count+more
  print "PASS: "+str(count)+" test-only retained-world gather differential cases; production unchanged"
  return 0
end function
