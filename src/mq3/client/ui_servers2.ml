// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_servers2.c.
package mq3.client.ui_servers2
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as numeric

/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by UI servers2.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

const MAX_GLOBALSERVERS=128
const MAX_PINGREQUESTS=32
const MAX_FAVORITESERVERS=16
const MAX_LISTBOXITEMS=128
const MAX_LOCALSERVERS=128
const QM_GOTFOCUS=1
const QM_ACTIVATED=3
const ID_MASTER=10
const ID_GAMETYPE=11
const ID_SORTKEY=12
const ID_SHOW_FULL=13
const ID_SHOW_EMPTY=14
const ID_LIST=15
const ID_SCROLL_UP=16
const ID_SCROLL_DOWN=17
const ID_BACK=18
const ID_REFRESH=19
const ID_SPECIFY=20
const ID_CREATE=21
const ID_CONNECT=22
const ID_REMOVE=23
const ID_PUNKBUSTER=24
const AS_LOCAL=0
const AS_MPLAYER=1
const AS_GLOBAL=2
const AS_FAVORITES=3
const SORT_HOST=0
const SORT_MAP=1
const SORT_CLIENTS=2
const SORT_GAME=3
const SORT_PING=4
const GAMES_ALL=0
const GAMES_FFA=1
const GAMES_TEAMPLAY=2
const GAMES_TOURNEY=3
const GAMES_CTF=4
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_TEAM=3
const GT_CTF=4
const K_ESCAPE=27
const K_SPACE=32
const K_DEL=140
const K_KP_DEL=171
const K_MOUSE2=179

/// Stores UI servers2 host action record, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.
struct HostAction boundary kind name text number dispatched end struct
/// Stores UI servers2 server node record, including `address`, `hostname`, `mapName`, `numClients`, `maxClients`, `pingTime` and additional values.
struct ServerNode address hostname mapName numClients maxClients pingTime gameType gameName netType minPing maxPing punkbuster end struct
/// Stores UI servers2 ping request record, including `address`, `start`.
struct PingRequest address start end struct
/// Stores UI servers2 ping result record, including `slot`, `address`, `time`, `infoText`.
struct PingResult slot address time infoText end struct
/// Stores UI servers2 menu item, including `id`, `kind`, `name`, `x`, `y`, `fallback`.
struct Item id kind name x y fallback end struct
/// Stores UI servers2 choice list record, including `name`, `values`.
struct ChoiceList name values end struct
/// Stores UI servers2 browser state record, including `source`, `masterSelection`, `gameFilter`, `sortKey`, `showFull`, `showEmpty` and additional values.
struct BrowserState source masterSelection gameFilter sortKey showFull showEmpty punkbuster servers localServers globalServers mplayerServers favoriteServers favoriteAddresses visibleIndices rows selected top mapPicture status statusBar numQueried currentPing refreshing nextPingTime maxServers refreshTime pingRequests removeVisible controlsGrayed listGrayed goGrayed choices assets items actions end struct

/// Computes `actions+[HostAction(boundary,kind,name,text,number,not retailActive)]` for UI servers2 `action`.
/// @param actions Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI servers2 resource.
/// @param text Text consumed or emitted by `action` in the UI servers2 path.
/// @param number Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function action(actions,boundary,kind,name,text,number,retailActive)
  return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]
end function

/// Creates a `mq3.client.ui_servers2.ServerNode` record. Assigns `address` from `address`, `hostname` from `hostname`, `mapName` from `mapName`, `numClients` from `numClients`.
/// @param address Value used to initialize `ServerNode.address`.
/// @param hostname Value used to initialize `ServerNode.hostname`.
/// @param mapName Value used to initialize `ServerNode.mapName`.
/// @param numClients Value used to initialize `ServerNode.numClients`.
/// @param maxClients Value used to initialize `ServerNode.maxClients`.
/// @param pingTime Value used to initialize `ServerNode.pingTime`.
/// @param gameType Value used to initialize `ServerNode.gameType`.
/// @param gameName Value used to initialize `ServerNode.gameName`.
/// @param netType Value used to initialize `ServerNode.netType`.
/// @param minPing Value used to initialize `ServerNode.minPing`.
/// @param maxPing Value used to initialize `ServerNode.maxPing`.
/// @param punkbuster Value used to initialize `ServerNode.punkbuster`.
function node(address,hostname,mapName,numClients,maxClients,pingTime,gameType,gameName,netType,minPing,maxPing,punkbuster)
  return ServerNode(address,hostname,mapName,numClients,maxClients,pingTime,gameType,gameName,netType,minPing,maxPing,punkbuster)
end function

/// Adapts `mq3.client.ui_servers2.node` to UI servers2 `emptyNode`, returning its result for `address, "", "", 0, 0, pingTime, 0, "DM ", 0, 0, 0, false`.
/// @param address Argument 1 of `mq3.client.ui_servers2.node`.
/// @param pingTime Argument 6 of `mq3.client.ui_servers2.node`.
function emptyNode(address,pingTime)
  return node(address,"","",0,0,pingTime,0,"DM ",0,0,0,false)
end function

/// Calls `mq3.client.ui_servers2.PingRequest`, `mq3.client.ui_servers2.BrowserState` from UI servers2 `browserState`.
function browserState()
  requests=[]
  for i=0 to MAX_PINGREQUESTS-1 requests=requests+[PingRequest("",0)] end for
  return BrowserState(-1,0,GAMES_ALL,SORT_HOST,true,true,false,[],[],[],[],[],[],[],[],0,0,"","","",0,0,false,0,MAX_GLOBALSERVERS,0,requests,false,false,true,true,[],[],[],[])
end function

/// Creates a `mq3.client.ui_servers2.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.
/// @param id Value used to initialize `Item.id`.
/// @param kind Value used to initialize `Item.kind`.
/// @param name Value used to initialize `Item.name`.
/// @param x Value used to initialize `Item.x`.
/// @param y Value used to initialize `Item.y`.
function item(id,kind,name,x,y) return Item(id,kind,name,x,y,"") end function

/// Clamps `value` to the inclusive bounds `low` and `high` for UI servers2.
/// @param value Value tested by `value<low`, `if value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high)
  if value<low then return low end if
  if value>high then return high end if
  return value
end function

/// Calls `decode`, `slice` from UI servers2 `truncate`. The final path returns `decode(slice(data,0,count))`.
/// @param text Text consumed or emitted by `truncate` in the UI servers2 path.
/// @param count Value tested by `len(data)<=count` before the calculation continues.
function truncate(text,count)
  if text==void then return "" end if
  data=bytes(text)
  if len(data)<=count then return text end if
  return decode(slice(data,0,count))
end function

/// Calls `std.string.substr` from UI servers2 `cleanText`. The final path returns `cleaned`.
/// @param text Text consumed or emitted by `cleanText` in the UI servers2 path.
function cleanText(text)
  data=bytes(text);cleaned="";at=0
  while at<len(data)
    if data[at]==94 and at+1<len(data) and data[at+1]!=94 then at=at+2
    else cleaned=cleaned+strings.substr(text,at,1);at=at+1 end if
  end while
  return cleaned
end function

/// Calls `std.string.toLowerAscii` from UI servers2 `lowerCompare`. The final path returns `0`.
/// @param leftText Value used by `left=bytes(strings.toLowerAscii(leftText))`.
/// @param rightText Value used by `right=bytes(strings.toLowerAscii(rightText))`.
function lowerCompare(leftText,rightText)
  left=bytes(strings.toLowerAscii(leftText));right=bytes(strings.toLowerAscii(rightText));count=len(left)
  if len(right)<count then count=len(right) end if
  if count>0 then
    for i=0 to count-1
      if left[i]<right[i] then return -1 end if
      if left[i]>right[i] then return 1 end if
    end for
  end if
  if len(left)<len(right) then return -1 end if
  if len(left)>len(right) then return 1 end if
  return 0
end function

// ArenaServers_MaxPing
/// @param cvarValue Value used by `value=numeric.trunc32(cvarValue)`.
function arenaServersMaxPing(cvarValue)
  value=numeric.trunc32(cvarValue)
  if value<100 then value=100 end if
  return value
end function

// ArenaServers_Compare
/// @param left Record read through `left.hostname`, `left.mapName`, `left.maxClients`, `left.numClients` and additional values.
/// @param right Record read through `right.hostname`, `right.mapName`, `right.maxClients`, `right.numClients` and additional values.
/// @param sortKey Value used by `if sortKey==SORT_HOST then return lowerCompare(left.hostname,right.hostname) end if`.
function arenaServersCompare(left,right,sortKey)
  if sortKey==SORT_HOST then return lowerCompare(left.hostname,right.hostname) end if
  if sortKey==SORT_MAP then return lowerCompare(left.mapName,right.mapName) end if
  if sortKey==SORT_CLIENTS then
    leftOpen=left.maxClients-left.numClients;if leftOpen<0 then leftOpen=0 end if
    rightOpen=right.maxClients-right.numClients;if rightOpen<0 then rightOpen=0 end if
    if leftOpen<rightOpen then return 1 end if
    if leftOpen>rightOpen then return -1 end if
    return 0
  end if
  if sortKey==SORT_GAME then
    if left.gameType<right.gameType then return -1 end if
    if left.gameType>right.gameType then return 1 end if
    return 0
  end if
  if sortKey==SORT_PING then
    if left.pingTime<right.pingTime then return -1 end if
    if left.pingTime>right.pingTime then return 1 end if
    return lowerCompare(left.hostname,right.hostname)
  end if
  return 0
end function

/// Updates `state.servers` during UI servers2 `sortNow`.
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.servers`.
function sortNow(state)
  remaining=state.servers;sorted=[]
  while len(remaining)>0
    best=0
    if len(remaining)>1 then
      for i=1 to len(remaining)-1 if arenaServersCompare(remaining[i],remaining[best],state.sortKey)<0 then best=i end if end for
    end if
    sorted=sorted+[remaining[best]];next=[]
    for i=0 to len(remaining)-1 if i!=best then next=next+[remaining[i]] end if end for
    remaining=next
  end while
  state.servers=sorted
  return void
end function

/// Updates `state.localServers`, `state.globalServers`, `state.mplayerServers`, `state.favoriteServers` during UI servers2 `syncActive`.
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.localServers`, `state.globalServers`, `state.mplayerServers`, `state.favoriteServers`.
function syncActive(state)
  if state.source==AS_LOCAL then state.localServers=state.servers
  else if state.source==AS_GLOBAL then state.globalServers=state.servers
  else if state.source==AS_MPLAYER then state.mplayerServers=state.servers
  else if state.source==AS_FAVORITES then state.favoriteServers=state.servers end if
  return void
end function

/// Updates `state.servers`, `state.maxServers` during UI servers2 `chooseActive`.
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.servers`, `state.maxServers`.
function chooseActive(state)
  if state.source==AS_LOCAL then state.servers=state.localServers;state.maxServers=MAX_LOCALSERVERS
  else if state.source==AS_GLOBAL then state.servers=state.globalServers;state.maxServers=MAX_GLOBALSERVERS
  else if state.source==AS_MPLAYER then state.servers=state.mplayerServers;state.maxServers=MAX_GLOBALSERVERS
  else state.servers=state.favoriteServers;state.maxServers=MAX_FAVORITESERVERS end if
  return void
end function

// ArenaServers_Go
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersGo(state,retailActive)
  if state.selected<0 or state.selected>=len(state.visibleIndices) then return false end if
  server=state.servers[state.visibleIndices[state.selected]]
  state.actions=action(state.actions,"command","append","connect","connect "+server.address+"\n",0,retailActive)
  return true
end function

// ArenaServers_UpdatePicture
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.mapPicture`.
function arenaServersUpdatePicture(state)
  state.mapPicture=""
  if state.selected>=0 and state.selected<len(state.visibleIndices) then
    server=state.servers[state.visibleIndices[state.selected]]
    state.mapPicture="levelshots/"+server.mapName+".tga"
  end if
  return state.mapPicture
end function

/// Calls `mq3.client.ui_servers2.truncate` from UI servers2 `padRight`. The final path returns `value`.
/// @param text Text consumed or emitted by `padRight` in the UI servers2 path.
/// @param width Width in the coordinate space used by `padRight`.
function padRight(text,width)
  value=truncate(text,width)
  while len(value)<width value=value+" " end while
  return value
end function

/// Evaluates UI servers2 `padLeft` and returns `text` according to its guard/selection conditions.
/// @param value Value used by `text=str(value)`.
/// @param width Width in the coordinate space used by `padLeft`.
function padLeft(value,width)
  text=str(value)
  while len(text)<width text=" "+text end while
  return text
end function

/// Evaluates UI servers2 `gameMatches` and returns `true`, `gameType==GT_FFA`, `gameType==GT_TEAM` and additional values according to its guard/selection conditions.
/// @param filter Value used by `if filter==GAMES_ALL then return true end if`.
/// @param gameType Value used by `if filter==GAMES_FFA then return gameType==GT_FFA end if`.
function gameMatches(filter,gameType)
  if filter==GAMES_ALL then return true end if
  if filter==GAMES_FFA then return gameType==GT_FFA end if
  if filter==GAMES_TEAMPLAY then return gameType==GT_TEAM end if
  if filter==GAMES_TOURNEY then return gameType==GT_TOURNAMENT end if
  if filter==GAMES_CTF then return gameType==GT_CTF end if
  return false
end function

/// Evaluates UI servers2 `pingColor` and returns `"^4"`, `"^2"`, `"^3"` and additional values according to its guard/selection conditions.
/// @param server Record read through `server.pingTime`, `server.minPing`, `server.maxPing`.
function pingColor(server)
  if server.pingTime<server.minPing then return "^4" end if
  if server.maxPing!=0 and server.pingTime>server.maxPing then return "^4" end if
  if server.pingTime<200 then return "^2" end if
  if server.pingTime<400 then return "^3" end if
  return "^1"
end function

/// Maps the server network type to its UDP/IPX label, using ??? for unsupported types.
/// @param value Value tested by `value==1`, `if value==2` before the calculation continues.
function netName(value)
  if value==1 then return "UDP" end if
  if value==2 then return "IPX" end if
  return "???"
end function

/// Calls `mq3.client.ui_servers2.padRight`, `mq3.client.ui_servers2.padLeft`, `mq3.client.ui_servers2.netName` and additional helpers from UI servers2 `formatRow`.
/// @param server Record read through `server.punkbuster`, `server.hostname`, `server.mapName`, `server.numClients` and additional values.
function formatRow(server)
  pb="No";if server.punkbuster then pb="Yes" end if
  return padRight(server.hostname,20)+" "+padRight(server.mapName,12)+" "+padLeft(server.numClients,2)+"/"+padLeft(server.maxClients,2)+" "+padRight(server.gameName,8)+" "+padLeft(netName(server.netType),3)+" "+pingColor(server)+padLeft(server.pingTime,3)+" ^3"+pb
end function

// ArenaServers_UpdateMenu
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.status`, `state.statusBar`, `state.controlsGrayed`, `state.visibleIndices` and additional values.
function arenaServersUpdateMenu(state)
  world="Visit www.quake3world.com - News, Community, Events, Files"
  if state.numQueried<=0 then
    if state.refreshing then state.status="Scanning For Servers.";state.statusBar="Press SPACE to stop";state.controlsGrayed=true
    else
      if state.numQueried<0 then state.status="No Response From Master Server." else state.status="No Servers Found." end if
      if state.source==AS_GLOBAL or state.source==AS_MPLAYER then state.statusBar=world else state.statusBar="" end if
      state.controlsGrayed=false
    end if
    state.visibleIndices=[];state.rows=[];state.selected=0;state.top=0;state.listGrayed=true;state.goGrayed=true;arenaServersUpdatePicture(state);return 0
  end if
  if state.refreshing and state.currentPing<=state.numQueried then
    state.status=str(state.currentPing)+" of "+str(state.numQueried)+" Arena Servers.";state.statusBar="Press SPACE to stop";sortNow(state)
  else
    state.controlsGrayed=false
    if state.source==AS_GLOBAL or state.source==AS_MPLAYER then state.statusBar=world else state.statusBar="" end if
  end if
  state.visibleIndices=[];state.rows=[]
  if len(state.servers)>0 then
    for i=0 to len(state.servers)-1
      server=state.servers[i]
      include=true
      if not state.showEmpty and server.numClients==0 then include=false end if
      if not state.showFull and server.numClients==server.maxClients then include=false end if
      if not gameMatches(state.gameFilter,server.gameType) then include=false end if
      if include and len(state.visibleIndices)<MAX_LISTBOXITEMS then state.visibleIndices=state.visibleIndices+[i];state.rows=state.rows+[formatRow(server)] end if
    end for
  end if
  state.selected=0;state.top=0
  if not state.refreshing or state.currentPing>state.numQueried then state.listGrayed=false;state.goGrayed=false end if
  arenaServersUpdatePicture(state)
  return len(state.visibleIndices)
end function

// ArenaServers_Remove
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.favoriteAddresses`, `state.servers`, `state.favoriteServers`, `state.numQueried` and additional values.
function arenaServersRemove(state)
  if state.selected<0 or state.selected>=len(state.visibleIndices) then return false end if
  index=state.visibleIndices[state.selected];selected=state.servers[index]
  addresses=[]
  for each address in state.favoriteAddresses if not strings.equalsIgnoreCaseAscii(address,selected.address) then addresses=addresses+[address] end if end for
  state.favoriteAddresses=addresses
  servers=[]
  for i=0 to len(state.servers)-1 if i!=index then servers=servers+[state.servers[i]] end if end for
  state.servers=servers;state.favoriteServers=servers;state.numQueried=len(state.favoriteAddresses);state.currentPing=state.numQueried
  return true
end function

/// Evaluates UI servers2 `gameName` and returns `names[value]` according to its guard/selection conditions.
/// @param value Value used by `return names[value]`.
function gameName(value)
  names=["DM ","1v1","SP ","Team DM","CTF","One Flag CTF","OverLoad","Harvester","Rocket Arena 3","Q3F","Urban Terror","OSP","???"]
  return names[value]
end function

// ArenaServers_Insert
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.servers[state.maxServers-1]`, `state.servers`.
/// @param address Value used by `value=node(truncate(address,63),hostname,mapName,clients,maxClients,pingTime,gameType,truncate(custom,11),netType,minPing,serverMaxPing,pb)`.
/// @param infoText Value used by `hostname=strings.toUpperAscii(truncate(cleanText(info.value(infoText,"hostname")),21))`.
/// @param pingTime Value used by `if pingTime>=arenaServersMaxPing(maxPing) and state.source!=AS_FAVORITES then return false end if`.
/// @param maxPing Value used by `if pingTime>=arenaServersMaxPing(maxPing) and state.source!=AS_FAVORITES then return false end if`.
function arenaServersInsert(state,address,infoText,pingTime,maxPing)
  if pingTime>=arenaServersMaxPing(maxPing) and state.source!=AS_FAVORITES then return false end if
  hostname=strings.toUpperAscii(truncate(cleanText(info.value(infoText,"hostname")),21))
  mapName=strings.toUpperAscii(truncate(cleanText(info.value(infoText,"mapname")),15))
  clients=atoi(info.value(infoText,"clients"));maxClients=atoi(info.value(infoText,"sv_maxclients"))
  minPing=atoi(info.value(infoText,"minPing"));serverMaxPing=atoi(info.value(infoText,"maxPing"));pb=atoi(info.value(infoText,"punkbuster"))!=0
  netType=atoi(info.value(infoText,"nettype"));gameType=atoi(info.value(infoText,"gametype"))
  if gameType<0 then gameType=0 else if gameType>11 then gameType=12 end if
  custom=info.value(infoText,"game");if custom=="" then custom=gameName(gameType) end if
  value=node(truncate(address,63),hostname,mapName,clients,maxClients,pingTime,gameType,truncate(custom,11),netType,minPing,serverMaxPing,pb)
  if len(state.servers)>=state.maxServers then state.servers[state.maxServers-1]=value else state.servers=state.servers+[value] end if
  syncActive(state)
  return true
end function

// ArenaServers_InsertFavorites
/// @param state Record read through `state.favoriteAddresses`, `state.servers`.
/// @param maxPing Value used by `if not found then arenaServersInsert(state,address,"\\hostname\\No Response",arenaServersMaxPing(maxPing),maxPing) end if`.
function arenaServersInsertFavorites(state,maxPing)
  for each address in state.favoriteAddresses
    found=false
    for each server in state.servers if strings.equalsIgnoreCaseAscii(address,server.address) then found=true end if end for
    if not found then arenaServersInsert(state,address,"\\hostname\\No Response",arenaServersMaxPing(maxPing),maxPing) end if
  end for
  return len(state.servers)
end function

// ArenaServers_LoadFavorites
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.favoriteAddresses`, `state.favoriteServers`, `state.servers`.
/// @param cvarAddresses Sequence read at `cvarAddresses[i]`.
/// @param maxPing Value used by `if not matched then loaded=loaded+[emptyNode(address,arenaServersMaxPing(maxPing))] end if`.
function arenaServersLoadFavorites(state,cvarAddresses,maxPing)
  old=state.favoriteServers;loaded=[];addresses=[];found=false
  limit=len(cvarAddresses);if limit>MAX_FAVORITESERVERS then limit=MAX_FAVORITESERVERS end if
  if limit>0 then
    for i=0 to limit-1
      address=cvarAddresses[i]
      if address!="" then
        data=bytes(address)
        if len(data)>0 and data[0]>=48 and data[0]<=57 then
          addresses=addresses+[truncate(address,63)];matched=false
          for each server in old
            if strings.equalsIgnoreCaseAscii(server.address,address) then loaded=loaded+[server];matched=true;found=true end if
          end for
          if not matched then loaded=loaded+[emptyNode(address,arenaServersMaxPing(maxPing))] end if
        end if
      end if
    end for
  end if
  state.favoriteAddresses=addresses;state.favoriteServers=loaded
  if not found then state.favoriteServers=[] end if
  if state.source==AS_FAVORITES then state.servers=state.favoriteServers end if
  return len(addresses)
end function

// ArenaServers_StopRefresh
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.refreshing`, `state.currentPing`, `state.numQueried`.
/// @param maxPing Value used by `if state.source==AS_FAVORITES then arenaServersInsertFavorites(state,maxPing) end if`.
function arenaServersStopRefresh(state,maxPing)
  if not state.refreshing then return false end if
  state.refreshing=false
  if state.source==AS_FAVORITES then arenaServersInsertFavorites(state,maxPing) end if
  if state.numQueried>=0 then state.currentPing=len(state.servers);state.numQueried=len(state.servers) end if
  sortNow(state);syncActive(state);arenaServersUpdateMenu(state)
  return true
end function

/// Calls `std.string.equalsIgnoreCaseAscii` from UI servers2 `findRequest`. The final path returns `-1`.
/// @param state Record read through `state.pingRequests`.
/// @param address Value used by `for i=0 to MAX_PINGREQUESTS-1 if strings.equalsIgnoreCaseAscii(state.pingRequests[i].address,address) then return i end if end for`.
function findRequest(state,address)
  for i=0 to MAX_PINGREQUESTS-1 if strings.equalsIgnoreCaseAscii(state.pingRequests[i].address,address) then return i end if end for
  return -1
end function

// ArenaServers_DoRefresh
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.nextPingTime`, `state.pingRequests[request].address`, `state.actions`, `state.numQueried` and additional values.
/// @param realtime Current client real-time clock in milliseconds.
/// @param serverCount Value assigned to `state.numQueried`.
/// @param pingQueueCount Value used by `queued=pingQueueCount-cleared`.
/// @param pingResults Value used by `for each result in pingResults`.
/// @param serverAddresses Sequence read at `serverAddresses[state.currentPing]`.
/// @param maxPing Value used by `if elapsed<arenaServersMaxPing(maxPing) then continue end if end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive)
  if realtime<state.refreshTime and state.source!=AS_FAVORITES then
    if state.source==AS_LOCAL and serverCount==0 then return false end if
    if serverCount<0 then return false end if
  end if
  if realtime<state.nextPingTime then return false end if
  state.nextPingTime=realtime+10
  cleared=0
  for each result in pingResults
    if result.address!="" then
      request=findRequest(state,result.address)
      if request>=0 then
        elapsed=result.time
        if elapsed==0 then elapsed=realtime-state.pingRequests[request].start;if elapsed<arenaServersMaxPing(maxPing) then continue end if end if
        resultInfo=result.infoText
        if elapsed>arenaServersMaxPing(maxPing) then resultInfo="";elapsed=arenaServersMaxPing(maxPing) end if
        arenaServersInsert(state,result.address,resultInfo,elapsed,maxPing);state.pingRequests[request].address=""
      end if
      state.actions=action(state.actions,"lan","clear-ping","slot","",result.slot,retailActive)
      cleared=cleared+1
    end if
  end for
  if state.source==AS_FAVORITES then state.numQueried=len(state.favoriteAddresses) else state.numQueried=serverCount end if
  queued=pingQueueCount-cleared;if queued<0 then queued=0 end if
  while queued<MAX_PINGREQUESTS and state.currentPing<state.numQueried
    slot=-1;for i=0 to MAX_PINGREQUESTS-1 if slot<0 and state.pingRequests[i].address=="" then slot=i end if end for
    if slot<0 then break end if
    address=""
    if state.source==AS_FAVORITES then address=state.favoriteAddresses[state.currentPing]
    else if state.currentPing<len(serverAddresses) then address=serverAddresses[state.currentPing] end if
    if address=="" then break end if
    state.pingRequests[slot].address=address;state.pingRequests[slot].start=realtime
    state.actions=action(state.actions,"command","now","ping","ping "+address+"\n",slot,retailActive)
    state.currentPing=state.currentPing+1;queued=queued+1
  end while
  if queued==0 then arenaServersStopRefresh(state,maxPing);return true end if
  arenaServersUpdateMenu(state);return true
end function

/// Evaluates UI servers2 `refreshArguments` and returns `text` according to its guard/selection conditions.
/// @param state Record read through `state.gameFilter`, `state.showEmpty`, `state.showFull`.
function refreshArguments(state)
  text=""
  if state.gameFilter==GAMES_FFA then text=" ffa"
  else if state.gameFilter==GAMES_TEAMPLAY then text=" team"
  else if state.gameFilter==GAMES_TOURNEY then text=" tourney"
  else if state.gameFilter==GAMES_CTF then text=" ctf" end if
  if state.showEmpty then text=text+" empty" end if
  if state.showFull then text=text+" full" end if
  return text
end function

// ArenaServers_StartRefresh
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.servers`, `state.pingRequests[i].address`, `state.actions`, `state.refreshing` and additional values.
/// @param realtime Current client real-time clock in milliseconds.
/// @param protocol Value used by `version=str(protocol)`.
/// @param debugProtocol Value used by `if debugProtocol!="" then version=debugProtocol end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)
  state.servers=[];syncActive(state)
  for i=0 to MAX_PINGREQUESTS-1 state.pingRequests[i].address="";state.actions=action(state.actions,"lan","clear-ping","slot","",i,retailActive) end for
  state.refreshing=true;state.currentPing=0;state.nextPingTime=0;state.numQueried=0;state.refreshTime=realtime+5000;arenaServersUpdateMenu(state)
  if state.source==AS_LOCAL then state.actions=action(state.actions,"command","append","localservers","localservers\n",0,retailActive)
  else if state.source==AS_GLOBAL or state.source==AS_MPLAYER then
    master=0;if state.source==AS_MPLAYER then master=1 end if
    version=str(protocol);if debugProtocol!="" then version=debugProtocol end if
    command="globalservers "+str(master)+" "+version+refreshArguments(state)+"\n"
    state.actions=action(state.actions,"command","append","globalservers",command,master,retailActive)
  end if
  return true
end function

// ArenaServers_SaveChanges
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersSaveChanges(state,retailActive)
  for i=0 to MAX_FAVORITESERVERS-1
    value="";if i<len(state.favoriteAddresses) then value=state.favoriteAddresses[i] end if
    state.actions=action(state.actions,"cvar","set","server"+str(i+1),value,i+1,retailActive)
  end for
  return MAX_FAVORITESERVERS
end function

// ArenaServers_Sort
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.sortKey`.
/// @param type Value assigned to `state.sortKey`.
function arenaServersSort(state,type)
  if state.sortKey==type then return false end if
  state.sortKey=type;sortNow(state);syncActive(state);return true
end function

// ArenaServers_SetType
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.source`, `state.removeVisible`, `state.currentPing`, `state.numQueried` and additional values.
/// @param type Value assigned to `state.source`, `state.removeVisible`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param protocol Value used by `if len(state.servers)==0 then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)`.
/// @param debugProtocol Value used by `if len(state.servers)==0 then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)
  if state.source==type then return false end if
  if state.source>=0 then syncActive(state) end if
  state.source=type;state.removeVisible=type==AS_FAVORITES;chooseActive(state)
  if len(state.servers)==0 then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)
  else state.currentPing=len(state.servers);state.numQueried=len(state.servers);arenaServersUpdateMenu(state) end if
  state.status="hit refresh to update"
  return true
end function

// Punkbuster_ConfirmEnable
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.actions`, `state.punkbuster`.
/// @param result Value used by `if result then state.actions=action(state.actions,"punkbuster","set-client-status","enabled","",1,retailActive) end if`.
/// @param currentCvar Value used by `state.punkbuster=clamp(currentCvar,0,1)!=0`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function punkbusterConfirmEnable(state,result,currentCvar,retailActive)
  if result then state.actions=action(state.actions,"punkbuster","set-client-status","enabled","",1,retailActive) end if
  state.punkbuster=clamp(currentCvar,0,1)!=0;return state.punkbuster
end function

// Punkbuster_ConfirmDisable
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.actions`, `state.punkbuster`.
/// @param result Value used by `if result then state.actions=action(state.actions,"punkbuster","set-client-status","disabled","",0,retailActive)`.
/// @param currentCvar Value used by `state.punkbuster=clamp(currentCvar,0,1)!=0`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function punkbusterConfirmDisable(state,result,currentCvar,retailActive)
  if result then state.actions=action(state.actions,"punkbuster","set-client-status","disabled","",0,retailActive);state.actions=action(state.actions,"ui","message","PunkBuster will be\ndisabled the next time\nQuake III Arena\nis started.","",0,retailActive) end if
  state.punkbuster=clamp(currentCvar,0,1)!=0;return state.punkbuster
end function

// ArenaServers_Event
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.masterSelection`, `state.actions`, `state.gameFilter`, `state.showFull` and additional values.
/// @param id Value used by `if eventCode!=QM_ACTIVATED and id!=ID_LIST then return false end if`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param value Value assigned to `state.masterSelection`, `state.gameFilter`, `state.showFull`, `state.showEmpty` and additional values.
/// @param realtime Current client real-time clock in milliseconds.
/// @param protocol Value used by `arenaServersSetType(state,source,realtime,protocol,debugProtocol,retailActive)`.
/// @param debugProtocol Value used by `arenaServersSetType(state,source,realtime,protocol,debugProtocol,retailActive)`.
/// @param maxPing Value used by `else if id==ID_BACK then arenaServersStopRefresh(state,maxPing)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersEvent(state,id,eventCode,value,realtime,protocol,debugProtocol,maxPing,retailActive)
  if eventCode!=QM_ACTIVATED and id!=ID_LIST then return false end if
  if id==ID_MASTER then state.masterSelection=value;source=value;if source>=1 then source=source+1 end if;state.actions=action(state.actions,"cvar","set","ui_browserMaster",str(source),source,retailActive);arenaServersSetType(state,source,realtime,protocol,debugProtocol,retailActive)
  else if id==ID_GAMETYPE then state.gameFilter=value;state.actions=action(state.actions,"cvar","set","ui_browserGameType",str(value),value,retailActive);arenaServersUpdateMenu(state)
  else if id==ID_SORTKEY then state.actions=action(state.actions,"cvar","set","ui_browserSortKey",str(value),value,retailActive);arenaServersSort(state,value);arenaServersUpdateMenu(state)
  else if id==ID_SHOW_FULL then state.showFull=value!=0;state.actions=action(state.actions,"cvar","set","ui_browserShowFull",str(value),value,retailActive);arenaServersUpdateMenu(state)
  else if id==ID_SHOW_EMPTY then state.showEmpty=value!=0;state.actions=action(state.actions,"cvar","set","ui_browserShowEmpty",str(value),value,retailActive);arenaServersUpdateMenu(state)
  else if id==ID_LIST and eventCode==QM_GOTFOCUS then state.selected=value;arenaServersUpdatePicture(state)
  else if id==ID_SCROLL_UP then if state.selected>0 then state.selected=state.selected-1;arenaServersUpdatePicture(state) end if
  else if id==ID_SCROLL_DOWN then if state.selected+1<len(state.visibleIndices) then state.selected=state.selected+1;arenaServersUpdatePicture(state) end if
  else if id==ID_BACK then arenaServersStopRefresh(state,maxPing);arenaServersSaveChanges(state,retailActive);state.actions=action(state.actions,"ui","pop","arena-servers","",0,retailActive)
  else if id==ID_REFRESH then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)
  else if id==ID_SPECIFY then state.actions=action(state.actions,"ui","push","specify-server","",0,retailActive)
  else if id==ID_CREATE then state.actions=action(state.actions,"ui","push","start-server","multiplayer",1,retailActive)
  else if id==ID_CONNECT then arenaServersGo(state,retailActive)
  else if id==ID_REMOVE then arenaServersRemove(state);arenaServersUpdateMenu(state)
  else if id==ID_PUNKBUSTER then prompt="Disable Punkbuster?";if value!=0 then prompt="Enable Punkbuster?" end if;state.actions=action(state.actions,"ui","confirm","punkbuster",prompt,value,retailActive)
  end if
  return true
end function

// ArenaServers_MenuDraw
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.actions`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param serverCount Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`.
/// @param pingQueueCount Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`.
/// @param pingResults Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`.
/// @param serverAddresses Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`.
/// @param maxPing Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersMenuDraw(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive)
  if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if
  state.actions=action(state.actions,"ui","draw-menu","arena-servers","",0,retailActive);return true
end function

// ArenaServers_MenuKey
/// @param state Record read through `state.refreshing`, `state.source`.
/// @param key Key or control identifier used to select the corresponding UI servers2 entry.
/// @param listFocused Value used by `if (key==K_DEL or key==K_KP_DEL) and state.source==AS_FAVORITES and listFocused then arenaServersRemove(state)`.
/// @param maxPing Value used by `if key==K_SPACE and state.refreshing then arenaServersStopRefresh(state,maxPing)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersMenuKey(state,key,listFocused,maxPing,retailActive)
  if key==K_SPACE and state.refreshing then arenaServersStopRefresh(state,maxPing);return "menu_move" end if
  if (key==K_DEL or key==K_KP_DEL) and state.source==AS_FAVORITES and listFocused then arenaServersRemove(state);arenaServersUpdateMenu(state);return "menu_move" end if
  if key==K_MOUSE2 or key==K_ESCAPE then arenaServersStopRefresh(state,maxPing);arenaServersSaveChanges(state,retailActive) end if
  return "default"
end function

/// Calls `mq3.client.ui_servers2.item` from UI servers2 `browserItems`. The final path returns `items`.
function browserItems()
  items=[
    item(0,"btext","ARENA SERVERS",320,16),item(ID_MASTER,"spin","Servers:",320,80),item(ID_GAMETYPE,"spin","Game Type:",320,96),item(ID_SORTKEY,"spin","Sort By:",320,112),item(ID_SHOW_FULL,"radio","Show Full:",320,128),item(ID_SHOW_EMPTY,"radio","Show Empty:",320,144),item(0,"bitmap","levelshot",72,80),item(ID_LIST,"scrolllist","servers",72,192),item(0,"text","status",320,376),item(0,"text","statusbar",320,392),item(0,"bitmap","menu/art/arrows_vert_0",560,192),item(ID_SCROLL_UP,"bitmap","menu/art/arrows_vert_top",560,192),item(ID_SCROLL_DOWN,"bitmap","menu/art/arrows_vert_bot",560,256),item(ID_REMOVE,"bitmap","menu/art/delete_0",450,86),item(ID_BACK,"bitmap","menu/art/back_0",0,416),item(ID_SPECIFY,"bitmap","menu/art/specify_0",128,416),item(ID_REFRESH,"bitmap","menu/art/refresh_0",256,416),item(ID_CREATE,"bitmap","menu/art/create_0",384,416),item(ID_CONNECT,"bitmap","menu/art/fight_0",640,416),item(ID_PUNKBUSTER,"spin","Punkbuster:",512,144),item(0,"bitmap","menu/art/pblogo",526,176)
  ]
  items[6].fallback="menu/art/unknownmap";items[20].fallback="menu/art/unknownmap"
  return items
end function

/// Builds the UI servers2 `browserChoices` sequence from `[ ChoiceList("Servers",["Local","Internet","Favorites"]), ChoiceList("Game Type",["All","Free For All","Team Deathmatch","Tournament","Capture the Flag"]), ChoiceList("Sort By",["Server Name","Map...`.
function browserChoices()
  return [
    ChoiceList("Servers",["Local","Internet","Favorites"]),
    ChoiceList("Game Type",["All","Free For All","Team Deathmatch","Tournament","Capture the Flag"]),
    ChoiceList("Sort By",["Server Name","Map Name","Open Player Spots","Game Type","Ping Time"]),
    ChoiceList("Punkbuster",["Disabled","Enabled"])
  ]
end function

// ArenaServers_Cache
/// @param state Mutable UI servers2 record/storage; this routine assigns `state.assets`, `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersCache(state,retailActive)
  state.assets=["menu/art/back_0","menu/art/back_1","menu/art/create_0","menu/art/create_1","menu/art/specify_0","menu/art/specify_1","menu/art/refresh_0","menu/art/refresh_1","menu/art/fight_0","menu/art/fight_1","menu/art/arrows_vert_0","menu/art/arrows_vert_top","menu/art/arrows_vert_bot","menu/art/unknownmap","menu/art/pblogo"]
  for each asset in state.assets state.actions=action(state.actions,"renderer","register-shader",asset,"",0,retailActive) end for
  return len(state.assets)
end function

// ArenaServers_MenuInit
/// @param browserMaster Value used by `type=clamp(browserMaster,0,3)`.
/// @param browserGameType Value used by `state.gameFilter=clamp(browserGameType,0,4)`.
/// @param browserSortKey Value used by `state.sortKey=clamp(browserSortKey,0,4)`.
/// @param browserShowFull Value used by `state.showFull=clamp(browserShowFull,0,1)!=0`.
/// @param browserShowEmpty Value used by `state.showEmpty=clamp(browserShowEmpty,0,1)!=0`.
/// @param punkbuster Value used by `state.punkbuster=clamp(punkbuster,0,1)!=0`.
/// @param cvarFavorites Value used by `arenaServersLoadFavorites(state,cvarFavorites,maxPing)`.
/// @param maxPing Value used by `arenaServersLoadFavorites(state,cvarFavorites,maxPing)`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param protocol Value used by `arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)`.
/// @param debugProtocol Value used by `arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,realtime,protocol,debugProtocol,retailActive)
  state=browserState();arenaServersCache(state,retailActive);state.choices=browserChoices();state.items=browserItems();arenaServersLoadFavorites(state,cvarFavorites,maxPing)
  state.gameFilter=clamp(browserGameType,0,4);state.sortKey=clamp(browserSortKey,0,4);state.showFull=clamp(browserShowFull,0,1)!=0;state.showEmpty=clamp(browserShowEmpty,0,1)!=0;state.punkbuster=clamp(punkbuster,0,1)!=0
  type=clamp(browserMaster,0,3);state.masterSelection=type;if state.masterSelection>=1 then state.masterSelection=state.masterSelection-1 end if;arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)
  state.actions=action(state.actions,"cvar","register","debug_protocol","",0,retailActive)
  return state
end function

// UI_ArenaServersMenu
/// @param browserMaster Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param browserGameType Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param browserSortKey Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param browserShowFull Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param browserShowEmpty Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param punkbuster Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param cvarFavorites Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param maxPing Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param protocol Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param debugProtocol Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiArenaServersMenu(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,realtime,protocol,debugProtocol,retailActive)
  state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,realtime,protocol,debugProtocol,retailActive)
  state.actions=action(state.actions,"ui","push","arena-servers","",0,retailActive);return state
end function
