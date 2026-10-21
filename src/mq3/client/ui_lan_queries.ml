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
struct StatusRequest address start end struct
struct State browser ingress services realtime maxPing statusResendTime masterHost statusRequests end struct

function services() return Services(void,void,void) end function
function create(browser,ingressState,host)
  if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if
  return State(browser,ingressState,host,0,800,750,MASTER_SERVER_NAME,[])
end function
function setRealtime(state,value) state.realtime=value;ingress.setRealtime(state.ingress,value);return void end function
function setMaxPing(state,value) if value<100 then value=100 end if;state.maxPing=value;return void end function
function setStatusResendTime(state,value) if value<0 then value=0 end if;state.statusResendTime=value;return void end function
function setMasterHost(state,value) state.masterHost=value;return void end function

function oob(text) return bytes([255,255,255,255])+bytes(text) end function
function emit(state,sock,address,text)
  if state==void or state.services==void or state.services.sendFn==void then return error(7700,"UI LAN queries: missing send service") end if
  packet=oob(text);state.services.sendFn(state.services.context,sock,address,packet);return packet
end function

function decimal(text)
  raw=bytes(text);if len(raw)==0 then return -1 end if;value=0
  for each digit in raw if digit<48 or digit>57 then return -1 end if;value=value*10+digit-48 end for
  return value
end function
function numericAddress(text,defaultPort)
  addressParts=strings.split(text,":");if len(addressParts)<1 or len(addressParts)>2 then return void end if
  octets=strings.split(addressParts[0],".");if len(octets)!=4 then return void end if
  ip=[];for each item in octets value=decimal(item);if value<0 or value>255 then return void end if;ip=ip+[value] end for
  port=defaultPort;if len(addressParts)==2 then port=decimal(addressParts[1]) end if
  if port<1 or port>65535 then return void end if
  return netchan.Address(NA_IP,ip,port)
end function

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
function scanLocal(state)
  lan.setList(state.browser,lan.AS_LOCAL,[]);ingress.setPingUpdateSource(state.ingress,lan.AS_LOCAL)
  address=netchan.Address(NA_BROADCAST,[255,255,255,255],PORT_SERVER);sent=0
  for pass=0 to 1 for offset=0 to NUM_SERVER_PORTS-1
    address.port=PORT_SERVER+offset;emit(state,netchan.NS_CLIENT,address,"getinfo xxx");sent=sent+1
  end for end for
  return sent
end function

function keywordText(values)
  result="";if values!=void then for each value in values if value!="" then result=result+" "+value end if end for end if;return result
end function

// CL_GlobalServers_f.  Master #1 fills the MPlayer-compatible catalog, while
// every other value fills the normal global catalog like Baseq3.
function scanGlobal(state,masterNumber,protocol,keywords,restricted)
  address=resolve(state,state.masterHost,PORT_MASTER);if address==void then return false end if
  source=lan.AS_GLOBAL;if masterNumber==1 then source=lan.AS_MPLAYER end if
  lan.setList(state.browser,source,[]);ingress.setMaster(state.ingress,masterNumber);ingress.setPingUpdateSource(state.ingress,source)
  command="getservers "+protocol+keywordText(keywords);if restricted then command=command+" demo" end if
  emit(state,netchan.NS_SERVER,address,command);return true
end function

function pendingPing(state,address)
  wanted=lan.canonicalAddress(address)
  for each value in state.ingress.pendingPings if lan.canonicalAddress(value.address)==wanted then return true end if end for
  return false
end function

function sendPing(state,addressText)
  address=resolve(state,addressText,PORT_SERVER);if address==void then return false end if
  canonical=ingress.addressText(address);if pendingPing(state,canonical) then return false end if
  ingress.requestPing(state.ingress,canonical,state.realtime);lan.setInfoByAddress(state.browser,canonical,void,0)
  emit(state,netchan.NS_CLIENT,address,"getinfo xxx");return true
end function

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

function findStatusRequest(state,address)
  wanted=lan.canonicalAddress(address)
  if len(state.statusRequests)>0 then for index=0 to len(state.statusRequests)-1
    if lan.canonicalAddress(state.statusRequests[index].address)==wanted then return index end if
  end for end if
  return -1
end function

// Stateful LAN_ServerStatus request/resend. A completed response is available
// through ui_lan_browser.serverStatus and is not retransmitted.
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

function resetServerStatus(state,addressText)
  wanted=lan.canonicalAddress(addressText);next=[]
  for each value in state.statusRequests if lan.canonicalAddress(value.address)!=wanted then next=next+[value] end if end for
  state.statusRequests=next;ingress.consumePendingStatus(state.ingress,addressText);return void
end function
