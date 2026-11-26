// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive Winsock host for the transport-neutral UI LAN query state.
package mq3.client.ui_lan_udp

import mq3.client.connectionless as connectionless
import mq3.client.ui_lan_ingress as ingress
import mq3.client.ui_lan_queries as queries
import mq3.platform.udp as udp
import mq3.qcommon.message as message
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as netchan

const PACKET_CAPACITY=65535
/// Stores UI LAN udp context record, including `clientSocket`, `serverSocket`, `ingressServices`, `clientState`, `active`.
struct Context clientSocket serverSocket ingressServices clientState active end struct

/// Calls `mq3.platform.udp.close`, `mq3.platform.udp.cleanup` from UI LAN udp `abandon`.
/// @param clientSocket Value used by `if clientSocket!=void then ignored=try(udp.close(clientSocket)) end if`.
/// @param serverSocket Value used by `if serverSocket!=void then ignored=try(udp.close(serverSocket)) end if`.
function abandon(clientSocket,serverSocket)
  if clientSocket!=void then ignored=try(udp.close(clientSocket)) end if
  if serverSocket!=void then ignored=try(udp.close(serverSocket)) end if
  ignored=try(udp.cleanup());return void
end function

/// Calls `mq3.platform.udp.startup`, `mq3.platform.udp.open`, `mq3.client.ui_lan_udp.abandon` and additional helpers from UI LAN udp `open`.
/// @param ingressState Value used by `if ingressState==void then return error(7702,"UI LAN UDP: missing ingress state") end if`.
function open(ingressState)
  if ingressState==void then return error(7702,"UI LAN UDP: missing ingress state") end if
  started=try(udp.startup());if started is error then return started end if
  clientSocket=try(udp.open());if clientSocket is error then abandon(void,void);return clientSocket end if
  serverSocket=try(udp.open());if serverSocket is error then abandon(clientSocket,void);return serverSocket end if
  configured=try(udp.setBroadcast(clientSocket,true));if configured is error then abandon(clientSocket,serverSocket);return configured end if
  configured=try(udp.setBroadcast(serverSocket,true));if configured is error then abandon(clientSocket,serverSocket);return configured end if
  bound=try(udp.bind(clientSocket,udp.Endpoint(0,0)));if bound is error then abandon(clientSocket,serverSocket);return bound end if
  bound=try(udp.bind(serverSocket,udp.Endpoint(0,0)));if bound is error then abandon(clientSocket,serverSocket);return bound end if
  nowhere=netchan.Address(transport.NA_IP,[0,0,0,0],0)
  return Context(clientSocket,serverSocket,ingress.services(ingressState),connectionless.create(nowhere),true)
end function

/// Evaluates UI LAN udp `selectedSocket` and returns `error(7702,"UI LAN UDP: inactive host")`, `error(7702,"UI LAN UDP: invalid source socket")`, `context.serverSocket` and additional values according to its guard/selection conditions.
/// @param context Record read through `context.active`, `context.serverSocket`, `context.clientSocket`.
/// @param sock Value used by `if sock!=netchan.NS_CLIENT and sock!=netchan.NS_SERVER then return error(7702,"UI LAN UDP: invalid source socket") end if`.
function selectedSocket(context,sock)
  if context==void or not context.active then return error(7702,"UI LAN UDP: inactive host") end if
  if sock!=netchan.NS_CLIENT and sock!=netchan.NS_SERVER then return error(7702,"UI LAN UDP: invalid source socket") end if
  if sock==netchan.NS_SERVER then return context.serverSocket end if
  return context.clientSocket
end function

/// Calls `mq3.client.ui_lan_udp.selectedSocket`, `mq3.platform.udp.sendTo`, `mq3.qcommon.net_transport.addressToEndpoint` from UI LAN udp `sendPacket`. The final path returns `udp.sendTo(socket,transport.addressToEndpoint(address),packet)`.
/// @param context context record passed to the UI LAN udp helper calls.
/// @param sock Value used by `socket=selectedSocket(context,sock)`.
/// @param address Value used by `return udp.sendTo(socket,transport.addressToEndpoint(address),packet)`.
/// @param packet Value used by `return udp.sendTo(socket,transport.addressToEndpoint(address),packet)`.
function sendPacket(context,sock,address,packet)
  socket=selectedSocket(context,sock);return udp.sendTo(socket,transport.addressToEndpoint(address),packet)
end function

/// Calls `mq3.qcommon.net_transport.resolveIPv4` from UI LAN udp `resolveAddress`. The final path returns `result`.
/// @param context Record read through `context.active`.
/// @param name Name used to select or register the corresponding UI LAN udp resource.
/// @param port Value used by `result=try(transport.resolveIPv4(name,port))`.
function resolveAddress(context,name,port)
  if context==void or not context.active then return void end if
  result=try(transport.resolveIPv4(name,port));if result is error then return void end if;return result
end function

/// Calls `mq3.client.ui_lan_queries.services` from UI LAN udp `services`. The final path returns `host`.
/// @param context Value assigned to `host.context`.
function services(context)
  host=queries.services();host.context=context;host.sendFn=sendPacket;host.resolveFn=resolveAddress;return host
end function

/// Adapts `mq3.platform.udp.localEndpoint` to UI LAN udp `localEndpoint`, returning its result for `selectedSocket(context,sock)`.
/// @param context Argument 1 of `mq3.platform.udp.localEndpoint`; passed as `selectedSocket(context,sock)`.
/// @param sock Argument 1 of `mq3.platform.udp.localEndpoint`; passed as `selectedSocket(context,sock)`.
function localEndpoint(context,sock) return udp.localEndpoint(selectedSocket(context,sock)) end function

/// Computes `data!=void and len(data)>=5 and data[0]==255 and data[1]==255 and data[2]==255 and data[3]==255` for UI LAN udp `isOob`.
/// @param data Sequence read at `data[0]`, `data[1]`, `data[2]`, `data[3]`.
function isOob(data)
  return data!=void and len(data)>=5 and data[0]==255 and data[1]==255 and data[2]==255 and data[3]==255
end function

/// Calls `mq3.client.ui_lan_udp.isOob`, `mq3.qcommon.message.initStorage`, `mq3.client.connectionless.dispatch` from UI LAN udp `dispatch`.
/// @param context Record read through `context.clientState`, `context.ingressServices`.
/// @param packet Record read through `packet.received`, `packet.data`, `packet.address`.
function dispatch(context,packet)
  if not packet.received or not isOob(packet.data) then return false end if
  msg=message.initStorage(packet.data,len(packet.data),false);msg.cursize=len(packet.data)
  connectionless.dispatch(context.clientState,context.ingressServices,packet.address,msg);return true
end function

/// Calls `mq3.qcommon.net_transport.receive`, `mq3.client.ui_lan_udp.dispatch` from UI LAN udp `pumpSocket`. The final path returns `handled`.
/// @param context context record passed to the UI LAN udp helper calls.
/// @param socket Value used by `packet=transport.receive(socket,PACKET_CAPACITY)`.
/// @param budget Value used by `for index=0 to budget-1`.
function pumpSocket(context,socket,budget)
  handled=0
  for index=0 to budget-1
    packet=transport.receive(socket,PACKET_CAPACITY);if not packet.received then break end if
    if dispatch(context,packet) then handled=handled+1 end if
  end for
  return handled
end function

// Drain bounded work from both Baseq3 source sockets. The NS_SERVER socket is
// needed because CL_GlobalServers_f deliberately sends its master request on it.
/// @param context Record read through `context.active`, `context.clientSocket`, `context.serverSocket`.
/// @param budget Value used by `if context==void or not context.active or budget<1 then return 0 end if`.
function pump(context,budget)
  if context==void or not context.active or budget<1 then return 0 end if
  clientBudget=(budget+1)/2;serverBudget=budget-clientBudget
  handled=pumpSocket(context,context.clientSocket,clientBudget)
  if serverBudget>0 then handled=handled+pumpSocket(context,context.serverSocket,serverBudget) end if
  return handled
end function

/// Updates `context.active` during UI LAN udp `close`.
/// @param context Mutable UI LAN udp record/storage; this routine assigns `context.active`.
function close(context)
  if context==void or not context.active then return false end if
  context.active=false;first=try(udp.close(context.clientSocket));second=try(udp.close(context.serverSocket));cleanup=try(udp.cleanup())
  if first is error then return first end if;if second is error then return second end if;if cleanup is error then return cleanup end if;return true
end function
