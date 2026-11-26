// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive snapshot-to-Cgame clock built on CL_SetCGameTime semantics.
package mq3.client.cgame_clock

import mq3.client.cgame_time as timing

/// Stores client game clock clock record, including `state`, `snapshotNumber`.
struct Clock state snapshotNumber end struct
/// Stores client game clock frame time record, including `draw`, `serverTime`.
struct FrameTime draw serverTime end struct

/// Creates the client game clock error `7691` with diagnostic text `"cgame clock: "+message`.
/// @param message Argument 2 of `error`; passed as `"cgame clock: "+message`.
function fail(message) return error(7691,"cgame clock: "+message) end function

/// Calls `mq3.client.cgame_time.create`, `mq3.client.cgame_time.services`, `mq3.client.cgame_clock.Clock` from client game clock `create`. The final path returns `Clock(state,snapshotNumber)`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param snapshotNumber Value used by `if realtime<0 or snapshotNumber<0 or snapshotServerTime<0 then return fail("negative initial time or sequence") end if`.
/// @param snapshotServerTime Value assigned to `state.snapServerTime`.
function create(realtime,snapshotNumber,snapshotServerTime)
  if realtime<0 or snapshotNumber<0 or snapshotServerTime<0 then return fail("negative initial time or sequence") end if
  state=timing.create(timing.services())
  state.connectionState=timing.CA_PRIMED;state.realtime=realtime
  state.snapValid=true;state.snapFlags=0;state.snapServerTime=snapshotServerTime
  state.newSnapshots=true
  return Clock(state,snapshotNumber)
end function

/// Updates `clock.snapshotNumber`, `clock.state.snapServerTime`, `clock.state.snapFlags`, `clock.state.snapValid` and additional values during client game clock `publishSnapshot`.
/// @param clock Mutable client game clock record/storage; this routine assigns `clock.snapshotNumber`, `clock.state.snapServerTime`, `clock.state.snapFlags`, `clock.state.snapValid` and additional values.
/// @param snapshotNumber Value assigned to `clock.snapshotNumber`.
/// @param serverTime Authoritative server timestamp in milliseconds.
/// @param snapFlags Snapshot flags controlling validity, interpolation and server restarts.
function publishSnapshot(clock,snapshotNumber,serverTime,snapFlags)
  if clock==void or clock.state==void then return fail("missing clock") end if
  if snapshotNumber<clock.snapshotNumber then return fail("snapshot sequence went backwards") end if
  if snapshotNumber==clock.snapshotNumber then
    if serverTime!=clock.state.snapServerTime then return fail("same snapshot changed server time") end if
    return false
  end if
  if serverTime<clock.state.snapServerTime then return fail("snapshot time went backwards") end if
  clock.snapshotNumber=snapshotNumber;clock.state.snapServerTime=serverTime
  clock.state.snapFlags=snapFlags;clock.state.snapValid=true;clock.state.newSnapshots=true
  return true
end function

/// Updates `clock.state.timeNudge` during client game clock `setTimeNudge`.
/// @param clock Mutable client game clock record/storage; this routine assigns `clock.state.timeNudge`.
/// @param value Value assigned to `clock.state.timeNudge`.
function setTimeNudge(clock,value)
  if clock==void or clock.state==void then return fail("missing clock") end if
  clock.state.timeNudge=value;return void
end function

/// Updates `clock.state.serverPaused`, `clock.state.clientPaused`, `clock.state.serverRunning` during client game clock `setPaused`.
/// @param clock Mutable client game clock record/storage; this routine assigns `clock.state.serverPaused`, `clock.state.clientPaused`, `clock.state.serverRunning`.
/// @param serverPaused Value assigned to `clock.state.serverPaused`.
/// @param clientPaused Value assigned to `clock.state.clientPaused`.
/// @param serverRunning Value assigned to `clock.state.serverRunning`.
function setPaused(clock,serverPaused,clientPaused,serverRunning)
  if clock==void or clock.state==void then return fail("missing clock") end if
  clock.state.serverPaused=serverPaused;clock.state.clientPaused=clientPaused
  clock.state.serverRunning=serverRunning;return void
end function

/// Updates `clock.state.realtime` during client game clock `frame`.
/// @param clock Mutable client game clock record/storage; this routine assigns `clock.state.realtime`.
/// @param realtime Current client real-time clock in milliseconds.
function frame(clock,realtime)
  if clock==void or clock.state==void then return fail("missing clock") end if
  if realtime<0 then return fail("negative realtime") end if
  clock.state.realtime=realtime
  draw=timing.setCGameTime(clock.state);if draw is error then return draw end if
  return FrameTime(draw,clock.state.serverTime)
end function
