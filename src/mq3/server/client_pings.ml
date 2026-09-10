// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_CalcPings from server/sv_main.c.
package mq3.server.client_pings
import mq3.compat.numeric as numeric

const PACKET_BACKUP=32
const CS_ACTIVE=4
const SVF_BOT=8

struct PingFrame messageSent messageAcked end struct
function frame(sent,acked) return PingFrame(sent,acked) end function

struct GameEntity svFlags end struct
function gameEntity(flags) return GameEntity(flags) end function

struct PlayerState ping end struct
function playerState() return PlayerState(0) end function

struct Client state ping gentity frames end struct
function client()
  return Client(0,0,void,array(PACKET_BACKUP,void))
end function

// Updates each engine client's ping and mirrors active, non-bot values into the
// corresponding game playerState, preserving the original early-continue rules.
function calculate(clients,playerStates)
  if clients==void or playerStates==void then return error(7240,"server pings: missing client or player-state array") end if
  if len(playerStates)<len(clients) then return error(7241,"server pings: player-state array too short") end if
  i=0
  while i<len(clients)
    cl=clients[i]
    if cl==void then return error(7242,"server pings: missing client") end if
    if cl.state!=CS_ACTIVE then
      cl.ping=999
    else if cl.gentity==void then
      cl.ping=999
    else if (cl.gentity.svFlags&SVF_BOT)!=0 then
      cl.ping=0
    else
      if cl.frames==void or len(cl.frames)!=PACKET_BACKUP then return error(7243,"server pings: invalid frame ring") end if
      total=0;count=0;j=0
      while j<PACKET_BACKUP
        current=cl.frames[j]
        if current!=void and current.messageAcked>0 then
          total=total+(current.messageAcked-current.messageSent)
          count=count+1
        end if
        j=j+1
      end while
      if count==0 then cl.ping=999 else cl.ping=numeric.trunc32(total/count);if cl.ping>999 then cl.ping=999 end if end if
      ps=playerStates[i]
      if ps==void then return error(7244,"server pings: active client has no player state") end if
      ps.ping=cl.ping
    end if
    i=i+1
  end while
  return clients
end function
