// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Transport-neutral CL_ServerInfoPacket / CL_ServerStatusResponse /
// CL_ServersResponsePacket ingress for the stateful UI LAN backend.
package mq3.client.ui_lan_ingress

import mq3.client.connectionless as connectionless
import mq3.client.ui_lan_browser as lan
import mq3.qcommon.message as message
import mq3.shared.info as info
import mq3.compat.textnumbers as textnumbers

const PROTOCOL_VERSION=68
const MAX_SERVERSPERPACKET=256
const NA_BROADCAST=3
const NA_IP=4

struct PendingPing address start queueIndex end struct
struct State browser realtime pingUpdateSource masterNum pendingPings pendingStatuses end struct

function create(browser)
  if browser==void then return error(7698,"UI LAN ingress: missing browser") end if
  return State(browser,0,lan.AS_GLOBAL,0,[],[])
end function
function setRealtime(state,value) state.realtime=value;return void end function
function setPingUpdateSource(state,source) if lan.validSource(source) then state.pingUpdateSource=source end if;return void end function
function setMaster(state,number) state.masterNum=number;return void end function

function addressText(address)
  if address==void or len(address.ip)!=4 then return "" end if
  return str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port)
end function
function sameAddress(left,right) return lan.canonicalAddress(left)==lan.canonicalAddress(right) end function
function netType(address) if address!=void and (address.type==NA_IP or address.type==NA_BROADCAST) then return 1 end if;return 0 end function

function requestPing(state,address,start)
  index=lan.queuePing(state.browser,address,0,"");state.pendingPings=state.pendingPings+[PendingPing(address,start,index)];return index
end function
function requestStatus(state,address)
  wanted=lan.canonicalAddress(address);for each value in state.pendingStatuses if value==wanted then return false end if end for
  state.pendingStatuses=state.pendingStatuses+[wanted];return true
end function
function consumePendingStatus(state,address)
  wanted=lan.canonicalAddress(address);found=false;next=[]
  for each value in state.pendingStatuses if not found and value==wanted then found=true else next=next+[value] end if end for
  state.pendingStatuses=next;return found
end function
function consumePendingPing(state,address)
  wanted=lan.canonicalAddress(address);found=void;next=[]
  for each value in state.pendingPings if found==void and lan.canonicalAddress(value.address)==wanted then found=value else next=next+[value] end if end for
  state.pendingPings=next;return found
end function

function responseInfo(host,clientState,source,msg)
  state=host.context;if state==void then return false end if
  text=message.readCString(msg);if textnumbers.atoi(info.value(text,"protocol"))!=PROTOCOL_VERSION then return false end if
  address=addressText(source);pending=consumePendingPing(state,address)
  if pending!=void then
    elapsed=state.realtime-pending.start+1;if elapsed<1 then elapsed=1 end if
    pingInfo=lan.putInfo(text,"nettype",str(netType(source)));lan.completePing(state.browser,pending.queueIndex,elapsed,pingInfo)
    lan.setInfoByAddress(state.browser,address,text,elapsed);return true
  end if
  if state.pingUpdateSource!=lan.AS_LOCAL then return false end if
  if lan.findAddress(state.browser,lan.AS_LOCAL,address)>=0 then return false end if
  return lan.appendDiscovered(state.browser,lan.AS_LOCAL,address,source.type)>=0
end function

function responseStatus(host,clientState,source,msg)
  state=host.context;if state==void then return false end if;address=addressText(source)
  if not consumePendingStatus(state,address) then return false end if
  text=message.readCStringLine(msg)+"\\";line=message.readCStringLine(msg)
  while line!="" text=text+"\\"+line;line=message.readCStringLine(msg) end while
  text=text+"\\";lan.setStatusByAddress(state.browser,address,text);return true
end function

function responseServers(host,clientState,source,msg)
  state=host.context;if state==void then return 0 end if
  raw=msg.data;limit=msg.cursize;if len(raw)<limit then limit=len(raw) end if;cursor=0;parsed=0;added=0
  target=lan.AS_GLOBAL;if state.masterNum!=0 then target=lan.AS_MPLAYER end if
  while cursor+1<limit and parsed<MAX_SERVERSPERPACKET
    found=false
    while cursor<limit and not found if raw[cursor]==92 then found=true end if;cursor=cursor+1 end while
    if not found or cursor>=limit-6 then break end if
    a=raw[cursor];b=raw[cursor+1];c=raw[cursor+2];d=raw[cursor+3];port=(raw[cursor+4]<<8)|raw[cursor+5];cursor=cursor+6
    if raw[cursor]!=92 then break end if
    address=str(a)+"."+str(b)+"."+str(c)+"."+str(d)+":"+str(port)
    if lan.appendDiscovered(state.browser,target,address,0)>=0 then added=added+1 end if;parsed=parsed+1
    if cursor+3<limit and raw[cursor+1]==69 and raw[cursor+2]==79 and raw[cursor+3]==84 then break end if
  end while
  return added
end function

function attach(host,state)
  if host==void or state==void then return error(7698,"UI LAN ingress: missing services") end if
  host.context=state;host.infoFn=responseInfo;host.statusFn=responseStatus;host.serversFn=responseServers;return host
end function
function services(state) return attach(connectionless.services(),state) end function
