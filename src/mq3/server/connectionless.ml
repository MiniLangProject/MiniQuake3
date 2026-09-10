// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_ConnectionlessPacket dispatcher from server/sv_main.c.
package mq3.server.connectionless
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.server.oob_connect as oobConnect
import std.string as strings

struct Services statusFn infoFn rconFn authorizeFn decompressFn diagnosticFn context end struct
function services() return Services(void,void,void,void,void,void,void) end function
function connectPrefix(msg)
  if len(msg.data)<11 then return false end if
  expected=bytes("connect")
  for index=0 to 6 if msg.data[index+4]!=expected[index] then return false end if end for
  return true
end function
function tokens(text)
  parser=commandBuffer.create();commandBuffer.tokenizeString(parser,text);result=[]
  if commandBuffer.argc(parser)>0 then for index=0 to commandBuffer.argc(parser)-1 result=result+[commandBuffer.argv(parser,index)] end for end if
  return result
end function
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
