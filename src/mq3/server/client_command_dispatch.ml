// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_ExecuteClientCommand routing from server/sv_client.c.
package mq3.server.client_command_dispatch
import mq3.qcommon.command_buffer as commandBuffer
import mq3.server.client_lifecycle as lifecycle

/// Server lifecycle state for an active game map.
const SS_GAME=2

/// Services record for server.client_command_dispatch, containing `builtinFn`, `downloadFn`, `gameFn`, `ignoredFn`, `context`, `downloadContext`, and 1 further fields.
struct Services
  /// Host callback that handles a built-in server-side client command.
  builtinFn
  /// Host callback that handles a client file-download command.
  downloadFn
  /// Host callback that dispatches a lifecycle request to the game VM.
  gameFn
  /// Host callback that observes a client command intentionally ignored by the dispatcher.
  ignoredFn
  /// Caller-supplied data associated with dispatch of built-in, download, and game client commands.
  context
  /// Bound context for handling client download commands.
  downloadContext
  /// Server/client lifecycle state used by disconnect and entry commands.
  lifecycleRuntime
end struct
/// Create `mq3.server.client_command_dispatch.Services` with builtinFn=void; downloadFn=void; gameFn=void; ignoredFn=void; context=void; downloadContext=void; lifecycleRuntime=void.
function services() return Services(void,void,void,void,void,void,void) end function

/// List the 8 names in server.client_command_dispatch.builtinNames, beginning with `userinfo`, `disconnect`, `cp`, `vdr`.
function builtinNames() return ["userinfo","disconnect","cp","vdr","download","nextdl","stopdl","donedl"] end function

/// Compute builtin index in server.client_command_dispatch; the normal completion returns `- 1`.
/// @param name Name used in `(names[index] == name)`.
function builtinIndex(name)
  names=builtinNames()
  for index=0 to len(names)-1 if names[index]==name then return index end if end for
  return -1
end function

/// Execute client command dispatch in server.client_command_dispatch; the normal completion returns `"ignored"`.
///
/// Validation failures include `client command dispatch: missing input`; `client command dispatch: missing builtin service`; `client command dispatch: missing game service`.
/// @param host Record exposing `downloadFn`, `builtinFn`, `lifecycleRuntime`, `gameFn`, `ignoredFn`.
/// @param clientState Client passed as `client` to `mq3.server.client_lifecycle.dispatchBuiltin`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`.
/// @param clientOk Client ok operand used by `execute`; its reads are shown in the implementation.
/// @param serverState Server state used in `(serverState == SS_GAME)`.
function execute(host,clientState,text,clientOk,serverState)
  if host==void or clientState==void or text==void then return error(6985,"client command dispatch: missing input") end if
  parser=commandBuffer.create();commandBuffer.tokenizeString(parser,text);name=commandBuffer.argv(parser,0)
  index=builtinIndex(name)
  if index>=0 then
    if index>=4 and host.downloadFn!=void then
      host.downloadFn(host,clientState,name,parser);return "builtin"
    end if
    if host.builtinFn!=void then host.builtinFn(host,clientState,name,parser);return "builtin" end if
    if host.lifecycleRuntime!=void then lifecycle.dispatchBuiltin(host.lifecycleRuntime,clientState,name,parser);return "builtin" end if
    return error(6986,"client command dispatch: missing builtin service")
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
