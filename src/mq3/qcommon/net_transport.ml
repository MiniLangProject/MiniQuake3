// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// IPv4 UDP transport and out-of-band packet framing from qcommon/net_chan.c.
package mq3.qcommon.net_transport
import mq3.platform.udp as udp
import mq3.qcommon.netchan as netchan
import mq3.qcommon.huffman as huffman

const NA_BOT=0
const NA_BAD=1
const NA_LOOPBACK=2
const NA_BROADCAST=3
const NA_IP=4

struct Transport socket end struct
struct Packet received address data end struct

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
  return Transport(socket)
end function

function sendPacket(runtime,sock,data,address)
  if runtime==void or runtime.context==void then return error(6971,"net transport: missing runtime") end if
  // NA_BOT and NA_BAD are deliberately discarded by Baseq3 NET_SendPacket.
  if address.type==NA_BOT or address.type==NA_BAD then return 0 end if
  return udp.sendTo(runtime.context.socket,addressToEndpoint(address),data)
end function

function attach(runtime,socket)
  runtime.context=create(socket);runtime.sendPacketFn=sendPacket;return runtime
end function

function receive(socket,capacity)
  datagram=udp.receiveFrom(socket,capacity)
  if not datagram.received then return Packet(false,void,bytes(0,0)) end if
  return Packet(true,endpointToAddress(datagram.endpoint),datagram.data)
end function

function outOfBandPrint(socket,address,text)
  packet=bytes([255,255,255,255])+bytes(text)
  udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function

function outOfBandData(socket,address,data)
  packet=bytes([255,255,255,255])+data
  // NET_OutOfBandData is used for the quoted "connect " message.  Baseq3
  // leaves its 12-byte header/command prefix intact and compresses the rest.
  packet=huffman.compressPacket(packet,12)
  udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function
