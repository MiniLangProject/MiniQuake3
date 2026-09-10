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

struct Client state lastPacketTime timeoutCount end struct
function client(state,lastPacketTime,timeoutCount) return Client(state,lastPacketTime,timeoutCount) end function

struct Runtime time timeoutSeconds zombieSeconds maxClients clients end struct
function runtime(clients)
  size=0;if clients!=void then size=len(clients) end if
  return Runtime(0,200,2,size,clients)
end function

struct Services dropFn diagnosticFn context end struct
function services() return Services(void,void,void) end function

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
