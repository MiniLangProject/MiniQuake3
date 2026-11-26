// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Outer SV_ExecuteClientMessage parser from server/sv_client.c.
package mq3.server.client_message
import mq3.qcommon.message as msgio
import std.string as strings

/// Capacity of the reliable-command ring retained until acknowledgment.
const MAX_RELIABLE_COMMANDS=64
/// Client lifecycle state retaining a recently disconnected client for final messages.
const CS_ZOMBIE=1
/// Client-to-server opcode carrying user commands with snapshot delta acknowledgment.
const CLC_MOVE=2
/// Client-to-server opcode carrying user commands while requesting a full snapshot.
const CLC_MOVE_NO_DELTA=3
/// Client-to-server opcode introducing a reliable textual client command.
const CLC_CLIENT_COMMAND=4
/// Client-to-server opcode marking the end of a message.
const CLC_EOF=5

/// Current and restart-era server identifiers used to reject stale client message streams.
struct Server
  /// Identifier distinguishing the current server or map session.
  serverId
  /// Server identifier retained from before the latest map restart.
  restartedServerId
end struct
/// Client acknowledgment, reliable-command, download, and lifecycle state used during message dispatch.
struct Client
  /// Connection lifecycle value that controls which decoded commands and movement messages are
  /// accepted.
  state
  /// Sequence number of the newest server message acknowledged by the client.
  messageAcknowledge
  /// Reliable server-command sequence acknowledged by the decoded client message.
  reliableAcknowledge
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Outgoing network sequence number of the client gamestate message.
  gamestateMessageNum
  /// Requested asset download path, or an empty string when no download is active.
  downloadName
  /// Extracted from userinfo, high bits masked.
  name
  /// Sequence number of the last processed reliable client command.
  lastClientCommand
  /// Text of the last processed reliable client command.
  lastClientCommandString
  /// Millisecond deadline used by active-client command flood protection. Commands received before
  /// it can still advance reliable sequencing while game-command dispatch is denied.
  nextReliableTime
end struct
/// Callback boundary for reliable commands, movement, gamestate resends, and invalid client messages.
struct Services
  /// Callback `(host, clientState, msg)` that consumes a reliable command and returns true to continue.
  /// A false result stops message processing with `commandRejected`.
  clientCommandFn
  /// Optional callback `(host, clientState, msg, delta)` that consumes movement commands. `delta` is
  /// true for CLC_MOVE and false for CLC_MOVE_NO_DELTA; its return value is ignored.
  userMoveFn
  /// Optional callback `(host, clientState)` requesting a new gamestate after a mismatched server identifier.
  sendGamestateFn
  /// Optional callback `(host, clientState, reason)` invoked for invalid message or reliable acknowledgments.
  dropFn
  /// Optional callback `(host, clientState, opcode)` reporting an unrecognized final client-message opcode.
  diagnosticFn
  /// Caller-owned data available to every service callback as `host.context`.
  context
end struct

/// Create the server identifier pair used for stale-message and restart checks.
/// @param serverId Identifier of the current server/map session.
/// @param restartedServerId Lower boundary of server identifiers associated with the latest restart.
function createServer(serverId,restartedServerId) return Server(serverId,restartedServerId) end function
/// Create empty client message state with zero acknowledgments and no active download or command text.
function createClient() return Client(0,0,0,0,0,"","",0,"",0) end function
/// Create client-message services with all callbacks and their shared context initially unset.
function services() return Services(void,void,void,void,void,void) end function

/// Decode client acknowledgments, consume reliable commands, and dispatch the final movement opcode.
/// Returns `move`, `moveNoDelta`, or `eof` for the corresponding final opcode. Rejected or stale input returns
/// `negativeMessageAck`, `staleReliableAck`, `oldServerId`, `resendGamestate`, `wrongServerId`,
/// `commandRejected`, `zombie`, or `badCommand`; missing input state produces error 6980.
/// Acknowledgments are stored as they are read. A stale reliable acknowledgment is reset to the current
/// server reliable sequence before returning. Recognized movement/gamestate paths report their disposition
/// even when their optional callback is absent; callback return values other than clientCommandFn are ignored.
/// @param serverState Current server identifier and restart boundary used to validate the client session.
/// @param clientState Mutable client acknowledgment, reliable sequence, download, and lifecycle state.
/// @param host Services for command consumption, movement decoding, gamestate resends, and diagnostics.
/// @param msg Mutable network message positioned at the decoded client payload; reading switches to bitstream mode.
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
