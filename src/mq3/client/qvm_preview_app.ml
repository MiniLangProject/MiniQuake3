// SPDX-License-Identifier: GPL-2.0-or-later
// First native 3D presentation of an unchanged retail cgame QVM frame.
package mq3.client.qvm_preview_app

import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as localQvmUi
import mq3.client.original_ui_session as uiSession
import mq3.client.cinematic_runtime as cinematics
import mq3.client.cgame_clock as cgameClock
import mq3.client.input_command as inputCommand
import mq3.client.input_command_events as timestampedInput
import mq3.vm.syscall_qagame_world as qworld
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.renderer.qvm_scene_materials as sceneMaterials
import mq3.renderer.qvm_scene_batch as sceneBatch
import mq3.renderer.qvm_viewport as qvmViewport
import mq3.renderer.portal_render_pass as portalPass
import mq3.renderer.portal_clip as portalClip
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
import mq3.renderer.playable_flares as flares
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
import mq3.qcommon.cvar as cvar
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
struct PreparedPortal plan world batch target source end struct
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
function refdefCamera(refdef)
  angles=qmath.vectoangles(refdef.viewaxis[0]);return viewer.camera(refdef.vieworg,angles[1],angles[0],0.0,0.0)
end function
function prepareViews(views,catalog,archive,assets,kinds,frameCache,grid,videoManager,previousViews,profile,fogCatalog,dlightCatalog,shadowMode)
  result=[];viewIndex=0
  for each view in views
    started=0;if profile!=void then started=window.milliseconds() end if
    if grid!=void then ignored=lightGrid.setDynamicLights(grid,view.scene.dlights) end if
    previousGeometry=void;if previousViews!=void and viewIndex<len(previousViews) then previousGeometry=previousViews[viewIndex].geometry end if
    expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadows(view.scene.entities,view.scene.polys,kinds,assets,view.refdef,8192,frameCache,grid,previousGeometry,shadowMode);if expanded is error then return expanded end if
    afterExpansion=0;if profile!=void then afterExpansion=window.milliseconds();profile.expansion=profile.expansion+afterExpansion-started end if
    refreshed=sceneMaterials.refresh(catalog,archive,expanded.triangles,assets,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS);if refreshed is error then return refreshed end if
    boundVideo=qvmVideo.bindCatalog(videoManager,catalog,view.refdef.time);if boundVideo is error then return boundVideo end if
    afterMaterial=0;if profile!=void then afterMaterial=window.milliseconds();profile.material=profile.material+afterMaterial-afterExpansion end if
    previous=void;if previousViews!=void and viewIndex<len(previousViews) then previous=previousViews[viewIndex].batch end if;batch=void
    if previous==void then batch=sceneBatch.buildWithGeometry(catalog,expanded) else batch=sceneBatch.refreshWithGeometry(previous,catalog,expanded) end if;if batch is error then return batch end if
    attached=sceneBatch.attachFog(batch,fogCatalog);if attached is error then return attached end if
    attached=sceneBatch.attachDynamicLights(batch,catalog,dlightCatalog);if attached is error then return attached end if
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
function applyInputEvent(state,matchState,event)
  if event.type==window.INPUT_KEY then
    key=timestampedInput.quakeKey(event.value);match.setKeyDown(matchState,key,event.value2!=0)
    expanded=timestampedInput.applyBound(state,event.time,event.type,event.value,event.value2,match.keyBinding(matchState,key));if expanded is error then return expanded end if
    for each command in expanded if not command.button then match.queueInputCommand(matchState,command.text) end if end for
    return expanded
  end if
  return timestampedInput.applyBound(state,event.time,event.type,event.value,event.value2,"")
end function
function releaseGameInput(state,time) return timestampedInput.release(state,time) end function
function ensurePlayableBindings(state)
  for each pair in [[119,"+forward"],[115,"+back"],[100,"+moveright"],[97,"+moveleft"],[32,"+moveup"],[178,"+attack"]]
    if match.keyBinding(state,pair[0])=="" then match.setKeyBinding(state,pair[0],pair[1]) end if
  end for
  return void
end function
function advanceGameTick(state,clientClock,serverTime,input)
  delta=[0,0,0];if state.context.latestSnapshot!=void then delta=state.context.latestSnapshot.playerState.delta_angles end if
  command=qworld.userCommand(serverTime,[angleCommand(input.viewangles[0],delta[0]),angleCommand(input.viewangles[1],delta[1]),angleCommand(input.viewangles[2],delta[2])],input.buttons,input.weapon,input.forwardmove,input.rightmove,input.upmove)
  submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
  advanced=match.runFrame(state,serverTime);if advanced is error then return advanced end if
  snapshot=match.snapshot(state,0);if snapshot is error then return snapshot end if
  published=cgameClock.publishSnapshot(clientClock,state.context.snapshotNumber,snapshot.serverTime,0);if published is error then return published end if
  return snapshot
end function
function drawFrame(state,clientClock,realtime)
  renderCommands.reset(state.context.renderQueue);state.context.soundCommands=[]
  frameTime=cgameClock.frame(clientClock,realtime);if frameTime is error then return frameTime end if
  if not frameTime.draw then return false end if
  drawn=match.drawCgame(state,frameTime.serverTime);if drawn is error then return drawn end if
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
function preparePortal(source,selectedWorld,worldCatalog,qvmCatalog,archive,assets,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode)
  plan=portalPass.prepare(selectedWorld,worldCatalog,source.geometry,source.source.refdef,false);if plan is error or plan==void then return plan end if
  if grid!=void then ignored=lightGrid.setDynamicLights(grid,source.source.scene.dlights) end if
  geometry=sceneGeometry.buildPortalRecordsCulledShadows(source.source.scene.entities,source.source.scene.polys,kinds,assets,plan.refdef,8192,frameCache,frameCache.normalTable,grid,shadowMode);if geometry is error then return geometry end if
  geometry=portalClip.clipScene(geometry,plan.view.planeNormal,plan.view.planeDist);if geometry is error then return geometry end if
  refreshed=sceneMaterials.refresh(qvmCatalog,archive,geometry.triangles,assets,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS);if refreshed is error then return refreshed end if
  boundVideo=qvmVideo.bindCatalog(videoManager,qvmCatalog,plan.refdef.time);if boundVideo is error then return boundVideo end if
  batch=sceneBatch.buildWithGeometry(qvmCatalog,geometry);if batch is error then return batch end if
  attached=sceneBatch.attachFog(batch,fogCatalog);if attached is error then return attached end if
  attached=sceneBatch.attachDynamicLights(batch,qvmCatalog,dlightCatalog);if attached is error then return attached end if
  portalConfig=worldSelection.config(worldConfig.width,worldConfig.height,plan.refdef.fovX,worldConfig.nearDistance,worldConfig.farDistance,worldConfig.triangleBudget,worldConfig.backfaceCull,worldConfig.patchError);if portalConfig is error then return portalConfig end if
  portalWorld=worldSelection.preparePortalCached(worldCache,refdefCamera(plan.refdef),plan.view.pvsOrigin,portalConfig);if portalWorld is error then return portalWorld end if
  clippedWorld=portalClip.clipRenderData(portalWorld.renderData,plan.view.planeNormal,plan.view.planeDist);if clippedWorld is error then return clippedWorld end if
  world=worldBatch.buildMaterials(clippedWorld,worldCatalog,skyFlags);if world is error then return world end if
  attached=attachWorldEffects(world,clippedWorld,fogCatalog,dlightCatalog,dlightReceiveFlags);if attached is error then return attached end if
  target=qvmViewport.prepare(plan.refdef,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if target is error then return target end if
  return PreparedPortal(plan,world,batch,target,source.source)
end function
function preparePortals(preparedViews,selectedWorld,worldCatalog,qvmCatalog,archive,assets,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode)
  result=[];for each source in preparedViews portal=preparePortal(source,selectedWorld,worldCatalog,qvmCatalog,archive,assets,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode);if portal is error then return portal end if;result=result+[portal] end for;return result
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
function collectCinematicAudio(state,audio)
  count=0
  for handle=0 to cinematics.MAX_HANDLES-1
    chunks=cinematics.takeAudio(state.context.cinematics,handle)
    for each chunk in chunks queued=qvmPlayback.queueRaw(audio,chunk,1.0);if queued is error then return queued end if;count=count+queued end for
  end for
  return count
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
  ensurePlayableBindings(state)
  clientClock=cgameClock.create(state.context.now,state.context.snapshotNumber,state.context.latestSnapshot.serverTime);if clientClock is error then match.shutdown(state);return clientClock end if
  bootedUi=match.bootUi(state);if bootedUi is error then match.shutdown(state);return bootedUi end if
  videoManager=qvmVideo.create(state.context.cinematics,CINEMATIC_TEXTURE_FIRST_SLOT,cinematics.MAX_HANDLES);if videoManager is error then match.shutdown(state);return videoManager end if
  frameCache=sceneGeometry.createFrameCache(void,256);if frameCache is error then match.shutdown(state);return frameCache end if
  view=largestView(state.context.renderViews);if view==void then match.shutdown(state);return fail("cgame submitted no render view") end if
  qvmCatalog=sceneMaterials.build(archive,[],state.context.assets,state.context.assetKinds,QVM_TEXTURE_FIRST_SLOT,MAX_QVM_TEXTURE_SLOTS,state.context.shaderRemaps);if qvmCatalog is error then match.shutdown(state);return qvmCatalog end if
  shadowVariable=cvar.get(state.context.cvars,"cg_shadows","1",cvar.ARCHIVE)
  preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,void,void,void,void,shadowVariable.integer);if preparedViews is error then match.shutdown(state);return preparedViews end if
  hudCatalog=qvm2d.build(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,QVM_2D_TEXTURE_FIRST_SLOT,MAX_QVM_2D_TEXTURE_SLOTS,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT,state.context.shaderRemaps);if hudCatalog is error then match.shutdown(state);return hudCatalog end if
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
  flareCatalog=void;flareVariable=cvar.get(state.context.cvars,"r_flares","0",cvar.ARCHIVE)
  if nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedFlares=try(flares.load(archive,map,scripts[0],nextWorldTextureSlot,flareVariable.integer!=0));if not (loadedFlares is error) then flareCatalog=loadedFlares;if flareCatalog.image!=void then nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if end if
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
  if flareCatalog!=void then uploaded=flares.upload(flareCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  uploaded=uploadLightmaps(map);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  audioStarted=audioOutput.init(22050);if audioStarted is error then window.shutdown();match.shutdown(state);return audioStarted end if
  titleState=fpsTitle.create("Original QVM q3dm1",window.milliseconds());window.setTitle(fpsTitle.initialTitle(titleState))
  frames=0;yaw=state.context.latestSnapshot.playerState.viewangles[1];pitch=state.context.latestSnapshot.playerState.viewangles[0];inputState=inputCommand.create(pitch,yaw,0.0);inputConfig=inputCommand.defaults()
  pendingInputEvents=[];wasMenuActive=false;uploadedQvmTextures=len(qvmCatalog.textures);uploadedHudTextures=len(hudCatalog.textures);simulationMs=0;gameMs=0;cgameMs=0;uiMs=0;geometryMs=0;batchMs=0;renderMs=0;pipelineProfile=PipelineProfile(0,0,0);simulationTicks=0;simulationTime=state.context.now;simulationStart=simulationTime;realStart=window.milliseconds()
  while not window.shouldClose() and (maxFrames<0 or frames<maxFrames)
    startedAt=window.milliseconds();serverTime=simulationStart+startedAt-realStart;steps=0
    window.poll();nativeInput.mouse=window.mouseDelta();menuActive=uiSession.active(ui);nativeEvents=window.inputEvents(256);if nativeEvents is error then window.shutdown();match.shutdown(state);return nativeEvents end if
    if menuActive then pendingInputEvents=[];released=releaseGameInput(inputState,simulationTime);if released is error then window.shutdown();match.shutdown(state);return released end if
    else
      for each event in nativeEvents event.time=simulationStart+event.time-realStart;pendingInputEvents=pendingInputEvents+[event] end for
      if wasMenuActive then
        for each key in [window.VK_W,window.VK_S,window.VK_D,window.VK_A,window.VK_SPACE,window.VK_LBUTTON] if window.keyDown(key) then pendingInputEvents=pendingInputEvents+[window.InputEvent(simulationTime,window.INPUT_KEY,key,1)] end if end for
      end if
    end if
    wasMenuActive=menuActive
    while simulationTime+50<=serverTime and steps<8
      simulationTime=simulationTime+50
      while len(pendingInputEvents)>0 and pendingInputEvents[0].time<=simulationTime applied=applyInputEvent(inputState,state,pendingInputEvents[0]);if applied is error then window.shutdown();match.shutdown(state);return applied end if;pendingInputEvents=slice(pendingInputEvents,1,len(pendingInputEvents)) end while
      anyInput=timestampedInput.anyDown(inputState)
      created=inputCommand.createCommand(inputState,inputConfig,simulationTime,50,simulationTime,match.cgameUserCmdValue(state),match.cgameSensitivity(state),0,anyInput);if created is error then window.shutdown();match.shutdown(state);return created end if;yaw=created.viewangles[1];pitch=created.viewangles[0];advanced=advanceGameTick(state,clientClock,simulationTime,created);if advanced is error then window.shutdown();match.shutdown(state);return advanced end if;steps=steps+1;simulationTicks=simulationTicks+1
    end while
    afterGame=window.milliseconds();gameMs=gameMs+afterGame-startedAt
    drawnFrame=drawFrame(state,clientClock,serverTime);if drawnFrame is error then window.shutdown();match.shutdown(state);return drawnFrame end if
    afterCgame=window.milliseconds();cgameMs=cgameMs+afterCgame-afterGame
    uiFrame=uiSession.frame(ui,serverTime);if uiFrame is error then window.shutdown();match.shutdown(state);return uiFrame end if
    cinematicSamples=collectCinematicAudio(state,audio);if cinematicSamples is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return cinematicSamples end if
    afterSimulation=window.milliseconds();uiMs=uiMs+afterSimulation-afterCgame;simulationMs=simulationMs+afterSimulation-startedAt
    view=largestView(state.context.renderViews);if view==void then window.shutdown();match.shutdown(state);return fail("cgame stopped submitting its main view") end if
    preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,preparedViews,pipelineProfile,fogCatalog,dlightCatalog,shadowVariable.integer);if preparedViews is error then window.shutdown();match.shutdown(state);return preparedViews end if
    if frames%4==0 then worldConfig.horizontalFov=view.refdef.fovX;nextWorld=worldSelection.prepareCached(worldCache,selectionCamera(view),worldConfig);if nextWorld is error then window.shutdown();match.shutdown(state);return nextWorld end if;if not worldSelection.sameFaces(selectedFaces,nextWorld.selection.faceIndexes) then worldPrepared=worldBatch.buildMaterials(nextWorld.renderData,worldCatalog,skyFlags);if worldPrepared is error then window.shutdown();match.shutdown(state);return worldPrepared end if;attached=attachWorldEffects(worldPrepared,nextWorld.renderData,fogCatalog,dlightCatalog,dlightReceiveFlags);if attached is error then window.shutdown();match.shutdown(state);return attached end if;selectedFaces=nextWorld.selection.faceIndexes end if;selected=nextWorld end if
    preparedPortals=preparePortals(preparedViews,selected.renderData,worldCatalog,qvmCatalog,archive,state.context.modelAssets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowVariable.integer);if preparedPortals is error then window.shutdown();match.shutdown(state);return preparedPortals end if
    afterGeometry=window.milliseconds();geometryMs=geometryMs+afterGeometry-afterSimulation
    refreshedHud=qvm2d.refresh(hudCatalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,SOURCE_WIDTH,SOURCE_HEIGHT,WIDTH,HEIGHT);if refreshedHud is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return refreshedHud end if
    if len(hudCatalog.textures)>uploadedHudTextures then uploaded=qvm2d.upload(hudCatalog);if uploaded is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return uploaded end if;uploadedHudTextures=len(hudCatalog.textures) end if
    boundVideo=qvmVideo.bindCatalog(videoManager,hudCatalog,serverTime);if boundVideo is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return boundVideo end if
    applied=qvmPlayback.apply(audio,state.context.soundCommands);if applied is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return applied end if
    if len(qvmCatalog.textures)>uploadedQvmTextures then uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if;uploadedQvmTextures=len(qvmCatalog.textures) end if
    videoUploads=qvmVideo.update(videoManager,serverTime);if videoUploads is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return videoUploads end if
    for each videoUpload in videoUploads if not window.uploadTextureNoMip(videoUpload.slot,videoUpload.pixels,videoUpload.width,videoUpload.height) then audioOutput.shutdown();window.shutdown();match.shutdown(state);return fail("could not upload shader cinematic frame") end if end for
    afterBatch=window.milliseconds();batchMs=batchMs+afterBatch-afterGeometry
    window.beginFrame(0,0,0)
    preparedViewIndex=0
    for each preparedView in preparedViews
      window.clearDepth(0.0)
      preparedPortal=preparedPortals[preparedViewIndex]
      if preparedPortal!=void then
        if (preparedPortal.plan.refdef.flags&1)==0 then
          if skyCatalog!=void then drawn=playableSky.drawViewport(skyCatalog,preparedPortal.plan.refdef.viewaxis,preparedPortal.target.area,preparedPortal.plan.refdef.time);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if end if
          drawn=worldBatch.drawMaterialsLitViewport(preparedPortal.world,preparedPortal.target.projection,preparedPortal.plan.refdef.time,preparedPortal.source.scene.dlights,preparedPortal.target.area);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
        end if
        drawn=sceneBatch.drawLitViewportShadows(preparedPortal.batch,preparedPortal.target.projection,preparedPortal.target.area,preparedPortal.plan.refdef.time,preparedPortal.source.scene.dlights,preparedPortal.plan.view.mirror);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
        drawn=flares.drawViewport(flareCatalog,fogCatalog,preparedPortal.source.scene.dlights,preparedPortal.target.projection,preparedPortal.target.area,preparedPortal.plan.refdef.time,preparedViewIndex*2);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
        // Match RB_BeginDrawingView: retain portal color, reset depth, then
        // let the main portal surface mask the recursive image.
        window.clearDepth(0.0)
      end if
      if (preparedView.source.refdef.flags&1)==0 then
        // A fullscreen software sky would erase the retained recursive color.
        // With a portal, draw it at far depth after the portal/main world so
        // the depth-writing portal surface masks it like the original sky.
        if preparedPortal==void and skyCatalog!=void then drawn=playableSky.drawViewport(skyCatalog,preparedView.source.refdef.viewaxis,preparedView.target.area,preparedView.source.refdef.time);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if end if
        drawn=worldBatch.drawMaterialsLitViewport(worldPrepared,preparedView.target.projection,preparedView.source.refdef.time,preparedView.source.scene.dlights,preparedView.target.area);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
        if preparedPortal!=void and skyCatalog!=void then drawn=playableSky.drawViewport(skyCatalog,preparedView.source.refdef.viewaxis,preparedView.target.area,preparedView.source.refdef.time);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if end if
      end if
      drawn=sceneBatch.drawLitViewportShadows(preparedView.batch,preparedView.target.projection,preparedView.target.area,preparedView.source.refdef.time,preparedView.source.scene.dlights,false);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
      drawn=flares.drawViewport(flareCatalog,fogCatalog,preparedView.source.scene.dlights,preparedView.target.projection,preparedView.target.area,preparedView.source.refdef.time,preparedViewIndex*2+1);if drawn is error then window.shutdown();match.shutdown(state);return drawn end if
      preparedViewIndex=preparedViewIndex+1
    end for
    cinematicDraws=drawCinematics(state);if cinematicDraws is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return cinematicDraws end if
    drawn=qvm2d.draw(hudCatalog,view.refdef.time);if drawn is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return drawn end if
    window.present();renderMs=renderMs+window.milliseconds()-afterBatch;frames=frames+1
    audioChunks=0
    while audioChunks<3 and audioOutput.canSubmit()
      chunk=qvmPlayback.render(audio);if chunk is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return chunk end if;samples=chunk.samples
      accepted=audioOutput.submit(samples);if accepted is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return accepted end if;if not accepted then break end if;audioChunks=audioChunks+1
    end while
    nextTitle=fpsTitle.frame(titleState,window.milliseconds());if nextTitle is error then window.shutdown();match.shutdown(state);return nextTitle end if;if nextTitle!=void then window.setTitle(nextTitle) end if
    time.sleep(1)
  end while
  audioOutput.shutdown();qvmVideo.close(videoManager);releaseCinematics();qvm2d.release(hudCatalog);sceneBatch.release(qvmCatalog);worldBatch.releaseMaterials(worldCatalog);playableSky.release(skyCatalog);playableFog.release(fogCatalog);dynamicLights.release(dlightCatalog);flares.release(flareCatalog);window.shutdown();match.shutdown(state)
  modelCount=0;triangleCount=0;for each preparedView in preparedViews modelCount=modelCount+preparedView.geometry.modelEntities;triangleCount=triangleCount+len(preparedView.geometry.triangles) end for
  worldEffects=0;if skyCatalog!=void then worldEffects=worldEffects+1 end if;if fogCatalog!=void then worldEffects=worldEffects+1 end if;if dlightCatalog!=void then worldEffects=worldEffects+1 end if;if flareCatalog!=void and flareCatalog.enabled then worldEffects=worldEffects+1 end if
  print "QVM preview: views="+str(len(state.context.renderViews))+" selected="+str(view.refdef.width)+"x"+str(view.refdef.height)+" models="+str(modelCount)+" triangles="+str(triangleCount)+" textures="+str(len(qvmCatalog.textures))+" hudQuads="+str(hudCatalog.sourceQuads)+" sounds="+str(len(soundCatalog.clips))+" frames="+str(frames)+" worldEffects="+str(worldEffects)
  if frames>0 then print "QVM frame profile: simulation="+str(simulationMs/frames)+"ms (game="+str(gameMs/frames)+" cgame="+str(cgameMs/frames)+" ui="+str(uiMs/frames)+") geometry="+str(geometryMs/frames)+"ms (expand="+str(pipelineProfile.expansion/frames)+" material="+str(pipelineProfile.material/frames)+" sceneBatch="+str(pipelineProfile.batch/frames)+") batch="+str(batchMs/frames)+"ms render="+str(renderMs/frames)+"ms ticks="+str(simulationTicks) end if
  return 0
end function
function run(archive,map,qvmRoot) return runLimited(archive,map,qvmRoot,-1) end function
