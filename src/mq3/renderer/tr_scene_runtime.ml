// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete stateful renderer scene front end corresponding to tr_scene.c.
package mq3.renderer.tr_scene_runtime

import mq3.renderer.scene_queue as queue

const RDF_NOWORLDMODEL=1
const ENTITYNUM_WORLD=1022

/// Data record for `mq3.renderer.tr_scene_runtime.RefdefInput`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 6 further fields.
struct RefdefInput x y width height fovX fovY vieworg viewaxis time rdflags areamask text end struct
/// Data record for `mq3.renderer.tr_scene_runtime.Refdef`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 12 further fields.
struct Refdef x y width height fovX fovY vieworg viewaxis time rdflags areamask areamaskModified text floatTime numDrawSurfs entities dlights polys end struct
/// Data record for `mq3.renderer.tr_scene_runtime.ViewParms`; groups `viewportX`, `viewportY`, `viewportWidth`, `viewportHeight`, `isPortal`, `fovX`, and 4 further fields.
struct ViewParms viewportX viewportY viewportWidth viewportHeight isPortal fovX fovY origin axis pvsOrigin end struct
/// Callback table for `mq3.renderer.tr_scene_runtime.Services`; exposes `timeFn`, `renderViewFn`, `drawSurfFn`, `shaderFn`, `eventFn`, `context`.
struct Services timeFn renderViewFn drawSurfFn shaderFn eventFn context end struct
/// Data record for `mq3.renderer.tr_scene_runtime.State`; groups `scene`, `smpEnabled`, `smpFrame`, `commandUsed`, `registered`, `noRefresh`, and 12 further fields.
struct State scene smpEnabled smpFrame commandUsed registered noRefresh worldLoaded dynamicLight vertexLight hardwareType vidHeight firstSceneDrawSurf frameSceneNum sceneCount frontEndMsec areaMask refdef services end struct

/// Constructs `mq3.renderer.tr_scene_runtime.Services` with `timeFn` = `void`, `renderViewFn` = `void`, `drawSurfFn` = `void`, `shaderFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void,void) end function
/// Constructs `mq3.renderer.tr_scene_runtime.Refdef` with `x` = `0`, `y` = `0`, `width` = `0`, `height` = `0` and the supplied remaining values.
function emptyRefdef() return Refdef(0,0,0,0,0.0,0.0,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],0,0,[],false,"",0.0,0,[],[],[]) end function
/// Builds `mq3.renderer.tr_scene_runtime.State` for `mq3.renderer.tr_scene_runtime.create`.
/// @param sceneState Initial value for `mq3.renderer.tr_scene_runtime.State.scene`.
/// @param vidHeight Initial value for `mq3.renderer.tr_scene_runtime.State.vidHeight`.
/// @param host Initial value for `mq3.renderer.tr_scene_runtime.State.services`.
function create(sceneState,vidHeight,host)
  if sceneState==void or vidHeight<=0 then return error(7750,"tr_scene: scene state and positive video height required") end if
  if host==void then host=services() end if
  return State(sceneState,false,0,[0,0],false,false,false,true,false,0,vidHeight,0,0,0,0,[],emptyRefdef(),host)
end function
/// Creates error `7750` with message `"tr_scene: "+message`.
/// @param message Input used in the result expression `error(7750,"tr_scene: "+message)`.
function fail(message) return error(7750,"tr_scene: "+message) end function
/// Forwards a renderer-scene event through the configured event service callback.
/// @param state Record providing `state.services`.
/// @param kind Argument 2 supplied to `state.services.eventFn`.
/// @param value Argument 3 supplied to `state.services.eventFn`.
function emit(state,kind,value) if state.services.eventFn!=void then state.services.eventFn(state.services.context,kind,value) end if end function
/// Returns `0` from `mq3.renderer.tr_scene_runtime.now`; earlier branches return `state.services.timeFn(state.services.context)`.
/// @param state Record providing `state.services`.
function now(state) if state.services.timeFn!=void then return state.services.timeFn(state.services.context) end if;return 0 end function

/// Updates `state.smpFrame`, `state.commandUsed[state.smpFrame]`, `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.R_ToggleSmpFrame`; returns `state.smpFrame`.
/// @param state Mutable record or buffer; this call updates `state.smpFrame`, `state.commandUsed[state.smpFrame]`, `state.firstSceneDrawSurf`.
function R_ToggleSmpFrame(state)
  if state==void then return fail("missing state") end if
  if state.smpEnabled then state.smpFrame=1-state.smpFrame else state.smpFrame=0 end if
  state.commandUsed[state.smpFrame]=0;state.firstSceneDrawSurf=0;queue.toggleFrame(state.scene);emit(state,"toggleFrame",state.smpFrame);return state.smpFrame
end function
/// Returns `void` from `mq3.renderer.tr_scene_runtime.RE_ClearScene`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.scene`.
function RE_ClearScene(state) if state==void then return fail("missing state") end if;queue.clearScene(state.scene);emit(state,"clearScene",[state.scene.firstSceneEntity,state.scene.firstSceneDlight,state.scene.firstScenePoly]);return void end function
/// Returns `queue.addPolys(state.scene,hShader,numVerts,verts,numPolys)` from `mq3.renderer.tr_scene_runtime.RE_AddPolyToScene`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.scene`.
/// @param hShader Argument 2 supplied to `mq3.renderer.scene_queue.addPolys`.
/// @param numVerts Argument 3 supplied to `mq3.renderer.scene_queue.addPolys`.
/// @param verts Argument 4 supplied to `mq3.renderer.scene_queue.addPolys`.
/// @param numPolys Argument 5 supplied to `mq3.renderer.scene_queue.addPolys`.
function RE_AddPolyToScene(state,hShader,numVerts,verts,numPolys) if state==void then return fail("missing state") end if;return queue.addPolys(state.scene,hShader,numVerts,verts,numPolys) end function
/// Returns `queue.addEntity(state.scene,entity.reType,entity.payload)` from `mq3.renderer.tr_scene_runtime.RE_AddRefEntityToScene`; earlier branches return `fail("missing state or entity")`.
/// @param state Record providing `state.scene`.
/// @param entity Record providing `entity.reType`, `entity.payload`.
function RE_AddRefEntityToScene(state,entity)
  if state==void or entity==void then return fail("missing state or entity") end if
  return queue.addEntity(state.scene,entity.reType,entity.payload)
end function
/// Returns `queue.addDynamicLight(state.scene,origin,intensity,r,g,b,additive)` from `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.scene`.
/// @param origin Argument 2 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param intensity Argument 3 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param r Argument 4 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param g Argument 5 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param b Argument 6 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
/// @param additive Argument 7 supplied to `mq3.renderer.scene_queue.addDynamicLight`.
function RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,additive) if state==void then return fail("missing state") end if;return queue.addDynamicLight(state.scene,origin,intensity,r,g,b,additive) end function
/// Calls `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene` with `(state,origin,intensity,r,g,b,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param origin Value forwarded as `origin` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param intensity Value forwarded as `intensity` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param r Value forwarded as `r` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param g Value forwarded as `g` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param b Value forwarded as `b` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
function RE_AddLightToScene(state,origin,intensity,r,g,b) return RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,false) end function
/// Calls `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene` with `(state,origin,intensity,r,g,b,true)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param origin Value forwarded as `origin` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param intensity Value forwarded as `intensity` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param r Value forwarded as `r` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param g Value forwarded as `g` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
/// @param b Value forwarded as `b` to `mq3.renderer.tr_scene_runtime.RE_AddDynamicLightToScene`.
function RE_AddAdditiveLightToScene(state,origin,intensity,r,g,b) return RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,true) end function

/// Updates `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.R_AddPolygonSurfaces`; returns `added`.
/// @param state Mutable record or buffer; this call updates `state.firstSceneDrawSurf`.
function R_AddPolygonSurfaces(state)
  if state==void then return fail("missing state") end if
  polys=queue.scenePolys(state.scene);added=0
  for each poly in polys
    shader=poly.hShader;if state.services.shaderFn!=void then shader=state.services.shaderFn(state.services.context,poly.hShader) end if
    if state.services.drawSurfFn!=void then state.services.drawSurfFn(state.services.context,poly,shader,poly.fogIndex,false,ENTITYNUM_WORLD) end if
    added=added+1
  end for
  state.firstSceneDrawSurf=state.firstSceneDrawSurf+added;return added
end function

/// Returns `false` from `mq3.renderer.tr_scene_runtime.maskChanged`; earlier branches return `true`.
/// @param previous Indexed input read at `index`.
/// @param current Indexed input read at `index`.
function maskChanged(previous,current)
  if len(previous)!=len(current) then return true end if
  for index=0 to len(current)-1 if previous[index]!=current[index] then return true end if end for
  return false
end function
/// Updates `state.areaMask`, `state.refdef`, `state.frameSceneNum`, `state.sceneCount`, `state.firstSceneDrawSurf` in `mq3.renderer.tr_scene_runtime.RE_RenderScene`; returns `parms`.
/// @param state Mutable record or buffer; this call updates `state.areaMask`, `state.refdef`, `state.frameSceneNum`, `state.sceneCount`, `state.firstSceneDrawSurf`.
/// @param input Record providing `input.rdflags`, `input.areamask`, `input.x`, `input.y`, `input.width`, `input.height`.
function RE_RenderScene(state,input)
  if state==void or input==void then return fail("missing state or refdef") end if
  if not state.registered then return false end if
  emit(state,"log","RE_RenderScene")
  if state.noRefresh then return false end if
  if not state.worldLoaded and (input.rdflags&RDF_NOWORLDMODEL)==0 then return fail("NULL worldmodel") end if
  start=now(state);changed=false
  if (input.rdflags&RDF_NOWORLDMODEL)==0 then changed=maskChanged(state.areaMask,input.areamask);state.areaMask=input.areamask end if
  entities=queue.sceneEntities(state.scene);lights=queue.sceneLights(state.scene);polys=queue.scenePolys(state.scene)
  if not state.dynamicLight or state.vertexLight or state.hardwareType==queue.GLHW_PERMEDIA2 then lights=[] end if
  state.refdef=Refdef(input.x,input.y,input.width,input.height,input.fovX,input.fovY,input.vieworg,input.viewaxis,input.time,input.rdflags,state.areaMask,changed,input.text,input.time*0.001,state.firstSceneDrawSurf,entities,lights,polys)
  state.frameSceneNum=state.frameSceneNum+1;state.sceneCount=state.sceneCount+1
  parms=ViewParms(input.x,state.vidHeight-(input.y+input.height),input.width,input.height,false,input.fovX,input.fovY,input.vieworg,input.viewaxis,input.vieworg)
  drawCount=state.firstSceneDrawSurf
  if state.services.renderViewFn!=void then value=state.services.renderViewFn(state.services.context,parms,state.refdef);if value!=void then drawCount=value end if
  else drawCount=drawCount+R_AddPolygonSurfaces(state)
  end if
  state.firstSceneDrawSurf=drawCount;queue.finishScene(state.scene)
  elapsed=now(state)-start;if elapsed>0 then state.frontEndMsec=state.frontEndMsec+elapsed end if
  emit(state,"renderScene",[state.frameSceneNum,state.sceneCount,drawCount,elapsed]);return parms
end function
