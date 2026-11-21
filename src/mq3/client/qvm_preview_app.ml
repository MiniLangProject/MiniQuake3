// SPDX-License-Identifier: GPL-2.0-or-later
// First native 3D presentation of an unchanged retail cgame QVM frame.
package mq3.client.qvm_preview_app

import mq3.engine.local_qvm_match as match
import mq3.engine.local_qvm_ui as localQvmUi
import mq3.client.original_ui_session as uiSession
import mq3.client.desktop_session as desktopSession
import mq3.client.desktop_video as desktopVideo
import mq3.client.cinematic_runtime as cinematics
import mq3.client.cgame_clock as cgameClock
import mq3.client.demo_playback as demos
import mq3.client.remote_play as remote
import mq3.client.qvm_frame_input as frameInput
import mq3.client.cgame_vm as cgameVm
import mq3.qcommon.command_buffer as inputCommands
import mq3.client.input_command_events as timestampedInput
import mq3.client.ui_input_latch as inputLatch
import mq3.client.console_input as consoleInput
import mq3.client.console_input_display as consoleDisplay
import mq3.client.cl_console as clientConsole
import mq3.client.baseq3_match_display as baseMatchDisplay
import mq3.client.baseq3_console_background as consoleBackground
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
import mq3.renderer.retained_world_batch as retainedWorld
import mq3.client.playable_sky as playableSky
import mq3.renderer.playable_fog as playableFog
import mq3.renderer.playable_dynamic_lights as dynamicLights
import mq3.renderer.playable_flares as flares
import mq3.client.playable_viewer as viewer
import mq3.client.playable_fps_title as fpsTitle
import mq3.platform.playable_window as window
import mq3.platform.playable_ambient as audioOutput
import mq3.platform.playable_multitexture as multitexture
import mq3.audio.qvm_sound_assets as qvmSoundAssets
import mq3.audio.qvm_playback as qvmPlayback
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import mq3.qcommon.cvar as cvar
import std.ds.list as lists
import mq3.client.frame_timing as frameTiming
import std.time as time
import std.string as strings

const WORLD_TEXTURE_FIRST_SLOT=256
const QVM_TEXTURE_FIRST_SLOT=2048
const MAX_QVM_TEXTURE_SLOTS=1024
const QVM_2D_TEXTURE_FIRST_SLOT=3072
const MAX_QVM_2D_TEXTURE_SLOTS=980
const CONSOLE_BACKGROUND_TEXTURE_SLOT=4052
const CONSOLE_FONT_TEXTURE_SLOT=4054
const CINEMATIC_TEXTURE_FIRST_SLOT=4055
const SOURCE_WIDTH=1280
const SOURCE_HEIGHT=720
// Retention bound, not a scene/triangle budget: evicted poses are recomputed.
const MD3_FRAME_CACHE_ENTRIES=32

struct PreparedView source geometry batch target end struct
struct PreparedPortal plan world batch target source end struct
struct NativeInput mouse keys end struct
struct ClientInputBridge frame plan ui matchState end struct
struct PipelineProfile expansion material batch end struct
struct ScreenPoint x y depth end struct
struct StreamSource transport protocol demo name systemInfo end struct

function fail(message) return error(7682,"QVM preview: "+message) end function
function framePercentile(histogram,count,percent)
  return frameTiming.percentile(histogram,count,percent)
end function
function requestedQuit(state)
  if state==void or state.context==void then return false end if
  for each entry in state.context.console
    text=strings.toLowerAscii(entry[1]);text=strings.replaceAll(text,"\r",";");text=strings.replaceAll(text,"\n",";")
    for each command in strings.split(text,";") fields=strings.split(strings.trim(command)," ");if len(fields)>0 and fields[0]=="quit" then return true end if end for
  end for
  return false
end function
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
function prepareViews(views,catalog,archive,modelAssets,assetNames,kinds,frameCache,grid,videoManager,previousViews,profile,fogCatalog,dlightCatalog,shadowMode,lodScale,lodBias,mode)
  result=lists.List.withCapacity(len(views));viewIndex=0
  for each view in views
    started=0;if profile!=void then started=window.milliseconds() end if
    if grid!=void then ignored=lightGrid.setDynamicLights(grid,view.scene.dlights) end if
    previousGeometry=void;if previousViews!=void and viewIndex<len(previousViews) then previousGeometry=previousViews[viewIndex].geometry end if
    expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8192,frameCache,grid,previousGeometry,shadowMode,fogCatalog,lodScale,lodBias);if expanded is error then return expanded end if
    afterExpansion=0;if profile!=void then afterExpansion=window.milliseconds();profile.expansion=profile.expansion+afterExpansion-started end if
    refreshed=sceneMaterials.refresh(catalog,archive,expanded.triangles,assetNames,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS);if refreshed is error then return refreshed end if
    boundVideo=qvmVideo.bindCatalog(videoManager,catalog,view.refdef.time);if boundVideo is error then return boundVideo end if
    afterMaterial=0;if profile!=void then afterMaterial=window.milliseconds();profile.material=profile.material+afterMaterial-afterExpansion end if
    previous=void;if previousViews!=void and viewIndex<len(previousViews) then previous=previousViews[viewIndex].batch end if;batch=void
    if previous==void then batch=sceneBatch.buildWithGeometry(catalog,expanded) else batch=sceneBatch.refreshWithGeometry(previous,catalog,expanded) end if;if batch is error then return batch end if
    attached=sceneBatch.attachFog(batch,fogCatalog);if attached is error then return attached end if
    if len(view.scene.dlights)>0 then attached=sceneBatch.attachDynamicLights(batch,catalog,dlightCatalog);if attached is error then return attached end if end if
    if profile!=void then profile.batch=profile.batch+window.milliseconds()-afterMaterial end if
    target=qvmViewport.prepare(view.refdef,SOURCE_WIDTH,SOURCE_HEIGHT,mode.width,mode.height);if target is error then return target end if
    result.add(PreparedView(view,expanded,batch,target));viewIndex=viewIndex+1
  end for
  return result.toArray()
end function
function movementAxis(positive,negative)
  if positive and not negative then return 127 end if
  if negative and not positive then return -127 end if
  return 0
end function
function nativeKeyDown(input,key)
  if input!=void and inputLatch.keyDown(input.keys,key) then return true end if
  return window.inputKeyDown(key)
end function
function nativeMouseDelta(input) return input.mouse end function
function observeNativeInputEvents(input,events)
  for each event in events observed=inputLatch.observe(input.keys,event.type,event.value,event.value2);if observed is error then return observed end if end for
  return void
end function
function queueExpandedInput(matchState,frameState,expanded)
  if expanded is error then return expanded end if
  for each command in expanded if not command.button or not frameInput.handlesAction(frameState,command.action) then match.queueInputCommand(matchState,command.text) end if end for;return expanded
end function
function applyInputEvent(bridge,matchState,event)
  catcher=match.keyCatcher(matchState)
  if event.type==window.INPUT_CHAR then
    if event.value==96 or event.value==126 then return [] end if
    if (catcher&consoleInput.KEYCATCH_CONSOLE)!=0 then match.clientTextChar(matchState,event.value)
    else if (catcher&2)!=0 then sent=bridge.ui.services.keyEventFn(bridge.ui.services.context,event.value|uiSession.K_CHAR_FLAG,true);if sent is error then return sent end if
    else if (catcher&consoleInput.KEYCATCH_MESSAGE)!=0 then match.clientTextChar(matchState,event.value) end if
    return []
  end if
  if event.type==window.INPUT_MOUSE then
    if (catcher&2)!=0 then sent=bridge.ui.services.mouseEventFn(bridge.ui.services.context,event.value,event.value2);if sent is error then return sent end if
    else if (catcher&8)!=0 and (catcher&1)==0 then sent=cgameVm.mouseEvent(matchState.cgame,event.value,event.value2);if sent is error then return sent end if end if
    return frameInput.applyBound(bridge.frame,bridge.plan,event.time,event.type,event.value,event.value2,"",catcher)
  end if
  if event.type!=window.INPUT_KEY then return [] end if
  key=event.value;down=event.value2!=0;match.setKeyDown(matchState,key,down)
  if key==96 or key==126 then if down then match.toggleClientConsole(matchState);released=releaseGameInput(bridge,event.time);if released is error then return released end if end if;return [] end if
  // CL_KeyEvent handles Escape immediately in event order, before a command.
  // A chat/cgame Escape cannot be polled again as a new UI opening event.
  if key==27 and down then
    if (catcher&consoleInput.KEYCATCH_MESSAGE)!=0 then match.clientMessageEscape(matchState);return [] end if
    if (catcher&8)!=0 then match.uiSetCatcher(matchState.context,catcher&(~8));sent=cgameVm.eventHandling(matchState.cgame,0);if sent is error then return sent end if;return [] end if
    if (catcher&2)!=0 then sent=bridge.ui.services.keyEventFn(bridge.ui.services.context,key,true);if sent is error then return sent end if
    else opened=uiSession.openIngame(bridge.ui);if opened is error then return opened end if;released=releaseGameInput(bridge,event.time);if released is error then return released end if end if;return []
  end if
  // CL_KeyEvent always releases +bindings before routing the catcher key-up.
  expanded=frameInput.applyBound(bridge.frame,bridge.plan,event.time,event.type,key,event.value2,match.keyBinding(matchState,key),catcher);queued=queueExpandedInput(matchState,bridge.frame,expanded);if queued is error then return queued end if
  if not down then
    if (catcher&2)!=0 then sent=bridge.ui.services.keyEventFn(bridge.ui.services.context,key,false);if sent is error then return sent end if
    else if (catcher&8)!=0 then sent=cgameVm.keyEvent(matchState.cgame,key,false);if sent is error then return sent end if end if;return expanded
  end if
  if (catcher&consoleInput.KEYCATCH_CONSOLE)!=0 then if down then match.clientTextKey(matchState,key,match.keyIsDown(matchState,consoleInput.K_SHIFT),match.keyIsDown(matchState,consoleInput.K_CTRL)) end if;return expanded end if
  if (catcher&2)!=0 then sent=bridge.ui.services.keyEventFn(bridge.ui.services.context,key,down);if sent is error then return sent end if
  else if (catcher&8)!=0 then sent=cgameVm.keyEvent(matchState.cgame,key,down);if sent is error then return sent end if
  else if (catcher&consoleInput.KEYCATCH_MESSAGE)!=0 and down then match.clientTextKey(matchState,key,match.keyIsDown(matchState,consoleInput.K_SHIFT),match.keyIsDown(matchState,consoleInput.K_CTRL)) end if
  return expanded
end function
function refreshUiFrame(ui,serverTime)
  // Input has already been delivered once, in native-event order. Keep UI
  // refresh after beginRendererFrame/CG draw so its real commands survive.
  if uiSession.active(ui) then refreshed=ui.services.refreshFn(ui.services.context,serverTime);if refreshed is error then return refreshed end if;ui.frameCount=ui.frameCount+1 end if
  return true
end function
function releaseGameInput(bridge,time)
  // Key_ClearStates must also release delegated +commands such as +zoom.
  // Use the current binding, just like CL_KeyEvent(false), before keys clear.
  for key=0 to 255
    if match.keyIsDown(bridge.matchState,key) then
      expanded=frameInput.applyBound(bridge.frame,bridge.plan,time,window.INPUT_KEY,key,0,match.keyBinding(bridge.matchState,key),match.keyCatcher(bridge.matchState));queued=queueExpandedInput(bridge.matchState,bridge.frame,expanded);if queued is error then return queued end if;match.setKeyDown(bridge.matchState,key,false)
    end if
  end for
  return frameInput.releaseAll(bridge.frame,bridge.plan,time)
end function
function clearClientInput(bridge) return releaseGameInput(bridge,0) end function
function consoleColor(index)
  if index==0 then return [0,0,0] end if;if index==1 then return [255,0,0] end if;if index==2 then return [0,255,0] end if;if index==3 then return [255,255,0] end if
  if index==4 then return [0,0,255] end if;if index==5 then return [0,255,255] end if;if index==6 then return [255,0,255] end if;return [255,255,255]
end function
function drawConsoleGlyph(media,glyph,scaleX,scaleY)
  color=consoleColor(glyph.color);return baseMatchDisplay.appendGlyphCode(media,glyph.ch,glyph.x,glyph.y,8,16,scaleX,scaleY,color[0],color[1],color[2])
end function
function drawConsoleField(media,field,scaleX,scaleY)
  if field==void or not field.active then return true end if;return baseMatchDisplay.appendString(media,field.text,field.x,field.y,8,16,scaleX,scaleY,255,255,255,false)
end function
function drawProductiveConsole(media,background,matchState,width,height,now)
  runtime=match.clientConsoleState(matchState);if runtime==void then return consoleDisplay.draw(media,match.clientTextState(matchState),width,height,now) end if
  view=match.clientConsoleView(matchState,now,16,"MiniQuake3");scaleX=width/640.0;scaleY=height/480.0
  if view.mode=="solid" then
    bottom=numeric.trunc32(view.solid.scanlines*scaleY)-1;if bottom>=0 then painted=consoleBackground.draw(background,width,bottom+1,now);if painted is error then return painted end if end if
    separator=bottom+1;if separator<height then window.drawLine(window.LoadingPoint(0,separator),window.LoadingPoint(width-1,separator),255,0,0);if separator+1<height then window.drawLine(window.LoadingPoint(0,separator+1),window.LoadingPoint(width-1,separator+1),255,0,0) end if end if
    begun=baseMatchDisplay.beginGlyphBatch(media);if begun is error then return begun end if
    for each glyph in view.solid.glyphs drawn=drawConsoleGlyph(media,glyph,scaleX,scaleY);if drawn is error then return drawn end if end for
    field=drawConsoleField(media,view.solid.input,scaleX,scaleY);if field is error then return field end if;return baseMatchDisplay.flushGlyphBatch(media)
  else if view.mode=="notify" then
    begun=baseMatchDisplay.beginGlyphBatch(media);if begun is error then return begun end if
    for each line in view.notify.lines for each glyph in line.glyphs drawn=drawConsoleGlyph(media,glyph,scaleX,scaleY);if drawn is error then return drawn end if end for end for
    field=drawConsoleField(media,view.notify.chat,scaleX,scaleY);if field is error then return field end if;return baseMatchDisplay.flushGlyphBatch(media)
  end if
  return true
end function
function ensurePlayableBindings(state)
  for each pair in [[119,"+forward"],[115,"+back"],[100,"+moveright"],[97,"+moveleft"],[32,"+moveup"],[178,"+attack"]]
    if match.keyBinding(state,pair[0])=="" then match.setKeyBinding(state,pair[0],pair[1]) end if
  end for
  return void
end function
function advanceGameTick(state,clientClock,serverTime)
  // Human ClientThink already runs exactly once when each fresh cmd arrives.
  advanced=match.runServerTick(state,serverTime);if advanced is error then return advanced end if
  snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
  published=cgameClock.publishSnapshot(clientClock,state.context.snapshotNumber,snapshot.serverTime,0);if published is error then return published end if
  return snapshot
end function
function drawFrame(state,clientClock,realtime,demoTime)
  begun=match.beginRendererFrame(state);if begun is error then return begun end if
  drawTime=demoTime
  if drawTime==void then
    frameTime=cgameClock.frame(clientClock,realtime);if frameTime is error then return frameTime end if
    if not frameTime.draw and not (clientClock.state.serverPaused and clientClock.state.connectionState==8) then return false end if
    drawTime=frameTime.serverTime
  end if
  drawn=match.drawCgameProductiveInFrame(state,drawTime);if drawn is error then return drawn end if
  if len(state.context.errors)>0 then return fail(state.context.errors[0]) end if
  return drawn
end function
function uploadLightmaps(map)
  count=map.counts[14];if count>WORLD_TEXTURE_FIRST_SLOT then count=WORLD_TEXTURE_FIRST_SLOT end if
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
function preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode,lodScale,lodBias)
  plan=portalPass.prepare(selectedWorld,worldCatalog,source.geometry,source.source.refdef,false);if plan is error or plan==void then return plan end if
  if grid!=void then ignored=lightGrid.setDynamicLights(grid,source.source.scene.dlights) end if
  geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.refdef,8192,frameCache,frameCache.normalTable,grid,shadowMode,fogCatalog,lodScale,lodBias);if geometry is error then return geometry end if
  geometry=portalClip.clipScene(geometry,plan.view.planeNormal,plan.view.planeDist);if geometry is error then return geometry end if
  refreshed=sceneMaterials.refresh(qvmCatalog,archive,geometry.triangles,assetNames,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS);if refreshed is error then return refreshed end if
  boundVideo=qvmVideo.bindCatalog(videoManager,qvmCatalog,plan.refdef.time);if boundVideo is error then return boundVideo end if
  batch=sceneBatch.buildWithGeometry(qvmCatalog,geometry);if batch is error then return batch end if
  attached=sceneBatch.attachFog(batch,fogCatalog);if attached is error then return attached end if
  if len(source.source.scene.dlights)>0 then attached=sceneBatch.attachDynamicLights(batch,qvmCatalog,dlightCatalog);if attached is error then return attached end if end if
  portalConfig=worldSelection.forView(worldConfig,plan.refdef);if portalConfig is error then return portalConfig end if
  chosen=worldSelection.selectPortalCached(worldCache,refdefCamera(plan.refdef),plan.view.pvsOrigin,portalConfig);if chosen is error then return chosen end if
  planeNormal=plan.view.planeNormal;planeDist=plan.view.planeDist
  world=portalPass.cachedWorldBatch(portalCache,chosen.faceIndexes,planeNormal,planeDist)
  if world==void then
    worldData=worldSelection.cachedRenderData(worldCache,chosen);if worldData is error then return worldData end if
    clippedWorld=portalClip.clipRenderData(worldData,planeNormal,planeDist);if clippedWorld is error then return clippedWorld end if
    world=worldBatch.buildMaterials(clippedWorld,worldCatalog,skyFlags);if world is error then return world end if
    attached=attachWorldEffects(world,clippedWorld,fogCatalog,dlightCatalog,dlightReceiveFlags);if attached is error then return attached end if
    portalPass.storeWorldBatch(portalCache,chosen.faceIndexes,planeNormal,planeDist,world)
  end if
  target=qvmViewport.prepare(plan.refdef,SOURCE_WIDTH,SOURCE_HEIGHT,worldConfig.width,worldConfig.height);if target is error then return target end if
  return PreparedPortal(plan,world,batch,target,source.source)
end function
function preparePortals(preparedViews,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode,lodScale,lodBias)
  result=lists.List.withCapacity(len(preparedViews));for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,kinds,frameCache,grid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowMode,lodScale,lodBias);if portal is error then return portal end if;result.add(portal) end for;return result.toArray()
end function
function drawCinematics(state,mode)
  draws=cinematics.takeDraws(state.context.cinematics);drawn=0
  for each draw in draws
    presentation=cinematics.presentation(draw,640,480,mode.width,mode.height);if presentation is error then return presentation end if
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
function bootFrameSettingsNamed(archive,map,mapName,qvmRoot,settings)
  state=match.bootWithQvmsSettingsNamed(archive,map,mapName,1000,qvmRoot,settings);if state is error then return state end if
  joined=match.connectLocal(state,0);if joined is error then return joined end if
  started=false
  // Two ticks are sufficient to publish the first snapshot, initialize
  // cgame and draw one post-init frame.  The former eight-tick warmup merely
  // repeated interpreted QVM work before the window became interactive.
  for frame=1 to 2
    // Bootstrap snapshots must not move the player before any user input.
    serverTime=1000+frame*50;command=qworld.userCommand(serverTime,[0,0,0],0,2,0,0,0)
    submitted=match.submitUsercmd(state,0,command);if submitted is error then return submitted end if
    advanced=match.runServerFrame(state,serverTime);if advanced is error then return advanced end if
    snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
    if not started then client=match.bootCgame(state);if client is error then return client end if;started=true end if
    state.context.soundCommands=[];drawn=match.drawCgameProductive(state,serverTime);if drawn is error then return drawn end if
    if len(state.context.errors)>0 then return fail(state.context.errors[0]) end if
  end for
  return state
end function
function bootFrameSettings(archive,map,qvmRoot,settings) return bootFrameSettingsNamed(archive,map,"q3dm1",qvmRoot,settings) end function
function bootFrame(archive,map,qvmRoot) return bootFrameSettings(archive,map,qvmRoot,void) end function

function bootMatch(archive,map,mapName,qvmRoot,settings,source)
  if source==void then return bootFrameSettingsNamed(archive,map,mapName,qvmRoot,settings) end if
  state=try(match.bootServerStream(archive,map,mapName,qvmRoot,settings,source.protocol,source.demo,source.name,1000))
  if state is error then return state end if
  drawn=try(match.drawCgameProductive(state,state.context.latestSnapshot.serverTime))
  if drawn is error then match.shutdown(state);return drawn end if
  if len(state.context.errors)>0 then
    reason=state.context.errors[0];match.shutdown(state);return fail(reason)
  end if
  state.context.now=1000
  return state
end function

function updateStream(state,source,clientClock,serverTime,demoTime)
  if source.demo then
    read=try(demos.advance(source.transport,demoTime,serverTime));if read is error then return read end if
  else
    received=try(remote.pump(source.transport,serverTime,64));if received is error then return received end if
  end if
  synced=try(match.refreshServerStream(state,serverTime));if synced is error or not synced then return synced end if
  if not source.demo and state.context.snapshotNumber!=clientClock.snapshotNumber then
    snap=source.protocol.dispatcher.snapshotState.snap
    cgameClock.publishSnapshot(clientClock,snap.messageNum,snap.serverTime,snap.snapFlags)
  end if
  return true
end function

function sendStreamFrame(state,source,created,now)
  systemInfo=state.context.configstrings[1]
  if systemInfo!=source.systemInfo then
    remote.updateServerSystemInfo(source.transport,systemInfo);source.systemInfo=systemInfo
  end if
  registry=state.context.cvars
  if (registry.modifiedFlags&cvar.USERINFO)!=0 then
    updated=try(remote.updateUserinfo(source.transport,cvar.infoString(registry,cvar.USERINFO)))
    if updated is error then return updated end if
    registry.modifiedFlags=registry.modifiedFlags&(~cvar.USERINFO)
  end if
  for each command in match.takeStreamCommands(state)
    queued=try(remote.queueReliable(source.transport,command));if queued is error then return queued end if
  end for
  if created==void then return false end if
  recorded=try(match.recordLocalUsercmd(state.context,0,created));if recorded is error then return recorded end if
  return remote.writeFrame(source.transport,created,now)
end function

function runMatch(archive,map,mapName,qvmRoot,maxFrames,settings,session,source)
  if archive==void or map==void or maxFrames==0 or maxFrames< -1 then return fail("invalid launch input") end if
  opened=window.open(SOURCE_WIDTH,SOURCE_HEIGHT);if opened is error then return opened end if
  startupAt=window.milliseconds();loading=window.showLoading(3,"Booting original game and cgame QVMs");if loading is error then window.shutdown();return loading end if;if not loading then window.shutdown();return 0 end if
  state=try(bootMatch(archive,map,mapName,qvmRoot,settings,source));if state is error then return state end if
  mode=desktopVideo.open(state.context.cvars);if mode is error then window.shutdown();match.shutdown(state);return mode end if
  qvmBootAt=window.milliseconds();loading=window.showLoading(24,"Booting original UI QVM");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  if session==void then ensurePlayableBindings(state) end if
  clientClock=cgameClock.create(state.context.now,state.context.snapshotNumber,state.context.latestSnapshot.serverTime);if clientClock is error then window.shutdown();match.shutdown(state);return clientClock end if
  bootedUi=match.bootUi(state);if bootedUi is error then window.shutdown();match.shutdown(state);return bootedUi end if
  if session!=void then attached=desktopSession.attach(state,session);if attached is error then window.shutdown();match.shutdown(state);return attached end if end if
  videoManager=qvmVideo.create(state.context.cinematics,CINEMATIC_TEXTURE_FIRST_SLOT,cinematics.MAX_HANDLES);if videoManager is error then window.shutdown();match.shutdown(state);return videoManager end if
  frameCache=sceneGeometry.createFrameCache(void,MD3_FRAME_CACHE_ENTRIES);if frameCache is error then window.shutdown();match.shutdown(state);return frameCache end if
  view=largestView(state.context.renderViews);if view==void then window.shutdown();match.shutdown(state);return fail("cgame submitted no render view") end if
  uiBootAt=window.milliseconds();loading=window.showLoading(32,"Indexing retail shaders");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then window.shutdown();match.shutdown(state);return scripts end if
  scriptIndexAt=window.milliseconds();loading=window.showLoading(48,"Resolving scene and HUD materials");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  qvmCatalog=sceneMaterials.buildIndexed(archive,[],state.context.assets,state.context.assetKinds,QVM_TEXTURE_FIRST_SLOT,MAX_QVM_TEXTURE_SLOTS,state.context.shaderRemaps,scripts);if qvmCatalog is error then window.shutdown();match.shutdown(state);return qvmCatalog end if
  shadowVariable=cvar.get(state.context.cvars,"cg_shadows","1",cvar.ARCHIVE);lodScaleVariable=cvar.get(state.context.cvars,"r_lodscale","5",cvar.CHEAT);lodBiasVariable=cvar.get(state.context.cvars,"r_lodbias","0",cvar.ARCHIVE)
  preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,void,void,void,void,shadowVariable.integer,lodScaleVariable.value,lodBiasVariable.integer,mode);if preparedViews is error then window.shutdown();match.shutdown(state);return preparedViews end if
  hudCatalog=qvm2d.buildIndexed(archive,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,QVM_2D_TEXTURE_FIRST_SLOT,MAX_QVM_2D_TEXTURE_SLOTS,SOURCE_WIDTH,SOURCE_HEIGHT,mode.width,mode.height,state.context.shaderRemaps,scripts);if hudCatalog is error then window.shutdown();match.shutdown(state);return hudCatalog end if
  consoleBackgroundMedia=consoleBackground.load(archive,CONSOLE_BACKGROUND_TEXTURE_SLOT);if consoleBackgroundMedia is error then window.shutdown();match.shutdown(state);return consoleBackgroundMedia end if
  consoleMedia=baseMatchDisplay.load(archive,CONSOLE_FONT_TEXTURE_SLOT);if consoleMedia is error then window.shutdown();match.shutdown(state);return consoleMedia end if
  boundVideo=qvmVideo.bindCatalog(videoManager,hudCatalog,state.context.now);if boundVideo is error then window.shutdown();match.shutdown(state);return boundVideo end if
  sceneAt=window.milliseconds();loading=window.showLoading(64,"Decoding registered sounds");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  soundCatalog=qvmSoundAssets.load(archive,state.context.assets,state.context.assetKinds);if soundCatalog is error then window.shutdown();match.shutdown(state);return soundCatalog end if
  audio=qvmPlayback.create(soundCatalog,22050,qvmSoundAssets.CHUNK_FRAMES);if audio is error then window.shutdown();match.shutdown(state);return audio end if
  applied=qvmPlayback.apply(audio,state.context.soundCommands);if applied is error then window.shutdown();match.shutdown(state);return applied end if
  soundAt=window.milliseconds();loading=window.showLoading(78,"Building "+mapName+" world materials");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  worldCatalog=materials.loadIndexed(archive,map,QVM_TEXTURE_FIRST_SLOT-WORLD_TEXTURE_FIRST_SLOT-16,WORLD_TEXTURE_FIRST_SLOT,scripts[0],scripts[1]);if worldCatalog is error then window.shutdown();match.shutdown(state);return worldCatalog end if
  materials.seedImageCacheFromCatalog(qvmCatalog.imageCache,worldCatalog)
  sceneMaterials.warmRegisteredPlayerSkins(qvmCatalog,archive,state.context.assets,state.context.assetKinds)
  boundVideo=qvmVideo.bindCatalog(videoManager,worldCatalog,state.context.now);if boundVideo is error then window.shutdown();match.shutdown(state);return boundVideo end if
  nextWorldTextureSlot=WORLD_TEXTURE_FIRST_SLOT+worldCatalog.textureCount
  skyCatalog=void;availableWorldTextureSlots=QVM_TEXTURE_FIRST_SLOT-nextWorldTextureSlot
  if availableWorldTextureSlots>=playableSky.REQUIRED_TEXTURES then loadedSky=try(playableSky.loadMap(archive,map,scripts[0],nextWorldTextureSlot,availableWorldTextureSlots));if not (loadedSky is error) and loadedSky!=void then skyCatalog=loadedSky;nextWorldTextureSlot=skyCatalog.firstTextureSlot+skyCatalog.textureCount end if end if
  fogCatalog=void
  if map.counts[12]>0 and nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedFog=try(playableFog.load(map,scripts[0]));if not (loadedFog is error) then assignedFog=playableFog.assignTexture(loadedFog,nextWorldTextureSlot);if not (assignedFog is error) then fogCatalog=loadedFog;nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if end if
  dlightCatalog=void
  if nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedDlights=try(dynamicLights.createCatalog(nextWorldTextureSlot));if not (loadedDlights is error) then dlightCatalog=loadedDlights;nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if
  flareCatalog=void;flareVariable=cvar.get(state.context.cvars,"r_flares","0",cvar.ARCHIVE)
  if nextWorldTextureSlot<QVM_TEXTURE_FIRST_SLOT then loadedFlares=try(flares.load(archive,map,scripts[0],nextWorldTextureSlot,flareVariable.integer!=0));if not (loadedFlares is error) then flareCatalog=loadedFlares;if flareCatalog.image!=void then nextWorldTextureSlot=nextWorldTextureSlot+1 end if end if end if
  worldConfig=worldSelection.defaults(mode.width,mode.height);if worldConfig is error then window.shutdown();match.shutdown(state);return worldConfig end if
  lodCurveError=cvar.get(state.context.cvars,"r_lodCurveError","250",cvar.ARCHIVE|cvar.CHEAT)
  worldConfig.lodCurveError=lodCurveError.value
  worldSelection.setView(worldConfig,view.refdef)
  worldCache=worldSelection.buildCacheForPatches(map,worldConfig.patchError,true);if worldCache is error then window.shutdown();match.shutdown(state);return worldCache end if
  // Visible world surfaces are occluders, not an expendable performance
  // budget. Keep every selected surface even on maps larger than q3dm1.
  worldConfig.triangleBudget=worldCache.totalTriangleCount
  configured=worldSelection.setIndexedCulling(worldCache,scripts[0]);if configured is error then window.shutdown();match.shutdown(state);return configured end if
  selected=worldSelection.prepareCached(worldCache,selectionCamera(view),worldConfig);if selected is error then window.shutdown();match.shutdown(state);return selected end if
  skyFlags=array(map.counts[1],false);dlightReceiveFlags=array(map.counts[1],false)
  for textureIndex=0 to map.counts[1]-1 mapShader=materials.shaderName(map,textureIndex);if mapShader is error then window.shutdown();match.shutdown(state);return mapShader end if;skyFlags[textureIndex]=playableSky.isSkyShaderIndexed(scripts[0],mapShader);surfaceFlags=materials.shaderSurfaceFlags(map,textureIndex);if surfaceFlags is error then window.shutdown();match.shutdown(state);return surfaceFlags end if;dlightReceiveFlags[textureIndex]=not skyFlags[textureIndex] and (surfaceFlags&0x20000)==0 end for
  for each material in worldCatalog.materials if material.textureIndex>=0 and material.textureIndex<len(dlightReceiveFlags) and material.sort>3.0 then dlightReceiveFlags[material.textureIndex]=false end if end for
  retainedWorldCache=retainedWorld.create(worldCache,worldCatalog,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags);if retainedWorldCache is error then window.shutdown();match.shutdown(state);return retainedWorldCache end if
  worldPrepared=retainedWorld.select(retainedWorldCache,selected);if worldPrepared is error then window.shutdown();match.shutdown(state);return worldPrepared end if;selectedFaces=selected.selection.faceIndexes
  worldAt=window.milliseconds();loading=window.showLoading(90,"Uploading textures and starting audio");if loading is error then window.shutdown();match.shutdown(state);return loading end if;if not loading then window.shutdown();match.shutdown(state);return 0 end if
  keys=inputLatch.create(256);if keys is error then window.shutdown();match.shutdown(state);return keys end if;nativeInput=NativeInput([0,0],keys);ui=localQvmUi.attach(state,nativeInput,nativeKeyDown,nativeMouseDelta);if ui is error then window.shutdown();match.shutdown(state);return ui end if
  uploaded=worldBatch.uploadMaterials(worldCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=qvm2d.upload(hudCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=consoleBackground.upload(consoleBackgroundMedia);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  uploaded=baseMatchDisplay.upload(consoleMedia);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  if skyCatalog!=void then uploaded=playableSky.upload(skyCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  if fogCatalog!=void then uploaded=playableFog.upload(fogCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  if dlightCatalog!=void then uploaded=dynamicLights.upload(dlightCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  if flareCatalog!=void then uploaded=flares.upload(flareCatalog);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if end if
  uploaded=uploadLightmaps(map);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if
  audioStarted=try(audioOutput.init(22050));if audioStarted is error then print "Warning: audio output unavailable; continuing without sound." end if
  readyAt=window.milliseconds();print "QVM startup profile: boot="+str(qvmBootAt-startupAt)+"ms ui="+str(uiBootAt-qvmBootAt)+"ms shaders="+str(scriptIndexAt-uiBootAt)+"ms scene="+str(sceneAt-scriptIndexAt)+"ms sounds="+str(soundAt-sceneAt)+"ms world="+str(worldAt-soundAt)+"ms upload="+str(readyAt-worldAt)+"ms total="+str(readyAt-startupAt)+"ms"
  print "QVM retained world: enabled="+str(retainedWorldCache.enabled)+" staticPrimes="+str(retainedWorldCache.staticPrimes)+" (worldRebuild timing includes selected effects)"
  rendererName="software";if window.hardwareRenderer() then rendererName="hardware OpenGL" end if;print "QVM renderer: "+rendererName+" / "+str(window.glInfo(1))
  titleState=fpsTitle.create("Original QVM "+mapName,window.milliseconds());window.setTitle(fpsTitle.initialTitle(titleState))
  frames=0;hudMs=0;videoBindMs=0;soundApplyMs=0;textureUploadMs=0
  // Discard key/mouse messages accumulated while the QVMs and retail assets
  // were loading.  Rebasing those old native timestamps onto the game clock
  // made them negative after a slow cold start and crashed the input bridge.
  window.inputClear();discardedEvents=window.inputEvents(256);if discardedEvents is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return discardedEvents end if
  state.context.console=[];quitRequested=false;uploadedSceneSlot=qvmCatalog.nextTextureSlot;uploadedHudTextures=len(hudCatalog.textures);soundAssetCount=len(state.context.assets);simulationMs=0;gameMs=0;cgameMs=0;uiMs=0;geometryMs=0;batchMs=0;renderMs=0;audioMs=0;totalMs=0;pipelineProfile=PipelineProfile(0,0,0);simulationTicks=0;simulationTime=state.context.now;simulationStart=simulationTime;realStart=window.milliseconds()
  previousWall=realStart;hostTime=simulationStart;wasPaused=false;lastSave=realStart
  demoPlaying=source!=void and source.demo
  initialDemoTime=state.context.latestSnapshot.serverTime
  streamFailure=void
  pauseRequest=cvar.get(state.context.cvars,"cl_paused","0",0)
  if source!=void then simulationStart=realStart;hostTime=simulationStart end if
  frameState=frameInput.create(state.context.latestSnapshot.playerState.viewangles,state.context.latestSnapshot.playerState.delta_angles,simulationStart,state.context.latestSnapshot.serverTime);if frameState is error then window.shutdown();match.shutdown(state);return frameState end if
  frameInput.bindConfig(frameState,state.context.cvars)
  initialPlan=frameInput.prepare(frameState,simulationStart,state.context.commandNumber,clientClock.state.connectionState,true,false,false);inputBridge=ClientInputBridge(frameState,initialPlan,ui,state);match.attachInputClear(state,inputBridge,clearClientInput)
  // The BSP, world catalog and static effect layout are fixed for this match.
  // Refdef time, camera and current lights still drive every portal draw.
  portalCache=portalPass.worldBatchCache()
  worldSelectMs=0;worldRebuildMs=0;worldEffectsMs=0;portalPrepareMs=0;worldRebuildCount=0
  frameHistogram=frameTiming.histogram();maximumFrameMs=0;interactiveInput=maxFrames<0
  while not window.shouldClose() and not quitRequested and (maxFrames<0 or frames<maxFrames)
    startedAt=window.milliseconds();uiTime=simulationStart+frameTiming.elapsed(realStart,startedAt);steps=0;state.context.soundCommands=[]
    // Com_ModifyMsec caps a local server frame at 200 ms. Discard excess
    // wall time so a single stall cannot trigger more stalls while catching up.
    frameMsec=frameTiming.elapsed(previousWall,startedAt);if frameMsec>200 then frameMsec=200 end if;previousWall=startedAt
    serverTime=hostTime;if not wasPaused then serverTime=serverTime+frameMsec end if
    if source!=void then serverTime=startedAt end if
    demoTime=void
    if demoPlaying then demoTime=initialDemoTime+frameTiming.elapsed(realStart,startedAt) end if
    begun=inputLatch.beginFrame(nativeInput.keys);if begun is error then window.shutdown();match.shutdown(state);return begun end if;window.poll()
    state.context.now=serverTime
    plan=frameInput.prepare(frameState,serverTime,state.context.commandNumber,clientClock.state.connectionState,true,wasPaused,wasPaused);if plan is error then window.shutdown();match.shutdown(state);return plan end if;inputBridge.plan=plan
    // Bounded smoke/performance runs must not depend on physical desktop
    // activity. Continue pumping Win32 lifecycle/close messages, but keep the
    // game commands and the UI's key/mouse callbacks neutral in this mode.
    if interactiveInput then
      nativeInput.mouse=window.mouseDelta();nativeEvents=window.inputEvents(256);if nativeEvents is error then window.shutdown();match.shutdown(state);return nativeEvents end if;observed=observeNativeInputEvents(nativeInput,nativeEvents);if observed is error then window.shutdown();match.shutdown(state);return observed end if
      eventNow=window.milliseconds()
      for each event in nativeEvents
        if demoPlaying and event.type==window.INPUT_KEY and event.value2!=0 and match.keyCatcher(state)==0 and ((event.value<128 and event.value!=96 and event.value!=126) or event.value==178) then
          session.action="menu";break
        end if
        event.time=serverTime-frameTiming.elapsed(event.time,eventNow)
        if event.time<frameState.oldFrameTime then event.time=frameState.oldFrameTime end if
        applied=applyInputEvent(inputBridge,state,event);if applied is error then window.shutdown();match.shutdown(state);return applied end if
      end for
    else
      window.inputClear()
    end if
    inputCommands.execute(state.context.commandState)
    if session!=void and session.action!="" then break end if
    toggleFullscreen=window.takeVideoRestart()
    if toggleFullscreen or (session!=void and session.videoRestart) then
      if session!=void then session.videoRestart=false end if
      changedMode=try(desktopVideo.apply(state.context.cvars,toggleFullscreen))
      if changedMode is error then
        match.emitPrint(state.context,"Could not apply video settings.\n")
      else
        if mode.picmip!=changedMode.picmip then
          uploaded=worldBatch.uploadMaterials(worldCatalog);if uploaded is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return uploaded end if
          uploaded=sceneBatch.upload(qvmCatalog);if uploaded is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return uploaded end if
        end if
        mode=changedMode;worldConfig.width=mode.width;worldConfig.height=mode.height
      end if
    end if
    if session!=void and frameTiming.elapsed(lastSave,startedAt)>=1000 then desktopSession.save(state,session);lastSave=startedAt end if
    paused=source==void and pauseRequest.integer!=0
    if paused!=wasPaused then
      if paused then serverTime=hostTime end if
      plan=frameInput.prepare(frameState,serverTime,state.context.commandNumber,clientClock.state.connectionState,true,paused,paused);if plan is error then window.shutdown();match.shutdown(state);return plan end if;inputBridge.plan=plan
      cgameClock.setPaused(clientClock,paused,paused,true)
    end if
    wasPaused=paused;hostTime=serverTime
    if source==void then
      if not paused then botFrame=match.runBotFrame(state,serverTime);if botFrame is error then window.shutdown();match.shutdown(state);return botFrame end if end if
      while not paused and simulationTime+50<=serverTime and steps<4
        simulationTime=simulationTime+50;advanced=advanceGameTick(state,clientClock,simulationTime);if advanced is error then window.shutdown();match.shutdown(state);return advanced end if;steps=steps+1;simulationTicks=simulationTicks+1
      end while
    else
      synced=try(updateStream(state,source,clientClock,serverTime,demoTime))
      if synced is error then streamFailure=synced;break end if
      if not synced then session.action="stream-reload";break end if
      if demoPlaying and source.transport.completed and demoTime>state.context.latestSnapshot.serverTime then session.action="menu";break end if
    end if
    state.context.now=serverTime
    cmdTime=frameInput.commandTime(frameState,clientClock.state.serverTime,clientClock.state.connectionState==8)
    created=frameInput.finish(frameState,plan,cmdTime,match.cgameUserCmdValue(state),match.cgameSensitivity(state),match.keyCatcher(state),match.anyKeyDown(state));if created is error then window.shutdown();match.shutdown(state);return created end if
    if source==void then
      if created!=void then submitted=match.submitUsercmdAtHostTime(state,0,created,serverTime);if submitted is error then window.shutdown();match.shutdown(state);return submitted end if end if
    else if not demoPlaying then
      sent=try(sendStreamFrame(state,source,created,serverTime));if sent is error then streamFailure=sent;break end if
    end if
    // Original CL_SendCmd precedes CL_SetCGameTime: the command uses the
    // preceding CG server time; drawFrame advances CG time without fabrication.
    afterGame=window.milliseconds();gameMs=gameMs+afterGame-startedAt
    // Original SCR_DrawScreenField suppresses the game beneath fullscreen UI
    // (Setup/Controls), but keeps it behind the translucent ingame menu.
    uiFullscreen=false
    if uiSession.active(ui) then uiFullscreen=localQvmUi.fullscreen(state);if uiFullscreen is error then window.shutdown();match.shutdown(state);return uiFullscreen end if end if
    if uiFullscreen then
      reset=match.beginRendererFrame(state);if reset is error then window.shutdown();match.shutdown(state);return reset end if
    else
      drawnFrame=drawFrame(state,clientClock,serverTime,demoTime);if drawnFrame is error then window.shutdown();match.shutdown(state);return drawnFrame end if
      gameView=largestView(state.context.renderViews);if gameView!=void then view=gameView end if
    end if
    afterCgame=window.milliseconds();cgameMs=cgameMs+afterCgame-afterGame
    uiFrame=refreshUiFrame(ui,uiTime);if uiFrame is error then window.shutdown();match.shutdown(state);return uiFrame end if
    quitRequested=requestedQuit(state);state.context.console=[];if quitRequested then break end if
    cinematicSamples=collectCinematicAudio(state,audio);if cinematicSamples is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return cinematicSamples end if
    afterSimulation=window.milliseconds();uiMs=uiMs+afterSimulation-afterCgame;simulationMs=simulationMs+afterSimulation-startedAt
    preparedViews=prepareViews(state.context.renderViews,qvmCatalog,archive,state.context.modelAssets,state.context.assets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,preparedViews,pipelineProfile,fogCatalog,dlightCatalog,shadowVariable.integer,lodScaleVariable.value,lodBiasVariable.integer,mode);if preparedViews is error then window.shutdown();match.shutdown(state);return preparedViews end if
    preparedPortals=void
    if not uiFullscreen then
      worldStartedAt=window.milliseconds();worldSelection.setView(worldConfig,view.refdef)
      worldConfig.lodCurveError=lodCurveError.value
      nextWorld=worldSelection.prepareCachedRetained(worldCache,selectionCamera(view),worldConfig,selected);if nextWorld is error then window.shutdown();match.shutdown(state);return nextWorld end if
      worldSelectMs=worldSelectMs+window.milliseconds()-worldStartedAt
      if not worldSelection.sameFaces(selectedFaces,nextWorld.selection.faceIndexes) then
        rebuildStartedAt=window.milliseconds();worldPrepared=retainedWorld.select(retainedWorldCache,nextWorld);if worldPrepared is error then window.shutdown();match.shutdown(state);return worldPrepared end if
        worldRebuildMs=worldRebuildMs+window.milliseconds()-rebuildStartedAt;worldRebuildCount=worldRebuildCount+1
        selectedFaces=nextWorld.selection.faceIndexes
      end if
      selected=nextWorld;portalsStartedAt=window.milliseconds()
      preparedPortals=preparePortals(preparedViews,selected.renderData,portalCache,worldCatalog,qvmCatalog,archive,state.context.modelAssets,state.context.assets,state.context.assetKinds,frameCache,state.context.lightGrid,videoManager,worldCache,worldConfig,skyFlags,fogCatalog,dlightCatalog,dlightReceiveFlags,shadowVariable.integer,lodScaleVariable.value,lodBiasVariable.integer);if preparedPortals is error then window.shutdown();match.shutdown(state);return preparedPortals end if
      portalPrepareMs=portalPrepareMs+window.milliseconds()-portalsStartedAt
    end if
    afterGeometry=window.milliseconds();geometryMs=geometryMs+afterGeometry-afterSimulation
    refreshedHud=qvm2d.refresh(hudCatalog,state.context.renderQueue.commands,state.context.assets,state.context.assetKinds,SOURCE_WIDTH,SOURCE_HEIGHT,mode.width,mode.height);if refreshedHud is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return refreshedHud end if
    if len(hudCatalog.textures)>uploadedHudTextures then uploaded=qvm2d.uploadFrom(hudCatalog,uploadedHudTextures);if uploaded is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return uploaded end if;uploadedHudTextures=uploaded end if
    afterHud=window.milliseconds();hudMs=hudMs+afterHud-afterGeometry
    boundVideo=qvmVideo.bindCatalog(videoManager,hudCatalog,uiTime);if boundVideo is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return boundVideo end if
    afterVideoBind=window.milliseconds();videoBindMs=videoBindMs+afterVideoBind-afterHud
    if len(state.context.assets)!=soundAssetCount then synced=qvmSoundAssets.sync(soundCatalog,state.context.assets,state.context.assetKinds);if synced is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return synced end if;soundAssetCount=len(state.context.assets) end if
    applied=qvmPlayback.apply(audio,state.context.soundCommands);if applied is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return applied end if
    afterSoundApply=window.milliseconds();soundApplyMs=soundApplyMs+afterSoundApply-afterVideoBind
    if qvmCatalog.nextTextureSlot>uploadedSceneSlot then uploaded=worldBatch.uploadMaterialsFrom(qvmCatalog,uploadedSceneSlot);if uploaded is error then window.shutdown();match.shutdown(state);return uploaded end if;uploadedSceneSlot=qvmCatalog.nextTextureSlot end if
    videoUploads=qvmVideo.update(videoManager,uiTime);if videoUploads is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return videoUploads end if
    for each videoUpload in videoUploads if not window.uploadTextureNoMip(videoUpload.slot,videoUpload.pixels,videoUpload.width,videoUpload.height) then audioOutput.shutdown();window.shutdown();match.shutdown(state);return fail("could not upload shader cinematic frame") end if end for
    afterBatch=window.milliseconds();textureUploadMs=textureUploadMs+afterBatch-afterSoundApply;batchMs=batchMs+afterBatch-afterGeometry
    window.beginFrame(0,0,0)
    preparedViewIndex=0
    for each preparedView in preparedViews
      window.clearDepth(0.0)
      preparedPortal=void;if preparedPortals!=void then preparedPortal=preparedPortals[preparedViewIndex] end if
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
    if not uiFullscreen then cinematicDraws=drawCinematics(state,mode);if cinematicDraws is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return cinematicDraws end if end if
    hudTime=view.refdef.time;if uiSession.active(ui) then hudTime=uiTime end if
    drawn=qvm2d.draw(hudCatalog,hudTime);if drawn is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return drawn end if
    drawn=drawProductiveConsole(consoleMedia,consoleBackgroundMedia,state,mode.width,mode.height,uiTime);if drawn is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return drawn end if
    window.present();renderMs=renderMs+window.milliseconds()-afterBatch;frames=frames+1
    audioStartedAt=window.milliseconds();audioChunks=0
    while audioChunks<3 and audioOutput.canSubmit()
      chunk=qvmPlayback.renderFast(audio);if chunk is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return chunk end if;samples=chunk.samples
      accepted=audioOutput.submit(samples);if accepted is error then audioOutput.shutdown();window.shutdown();match.shutdown(state);return accepted end if;if not accepted then break end if;audioChunks=audioChunks+1
    end while
    audioMs=audioMs+window.milliseconds()-audioStartedAt;elapsedFrameMs=window.milliseconds()-startedAt;totalMs=totalMs+elapsedFrameMs
    if elapsedFrameMs>maximumFrameMs then maximumFrameMs=elapsedFrameMs end if
    frameTiming.record(frameHistogram,elapsedFrameMs)
    nextTitle=fpsTitle.frame(titleState,window.milliseconds());if nextTitle is error then window.shutdown();match.shutdown(state);return nextTitle end if;if nextTitle!=void then window.setTitle(nextTitle) end if
    // The uncapped original frame loop has a 1 ms minimum, not an extra
    // millisecond after every completed frame. Yield only if work was faster.
    if elapsedFrameMs<1 then time.sleep(1-elapsedFrameMs) end if
  end while
  loopElapsedMs=frameTiming.elapsed(realStart,window.milliseconds())
  print "QVM retained world selections="+str(retainedWorldCache.selections)+" fallbacks="+str(retainedWorldCache.fallbacks)
  saved=void;if session!=void then saved=desktopSession.capture(state,session) end if
  audioOutput.shutdown();qvmVideo.close(videoManager);releaseCinematics();consoleBackground.release(consoleBackgroundMedia);baseMatchDisplay.release(consoleMedia);qvm2d.release(hudCatalog);sceneBatch.release(qvmCatalog);worldBatch.releaseMaterials(worldCatalog);playableSky.release(skyCatalog);playableFog.release(fogCatalog);dynamicLights.release(dlightCatalog);flares.release(flareCatalog);if session==void then window.shutdown() end if;match.shutdown(state)
  if streamFailure is error then return streamFailure end if
  if saved is error then return saved end if
  modelCount=0;triangleCount=0;for each preparedView in preparedViews modelCount=modelCount+preparedView.geometry.modelEntities;triangleCount=triangleCount+len(preparedView.geometry.triangles) end for
  worldEffects=0;if skyCatalog!=void then worldEffects=worldEffects+1 end if;if fogCatalog!=void then worldEffects=worldEffects+1 end if;if dlightCatalog!=void then worldEffects=worldEffects+1 end if;if flareCatalog!=void and flareCatalog.enabled then worldEffects=worldEffects+1 end if
  print "QVM preview: views="+str(len(state.context.renderViews))+" selected="+str(view.refdef.width)+"x"+str(view.refdef.height)+" models="+str(modelCount)+" triangles="+str(triangleCount)+" textures="+str(len(qvmCatalog.textures))+" hudQuads="+str(hudCatalog.sourceQuads)+" sounds="+str(len(soundCatalog.clips))+" frames="+str(frames)+" worldEffects="+str(worldEffects)
  if frames>0 then print "QVM frame profile: simulation="+str(simulationMs/frames)+"ms (game="+str(gameMs/frames)+" cgame="+str(cgameMs/frames)+" ui="+str(uiMs/frames)+") geometry="+str(geometryMs/frames)+"ms (expand="+str(pipelineProfile.expansion/frames)+" material="+str(pipelineProfile.material/frames)+" sceneBatch="+str(pipelineProfile.batch/frames)+") batch="+str(batchMs/frames)+"ms render="+str(renderMs/frames)+"ms audio="+str(audioMs/frames)+"ms total="+str(totalMs/frames)+"ms ticks="+str(simulationTicks) end if
  if frames>0 then print "QVM batch profile: hud="+str(hudMs/frames)+"ms videoBindings="+str(videoBindMs/frames)+"ms soundApply="+str(soundApplyMs/frames)+"ms textureUploads="+str(textureUploadMs/frames)+"ms" end if
  if frames>0 then print "QVM world profile: select="+str(worldSelectMs/frames)+"ms rebuild="+str(worldRebuildMs/frames)+"ms effects="+str(worldEffectsMs/frames)+"ms portals="+str(portalPrepareMs/frames)+"ms rebuilds="+str(worldRebuildCount)+" portalBatchBuilds="+str(portalCache.builds)+" portalBatchHits="+str(portalCache.hits) end if
  if frames>0 and loopElapsedMs>0 then print "QVM loop profile: elapsed="+str(loopElapsedMs)+"ms fps="+str(frames*1000.0/loopElapsedMs)+" workP50="+str(framePercentile(frameHistogram,frames,50))+"ms workP95="+str(framePercentile(frameHistogram,frames,95))+"ms workP99="+str(framePercentile(frameHistogram,frames,99))+"ms workMax="+str(maximumFrameMs)+"ms" end if
  return 0
end function
function runDesktopMatch(archive,map,mapName,qvmRoot,settings,session) return runMatch(archive,map,mapName,qvmRoot,-1,settings,session,void) end function
function runDesktopStream(archive,map,mapName,qvmRoot,settings,session,source)
  return runMatch(archive,map,mapName,qvmRoot,-1,settings,session,source)
end function
function runLimitedSettingsNamed(archive,map,mapName,qvmRoot,maxFrames,settings) return runMatch(archive,map,mapName,qvmRoot,maxFrames,settings,void,void) end function
function runLimitedSettings(archive,map,qvmRoot,maxFrames,settings) return runLimitedSettingsNamed(archive,map,"q3dm1",qvmRoot,maxFrames,settings) end function
function runLimited(archive,map,qvmRoot,maxFrames) return runLimitedSettings(archive,map,qvmRoot,maxFrames,void) end function
function runWithSettings(archive,map,qvmRoot,settings) return runLimitedSettings(archive,map,qvmRoot,-1,settings) end function
function runWithSettingsNamed(archive,map,mapName,qvmRoot,settings) return runLimitedSettingsNamed(archive,map,mapName,qvmRoot,-1,settings) end function
function run(archive,map,qvmRoot) return runLimited(archive,map,qvmRoot,-1) end function
