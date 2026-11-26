// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client timeout and zombie reclamation policy from SV_CheckTimeouts.
package mq3.server.timeouts
import mq3.compat.numeric as numeric

const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4

/// Client record for server.timeouts, containing `state`, `lastPacketTime`, `timeoutCount`.
struct Client state lastPacketTime timeoutCount end struct
/// Create `mq3.server.timeouts.Client` with state=state; lastPacketTime=lastPacketTime; timeoutCount=timeoutCount.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.timeouts.Client` record.
/// @param lastPacketTime Initial `lastPacketTime` field stored in the returned or constructed `mq3.server.timeouts.Client` record.
/// @param timeoutCount Initial `timeoutCount` field stored in the returned or constructed `mq3.server.timeouts.Client` record.
function client(state,lastPacketTime,timeoutCount) return Client(state,lastPacketTime,timeoutCount) end function

/// Runtime record for server.timeouts, containing `time`, `timeoutSeconds`, `zombieSeconds`, `maxClients`, `clients`.
struct Runtime time timeoutSeconds zombieSeconds maxClients clients end struct
/// Compute runtime in server.timeouts; the normal completion returns `Runtime(0, 200, 2, size, clients)`.
/// @param clients Initial `clients` field stored in the returned or constructed `mq3.server.timeouts.Runtime` record.
function runtime(clients)
  size=0;if clients!=void then size=len(clients) end if
  return Runtime(0,200,2,size,clients)
end function

/// Services record for server.timeouts, containing `dropFn`, `diagnosticFn`, `context`.
struct Services dropFn diagnosticFn context end struct
/// Create `mq3.server.timeouts.Services` with dropFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void) end function

/// Check timeouts in server.timeouts.
///
/// Validation failures include `server timeouts: missing state`; `server timeouts: invalid client count`.
/// @param state Record exposing `clients`, `maxClients`, `time`, `timeoutSeconds`, `zombieSeconds`.
/// @param host Record exposing `diagnosticFn`, `dropFn`.
function check(state,host)
  if state==void or host==void or state.clients==void then return error(7001,"server timeouts: missing state") end if
  if state.maxClients<0 or state.maxClients>len(state.clients) then return error(7002,"server timeouts: invalid client count") end if

  // The frozen x86 Baseq3 build performs both expressions as wrapping
  // signed 32-bit integer arithmetic.
  droppoint=numeric.i32(state.time-numeric.mul32(1000,state.timeoutSeconds))
  zombiepoint=numeric.i32(state.time-numeric.mul32(1000,state.zombieSeconds))

  index=0
  while index<state.maxClients
    candidate=state.clients[index]
    if candidate.lastPacketTime>state.time then candidate.lastPacketTime=state.time end if

    if candidate.state==CS_ZOMBIE and candidate.lastPacketTime<zombiepoint then
      if host.diagnosticFn!=void then host.diagnosticFn(host,index) end if
      candidate.state=CS_FREE
    else if candidate.state>=CS_CONNECTED and candidate.lastPacketTime<droppoint then
      candidate.timeoutCount=numeric.add32(candidate.timeoutCount,1)
      if candidate.timeoutCount>5 then
        if host.dropFn!=void then host.dropFn(host,candidate,"timed out") end if
        candidate.state=CS_FREE
      end if
    else
      candidate.timeoutCount=0
    end if
    index=index+1
  end while
  return void
end function
