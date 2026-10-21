// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful host side of the UI LAN_* traps from client/cl_ui.c.
package mq3.client.ui_lan_browser

import std.string as strings
import mq3.shared.info as info

const AS_LOCAL=0
const AS_MPLAYER=1
const AS_GLOBAL=2
const AS_FAVORITES=3
const MAX_OTHER_SERVERS=128
const MAX_GLOBAL_SERVERS=4096
const SORT_HOST=0
const SORT_MAP=1
const SORT_CLIENTS=2
const SORT_GAME=3
const SORT_PING=4

struct Server address hostName mapName clients maxClients ping minPing maxPing game gameType netType punkbuster visible status end struct
struct Ping address time info end struct
struct State local mplayer globalServers favorites pings cachedMplayer cachedGlobal cachedFavorites end struct

function create() return State([],[],[],[],[],[],[],[]) end function
function server(address,name) return Server(address,name,"",0,0,-1,0,0,"",0,0,0,true,void) end function
function ping(address,time,text) return Ping(address,time,text) end function

function list(state,source)
  if source==AS_LOCAL then return state.local end if
  if source==AS_MPLAYER then return state.mplayer end if
  if source==AS_GLOBAL then return state.globalServers end if
  if source==AS_FAVORITES then return state.favorites end if
  return void
end function
function setList(state,source,values)
  if source==AS_LOCAL then state.local=values
  else if source==AS_MPLAYER then state.mplayer=values
  else if source==AS_GLOBAL then state.globalServers=values
  else if source==AS_FAVORITES then state.favorites=values end if
  return void
end function
function maximum(source) if source==AS_GLOBAL then return MAX_GLOBAL_SERVERS end if;return MAX_OTHER_SERVERS end function
function validSource(source) return source>=AS_LOCAL and source<=AS_FAVORITES end function

// NET_CompareAdr compares the parsed address. For the UI-owned catalog the
// canonical case-insensitive text form gives stable duplicate behaviour until
// a network transport supplies a richer netadr_t value.
function canonicalAddress(address) return strings.toLowerAscii(address) end function
function add(state,source,name,address)
  values=list(state,source);if values==void or len(values)>=maximum(source) then return -1 end if
  wanted=canonicalAddress(address)
  for each item in values if canonicalAddress(item.address)==wanted then return 0 end if end for
  setList(state,source,values+[server(address,name)]);return 1
end function
function remove(state,source,address)
  values=list(state,source);if values==void then return void end if
  wanted=canonicalAddress(address);result=[];removed=false
  for each item in values
    if not removed and canonicalAddress(item.address)==wanted then removed=true else result=result+[item] end if
  end for
  setList(state,source,result);return void
end function
function count(state,source) values=list(state,source);if values==void then return 0 end if;return len(values) end function
function at(state,source,index) values=list(state,source);if values==void or index<0 or index>=len(values) then return void end if;return values[index] end function
function address(state,source,index) value=at(state,source,index);if value==void then return "" end if;return value.address end function
function serverPing(state,source,index) value=at(state,source,index);if value==void then return -1 end if;return value.ping end function

function putInfo(text,key,value)
  result=info.setValue(text,key,value,void,void);if result is error then return text end if;return result
end function
function serverInfo(state,source,index)
  value=at(state,source,index);if value==void then return "" end if;result=""
  result=putInfo(result,"hostname",value.hostName);result=putInfo(result,"mapname",value.mapName)
  result=putInfo(result,"clients",str(value.clients));result=putInfo(result,"sv_maxclients",str(value.maxClients))
  result=putInfo(result,"ping",str(value.ping));result=putInfo(result,"minping",str(value.minPing));result=putInfo(result,"maxping",str(value.maxPing))
  result=putInfo(result,"game",value.game);result=putInfo(result,"gametype",str(value.gameType));result=putInfo(result,"nettype",str(value.netType))
  result=putInfo(result,"addr",value.address);return putInfo(result,"punkbuster",str(value.punkbuster))
end function

function markVisible(state,source,index,visible)
  values=list(state,source);if values==void then return void end if
  if index== -1 then for each item in values item.visible=visible end for
  else if index>=0 and index<len(values) then values[index].visible=visible end if
  return void
end function
function isVisible(state,source,index) value=at(state,source,index);return value!=void and value.visible end function
function resetPings(state,source) values=list(state,source);if values!=void then for each item in values item.ping=-1 end for end if;return void end function

function queuePing(state,address,time,text) state.pings=state.pings+[Ping(address,time,text)];return len(state.pings)-1 end function
function pingCount(state) return len(state.pings) end function
function clearPing(state,index)
  if index<0 or index>=len(state.pings) then return void end if
  result=[];for cursor=0 to len(state.pings)-1 if cursor!=index then result=result+[state.pings[cursor]] end if end for;state.pings=result;return void
end function
function getPing(state,index) if index<0 or index>=len(state.pings) then return ["",0] end if;value=state.pings[index];return [value.address,value.time] end function
function getPingInfo(state,index) if index<0 or index>=len(state.pings) then return "" end if;return state.pings[index].info end function

// CL_SetServerInfo and CL_SetServerInfoByAddress.  The packet ingress keeps
// parsing separate from the catalog, while these helpers retain Baseq3's
// useful property that one reply updates the same address in every source.
function applyInfo(value,text,pingTime)
  if value==void then return false end if
  if text!=void then
    value.clients=toNumber(info.value(text,"clients"));value.hostName=info.value(text,"hostname");value.mapName=info.value(text,"mapname")
    value.maxClients=toNumber(info.value(text,"sv_maxclients"));value.game=info.value(text,"game");value.gameType=toNumber(info.value(text,"gametype"))
    value.netType=toNumber(info.value(text,"nettype"));value.minPing=toNumber(info.value(text,"minping"));value.maxPing=toNumber(info.value(text,"maxping"));value.punkbuster=toNumber(info.value(text,"punkbuster"))
  end if
  value.ping=pingTime;return true
end function
function setInfoByAddress(state,address,text,pingTime)
  wanted=canonicalAddress(address);updated=0
  for source=AS_LOCAL to AS_FAVORITES
    for each value in list(state,source)
      if canonicalAddress(value.address)==wanted then if applyInfo(value,text,pingTime) then updated=updated+1 end if end if
    end for
  end for
  return updated
end function
function appendDiscovered(state,source,address,netType)
  values=list(state,source);if values==void or len(values)>=maximum(source) then return -1 end if
  value=server(address,"");value.netType=netType;setList(state,source,values+[value]);return len(values)
end function
function findAddress(state,source,address)
  values=list(state,source);if values==void or len(values)==0 then return -1 end if;wanted=canonicalAddress(address)
  for index=0 to len(values)-1 if canonicalAddress(values[index].address)==wanted then return index end if end for
  return -1
end function
function completePing(state,index,time,text)
  if index<0 or index>=len(state.pings) then return false end if
  state.pings[index].time=time;state.pings[index].info=text;return true
end function
function setStatusByAddress(state,address,text)
  wanted=canonicalAddress(address);updated=0
  for source=AS_LOCAL to AS_FAVORITES
    for each value in list(state,source) if canonicalAddress(value.address)==wanted then value.status=text;updated=updated+1 end if end for
  end for
  return updated
end function

// A transport calls updateServer when an infoResponse arrives. Keeping this
// mutation here makes every LAN query see one coherent serverInfo_t analogue.
function updateServer(state,source,index,mapName,clients,maxClients,pingTime,minPing,maxPing,game,gameType,netType,punkbuster,status)
  value=at(state,source,index);if value==void then return false end if
  value.mapName=mapName;value.clients=clients;value.maxClients=maxClients;value.ping=pingTime;value.minPing=minPing;value.maxPing=maxPing
  value.game=game;value.gameType=gameType;value.netType=netType;value.punkbuster=punkbuster;value.status=status;return true
end function
function updateVisiblePings(state,source)
  values=list(state,source);if values==void then return false end if
  for each value in values if value.visible and value.ping<0 then return true end if end for;return false
end function
function serverStatus(state,address)
  wanted=canonicalAddress(address)
  for source=AS_LOCAL to AS_FAVORITES for each value in list(state,source) if canonicalAddress(value.address)==wanted then return value.status end if end for end for
  return void
end function

function cloneServer(value) return Server(value.address,value.hostName,value.mapName,value.clients,value.maxClients,value.ping,value.minPing,value.maxPing,value.game,value.gameType,value.netType,value.punkbuster,value.visible,value.status) end function
function copyList(values) result=[];for each value in values result=result+[cloneServer(value)] end for;return result end function
function save(state) state.cachedGlobal=copyList(state.globalServers);state.cachedMplayer=copyList(state.mplayer);state.cachedFavorites=copyList(state.favorites);return void end function
function load(state) state.globalServers=copyList(state.cachedGlobal);state.mplayer=copyList(state.cachedMplayer);state.favorites=copyList(state.cachedFavorites);return void end function

function compareText(left,right)
  a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));limit=len(a);if len(b)<limit then limit=len(b) end if
  for index=0 to limit-1 if a[index]<b[index] then return -1 end if;if a[index]>b[index] then return 1 end if end for
  if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0
end function
function compareNumber(left,right) if left<right then return -1 end if;if left>right then return 1 end if;return 0 end function
function compare(state,source,sortKey,sortDir,first,second)
  a=at(state,source,first);b=at(state,source,second);if a==void or b==void then return 0 end if;result=0
  if sortKey==SORT_HOST then result=compareText(a.hostName,b.hostName)
  else if sortKey==SORT_MAP then result=compareText(a.mapName,b.mapName)
  else if sortKey==SORT_CLIENTS then result=compareNumber(a.clients,b.clients)
  else if sortKey==SORT_GAME then result=compareNumber(a.gameType,b.gameType)
  else if sortKey==SORT_PING then result=compareNumber(a.ping,b.ping) end if
  if sortDir!=0 then return -result end if;return result
end function
