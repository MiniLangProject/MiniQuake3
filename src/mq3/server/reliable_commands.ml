// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable server-command ring and snapshot embedding from sv_main.c/sv_snapshot.c.
package mq3.server.reliable_commands
import mq3.qcommon.message as message

/// Capacity of the reliable-command ring retained until acknowledgment.
const MAX_RELIABLE_COMMANDS = 64
/// Server-to-client opcode introducing a reliable textual server command.
const SVC_SERVER_COMMAND = 5

/// ReliableClient record for server.reliable_commands, containing `reliableAcknowledge`, `reliableSequence`, `reliableSent`, `reliableCommands`.
struct ReliableClient
  /// Acknowledgment cursor used to retire queued reliable server commands.
  reliableAcknowledge
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Sequence number of the newest reliable command transmitted to the peer.
  reliableSent
  /// Reliable command entries retained until the peer acknowledges them.
  reliableCommands
end struct

/// Create `mq3.server.reliable_commands.ReliableClient` with reliableAcknowledge=0; reliableSequence=0; reliableSent=0; reliableCommands=array(MAX_RELIABLE_COMMANDS, "").
function create()
  return ReliableClient(0,0,0,array(MAX_RELIABLE_COMMANDS,""))
end function

/// Compute require ring in server.reliable_commands.
///
/// Validation failures include `reliable commands: invalid command ring`.
/// @param client Record exposing `reliableCommands`.
function requireRing(client)
  if client==void or client.reliableCommands==void or len(client.reliableCommands)!=MAX_RELIABLE_COMMANDS then
    return error(6880,"reliable commands: invalid command ring")
  end if
  return void
end function

/// Compute command at in server.reliable_commands; the normal completion returns `client.reliableCommands[(sequence & (MAX_RELIABLE_COMMANDS - 1))]`.
/// @param client Record exposing `reliableCommands`.
/// @param sequence Sequence used in `(sequence & (MAX_RELIABLE_COMMANDS - 1))` and `client.reliableCommands[(sequence & (MAX_RELIABLE_COMMANDS - 1))]`.
function commandAt(client,sequence)
  requireRing(client)
  return client.reliableCommands[sequence & (MAX_RELIABLE_COMMANDS-1)]
end function

// Exact reliable ring insertion rule from SV_AddServerCommand. A false result
// represents the original connection-drop boundary when 65 commands are pending.
/// @param client Record exposing `reliableSequence`, `reliableAcknowledge`, `reliableCommands`. Updated in place: `reliableSequence`.
/// @param text Text operand used by `add`; its reads are shown in the implementation.
function add(client,text)
  requireRing(client)
  client.reliableSequence=client.reliableSequence+1
  if client.reliableSequence-client.reliableAcknowledge==MAX_RELIABLE_COMMANDS+1 then return false end if
  client.reliableCommands[client.reliableSequence & (MAX_RELIABLE_COMMANDS-1)]=text
  return true
end function

// The stale acknowledgement repair used before snapshot construction in
// SV_ExecuteClientMessage. Future acknowledgements are retained by Baseq3.
/// @param client Record exposing `reliableAcknowledge`, `reliableSequence`. Updated in place: `reliableAcknowledge`.
/// @param sequence Sequence operand used by `acknowledge`; its reads are shown in the implementation.
function acknowledge(client,sequence)
  requireRing(client)
  client.reliableAcknowledge=sequence
  if client.reliableAcknowledge<client.reliableSequence-MAX_RELIABLE_COMMANDS then
    client.reliableAcknowledge=client.reliableSequence
    return false
  end if
  return true
end function

/// Compute pending in server.reliable_commands; the normal completion returns `count`.
/// @param client Record exposing `reliableSequence`, `reliableAcknowledge`.
function pending(client)
  requireRing(client)
  count=client.reliableSequence-client.reliableAcknowledge
  if count<0 then return 0 end if
  return count
end function

// Exact SV_UpdateServerCommandsToClient loop. Each unacknowledged command is
// embedded as svc_serverCommand, its absolute sequence, and a C string.
/// @param client Record exposing `reliableAcknowledge`, `reliableSequence`. Updated in place: `reliableSent`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
function updateServerCommandsToClient(client,msg)
  requireRing(client)
  sequence=client.reliableAcknowledge+1
  while sequence<=client.reliableSequence
    message.writeByte(msg,SVC_SERVER_COMMAND)
    message.writeLong(msg,sequence)
    message.writeString(msg,commandAt(client,sequence))
    sequence=sequence+1
  end while
  client.reliableSent=client.reliableSequence
  return void
end function
