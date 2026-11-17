// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Incoming client OOB response dispatcher from client/cl_main.c.
package mq3.client.connectionless
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.qcommon.netchan as netchan
import mq3.compat.textnumbers as textnumbers
import mq3.shared.info as info

const CA_UNINITIALIZED=0
const CA_DISCONNECTED=1
const CA_AUTHORIZING=2
const CA_CONNECTING=3
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_LOADING=6
const CA_PRIMED=7
const CA_ACTIVE=8
const CA_CINEMATIC=9
const MAX_STRING_TOKENS=1024
const RETRANSMIT_TIMEOUT=3000
const PROTOCOL_VERSION=68

struct State
  connectionState realtime serverAddress channel challenge connectPacketCount
  connectTime lastPacketSentTime lastPacketTime serverMessage qport demoplaying
end struct
struct Services
  infoFn statusFn disconnectFn printFn outOfBandFn motdFn serversFn diagnosticFn context
  lanFn authorizationFn userinfoFn outOfBandDataFn clearUserinfoModifiedFn
end struct

function create(address)
  return State(CA_DISCONNECTED,0,address,void,0,0,0,0,0,"",0,false)
end function
function services() return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function

function lowerAscii(text)
  result="";raw=bytes(text)
  if len(raw)>0 then for each value in raw if value>=65 and value<=90 then value=value+32 end if;result=result+decode(bytes([value])) end for end if
  return result
end function
function startsWith(text,prefix)
  a=bytes(text);b=bytes(prefix);if len(a)<len(b) then return false end if
  if len(b)>0 then for i=0 to len(b)-1 if a[i]!=b[i] then return false end if end for end if
  return true
end function

function addressEqual(a,b,includePort)
  if a==void or b==void or a.type!=b.type or len(a.ip)!=len(b.ip) then return false end if
  if len(a.ip)>0 then for i=0 to len(a.ip)-1 if a.ip[i]!=b.ip[i] then return false end if end for end if
  if includePort and a.port!=b.port then return false end if
  return true
end function

function disconnectPacket(state,host,source)
  if state.connectionState<CA_AUTHORIZING or state.channel==void then return false end if
  if not addressEqual(source,state.channel.remoteAddress,true) then return false end if
  if state.realtime-state.lastPacketTime<3000 then return false end if
  text="Server disconnected for unknown reason\n"
  if host.printFn!=void then host.printFn(host,state,text) end if
  if host.disconnectFn!=void then host.disconnectFn(host,state,true,text) end if
  return true
end function

function checkForResend(state,host)
  if state==void or host==void then return error(6942,"client resend: missing state") end if
  if state.demoplaying then return false end if
  if state.connectionState!=CA_CONNECTING and state.connectionState!=CA_CHALLENGING then return false end if
  if state.realtime-state.connectTime<RETRANSMIT_TIMEOUT then return false end if
  state.connectTime=state.realtime;state.connectPacketCount=state.connectPacketCount+1
  if state.connectionState==CA_CONNECTING then
    lan=false;if host.lanFn!=void then lan=host.lanFn(host,state,state.serverAddress) end if
    if not lan and host.authorizationFn!=void then host.authorizationFn(host,state) end if
    if host.outOfBandFn!=void then host.outOfBandFn(host,state,state.serverAddress,"getchallenge") end if
    return true
  end if
  userinfo="";if host.userinfoFn!=void then userinfo=host.userinfoFn(host,state) end if
  userinfo=info.setValue(userinfo,"protocol",str(PROTOCOL_VERSION),void,void)
  userinfo=info.setValue(userinfo,"qport",str(state.qport),void,void)
  userinfo=info.setValue(userinfo,"challenge",str(state.challenge),void,void)
  data=bytes("connect \"")+bytes(userinfo)+bytes("\"")
  if host.outOfBandDataFn!=void then host.outOfBandDataFn(host,state,state.serverAddress,data) end if
  if host.clearUserinfoModifiedFn!=void then host.clearUserinfoModifiedFn(host,state) end if
  return true
end function

function dispatch(state,host,source,msg)
  if state==void or host==void or source==void or msg==void then return error(6940,"client connectionless: missing state") end if
  message.beginReadingOob(msg);message.readI32(msg);line=message.readCStringLine(msg)
  cmd=commandBuffer.create();commandBuffer.tokenizeString(cmd,line);name=commandBuffer.argv(cmd,0);lower=lowerAscii(name)
  if lower=="challengeresponse" then
    if state.connectionState==CA_CONNECTING then
      state.challenge=textnumbers.atoi(commandBuffer.argv(cmd,1));state.connectionState=CA_CHALLENGING
      state.connectPacketCount=0;state.connectTime=-99999;state.serverAddress=source
      return "challengeResponse"
    end if
    return "ignored"
  end if
  if lower=="connectresponse" then
    if state.connectionState>=CA_CONNECTED or state.connectionState!=CA_CHALLENGING or not addressEqual(source,state.serverAddress,false) then return "ignored" end if
    state.channel=netchan.setup(netchan.NS_CLIENT,source,state.qport);state.connectionState=CA_CONNECTED;state.lastPacketSentTime=-9999
    return "connectResponse"
  else if lower=="inforesponse" then
    if host.infoFn!=void then host.infoFn(host,state,source,msg) end if;return "infoResponse"
  else if lower=="statusresponse" then
    if host.statusFn!=void then host.statusFn(host,state,source,msg) end if;return "statusResponse"
  else if lower=="disconnect" then
    disconnectPacket(state,host,source);return "disconnect"
  else if lower=="echo" then
    if host.outOfBandFn!=void then host.outOfBandFn(host,state,source,commandBuffer.argv(cmd,1)) end if;return "echo"
  else if lower=="keyauthorize" then return "keyAuthorize"
  else if lower=="motd" then
    if host.motdFn!=void then host.motdFn(host,state,source,commandBuffer.argv(cmd,1)) end if;return "motd"
  else if lower=="print" then
    state.serverMessage=message.readCString(msg)
    if host.printFn!=void then host.printFn(host,state,state.serverMessage) end if;return "print"
  else if startsWith(lower,"getserversresponse") then
    if host.serversFn!=void then host.serversFn(host,state,source,msg) end if;return "getserversResponse"
  end if
  if host.diagnosticFn!=void then host.diagnosticFn(host,state,line) end if
  return "unknown"
end function
