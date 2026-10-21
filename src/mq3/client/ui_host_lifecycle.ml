// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Host-owned uiClientState_t ABI and SCR_DrawScreenField UI state machine.
package mq3.client.ui_host_lifecycle

import mq3.compat.numeric as n

const CA_UNINITIALIZED=0
const CA_DISCONNECTED=1
const CA_AUTHORIZING=2
const CA_CONNECTING=3
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_LOADING=6
const CA_PRIMED=7
const CA_ACTIVE=8
const CA_CINEMATIC=9
const KEYCATCH_UI=2
const UIMENU_MAIN=1
const MAX_STRING_CHARS=1024
const CLIENT_STATE_SIZE=3084

struct ClientState connState connectPacketCount clientNum servername updateInfoString messageString end struct
struct Services context fullscreenFn refreshFn menuFn connectFn cgameFn cinematicFn catcherFn end struct
struct Frame fullscreen cgameFrames cinematicFrames menuCalls refreshCalls connectCalls overlay end struct

function fail(message) return error(3460,"UI host lifecycle: "+message) end function

function createClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)
  state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)
  valid=validateClientState(state);if valid is error then return valid end if;return state
end function

function validateClientState(state)
  if state==void or state.connState<CA_UNINITIALIZED or state.connState>CA_CINEMATIC then return fail("invalid connection state") end if
  if typeof(state.connectPacketCount)!="int" or typeof(state.clientNum)!="int" then return fail("packet count and client number must be integers") end if
  if typeof(state.servername)!="string" or typeof(state.updateInfoString)!="string" or typeof(state.messageString)!="string" then return fail("client-state text must be strings") end if
  return void
end function

function writeFixedString(data,offset,text)
  encoded=bytes(text);count=len(encoded);if count>=MAX_STRING_CHARS then count=MAX_STRING_CHARS-1 end if
  if count>0 then copyBytes(data,offset,encoded,0,count) end if
  return count
end function

function encodeClientState(state)
  valid=validateClientState(state);if valid is error then return valid end if
  // uiClientState_t in ui_public.h: three 32-bit fields, then three 1024-byte strings.
  data=bytes(CLIENT_STATE_SIZE,0);n.writeU32(data,0,state.connState);n.writeU32(data,4,state.connectPacketCount);n.writeU32(data,8,state.clientNum)
  writeFixedString(data,12,state.servername);writeFixedString(data,1036,state.updateInfoString);writeFixedString(data,2060,state.messageString)
  return data
end function

function connecting(state)
  if state>=CA_AUTHORIZING and state<CA_ACTIVE then return 1 end if;return 0
end function

function services(context,fullscreenFn,refreshFn,menuFn,connectFn,cgameFn,cinematicFn,catcherFn)
  return Services(context,fullscreenFn,refreshFn,menuFn,connectFn,cgameFn,cinematicFn,catcherFn)
end function

function requireServices(host)
  if host==void or host.fullscreenFn==void or host.refreshFn==void or host.menuFn==void or host.connectFn==void or host.cgameFn==void or host.cinematicFn==void or host.catcherFn==void then return fail("complete screen services are required") end if
  return void
end function

function drawScreen(host,connState,realtime)
  valid=requireServices(host);if valid is error then return valid end if
  if connState<CA_DISCONNECTED or connState>CA_CINEMATIC or connState==CA_AUTHORIZING then return fail("connection state cannot be drawn") end if
  if typeof(realtime)!="int" or realtime<0 then return fail("non-negative realtime is required") end if
  full=host.fullscreenFn(host.context);if full is error then return full end if
  cgameFrames=0;cinematicFrames=0;menuCalls=0;refreshCalls=0;connectCalls=0;overlay=false
  if not full then
    if connState==CA_CINEMATIC then
      value=host.cinematicFn(host.context);if value is error then return value end if;cinematicFrames=1
    else if connState==CA_DISCONNECTED then
      value=host.menuFn(host.context,UIMENU_MAIN);if value is error then return value end if;menuCalls=1
    else if connState==CA_CONNECTING or connState==CA_CHALLENGING or connState==CA_CONNECTED then
      value=host.refreshFn(host.context,realtime);if value is error then return value end if;refreshCalls=refreshCalls+1
      value=host.connectFn(host.context,false);if value is error then return value end if;connectCalls=1
    else if connState==CA_LOADING or connState==CA_PRIMED then
      value=host.cgameFn(host.context);if value is error then return value end if;cgameFrames=1
      value=host.refreshFn(host.context,realtime);if value is error then return value end if;refreshCalls=refreshCalls+1
      value=host.connectFn(host.context,true);if value is error then return value end if;connectCalls=1;overlay=true
    else if connState==CA_ACTIVE then
      value=host.cgameFn(host.context);if value is error then return value end if;cgameFrames=1
    end if
  end if
  catcher=host.catcherFn(host.context);if catcher is error then return catcher end if
  if (catcher&KEYCATCH_UI)!=0 then value=host.refreshFn(host.context,realtime);if value is error then return value end if;refreshCalls=refreshCalls+1 end if
  return Frame(full,cgameFrames,cinematicFrames,menuCalls,refreshCalls,connectCalls,overlay)
end function

function clearUiCatcher(context,getFn,setFn)
  if getFn==void or setFn==void then return fail("key catcher services are required") end if
  value=getFn(context);if value is error then return value end if
  return setFn(context,value&(~KEYCATCH_UI))
end function
