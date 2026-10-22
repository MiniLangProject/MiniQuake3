// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete stateful renderer scene front end corresponding to tr_scene.c.
package mq3.renderer.tr_scene_runtime

import mq3.renderer.scene_queue as queue

const RDF_NOWORLDMODEL=1
const ENTITYNUM_WORLD=1022

struct RefdefInput x y width height fovX fovY vieworg viewaxis time rdflags areamask text end struct
struct Refdef x y width height fovX fovY vieworg viewaxis time rdflags areamask areamaskModified text floatTime numDrawSurfs entities dlights polys end struct
struct ViewParms viewportX viewportY viewportWidth viewportHeight isPortal fovX fovY origin axis pvsOrigin end struct
struct Services timeFn renderViewFn drawSurfFn shaderFn eventFn context end struct
struct State scene smpEnabled smpFrame commandUsed registered noRefresh worldLoaded dynamicLight vertexLight hardwareType vidHeight firstSceneDrawSurf frameSceneNum sceneCount frontEndMsec areaMask refdef services end struct

function services() return Services(void,void,void,void,void,void) end function
function emptyRefdef() return Refdef(0,0,0,0,0.0,0.0,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],0,0,[],false,"",0.0,0,[],[],[]) end function
function create(sceneState,vidHeight,host)
  if sceneState==void or vidHeight<=0 then return error(7750,"tr_scene: scene state and positive video height required") end if
  if host==void then host=services() end if
  return State(sceneState,false,0,[0,0],false,false,false,true,false,0,vidHeight,0,0,0,0,[],emptyRefdef(),host)
end function
function fail(message) return error(7750,"tr_scene: "+message) end function
function emit(state,kind,value) if state.services.eventFn!=void then state.services.eventFn(state.services.context,kind,value) end if end function
function now(state) if state.services.timeFn!=void then return state.services.timeFn(state.services.context) end if;return 0 end function

function R_ToggleSmpFrame(state)
  if state==void then return fail("missing state") end if
  if state.smpEnabled then state.smpFrame=1-state.smpFrame else state.smpFrame=0 end if
  state.commandUsed[state.smpFrame]=0;state.firstSceneDrawSurf=0;queue.toggleFrame(state.scene);emit(state,"toggleFrame",state.smpFrame);return state.smpFrame
end function
function RE_ClearScene(state) if state==void then return fail("missing state") end if;queue.clearScene(state.scene);emit(state,"clearScene",[state.scene.firstSceneEntity,state.scene.firstSceneDlight,state.scene.firstScenePoly]);return void end function
function RE_AddPolyToScene(state,hShader,numVerts,verts,numPolys) if state==void then return fail("missing state") end if;return queue.addPolys(state.scene,hShader,numVerts,verts,numPolys) end function
function RE_AddRefEntityToScene(state,entity)
  if state==void or entity==void then return fail("missing state or entity") end if
  return queue.addEntity(state.scene,entity.reType,entity.payload)
end function
function RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,additive) if state==void then return fail("missing state") end if;return queue.addDynamicLight(state.scene,origin,intensity,r,g,b,additive) end function
function RE_AddLightToScene(state,origin,intensity,r,g,b) return RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,false) end function
function RE_AddAdditiveLightToScene(state,origin,intensity,r,g,b) return RE_AddDynamicLightToScene(state,origin,intensity,r,g,b,true) end function

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

function maskChanged(previous,current)
  if len(previous)!=len(current) then return true end if
  for index=0 to len(current)-1 if previous[index]!=current[index] then return true end if end for
  return false
end function
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
