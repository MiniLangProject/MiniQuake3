// SPDX-License-Identifier: GPL-2.0-or-later
// Windows-x64 raw UDP boundary. Quake packet policy belongs to qcommon/client/server.
package mq3.platform.udp
import mq3.compat.numeric as n

extern function mq3_udp_startup() from "miniquake3_udp.dll" returns i32
extern function mq3_udp_cleanup() from "miniquake3_udp.dll" returns i32
extern function mq3_udp_last_error() from "miniquake3_udp.dll" returns i32
extern function mq3_udp_error_name(code as i32,output as bytes,capacity as i32) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_socket() from "miniquake3_udp.dll" returns ptr
extern function mq3_udp_set_broadcast(socket as ptr,enabled as i32) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_resolve_ipv4(name as wstr,address as bytes) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_bind(socket as ptr,address as u32,port as u32) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_local_address(socket as ptr) from "miniquake3_udp.dll" returns u32
extern function mq3_udp_local_port(socket as ptr) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_send(socket as ptr,address as u32,port as u32,data as ptr,length as i32) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_recv(socket as ptr,data as ptr,capacity as i32,metadata as bytes) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_close(socket as ptr) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_socks5_open(server as wstr,port as u32,username as wstr,password as wstr,udpPort as u32,relay as bytes) from "miniquake3_udp.dll" returns ptr
extern function mq3_udp_wait_readable(socket as ptr,milliseconds as i32) from "miniquake3_udp.dll" returns i32
extern function mq3_udp_local_ipv4_count(addresses as bytes,capacity as i32) from "miniquake3_udp.dll" returns i32

struct Endpoint address port end struct
struct Datagram received endpoint data end struct
struct Socks5 control relay end struct

function ipv4(a,b,c,d)
  if a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255 then return error(6960,"udp: invalid IPv4 octet") end if
  return (a<<24)|(b<<16)|(c<<8)|d
end function
function octets(address) return [(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255] end function
function startup()
  code=mq3_udp_startup();if code!=0 then return error(6961,"udp: WSAStartup failed "+str(code)) end if;return void
end function
function cleanup()
  code=mq3_udp_cleanup();if code!=0 then return error(6962,"udp: WSACleanup failed "+str(code)) end if;return void
end function
function lastError() return mq3_udp_last_error() end function
function errorName(code)
  output=bytes(64,0);result=mq3_udp_error_name(code,output,len(output));if result!=0 then return "NO ERROR" end if
  endAt=0;while endAt<len(output) and output[endAt]!=0 endAt=endAt+1 end while;return decode(slice(output,0,endAt))
end function
function open()
  socket=mq3_udp_socket();if socket==-1 then return error(6963,"udp: socket failed") end if;return socket
end function
function setBroadcast(socket,enabled)
  if socket==void then return error(6969,"udp: invalid broadcast socket") end if
  value=0;if enabled then value=1 end if;code=mq3_udp_set_broadcast(socket,value)
  if code!=0 then return error(6969,"udp: SO_BROADCAST failed "+str(code)) end if;return void
end function
function resolveIPv4(name)
  if name==void or name=="" then return error(6969,"udp: invalid DNS name") end if
  address=bytes(4,0);code=mq3_udp_resolve_ipv4(name,address)
  if code!=0 then return error(6969,"udp: IPv4 resolution failed "+str(code)) end if
  return n.readU32(address,0)
end function
function bind(socket,endpoint)
  if socket==void or endpoint==void or endpoint.port<0 or endpoint.port>65535 then return error(6964,"udp: invalid bind") end if
  code=mq3_udp_bind(socket,endpoint.address,endpoint.port);if code!=0 then return error(6964,"udp: bind failed "+str(code)) end if;return localEndpoint(socket)
end function
function localEndpoint(socket)
  port=mq3_udp_local_port(socket);if port<0 then return error(6965,"udp: getsockname failed "+str(0-port)) end if
  return Endpoint(mq3_udp_local_address(socket),port)
end function
function sendTo(socket,endpoint,data)
  if socket==void or endpoint==void or data==void or endpoint.port<0 or endpoint.port>65535 then return error(6966,"udp: invalid send") end if
  result=mq3_udp_send(socket,endpoint.address,endpoint.port,nativeBytesPtr(data),len(data))
  if result<0 then return error(6966,"udp: sendto failed "+str(0-result)) end if
  if result!=len(data) then return error(6966,"udp: partial datagram") end if
  return result
end function
function receiveFromBuffered(socket,data,metadata,capacity)
  if socket==void or data==void or metadata==void or capacity<1 or capacity>65535 or len(data)<capacity or len(metadata)<8 then return error(6967,"udp: invalid receive buffer") end if
  result=mq3_udp_recv(socket,nativeBytesPtr(data),capacity,metadata)
  if result==-2 then return Datagram(false,void,bytes(0,0)) end if
  if result<0 then return error(6967,"udp: recvfrom failed "+str(0-result)) end if
  return Datagram(true,Endpoint(n.readU32(metadata,0),n.readU32(metadata,4)),slice(data,0,result))
end function
function receiveFrom(socket,capacity)
  if socket==void or capacity<1 or capacity>65535 then return error(6967,"udp: invalid receive capacity") end if
  return receiveFromBuffered(socket,bytes(capacity,0),bytes(8,0),capacity)
end function
function close(socket)
  if socket==void then return error(6968,"udp: invalid socket") end if
  code=mq3_udp_close(socket);if code!=0 then return error(6968,"udp: closesocket failed "+str(code)) end if;return void
end function
function openSocks5(server,port,username,password,udpPort)
  if server==void or server=="" or port<1 or port>65535 or udpPort<0 or udpPort>65535 then return error(6969,"udp: invalid SOCKS5 configuration") end if
  relay=bytes(8,0);control=mq3_udp_socks5_open(server,port,username,password,udpPort,relay)
  if control==-1 then return error(6969,"udp: SOCKS5 negotiation failed "+str(lastError())) end if
  return Socks5(control,Endpoint(n.readU32(relay,0),n.readU32(relay,4)))
end function
function waitReadable(socket,milliseconds)
  if socket==void or milliseconds<0 then return error(6969,"udp: invalid wait") end if
  result=mq3_udp_wait_readable(socket,milliseconds);if result<0 then return error(6969,"udp: select failed "+str(0-result)) end if;return result>0
end function
function localIPv4()
  raw=bytes(64,0);count=mq3_udp_local_ipv4_count(raw,16);if count<0 then return error(6969,"udp: local address query failed "+str(0-count)) end if
  values=[];for index=0 to count-1 values=values+[n.readU32(raw,index*4)] end for;return values
end function
