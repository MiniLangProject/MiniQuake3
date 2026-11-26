// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic nonblocking UDP polling shared by the client and server frame loops.
package mq3.qcommon.network_pump
import mq3.qcommon.net_transport as transport

const SIDE_CLIENT=0
const SIDE_SERVER=1

/// Runtime record for qcommon.network_pump, containing `clientSocket`, `serverSocket`, `capacity`, `nextSide`, `context`, `clientPacketFn`, and 5 further fields.
struct Runtime clientSocket serverSocket capacity nextSide context clientPacketFn serverPacketFn clientBuffer serverBuffer clientMetadata serverMetadata end struct
/// Step record for qcommon.network_pump, containing `processed`, `side`, `address`, `data`.
struct Step processed side address data end struct

/// Create network pump in qcommon.network_pump.
///
/// Validation failures include `network pump: no sockets`; `network pump: invalid capacity`.
/// @param clientSocket Initial `clientSocket` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
/// @param serverSocket Initial `serverSocket` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
/// @param capacity Initial `capacity` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
/// @param clientPacketFn Initial `clientPacketFn` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
/// @param serverPacketFn Initial `serverPacketFn` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record.
function create(clientSocket,serverSocket,capacity,context,clientPacketFn,serverPacketFn)
  if clientSocket==void and serverSocket==void then return error(6975,"network pump: no sockets") end if
  if capacity<1 or capacity>65535 then return error(6975,"network pump: invalid capacity") end if
  return Runtime(clientSocket,serverSocket,capacity,SIDE_CLIENT,context,clientPacketFn,serverPacketFn,bytes(capacity,0),bytes(capacity,0),bytes(8,0),bytes(8,0))
end function

/// Receive side in qcommon.network_pump; the normal completion returns `Step(true, side, packet.address, packet.data)`.
///
/// Direct state writes: `runtime.nextSide`.
/// @param runtime Record exposing `clientSocket`, `serverSocket`, `clientBuffer`, `clientMetadata`, `serverBuffer`, `serverMetadata`, `capacity` and further fields. Updated in place: `nextSide`.
/// @param side Initial `side` field stored in the returned or constructed `mq3.qcommon.network_pump.Step` record.
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
/// @param runtime Record exposing `nextSide`.
function pumpOnce(runtime)
  if runtime==void then return error(6975,"network pump: missing runtime") end if
  first=runtime.nextSide;second=SIDE_CLIENT;if first==SIDE_CLIENT then second=SIDE_SERVER end if
  step=receiveSide(runtime,first);if step.processed then return step end if
  return receiveSide(runtime,second)
end function

// Drain currently available datagrams up to an explicit per-frame budget.
// A zero budget is useful for callers that only want deterministic accounting.
/// @param runtime Runtime passed as `runtime` to `mq3.qcommon.network_pump.pumpOnce`.
/// @param maxPackets Max packets used in `(maxPackets < 0)` and `(count < maxPackets)`.
function drain(runtime,maxPackets)
  if runtime==void or maxPackets<0 then return error(6975,"network pump: invalid drain") end if
  count=0
  while count<maxPackets
    step=pumpOnce(runtime);if not step.processed then return count end if;count=count+1
  end while
  return count
end function
