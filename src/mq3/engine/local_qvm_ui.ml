// SPDX-License-Identifier: GPL-2.0-or-later
// Integration adapter between a local QVM match and original_ui_session.
package mq3.engine.local_qvm_ui

import mq3.client.original_ui_session as uiSession
import mq3.client.ui_vm as uiVm
import mq3.client.ui_host_lifecycle as uiHost
import mq3.engine.local_qvm_match as localMatch
import mq3.renderer.command_queue as q2commands
import mq3.platform.playable_window as window

function fail(message) return error(7687,"local QVM UI: "+message) end function
function getCatcher(state) return localMatch.keyCatcher(state) end function
function keyEvent(state,key,down) return uiVm.keyEvent(state.ui,key,down) end function
function stateEvent(state,key,down) localMatch.setKeyDown(state,key,down);return void end function
function mouseEvent(state,dx,dy) return uiVm.mouseEvent(state.ui,dx,dy) end function
function refresh(state,now) return localMatch.refreshUi(state,now) end function
function setMenu(state,menu) return localMatch.setUiMenu(state,menu) end function
function drawConnectScreen(state,overlay) return uiVm.drawConnectScreen(state.ui,overlay) end function
function fullscreen(state) return uiVm.isFullscreen(state.ui) end function
function resetFrameCommands(state) if state==void then return fail("match state is required") end if;q2commands.reset(state.context.renderQueue);return void end function
function commandCount(state) return q2commands.count(state.context.renderQueue) end function
function serviceSet(state)
  if state==void or state.ui==void or not state.ui.active then return fail("active ui.qvm is required") end if
  services=uiSession.services(state,getCatcher,keyEvent,mouseEvent,refresh,setMenu,commandCount);services.stateEventFn=stateEvent;services.connectFn=drawConnectScreen;return services
end function
function attach(state,inputContext,keyDownFn,mouseDeltaFn)
  configured=serviceSet(state);if configured is error then return configured end if
  return uiSession.create(configured,inputContext,keyDownFn,mouseDeltaFn)
end function
function nativeKeyDown(context,key) return window.keyDown(key) end function
function nativeMouseDelta(context) return window.mouseDelta() end function
function attachNative(state) return attach(state,void,nativeKeyDown,nativeMouseDelta) end function
function bootAndAttachNative(state,menu)
  if state==void then return fail("match state is required") end if
  if state.ui==void then started=localMatch.bootUi(state);if started is error then return started end if end if
  session=attachNative(state);if session is error then return session end if
  if menu>=uiSession.UIMENU_NONE then opened=uiSession.setMenu(session,menu);if opened is error then return opened end if end if
  return session
end function

function drawScreen(state,connectionState,now,cgameFn,cinematicFn)
  if state==void or state.ui==void or not state.ui.active then return fail("active ui.qvm is required") end if
  state.context.uiClient.connState=connectionState
  configured=uiHost.services(state,fullscreen,refresh,setMenu,drawConnectScreen,cgameFn,cinematicFn,getCatcher)
  return uiHost.drawScreen(configured,connectionState,now)
end function
