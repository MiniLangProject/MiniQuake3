// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// IPv4 UDP transport and out-of-band packet framing from qcommon/net_chan.c.
package mq3.qcommon.net_transport
import mq3.platform.udp as udp
import mq3.qcommon.netchan as netchan
import mq3.qcommon.huffman as huffman
import std.string as strings

const NA_BOT=0
const NA_BAD=1
const NA_LOOPBACK=2
const NA_BROADCAST=3
const NA_IP=4
const NA_IPX=5
const NA_BROADCAST_IPX=6
const PORT_SERVER=27960
const MAX_LOOPBACK=16
const MAX_PACKETLEN=1400

struct LoopMessage data end struct
struct LoopQueue messages get send end struct
struct Loopbacks queues end struct
struct Transport socket loopbacks end struct
struct Packet received address data end struct
struct AddressResult ok address end struct

function blankAddress(kind) return netchan.Address(kind,[0,0,0,0],0) end function
function createLoopbacks()
  return Loopbacks([LoopQueue(array(MAX_LOOPBACK,void),0,0),LoopQueue(array(MAX_LOOPBACK,void),0,0)])
end function

function validAddress(address,count)
  return address!=void and len(address.ip)>=count
end function

function compareBaseAddress(first,second)
  if first==void or second==void or first.type!=second.type then return false end if
  if first.type==NA_LOOPBACK then return true end if
  count=4;if first.type==NA_IPX then count=10 else if first.type!=NA_IP then return false end if
  if not validAddress(first,count) or not validAddress(second,count) then return false end if
  for index=0 to count-1 if first.ip[index]!=second.ip[index] then return false end if end for
  return true
end function

function compareAddress(first,second)
  return compareBaseAddress(first,second) and (first.type==NA_LOOPBACK or first.port==second.port)
end function

function isLocalAddress(address) return address!=void and address.type==NA_LOOPBACK end function

function hexByte(value)
  digits=bytes("0123456789abcdef");return decode(bytes([digits[(value>>4)&15],digits[value&15]]))
end function

function ipxToString(values,port)
  data=array(10,0);if values!=void then limit=len(values);if limit>10 then limit=10 end if;if limit>0 then for index=0 to limit-1 data[index]=values[index] end for end if end if
  return hexByte(data[0])+hexByte(data[1])+hexByte(data[2])+hexByte(data[3])+"."+hexByte(data[4])+hexByte(data[5])+hexByte(data[6])+hexByte(data[7])+hexByte(data[8])+hexByte(data[9])+":"+str(port)
end function

function addressToString(address)
  if address==void then return "bad" end if
  if address.type==NA_LOOPBACK then return "loopback" end if
  if address.type==NA_BOT then return "bot" end if
  if address.type==NA_IP and validAddress(address,4) then return str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port) end if
  if address.type==NA_IPX or address.type==NA_BROADCAST_IPX then return ipxToString(address.ip,address.port) end if
  // Baseq3 formats every remaining type through the zeroed IPX member.
  return ipxToString([],address.port)
end function

function resolved(ok,address) return AddressResult(ok,address) end function

function stringToAddressWith(text,resolveFn,context)
  if text=="localhost" then return resolved(true,blankAddress(NA_LOOPBACK)) end if
  base=text;port=PORT_SERVER;colon=strings.indexOf(base,":",0)
  if colon>=0 then
    portText=strings.substr(base,colon+1,len(base)-colon-1);base=strings.substr(base,0,colon);port=toNumber(portText)&0xffff
  end if
  if resolveFn==void then return resolved(false,blankAddress(NA_BAD)) end if
  address=resolveFn(context,base);if address==void or address is error or not validAddress(address,4) then return resolved(false,blankAddress(NA_BAD)) end if
  if address.ip[0]==255 and address.ip[1]==255 and address.ip[2]==255 and address.ip[3]==255 then address.type=NA_BAD;return resolved(false,address) end if
  address.port=port;return resolved(true,address)
end function

function nativeResolve(context,name)
  result=try(resolveIPv4(name,PORT_SERVER));if result is error then return void end if;return result
end function

function stringToAddress(text) return stringToAddressWith(text,nativeResolve,void) end function

function sendLoopPacket(loopbacks,sock,data)
  if loopbacks==void or sock<netchan.NS_CLIENT or sock>netchan.NS_SERVER then return error(6970,"net transport: invalid loopback send") end if
  if len(data)>MAX_PACKETLEN then return error(6970,"net transport: loopback packet exceeds MAX_PACKETLEN") end if
  queue=loopbacks.queues[sock^1];slot=queue.send&(MAX_LOOPBACK-1);queue.send=queue.send+1;queue.messages[slot]=LoopMessage(bytes(data));return len(data)
end function

function getLoopPacket(loopbacks,sock,capacity)
  if loopbacks==void or sock<netchan.NS_CLIENT or sock>netchan.NS_SERVER or capacity<1 then return error(6970,"net transport: invalid loopback receive") end if
  queue=loopbacks.queues[sock];if queue.send-queue.get>MAX_LOOPBACK then queue.get=queue.send-MAX_LOOPBACK end if
  if queue.get>=queue.send then return Packet(false,void,bytes(0,0)) end if
  slot=queue.get&(MAX_LOOPBACK-1);queue.get=queue.get+1;data=queue.messages[slot].data
  if len(data)>capacity then return error(6970,"net transport: loopback receive capacity") end if
  return Packet(true,blankAddress(NA_LOOPBACK),bytes(data))
end function

function addressToEndpoint(address)
  if address==void or (address.type!=NA_IP and address.type!=NA_BROADCAST) or len(address.ip)!=4 then return error(6970,"net transport: unsupported address") end if
  return udp.Endpoint(udp.ipv4(address.ip[0],address.ip[1],address.ip[2],address.ip[3]),address.port)
end function

function resolveIPv4(name,port)
  if port<1 or port>65535 then return error(6970,"net transport: invalid resolved port") end if
  address=udp.resolveIPv4(name);return netchan.Address(NA_IP,udp.octets(address),port)
end function

function endpointToAddress(endpoint)
  if endpoint==void then return error(6970,"net transport: missing endpoint") end if
  return netchan.Address(NA_IP,udp.octets(endpoint.address),endpoint.port)
end function

function create(socket)
  if socket==void then return error(6970,"net transport: missing socket") end if
  return Transport(socket,createLoopbacks())
end function

function createShared(socket,loopbacks)
  if socket==void or loopbacks==void then return error(6970,"net transport: missing shared transport") end if
  return Transport(socket,loopbacks)
end function

function createLoopback(loopbacks)
  if loopbacks==void then return error(6970,"net transport: missing loopback transport") end if
  return Transport(void,loopbacks)
end function

function sendPacket(runtime,sock,data,address)
  if runtime==void or runtime.context==void then return error(6971,"net transport: missing runtime") end if
  if address.type==NA_LOOPBACK then return sendLoopPacket(runtime.context.loopbacks,sock,data) end if
  // NA_BOT and NA_BAD are deliberately discarded by Baseq3 NET_SendPacket.
  if address.type==NA_BOT or address.type==NA_BAD then return 0 end if
  return udp.sendTo(runtime.context.socket,addressToEndpoint(address),data)
end function

function attach(runtime,socket)
  runtime.context=create(socket);runtime.sendPacketFn=sendPacket;return runtime
end function

function attachShared(runtime,socket,loopbacks)
  runtime.context=createShared(socket,loopbacks);runtime.sendPacketFn=sendPacket;return runtime
end function

function attachLoopback(runtime,loopbacks)
  runtime.context=createLoopback(loopbacks);runtime.sendPacketFn=sendPacket;return runtime
end function

function receive(socket,capacity)
  datagram=udp.receiveFrom(socket,capacity)
  if not datagram.received then return Packet(false,void,bytes(0,0)) end if
  return Packet(true,endpointToAddress(datagram.endpoint),datagram.data)
end function

function outOfBandPrintPacket(text) return bytes([255,255,255,255])+bytes(text) end function

function outOfBandPrint(socket,address,text)
  packet=outOfBandPrintPacket(text);udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function

function outOfBandDataPacket(data)
  packet=bytes([255,255,255,255])+data
  // NET_OutOfBandData is used for the quoted "connect " message.  Baseq3
  // leaves its 12-byte header/command prefix intact and compresses the rest.
  return huffman.compressPacket(packet,12)
end function

function outOfBandData(socket,address,data)
  packet=outOfBandDataPacket(data);udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function
