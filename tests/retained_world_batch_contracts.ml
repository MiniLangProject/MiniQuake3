// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.renderer.retained_world_batch as retained
import mq3.renderer.playable_world_batch as reference
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_dynamic_lights as lights
import mq3.renderer.playable_fog as fog
import mq3.renderer.bsp_render_data as render
import mq3.renderer.shader_parser as shader
import mq3.renderer.world_surface_selection as selection
import mq3.tests.retained_world as checkBytes
struct World totalTriangleCount trianglesByFace faceTextureIndexes faceKinds end struct
function retainedFixtureReq(value,text) if not value then return error(7494,text) end if;return 1 end function
function retainedFixtureVertex(x,y,u,v,id) return render.RenderVertex([x,y,1.0],[u,v],[u*0.5,v*0.5],[0.0,0.0,1.0],[100+id,130,170,255],[255,255,255,255],[0.0,0.0],0.0,id) end function
function retainedFixtureCompare(a,b)
  if not checkBytes.same(a.base,b.base) or len(a.passes)!=len(b.passes) then return false end if
  if len(a.passes)>0 then for index=0 to len(a.passes)-1
    if not checkBytes.same(a.passes[index].commands,b.passes[index].commands) or a.passes[index].textureIndex!=b.passes[index].textureIndex then return false end if
  end for end if
  if a.fogBatch!=void and not checkBytes.same(a.fogBatch.commands,b.fogBatch.commands) then return false end if
  return true
end function
function retainedFixtureSelected(world,faces)
  choice=selection.Selection(faces,0,len(faces),0,false,0,0,0,0,0,0,0)
  return selection.PreparedWorld(choice,selection.cachedRenderData(world,choice))
end function
function retainedFixtureUpdate(batch,origin,now,fogCatalog)
  for each pass in batch.passes reference.updatePassAxesFog(pass,origin,[0.0,1.0,0.0],[0.0,0.0,1.0],now,fogCatalog) end for
  if batch.fogBatch!=void and batch.fogBatch.commands.count>0 then fog.update(batch.fogBatch,fogCatalog,origin,[1.0,0.0,0.0]) end if
  return batch
end function
function main(args)
  count=0;image=materials.Image(1,1,bytes([255,255,255,255]));wave=shader.Wave(5,0.2,0.7,0.3,1.25)
  effect=materials.RuntimeStage(["effect"],[image],[81],0.0,[materials.UvMod("scroll",0.13,-0.23,0.0,0.0,0.0,0.0,shader.blankWave())],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"environment","wave",wave,"wave",wave,[255,255,255,255],false,false,false,false,256.0,[])
  fixedStage=materials.RuntimeStage(["clamp"],[image],[82],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_GE128,"texture","identity",shader.blankWave(),"identity",shader.blankWave(),[255,255,255,255],false,true,true,false,256.0,[])
  dynamicMaterial=materials.Material(0,"dynamic","effect",image,81,[effect],[],true,3.0,false,false,0.0,0.0)
  fixedMaterial=materials.Material(1,"fixed","clamp",image,82,[fixedStage],[],true,3.0,false,false,0.0,0.0)
  catalog=materials.Catalog([dynamicMaterial,fixedMaterial],0,2,2,2,0,2);byFace=array(3,void)
  for face=0 to 2
    a=retainedFixtureVertex(face*3.0,0.0,0.0,0.0,face*4);b=retainedFixtureVertex(face*3.0+1.0,0.0,1.0,0.0,face*4+1);c=retainedFixtureVertex(face*3.0+1.0,1.0,1.0,1.0,face*4+2);d=retainedFixtureVertex(face*3.0,1.0,0.0,1.0,face*4+3)
    texture=0;if face==2 then texture=1 end if;fogIndex=0;if face==0 then fogIndex=1 end if
    byFace[face]=[render.RenderTriangle([a,b,c],texture,-1,fogIndex,face,0),render.RenderTriangle([a,c,d],texture,-1,fogIndex,face,1)]
  end for
  world=World(6,byFace,[0,0,1],[1,1,1]);fogCatalog=fog.Catalog([void,fog.Fog("fog",[0.2,0.4,0.7],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false)],319,void);lightCatalog=lights.createCatalog(320)
  cache=retained.create(world,catalog,[false,false],fogCatalog,lightCatalog,[true,true]);if cache is error then return cache end if
  count=count+retainedFixtureReq(cache.enabled and cache.staticPrimes==1,"bounded one-map cache primes only its static stage")
  orders=[[2,0],[1,2],[0,1,2],[],[0],[2,1,0],[1,2],[0,2]];serial=0
  for test=0 to len(orders)-1
    chosen=retainedFixtureSelected(world,orders[test]);actual=retained.select(cache,chosen);if actual is error then return actual end if
    before=cache.selections;again=retained.select(cache,chosen);count=count+retainedFixtureReq(cache.selections==before and again==actual,"identical faces reuse complete selected batch")
    expected=reference.buildMaterials(chosen.renderData,catalog,[false,false]);reference.attachFog(expected,chosen.renderData,fogCatalog);reference.attachDynamicLights(expected,chosen.renderData,[true,true],lightCatalog)
    origin=[test*0.25,-5.0,8.0];now=2113+test*173
    retainedFixtureUpdate(actual,origin,now,fogCatalog);retainedFixtureUpdate(expected,origin,now,fogCatalog)
    count=count+retainedFixtureReq(retainedFixtureCompare(actual,expected),"selected source prefixes produce exact dynamic/static/fog bytes across face order changes")
    for each pass in actual.passes
      count=count+retainedFixtureReq(pass.commands.count<=len(pass.sourcePositions) and len(pass.fogIndexes)==pass.commands.count,"active count and exact fog metadata length")
      if pass.textureIndex==0 then count=count+retainedFixtureReq(pass.cacheSerial>serial,"vertex cache epochs remain monotonic after reselection");serial=pass.cacheSerial end if
    end for
    light=lights.Light([2.0,0.0,1.0],32.0,[1.0,0.5,0.25],false)
    lights.update(actual.dlightBatch,lightCatalog,light);lights.update(expected.dlightBatch,lightCatalog,light)
    count=count+retainedFixtureReq(checkBytes.same(actual.dlightBatch.commands,expected.dlightBatch.commands),"selected dynamic-light sources and commands remain exact")
  end for
  huge=World(65537,byFace,[0,0,1],[1,1,1]);large=retained.create(huge,catalog,[false,false],fogCatalog,lightCatalog,[true,true]);count=count+retainedFixtureReq(not large.enabled,"full map above command capacity preserves selected legacy path")
  chosen=retainedFixtureSelected(world,[0]);actual=retained.select(large,chosen);count=count+retainedFixtureReq(large.fallbacks==1 and actual.sourceTriangles==2,"large-map fallback retains small selected geometry")
  emptyWorld=World(0,[],[],[]);emptyCache=retained.create(emptyWorld,catalog,[false,false],fogCatalog,lightCatalog,[true,true]);if emptyCache is error then return emptyCache end if
  count=count+retainedFixtureReq(emptyCache.enabled and emptyCache.staticPrimes==0,"empty world creates a supported empty retained cache")
  emptyChosen=retainedFixtureSelected(emptyWorld,[]);emptyBatch=retained.select(emptyCache,emptyChosen);if emptyBatch is error then return emptyBatch end if
  count=count+retainedFixtureReq(emptyBatch.sourceTriangles==0 and emptyBatch.base.count==0 and len(emptyBatch.passes)==0 and emptyBatch.fogBatch.commands.count==0 and len(emptyBatch.dlightBatch.triangles)==0,"empty map selects no command/source rows without descending zero-length loops")
  dynamicMaterial.deforms=[shader.Deform("autosprite",0.0,shader.blankWave(),[0.0,0.0,0.0],0.0,0.0,0.0)]
  sprite=retained.create(world,catalog,[false,false],fogCatalog,lightCatalog,[true,true]);actual=retained.select(sprite,chosen);count=count+retainedFixtureReq(sprite.fallbacks==1 and actual.sourceTriangles==2,"autosprite paired topology uses original selected builder")
  dynamicMaterial.deforms=[];dynamicMaterial.sort=1.0
  portal=retained.create(world,catalog,[false,false],fogCatalog,lightCatalog,[true,true]);actual=retained.select(portal,chosen);count=count+retainedFixtureReq(portal.fallbacks==1 and actual.sourceTriangles==2,"portal material path uses original selected builder")
  print "PASS: "+str(count)+" retained-world contracts (sparse updates, epochs, exact fog/light sources, empty/reordered sets, capacity/auto/portal fallback)"
  return 0
end function
