// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_AdjustTimeDelta, CL_FirstSnapshot and CL_SetCGameTime.
package mq3.client.cgame_time

/// Server-time delta error threshold, in milliseconds, that triggers a hard clock correction.
const RESET_TIME=500
/// Snapshot flag indicating that the server state is not yet active for normal gameplay.
const SNAPFLAG_NOT_ACTIVE=2
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Connection-state value for normal gameplay after game-state loading, defined for advancing the
/// active game's server clock.
const CA_ACTIVE=8

/// Stores client game time host-service callbacks, including `context`, `addTextFn`, `clearActiveActionFn`, `beginProfilingFn`, `readDemoFn`, `millisecondsFn` and additional values.
struct Services
  /// Caller-supplied value forwarded unchanged to the service callbacks for the engine's CGame time
  /// controller.
  context
  /// Host callback for the add text operation; an unset callback leaves that host operation
  /// unavailable.
  addTextFn
  /// Host callback for the clear active action operation; an unset callback leaves that host operation
  /// unavailable.
  clearActiveActionFn
  /// Host callback for the begin profiling operation; an unset callback leaves that host operation
  /// unavailable.
  beginProfilingFn
  /// Host callback for the read demo operation; an unset callback leaves that host operation
  /// unavailable.
  readDemoFn
  /// Host callback for the milliseconds operation; an unset callback leaves that host operation
  /// unavailable.
  millisecondsFn
  /// Host callback for the diagnostic operation; an unset callback leaves that host operation
  /// unavailable.
  diagnosticFn
end struct
/// Stores client game time state, including `host`, `connectionState`, `realtime`, `snapValid`, `snapFlags`, `snapServerTime` and additional values.
struct State
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// Local client clock in milliseconds used to estimate the server-time offset and presentation time.
  realtime
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  snapValid
  /// Snapshot flags describing rate delay and dropped-command conditions.
  snapFlags
  /// When constructing this record, `create` supplies `0` for this member. Used by `adjustTimeDelta`
  /// and `firstSnapshot` during subsequent processing.
  snapServerTime
  /// True after parsing a new valid snapshot that has not yet been consumed.
  newSnapshots
  /// True when a CGame frame had to extrapolate beyond the newest available snapshot.
  extrapolatedSnapshot
  /// Offset added to client realtime to estimate current server time.
  serverTimeDelta
  /// Previous client estimate of server time, retained to prevent time from moving backward.
  oldServerTime
  /// Synchronized client presentation time for server state, in milliseconds, after time-offset and
  /// nudge adjustment.
  serverTime
  /// Server time from the preceding rendered frame, used to recognize restart discontinuities.
  oldFrameServerTime
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  firstDemoFrameSkipped
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  freezeDemo
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  timedemo
  /// Client realtime timestamp at the beginning of the timed-demo measurement.
  timeDemoStart
  /// Number of frames rendered during the timed-demo measurement.
  timeDemoFrames
  /// Base server time from which fixed-step timed-demo frames are calculated.
  timeDemoBaseTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  timeNudge
  /// True when a local game server is running in the same engine instance.
  serverRunning
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  serverPaused
  /// When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime`
  /// during subsequent processing.
  clientPaused
  /// When constructing this record, `create` supplies `1.0` for this member. Used by `adjustTimeDelta`
  /// during subsequent processing.
  timescale
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `firstSnapshot` during subsequent processing.
  activeAction
end struct

/// Creates a `mq3.client.cgame_time.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void,void) end function
/// Calls `mq3.client.cgame_time.services`, `mq3.client.cgame_time.State` from client game time `create`.
/// @param host host record passed to the client game time helper calls.
function create(host)
  if host==void then host=services() end if
  return State(host,0,0,false,0,0,false,false,0,0,0,0,false,false,false,false,0,0,0,0,false,false,false,1.0,"")
end function
/// Calls `host.diagnosticFn` from client game time `diagnostic`.
/// @param state Record read through `state.host`.
/// @param text Text consumed or emitted by `diagnostic` in the client game time path.
function diagnostic(state,text) host=state.host;context=host.context;if host.diagnosticFn!=void then host.diagnosticFn(context,text) end if;return void end function

/// Updates `state.newSnapshots`, `state.serverTimeDelta`, `state.oldServerTime`, `state.serverTime` and additional values during client game time `adjustTimeDelta`.
/// @param state Mutable client game time record/storage; this routine assigns `state.newSnapshots`, `state.serverTimeDelta`, `state.oldServerTime`, `state.serverTime` and additional values.
function adjustTimeDelta(state)
  state.newSnapshots=false
  if state.demoPlaying then return void end if
  newDelta=state.snapServerTime-state.realtime;difference=newDelta-state.serverTimeDelta;if difference<0 then difference=0-difference end if
  if difference>RESET_TIME then
    state.serverTimeDelta=newDelta;state.oldServerTime=state.snapServerTime;state.serverTime=state.snapServerTime;diagnostic(state,"reset")
  else if difference>100 then
    state.serverTimeDelta=(state.serverTimeDelta+newDelta)>>1;diagnostic(state,"fast")
  else if state.timescale==0.0 or state.timescale==1.0 then
    if state.extrapolatedSnapshot then state.extrapolatedSnapshot=false;state.serverTimeDelta=state.serverTimeDelta-2
    else state.serverTimeDelta=state.serverTimeDelta+1 end if
  end if
  return void
end function

/// Updates `state.connectionState`, `state.serverTimeDelta`, `state.oldServerTime`, `state.timeDemoBaseTime` and additional values during client game time `firstSnapshot`.
/// @param state Mutable client game time record/storage; this routine assigns `state.connectionState`, `state.serverTimeDelta`, `state.oldServerTime`, `state.timeDemoBaseTime` and additional values.
function firstSnapshot(state)
  if (state.snapFlags & SNAPFLAG_NOT_ACTIVE)!=0 then return false end if
  state.connectionState=CA_ACTIVE;state.serverTimeDelta=state.snapServerTime-state.realtime
  state.oldServerTime=state.snapServerTime;state.timeDemoBaseTime=state.snapServerTime
  host=state.host;context=host.context
  if state.activeAction!="" then
    if host.addTextFn!=void then host.addTextFn(context,state.activeAction) end if
    state.activeAction="";if host.clearActiveActionFn!=void then host.clearActiveActionFn(context) end if
  end if
  if host.beginProfilingFn!=void then host.beginProfilingFn(context) end if
  return true
end function

/// Calls `host.readDemoFn` from client game time `readDemo`.
/// @param state Record read through `state.host`.
function readDemo(state)
  host=state.host;if host.readDemoFn==void then return error(3460,"cgame time: demo reader unavailable") end if
  context=host.context;host.readDemoFn(context,state);return void
end function

/// Updates `state.firstDemoFrameSkipped`, `state.newSnapshots`, `state.oldFrameServerTime`, `state.serverTime` and additional values during client game time `setCGameTime`.
/// @param state Mutable client game time record/storage; this routine assigns `state.firstDemoFrameSkipped`, `state.newSnapshots`, `state.oldFrameServerTime`, `state.serverTime` and additional values.
function setCGameTime(state)
  if state.connectionState!=CA_ACTIVE then
    if state.connectionState!=CA_PRIMED then return false end if
    if state.demoPlaying then
      if not state.firstDemoFrameSkipped then state.firstDemoFrameSkipped=true;return false end if
      readDemo(state)
    end if
    if state.newSnapshots then state.newSnapshots=false;firstSnapshot(state) end if
    if state.connectionState!=CA_ACTIVE then return false end if
  end if
  if not state.snapValid then return error(3460,"cgame time: invalid active snapshot") end if
  if state.serverPaused and state.clientPaused and state.serverRunning then return false end if
  if state.snapServerTime<state.oldFrameServerTime then return error(3460,"cgame time: snapshot time went backwards") end if
  state.oldFrameServerTime=state.snapServerTime
  if not (state.demoPlaying and state.freezeDemo) then
    nudge=state.timeNudge;if nudge< -30 then nudge=-30 else if nudge>30 then nudge=30 end if
    state.serverTime=state.realtime+state.serverTimeDelta-nudge
    if state.serverTime<state.oldServerTime then state.serverTime=state.oldServerTime end if
    state.oldServerTime=state.serverTime
    if state.realtime+state.serverTimeDelta>=state.snapServerTime-5 then state.extrapolatedSnapshot=true end if
  end if
  if state.newSnapshots then adjustTimeDelta(state) end if
  if not state.demoPlaying then return true end if
  if state.timedemo then
    if state.timeDemoStart==0 then
      host=state.host;if host.millisecondsFn==void then return error(3460,"cgame time: millisecond clock unavailable") end if
      context=host.context;state.timeDemoStart=host.millisecondsFn(context)
    end if
    state.timeDemoFrames=state.timeDemoFrames+1;state.serverTime=state.timeDemoBaseTime+state.timeDemoFrames*50
  end if
  iterations=0
  while state.serverTime>=state.snapServerTime
    readDemo(state);if state.connectionState!=CA_ACTIVE then return false end if
    iterations=iterations+1;if iterations>100000 then return error(3460,"cgame time: demo reader made no progress") end if
  end while
  return true
end function
