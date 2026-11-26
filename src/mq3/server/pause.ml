// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_CheckPaused from server/sv_main.c.
package mq3.server.pause

const NA_BOT=0
const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4

/// Client record for server.pause, containing `state`, `addressType`.
struct Client state addressType end struct
/// Create `mq3.server.pause.Client` with state=state; addressType=addressType.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.pause.Client` record.
/// @param addressType Initial `addressType` field stored in the returned or constructed `mq3.server.pause.Client` record.
function client(state,addressType) return Client(state,addressType) end function

// cvarSets is the number of Cvar_Set calls made by the original function.
// The result carries the resulting sv_paused integer so callers can apply it.
struct PauseResult paused svPaused cvarSets end struct

/// Check pause in server.pause; the normal completion returns `PauseResult(true, svPaused, 0)`.
///
/// Validation failures include `server pause: missing client array`; `server pause: missing client`.
/// @param clients Clients used in `clients[i]` and `len(clients)`.
/// @param clPaused Cl paused used in `(clPaused == 0)`.
/// @param svPaused Initial `svPaused` field stored in the returned or constructed `mq3.server.pause.PauseResult` record.
function check(clients,clPaused,svPaused)
  if clients==void then return error(7260,"server pause: missing client array") end if
  if clPaused==0 then return PauseResult(false,svPaused,0) end if
  count=0;i=0
  while i<len(clients)
    cl=clients[i]
    if cl==void then return error(7261,"server pause: missing client") end if
    if cl.state>=CS_CONNECTED and cl.addressType!=NA_BOT then count=count+1 end if
    i=i+1
  end while
  if count>1 then
    if svPaused!=0 then return PauseResult(false,0,1) end if
    return PauseResult(false,svPaused,0)
  end if
  if svPaused==0 then return PauseResult(true,1,1) end if
  return PauseResult(true,svPaused,0)
end function
