// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable server-command ring and snapshot embedding from sv_main.c/sv_snapshot.c.
package mq3.server.reliable_commands
import mq3.qcommon.message as message

const MAX_RELIABLE_COMMANDS = 64
const SVC_SERVER_COMMAND = 5

struct ReliableClient
  reliableAcknowledge
  reliableSequence
  reliableSent
  reliableCommands
end struct

function create()
  return ReliableClient(0,0,0,array(MAX_RELIABLE_COMMANDS,""))
end function

function requireRing(client)
  if client==void or client.reliableCommands==void or len(client.reliableCommands)!=MAX_RELIABLE_COMMANDS then
    return error(6880,"reliable commands: invalid command ring")
  end if
  return void
end function

function commandAt(client,sequence)
  requireRing(client)
  return client.reliableCommands[sequence & (MAX_RELIABLE_COMMANDS-1)]
end function

// Exact reliable ring insertion rule from SV_AddServerCommand. A false result
// represents the original connection-drop boundary when 65 commands are pending.
function add(client,text)
  requireRing(client)
  client.reliableSequence=client.reliableSequence+1
  if client.reliableSequence-client.reliableAcknowledge==MAX_RELIABLE_COMMANDS+1 then return false end if
  client.reliableCommands[client.reliableSequence & (MAX_RELIABLE_COMMANDS-1)]=text
  return true
end function

// The stale acknowledgement repair used before snapshot construction in
// SV_ExecuteClientMessage. Future acknowledgements are retained by Baseq3.
function acknowledge(client,sequence)
  requireRing(client)
  client.reliableAcknowledge=sequence
  if client.reliableAcknowledge<client.reliableSequence-MAX_RELIABLE_COMMANDS then
    client.reliableAcknowledge=client.reliableSequence
    return false
  end if
  return true
end function

function pending(client)
  requireRing(client)
  count=client.reliableSequence-client.reliableAcknowledge
  if count<0 then return 0 end if
  return count
end function

// Exact SV_UpdateServerCommandsToClient loop. Each unacknowledged command is
// embedded as svc_serverCommand, its absolute sequence, and a C string.
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
