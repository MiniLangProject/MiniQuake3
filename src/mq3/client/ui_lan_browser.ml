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

/// Stores UI LAN browser server record, including `address`, `hostName`, `mapName`, `clients`, `maxClients`, `ping` and additional values.
struct Server address hostName mapName clients maxClients ping minPing maxPing game gameType netType punkbuster visible status end struct
/// Stores UI LAN browser ping record, including `address`, `time`, `info`.
struct Ping address time info end struct
/// Stores UI LAN browser state, including `local`, `mplayer`, `globalServers`, `favorites`, `pings`, `cachedMplayer` and additional values.
struct State local mplayer globalServers favorites pings cachedMplayer cachedGlobal cachedFavorites end struct

/// Creates a `mq3.client.ui_lan_browser.State` record. Initializes the record with the defaults written in this constructor.
function create() return State([],[],[],[],[],[],[],[]) end function
/// Creates a `mq3.client.ui_lan_browser.Server` record. Assigns `address` from `address`, `hostName` from `name`.
/// @param address Value used to initialize `Server.address`.
/// @param name Value used to initialize `Server.hostName`.
function server(address,name) return Server(address,name,"",0,0,-1,0,0,"",0,0,0,true,void) end function
/// Creates a `mq3.client.ui_lan_browser.Ping` record. Assigns `address` from `address`, `time` from `time`, `info` from `text`.
/// @param address Value used to initialize `Ping.address`.
/// @param time Value used to initialize `Ping.time`.
/// @param text Value used to initialize `Ping.info`.
function ping(address,time,text) return Ping(address,time,text) end function

/// Evaluates UI LAN browser `list` and returns `state.local`, `state.mplayer`, `state.globalServers` and additional values according to its guard/selection conditions.
/// @param state Record read through `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`.
/// @param source Value used by `if source==AS_LOCAL then return state.local end if`.
function list(state,source)
  if source==AS_LOCAL then return state.local end if
  if source==AS_MPLAYER then return state.mplayer end if
  if source==AS_GLOBAL then return state.globalServers end if
  if source==AS_FAVORITES then return state.favorites end if
  return void
end function
/// Updates `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites` during UI LAN browser `setList`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`.
/// @param source Value used by `if source==AS_LOCAL then state.local=values`.
/// @param values Value assigned to `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`.
function setList(state,source,values)
  if source==AS_LOCAL then state.local=values
  else if source==AS_MPLAYER then state.mplayer=values
  else if source==AS_GLOBAL then state.globalServers=values
  else if source==AS_FAVORITES then state.favorites=values end if
  return void
end function
/// Evaluates UI LAN browser `maximum` and returns `MAX_GLOBAL_SERVERS`, `MAX_OTHER_SERVERS` according to its guard/selection conditions.
/// @param source Value used by `if source==AS_GLOBAL then return MAX_GLOBAL_SERVERS end if`.
function maximum(source) if source==AS_GLOBAL then return MAX_GLOBAL_SERVERS end if;return MAX_OTHER_SERVERS end function
/// Computes `source>=AS_LOCAL and source<=AS_FAVORITES` for UI LAN browser `validSource`.
/// @param source Value used by `return source>=AS_LOCAL and source<=AS_FAVORITES`.
function validSource(source) return source>=AS_LOCAL and source<=AS_FAVORITES end function

// NET_CompareAdr compares the parsed address. For the UI-owned catalog the
// canonical case-insensitive text form gives stable duplicate behaviour until
// a network transport supplies a richer netadr_t value.
/// @param address Argument 1 of `std.string.toLowerAscii`.
function canonicalAddress(address) return strings.toLowerAscii(address) end function
/// Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.maximum`, `mq3.client.ui_lan_browser.canonicalAddress` and additional helpers from UI LAN browser `add`. The final path returns `1`.
/// @param state Shared UI LAN browser state passed to the helper calls in `add`.
/// @param source Value used by `values=list(state,source)`.
/// @param name Name used to select or register the corresponding UI LAN browser resource.
/// @param address Value used by `wanted=canonicalAddress(address)`.
function add(state,source,name,address)
  values=list(state,source);if values==void or len(values)>=maximum(source) then return -1 end if
  wanted=canonicalAddress(address)
  for each item in values if canonicalAddress(item.address)==wanted then return 0 end if end for
  setList(state,source,values+[server(address,name)]);return 1
end function
/// Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.setList` from UI LAN browser `remove`.
/// @param state Shared UI LAN browser state passed to the helper calls in `remove`.
/// @param source Value used by `values=list(state,source)`.
/// @param address Value used by `wanted=canonicalAddress(address)`.
function remove(state,source,address)
  values=list(state,source);if values==void then return void end if
  wanted=canonicalAddress(address);result=[];removed=false
  for each item in values
    if not removed and canonicalAddress(item.address)==wanted then removed=true else result=result+[item] end if
  end for
  setList(state,source,result);return void
end function
/// Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `count`. The final path returns `len(values)`.
/// @param state Shared UI LAN browser state passed to the helper calls in `count`.
/// @param source Value used by `values=list(state,source)`.
function count(state,source) values=list(state,source);if values==void then return 0 end if;return len(values) end function
/// Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `at`. The final path returns `values[index]`.
/// @param state Shared UI LAN browser state passed to the helper calls in `at`.
/// @param source Value used by `values=list(state,source)`.
/// @param index Value tested by `values==void or index<0 or index>=len(values)` before the calculation continues.
function at(state,source,index) values=list(state,source);if values==void or index<0 or index>=len(values) then return void end if;return values[index] end function
/// Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `address`. The final path returns `value.address`.
/// @param state Shared UI LAN browser state passed to the helper calls in `address`.
/// @param source Value used by `value=at(state,source,index)`.
/// @param index Value used by `value=at(state,source,index)`.
function address(state,source,index) value=at(state,source,index);if value==void then return "" end if;return value.address end function
/// Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `serverPing`. The final path returns `value.ping`.
/// @param state Shared UI LAN browser state passed to the helper calls in `serverPing`.
/// @param source Value used by `value=at(state,source,index)`.
/// @param index Value used by `value=at(state,source,index)`.
function serverPing(state,source,index) value=at(state,source,index);if value==void then return -1 end if;return value.ping end function

/// Calls `mq3.shared.info.setValue` from UI LAN browser `putInfo`. The final path returns `result`.
/// @param text Text consumed or emitted by `putInfo` in the UI LAN browser path.
/// @param key Key or control identifier used to select the corresponding UI LAN browser entry.
/// @param value Value used by `result=info.setValue(text,key,value,void,void)`.
function putInfo(text,key,value)
  result=info.setValue(text,key,value,void,void);if result is error then return text end if;return result
end function
/// Calls `mq3.client.ui_lan_browser.at`, `mq3.client.ui_lan_browser.putInfo` from UI LAN browser `serverInfo`. The final path returns `putInfo(result,"punkbuster",str(value.punkbuster))`.
/// @param state Shared UI LAN browser state passed to the helper calls in `serverInfo`.
/// @param source Value used by `value=at(state,source,index)`.
/// @param index Value used by `value=at(state,source,index)`.
function serverInfo(state,source,index)
  value=at(state,source,index);if value==void then return "" end if;result=""
  result=putInfo(result,"hostname",value.hostName);result=putInfo(result,"mapname",value.mapName)
  result=putInfo(result,"clients",str(value.clients));result=putInfo(result,"sv_maxclients",str(value.maxClients))
  result=putInfo(result,"ping",str(value.ping));result=putInfo(result,"minping",str(value.minPing));result=putInfo(result,"maxping",str(value.maxPing))
  result=putInfo(result,"game",value.game);result=putInfo(result,"gametype",str(value.gameType));result=putInfo(result,"nettype",str(value.netType))
  result=putInfo(result,"addr",value.address);return putInfo(result,"punkbuster",str(value.punkbuster))
end function

/// Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `markVisible`.
/// @param state Shared UI LAN browser state passed to the helper calls in `markVisible`.
/// @param source Value used by `values=list(state,source)`.
/// @param index Value tested by `if index== -1`, `index>=0 and index<len(values)` before the calculation continues.
/// @param visible Value assigned to `item.visible`.
function markVisible(state,source,index,visible)
  values=list(state,source);if values==void then return void end if
  if index== -1 then for each item in values item.visible=visible end for
  else if index>=0 and index<len(values) then values[index].visible=visible end if
  return void
end function
/// Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `isVisible`. The final path returns `value!=void and value.visible`.
/// @param state Shared UI LAN browser state passed to the helper calls in `isVisible`.
/// @param source Value used by `value=at(state,source,index)`.
/// @param index Value used by `value=at(state,source,index)`.
function isVisible(state,source,index) value=at(state,source,index);return value!=void and value.visible end function
/// Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `resetPings`.
/// @param state Shared UI LAN browser state passed to the helper calls in `resetPings`.
/// @param source Value used by `values=list(state,source)`.
function resetPings(state,source) values=list(state,source);if values!=void then for each item in values item.ping=-1 end for end if;return void end function

/// Updates `state.pings` during UI LAN browser `queuePing`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.pings`.
/// @param address Value used by `state.pings=state.pings+[Ping(address,time,text)]`.
/// @param time Value used by `state.pings=state.pings+[Ping(address,time,text)]`.
/// @param text Text consumed or emitted by `queuePing` in the UI LAN browser path.
function queuePing(state,address,time,text) state.pings=state.pings+[Ping(address,time,text)];return len(state.pings)-1 end function
/// Returns the element/byte count of `state.pings` for UI LAN browser `pingCount`.
/// @param state Record read through `state.pings`.
function pingCount(state) return len(state.pings) end function
/// Updates `state.pings` during UI LAN browser `clearPing`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.pings`.
/// @param index Value tested by `index<0 or index>=len(state.pings)`, `cursor!=index` before the calculation continues.
function clearPing(state,index)
  if index<0 or index>=len(state.pings) then return void end if
  result=[];for cursor=0 to len(state.pings)-1 if cursor!=index then result=result+[state.pings[cursor]] end if end for;state.pings=result;return void
end function
/// Evaluates UI LAN browser `getPing` and returns `["",0]`, `[value.address,value.time]` according to its guard/selection conditions.
/// @param state Record read through `state.pings`.
/// @param index Value tested by `index<0 or index>=len(state.pings)` before the calculation continues.
function getPing(state,index) if index<0 or index>=len(state.pings) then return ["",0] end if;value=state.pings[index];return [value.address,value.time] end function
/// Evaluates UI LAN browser `getPingInfo` and returns `""`, `state.pings[index].info` according to its guard/selection conditions.
/// @param state Record read through `state.pings`.
/// @param index Value tested by `index<0 or index>=len(state.pings)` before the calculation continues.
function getPingInfo(state,index) if index<0 or index>=len(state.pings) then return "" end if;return state.pings[index].info end function

// CL_SetServerInfo and CL_SetServerInfoByAddress.  The packet ingress keeps
// parsing separate from the catalog, while these helpers retain Baseq3's
// useful property that one reply updates the same address in every source.
/// @param value Mutable UI LAN browser record/storage; this routine assigns `value.clients`, `value.hostName`, `value.mapName`, `value.maxClients` and additional values.
/// @param text Text consumed or emitted by `applyInfo` in the UI LAN browser path.
/// @param pingTime Value assigned to `value.ping`.
function applyInfo(value,text,pingTime)
  if value==void then return false end if
  if text!=void then
    value.clients=toNumber(info.value(text,"clients"));value.hostName=info.value(text,"hostname");value.mapName=info.value(text,"mapname")
    value.maxClients=toNumber(info.value(text,"sv_maxclients"));value.game=info.value(text,"game");value.gameType=toNumber(info.value(text,"gametype"))
    value.netType=toNumber(info.value(text,"nettype"));value.minPing=toNumber(info.value(text,"minping"));value.maxPing=toNumber(info.value(text,"maxping"));value.punkbuster=toNumber(info.value(text,"punkbuster"))
  end if
  value.ping=pingTime;return true
end function
/// Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.applyInfo` from UI LAN browser `setInfoByAddress`. The final path returns `updated`.
/// @param state Shared UI LAN browser state passed to the helper calls in `setInfoByAddress`.
/// @param address Value used by `wanted=canonicalAddress(address)`.
/// @param text Text consumed or emitted by `setInfoByAddress` in the UI LAN browser path.
/// @param pingTime Value used by `if canonicalAddress(value.address)==wanted then if applyInfo(value,text,pingTime) then updated=updated+1 end if end if`.
function setInfoByAddress(state,address,text,pingTime)
  wanted=canonicalAddress(address);updated=0
  for source=AS_LOCAL to AS_FAVORITES
    for each value in list(state,source)
      if canonicalAddress(value.address)==wanted then if applyInfo(value,text,pingTime) then updated=updated+1 end if end if
    end for
  end for
  return updated
end function
/// Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.maximum`, `mq3.client.ui_lan_browser.server` and additional helpers from UI LAN browser `appendDiscovered`. The final path returns `len(values)`.
/// @param state Shared UI LAN browser state passed to the helper calls in `appendDiscovered`.
/// @param source Value used by `values=list(state,source)`.
/// @param address Value used by `value=server(address,"")`.
/// @param netType Value assigned to `value.netType`.
function appendDiscovered(state,source,address,netType)
  values=list(state,source);if values==void or len(values)>=maximum(source) then return -1 end if
  value=server(address,"");value.netType=netType;setList(state,source,values+[value]);return len(values)
end function
/// Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN browser `findAddress`. The final path returns `index`.
/// @param state Shared UI LAN browser state passed to the helper calls in `findAddress`.
/// @param source Value used by `values=list(state,source)`.
/// @param address Value used by `wanted=canonicalAddress(address)`.
function findAddress(state,source,address)
  values=list(state,source);if values==void or len(values)==0 then return -1 end if;wanted=canonicalAddress(address)
  for index=0 to len(values)-1 if canonicalAddress(values[index].address)==wanted then return index end if end for
  return -1
end function
/// Updates `state.pings[index].time`, `state.pings[index].info` during UI LAN browser `completePing`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.pings[index].time`, `state.pings[index].info`.
/// @param index Value tested by `index<0 or index>=len(state.pings)` before the calculation continues.
/// @param time Value used by `state.pings[index].time=time`.
/// @param text Text consumed or emitted by `completePing` in the UI LAN browser path.
function completePing(state,index,time,text)
  if index<0 or index>=len(state.pings) then return false end if
  state.pings[index].time=time;state.pings[index].info=text;return true
end function
/// Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list` from UI LAN browser `setStatusByAddress`. The final path returns `updated`.
/// @param state Shared UI LAN browser state passed to the helper calls in `setStatusByAddress`.
/// @param address Value used by `wanted=canonicalAddress(address)`.
/// @param text Value assigned to `value.status`.
function setStatusByAddress(state,address,text)
  wanted=canonicalAddress(address);updated=0
  for source=AS_LOCAL to AS_FAVORITES
    for each value in list(state,source) if canonicalAddress(value.address)==wanted then value.status=text;updated=updated+1 end if end for
  end for
  return updated
end function

// A transport calls updateServer when an infoResponse arrives. Keeping this
// mutation here makes every LAN query see one coherent serverInfo_t analogue.
/// @param state Shared UI LAN browser state passed to the helper calls in `updateServer`.
/// @param source Value used by `value=at(state,source,index)`.
/// @param index Value used by `value=at(state,source,index)`.
/// @param mapName Map name used to select the level and its associated assets.
/// @param clients Value assigned to `value.clients`.
/// @param maxClients Value assigned to `value.maxClients`.
/// @param pingTime Value assigned to `value.ping`.
/// @param minPing Value assigned to `value.minPing`.
/// @param maxPing Value assigned to `value.maxPing`.
/// @param game Value assigned to `value.game`.
/// @param gameType Value assigned to `value.gameType`.
/// @param netType Value assigned to `value.netType`.
/// @param punkbuster Value assigned to `value.punkbuster`.
/// @param status Value assigned to `value.status`.
function updateServer(state,source,index,mapName,clients,maxClients,pingTime,minPing,maxPing,game,gameType,netType,punkbuster,status)
  value=at(state,source,index);if value==void then return false end if
  value.mapName=mapName;value.clients=clients;value.maxClients=maxClients;value.ping=pingTime;value.minPing=minPing;value.maxPing=maxPing
  value.game=game;value.gameType=gameType;value.netType=netType;value.punkbuster=punkbuster;value.status=status;return true
end function
/// Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `updateVisiblePings`.
/// @param state Shared UI LAN browser state passed to the helper calls in `updateVisiblePings`.
/// @param source Value used by `values=list(state,source)`.
function updateVisiblePings(state,source)
  values=list(state,source);if values==void then return false end if
  for each value in values if value.visible and value.ping<0 then return true end if end for;return false
end function
/// Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list` from UI LAN browser `serverStatus`.
/// @param state Shared UI LAN browser state passed to the helper calls in `serverStatus`.
/// @param address Value used by `wanted=canonicalAddress(address)`.
function serverStatus(state,address)
  wanted=canonicalAddress(address)
  for source=AS_LOCAL to AS_FAVORITES for each value in list(state,source) if canonicalAddress(value.address)==wanted then return value.status end if end for end for
  return void
end function

/// Creates a `mq3.client.ui_lan_browser.Server` record.
/// @param value Record read through `value.address`, `value.hostName`, `value.mapName`, `value.clients` and additional values.
function cloneServer(value) return Server(value.address,value.hostName,value.mapName,value.clients,value.maxClients,value.ping,value.minPing,value.maxPing,value.game,value.gameType,value.netType,value.punkbuster,value.visible,value.status) end function
/// Calls `mq3.client.ui_lan_browser.cloneServer` from UI LAN browser `copyList`. The final path returns `result`.
/// @param values Value used by `for each value in values result=result+[cloneServer(value)] end for`.
function copyList(values) result=[];for each value in values result=result+[cloneServer(value)] end for;return result end function
/// Updates `state.cachedGlobal`, `state.cachedMplayer`, `state.cachedFavorites` during UI LAN browser `save`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.cachedGlobal`, `state.cachedMplayer`, `state.cachedFavorites`.
function save(state) state.cachedGlobal=copyList(state.globalServers);state.cachedMplayer=copyList(state.mplayer);state.cachedFavorites=copyList(state.favorites);return void end function
/// Updates `state.globalServers`, `state.mplayer`, `state.favorites` during UI LAN browser `load`.
/// @param state Mutable UI LAN browser record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`.
function load(state) state.globalServers=copyList(state.cachedGlobal);state.mplayer=copyList(state.cachedMplayer);state.favorites=copyList(state.cachedFavorites);return void end function

/// Calls `std.string.toLowerAscii` from UI LAN browser `compareText`. The final path returns `0`.
/// @param left Value used by `a=bytes(strings.toLowerAscii(left))`.
/// @param right Value used by `b=bytes(strings.toLowerAscii(right))`.
function compareText(left,right)
  a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));limit=len(a);if len(b)<limit then limit=len(b) end if
  for index=0 to limit-1 if a[index]<b[index] then return -1 end if;if a[index]>b[index] then return 1 end if end for
  if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0
end function
/// Evaluates UI LAN browser `compareNumber` and returns `-1`, `1`, `0` according to its guard/selection conditions.
/// @param left Value used by `if left<right then return -1 end if`.
/// @param right Value used by `if left<right then return -1 end if`.
function compareNumber(left,right) if left<right then return -1 end if;if left>right then return 1 end if;return 0 end function
/// Calls `mq3.client.ui_lan_browser.at`, `mq3.client.ui_lan_browser.compareText`, `mq3.client.ui_lan_browser.compareNumber` from UI LAN browser `compare`. The final path returns `result`.
/// @param state Shared UI LAN browser state passed to the helper calls in `compare`.
/// @param source Value used by `a=at(state,source,first)`.
/// @param sortKey Value used by `if sortKey==SORT_HOST then result=compareText(a.hostName,b.hostName)`.
/// @param sortDir Value used by `if sortDir!=0 then return -result end if`.
/// @param first Value used by `a=at(state,source,first)`.
/// @param second Value used by `b=at(state,source,second)`.
function compare(state,source,sortKey,sortDir,first,second)
  a=at(state,source,first);b=at(state,source,second);if a==void or b==void then return 0 end if;result=0
  if sortKey==SORT_HOST then result=compareText(a.hostName,b.hostName)
  else if sortKey==SORT_MAP then result=compareText(a.mapName,b.mapName)
  else if sortKey==SORT_CLIENTS then result=compareNumber(a.clients,b.clients)
  else if sortKey==SORT_GAME then result=compareNumber(a.gameType,b.gameType)
  else if sortKey==SORT_PING then result=compareNumber(a.ping,b.ping) end if
  if sortDir!=0 then return -result end if;return result
end function
