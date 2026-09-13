// SPDX-License-Identifier: GPL-2.0-or-later
// First native 3D presentation of an unchanged retail cgame QVM frame.
package mq3.client.qvm_preview_app

import mq3.engine.local_qvm_match as match
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_viewer as viewer
import mq3.client.playable_fps_title as fpsTitle
import mq3.platform.playable_window as window
import std.time as time

const WIDTH=640
const HEIGHT=480
const QVM_TEXTURE_FIRST_SLOT=336
const MAX_QVM_TEXTURE_SLOTS=176
const MAX_WORLD_TRIANGLES=20000

function fail(message) return error(7682,"QVM preview: "+message) end function
function largestView(views)
  if views==void or len(views)==0 then return void end if
  result=views[0];area=result.refdef.width*result.refdef.height
  for each view in views nextArea=view.refdef.width*view.refdef.height;if nextArea>area then result=view;area=nextArea end if end for
  return result
end function
function projection(view)
  focal=viewer.focalLength(WIDTH,view.refdef.fovX);if focal is error then return focal end if
  return viewer.Projection(view.refdef.vieworg,view.refdef.viewaxis[1],view.refdef.viewaxis[2],view.refdef.viewaxis[0],WIDTH*0.5,HEIGHT*0.5,focal,1.0)
end function
function uploadLightmaps(map)
  count=map.counts[14];if count>64 then count=64 end if
  if count>0 then for index=0 to count-1
    pixels=renderData.lightmapRgba(map,index);if pixels is error then return pixels end if
    if not window.uploadTexture(index,pixels,128,128) then return fail("could not upload BSP lightmap") end if
  end for end if
  return count
end function
function bootFrame(archive,map,qvmRoot)
  state=match.bootWithQvms(archive,map,1000,qvmRoot);if state is error then return state end if
  joined=match.connectLocal(state,0);if joined is error then return joined end if
  started=false
  for frame=1 to 8
    serverTime=1000+frame*50;command=qworld.userCommand(serverTime,[0,0,0],0,2,127,0,0)
    submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
    advanced=match.runFrame(state,serverTime);if advanced is error then return advanced end if
    snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
    if not started then client=match.bootCgame(state);if client is error then return client end if;started=true end if
    drawn=match.drawCgame(state,serverTime);if drawn is error then return drawn end if
    if len(state.context.errors)>0 then return fail(state.context.errors[0]) end if
  end for
  return state
end function

function runLimited(archive,map,qvmRoot,maxFrames)
  if archive==void or map==void or maxFrames==0 or maxFrames< -1 then return fail("invalid launch input") end if
  state=bootFrame(archive,map,qvmRoot);if state is error then return state end if
  view=largestView(state.context.renderViews);if view==void then match.shutdown(state);return fail("cgame submitted no render view") end if
  expanded=sceneGeometry.buildRecords(view.scene.entities,view.scene.polys,state.context.assetKinds,state.context.modelAssets,view.refdef,8192);if expanded is error then match.shutdown(state);return expanded end if
  qvmCatalog=sceneMaterials.build(archive,expanded.triangles,state.context.assets,state.context.assetKinds,QVM_TEXTURE_FIRST_SLOT,MAX_QVM_TEXTURE_SLOTS);if qvmCatalog is error then match.shutdown(state);return qvmCatalog end if
  qvmBatch=sceneBatch.build(qvmCatalog);if qvmBatch is error then match.shutdown(state);return qvmBatch end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then match.shutdown(state);return scripts end if
  worldCatalog=materials.loadIndexed(archive,map,256,64,scripts[0],scripts[1]);if worldCatalog is error then match.shutdown(state);return worldCatalog end if
  worldGeometry=renderData.all(map,MAX_WORLD_TRIANGLES);if worldGeometry is error then match.shutdown(state);return worldGeometry end if
  skyFlags=array(map.counts[1],false);worldPrepared=worldBatch.buildMaterials(worldGeometry,worldCatalog,skyFlags);if worldPrepared is error then match.shutdown(state);return worldPrepared end if
  camera=projection(view);if camera is error then match.shutdown(state);return camera end if
  opened=window.open(WIDTH,HEIGHT);if opened is error then match.shutdown(state);return opened end if
  uploaded=worldBatch.uploadMaterials(worldCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=uploadLightmaps(map);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  titleState=fpsTitle.create("Original QVM q3dm1",window.milliseconds());window.setTitle(fpsTitle.initialTitle(titleState))
  frames=0
  while not window.shouldClose() and (maxFrames<0 or frames<maxFrames)
    window.poll();if window.keyDown(window.VK_ESCAPE) then break end if
    now=window.milliseconds();window.beginFrame(0,0,0)
    drawn=worldBatch.drawMaterials(worldPrepared,camera,now);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
    drawn=sceneBatch.draw(qvmBatch,camera,now);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
    window.present();frames=frames+1
    nextTitle=fpsTitle.frame(titleState,window.milliseconds());if nextTitle is error then window.shutdown();match.shutdown(state);return nextTitle end if;if nextTitle!=void then window.setTitle(nextTitle) end if
    time.sleep(1)
  end while
  sceneBatch.release(qvmCatalog);worldBatch.releaseMaterials(worldCatalog);window.shutdown();match.shutdown(state)
  print "QVM preview: views="+str(len(state.context.renderViews))+" selected="+str(view.refdef.width)+"x"+str(view.refdef.height)+" models="+str(expanded.modelEntities)+" triangles="+str(len(expanded.triangles))+" textures="+str(len(qvmCatalog.textures))+" frames="+str(frames)
  return 0
end function
function run(archive,map,qvmRoot) return runLimited(archive,map,qvmRoot,-1) end function
