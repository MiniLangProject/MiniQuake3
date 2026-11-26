// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful front-end command lifecycle corresponding to renderer/tr_cmds.c.
// Hardware and thread operations cross an injected host boundary while the
// byte-budgeted command stream is the productive renderer command queue.
package mq3.renderer.tr_cmds_runtime

import mq3.renderer.command_queue as commands

const STEREO_CENTER=0
const STEREO_LEFT=1
const STEREO_RIGHT=2
const DRAW_SURFS_BYTES=32

/// Data record for `mq3.renderer.tr_cmds_runtime.FrontCounters`; groups `leafs`, `spherePatchIn`, `spherePatchClip`, `spherePatchOut`, `boxPatchIn`, `boxPatchClip`, and 10 further fields.
struct FrontCounters leafs spherePatchIn spherePatchClip spherePatchOut boxPatchIn boxPatchClip boxPatchOut sphereMd3In sphereMd3Clip sphereMd3Out boxMd3In boxMd3Clip boxMd3Out dlightSurfaces dlightSurfacesCulled zFar end struct
/// Data record for `mq3.renderer.tr_cmds_runtime.BackCounters`; groups `shaders`, `surfaces`, `vertexes`, `indexes`, `totalIndexes`, `overDraw`, and 7 further fields.
struct BackCounters shaders surfaces vertexes indexes totalIndexes overDraw dlightVertexes dlightIndexes flareAdds flareTests flareRenders msec imageBytes end struct
/// Data record for `mq3.renderer.tr_cmds_runtime.Settings`; groups `speeds`, `smp`, `showSmp`, `skipBackEnd`, `measureOverdraw`, `measureOverdrawModified`, and 11 further fields.
struct Settings speeds smp showSmp skipBackEnd measureOverdraw measureOverdrawModified shadows stencilBits textureMode textureModeModified gammaModified ignoreGLErrors stereoEnabled drawBuffer registered width height end struct
/// Callback table for `mq3.renderer.tr_cmds_runtime.Services`; exposes `eventFn`, `spawnThreadFn`, `frontEndSleepFn`, `wakeRendererFn`, `executeFn`, `textureModeFn`, and 4 further fields.
struct Services eventFn spawnThreadFn frontEndSleepFn wakeRendererFn executeFn textureModeFn colorMappingsFn getErrorFn toggleSmpFn context end struct
/// Data record for `mq3.renderer.tr_cmds_runtime.State`; groups `queue`, `backend`, `smpActive`, `renderThreadActive`, `blockedOnRender`, `blockedOnMain`, and 9 further fields.
struct State queue backend smpActive renderThreadActive blockedOnRender blockedOnMain smpFrame frameCount frameSceneNum frontEndMsec finishCalled settings services front back end struct

/// Constructs `mq3.renderer.tr_cmds_runtime.FrontCounters` with `leafs` = `0`, `spherePatchIn` = `0`, `spherePatchClip` = `0`, `spherePatchOut` = `0` and the supplied remaining values.
function frontCounters() return FrontCounters(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.0) end function
/// Constructs `mq3.renderer.tr_cmds_runtime.BackCounters` with `shaders` = `0`, `surfaces` = `0`, `vertexes` = `0`, `indexes` = `0` and the supplied remaining values.
function backCounters() return BackCounters(0,0,0,0,0,0,0,0,0,0,0,0,0) end function
/// Constructs `mq3.renderer.tr_cmds_runtime.Settings` with `speeds` = `0`, `smp` = `false`, `showSmp` = `false`, `skipBackEnd` = `false` and the supplied remaining values.
function settings() return Settings(0,false,false,false,false,false,0,8,"linear",false,false,false,false,"GL_BACK",true,640,480) end function
/// Constructs `mq3.renderer.tr_cmds_runtime.Services` with `eventFn` = `void`, `spawnThreadFn` = `void`, `frontEndSleepFn` = `void`, `wakeRendererFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void,void,void,void,void,void) end function
/// Builds `mq3.renderer.tr_cmds_runtime.State` using `mq3.renderer.command_queue.create`, `mq3.renderer.command_queue.backend`.
/// @param queue Initial value for `mq3.renderer.tr_cmds_runtime.State.queue`.
/// @param backendState Initial value for `mq3.renderer.tr_cmds_runtime.State.backend`.
/// @param configuration Initial value for `mq3.renderer.tr_cmds_runtime.State.settings`.
/// @param host Initial value for `mq3.renderer.tr_cmds_runtime.State.services`.
function create(queue,backendState,configuration,host)
  if queue==void then queue=commands.create(void,void) end if
  if backendState==void then backendState=commands.backend(void) end if
  if configuration==void then configuration=settings() end if
  if host==void then host=services() end if
  return State(queue,backendState,false,false,0,0,0,0,0,0,false,configuration,host,frontCounters(),backCounters())
end function
/// Creates error `7740` with message `"tr_cmds: "+message`.
/// @param message Input used in the result expression `error(7740,"tr_cmds: "+message)`.
function fail(message) return error(7740,"tr_cmds: "+message) end function
/// Forwards a renderer-command event through the configured event service callback.
/// @param state Record providing `state.services`.
/// @param kind Argument 2 supplied to `state.services.eventFn`.
/// @param value Argument 3 supplied to `state.services.eventFn`.
function emit(state,kind,value) if state.services.eventFn!=void then state.services.eventFn(state.services.context,kind,value) end if end function

/// Updates `state.front`, `state.back` in `mq3.renderer.tr_cmds_runtime.clearCounters`.
/// @param state Mutable record or buffer; this call updates `state.front`, `state.back`.
function clearCounters(state) state.front=frontCounters();state.back=backCounters();return void end function
/// Formats the selected renderer performance-counter category and sends it through the command diagnostics path.
/// @param state Record providing `state.settings`, `state.back`, `state.front`.
function R_PerformanceCounters(state)
  if state==void then return fail("missing state") end if
  speed=state.settings.speeds;message=void
  if speed==1 then message=["general",state.back.shaders,state.back.surfaces,state.front.leafs,state.back.vertexes,state.back.indexes/3,state.back.totalIndexes/3,state.back.imageBytes/1000000.0,state.back.overDraw/(state.settings.width*state.settings.height)]
  else if speed==2 then message=["cull",state.front.spherePatchIn,state.front.spherePatchClip,state.front.spherePatchOut,state.front.boxPatchIn,state.front.boxPatchClip,state.front.boxPatchOut,state.front.sphereMd3In,state.front.sphereMd3Clip,state.front.sphereMd3Out,state.front.boxMd3In,state.front.boxMd3Clip,state.front.boxMd3Out]
  else if speed==3 then message=["viewCluster",state.front.leafs]
  else if speed==4 and state.back.dlightVertexes!=0 then message=["dlight",state.front.dlightSurfaces,state.front.dlightSurfacesCulled,state.back.dlightVertexes,state.back.dlightIndexes/3]
  else if speed==5 then message=["zFar",state.front.zFar]
  else if speed==6 then message=["flares",state.back.flareAdds,state.back.flareTests,state.back.flareRenders]
  end if
  if message!=void then emit(state,"performance",message) end if
  clearCounters(state);return message
end function

/// Updates `state.smpActive` in `mq3.renderer.tr_cmds_runtime.R_InitCommandBuffers`; returns `state.smpActive`.
/// @param state Mutable record or buffer; this call updates `state.smpActive`.
function R_InitCommandBuffers(state)
  if state==void then return fail("missing state") end if
  state.smpActive=false
  if state.settings.smp then
    emit(state,"smpTry",void);ok=false
    if state.services.spawnThreadFn!=void then ok=state.services.spawnThreadFn(state.services.context) end if
    state.smpActive=ok;emit(state,"smpResult",ok)
  end if
  return state.smpActive
end function
/// Updates `state.smpActive`, `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_ShutdownCommandBuffers`.
/// @param state Mutable record or buffer; this call updates `state.smpActive`, `state.renderThreadActive`.
function R_ShutdownCommandBuffers(state)
  if state==void then return fail("missing state") end if
  if state.smpActive and state.services.wakeRendererFn!=void then state.services.wakeRendererFn(state.services.context,void) end if
  state.smpActive=false;state.renderThreadActive=false;return void
end function

/// Returns `commands.execute(state.backend,state.queue)` from `mq3.renderer.tr_cmds_runtime.executeBatch`; earlier branches return `state.services.executeFn(state.services.context,state.queue.commands)`.
/// @param state Record providing `state.services`, `state.queue`, `state.backend`.
function executeBatch(state)
  if state.services.executeFn!=void then return state.services.executeFn(state.services.context,state.queue.commands) end if
  return commands.execute(state.backend,state.queue)
end function
/// Updates `state.blockedOnRender`, `state.blockedOnMain`, `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_IssueRenderCommands`; returns `executed`.
/// @param state Mutable record or buffer; this call updates `state.blockedOnRender`, `state.blockedOnMain`, `state.renderThreadActive`.
/// @param runPerformanceCounters Input tested by `runPerformanceCounters`.
function R_IssueRenderCommands(state,runPerformanceCounters)
  if state==void then return fail("missing state") end if
  if state.smpActive then
    if state.renderThreadActive then state.blockedOnRender=state.blockedOnRender+1;emit(state,"smpWait","render")
    else state.blockedOnMain=state.blockedOnMain+1;emit(state,"smpWait","main") end if
    if state.services.frontEndSleepFn!=void then state.services.frontEndSleepFn(state.services.context) end if
    state.renderThreadActive=false
  end if
  if runPerformanceCounters then R_PerformanceCounters(state) end if
  executed=0
  if not state.settings.skipBackEnd then
    if state.smpActive then
      if state.services.wakeRendererFn!=void then state.services.wakeRendererFn(state.services.context,state.queue.commands) end if
      state.renderThreadActive=true;executed=len(state.queue.commands)
    else executed=executeBatch(state) end if
  end if
  commands.reset(state.queue);return executed
end function
/// Updates `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_SyncRenderThread`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.renderThreadActive`.
function R_SyncRenderThread(state)
  if state==void then return fail("missing state") end if
  if not state.settings.registered then return false end if
  issued=R_IssueRenderCommands(state,false);if issued is error then return issued end if
  if state.smpActive and state.services.frontEndSleepFn!=void then state.services.frontEndSleepFn(state.services.context);state.renderThreadActive=false end if
  return true
end function
/// Returns `commands.allocate(state.queue,bytes)` from `mq3.renderer.tr_cmds_runtime.R_GetCommandBuffer`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.queue`.
/// @param bytes Argument 2 supplied to `mq3.renderer.command_queue.allocate`.
function R_GetCommandBuffer(state,bytes) if state==void then return fail("missing state") end if;return commands.allocate(state.queue,bytes) end function
/// Returns `commands.app` from `mq3.renderer.tr_cmds_runtime.R_AddDrawSurfCmd`; earlier branches return `fail("negative draw-surface count")`.
/// @param state Record providing `state.queue`.
/// @param drawSurfs Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`.
/// @param numDrawSurfs Input tested by `numDrawSurfs<0`.
/// @param refdef Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`.
/// @param viewParms Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`.
function R_AddDrawSurfCmd(state,drawSurfs,numDrawSurfs,refdef,viewParms)
  if numDrawSurfs<0 then return fail("negative draw-surface count") end if
  return commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)
end function
/// Returns `commands.setColor(state.queue,rgba)` from `mq3.renderer.tr_cmds_runtime.RE_SetColor`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.queue`.
/// @param rgba Argument 2 supplied to `mq3.renderer.command_queue.setColor`.
function RE_SetColor(state,rgba) if state==void then return fail("missing state") end if;return commands.setColor(state.queue,rgba) end function
/// Returns `commands.stretchPic(state.queue,x,y,w,h,s1,t1,s2,t2,shader)` from `mq3.renderer.tr_cmds_runtime.RE_StretchPic`; earlier branches return `fail("missing state")`.
/// @param state Record providing `state.queue`.
/// @param x Argument 2 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param y Argument 3 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param w Argument 4 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param h Argument 5 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param s1 Argument 6 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param t1 Argument 7 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param s2 Argument 8 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param t2 Argument 9 supplied to `mq3.renderer.command_queue.stretchPic`.
/// @param shader Argument 10 supplied to `mq3.renderer.command_queue.stretchPic`.
function RE_StretchPic(state,x,y,w,h,s1,t1,s2,t2,shader) if state==void then return fail("missing state") end if;return commands.stretchPic(state.queue,x,y,w,h,s1,t1,s2,t2,shader) end function

/// Builds `c.measureOverdraw`, `c.measureOverdrawModified` in `mq3.renderer.tr_cmds_runtime.configureOverdraw`; returns `true`.
/// @param state Record providing `state.settings`.
function configureOverdraw(state)
  c=state.settings
  if c.measureOverdraw then
    if c.stencilBits<4 then c.measureOverdraw=false;emit(state,"warning","stencil")
    else if c.shadows==2 then c.measureOverdraw=false;emit(state,"warning","shadows")
    else sync=R_SyncRenderThread(state);if sync is error then return sync end if;emit(state,"stencil",[true,"increment"])
    end if
    c.measureOverdrawModified=false
  else if c.measureOverdrawModified then sync=R_SyncRenderThread(state);if sync is error then return sync end if;emit(state,"stencil",[false,"keep"]);c.measureOverdrawModified=false
  end if
  return true
end function
/// Updates `state.finishCalled`, `state.frameCount`, `state.frameSceneNum` in `mq3.renderer.tr_cmds_runtime.RE_BeginFrame`; returns `queued`.
/// @param state Mutable record or buffer; this call updates `state.finishCalled`, `state.frameCount`, `state.frameSceneNum`.
/// @param stereoFrame Input tested by `stereoFrame==STEREO_LEFT`.
function RE_BeginFrame(state,stereoFrame)
  if state==void then return fail("missing state") end if
  c=state.settings;if not c.registered then return false end if
  state.finishCalled=false;state.frameCount=state.frameCount+1;state.frameSceneNum=0
  overdraw=configureOverdraw(state);if overdraw is error then return overdraw end if
  if c.textureModeModified then sync=R_SyncRenderThread(state);if sync is error then return sync end if;if state.services.textureModeFn!=void then state.services.textureModeFn(state.services.context,c.textureMode) end if;c.textureModeModified=false end if
  if c.gammaModified then sync=R_SyncRenderThread(state);if sync is error then return sync end if;if state.services.colorMappingsFn!=void then state.services.colorMappingsFn(state.services.context) end if;c.gammaModified=false end if
  if not c.ignoreGLErrors and state.services.getErrorFn!=void then sync=R_SyncRenderThread(state);if sync is error then return sync end if;glError=state.services.getErrorFn(state.services.context);if glError!=0 then return fail("GL error "+str(glError)) end if end if
  buffer="GL_BACK"
  if c.stereoEnabled then
    if stereoFrame==STEREO_LEFT then buffer="GL_BACK_LEFT" else if stereoFrame==STEREO_RIGHT then buffer="GL_BACK_RIGHT" else return fail("stereo frame required") end if
  else
    if stereoFrame!=STEREO_CENTER then return fail("center frame required") end if
    if c.drawBuffer=="GL_FRONT" then buffer="GL_FRONT" end if
  end if
  queued=commands.drawBuffer(state.queue,buffer);if queued then emit(state,"beginFrame",[state.frameCount,buffer]) end if;return queued
end function
/// Updates `state.smpFrame`, `state.frontEndMsec`, `state.back.msec` in `mq3.renderer.tr_cmds_runtime.RE_EndFrame`; returns `[frontMsec,backMsec]`.
/// @param state Mutable record or buffer; this call updates `state.smpFrame`, `state.frontEndMsec`, `state.back.msec`.
function RE_EndFrame(state)
  if state==void then return fail("missing state") end if
  if not state.settings.registered then return false end if
  if not commands.swapBuffers(state.queue) then return false end if
  frontMsec=state.frontEndMsec;backMsec=state.back.msec
  issued=R_IssueRenderCommands(state,true);if issued is error then return issued end if
  state.smpFrame=1-state.smpFrame;if state.services.toggleSmpFn!=void then state.services.toggleSmpFn(state.services.context,state.smpFrame) end if
  state.frontEndMsec=0;state.back.msec=0;emit(state,"endFrame",[frontMsec,backMsec,state.smpFrame]);return [frontMsec,backMsec]
end function
