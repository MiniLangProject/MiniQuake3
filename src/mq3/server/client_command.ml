// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable client command sequencing and flood policy from SV_ClientCommand.
package mq3.server.client_command
import mq3.qcommon.message as message

const CS_ACTIVE=4

struct Client state name lastClientCommand lastClientCommandString nextReliableTime end struct
struct Runtime time floodProtect clientRunning executeFn dropFn diagnosticFn context end struct

function createClient()
  return Client(0,"",0,"",0)
end function

function runtime()
  return Runtime(0,true,false,void,void,void,void)
end function

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
