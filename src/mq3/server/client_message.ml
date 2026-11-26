// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Outer SV_ExecuteClientMessage parser from server/sv_client.c.
package mq3.server.client_message
import mq3.qcommon.message as msgio
import std.string as strings

const MAX_RELIABLE_COMMANDS=64
const CS_ZOMBIE=1
const CLC_MOVE=2
const CLC_MOVE_NO_DELTA=3
const CLC_CLIENT_COMMAND=4
const CLC_EOF=5

/// Server record for server.client_message, containing `serverId`, `restartedServerId`.
struct Server serverId restartedServerId end struct
/// Client record for server.client_message, containing `state`, `messageAcknowledge`, `reliableAcknowledge`, `reliableSequence`, `gamestateMessageNum`, `downloadName`, and 4 further fields.
struct Client
  state messageAcknowledge reliableAcknowledge reliableSequence
  gamestateMessageNum downloadName name lastClientCommand
  lastClientCommandString nextReliableTime
end struct
/// Services record for server.client_message, containing `clientCommandFn`, `userMoveFn`, `sendGamestateFn`, `dropFn`, `diagnosticFn`, `context`.
struct Services clientCommandFn userMoveFn sendGamestateFn dropFn diagnosticFn context end struct

/// Create `mq3.server.client_message.Server` with serverId=serverId; restartedServerId=restartedServerId.
/// @param serverId Initial `serverId` field stored in the returned or constructed `mq3.server.client_message.Server` record.
/// @param restartedServerId Initial `restartedServerId` field stored in the returned or constructed `mq3.server.client_message.Server` record.
function createServer(serverId,restartedServerId) return Server(serverId,restartedServerId) end function
/// Create `mq3.server.client_message.Client` with state=0; messageAcknowledge=0; reliableAcknowledge=0; reliableSequence=0; gamestateMessageNum=0; downloadName=""; name=""; lastClientCommand=0; lastClientCommandString=""; nextReliableTime=0.
function createClient() return Client(0,0,0,0,0,"","",0,"",0) end function
/// Create `mq3.server.client_message.Services` with clientCommandFn=void; userMoveFn=void; sendGamestateFn=void; dropFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void) end function

/// Execute client message in server.client_message; the normal completion returns `"eof"`.
///
/// Validation failures include `client message: missing state`.
/// Direct state writes: `clientState.messageAcknowledge`, `clientState.reliableAcknowledge`.
/// @param serverState Record exposing `serverId`, `restartedServerId`.
/// @param clientState Record exposing `messageAcknowledge`, `reliableAcknowledge`, `reliableSequence`, `lastClientCommandString`, `downloadName`, `gamestateMessageNum`, `state`. Updated in place: `messageAcknowledge`, `reliableAcknowledge`.
/// @param host Record exposing `dropFn`, `sendGamestateFn`, `clientCommandFn`, `userMoveFn`, `diagnosticFn`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.bitstream`.
function execute(serverState,clientState,host,msg)
  if serverState==void or clientState==void or host==void or msg==void then return error(6980,"client message: missing state") end if
  msgio.bitstream(msg)
  serverId=msgio.readI32(msg);clientState.messageAcknowledge=msgio.readI32(msg)
  if clientState.messageAcknowledge<0 then
    if host.dropFn!=void then host.dropFn(host,clientState,"DEBUG: illegible client message") end if
    return "negativeMessageAck"
  end if
  clientState.reliableAcknowledge=msgio.readI32(msg)
  if clientState.reliableAcknowledge<clientState.reliableSequence-MAX_RELIABLE_COMMANDS then
    if host.dropFn!=void then host.dropFn(host,clientState,"DEBUG: illegible client message") end if
    clientState.reliableAcknowledge=clientState.reliableSequence
    return "staleReliableAck"
  end if
  nextDownload=strings.indexOf(clientState.lastClientCommandString,"nextdl",0)>=0
  if serverId!=serverState.serverId and clientState.downloadName=="" and not nextDownload then
    if serverId>=serverState.restartedServerId and serverId<serverState.serverId then return "oldServerId" end if
    if clientState.messageAcknowledge>clientState.gamestateMessageNum then
      if host.sendGamestateFn!=void then host.sendGamestateFn(host,clientState) end if
      return "resendGamestate"
    end if
    return "wrongServerId"
  end if
  command=msgio.readU8(msg)
  while command==CLC_CLIENT_COMMAND
    if host.clientCommandFn!=void then
      if not host.clientCommandFn(host,clientState,msg) then return "commandRejected" end if
    end if
    if clientState.state==CS_ZOMBIE then return "zombie" end if
    command=msgio.readU8(msg)
  end while
  if command==CLC_MOVE then
    if host.userMoveFn!=void then host.userMoveFn(host,clientState,msg,true) end if
    return "move"
  else if command==CLC_MOVE_NO_DELTA then
    if host.userMoveFn!=void then host.userMoveFn(host,clientState,msg,false) end if
    return "moveNoDelta"
  else if command!=CLC_EOF then
    if host.diagnosticFn!=void then host.diagnosticFn(host,clientState,command) end if
    return "badCommand"
  end if
  return "eof"
end function
