// SPDX-License-Identifier: GPL-2.0-or-later
// Integration adapter between a local QVM match and original_ui_session.
package mq3.engine.local_qvm_ui

import mq3.client.original_ui_session as uiSession
import mq3.client.ui_vm as uiVm
import mq3.client.ui_host_lifecycle as uiHost
import mq3.engine.local_qvm_match as localMatch
import mq3.renderer.command_queue as q2commands
import mq3.platform.playable_window as window

/// Create the engine.local_qvm_ui error for `fail` with 7687 and the supplied diagnostic text.
/// @param message Message used in `("local QVM UI: " + message)` and `error(7687, ("local QVM UI: " + message))`.
function fail(message) return error(7687,"local QVM UI: "+message) end function
/// Return `mq3.engine.local_qvm_match.keyCatcher(state)` from `engine.local_qvm_ui.getCatcher`.
/// @param state Value passed as `value` to `mq3.engine.local_qvm_match.keyCatcher`.
function getCatcher(state) return localMatch.keyCatcher(state) end function
/// Return `mq3.client.ui_vm.keyEvent(state.ui, key, down)` from `engine.local_qvm_ui.keyEvent`.
/// @param state Record exposing `ui`.
/// @param key Key passed as `key` to `mq3.client.ui_vm.keyEvent`.
/// @param down Down passed as `down` to `mq3.client.ui_vm.keyEvent`.
function keyEvent(state,key,down) return uiVm.keyEvent(state.ui,key,down) end function
/// Compute state event in engine.local_qvm_ui.
/// @param state Value passed as `value` to `mq3.engine.local_qvm_match.setKeyDown`.
/// @param key Key passed as `key` to `mq3.engine.local_qvm_match.setKeyDown`.
/// @param down Down passed as `down` to `mq3.engine.local_qvm_match.setKeyDown`.
function stateEvent(state,key,down) localMatch.setKeyDown(state,key,down);return void end function
/// Return `mq3.client.ui_vm.mouseEvent(state.ui, dx, dy)` from `engine.local_qvm_ui.mouseEvent`.
/// @param state Record exposing `ui`.
/// @param dx Dx passed as `dx` to `mq3.client.ui_vm.mouseEvent`.
/// @param dy Dy passed as `dy` to `mq3.client.ui_vm.mouseEvent`.
function mouseEvent(state,dx,dy) return uiVm.mouseEvent(state.ui,dx,dy) end function
/// Return `mq3.engine.local_qvm_match.refreshUi(state, now)` from `engine.local_qvm_ui.refresh`.
/// @param state Value passed as `value` to `mq3.engine.local_qvm_match.refreshUi`.
/// @param now Time passed as `time` to `mq3.engine.local_qvm_match.refreshUi`.
function refresh(state,now) return localMatch.refreshUi(state,now) end function
/// Return `mq3.engine.local_qvm_match.setUiMenu(state, menu)` from `engine.local_qvm_ui.setMenu`.
/// @param state Value passed as `value` to `mq3.engine.local_qvm_match.setUiMenu`.
/// @param menu Menu passed as `menu` to `mq3.engine.local_qvm_match.setUiMenu`.
function setMenu(state,menu) return localMatch.setUiMenu(state,menu) end function
/// Return `mq3.client.ui_vm.drawConnectScreen(state.ui, overlay)` from `engine.local_qvm_ui.drawConnectScreen`.
/// @param state Record exposing `ui`.
/// @param overlay Overlay passed as `overlay` to `mq3.client.ui_vm.drawConnectScreen`.
function drawConnectScreen(state,overlay) return uiVm.drawConnectScreen(state.ui,overlay) end function
/// Return `mq3.client.ui_vm.isFullscreen(state.ui)` from `engine.local_qvm_ui.fullscreen`.
/// @param state Record exposing `ui`.
function fullscreen(state) return uiVm.isFullscreen(state.ui) end function
/// Reset frame commands in engine.local_qvm_ui; the normal completion returns `localMatch.beginRendererFrame(state)`.
/// @param state Value passed as `value` to `mq3.engine.local_qvm_match.beginRendererFrame`.
function resetFrameCommands(state) if state==void then return fail("match state is required") end if;return localMatch.beginRendererFrame(state) end function
/// Return `mq3.renderer.command_queue.count(state.context.renderQueue)` from `engine.local_qvm_ui.commandCount`.
/// @param state Record exposing `context`.
function commandCount(state) return q2commands.count(state.context.renderQueue) end function
/// Compute service set in engine.local_qvm_ui; the normal completion returns `services`.
/// @param state Record exposing `ui`.
function serviceSet(state)
  if state==void or state.ui==void or not state.ui.active then return fail("active ui.qvm is required") end if
  services=uiSession.services(state,getCatcher,keyEvent,mouseEvent,refresh,setMenu,commandCount);services.stateEventFn=stateEvent;services.connectFn=drawConnectScreen;return services
end function
/// Compute attach in engine.local_qvm_ui; the normal completion returns `uiSession.create(configured, inputContext, keyDownFn, mouseDeltaFn)`.
/// @param state State passed as `state` to `mq3.engine.local_qvm_ui.serviceSet`.
/// @param inputContext Input context passed as `inputContext` to `mq3.client.original_ui_session.create`.
/// @param keyDownFn Key down fn passed as `keyDownFn` to `mq3.client.original_ui_session.create`.
/// @param mouseDeltaFn Mouse delta fn passed as `mouseDeltaFn` to `mq3.client.original_ui_session.create`.
function attach(state,inputContext,keyDownFn,mouseDeltaFn)
  configured=serviceSet(state);if configured is error then return configured end if
  return uiSession.create(configured,inputContext,keyDownFn,mouseDeltaFn)
end function
/// Return `mq3.platform.playable_window.inputKeyDown(key)` from `engine.local_qvm_ui.nativeKeyDown`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param key Key passed as `key` to `mq3.platform.playable_window.inputKeyDown`.
function nativeKeyDown(context,key) return window.inputKeyDown(key) end function
/// Return `mq3.platform.playable_window.mouseDelta()` from `engine.local_qvm_ui.nativeMouseDelta`.
/// @param context Reserved argument; this implementation does not read its value.
function nativeMouseDelta(context) return window.mouseDelta() end function
/// Return `mq3.engine.local_qvm_ui.attach(state, void, nativeKeyDown, nativeMouseDelta)` from `engine.local_qvm_ui.attachNative`.
/// @param state State passed as `state` to `mq3.engine.local_qvm_ui.attach`.
function attachNative(state) return attach(state,void,nativeKeyDown,nativeMouseDelta) end function
/// Compute boot and attach native in engine.local_qvm_ui; the normal completion returns `session`.
/// @param state Record exposing `ui`.
/// @param menu Menu passed as `menu` to `mq3.client.original_ui_session.setMenu`.
function bootAndAttachNative(state,menu)
  if state==void then return fail("match state is required") end if
  if state.ui==void then started=localMatch.bootUi(state);if started is error then return started end if end if
  session=attachNative(state);if session is error then return session end if
  if menu>=uiSession.UIMENU_NONE then opened=uiSession.setMenu(session,menu);if opened is error then return opened end if end if
  return session
end function

/// Compute draw screen in engine.local_qvm_ui; the normal completion returns `uiHost.drawScreen(configured, connectionState, now)`.
/// @param state Record exposing `ui`, `context`.
/// @param connectionState Conn state passed as `connState` to `mq3.client.ui_host_lifecycle.drawScreen`.
/// @param now Realtime passed as `realtime` to `mq3.client.ui_host_lifecycle.drawScreen`.
/// @param cgameFn Cgame fn passed as `cgameFn` to `mq3.client.ui_host_lifecycle.services`.
/// @param cinematicFn Cinematic fn passed as `cinematicFn` to `mq3.client.ui_host_lifecycle.services`.
function drawScreen(state,connectionState,now,cgameFn,cinematicFn)
  if state==void or state.ui==void or not state.ui.active then return fail("active ui.qvm is required") end if
  state.context.uiClient.connState=connectionState
  configured=uiHost.services(state,fullscreen,refresh,setMenu,drawConnectScreen,cgameFn,cinematicFn,getCatcher)
  return uiHost.drawScreen(configured,connectionState,now)
end function
