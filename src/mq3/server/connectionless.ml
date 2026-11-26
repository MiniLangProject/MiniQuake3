// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_ConnectionlessPacket dispatcher from server/sv_main.c.
package mq3.server.connectionless
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.server.oob_connect as oobConnect
import std.string as strings

/// Services record for server.connectionless, containing `statusFn`, `infoFn`, `rconFn`, `authorizeFn`, `decompressFn`, `diagnosticFn`, and 1 further fields.
struct Services
  /// Host callback that handles a connectionless server-status request.
  statusFn
  /// Host callback that handles a connectionless server-information request.
  infoFn
  /// Host callback that handles an authenticated remote-console request.
  rconFn
  /// Host callback that performs the host-side client authorization exchange.
  authorizeFn
  /// Host callback that decompresses a received packet payload.
  decompressFn
  /// Host callback that reports subsystem diagnostics to the host.
  diagnosticFn
  /// Caller-supplied data associated with connectionless status, information, remote-console, and
  /// authorization handling.
  context
end struct
/// Create `mq3.server.connectionless.Services` with statusFn=void; infoFn=void; rconFn=void; authorizeFn=void; decompressFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void,void) end function
/// Test connect prefix in server.connectionless; the normal completion returns `true`.
/// @param msg Record exposing `data`.
function connectPrefix(msg)
  if len(msg.data)<11 then return false end if
  expected=bytes("connect")
  for index=0 to 6 if msg.data[index+4]!=expected[index] then return false end if end for
  return true
end function
/// Compute tokens in server.connectionless; the normal completion returns `result`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`.
function tokens(text)
  parser=commandBuffer.create();commandBuffer.tokenizeString(parser,text);result=[]
  if commandBuffer.argc(parser)>0 then for index=0 to commandBuffer.argc(parser)-1 result=result+[commandBuffer.argv(parser,index)] end for end if
  return result
end function
/// Dispatch connectionless in server.connectionless; the normal completion returns `"unknown"`.
///
/// Validation failures include `connectionless: missing state`; `connectionless: missing OOB marker`.
/// @param runtime Runtime passed as `runtime` to `mq3.server.oob_connect.getChallenge`.
/// @param host Record exposing `decompressFn`, `statusFn`, `infoFn`, `authorizeFn`, `rconFn`, `diagnosticFn`.
/// @param sourceAddress Source address passed as `sourceAddress` to `mq3.server.oob_connect.getChallenge`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.beginReadingOob`.
function dispatch(runtime,host,sourceAddress,msg)
  if runtime==void or host==void or sourceAddress==void or msg==void then return error(6930,"connectionless: missing state") end if
  message.beginReadingOob(msg);marker=message.readI32(msg)
  if marker!=-1 then return error(6931,"connectionless: missing OOB marker") end if
  if connectPrefix(msg) and host.decompressFn!=void then host.decompressFn(host,msg,12) end if
  text=message.readCStringLine(msg)
  args=tokens(text);if len(args)==0 then return "unknown" end if;command=strings.toLowerAscii(args[0])
  if command=="getstatus" then if host.statusFn!=void then host.statusFn(host,sourceAddress,args) end if;return "getstatus" end if
  if command=="getinfo" then if host.infoFn!=void then host.infoFn(host,sourceAddress,args) end if;return "getinfo" end if
  if command=="getchallenge" then oobConnect.getChallenge(runtime,sourceAddress);return "getchallenge" end if
  if command=="connect" then userinfo="";if len(args)>1 then userinfo=args[1] end if;oobConnect.directConnect(runtime,sourceAddress,userinfo);return "connect" end if
  if command=="ipauthorize" then if host.authorizeFn!=void then host.authorizeFn(host,sourceAddress,args) end if;return "ipAuthorize" end if
  if command=="rcon" then if host.rconFn!=void then host.rconFn(host,sourceAddress,msg,text,args) end if;return "rcon" end if
  if command=="disconnect" then return "disconnect" end if
  if host.diagnosticFn!=void then host.diagnosticFn(host,sourceAddress,text) end if
  return "unknown"
end function
