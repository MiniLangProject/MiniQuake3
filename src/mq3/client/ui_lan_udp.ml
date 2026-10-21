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
struct Context clientSocket serverSocket ingressServices clientState active end struct

function abandon(clientSocket,serverSocket)
  if clientSocket!=void then ignored=try(udp.close(clientSocket)) end if
  if serverSocket!=void then ignored=try(udp.close(serverSocket)) end if
  ignored=try(udp.cleanup());return void
end function

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

function selectedSocket(context,sock)
  if context==void or not context.active then return error(7702,"UI LAN UDP: inactive host") end if
  if sock!=netchan.NS_CLIENT and sock!=netchan.NS_SERVER then return error(7702,"UI LAN UDP: invalid source socket") end if
  if sock==netchan.NS_SERVER then return context.serverSocket end if
  return context.clientSocket
end function

function sendPacket(context,sock,address,packet)
  socket=selectedSocket(context,sock);return udp.sendTo(socket,transport.addressToEndpoint(address),packet)
end function

function resolveAddress(context,name,port)
  if context==void or not context.active then return void end if
  result=try(transport.resolveIPv4(name,port));if result is error then return void end if;return result
end function

function services(context)
  host=queries.services();host.context=context;host.sendFn=sendPacket;host.resolveFn=resolveAddress;return host
end function

function localEndpoint(context,sock) return udp.localEndpoint(selectedSocket(context,sock)) end function

function isOob(data)
  return data!=void and len(data)>=5 and data[0]==255 and data[1]==255 and data[2]==255 and data[3]==255
end function

function dispatch(context,packet)
  if not packet.received or not isOob(packet.data) then return false end if
  msg=message.initStorage(packet.data,len(packet.data),false);msg.cursize=len(packet.data)
  connectionless.dispatch(context.clientState,context.ingressServices,packet.address,msg);return true
end function

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
function pump(context,budget)
  if context==void or not context.active or budget<1 then return 0 end if
  clientBudget=(budget+1)/2;serverBudget=budget-clientBudget
  handled=pumpSocket(context,context.clientSocket,clientBudget)
  if serverBudget>0 then handled=handled+pumpSocket(context,context.serverSocket,serverBudget) end if
  return handled
end function

function close(context)
  if context==void or not context.active then return false end if
  context.active=false;first=try(udp.close(context.clientSocket));second=try(udp.close(context.serverSocket));cleanup=try(udp.cleanup())
  if first is error then return first end if;if second is error then return second end if;if cleanup is error then return cleanup end if;return true
end function
