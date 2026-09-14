// SPDX-License-Identifier: GPL-2.0-or-later
// First native 3D presentation of an unchanged retail cgame QVM frame.
package mq3.client.qvm_preview_app

import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as localQvmUi
import mq3.client.original_ui_session as uiSession
import mq3.client.cinematic_runtime as cinematics
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.qvm_viewport as qvmViewport
import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.qvm_video_materials as qvmVideo
import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.world_surface_selection as worldSelection
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_sky as playableSky
import mq3.renderer.playable_fog as playableFog
import mq3.renderer.playable_dynamic_lights as dynamicLights
import mq3.client.playable_viewer as viewer
import mq3.client.playable_fps_title as fpsTitle
import mq3.platform.playable_window as window
import mq3.platform.playable_ambient as audioOutput
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.command_queue as renderCommands
import mq3.audio.qvm_sound_assets as qvmSoundAssets
import mq3.audio.qvm_playback as qvmPlayback
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import std.time as time

const WIDTH=1280
const HEIGHT=720
const QVM_TEXTURE_FIRST_SLOT=336
const MAX_QVM_TEXTURE_SLOTS=64
const QVM_2D_TEXTURE_FIRST_SLOT=400
const MAX_QVM_2D_TEXTURE_SLOTS=96
const CINEMATIC_TEXTURE_FIRST_SLOT=496
const MAX_WORLD_TRIANGLES=20000
const SOURCE_WIDTH=1280
const SOURCE_HEIGHT=720

struct PreparedView source geometry batch target end struct
struct NativeInput mouse end struct
struct PipelineProfile expansion material batch end struct
struct ScreenPoint x y depth end struct

function fail(message) return error(7682,"QVM preview: "+message) end function
function largestView(views)
  if views==void or len(views)==0 then return void end if
  result=views[0];area=result.refdef.width*result.refdef.height
  for each view in views nextArea=view.refdef.width*view.refdef.height;if nextArea>area then result=view;area=nextArea end if end for
  return result
end function
function selectionCamera(view)
  angles=qmath.vectoangles(view.refdef.viewaxis[0]);return viewer.camera(view.refdef.vieworg,angles[1],angles[0],0.0,0.0)
end function
function prepareViews(views,catalog,archive,assets,kinds,frameCache,grid,videoManager,previousViews,profile)
  result=[];viewIndex=0
  for each view in views
    started=0;if profile!=void then started=window.milliseconds() end if
    if grid!=void then ignored=lightGrid.setDynamicLights(grid,view.scene.dlights) end if
    previousGeometry=void;if previousViews!=void and viewIndex<len(previousViews) then previousGeometry=previousViews[viewIndex].geometry end if
    expanded=sceneGeometry.buildRecordsWithFrameCacheReuse(view.scene.entities,view.scene.polys,kinds,assets,view.refdef,8192,frameCache,grid,previousGeometry);if expanded is error then return expanded end if
    afterExpansion=0;if profile!=void then afterExpansion=window.milliseconds();profile.expansion=profile.expansion+afterExpansion-started end if
    refreshed=sceneMaterials.refresh(catalog,archive,expanded.triangles,assets,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS);if refreshed is error then return refreshed end if
    boundVideo=qvmVideo.bindCatalog(videoManager,catalog,view.refdef.time);if boundVideo is error then return boundVideo end if
    afterMaterial=0;if profile!=void then afterMaterial=window.milliseconds();profile.material=profile.material+afterMaterial-afterExpansion end if
    previous=void;if previousViews!=void and viewIndex<len(previousViews) then previous=previousViews[viewIndex].batch end if;batch=void
    if previous==void then batch=sceneBatch.build(catalog) else batch=sceneBatch.refresh(previous,catalog) end if;if batch is error then return batch end if
    if profile!=void then profile.batch=profile.batch+window.milliseconds()-afterMaterial end if
    target=qvmViewport.prepare(view.refdef,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if target is error then return target end if
    result=result+[PreparedView(view,expanded,batch,target)];viewIndex=viewIndex+1
  end for
  return result
end function
function angleCommand(degrees,deltaAngle)
  return numeric.i16((numeric.trunc32(degrees*65536.0/360.0)&65535)-deltaAngle)
end function
function movementAxis(positive,negative)
  if positive and not negative then return 127 end if
  if negative and not positive then return -127 end if
  return 0
end function
function nativeKeyDown(input,key) return window.keyDown(key) end function
function nativeMouseDelta(input) return input.mouse end function
function advanceGameTick(state,serverTime,yaw,pitch,forward,right,up,attack)
  delta=[0,0,0];if state.context.latestSnapshot!=void then delta=state.context.latestSnapshot.playerState.delta_angles end if
  buttons=0;if attack then buttons=1 end if
  command=qworld.userCommand(serverTime,[angleCommand(pitch,delta[0]),angleCommand(yaw,delta[1]),angleCommand(0.0,delta[2])],buttons,2,forward,right,up)
  submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
  advanced=match.runFrame(state,serverTime);if advanced is error then return advanced end if
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  return snapshot
end function
function drawFrame(state,serverTime)
  renderCommands.reset(state.context.renderQueue);state.context.soundCommands=[]
  drawn=match.drawCgame(state,serverTime);if drawn is error then return drawn end if
  if len(state.context.errors)>0 then return fail(state.context.errors[0]) end if
  return drawn
end function
function uploadLightmaps(map)
  count=map.counts[14];if count>64 then count=64 end if
  if count>0 then for index=0 to count-1
    pixels=renderData.lightmapRgba(map,index);if pixels is error then return pixels end if
    if not window.uploadTexture(index,pixels,128,128) then return fail("could not upload BSP lightmap") end if
  end for end if
  return count
end function
function attachWorldEffects(batch,triangles,fogCatalog,dlightCatalog,dlightReceiveFlags)
  if fogCatalog!=void then attached=worldBatch.attachFog(batch,triangles,fogCatalog);if attached is error then return attached end if end if
  if dlightCatalog!=void then attached=worldBatch.attachDynamicLights(batch,triangles,dlightReceiveFlags,dlightCatalog);if attached is error then return attached end if end if
  return batch
end function
function drawCinematics(state)
  draws=cinematics.takeDraws(state.context.cinematics);drawn=0
  for each draw in draws
    presentation=cinematics.presentation(draw,640,480,WIDTH,HEIGHT);if presentation is error then return presentation end if
    slot=CINEMATIC_TEXTURE_FIRST_SLOT+draw.handle
    if presentation.dirty and not window.uploadTextureNoMip(slot,presentation.pixels,presentation.sourceWidth,presentation.sourceHeight) then return fail("could not upload cinematic frame") end if
    x=presentation.x;y=presentation.y;w=presentation.width;h=presentation.height;depth=0.001
    a=ScreenPoint(x,y,depth);b=ScreenPoint(x+w,y,depth);c=ScreenPoint(x+w,y+h,depth);d=ScreenPoint(x,y+h,depth)
    stateValue=multitexture.setState(multitexture.BLEND_OPAQUE,false,false);if stateValue is error then return stateValue end if
    stateValue=multitexture.setTextureClamp(true);if stateValue is error then return stateValue end if
    window.drawTriangle(slot,a,[0.0,0.0],1.0,b,[1.0,0.0],1.0,c,[1.0,1.0],1.0,255,255,255)
    window.drawTriangle(slot,c,[1.0,1.0],1.0,d,[0.0,1.0],1.0,a,[0.0,0.0],1.0,255,255,255);drawn=drawn+1
  end for
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
function collectCinematicAudio(state,queue)
  result=queue
  for handle=0 to cinematics.MAX_HANDLES-1 chunks=cinematics.takeAudio(state.context.cinematics,handle);for each chunk in chunks result=result+[chunk.samples] end for end for
  return result
end function
function releaseCinematics()
  for handle=0 to cinematics.MAX_HANDLES-1 window.releaseTexture(CINEMATIC_TEXTURE_FIRST_SLOT+handle) end for;return void
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
    renderCommands.reset(state.context.renderQueue);state.context.soundCommands=[];drawn=match.drawCgame(state,serverTime);if drawn is error then return drawn end if
    if len(state.context.errors)>0 then return fail(state.context.errors[0]) end if
  end for
  return state
end function

function runLimited(archive,map,qvmRoot,maxFrames)
  if archive==void or map==void or maxFrames==0 or maxFrames< -1 then return fail("invalid launch input") end if
  state=bootFrame(archive,map,qvmRoot);if state is error then return state end if
  bootedUi=match.bootUi(state);if bootedUi is error then match.shutdown(state);return bootedUi end if
  videoManager=qvmVideo.create(state.context.cinematics,CINEMATIC_TEXTURE_FIRST_SLOT,cinematics.MAX_HANDLES);if videoManager is error then match.shutdown(state);return videoManager end if
  frameCache=sceneGeometry.createFrameCache(void,256);if frameCache is error then match.shutdown(state);return frameCache end if
  view=largestView(state.context.renderViews);if view==void then match.shutdown(state);return fail("cgame submitted no render view") end if
  qvmCatalog=sceneMaterials.build(archive,[],state.context.assets,state.context.assetKinds,QVM_TEXTURE_FIRST_SLOT,MAX_QVM_TEXTURE_SLOTS);if qvmCatalog is error then match.shutdown(state);return qvmCatalog end if
  preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,void,void);if preparedViews is error then match.shutdown(state);return preparedViews end if
  hudCatalog=qvm2d.build(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,QVM_2D_TEXTURE_FIRST_SLOT,MAX_QVM_2D_TEXTURE_SLOTS,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if hudCatalog is error then match.shutdown(state);return hudCatalog end if
  boundVideo=qvmVideo.bindCatalog(videoManager,hudCatalog,state.context.now);if boundVideo is error then match.shutdown(state);return boundVideo end if
  soundCatalog=qvmSoundAssets.load(archive,state.context.assets,state.context.assetKinds);if soundCatalog is error then match.shutdown(state);return soundCatalog end if
  audio=qvmPlayback.create(soundCatalog,22050,4096);if audio is error then match.shutdown(state);return audio end if
  applied=qvmPlayback.apply(audio,state.context.soundCommands);if applied is error then match.shutdown(state);return applied end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then match.shutdown(state);return scripts end if
  worldCatalog=materials.loadIndexed(archive,map,256,64,scripts[0],scripts[1]);if worldCatalog is error then match.shutdown(state);return worldCatalog end if
  boundVideo=qvmVideo.bindCatalog(videoManager,worldCatalog,state.context.now);if boundVideo is error then match.shutdown(state);return boundVideo end if
  nextWorldTextureSlot=64+worldCatalog.textureCount
  skyCatalog=void;availableWorldTextureSlots=QVM_TEXTURE_FIRST_SLOT-nextWorldTextureSlot
  if availableWorldTextureSlots>=playableSky.REQUIRED_TEXTURES then loadedSky=try(playableSky.loadMap(archive,map,scripts[0],nextWorldTextureSlot,availableWorldTextureSlots));if not (loadedSky is error) and loadedSky!=void then skyCatalog=loadedSky;nextWorldTextureSlot=skyCatalog.firstTextureSlot+skyCatalog.textureCount end if end if
  fogCatalog=void
  if map.counts[12]>0 and nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedFog=try(playableFog.load(map,scripts[0]));if not (loadedFog is error) then assignedFog=playableFog.assignTexture(loadedFog,nextWorldTextureSlot);if not (assignedFog is error) then fogCatalog=loadedFog;nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if end if
  dlightCatalog=void
  if nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedDlights=try(dynamicLights.createCatalog(nextWorldTextureSlot));if not (loadedDlights is error) then dlightCatalog=loadedDlights;nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if
  worldConfig=worldSelection.defaults(WIDTH,HEIGHT);if worldConfig is error then match.shutdown(state);return worldConfig end if;worldConfig.horizontalFov=view.refdef.fovX;worldConfig.triangleBudget=MAX_WORLD_TRIANGLES
  worldCache=worldSelection.buildCache(map,worldConfig.patchError);if worldCache is error then match.shutdown(state);return worldCache end if
  twoSided=array(map.counts[1],false);for each material in worldCatalog.materials if material.textureIndex>=0 and material.textureIndex<len(twoSided) then twoSided[material.textureIndex]=material.twoSided end if end for;configured=worldSelection.setTwoSidedTextures(worldCache,twoSided);if configured is error then match.shutdown(state);return configured end if
  selected=worldSelection.prepareCached(worldCache,selectionCamera(view),worldConfig);if selected is error then match.shutdown(state);return selected end if
  skyFlags=array(map.counts[1],false);dlightReceiveFlags=array(map.counts[1],false)
  for textureIndex=0 to map.counts[1]-1 mapShader=materials.shaderName(map,textureIndex);if mapShader is error then match.shutdown(state);return mapShader end if;skyFlags[textureIndex]=playableSky.isSkyShaderIndexed(scripts[0],mapShader);surfaceFlags=materials.shaderSurfaceFlags(map,textureIndex);if surfaceFlags is error then match.shutdown(state);return surfaceFlags end if;dlightReceiveFlags[textureIndex]=not skyFlags[textureIndex] and (surfaceFlags&0x20000)==0 end for
  for each material in worldCatalog.materials if material.textureIndex>=0 and material.textureIndex<len(dlightReceiveFlags) and material.sort>3.0 then dlightReceiveFlags[material.textureIndex]=false end if end for
  worldPrepared=worldBatch.buildMaterials(selected.renderData,worldCatalog,skyFlags);if worldPrepared is error then match.shutdown(state);return worldPrepared end if
  attached=attachWorldEffects(worldPrepared,selected.renderData,fogCatalog,dlightCatalog,dlightReceiveFlags);if attached is error then match.shutdown(state);return attached end if;selectedFaces=selected.selection.faceIndexes
  opened=window.open(WIDTH,HEIGHT);if opened is error then match.shutdown(state);return opened end if
  nativeInput=NativeInput([0,0]);ui=localQvmUi.attach(state,nativeInput,nativeKeyDown,nativeMouseDelta);if ui is error then window.shutdown();match.shutdown(state);return ui end if
  uploaded=worldBatch.uploadMaterials(worldCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=qvm2d.upload(hudCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  if skyCatalog!=void then uploaded=playableSky.upload(skyCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  if fogCatalog!=void then uploaded=playableFog.upload(fogCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  if dlightCatalog!=void then uploaded=dynamicLights.upload(dlightCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  uploaded=uploadLightmaps(map);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  audioStarted=audioOutput.init(22050);if audioStarted is error then window.shutdown();match.shutdown(state);return audioStarted end if
  titleState=fpsTitle.create("Original QVM q3dm1",window.milliseconds());window.setTitle(fpsTitle.initialTitle(titleState))
  frames=0;yaw=state.context.latestSnapshot.playerState.viewangles[1];pitch=state.context.latestSnapshot.playerState.viewangles[0];uploadedQvmTextures=len(qvmCatalog.textures);cinematicAudio=[];simulationMs=0;gameMs=0;cgameMs=0;uiMs=0;geometryMs=0;batchMs=0;renderMs=0;pipelineProfile=PipelineProfile(0,0,0);simulationTicks=0;simulationTime=state.context.now;simulationStart=simulationTime;realStart=window.milliseconds()
  while not window.shouldClose() and (maxFrames<0 or frames<maxFrames)
    window.poll();nativeInput.mouse=window.mouseDelta();menuActive=uiSession.active(ui)
    if not menuActive then yaw=yaw+nativeInput.mouse[0]*0.12;pitch=pitch-nativeInput.mouse[1]*0.12;if pitch>89.0 then pitch=89.0 end if;if pitch< -89.0 then pitch=-89.0 end if end if
    forward=0;right=0;up=0;attack=false
    if not menuActive then forward=movementAxis(window.keyDown(window.VK_W),window.keyDown(window.VK_S));right=movementAxis(window.keyDown(window.VK_D),window.keyDown(window.VK_A));if window.keyDown(window.VK_SPACE) then up=127 end if;attack=window.keyDown(window.VK_LBUTTON) end if
    startedAt=window.milliseconds();serverTime=simulationStart+startedAt-realStart;steps=0
    while simulationTime+50<=serverTime and steps<8 simulationTime=simulationTime+50;advanced=advanceGameTick(state,simulationTime,yaw,pitch,forward,right,up,attack);if advanced is error then window.shutdown();match.shutdown(state);return advanced end if;steps=steps+1;simulationTicks=simulationTicks+1 end while
    afterGame=window.milliseconds();gameMs=gameMs+afterGame-startedAt
    drawnFrame=drawFrame(state,serverTime);if drawnFrame is error then window.shutdown();match.shutdown(state);return drawnFrame end if
    afterCgame=window.milliseconds();cgameMs=cgameMs+afterCgame-afterGame
    uiFrame=uiSession.frame(ui,serverTime);if uiFrame is error then window.shutdown();match.shutdown(state);return uiFrame end if
    cinematicAudio=collectCinematicAudio(state,cinematicAudio)
    afterSimulation=window.milliseconds();uiMs=uiMs+afterSimulation-afterCgame;simulationMs=simulationMs+afterSimulation-startedAt
    view=largestView(state.context.renderViews);if view==void then window.shutdown();match.shutdown(state);return fail("cgame stopped submitting its main view") end if
    preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,preparedViews,pipelineProfile);if preparedViews is error then window.shutdown();match.shutdown(state);return preparedViews end if
    if frames%4==0 then worldConfig.horizontalFov=view.refdef.fovX;nextWorld=worldSelection.prepareCached(worldCache,selectionCamera(view),worldConfig);if nextWorld is error then window.shutdown();match.shutdown(state);return nextWorld end if;if not worldSelection.sameFaces(selectedFaces,nextWorld.selection.faceIndexes) then worldPrepared=worldBatch.buildMaterials(nextWorld.renderData,worldCatalog,skyFlags);if worldPrepared is error then window.shutdown();match.shutdown(state);return worldPrepared end if;attached=attachWorldEffects(worldPrepared,nextWorld.renderData,fogCatalog,dlightCatalog,dlightReceiveFlags);if attached is error then window.shutdown();match.shutdown(state);return attached end if;selectedFaces=nextWorld.selection.faceIndexes end if end if
    afterGeometry=window.milliseconds();geometryMs=geometryMs+afterGeometry-afterSimulation
    refreshedHud=qvm2d.refresh(hudCatalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if refreshedHud is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return refreshedHud end if
    boundVideo=qvmVideo.bindCatalog(videoManager,hudCatalog,serverTime);if boundVideo is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return boundVideo end if
    applied=qvmPlayback.apply(audio,state.context.soundCommands);if applied is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return applied end if
    if len(qvmCatalog.textures)>uploadedQvmTextures then uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if;uploadedQvmTextures=len(qvmCatalog.textures) end if
    videoUploads=qvmVideo.update(videoManager,serverTime);if videoUploads is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return videoUploads end if
    for each videoUpload in videoUploads if not window.uploadTextureNoMip(videoUpload.slot,videoUpload.pixels,videoUpload.width,videoUpload.height) then audioOutput.shutdown();window.shutdown();match.shutdown(state);return fail("could not upload shader cinematic frame") end if end for
    afterBatch=window.milliseconds();batchMs=batchMs+afterBatch-afterGeometry
    window.beginFrame(0,0,0)
    for each preparedView in preparedViews
      window.clearDepth(0.0)
      if (preparedView.source.refdef.flags&1)==0 then
        if skyCatalog!=void then drawn=playableSky.drawViewport(skyCatalog,preparedView.source.refdef.viewaxis,preparedView.target.area,preparedView.source.refdef.time);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if end if
        drawn=worldBatch.drawMaterialsLitViewport(worldPrepared,preparedView.target.projection,preparedView.source.refdef.time,preparedView.source.scene.dlights,preparedView.target.area);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
      end if
      drawn=sceneBatch.drawViewport(preparedView.batch,preparedView.target.projection,preparedView.target.area,preparedView.source.refdef.time);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
    end for
    cinematicDraws=drawCinematics(state);if cinematicDraws is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return cinematicDraws end if
    drawn=qvm2d.draw(hudCatalog,view.refdef.time);if drawn is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return drawn end if
    window.present();renderMs=renderMs+window.milliseconds()-afterBatch;frames=frames+1
    audioChunks=0
    while audioChunks<3 and audioOutput.canSubmit()
      samples=void
      if len(cinematicAudio)>0 then samples=cinematicAudio[0];remaining=[];if len(cinematicAudio)>1 then for audioIndex=1 to len(cinematicAudio)-1 remaining=remaining+[cinematicAudio[audioIndex]] end for end if;cinematicAudio=remaining
      else chunk=qvmPlayback.render(audio);if chunk is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return chunk end if;samples=chunk.samples end if
      accepted=audioOutput.submit(samples);if accepted is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return accepted end if;if not accepted then break end if;audioChunks=audioChunks+1
    end while
    nextTitle=fpsTitle.frame(titleState,window.milliseconds());if nextTitle is error then window.shutdown();match.shutdown(state);return nextTitle end if;if nextTitle!=void then window.setTitle(nextTitle) end if
    time.sleep(1)
  end while
  audioOutput.shutdown();qvmVideo.close(videoManager);releaseCinematics();qvm2d.release(hudCatalog);sceneBatch.release(qvmCatalog);worldBatch.releaseMaterials(worldCatalog);playableSky.release(skyCatalog);playableFog.release(fogCatalog);dynamicLights.release(dlightCatalog);window.shutdown();match.shutdown(state)
  modelCount=0;triangleCount=0;for each preparedView in preparedViews modelCount=modelCount+preparedView.geometry.modelEntities;triangleCount=triangleCount+len(preparedView.geometry.triangles) end for
  worldEffects=0;if skyCatalog!=void then worldEffects=worldEffects+1 end if;if fogCatalog!=void then worldEffects=worldEffects+1 end if;if dlightCatalog!=void then worldEffects=worldEffects+1 end if
  print "QVM preview: views="+str(len(state.context.renderViews))+" selected="+str(view.refdef.width)+"x"+str(view.refdef.height)+" models="+str(modelCount)+" triangles="+str(triangleCount)+" textures="+str(len(qvmCatalog.textures))+" hudQuads="+str(hudCatalog.sourceQuads)+" sounds="+str(len(soundCatalog.clips))+" frames="+str(frames)+" worldEffects="+str(worldEffects)
  if frames>0 then print "QVM frame profile: simulation="+str(simulationMs/frames)+"ms (game="+str(gameMs/frames)+" cgame="+str(cgameMs/frames)+" ui="+str(uiMs/frames)+") geometry="+str(geometryMs/frames)+"ms (expand="+str(pipelineProfile.expansion/frames)+" material="+str(pipelineProfile.material/frames)+" sceneBatch="+str(pipelineProfile.batch/frames)+") batch="+str(batchMs/frames)+"ms render="+str(renderMs/frames)+"ms ticks="+str(simulationTicks) end if
  return 0
end function
function run(archive,map,qvmRoot) return runLimited(archive,map,qvmRoot,-1) end function
