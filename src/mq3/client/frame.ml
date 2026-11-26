// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive outer CL_Frame composition from client/cl_main.c.
package mq3.client.frame
import mq3.compat.numeric as numeric
import mq3.client.send_cmd as sendCmd

/// Client connection state with no active server connection.
const CA_DISCONNECTED=1
/// Client connection state while replying to the server challenge and requesting connection.
const CA_CHALLENGING=4
/// Connection-state value for a completed handshake before game-state loading, defined for client-frame
/// connection, timeout, and packet scheduling.
const CA_CONNECTED=5
/// Connection-state value for normal gameplay after game-state loading, defined for client-frame
/// connection, timeout, and packet scheduling.
const CA_ACTIVE=8
/// Client connection state used for fullscreen cinematic playback.
const CA_CINEMATIC=9
/// UI keyboard-capture mask used when deciding whether the UI currently captures input during
/// client-frame scheduling.
const KEYCATCH_UI=2
/// Configuration-variable attribute that includes the value in user information sent to the server.
const CVAR_USERINFO=2
/// Engine-to-UI menu selector for the main screen or menu state.
const UIMENU_MAIN=1
/// Engine-to-UI menu selector for the need cd screen or menu state.
const UIMENU_NEED_CD=3

/// Stores frame runtime wiring and state, including `running`, `cdDialog`, `state`, `keyCatchers`, `serverRunning`, `aviDemo` and additional values.
struct Runtime
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  running
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  cdDialog
  /// When constructing this record, `runtime` supplies `CA_DISCONNECTED` for this member. Used by
  /// `checkUserinfo` and `checkTimeout` during subsequent processing.
  state
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// True when a local game server is running in the same engine instance.
  serverRunning
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  aviDemo
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  forceAviDemo
  /// When constructing this record, `runtime` supplies `1.0` for this member. Used by `run` during
  /// subsequent processing.
  timeScale
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  timeGraph
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  realFrametime
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Accumulated client runtime clock in milliseconds, advanced by each frame duration and used for
  /// networking and timeouts.
  realtime
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `run` during
  /// subsequent processing.
  framecount
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `checkUserinfo` and
  /// `checkTimeout` during subsequent processing.
  paused
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `checkTimeout` and
  /// `run` during subsequent processing.
  serverPaused
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `checkUserinfo`
  /// during subsequent processing.
  modifiedFlags
  /// Client timestamp of the latest received server packet, used to detect timeouts.
  lastPacketTime
  /// When constructing this record, `runtime` supplies `30.0` for this member. Used by `checkTimeout`
  /// during subsequent processing.
  timeoutSeconds
  /// When constructing this record, `runtime` supplies `0` for this member. Used by `checkTimeout`
  /// during subsequent processing.
  timeoutCount
end struct

/// Creates a `mq3.client.frame.Runtime` record. Initializes the record with the defaults written in this constructor.
function runtime()
  return Runtime(0,0,CA_DISCONNECTED,0,0,0,0,1.0,0,0,0,0,0,0,0,0,0,30.0,0)
end function

// The opaque runtime references let a platform host bind the already ported
// network_ingress, protocol_runtime and demo runtimes. The callbacks retain the
// original engine boundaries: SendCmd owns client netchan output, resend owns
// connectionless negotiation and setCGameTime owns snapshot/demo advancement.
struct Services
  /// Host callback for the menu operation; an unset callback leaves that host operation unavailable.
  menuFn
  /// Host callback for the stop sounds operation; an unset callback leaves that host operation
  /// unavailable.
  stopSoundsFn
  /// Host callback for the command text operation; an unset callback leaves that host operation
  /// unavailable.
  commandTextFn
  /// Host callback for the debug graph operation; an unset callback leaves that host operation
  /// unavailable.
  debugGraphFn
  /// Host callback for the info string operation; an unset callback leaves that host operation
  /// unavailable.
  infoStringFn
  /// Host callback for the reliable operation; an unset callback leaves that host operation
  /// unavailable.
  reliableFn
  /// Host callback for the diagnostic operation; an unset callback leaves that host operation
  /// unavailable.
  diagnosticFn
  /// Host callback for the disconnect operation; an unset callback leaves that host operation
  /// unavailable.
  disconnectFn
  /// Host callback for the send cmd operation; an unset callback leaves that host operation
  /// unavailable.
  sendCmdFn
  /// Host callback for the resend operation; an unset callback leaves that host operation unavailable.
  resendFn
  /// Host callback for the set c game time operation; an unset callback leaves that host operation
  /// unavailable.
  setCGameTimeFn
  /// Host callback for the screen operation; an unset callback leaves that host operation unavailable.
  screenFn
  /// Host callback for the sound operation; an unset callback leaves that host operation unavailable.
  soundFn
  /// Host callback for the cinematic operation; an unset callback leaves that host operation
  /// unavailable.
  cinematicFn
  /// Host callback for the console operation; an unset callback leaves that host operation unavailable.
  consoleFn
  /// When constructing this record, `services` supplies an absent (`void`) value for this member.
  networkRuntime
  /// When constructing this record, `services` supplies an absent (`void`) value for this member.
  protocolRuntime
  /// When constructing this record, `services` supplies an absent (`void`) value for this member.
  demoRuntime
  /// When constructing this record, `services` supplies an absent (`void`) value for this member.
  sendRuntime
  /// When constructing this record, `services` supplies an absent (`void`) value for this member.
  sendServices
  /// Caller-supplied value forwarded unchanged to the service callbacks for client frame scheduling.
  context
end struct

/// Creates a `mq3.client.frame.Services` record. Initializes the record with the defaults written in this constructor.
function services()
  return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Adapts `mq3.client.send_cmd.send` to frame `liveSend`, returning its result for `host.sendRuntime, host.sendRuntime.realtime, host.sendServices`.
/// @param host Record read through `host.sendRuntime`, `host.sendRuntime.realtime`, `host.sendServices`.
function liveSend(host) return sendCmd.send(host.sendRuntime,host.sendRuntime.realtime,host.sendServices) end function
/// Updates `host.sendRuntime`, `host.sendServices`, `host.sendCmdFn` during frame `attachSend`.
/// @param host Mutable frame record/storage; this routine assigns `host.sendRuntime`, `host.sendServices`, `host.sendCmdFn`.
/// @param runtime Value assigned to `host.sendRuntime`.
/// @param sendServices Value assigned to `host.sendServices`.
function attachSend(host,runtime,sendServices)
  if host==void or runtime==void or sendServices==void then return error(7110,"client frame: missing send-command binding") end if
  host.sendRuntime=runtime;host.sendServices=sendServices;host.sendCmdFn=liveSend;return host
end function

/// Calls `fn` from frame `call0`.
/// @param fn Value used by `if fn!=void then fn(host) end if`.
/// @param host host record passed to the frame helper calls.
function call0(fn,host) if fn!=void then fn(host) end if;return void end function

/// Updates `state.modifiedFlags` during frame `checkUserinfo`.
/// @param state Mutable frame record/storage; this routine assigns `state.modifiedFlags`.
/// @param host Record read through `host.infoStringFn`, `host.reliableFn`.
function checkUserinfo(state,host)
  if state.state<CA_CHALLENGING then return false end if
  if state.paused!=0 then return false end if
  if (state.modifiedFlags&CVAR_USERINFO)==0 then return false end if
  state.modifiedFlags=state.modifiedFlags&(~CVAR_USERINFO)
  info="";if host.infoStringFn!=void then info=host.infoStringFn(host,CVAR_USERINFO) end if
  if host.reliableFn!=void then host.reliableFn(host,"userinfo \""+info+"\"") end if
  return true
end function

/// Updates `state.timeoutCount` during frame `checkTimeout`.
/// @param state Mutable frame record/storage; this routine assigns `state.timeoutCount`.
/// @param host Record read through `host.diagnosticFn`, `host.disconnectFn`.
function checkTimeout(state,host)
  timedOut=(state.paused==0 or state.serverPaused==0) and state.state>=CA_CONNECTED and state.state!=CA_CINEMATIC and state.realtime-state.lastPacketTime>state.timeoutSeconds*1000
  if timedOut then
    state.timeoutCount=state.timeoutCount+1
    if state.timeoutCount>5 then
      if host.diagnosticFn!=void then host.diagnosticFn(host,"Server connection timed out.") end if
      if host.disconnectFn!=void then host.disconnectFn(host,true) end if
      return true
    end if
  else
    state.timeoutCount=0
  end if
  return false
end function

/// Updates `state.cdDialog`, `state.realFrametime`, `state.frametime`, `state.realtime` and additional values during frame `run`.
/// @param state Mutable frame record/storage; this routine assigns `state.cdDialog`, `state.realFrametime`, `state.frametime`, `state.realtime` and additional values.
/// @param msec Time interval in milliseconds.
/// @param host Mutable frame record/storage; this routine assigns `host.sendRuntime.connectionState`, `host.sendRuntime.realtime`, `host.sendRuntime.serverRunning`, `host.sendRuntime.serverPaused` and additional values.
function run(state,msec,host)
  if state==void or host==void then return error(7110,"client frame: missing runtime or services") end if
  if state.running==0 then return "not-running" end if

  if state.cdDialog!=0 then
    state.cdDialog=0
    if host.menuFn!=void then host.menuFn(host,UIMENU_NEED_CD) end if
  else if state.state==CA_DISCONNECTED and (state.keyCatchers&KEYCATCH_UI)==0 and state.serverRunning==0 then
    call0(host.stopSoundsFn,host)
    if host.menuFn!=void then host.menuFn(host,UIMENU_MAIN) end if
  end if

  if state.aviDemo!=0 and msec!=0 then
    if state.state==CA_ACTIVE or state.forceAviDemo!=0 then
      if host.commandTextFn!=void then host.commandTextFn(host,"screenshot silent\n") end if
    end if
    msec=numeric.trunc32(numeric.trunc32(1000/state.aviDemo)*state.timeScale)
    if msec==0 then msec=1 end if
  end if

  state.realFrametime=msec
  state.frametime=msec
  state.realtime=numeric.add32(state.realtime,state.frametime)
  if state.timeGraph!=0 and host.debugGraphFn!=void then host.debugGraphFn(host,state.realFrametime*0.25,0) end if

  checkUserinfo(state,host)
  checkTimeout(state,host)
  if host.sendRuntime!=void then
    host.sendRuntime.connectionState=state.state;host.sendRuntime.realtime=state.realtime
    host.sendRuntime.serverRunning=state.serverRunning!=0;host.sendRuntime.serverPaused=state.serverPaused!=0;host.sendRuntime.clientPaused=state.paused!=0
  end if
  call0(host.sendCmdFn,host)
  call0(host.resendFn,host)
  call0(host.setCGameTimeFn,host)
  call0(host.screenFn,host)
  call0(host.soundFn,host)
  call0(host.cinematicFn,host)
  call0(host.consoleFn,host)
  state.framecount=numeric.add32(state.framecount,1)
  return "frame"
end function
