// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive snapshot-to-Cgame clock built on CL_SetCGameTime semantics.
package mq3.client.cgame_clock

import mq3.client.cgame_time as timing

struct Clock state snapshotNumber end struct
struct FrameTime draw serverTime end struct

function fail(message) return error(7691,"cgame clock: "+message) end function

function create(realtime,snapshotNumber,snapshotServerTime)
  if realtime<0 or snapshotNumber<0 or snapshotServerTime<0 then return fail("negative initial time or sequence") end if
  state=timing.create(timing.services())
  state.connectionState=timing.CA_PRIMED;state.realtime=realtime
  state.snapValid=true;state.snapFlags=0;state.snapServerTime=snapshotServerTime
  state.newSnapshots=true
  return Clock(state,snapshotNumber)
end function

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

function setTimeNudge(clock,value)
  if clock==void or clock.state==void then return fail("missing clock") end if
  clock.state.timeNudge=value;return void
end function

function setPaused(clock,serverPaused,clientPaused,serverRunning)
  if clock==void or clock.state==void then return fail("missing clock") end if
  clock.state.serverPaused=serverPaused;clock.state.clientPaused=clientPaused
  clock.state.serverRunning=serverRunning;return void
end function

function frame(clock,realtime)
  if clock==void or clock.state==void then return fail("missing clock") end if
  if realtime<0 then return fail("negative realtime") end if
  clock.state.realtime=realtime
  draw=timing.setCGameTime(clock.state);if draw is error then return draw end if
  return FrameTime(draw,clock.state.serverTime)
end function
