// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive outer CL_Frame composition from client/cl_main.c.
package mq3.client.frame
import mq3.compat.numeric as numeric

const CA_DISCONNECTED=1
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_ACTIVE=8
const CA_CINEMATIC=9
const KEYCATCH_UI=2
const CVAR_USERINFO=2
const UIMENU_MAIN=1
const UIMENU_NEED_CD=3

struct Runtime
  running cdDialog state keyCatchers serverRunning
  aviDemo forceAviDemo timeScale timeGraph
  realFrametime frametime realtime framecount
  paused serverPaused modifiedFlags lastPacketTime timeoutSeconds timeoutCount
end struct

function runtime()
  return Runtime(0,0,CA_DISCONNECTED,0,0,0,0,1.0,0,0,0,0,0,0,0,0,0,30.0,0)
end function

// The opaque runtime references let a platform host bind the already ported
// network_ingress, protocol_runtime and demo runtimes. The callbacks retain the
// original engine boundaries: SendCmd owns client netchan output, resend owns
// connectionless negotiation and setCGameTime owns snapshot/demo advancement.
struct Services
  menuFn stopSoundsFn commandTextFn debugGraphFn infoStringFn reliableFn diagnosticFn disconnectFn
  sendCmdFn resendFn setCGameTimeFn screenFn soundFn cinematicFn consoleFn
  networkRuntime protocolRuntime demoRuntime context
end struct

function services()
  return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

function call0(fn,host) if fn!=void then fn(host) end if;return void end function

function checkUserinfo(state,host)
  if state.state<CA_CHALLENGING then return false end if
  if state.paused!=0 then return false end if
  if (state.modifiedFlags&CVAR_USERINFO)==0 then return false end if
  state.modifiedFlags=state.modifiedFlags&(~CVAR_USERINFO)
  info="";if host.infoStringFn!=void then info=host.infoStringFn(host,CVAR_USERINFO) end if
  if host.reliableFn!=void then host.reliableFn(host,"userinfo \""+info+"\"") end if
  return true
end function

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
