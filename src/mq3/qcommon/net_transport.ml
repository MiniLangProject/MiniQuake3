// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// IPv4 UDP transport and out-of-band packet framing from qcommon/net_chan.c.
package mq3.qcommon.net_transport
import mq3.platform.udp as udp
import mq3.qcommon.netchan as netchan
import mq3.qcommon.huffman as huffman
import std.string as strings

/// Network-address kind reserved for an in-process bot client.
const NA_BOT=0
/// Network-address kind indicating an invalid or unsupported endpoint.
const NA_BAD=1
/// Network-address kind for local loopback delivery.
const NA_LOOPBACK=2
/// Network-address kind for an IPv4 broadcast destination.
const NA_BROADCAST=3
/// Network-address kind for an IPv4 endpoint.
const NA_IP=4
/// Legacy network-address kind for an IPX endpoint.
const NA_IPX=5
/// Legacy network-address kind for IPX broadcast delivery.
const NA_BROADCAST_IPX=6
/// Default UDP port used by a Quake III game server.
const PORT_SERVER=27960
/// Number of packet slots in each local loopback queue.
const MAX_LOOPBACK=16
/// Maximum byte length of an individual network datagram.
const MAX_PACKETLEN=1400

/// LoopMessage record for qcommon.net_transport, containing `data`.
struct LoopMessage
  /// Datagram bytes queued for in-process loopback delivery.
  data
end struct
/// LoopQueue record for qcommon.net_transport, containing `messages`, `get`, `send`.
struct LoopQueue
  /// Ring-buffer slots containing queued loopback datagrams.
  messages
  /// Absolute sequence position of the next loopback datagram to receive.
  get
  /// Absolute sequence position assigned to the next loopback datagram.
  send
end struct
/// Loopbacks record for qcommon.net_transport, containing `queues`.
struct Loopbacks
  /// Separate loopback queues for the client and server endpoints.
  queues
end struct
/// Transport record for qcommon.net_transport, containing `socket`, `loopbacks`.
struct Transport
  /// Host UDP socket used for datagram transport.
  socket
  /// In-process queues used when the destination is a loopback address.
  loopbacks
end struct
/// Packet record for qcommon.net_transport, containing `received`, `address`, `data`.
struct Packet
  /// True when a valid datagram was obtained from the transport.
  received
  /// Network address associated with the client or packet.
  address
  /// Datagram bytes returned by the transport receive operation.
  data
end struct
/// AddressResult record for qcommon.net_transport, containing `ok`, `address`.
struct AddressResult
  /// True when the address lookup or transport operation succeeded.
  ok
  /// Network address associated with the client or packet.
  address
end struct

/// Return `mq3.qcommon.netchan.Address(kind, [0, 0, 0, 0], 0)` from `qcommon.net_transport.blankAddress`.
/// @param kind Initial `type` field stored in the returned or constructed `mq3.qcommon.netchan.Address` record.
function blankAddress(kind) return netchan.Address(kind,[0,0,0,0],0) end function
/// Create `mq3.qcommon.net_transport.Loopbacks` with queues=[LoopQueue(array(MAX_LOOPBACK, void), 0, 0), LoopQueue(array(MAX_LOOPBACK, void), 0, 0)].
function createLoopbacks()
  return Loopbacks([LoopQueue(array(MAX_LOOPBACK,void),0,0),LoopQueue(array(MAX_LOOPBACK,void),0,0)])
end function

/// Compute qcommon.net_transport.validAddress as `((address != void) and (len(address.ip) >= count))`.
/// @param address Record exposing `ip`.
/// @param count Count used in `(len(address.ip) >= count)` and `((address != void) and (len(address.ip) >= count))`.
function validAddress(address,count)
  return address!=void and len(address.ip)>=count
end function

/// Test compare base address in qcommon.net_transport; the normal completion returns `true`.
/// @param first Record exposing `type`, `ip`.
/// @param second Record exposing `type`, `ip`.
function compareBaseAddress(first,second)
  if first==void or second==void or first.type!=second.type then return false end if
  if first.type==NA_LOOPBACK then return true end if
  count=4;if first.type==NA_IPX then count=10 else if first.type!=NA_IP then return false end if
  if not validAddress(first,count) or not validAddress(second,count) then return false end if
  for index=0 to count-1 if first.ip[index]!=second.ip[index] then return false end if end for
  return true
end function

/// Compute qcommon.net_transport.compareAddress as `(compareBaseAddress(first, second) and ((first.type == NA_LOOPBACK) or (first.port == second.port)))`.
/// @param first Record exposing `type`, `port`.
/// @param second Record exposing `port`.
function compareAddress(first,second)
  return compareBaseAddress(first,second) and (first.type==NA_LOOPBACK or first.port==second.port)
end function

/// Compute qcommon.net_transport.isLocalAddress as `((address != void) and (address.type == NA_LOOPBACK))`.
/// @param address Record exposing `type`.
function isLocalAddress(address) return address!=void and address.type==NA_LOOPBACK end function

/// Compute hex byte in qcommon.net_transport; the normal completion returns `decode(bytes([digits[((value >> 4) & 15)], digits[(value & 15)]]))`.
/// @param value Value used in `(value >> 4)` and `(value & 15)`.
function hexByte(value)
  digits=bytes("0123456789abcdef");return decode(bytes([digits[(value>>4)&15],digits[value&15]]))
end function

/// Apply `mq3.qcommon.net_transport.hexByte` for ipx to string in qcommon.net_transport.
/// @param values Values used in `len(values)` and `values[index]`.
/// @param port Port used in `str(port)`.
function ipxToString(values,port)
  data=array(10,0);if values!=void then limit=len(values);if limit>10 then limit=10 end if;if limit>0 then for index=0 to limit-1 data[index]=values[index] end for end if end if
  return hexByte(data[0])+hexByte(data[1])+hexByte(data[2])+hexByte(data[3])+"."+hexByte(data[4])+hexByte(data[5])+hexByte(data[6])+hexByte(data[7])+hexByte(data[8])+hexByte(data[9])+":"+str(port)
end function

/// Compute address to string in qcommon.net_transport; the normal completion returns `ipxToString([], address.port)`.
/// @param address Record exposing `type`, `ip`, `port`.
function addressToString(address)
  if address==void then return "bad" end if
  if address.type==NA_LOOPBACK then return "loopback" end if
  if address.type==NA_BOT then return "bot" end if
  if address.type==NA_IP and validAddress(address,4) then return str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port) end if
  if address.type==NA_IPX or address.type==NA_BROADCAST_IPX then return ipxToString(address.ip,address.port) end if
  // Baseq3 formats every remaining type through the zeroed IPX member.
  return ipxToString([],address.port)
end function

/// Create `mq3.qcommon.net_transport.AddressResult` with ok=ok; address=address.
/// @param ok Initial `ok` field stored in the returned or constructed `mq3.qcommon.net_transport.AddressResult` record.
/// @param address Initial `address` field stored in the returned or constructed `mq3.qcommon.net_transport.AddressResult` record.
function resolved(ok,address) return AddressResult(ok,address) end function

/// Compute string to address with in qcommon.net_transport; the normal completion returns `resolved(true, address)`.
/// @param text Text used in `(text == "localhost")`.
/// @param resolveFn Callback invoked for resolve; the call sites below define the callback arguments.
/// @param context Context used in `resolveFn(context, base)`.
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

/// Compute native resolve in qcommon.net_transport; the normal completion returns `result`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param name Name passed as `name` to `mq3.qcommon.net_transport.resolveIPv4`.
function nativeResolve(context,name)
  result=try(resolveIPv4(name,PORT_SERVER));if result is error then return void end if;return result
end function

/// Return `mq3.qcommon.net_transport.stringToAddressWith(text, nativeResolve, void)` from `qcommon.net_transport.stringToAddress`.
/// @param text Text passed as `text` to `mq3.qcommon.net_transport.stringToAddressWith`.
function stringToAddress(text) return stringToAddressWith(text,nativeResolve,void) end function

/// Send loop packet in qcommon.net_transport; the normal completion returns `len(data)`.
///
/// Validation failures include `net transport: invalid loopback send`; `net transport: loopback packet exceeds MAX_PACKETLEN`.
/// @param loopbacks Record exposing `queues`.
/// @param sock Sock used in `(sock ^ 1)` and `(sock < netchan.NS_CLIENT)`.
/// @param data Data used in `len(data)` and `bytes(data)`.
function sendLoopPacket(loopbacks,sock,data)
  if loopbacks==void or sock<netchan.NS_CLIENT or sock>netchan.NS_SERVER then return error(6970,"net transport: invalid loopback send") end if
  if len(data)>MAX_PACKETLEN then return error(6970,"net transport: loopback packet exceeds MAX_PACKETLEN") end if
  queue=loopbacks.queues[sock^1];slot=queue.send&(MAX_LOOPBACK-1);queue.send=queue.send+1;queue.messages[slot]=LoopMessage(bytes(data));return len(data)
end function

/// Get loop packet in qcommon.net_transport; the normal completion returns `Packet(true, blankAddress(NA_LOOPBACK), bytes(data))`.
///
/// Validation failures include `net transport: invalid loopback receive`; `net transport: loopback receive capacity`.
/// @param loopbacks Record exposing `queues`.
/// @param sock Zero-based index into `loopbacks.queues`.
/// @param capacity Capacity used in `(capacity < 1)` and `(len(data) > capacity)`.
function getLoopPacket(loopbacks,sock,capacity)
  if loopbacks==void or sock<netchan.NS_CLIENT or sock>netchan.NS_SERVER or capacity<1 then return error(6970,"net transport: invalid loopback receive") end if
  queue=loopbacks.queues[sock];if queue.send-queue.get>MAX_LOOPBACK then queue.get=queue.send-MAX_LOOPBACK end if
  if queue.get>=queue.send then return Packet(false,void,bytes(0,0)) end if
  slot=queue.get&(MAX_LOOPBACK-1);queue.get=queue.get+1;data=queue.messages[slot].data
  if len(data)>capacity then return error(6970,"net transport: loopback receive capacity") end if
  return Packet(true,blankAddress(NA_LOOPBACK),bytes(data))
end function

/// Compute address to endpoint in qcommon.net_transport; the normal completion returns `udp.Endpoint(udp.ipv4(address.ip[0], address.ip[1], address.ip[2], address.ip[3]), address.port)`.
///
/// Validation failures include `net transport: unsupported address`.
/// @param address Record exposing `type`, `ip`, `port`.
function addressToEndpoint(address)
  if address==void or (address.type!=NA_IP and address.type!=NA_BROADCAST) or len(address.ip)!=4 then return error(6970,"net transport: unsupported address") end if
  return udp.Endpoint(udp.ipv4(address.ip[0],address.ip[1],address.ip[2],address.ip[3]),address.port)
end function

/// Resolve i pv 4 in qcommon.net_transport; the normal completion returns `netchan.Address(NA_IP, udp.octets(address), port)`.
///
/// Validation failures include `net transport: invalid resolved port`.
/// @param name Name passed as `name` to `mq3.platform.udp.resolveIPv4`.
/// @param port Initial `port` field stored in the returned or constructed `mq3.qcommon.netchan.Address` record.
function resolveIPv4(name,port)
  if port<1 or port>65535 then return error(6970,"net transport: invalid resolved port") end if
  address=udp.resolveIPv4(name);return netchan.Address(NA_IP,udp.octets(address),port)
end function

/// Compute endpoint to address in qcommon.net_transport; the normal completion returns `netchan.Address(NA_IP, udp.octets(endpoint.address), endpoint.port)`.
///
/// Validation failures include `net transport: missing endpoint`.
/// @param endpoint Record exposing `address`, `port`.
function endpointToAddress(endpoint)
  if endpoint==void then return error(6970,"net transport: missing endpoint") end if
  return netchan.Address(NA_IP,udp.octets(endpoint.address),endpoint.port)
end function

/// Create net transport in qcommon.net_transport; the normal completion returns `Transport(socket, createLoopbacks())`.
///
/// Validation failures include `net transport: missing socket`.
/// @param socket Initial `socket` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record.
function create(socket)
  if socket==void then return error(6970,"net transport: missing socket") end if
  return Transport(socket,createLoopbacks())
end function

/// Create shared in qcommon.net_transport; the normal completion returns `Transport(socket, loopbacks)`.
///
/// Validation failures include `net transport: missing shared transport`.
/// @param socket Initial `socket` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record.
/// @param loopbacks Initial `loopbacks` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record.
function createShared(socket,loopbacks)
  if socket==void or loopbacks==void then return error(6970,"net transport: missing shared transport") end if
  return Transport(socket,loopbacks)
end function

/// Create loopback in qcommon.net_transport; the normal completion returns `Transport(void, loopbacks)`.
///
/// Validation failures include `net transport: missing loopback transport`.
/// @param loopbacks Initial `loopbacks` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record.
function createLoopback(loopbacks)
  if loopbacks==void then return error(6970,"net transport: missing loopback transport") end if
  return Transport(void,loopbacks)
end function

/// Send packet in qcommon.net_transport; the normal completion returns `udp.sendTo(runtime.context.socket, addressToEndpoint(address), data)`.
///
/// Validation failures include `net transport: missing runtime`.
/// @param runtime Record exposing `context`.
/// @param sock Sock passed as `sock` to `mq3.qcommon.net_transport.sendLoopPacket`.
/// @param data Data passed as `data` to `mq3.qcommon.net_transport.sendLoopPacket`.
/// @param address Record exposing `type`.
function sendPacket(runtime,sock,data,address)
  if runtime==void or runtime.context==void then return error(6971,"net transport: missing runtime") end if
  if address.type==NA_LOOPBACK then return sendLoopPacket(runtime.context.loopbacks,sock,data) end if
  // NA_BOT and NA_BAD are deliberately discarded by Baseq3 NET_SendPacket.
  if address.type==NA_BOT or address.type==NA_BAD then return 0 end if
  return udp.sendTo(runtime.context.socket,addressToEndpoint(address),data)
end function

/// Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.
///
/// Direct state writes: `runtime.context`, `runtime.sendPacketFn`.
/// @param runtime Updated in place: `context`, `sendPacketFn`.
/// @param socket Socket passed as `socket` to `mq3.qcommon.net_transport.create`.
function attach(runtime,socket)
  runtime.context=create(socket);runtime.sendPacketFn=sendPacket;return runtime
end function

/// Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.
///
/// Direct state writes: `runtime.context`, `runtime.sendPacketFn`.
/// @param runtime Updated in place: `context`, `sendPacketFn`.
/// @param socket Socket passed as `socket` to `mq3.qcommon.net_transport.createShared`.
/// @param loopbacks Loopbacks passed as `loopbacks` to `mq3.qcommon.net_transport.createShared`.
function attachShared(runtime,socket,loopbacks)
  runtime.context=createShared(socket,loopbacks);runtime.sendPacketFn=sendPacket;return runtime
end function

/// Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.
///
/// Direct state writes: `runtime.context`, `runtime.sendPacketFn`.
/// @param runtime Updated in place: `context`, `sendPacketFn`.
/// @param loopbacks Loopbacks passed as `loopbacks` to `mq3.qcommon.net_transport.createLoopback`.
function attachLoopback(runtime,loopbacks)
  runtime.context=createLoopback(loopbacks);runtime.sendPacketFn=sendPacket;return runtime
end function

/// Receive net transport in qcommon.net_transport; the normal completion returns `Packet(true, endpointToAddress(datagram.endpoint), datagram.data)`.
/// @param socket Socket passed as `socket` to `mq3.platform.udp.receiveFrom`.
/// @param capacity Capacity passed as `capacity` to `mq3.platform.udp.receiveFrom`.
function receive(socket,capacity)
  datagram=udp.receiveFrom(socket,capacity)
  if not datagram.received then return Packet(false,void,bytes(0,0)) end if
  return Packet(true,endpointToAddress(datagram.endpoint),datagram.data)
end function

/// Receive buffered in qcommon.net_transport; the normal completion returns `Packet(true, endpointToAddress(datagram.endpoint), datagram.data)`.
/// @param socket Socket passed as `socket` to `mq3.platform.udp.receiveFromBuffered`.
/// @param data Data passed as `data` to `mq3.platform.udp.receiveFromBuffered`.
/// @param metadata Metadata passed as `metadata` to `mq3.platform.udp.receiveFromBuffered`.
/// @param capacity Capacity passed as `capacity` to `mq3.platform.udp.receiveFromBuffered`.
function receiveBuffered(socket,data,metadata,capacity)
  datagram=udp.receiveFromBuffered(socket,data,metadata,capacity)
  if not datagram.received then return Packet(false,void,bytes(0,0)) end if
  return Packet(true,endpointToAddress(datagram.endpoint),datagram.data)
end function

/// Compute qcommon.net_transport.outOfBandPrintPacket as `(bytes([255, 255, 255, 255]) + bytes(text))`.
/// @param text Text used in `bytes(text)` and `(bytes([255, 255, 255, 255]) + bytes(text))`.
function outOfBandPrintPacket(text) return bytes([255,255,255,255])+bytes(text) end function

/// Compute out of band print in qcommon.net_transport; the normal completion returns `packet`.
/// @param socket Socket passed as `socket` to `mq3.platform.udp.sendTo`.
/// @param address Address passed as `address` to `mq3.qcommon.net_transport.addressToEndpoint`.
/// @param text Text passed as `text` to `mq3.qcommon.net_transport.outOfBandPrintPacket`.
function outOfBandPrint(socket,address,text)
  packet=outOfBandPrintPacket(text);udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function

/// Compute out of band data packet in qcommon.net_transport; the normal completion returns `huffman.compressPacket(packet, 12)`.
/// @param data Data used in `(bytes([255, 255, 255, 255]) + data)`.
function outOfBandDataPacket(data)
  packet=bytes([255,255,255,255])+data
  // NET_OutOfBandData is used for the quoted "connect " message.  Baseq3
  // leaves its 12-byte header/command prefix intact and compresses the rest.
  return huffman.compressPacket(packet,12)
end function

/// Compute out of band data in qcommon.net_transport; the normal completion returns `packet`.
/// @param socket Socket passed as `socket` to `mq3.platform.udp.sendTo`.
/// @param address Address passed as `address` to `mq3.qcommon.net_transport.addressToEndpoint`.
/// @param data Data passed as `data` to `mq3.qcommon.net_transport.outOfBandDataPacket`.
function outOfBandData(socket,address,data)
  packet=outOfBandDataPacket(data);udp.sendTo(socket,addressToEndpoint(address),packet);return packet
end function
