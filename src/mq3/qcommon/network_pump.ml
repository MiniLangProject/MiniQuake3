// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic nonblocking UDP polling shared by the client and server frame loops.
package mq3.qcommon.network_pump
import mq3.qcommon.net_transport as transport

const SIDE_CLIENT=0
const SIDE_SERVER=1

struct Runtime clientSocket serverSocket capacity nextSide context clientPacketFn serverPacketFn end struct
struct Step processed side address data end struct

function create(clientSocket,serverSocket,capacity,context,clientPacketFn,serverPacketFn)
  if clientSocket==void and serverSocket==void then return error(6975,"network pump: no sockets") end if
  if capacity<1 or capacity>65535 then return error(6975,"network pump: invalid capacity") end if
  return Runtime(clientSocket,serverSocket,capacity,SIDE_CLIENT,context,clientPacketFn,serverPacketFn)
end function

function receiveSide(runtime,side)
  socket=runtime.clientSocket;if side==SIDE_SERVER then socket=runtime.serverSocket end if
  if socket==void then return Step(false,side,void,bytes(0,0)) end if
  packet=transport.receive(socket,runtime.capacity)
  if not packet.received then return Step(false,side,void,bytes(0,0)) end if
  if side==SIDE_CLIENT then
    if runtime.clientPacketFn!=void then runtime.clientPacketFn(runtime.context,packet.address,packet.data) end if
  else
    if runtime.serverPacketFn!=void then runtime.serverPacketFn(runtime.context,packet.address,packet.data) end if
  end if
  runtime.nextSide=SIDE_CLIENT;if side==SIDE_CLIENT then runtime.nextSide=SIDE_SERVER end if
  return Step(true,side,packet.address,packet.data)
end function

// Consume at most one datagram.  When both queues are ready, alternate the
// first socket examined so neither side can starve the other.
function pumpOnce(runtime)
  if runtime==void then return error(6975,"network pump: missing runtime") end if
  first=runtime.nextSide;second=SIDE_CLIENT;if first==SIDE_CLIENT then second=SIDE_SERVER end if
  step=receiveSide(runtime,first);if step.processed then return step end if
  return receiveSide(runtime,second)
end function

// Drain currently available datagrams up to an explicit per-frame budget.
// A zero budget is useful for callers that only want deterministic accounting.
function drain(runtime,maxPackets)
  if runtime==void or maxPackets<0 then return error(6975,"network pump: invalid drain") end if
  count=0
  while count<maxPackets
    step=pumpOnce(runtime);if not step.processed then return count end if;count=count+1
  end while
  return count
end function
