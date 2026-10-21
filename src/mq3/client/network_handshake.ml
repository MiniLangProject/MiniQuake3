// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive OOB getchallenge/connect handoff into the live match netchans.
package mq3.client.network_handshake

import mq3.client.connectionless as clientConnectionless
import mq3.client.network_match_loop as matchLoop
import mq3.server.oob_connect as serverConnect
import mq3.qcommon.netchan as netchan

struct Slot runtime clientBound serverBound serverSlot end struct
struct Runtime group server slots lastError end struct

function create(groupState,serverState)
  if groupState==void or serverState==void or groupState.runtimes==void or len(groupState.runtimes)<1 then return error(7715,"network handshake: missing topology") end if
  slots=[]
  for each current in groupState.runtimes
    if current==void or current.clientConnection==void or current.clientConnection.qport<1 or current.clientConnection.qport>65535 then return error(7715,"network handshake: invalid client qport") end if
    slots=slots+[Slot(current,false,false,-1)]
  end for
  return Runtime(groupState,serverState,slots,"")
end function

function sameEndpoint(left,right)
  return clientConnectionless.addressEqual(left,right,true)
end function

function bindClient(slot)
  current=slot.runtime;connection=current.clientConnection
  if connection.connectionState<clientConnectionless.CA_CONNECTED then return false end if
  if connection.channel==void or connection.channel.qport!=connection.qport then return error(7715,"network handshake: invalid client channel") end if
  if not clientConnectionless.addressEqual(connection.channel.remoteAddress,connection.serverAddress,true) then return error(7715,"network handshake: client server address changed") end if
  current.clientWire.connection.challenge=connection.challenge
  if current.clientSendServices==void or current.clientSendServices.context==void then return error(7715,"network handshake: missing client transport") end if
  current.clientSendServices.context.channel=connection.channel;current.clientSendState.connectionState=connection.connectionState
  slot.clientBound=true;return true
end function

function findSlot(state,accepted)
  found=-1
  for index=0 to len(state.slots)-1
    slot=state.slots[index];current=slot.runtime
    if current.clientConnection.qport==accepted.qport and sameEndpoint(current.serverWireClient.channel.remoteAddress,accepted.address) then
      if found>=0 then return error(7715,"network handshake: ambiguous accepted client") end if;found=index
    end if
  end for
  return found
end function

function bindServer(state,serverSlot)
  accepted=state.server.clients[serverSlot]
  for index=0 to len(state.slots)-1
    slot=state.slots[index]
    if slot.serverBound and slot.serverSlot==serverSlot then
      channel=slot.runtime.serverWireClient.channel
      if accepted.challenge!=slot.runtime.serverWireClient.challenge then return error(7715,"network handshake: challenge mismatch") end if
      if accepted.qport!=channel.qport then return error(7715,"network handshake: accepted qport changed") end if
      if not sameEndpoint(accepted.address,channel.remoteAddress) then return error(7715,"network handshake: accepted address changed") end if
      return index
    end if
  end for
  index=findSlot(state,accepted)
  if index is error then return index end if
  if index<0 then return error(7715,"network handshake: accepted client has no match slot") end if
  slot=state.slots[index];current=slot.runtime
  if accepted.challenge!=current.clientConnection.challenge then return error(7715,"network handshake: challenge mismatch") end if
  channel=netchan.setup(netchan.NS_SERVER,accepted.address,accepted.qport)
  current.serverWireClient.challenge=accepted.challenge;current.serverWireClient.channel=channel;current.serverPacketClient.netchan=current.serverWireClient
  current.serverPacketClient.state=accepted.state;current.serverMessageClient.state=accepted.state;current.serverSnapshotClient.state=accepted.state
  slot.serverBound=true;slot.serverSlot=serverSlot;return index
end function

function reconcile(state)
  if state==void then return error(7715,"network handshake: missing runtime") end if
  bound=0
  for each slot in state.slots
    result=bindClient(slot);if result is error then state.lastError=str(result);return result end if
  end for
  for serverSlot=0 to len(state.server.clients)-1
    accepted=state.server.clients[serverSlot]
    if accepted.state>=serverConnect.CS_CONNECTED then result=bindServer(state,serverSlot);if result is error then state.lastError=str(result);return result end if end if
  end for
  for each slot in state.slots if slot.clientBound and slot.serverBound then bound=bound+1 end if end for
  matchLoop.synchronizeGroup(state.group);return bound
end function

function setTime(state,time)
  if state==void then return error(7715,"network handshake: missing runtime") end if
  state.server.time=time;matchLoop.setGroupTime(state.group,time)
  for each slot in state.slots slot.runtime.clientConnection.realtime=time end for;return void
end function

function resend(state)
  if state==void then return error(7715,"network handshake: missing runtime") end if
  sent=0
  for each slot in state.slots
    current=slot.runtime;host=current.clientIngressRuntime.services.connectionlessHost
    result=clientConnectionless.checkForResend(current.clientConnection,host);if result is error then return result end if;if result then sent=sent+1 end if
  end for
  return sent
end function

function pumpOnce(state)
  if state==void then return error(7715,"network handshake: missing runtime") end if
  step=matchLoop.pumpGroupOnce(state.group);if step is error then return step end if;result=reconcile(state);if result is error then return result end if;return step
end function

function pump(state,budget)
  if state==void or budget<0 then return error(7715,"network handshake: invalid pump") end if
  count=0
  while count<budget step=pumpOnce(state);if step is error then return step end if;if not step.processed then return count end if;count=count+1 end while
  return count
end function

function ready(state,index)
  if state==void or index<0 or index>=len(state.slots) then return false end if
  slot=state.slots[index];return slot.clientBound and slot.serverBound
end function
function allReady(state)
  if state==void then return false end if
  for index=0 to len(state.slots)-1 if not ready(state,index) then return false end if end for;return true
end function

// Gamestate parsing normally performs these transitions. Local hosts that have
// installed their game state can atomically expose the already negotiated slot
// to CL_SendCmd/SV_UserMove and snapshot scheduling through this boundary.
function activate(state,index)
  if not ready(state,index) then return error(7715,"network handshake: client is not ready") end if
  slot=state.slots[index];current=slot.runtime;accepted=state.server.clients[slot.serverSlot]
  accepted.state=4;current.clientConnection.connectionState=clientConnectionless.CA_ACTIVE;current.clientSendState.connectionState=clientConnectionless.CA_ACTIVE
  current.serverPacketClient.state=4;current.serverMessageClient.state=4;current.serverSnapshotClient.state=4
  matchLoop.synchronize(current);return current
end function
