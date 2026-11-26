// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Transport-neutral outbound half of the Baseq3 LAN browser.  Packet ingress
// remains in ui_lan_ingress; a platform host only has to provide resolve/send.
package mq3.client.ui_lan_queries

import std.string as strings
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_ingress as ingress
import mq3.qcommon.netchan as netchan

const PORT_MASTER=27950
const PORT_SERVER=27960
const NUM_SERVER_PORTS=4
const MAX_PINGREQUESTS=32
const NA_BROADCAST=3
const NA_IP=4
const MASTER_SERVER_NAME="master.quake3arena.com"

// sendFn(context,sock,address,packet) owns the actual UDP socket. resolveFn
// returns a netchan.Address and is only needed for DNS names.
struct Services sendFn resolveFn context end struct
/// Stores UI LAN queries status request record, including `address`, `start`.
struct StatusRequest address start end struct
/// Stores UI LAN queries state, including `browser`, `ingress`, `services`, `realtime`, `maxPing`, `statusResendTime` and additional values.
struct State browser ingress services realtime maxPing statusResendTime masterHost statusRequests end struct

/// Creates a `mq3.client.ui_lan_queries.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void) end function
/// Calls `mq3.client.ui_lan_queries.State` from UI LAN queries `create`. The final path returns `State(browser,ingressState,host,0,800,750,MASTER_SERVER_NAME,[])`.
/// @param browser Value used by `if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if`.
/// @param ingressState Value used by `if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if`.
/// @param host host record passed to the UI LAN queries helper calls.
function create(browser,ingressState,host)
  if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if
  return State(browser,ingressState,host,0,800,750,MASTER_SERVER_NAME,[])
end function
/// Updates `state.realtime` during UI LAN queries `setRealtime`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.realtime`.
/// @param value Value assigned to `state.realtime`.
function setRealtime(state,value) state.realtime=value;ingress.setRealtime(state.ingress,value);return void end function
/// Updates `state.maxPing` during UI LAN queries `setMaxPing`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.maxPing`.
/// @param value Value assigned to `state.maxPing`.
function setMaxPing(state,value) if value<100 then value=100 end if;state.maxPing=value;return void end function
/// Updates `state.statusResendTime` during UI LAN queries `setStatusResendTime`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.statusResendTime`.
/// @param value Value assigned to `state.statusResendTime`.
function setStatusResendTime(state,value) if value<0 then value=0 end if;state.statusResendTime=value;return void end function
/// Updates `state.masterHost` during UI LAN queries `setMasterHost`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.masterHost`.
/// @param value Value assigned to `state.masterHost`.
function setMasterHost(state,value) state.masterHost=value;return void end function

/// Computes `bytes([255,255,255,255])+bytes(text)` for UI LAN queries `oob`.
/// @param text Text consumed or emitted by `oob` in the UI LAN queries path.
function oob(text) return bytes([255,255,255,255])+bytes(text) end function
/// Calls `mq3.client.ui_lan_queries.oob`, `state.services.sendFn` from UI LAN queries `emit`. The final path returns `packet`.
/// @param state Record read through `state.services`, `state.services.sendFn`, `state.services.context`.
/// @param sock Value used by `state.services.sendFn(state.services.context,sock,address,packet)`.
/// @param address Value used by `state.services.sendFn(state.services.context,sock,address,packet)`.
/// @param text Text consumed or emitted by `emit` in the UI LAN queries path.
function emit(state,sock,address,text)
  if state==void or state.services==void or state.services.sendFn==void then return error(7700,"UI LAN queries: missing send service") end if
  packet=oob(text);state.services.sendFn(state.services.context,sock,address,packet);return packet
end function

/// Evaluates UI LAN queries `decimal` and returns `-1`, `value` according to its guard/selection conditions.
/// @param text Text consumed or emitted by `decimal` in the UI LAN queries path.
function decimal(text)
  raw=bytes(text);if len(raw)==0 then return -1 end if;value=0
  for each digit in raw if digit<48 or digit>57 then return -1 end if;value=value*10+digit-48 end for
  return value
end function
/// Calls `std.string.split`, `mq3.client.ui_lan_queries.decimal`, `mq3.qcommon.netchan.Address` from UI LAN queries `numericAddress`. The final path returns `netchan.Address(NA_IP,ip,port)`.
/// @param text Text consumed or emitted by `numericAddress` in the UI LAN queries path.
/// @param defaultPort Value used by `port=defaultPort`.
function numericAddress(text,defaultPort)
  addressParts=strings.split(text,":");if len(addressParts)<1 or len(addressParts)>2 then return void end if
  octets=strings.split(addressParts[0],".");if len(octets)!=4 then return void end if
  ip=[];for each item in octets value=decimal(item);if value<0 or value>255 then return void end if;ip=ip+[value] end for
  port=defaultPort;if len(addressParts)==2 then port=decimal(addressParts[1]) end if
  if port<1 or port>65535 then return void end if
  return netchan.Address(NA_IP,ip,port)
end function

/// Calls `mq3.client.ui_lan_queries.numericAddress`, `std.string.split`, `mq3.client.ui_lan_queries.decimal` and additional helpers from UI LAN queries `resolve`. The final path returns `state.services.resolveFn(state.services.context,name,port)`.
/// @param state Record read through `state.services`, `state.services.resolveFn`, `state.services.context`.
/// @param text Text consumed or emitted by `resolve` in the UI LAN queries path.
/// @param defaultPort Value used by `address=numericAddress(text,defaultPort)`.
function resolve(state,text,defaultPort)
  address=numericAddress(text,defaultPort);if address!=void then return address end if
  name=text;port=defaultPort;parts=strings.split(text,":")
  if len(parts)>2 then return void end if
  if len(parts)==2 then name=parts[0];port=decimal(parts[1]);if name=="" or port<1 or port>65535 then return void end if end if
  if state.services!=void and state.services.resolveFn!=void then return state.services.resolveFn(state.services.context,name,port) end if
  return void
end function

// CL_LocalServers_f: two IPv4 broadcasts on each of the four consecutive
// server ports.  The legacy IPX duplicate has no counterpart in this port.
/// @param state Record read through `state.browser`, `state.ingress`.
function scanLocal(state)
  lan.setList(state.browser,lan.AS_LOCAL,[]);ingress.setPingUpdateSource(state.ingress,lan.AS_LOCAL)
  address=netchan.Address(NA_BROADCAST,[255,255,255,255],PORT_SERVER);sent=0
  for pass=0 to 1 for offset=0 to NUM_SERVER_PORTS-1
    address.port=PORT_SERVER+offset;emit(state,netchan.NS_CLIENT,address,"getinfo xxx");sent=sent+1
  end for end for
  return sent
end function

/// Evaluates UI LAN queries `keywordText` and returns `result` according to its guard/selection conditions.
/// @param values Value used by `if values!=void then for each value in values if value!="" then result=result+" "+value end if end for end if`.
function keywordText(values)
  result="";if values!=void then for each value in values if value!="" then result=result+" "+value end if end for end if;return result
end function

// CL_GlobalServers_f.  Master #1 fills the MPlayer-compatible catalog, while
// every other value fills the normal global catalog like Baseq3.
/// @param state Record read through `state.masterHost`, `state.browser`, `state.ingress`.
/// @param masterNumber Value used by `if masterNumber==1 then source=lan.AS_MPLAYER end if`.
/// @param protocol Value used by `command="getservers "+protocol+keywordText(keywords)`.
/// @param keywords Value used by `command="getservers "+protocol+keywordText(keywords)`.
/// @param restricted Value used by `if restricted then command=command+" demo" end if`.
function scanGlobal(state,masterNumber,protocol,keywords,restricted)
  address=resolve(state,state.masterHost,PORT_MASTER);if address==void then return false end if
  source=lan.AS_GLOBAL;if masterNumber==1 then source=lan.AS_MPLAYER end if
  lan.setList(state.browser,source,[]);ingress.setMaster(state.ingress,masterNumber);ingress.setPingUpdateSource(state.ingress,source)
  command="getservers "+protocol+keywordText(keywords);if restricted then command=command+" demo" end if
  emit(state,netchan.NS_SERVER,address,command);return true
end function

/// Calls `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN queries `pendingPing`.
/// @param state Record read through `state.ingress.pendingPings`.
/// @param address Value used by `wanted=lan.canonicalAddress(address)`.
function pendingPing(state,address)
  wanted=lan.canonicalAddress(address)
  for each value in state.ingress.pendingPings if lan.canonicalAddress(value.address)==wanted then return true end if end for
  return false
end function

/// Calls `mq3.client.ui_lan_queries.resolve`, `mq3.client.ui_lan_ingress.addressText`, `mq3.client.ui_lan_queries.pendingPing` and additional helpers from UI LAN queries `sendPing`.
/// @param state Record read through `state.ingress`, `state.realtime`, `state.browser`.
/// @param addressText Value used by `address=resolve(state,addressText,PORT_SERVER)`.
function sendPing(state,addressText)
  address=resolve(state,addressText,PORT_SERVER);if address==void then return false end if
  canonical=ingress.addressText(address);if pendingPing(state,canonical) then return false end if
  ingress.requestPing(state.ingress,canonical,state.realtime);lan.setInfoByAddress(state.browser,canonical,void,0)
  emit(state,netchan.NS_CLIENT,address,"getinfo xxx");return true
end function

/// Updates `state.ingress.pendingPings` during UI LAN queries `expirePings`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.ingress.pendingPings`.
function expirePings(state)
  remaining=[];expired=0
  for each pending in state.ingress.pendingPings
    elapsed=state.realtime-pending.start
    if elapsed>=state.maxPing then
      lan.completePing(state.browser,pending.queueIndex,elapsed,"");lan.setInfoByAddress(state.browser,pending.address,void,0);expired=expired+1
    else remaining=remaining+[pending] end if
  end for
  state.ingress.pendingPings=remaining;return expired
end function

// Schedule the visible unresolved servers just as CL_UpdateVisiblePings_f
// does. Completed replies are consumed by ui_lan_ingress.responseInfo.
/// @param state Record read through `state.ingress`, `state.ingress.pendingPings`, `state.browser`.
/// @param source Value used by `if not lan.validSource(source) then return false end if`.
function updateVisiblePings(state,source)
  if not lan.validSource(source) then return false end if
  ingress.setPingUpdateSource(state.ingress,source);expired=expirePings(state);active=len(state.ingress.pendingPings);work=active>0 or expired>0
  values=lan.list(state.browser,source)
  if values!=void and active<MAX_PINGREQUESTS then
    for each value in values
      if active>=MAX_PINGREQUESTS then break end if
      if value.visible and value.ping== -1 and not pendingPing(state,value.address) then
        if sendPing(state,value.address) then active=active+1;work=true end if
      end if
    end for
  end if
  return work
end function

/// Calls `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN queries `findStatusRequest`. The final path returns `-1`.
/// @param state Record read through `state.statusRequests`.
/// @param address Value used by `wanted=lan.canonicalAddress(address)`.
function findStatusRequest(state,address)
  wanted=lan.canonicalAddress(address)
  if len(state.statusRequests)>0 then for index=0 to len(state.statusRequests)-1
    if lan.canonicalAddress(state.statusRequests[index].address)==wanted then return index end if
  end for end if
  return -1
end function

// Stateful LAN_ServerStatus request/resend. A completed response is available
// through ui_lan_browser.serverStatus and is not retransmitted.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.statusRequests`.
/// @param addressText Value used by `current=lan.serverStatus(state.browser,addressText)`.
function serverStatus(state,addressText)
  current=lan.serverStatus(state.browser,addressText);if current!=void then return current end if
  address=resolve(state,addressText,PORT_SERVER);if address==void then return void end if;canonical=ingress.addressText(address)
  index=findStatusRequest(state,canonical)
  if index<0 then
    ingress.requestStatus(state.ingress,canonical);state.statusRequests=state.statusRequests+[StatusRequest(canonical,state.realtime)]
    emit(state,netchan.NS_CLIENT,address,"getstatus");return void
  end if
  request=state.statusRequests[index]
  if request.start<state.realtime-state.statusResendTime then request.start=state.realtime;emit(state,netchan.NS_CLIENT,address,"getstatus") end if
  return void
end function

/// Updates `state.statusRequests` during UI LAN queries `resetServerStatus`.
/// @param state Mutable UI LAN queries record/storage; this routine assigns `state.statusRequests`.
/// @param addressText Value used by `wanted=lan.canonicalAddress(addressText)`.
function resetServerStatus(state,addressText)
  wanted=lan.canonicalAddress(addressText);next=[]
  for each value in state.statusRequests if lan.canonicalAddress(value.address)!=wanted then next=next+[value] end if end for
  state.statusRequests=next;ingress.consumePendingStatus(state.ingress,addressText);return void
end function
