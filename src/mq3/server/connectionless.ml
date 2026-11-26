// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_ConnectionlessPacket dispatcher from server/sv_main.c.
package mq3.server.connectionless
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.server.oob_connect as oobConnect
import std.string as strings

/// Host callbacks for connectionless packets; callbacks receive this record and can access its context.
struct Services
  /// Optional callback `(host, sourceAddress, args)` for a tokenized getstatus request.
  statusFn
  /// Optional callback `(host, sourceAddress, args)` for a tokenized getinfo request.
  infoFn
  /// Optional callback `(host, sourceAddress, msg, text, args)` receiving an unverified rcon request.
  /// The callback must perform any password checks and rate limiting before executing its command.
  rconFn
  /// Optional callback `(host, sourceAddress, args)` for ipAuthorize packets; this dispatcher does not\n+  /// validate the authorization source before invoking it.
  authorizeFn
  /// Optional callback `(host, msg, offset)` decompressing a connect packet in place from byte offset 12.
  decompressFn
  /// Optional callback `(host, sourceAddress, text)` for an unrecognized connectionless command.
  diagnosticFn
  /// Caller-owned data accessible inside the callbacks through `host.context`.
  context
end struct
/// Create a connectionless callback bundle with all callbacks and context initially unset.
function services() return Services(void,void,void,void,void,void,void) end function
/// Check whether bytes 4 through 10 of the message storage contain the case-sensitive text `connect`.
/// Returns false for storage shorter than eleven bytes. This prefix check does not validate the OOB marker,
/// require a word boundary, or inspect the message's cursize; `dispatch` separately validates the marker.
/// @param msg Message exposing the backing data bytes used to recognize compressed connect requests.
function connectPrefix(msg)
  if len(msg.data)<11 then return false end if
  expected=bytes("connect")
  for index=0 to 6 if msg.data[index+4]!=expected[index] then return false end if end for
  return true
end function
/// Tokenize a connectionless command line with the engine's command parser.
/// Returns an ordered array of argument strings, including the command name at index zero, or an empty array.
/// @param text Decoded command line to parse with Quake command quoting rules.
function tokens(text)
  parser=commandBuffer.create();commandBuffer.tokenizeString(parser,text);result=[]
  if commandBuffer.argc(parser)>0 then for index=0 to commandBuffer.argc(parser)-1 result=result+[commandBuffer.argv(parser,index)] end for end if
  return result
end function
/// Read and route one connectionless packet after validating its -1 OOB marker.
/// Recognizes getstatus, getinfo, getchallenge, connect, ipAuthorize, rcon, and disconnect. Returns the
/// recognized command name, or `unknown` for empty/unrecognized input; recognition does not imply that
/// an optional callback was installed or that authentication succeeded. Command matching is case-insensitive.
/// Connect packets with a matching lowercase raw prefix invoke the optional decompressor before tokenization.
/// The rcon callback receives unverified text and arguments and owns authentication and command execution.
/// @param runtime Out-of-band connection runtime used by getchallenge and direct-connect handling.
/// @param host Connectionless Services whose callbacks receive this same record as their first argument.
/// @param sourceAddress Sender's network address, forwarded to connection handling and host callbacks.
/// @param msg Mutable message containing the OOB marker and command bytes; its read cursor is advanced.
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
