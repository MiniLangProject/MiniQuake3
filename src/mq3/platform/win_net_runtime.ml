// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Windows networking lifecycle and address policy from code/win32/win_net.c.
package mq3.platform.win_net_runtime

import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as netchan

const NA_BOT=0
const NA_BAD=1
const NA_LOOPBACK=2
const NA_BROADCAST=3
const NA_IP=4
const NA_IPX=5
const NA_BROADCAST_IPX=6
const PORT_ANY=-1
const PORT_SERVER=27960
const MAX_IPS=16

struct SockAddr family address port ipx end struct
struct Cvars noudp noipx socksEnabled socksServer socksPort socksUsername socksPassword netInterface port generation end struct
struct Runtime initialized networkingEnabled socket socksSocket socksRelay ipxSocket usingSocks localIPs cvars recvfromCount logs end struct
struct Packet received source data readcount end struct

function cvars() return Cvars(false,true,false,"",1080,"","","localhost",PORT_SERVER,0) end function
function copyCvars(value) return Cvars(value.noudp,value.noipx,value.socksEnabled,value.socksServer,value.socksPort,value.socksUsername,value.socksPassword,value.netInterface,value.port,value.generation) end function
function create() return Runtime(false,false,void,void,void,void,false,[],cvars(),0,[]) end function
function log(state,text) state.logs=state.logs+[text];return void end function

function NET_ErrorString(code)
  // The native table follows the original WinSock names. Preserve the one
  // observable Baseq3 typo for WSAECONNABORTED (10053).
  if code==10053 then return "WSWSAECONNABORTEDAEINTR" end if
  return udp.errorName(code)
end function

function NetadrToSockadr(address)
  if address==void then return SockAddr(0,0,0,[]) end if
  if address.type==NA_BROADCAST then return SockAddr(2,udp.ipv4(255,255,255,255),address.port,[]) end if
  if address.type==NA_IP and len(address.ip)>=4 then return SockAddr(2,udp.ipv4(address.ip[0],address.ip[1],address.ip[2],address.ip[3]),address.port,[]) end if
  if address.type==NA_IPX or address.type==NA_BROADCAST_IPX then return SockAddr(6,0,address.port,address.ip) end if
  return SockAddr(0,0,0,[])
end function

function SockadrToNetadr(address)
  if address==void then return netchan.Address(NA_BAD,[],0) end if
  if address.family==2 then return netchan.Address(NA_IP,udp.octets(address.address),address.port) end if
  if address.family==6 then return netchan.Address(NA_IPX,address.ipx,address.port) end if
  return netchan.Address(NA_BAD,[],0)
end function

function hexNibble(value)
  if value>=48 and value<=57 then return value-48 end if;if value>=65 and value<=70 then return value-55 end if;if value>=97 and value<=102 then return value-87 end if;return -1
end function
function parseIpx(text)
  raw=bytes(text);if len(raw)!=21 or raw[8]!=46 then return void end if;values=[]
  positions=[0,2,4,6,9,11,13,15,17,19]
  for each position in positions
    high=hexNibble(raw[position]);low=hexNibble(raw[position+1]);if high<0 or low<0 then return void end if;values=values+[(high<<4)|low]
  end for
  return SockAddr(6,0,0,values)
end function

function Sys_StringToSockaddr(text)
  if text==void or text=="" then return void end if
  ipx=parseIpx(text);if ipx!=void then return ipx end if
  value=try(udp.resolveIPv4(text));if value is error then return void end if;return SockAddr(2,value,0,[])
end function
function Sys_StringToAdr(text)
  value=Sys_StringToSockaddr(text);if value==void then return void end if;return SockadrToNetadr(value)
end function

function Sys_GetPacket(state,capacity)
  if state==void or capacity<1 then return error(6975,"Sys_GetPacket: invalid arguments") end if
  if state.socket==void then return Packet(false,void,bytes(0,0),0) end if
  state.recvfromCount=state.recvfromCount+1;value=udp.receiveFrom(state.socket,capacity)
  if not value.received then return Packet(false,void,bytes(0,0),0) end if
  if state.usingSocks and state.socksRelay!=void and value.endpoint.address==state.socksRelay.address and value.endpoint.port==state.socksRelay.port then
    if len(value.data)<10 or value.data[0]!=0 or value.data[1]!=0 or value.data[2]!=0 or value.data[3]!=1 then return Packet(false,void,bytes(0,0),0) end if
    source=netchan.Address(NA_IP,[value.data[4],value.data[5],value.data[6],value.data[7]],(value.data[8]<<8)|value.data[9])
    return Packet(true,source,value.data,10)
  end if
  source=netchan.Address(NA_IP,udp.octets(value.endpoint.address),value.endpoint.port)
  if len(value.data)==capacity then log(state,"Oversize packet from "+transport.addressToString(source));return Packet(false,source,bytes(0,0),0) end if
  return Packet(true,source,value.data,0)
end function

function Sys_SendPacket(state,length,data,target)
  if state==void or data==void or length<0 or length>len(data) or target==void then return error(6975,"Sys_SendPacket: invalid arguments") end if
  if target.type!=NA_IP and target.type!=NA_BROADCAST and target.type!=NA_IPX and target.type!=NA_BROADCAST_IPX then return error(6975,"Sys_SendPacket: bad address type") end if
  if (target.type==NA_IPX or target.type==NA_BROADCAST_IPX) and state.ipxSocket==void then return 0 end if
  if state.socket==void then return 0 end if
  if state.usingSocks and target.type==NA_IP then
    header=bytes([0,0,0,1,target.ip[0],target.ip[1],target.ip[2],target.ip[3],(target.port>>8)&255,target.port&255]);packet=header+slice(data,0,length)
    return udp.sendTo(state.socket,state.socksRelay,packet)-10
  end if
  return udp.sendTo(state.socket,transport.addressToEndpoint(target),slice(data,0,length))
end function

function sameOctets(left,right,count)
  if len(left)<count or len(right)<count then return false end if;for index=0 to count-1 if left[index]!=right[index] then return false end if end for;return true
end function
function Sys_IsLANAddress(state,address)
  if address==void then return false end if;if address.type==NA_LOOPBACK or address.type==NA_IPX then return true end if;if address.type!=NA_IP or len(address.ip)<4 then return false end if
  if address.ip==[127,0,0,1] then return true end if
  for each local in state.localIPs
    bytesLocal=udp.octets(local)
    if (address.ip[0]&128)==0 and address.ip[0]==bytesLocal[0] then return true end if
    if (address.ip[0]&192)==128 then
      if sameOctets(address.ip,bytesLocal,2) then return true end if
      if address.ip[0]==172 and bytesLocal[0]==172 and (address.ip[1]&240)==16 and (bytesLocal[1]&240)==16 then return true end if
    else if (address.ip[0]&192)==192 then
      if sameOctets(address.ip,bytesLocal,3) then return true end if
      if address.ip[0]==192 and bytesLocal[0]==192 and address.ip[1]==168 and bytesLocal[1]==168 then return true end if
    end if
  end for
  return false
end function
function Sys_ShowIP(state)
  output=[];for each value in state.localIPs parts=udp.octets(value);text="IP: "+str(parts[0])+"."+str(parts[1])+"."+str(parts[2])+"."+str(parts[3]);output=output+[text];log(state,text) end for;return output
end function

function NET_IPSocket(netInterface,port)
  socket=udp.open();udp.setBroadcast(socket,true);address=0
  if netInterface!=void and netInterface!="" and netInterface!="localhost" then address=udp.resolveIPv4(netInterface) end if
  selected=port;if selected==PORT_ANY then selected=0 end if;udp.bind(socket,udp.Endpoint(address,selected));return socket
end function
function NET_OpenSocks(state,port)
  state.usingSocks=false;if not state.cvars.socksEnabled then return false end if
  if state.socket==void then return false end if
  local=udp.localEndpoint(state.socket);opened=try(udp.openSocks5(state.cvars.socksServer,state.cvars.socksPort,state.cvars.socksUsername,state.cvars.socksPassword,local.port))
  if opened is error then log(state,"WARNING: NET_OpenSocks: "+str(opened));return false end if
  state.socksSocket=opened.control;state.socksRelay=opened.relay;state.usingSocks=true;return true
end function
function NET_GetLocalAddress(state)
  values=udp.localIPv4();if len(values)>MAX_IPS then values=slice(values,0,MAX_IPS) end if;state.localIPs=values;Sys_ShowIP(state);return values
end function
function NET_OpenIP(state)
  basePort=state.cvars.port
  for offset=0 to 9
    candidate=try(NET_IPSocket(state.cvars.netInterface,basePort+offset))
    if not (candidate is error) then state.socket=candidate;if state.cvars.socksEnabled then NET_OpenSocks(state,basePort+offset) end if;NET_GetLocalAddress(state);return basePort+offset end if
  end for
  log(state,"WARNING: Couldn't allocate IP port");return -1
end function
function NET_IPXSocket(port) return void end function
function NET_OpenIPX(state) state.ipxSocket=NET_IPXSocket(state.cvars.port);return false end function

function sameCvars(left,right)
  return left.noudp==right.noudp and left.noipx==right.noipx and left.socksEnabled==right.socksEnabled and left.socksServer==right.socksServer and left.socksPort==right.socksPort and left.socksUsername==right.socksUsername and left.socksPassword==right.socksPassword and left.netInterface==right.netInterface and left.port==right.port and left.generation==right.generation
end function
function NET_GetCvars(state,values)
  modified=not sameCvars(state.cvars,values);state.cvars=copyCvars(values);return modified
end function
function closeSocket(value) if value!=void then udp.close(value) end if;return void end function
function NET_Config(state,enableNetworking,values)
  modified=NET_GetCvars(state,values);if values.noudp and values.noipx then enableNetworking=false end if
  if enableNetworking==state.networkingEnabled and not modified then return false end if
  stop=(not enableNetworking and state.networkingEnabled) or (enableNetworking and state.networkingEnabled and modified)
  start=(enableNetworking and not state.networkingEnabled) or (enableNetworking and state.networkingEnabled and modified)
  if stop then closeSocket(state.socket);closeSocket(state.socksSocket);state.socket=void;state.socksSocket=void;state.socksRelay=void;state.ipxSocket=void;state.usingSocks=false end if
  state.networkingEnabled=enableNetworking
  if start then if not values.noudp then NET_OpenIP(state) end if;if not values.noipx then NET_OpenIPX(state) end if end if
  return true
end function
function NET_Init(state,values)
  if state.initialized then return false end if;udp.startup();state.initialized=true;log(state,"Winsock Initialized");NET_Config(state,true,values);return true
end function
function NET_Shutdown(state)
  if not state.initialized then return false end if;NET_Config(state,false,state.cvars);udp.cleanup();state.initialized=false;return true
end function
function NET_Sleep(state,milliseconds) if state.socket==void then return false end if;return udp.waitReadable(state.socket,milliseconds) end function
function NET_Restart(state) values=copyCvars(state.cvars);values.generation=values.generation+1;return NET_Config(state,state.networkingEnabled,values) end function
