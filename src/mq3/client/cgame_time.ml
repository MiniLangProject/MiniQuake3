// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_AdjustTimeDelta, CL_FirstSnapshot and CL_SetCGameTime.
package mq3.client.cgame_time

const RESET_TIME=500
const SNAPFLAG_NOT_ACTIVE=2
const CA_PRIMED=7
const CA_ACTIVE=8

struct Services context addTextFn clearActiveActionFn beginProfilingFn readDemoFn millisecondsFn diagnosticFn end struct
struct State
  host
  connectionState
  realtime
  snapValid
  snapFlags
  snapServerTime
  newSnapshots
  extrapolatedSnapshot
  serverTimeDelta
  oldServerTime
  serverTime
  oldFrameServerTime
  demoPlaying
  firstDemoFrameSkipped
  freezeDemo
  timedemo
  timeDemoStart
  timeDemoFrames
  timeDemoBaseTime
  timeNudge
  serverRunning
  serverPaused
  clientPaused
  timescale
  activeAction
end struct

function services() return Services(void,void,void,void,void,void,void) end function
function create(host)
  if host==void then host=services() end if
  return State(host,0,0,false,0,0,false,false,0,0,0,0,false,false,false,false,0,0,0,0,false,false,false,1.0,"")
end function
function diagnostic(state,text) host=state.host;context=host.context;if host.diagnosticFn!=void then host.diagnosticFn(context,text) end if;return void end function

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

function readDemo(state)
  host=state.host;if host.readDemoFn==void then return error(3460,"cgame time: demo reader unavailable") end if
  context=host.context;host.readDemoFn(context,state);return void
end function

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
