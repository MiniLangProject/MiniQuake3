// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_ExecuteClientCommand routing from server/sv_client.c.
package mq3.server.client_command_dispatch
import mq3.qcommon.command_buffer as commandBuffer

const SS_GAME=2

struct Services builtinFn gameFn ignoredFn context end struct
function services() return Services(void,void,void,void) end function

function builtinNames() return ["userinfo","disconnect","cp","vdr","download","nextdl","stopdl","donedl"] end function

function builtinIndex(name)
  names=builtinNames()
  for index=0 to len(names)-1 if names[index]==name then return index end if end for
  return -1
end function

function execute(host,clientState,text,clientOk,serverState)
  if host==void or clientState==void or text==void then return error(6985,"client command dispatch: missing input") end if
  parser=commandBuffer.create();commandBuffer.tokenizeString(parser,text);name=commandBuffer.argv(parser,0)
  index=builtinIndex(name)
  if index>=0 then
    if host.builtinFn==void then return error(6986,"client command dispatch: missing builtin service") end if
    host.builtinFn(host,clientState,name,parser);return "builtin"
  end if
  if clientOk then
    if serverState==SS_GAME then
      if host.gameFn==void then return error(6987,"client command dispatch: missing game service") end if
      host.gameFn(host,clientState,parser);return "game"
    end if
    return "unknown"
  end if
  if host.ignoredFn!=void then host.ignoredFn(host,clientState,name) end if
  return "ignored"
end function
