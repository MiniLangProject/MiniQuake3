// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable client command sequencing and flood policy from SV_ClientCommand.
package mq3.server.client_command
import mq3.qcommon.message as message

const CS_ACTIVE=4

/// Client record for server.client_command, containing `state`, `name`, `lastClientCommand`, `lastClientCommandString`, `nextReliableTime`.
struct Client state name lastClientCommand lastClientCommandString nextReliableTime end struct
/// Runtime record for server.client_command, containing `time`, `floodProtect`, `clientRunning`, `executeFn`, `dropFn`, `diagnosticFn`, and 1 further fields.
struct Runtime time floodProtect clientRunning executeFn dropFn diagnosticFn context end struct

/// Create `mq3.server.client_command.Client` with state=0; name=""; lastClientCommand=0; lastClientCommandString=""; nextReliableTime=0.
function createClient()
  return Client(0,"",0,"",0)
end function

/// Create `mq3.server.client_command.Runtime` with time=0; floodProtect=true; clientRunning=false; executeFn=void; dropFn=void; diagnosticFn=void; context=void.
function runtime()
  return Runtime(0,true,false,void,void,void,void)
end function

/// Consume one reliable client command, discard retransmissions, reject sequence gaps, and apply the flood interval before dispatch.
///
/// Validation failures include `client command: missing state`.
/// Direct state writes: `clientState.nextReliableTime`, `clientState.lastClientCommand`, `clientState.lastClientCommandString`.
/// @param host Server command callbacks, flood policy, and current millisecond clock.
/// @param clientState Mutable client sequencing record; accepted commands update its sequence, text, and next reliable-command time.
/// @param msg Network message read at the current cursor: an int32 sequence followed by a C string.
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
