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

/// Stores UI host lifecycle client state record, including `connState`, `connectPacketCount`, `clientNum`, `servername`, `updateInfoString`, `messageString`.
struct ClientState connState connectPacketCount clientNum servername updateInfoString messageString end struct
/// Stores UI host lifecycle host-service callbacks, including `context`, `fullscreenFn`, `refreshFn`, `menuFn`, `connectFn`, `cgameFn` and additional values.
struct Services context fullscreenFn refreshFn menuFn connectFn cgameFn cinematicFn catcherFn end struct
/// Stores UI host lifecycle frame data, including `fullscreen`, `cgameFrames`, `cinematicFrames`, `menuCalls`, `refreshCalls`, `connectCalls` and additional values.
struct Frame fullscreen cgameFrames cinematicFrames menuCalls refreshCalls connectCalls overlay end struct

/// Creates the UI host lifecycle error `3460` with diagnostic text `"UI host lifecycle: "+message`.
/// @param message Argument 2 of `error`; passed as `"UI host lifecycle: "+message`.
function fail(message) return error(3460,"UI host lifecycle: "+message) end function

/// Calls `mq3.client.ui_host_lifecycle.ClientState`, `mq3.client.ui_host_lifecycle.validateClientState` from UI host lifecycle `createClientState`. The final path returns `state`.
/// @param connState Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`.
/// @param connectPacketCount Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param servername Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`.
/// @param updateInfoString Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`.
/// @param messageString Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`.
function createClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)
  state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)
  valid=validateClientState(state);if valid is error then return valid end if;return state
end function

/// Evaluates UI host lifecycle `validateClientState` and returns `fail("invalid connection state")`, `fail("packet count and client number must be integers")`, `fail("client-state text must be strings")` and additional values according to its guard/selection conditions.
/// @param state Record read through `state.connState`, `state.connectPacketCount`, `state.clientNum`, `state.servername` and additional values.
function validateClientState(state)
  if state==void or state.connState<CA_UNINITIALIZED or state.connState>CA_CINEMATIC then return fail("invalid connection state") end if
  if typeof(state.connectPacketCount)!="int" or typeof(state.clientNum)!="int" then return fail("packet count and client number must be integers") end if
  if typeof(state.servername)!="string" or typeof(state.updateInfoString)!="string" or typeof(state.messageString)!="string" then return fail("client-state text must be strings") end if
  return void
end function

/// Calls `copyBytes` from UI host lifecycle `writeFixedString`. The final path returns `count`.
/// @param data Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`.
/// @param offset Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`.
/// @param text Text consumed or emitted by `writeFixedString` in the UI host lifecycle path.
function writeFixedString(data,offset,text)
  encoded=bytes(text);count=len(encoded);if count>=MAX_STRING_CHARS then count=MAX_STRING_CHARS-1 end if
  if count>0 then copyBytes(data,offset,encoded,0,count) end if
  return count
end function

/// Calls `mq3.client.ui_host_lifecycle.validateClientState`, `mq3.compat.numeric.writeU32`, `mq3.client.ui_host_lifecycle.writeFixedString` from UI host lifecycle `encodeClientState`. The final path returns `data`.
/// @param state Record read through `state.connState`, `state.connectPacketCount`, `state.clientNum`, `state.servername` and additional values.
function encodeClientState(state)
  valid=validateClientState(state);if valid is error then return valid end if
  // uiClientState_t in ui_public.h: three 32-bit fields, then three 1024-byte strings.
  data=bytes(CLIENT_STATE_SIZE,0);n.writeU32(data,0,state.connState);n.writeU32(data,4,state.connectPacketCount);n.writeU32(data,8,state.clientNum)
  writeFixedString(data,12,state.servername);writeFixedString(data,1036,state.updateInfoString);writeFixedString(data,2060,state.messageString)
  return data
end function

/// Evaluates UI host lifecycle `connecting` and returns `1`, `0` according to its guard/selection conditions.
/// @param state Shared UI host lifecycle state passed to the helper calls in `connecting`.
function connecting(state)
  if state>=CA_AUTHORIZING and state<CA_ACTIVE then return 1 end if;return 0
end function

/// Creates a `mq3.client.ui_host_lifecycle.Services` record. Assigns `context` from `context`, `fullscreenFn` from `fullscreenFn`, `refreshFn` from `refreshFn`, `menuFn` from `menuFn`.
/// @param context Value used to initialize `Services.context`.
/// @param fullscreenFn Value used to initialize `Services.fullscreenFn`.
/// @param refreshFn Value used to initialize `Services.refreshFn`.
/// @param menuFn Value used to initialize `Services.menuFn`.
/// @param connectFn Value used to initialize `Services.connectFn`.
/// @param cgameFn Value used to initialize `Services.cgameFn`.
/// @param cinematicFn Value used to initialize `Services.cinematicFn`.
/// @param catcherFn Value used to initialize `Services.catcherFn`.
function services(context,fullscreenFn,refreshFn,menuFn,connectFn,cgameFn,cinematicFn,catcherFn)
  return Services(context,fullscreenFn,refreshFn,menuFn,connectFn,cgameFn,cinematicFn,catcherFn)
end function

/// Evaluates UI host lifecycle `requireServices` and returns `fail("complete screen services are required")`, `void` according to its guard/selection conditions.
/// @param host Record read through `host.fullscreenFn`, `host.refreshFn`, `host.menuFn`, `host.connectFn` and additional values.
function requireServices(host)
  if host==void or host.fullscreenFn==void or host.refreshFn==void or host.menuFn==void or host.connectFn==void or host.cgameFn==void or host.cinematicFn==void or host.catcherFn==void then return fail("complete screen services are required") end if
  return void
end function

/// Calls `mq3.client.ui_host_lifecycle.requireServices`, `host.fullscreenFn`, `host.cinematicFn` and additional helpers from UI host lifecycle `drawScreen`. The final path returns `Frame(full,cgameFrames,cinematicFrames,menuCalls,refreshCalls,connectCalls,overlay)`.
/// @param host Record read through `host.fullscreenFn`, `host.context`, `host.cinematicFn`, `host.menuFn` and additional values.
/// @param connState Value used by `if connState<CA_DISCONNECTED or connState>CA_CINEMATIC or connState==CA_AUTHORIZING then return fail("connection state cannot be drawn") end if`.
/// @param realtime Current client real-time clock in milliseconds.
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

/// Calls `getFn`, `setFn` from UI host lifecycle `clearUiCatcher`. The final path returns `setFn(context,value&(~KEYCATCH_UI))`.
/// @param context context record passed to the UI host lifecycle helper calls.
/// @param getFn Callback invoked by `clearUiCatcher` for get.
/// @param setFn Callback invoked by `clearUiCatcher` for set.
function clearUiCatcher(context,getFn,setFn)
  if getFn==void or setFn==void then return fail("key catcher services are required") end if
  value=getFn(context);if value is error then return value end if
  return setFn(context,value&(~KEYCATCH_UI))
end function
