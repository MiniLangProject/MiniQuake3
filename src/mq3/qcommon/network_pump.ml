// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic nonblocking UDP polling shared by the client and server frame loops.
package mq3.qcommon.network_pump
import mq3.qcommon.net_transport as transport

/// Network-pump selector for the client side.
const SIDE_CLIENT=0
/// Network-pump selector for the server side.
const SIDE_SERVER=1

/// Nonblocking UDP pump with independent receive buffers and alternating client/server polling priority.
struct Runtime
  /// Host UDP socket assigned to the client network endpoint.
  clientSocket
  /// Host UDP socket assigned to the server network endpoint.
  serverSocket
  /// Receive-buffer capacity in bytes for each socket, from 1 through 65,535.
  capacity
  /// Endpoint selected first by the next fair packet-pump iteration.
  nextSide
  /// Caller-supplied data associated with delivery of received packets to the client and server
  /// handlers.
  context
  /// Optional callback `(context, address, data)` for a received client-side datagram; returned errors
  /// are propagated by `receiveSide`, while other return values are ignored.
  clientPacketFn
  /// Optional callback `(context, address, data)` for a received server-side datagram; returned errors
  /// are propagated by `receiveSide`, while other return values are ignored.
  serverPacketFn
  /// Reusable receive buffer for client-side datagrams.
  clientBuffer
  /// Reusable receive buffer for server-side datagrams.
  serverBuffer
  /// Reusable address and length metadata for client receives.
  clientMetadata
  /// Reusable address and length metadata for server receives.
  serverMetadata
end struct
/// Result of one receive attempt, carrying the selected endpoint and any received datagram.
struct Step
  /// True when a datagram was received and its optional callback completed without an error.
  processed
  /// Endpoint examined by this attempt: SIDE_CLIENT or SIDE_SERVER, even when no datagram was received.
  side
  /// Sender network address, or `void` when the attempt received no datagram.
  address
  /// Datagram payload delivered during this pump step.
  data
end struct

/// Create a nonblocking client/server UDP pump with reusable receive buffers.
/// At least one socket must be present. Each endpoint receives a `capacity`-byte buffer and eight bytes
/// of address metadata. Polling initially prefers the client side; no sockets are opened or closed here.
/// @param clientSocket Open client UDP socket, or `void` to disable client-side receives.
/// @param serverSocket Open server UDP socket, or `void` to disable server-side receives.
/// @param capacity Maximum receive size in bytes per datagram, from 1 through 65,535.
/// @param context Opaque value passed unchanged to either packet callback.
/// @param clientPacketFn Optional callback `(context, address, data)` for client-side datagrams.
/// @param serverPacketFn Optional callback `(context, address, data)` for server-side datagrams.
function create(clientSocket,serverSocket,capacity,context,clientPacketFn,serverPacketFn)
  if clientSocket==void and serverSocket==void then return error(6975,"network pump: no sockets") end if
  if capacity<1 or capacity>65535 then return error(6975,"network pump: invalid capacity") end if
  return Runtime(clientSocket,serverSocket,capacity,SIDE_CLIENT,context,clientPacketFn,serverPacketFn,bytes(capacity,0),bytes(capacity,0),bytes(8,0),bytes(8,0))
end function

/// Try to receive one datagram from the selected socket and invoke its optional packet callback.
/// Returns an unprocessed Step when the socket is absent or has no packet, or a processed Step containing
/// the sender and payload after successful handling. Transport or callback errors are returned directly.
/// After successful reception the opposite endpoint becomes the next preferred side.
/// @param runtime Pump containing the sockets, reusable receive buffers, callbacks, and polling state.
/// @param side Endpoint selector, SIDE_CLIENT or SIDE_SERVER.
function receiveSide(runtime,side)
  socket=runtime.clientSocket;if side==SIDE_SERVER then socket=runtime.serverSocket end if
  if socket==void then return Step(false,side,void,bytes(0,0)) end if
  data=runtime.clientBuffer;metadata=runtime.clientMetadata
  if side==SIDE_SERVER then data=runtime.serverBuffer;metadata=runtime.serverMetadata end if
  packet=transport.receiveBuffered(socket,data,metadata,runtime.capacity);if packet is error then return packet end if
  if not packet.received then return Step(false,side,void,bytes(0,0)) end if
  if side==SIDE_CLIENT then
    if runtime.clientPacketFn!=void then handled=runtime.clientPacketFn(runtime.context,packet.address,packet.data);if handled is error then return handled end if end if
  else
    if runtime.serverPacketFn!=void then handled=runtime.serverPacketFn(runtime.context,packet.address,packet.data);if handled is error then return handled end if end if
  end if
  runtime.nextSide=SIDE_CLIENT;if side==SIDE_CLIENT then runtime.nextSide=SIDE_SERVER end if
  return Step(true,side,packet.address,packet.data)
end function

// Consume at most one datagram.  When both queues are ready, alternate the
// first socket examined so neither side can starve the other.
/// Poll at most two endpoints and consume at most one available datagram.
/// The endpoint chosen by `nextSide` is examined first; an empty first attempt falls through to the other.
/// Returns the processed Step or the final empty Step when neither endpoint has a packet.
/// @param runtime Nonblocking pump whose next polling side is updated after a successful receive.
function pumpOnce(runtime)
  if runtime==void then return error(6975,"network pump: missing runtime") end if
  first=runtime.nextSide;second=SIDE_CLIENT;if first==SIDE_CLIENT then second=SIDE_SERVER end if
  step=receiveSide(runtime,first);if step.processed then return step end if
  return receiveSide(runtime,second)
end function

// Drain currently available datagrams up to an explicit per-frame budget.
// A zero budget is useful for callers that only want deterministic accounting.
/// Process currently available UDP datagrams up to the supplied packet budget.
/// Returns the number processed, stopping early when both endpoints are empty. A zero budget returns zero
/// without polling; a negative budget or missing runtime produces error 6975.
/// @param runtime Pump supplying receive buffers, callback context, and alternating endpoint priority.
/// @param maxPackets Maximum number of datagrams to process in this call, not a byte limit.
function drain(runtime,maxPackets)
  if runtime==void or maxPackets<0 then return error(6975,"network pump: invalid drain") end if
  count=0
  while count<maxPackets
    step=pumpOnce(runtime);if not step.processed then return count end if;count=count+1
  end while
  return count
end function
