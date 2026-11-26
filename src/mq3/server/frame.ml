// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive outer SV_Frame composition from server/sv_main.c.
package mq3.server.frame
import mq3.compat.numeric as numeric
import mq3.server.pause as serverPause
import mq3.server.client_pings as clientPings
import mq3.server.timeouts as serverTimeouts
import mq3.server.snapshot_schedule as snapshotSchedule

const CVAR_SERVERINFO=4
const CVAR_SYSTEMINFO=8
const CS_SERVERINFO=0
const CS_SYSTEMINFO=1

/// Runtime record for server.frame, containing `killServer`, `running`, `clPaused`, `svPaused`, `fps`, `dedicated`, and 14 further fields.
struct Runtime killServer running clPaused svPaused fps dedicated speeds modifiedFlags timeGame timeResidual time restartTime nextSnapshotEntities numSnapshotEntities maxRate pauseClients pingClients playerStates timeoutState snapshotClients end struct
/// Create `mq3.server.frame.Runtime` with killServer=0; running=0; clPaused=0; svPaused=0; 16 further fields.
function runtime()
  return Runtime(0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,[],[],[],void,[])
end function

/// Services record for server.frame, containing `shutdownFn`, `cvarSetFn`, `botFrameFn`, `sleepFn`, `commandFn`, `infoStringFn`, and 11 further fields.
struct Services shutdownFn cvarSetFn botFrameFn sleepFn commandFn infoStringFn setConfigstringFn millisecondsFn gameFrameFn heartbeatFn pauseObservedFn pingsObservedFn timeoutObservedFn messagesObservedFn timeoutServices snapshotServices context end struct
/// Create `mq3.server.frame.Services` with shutdownFn=void; cvarSetFn=void; botFrameFn=void; sleepFn=void; 13 further fields.
function services()
  return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void,serverTimeouts.services(),void,void)
end function

/// Compute call 0 in server.frame.
/// @param fn Fn used in `fn(host)` and `(fn != void)`.
/// @param host Host used in `fn(host)`.
function call0(fn,host) if fn!=void then fn(host) end if;return void end function
/// Compute cvar set in server.frame.
/// @param host Record exposing `cvarSetFn`.
/// @param name Name used in `host.cvarSetFn(host, name, value)`.
/// @param value Value used in `host.cvarSetFn(host, name, value)`.
function cvarSet(host,name,value) if host.cvarSetFn!=void then host.cvarSetFn(host,name,value) end if;return void end function

// Runs one outer server frame. All platform/VM effects are explicit services;
// ping, pause, timeout and snapshot policy use their productive port modules.
/// @param state Record exposing `killServer`, `running`, `pauseClients`, `clPaused`, `svPaused`, `fps`, `timeResidual` and further fields. Updated in place: `killServer`, `svPaused`, `fps`, `timeResidual`, `restartTime`, `modifiedFlags` and further fields.
/// @param msec Right integer operand; only its low 32 bits participate.
/// @param host Record exposing `shutdownFn`, `pauseObservedFn`, `botFrameFn`, `sleepFn`, `commandFn`, `infoStringFn`, `setConfigstringFn` and further fields.
function run(state,msec,host)
  if state==void or host==void then return error(7280,"server frame: missing runtime or services") end if
  if state.killServer!=0 then
    if host.shutdownFn!=void then host.shutdownFn(host,"Server was killed.\n") end if
    cvarSet(host,"sv_killserver","0");state.killServer=0
    return "killserver"
  end if
  if state.running==0 then return "not-running" end if

  if host.pauseObservedFn!=void then host.pauseObservedFn(host) end if
  paused=serverPause.check(state.pauseClients,state.clPaused,state.svPaused)
  state.svPaused=paused.svPaused
  if paused.cvarSets!=0 then cvarSet(host,"sv_paused",str(state.svPaused)) end if
  if paused.paused then return "paused" end if

  if state.fps<1 then state.fps=10;cvarSet(host,"sv_fps","10") end if
  frameMsec=numeric.trunc32(1000/state.fps)
  state.timeResidual=numeric.add32(state.timeResidual,msec)

  if state.dedicated==0 and host.botFrameFn!=void then host.botFrameFn(host,numeric.add32(state.time,state.timeResidual)) end if
  if state.dedicated!=0 and state.timeResidual<frameMsec then
    if host.sleepFn!=void then host.sleepFn(host,frameMsec-state.timeResidual) end if
    return "sleep"
  end if

  if state.time>1879048192 then
    if host.shutdownFn!=void then host.shutdownFn(host,"Restarting server due to time wrapping") end if
    if host.commandFn!=void then host.commandFn(host,"vstr nextmap\n") end if
    return "time-wrap"
  end if
  if state.nextSnapshotEntities>=numeric.i32(2147483646-state.numSnapshotEntities) then
    if host.shutdownFn!=void then host.shutdownFn(host,"Restarting server due to numSnapshotEntities wrapping") end if
    if host.commandFn!=void then host.commandFn(host,"vstr nextmap\n") end if
    return "snapshot-wrap"
  end if
  if state.restartTime!=0 and state.time>=state.restartTime then
    state.restartTime=0
    if host.commandFn!=void then host.commandFn(host,"map_restart 0\n") end if
    return "restart"
  end if

  if (state.modifiedFlags&CVAR_SERVERINFO)!=0 then
    value="";if host.infoStringFn!=void then value=host.infoStringFn(host,CVAR_SERVERINFO,false) end if
    if host.setConfigstringFn!=void then host.setConfigstringFn(host,CS_SERVERINFO,value) end if
    state.modifiedFlags=state.modifiedFlags&(~CVAR_SERVERINFO)
  end if
  if (state.modifiedFlags&CVAR_SYSTEMINFO)!=0 then
    value="";if host.infoStringFn!=void then value=host.infoStringFn(host,CVAR_SYSTEMINFO,true) end if
    if host.setConfigstringFn!=void then host.setConfigstringFn(host,CS_SYSTEMINFO,value) end if
    state.modifiedFlags=state.modifiedFlags&(~CVAR_SYSTEMINFO)
  end if

  startTime=0
  if state.speeds!=0 and host.millisecondsFn!=void then startTime=host.millisecondsFn(host) end if
  call0(host.pingsObservedFn,host)
  clientPings.calculate(state.pingClients,state.playerStates)
  if state.dedicated!=0 and host.botFrameFn!=void then host.botFrameFn(host,state.time) end if
  while state.timeResidual>=frameMsec
    state.timeResidual=state.timeResidual-frameMsec
    state.time=numeric.add32(state.time,frameMsec)
    if host.gameFrameFn!=void then host.gameFrameFn(host,state.time) end if
  end while
  if state.speeds!=0 and host.millisecondsFn!=void then state.timeGame=host.millisecondsFn(host)-startTime end if

  if state.timeoutState==void then return error(7281,"server frame: missing timeout runtime") end if
  call0(host.timeoutObservedFn,host)
  state.timeoutState.time=state.time
  serverTimeouts.check(state.timeoutState,host.timeoutServices)
  if host.snapshotServices==void then return error(7282,"server frame: missing snapshot services") end if
  call0(host.messagesObservedFn,host)
  snapshotSchedule.sendClientMessages(state.snapshotClients,state.time,state.maxRate,host.snapshotServices)
  call0(host.heartbeatFn,host)
  return "frame"
end function
