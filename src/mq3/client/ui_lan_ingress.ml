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

/// Quake network protocol version required by this client implementation.
const PROTOCOL_VERSION=68
/// Capacity limit for the serversperpacket collection or bounded storage used by this client module.
const MAX_SERVERSPERPACKET=256
/// Network-address kind identifying a broadcast destination.
const NA_BROADCAST=3
/// Network-address kind identifying a ip destination.
const NA_IP=4

/// Stores UI LAN ingress pending ping record, including `address`, `start`, `queueIndex`.
struct PendingPing
  /// When constructing this record, `requestPing` supplies `address` for this member.
  address
  /// When constructing this record, `requestPing` supplies `start` for this member.
  start
  /// When constructing this record, `requestPing` supplies `index` for this member.
  queueIndex
end struct
/// Stores UI LAN ingress state, including `browser`, `realtime`, `pingUpdateSource`, `masterNum`, `pendingPings`, `pendingStatuses`.
struct State
  /// When constructing this record, `create` supplies `browser` for this member. Used by `requestPing`
  /// and `responseInfo` during subsequent processing.
  browser
  /// Local clock in milliseconds used to measure elapsed time for incoming LAN query responses.
  realtime
  /// When constructing this record, `create` supplies `lan.AS_GLOBAL` for this member. Used by
  /// `setPingUpdateSource` and `responseInfo` during subsequent processing.
  pingUpdateSource
  /// When constructing this record, `create` supplies `0` for this member. Used by `setMaster` and
  /// `responseServers` during subsequent processing.
  masterNum
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `requestPing` and `consumePendingPing` during subsequent processing.
  pendingPings
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `requestStatus` and `consumePendingStatus` during subsequent processing.
  pendingStatuses
end struct

/// Calls `mq3.client.ui_lan_ingress.State` from UI LAN ingress `create`. The final path returns `State(browser,0,lan.AS_GLOBAL,0,[],[])`.
/// @param browser Value used by `if browser==void then return error(7698,"UI LAN ingress: missing browser") end if`.
function create(browser)
  if browser==void then return error(7698,"UI LAN ingress: missing browser") end if
  return State(browser,0,lan.AS_GLOBAL,0,[],[])
end function
/// Updates `state.realtime` during UI LAN ingress `setRealtime`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.realtime`.
/// @param value Value assigned to `state.realtime`.
function setRealtime(state,value) state.realtime=value;return void end function
/// Updates `state.pingUpdateSource` during UI LAN ingress `setPingUpdateSource`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.pingUpdateSource`.
/// @param source Value assigned to `state.pingUpdateSource`.
function setPingUpdateSource(state,source) if lan.validSource(source) then state.pingUpdateSource=source end if;return void end function
/// Updates `state.masterNum` during UI LAN ingress `setMaster`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.masterNum`.
/// @param number Value assigned to `state.masterNum`.
function setMaster(state,number) state.masterNum=number;return void end function

/// Evaluates UI LAN ingress `addressText` and returns `""`, `str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port)` according to its guard/selection conditions.
/// @param address Record read through `address.ip`, `address.port`.
function addressText(address)
  if address==void or len(address.ip)!=4 then return "" end if
  return str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port)
end function
/// Computes `lan.canonicalAddress(left)==lan.canonicalAddress(right)` for UI LAN ingress `sameAddress`.
/// @param left Value used by `return lan.canonicalAddress(left)==lan.canonicalAddress(right)`.
/// @param right Value used by `return lan.canonicalAddress(left)==lan.canonicalAddress(right)`.
function sameAddress(left,right) return lan.canonicalAddress(left)==lan.canonicalAddress(right) end function
/// Evaluates UI LAN ingress `netType` and returns `1`, `0` according to its guard/selection conditions.
/// @param address Record read through `address.type`.
function netType(address) if address!=void and (address.type==NA_IP or address.type==NA_BROADCAST) then return 1 end if;return 0 end function

/// Updates `state.pendingPings` during UI LAN ingress `requestPing`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.pendingPings`.
/// @param address Value used by `index=lan.queuePing(state.browser,address,0,"")`.
/// @param start Value used by `state.pendingPings=state.pendingPings+[PendingPing(address,start,index)]`.
function requestPing(state,address,start)
  index=lan.queuePing(state.browser,address,0,"");state.pendingPings=state.pendingPings+[PendingPing(address,start,index)];return index
end function
/// Updates `state.pendingStatuses` during UI LAN ingress `requestStatus`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.pendingStatuses`.
/// @param address Value used by `wanted=lan.canonicalAddress(address)`.
function requestStatus(state,address)
  wanted=lan.canonicalAddress(address);for each value in state.pendingStatuses if value==wanted then return false end if end for
  state.pendingStatuses=state.pendingStatuses+[wanted];return true
end function
/// Updates `state.pendingStatuses` during UI LAN ingress `consumePendingStatus`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.pendingStatuses`.
/// @param address Value used by `wanted=lan.canonicalAddress(address)`.
function consumePendingStatus(state,address)
  wanted=lan.canonicalAddress(address);found=false;next=[]
  for each value in state.pendingStatuses if not found and value==wanted then found=true else next=next+[value] end if end for
  state.pendingStatuses=next;return found
end function
/// Updates `state.pendingPings` during UI LAN ingress `consumePendingPing`.
/// @param state Mutable UI LAN ingress record/storage; this routine assigns `state.pendingPings`.
/// @param address Value used by `wanted=lan.canonicalAddress(address)`.
function consumePendingPing(state,address)
  wanted=lan.canonicalAddress(address);found=void;next=[]
  for each value in state.pendingPings if found==void and lan.canonicalAddress(value.address)==wanted then found=value else next=next+[value] end if end for
  state.pendingPings=next;return found
end function

/// Calls `mq3.qcommon.message.readCString`, `mq3.compat.textnumbers.atoi`, `mq3.shared.info.value` and additional helpers from UI LAN ingress `responseInfo`. The final path returns `lan.appendDiscovered(state.browser,lan.AS_LOCAL,address,source.type)>=0`.
/// @param host Record read through `host.context`.
/// @param clientState Accepted for compatibility with `responseInfo`; the current implementation does not read it.
/// @param source Record read through `source.type`.
/// @param msg Value used by `text=message.readCString(msg)`.
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

/// Calls `mq3.client.ui_lan_ingress.addressText`, `mq3.client.ui_lan_ingress.consumePendingStatus`, `mq3.qcommon.message.readCStringLine` and additional helpers from UI LAN ingress `responseStatus`.
/// @param host Record read through `host.context`.
/// @param clientState Accepted for compatibility with `responseStatus`; the current implementation does not read it.
/// @param source Value used by `address=addressText(source)`.
/// @param msg Value used by `text=message.readCStringLine(msg)+"\\"`.
function responseStatus(host,clientState,source,msg)
  state=host.context;if state==void then return false end if;address=addressText(source)
  if not consumePendingStatus(state,address) then return false end if
  text=message.readCStringLine(msg)+"\\";line=message.readCStringLine(msg)
  while line!="" text=text+"\\"+line;line=message.readCStringLine(msg) end while
  text=text+"\\";lan.setStatusByAddress(state.browser,address,text);return true
end function

/// Calls `mq3.client.ui_lan_browser.appendDiscovered` from UI LAN ingress `responseServers`. The final path returns `added`.
/// @param host Record read through `host.context`.
/// @param clientState Accepted for compatibility with `responseServers`; the current implementation does not read it.
/// @param source Accepted for compatibility with `responseServers`; the current implementation does not read it.
/// @param msg Record read through `msg.data`, `msg.cursize`.
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

/// Updates `host.context`, `host.infoFn`, `host.statusFn`, `host.serversFn` during UI LAN ingress `attach`.
/// @param host Mutable UI LAN ingress record/storage; this routine assigns `host.context`, `host.infoFn`, `host.statusFn`, `host.serversFn`.
/// @param state Value assigned to `host.context`.
function attach(host,state)
  if host==void or state==void then return error(7698,"UI LAN ingress: missing services") end if
  host.context=state;host.infoFn=responseInfo;host.statusFn=responseStatus;host.serversFn=responseServers;return host
end function
/// Adapts `mq3.client.ui_lan_ingress.attach` to UI LAN ingress `services`, returning its result for `connectionless.services(), state`.
/// @param state Argument 2 of `mq3.client.ui_lan_ingress.attach`.
function services(state) return attach(connectionless.services(),state) end function
