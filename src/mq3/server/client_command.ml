// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable client command sequencing and flood policy from SV_ClientCommand.
package mq3.server.client_command
import mq3.qcommon.message as message

/// Client-state value identifying a client whose commands may be dispatched as active gameplay
/// commands.
const CS_ACTIVE=4

/// Per-client reliable-command sequence, most recent command text, and flood-control deadline.
struct Client
  /// Connection lifecycle value that gates dispatch of commands that require an active game client.
  state
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
/// Server clock, flood policy, and host callbacks used when consuming reliable client commands.
struct Runtime
  /// Server time used to enforce reliable-command flood protection, in milliseconds.
  time
  /// Enables the game-command flood interval for active clients when no local client is running.
  floodProtect
  /// True when a local client is running; this bypasses the active-client flood interval.
  clientRunning
  /// Optional callback `(host, clientState, text, clientOk)` invoked for each next-in-sequence command.
  /// `clientOk` is false when flood policy denies game-command dispatch; the return value is ignored.
  executeFn
  /// Optional callback `(host, clientState, reason)` used to disconnect a client after a sequence gap.
  dropFn
  /// Optional callback `(host, clientState, sequence, text)` called for nonduplicate commands before gap validation.
  diagnosticFn
  /// Caller-owned data accessible through the first callback argument as `host.context`.
  context
end struct

/// Create an initially inactive client with no consumed reliable commands and no flood deadline.
function createClient()
  return Client(0,"",0,"",0)
end function

/// Create reliable-command processing services with flood protection enabled and callbacks unset.
/// The server clock starts at zero and no local client is assumed to be running.
function runtime()
  return Runtime(0,true,false,void,void,void,void)
end function

/// Consume one reliable client command and return whether its sequence stream can continue.
/// Duplicate or older sequences return true without callbacks or state updates. A forward sequence gap
/// invokes the optional drop callback and returns false. For the next sequence, the execute callback
/// receives a `clientOk` flag indicating whether game-command flood policy permits dispatch.
/// Even when that flag is false, the sequence and text are retained and the deadline becomes `host.time + 1000`.
/// Returns true after consuming the next command, or error 6981 for missing input state.
/// @param host Runtime with a millisecond clock, flood policy, and optional execute/drop/diagnostic callbacks.
/// @param clientState Mutable client sequence, last command text, lifecycle state, and flood deadline.
/// @param msg Mutable network message positioned at an int32 sequence followed by a zero-terminated command string.
function execute(host,clientState,msg)
  if host==void or clientState==void or msg==void then return error(6981,"client command: missing state") end if
  sequence=message.readI32(msg)
  command=message.readCString(msg)

  // Already executed commands are harmless retransmissions.  Baseq3 returns
  // before diagnostics, flood timing, execution and state updates.
  if clientState.lastClientCommand>=sequence then return true end if

  if host.diagnosticFn!=void then host.diagnosticFn(host,clientState,sequence,command) end if

  // A gap means the reliable command stream can no longer be reconstructed.
  if sequence>clientState.lastClientCommand+1 then
    if host.dropFn!=void then host.dropFn(host,clientState,"Lost reliable commands") end if
    return false
  end if

  clientOk=true
  if not host.clientRunning and clientState.state>=CS_ACTIVE and host.floodProtect and host.time<clientState.nextReliableTime then
    clientOk=false
  end if

  clientState.nextReliableTime=host.time+1000
  if host.executeFn!=void then host.executeFn(host,clientState,command,clientOk) end if
  clientState.lastClientCommand=sequence
  clientState.lastClientCommandString=command
  return true
end function
