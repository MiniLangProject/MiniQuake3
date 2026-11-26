// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.client.ui_start_server
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as numeric
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when mapping game-mode choices into
/// server rules and bot-slot options.
const GT_TOURNAMENT=1
/// Native game-type value for single-player arena progression, used when mapping game-mode choices into
/// server rules and bot-slot options.
const GT_SINGLE_PLAYER=2
/// Native game-type value for team deathmatch, used when mapping game-mode choices into server rules
/// and bot-slot options.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when mapping game-mode choices into server rules
/// and bot-slot options.
const GT_CTF=4
/// Number of configurable player and bot slots exposed by the start-server UI.
const PLAYER_SLOTS=12
/// Number of map choices shown on one start-server selection page.
const MAPS_PER_PAGE=4
/// Number of bot choices shown on one bot-selection page.
const BOTS_PER_PAGE=16
/// Stores UI start server queued engine action, including `boundary`, `kind`, `name`, `value`, `number`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while choosing a map and game rules,
  /// configuring bot slots, and launching a server.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while choosing a map and
  /// game rules, configuring bot slots, and launching a server.
  kind
  /// Map, bot/server-setting cvar, command, menu destination, or artwork resource targeted by server
  /// setup.
  name
  /// Value payload supplied to the selected host operation while choosing a map and game rules,
  /// configuring bot slots, and launching a server.
  value
  /// Numeric argument interpreted by the selected host operation while choosing a map and game rules,
  /// configuring bot slots, and launching a server.
  number
  /// True when this request is marked for native dispatch while choosing a map and game rules,
  /// configuring bot slots, and launching a server; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI start server arena record, including `map`, `type`, `bots`.
struct Arena
  /// Virtual map name loaded when this arena is selected for a local server.
  map
  /// Arena game-type declaration used to filter maps for the selected server rules.
  type
  /// Bot names or bot-selection declaration supplied by the arena definition.
  bots
end struct
/// Stores UI start server bot record, including `name`, `model`.
struct Bot
  /// Bot identity offered by server setup for assignment to a bot player slot.
  name
  /// Model resource selected for rendering the object.
  model
end struct
/// Stores UI start server start state record, including `multiplayer`, `gametype`, `maps`, `mapBits`, `currentMap`, `page` and additional values.
struct StartState
  /// When constructing this record, `startState` supplies `false` for this member.
  multiplayer
  /// Selected game-type menu index, translated through remapGametype before filtering maps or setting
  /// g_gameType.
  gametype
  /// When constructing this record, `startState` supplies an empty list for this member.
  maps
  /// When constructing this record, `startState` supplies an empty list for this member.
  mapBits
  /// When constructing this record, `startState` supplies `0` for this member.
  currentMap
  /// When constructing this record, `startState` supplies `0` for this member.
  page
  /// When constructing this record, `startState` supplies `0` for this member.
  maxPages
  /// When constructing this record, `startState` supplies `"NO MAPS FOUND"` for this member.
  displayName
  /// Host requests queued while choosing a map and game rules, configuring bot slots, and launching a
  /// server, retained in request order.
  actions
end struct
/// Stores UI start server options record, including `multiplayer`, `gametype`, `mapName`, `playerTypes`, `playerNames`, `playerTeams` and additional values.
struct Options
  /// When constructing this record, `options` supplies `false` for this member.
  multiplayer
  /// Actual GT game-rule value used to configure limits, player teams, and the server launch command.
  gametype
  /// Map identifier selected for the server-start command and its levelshot preview.
  mapName
  /// When constructing this record, `options` supplies `array(PLAYER_SLOTS,0)` for this member.
  playerTypes
  /// When constructing this record, `options` supplies `array(PLAYER_SLOTS,"")` for this member.
  playerNames
  /// When constructing this record, `options` supplies `array(PLAYER_SLOTS,0)` for this member.
  playerTeams
  /// When constructing this record, `options` supplies `0` for this member.
  dedicated
  /// When constructing this record, `options` supplies `0` for this member.
  timeLimit
  /// When constructing this record, `options` supplies `0` for this member.
  fragLimit
  /// When constructing this record, `options` supplies `0` for this member.
  flagLimit
  /// When constructing this record, `options` supplies `0` for this member.
  friendlyFire
  /// When constructing this record, `options` supplies an empty string for this member.
  hostname
  /// When constructing this record, `options` supplies `1` for this member.
  pure
  /// Bot difficulty level; zero denotes a human player and native bot levels range from one to five.
  botSkill
  /// Legacy server anti-cheat status advertised to the native server browser.
  punkbuster
  /// When constructing this record, `options` supplies `false` for this member.
  newBot
  /// When constructing this record, `options` supplies `0` for this member.
  newBotIndex
  /// When constructing this record, `options` supplies an empty string for this member.
  newBotName
  /// When constructing this record, `options` supplies `array(PLAYER_SLOTS,false)` for this member.
  visibleNames
  /// When constructing this record, `options` supplies `array(PLAYER_SLOTS,false)` for this member.
  visibleTeams
  /// Host requests queued while choosing a map and game rules, configuring bot slots, and launching a
  /// server, retained in request order.
  actions
end struct
/// Stores UI start server bot state record, including `bots`, `sorted`, `modelPage`, `numPages`, `selected`, `icons` and additional values.
struct BotState
  /// When constructing this record, `botState` supplies an empty list for this member.
  bots
  /// When constructing this record, `botState` supplies an empty list for this member.
  sorted
  /// When constructing this record, `botState` supplies `0` for this member.
  modelPage
  /// When constructing this record, `botState` supplies `0` for this member.
  numPages
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,"")` for this member.
  icons
  /// When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,"")` for this member.
  names
  /// When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,false)` for this member.
  active
  /// When constructing this record, `botState` supplies `array(BOTS_PER_PAGE,false)` for this member.
  alreadySelected
  /// Host requests queued while choosing a map and game rules, configuring bot slots, and launching a
  /// server, retained in request order.
  actions
end struct
/// Creates a `mq3.client.ui_start_server.StartState` record. Initializes the record with the defaults written in this constructor.
function startState() return StartState(false,0,[],[],0,0,0,"NO MAPS FOUND",[]) end function
/// Creates a `mq3.client.ui_start_server.Options` record. Initializes the record with the defaults written in this constructor.
function options() return Options(false,0,"",array(PLAYER_SLOTS,0),array(PLAYER_SLOTS,""),array(PLAYER_SLOTS,0),0,0,0,0,0,"",1,1,0,false,0,"",array(PLAYER_SLOTS,false),array(PLAYER_SLOTS,false),[]) end function
/// Creates a `mq3.client.ui_start_server.BotState` record. Initializes the record with the defaults written in this constructor.
function botState() return BotState([],[],0,0,0,array(BOTS_PER_PAGE,""),array(BOTS_PER_PAGE,""),array(BOTS_PER_PAGE,false),array(BOTS_PER_PAGE,false),[]) end function
/// Calls `mq3.client.ui_start_server.Action` from UI start server `emit`. The final path returns `actions`.
/// @param actions Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI start server resource.
/// @param value Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`.
/// @param number Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function emit(actions,boundary,kind,name,value,number,retailActive) actions=actions+[Action(boundary,kind,name,value,number,not retailActive)];return actions end function
/// Calls `decode`, `slice` from UI start server `words`. The final path returns `effect`.
/// @param text Text consumed or emitted by `words` in the UI start server path.
function words(text) effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;start=at;while at<len(data) and data[at]>32 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end while;return effect end function
// GametypeBits
/// @param text Text consumed or emitted by `gametypeBits` in the UI start server path.
function gametypeBits(text) bits=0;for each token in words(text) key=strings.toLowerAscii(token);if key=="ffa" then bits=bits|(1<<GT_FFA) else if key=="tourney" then bits=bits|(1<<GT_TOURNAMENT) else if key=="single" then bits=bits|(1<<GT_SINGLE_PLAYER) else if key=="team" then bits=bits|(1<<GT_TEAM) else if key=="ctf" then bits=bits|(1<<GT_CTF) end if end for;return bits end function
/// Builds the UI start server `remapGametype` sequence from `[GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index]`.
/// @param index Value used by `return [GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index]`.
function remapGametype(index) return [GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index] end function
// StartServer_Update
/// @param state Mutable UI start server record/storage; this routine assigns `state.currentMap`, `state.displayName`.
function startServerUpdate(state) if len(state.maps)==0 then state.currentMap=0;state.displayName="NO MAPS FOUND";return false end if;if state.currentMap>=len(state.maps) then state.currentMap=len(state.maps)-1 end if;state.displayName=strings.toUpperAscii(state.maps[state.currentMap]);return true end function
/// Adapts `mq3.compat.numeric.trunc32` to UI start server `ntrunc`, returning its result for `value`.
/// @param value Argument 1 of `mq3.compat.numeric.trunc32`.
function ntrunc(value) return numeric.trunc32(value) end function
// StartServer_MapEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.currentMap`.
/// @param slot Value used by `index=state.page*MAPS_PER_PAGE+slot`.
/// @param activated Value used by `if not activated then return false end if`.
function startServerMapEvent(state,slot,activated) if not activated then return false end if;index=state.page*MAPS_PER_PAGE+slot;if index<0 or index>=len(state.maps) then return false end if;state.currentMap=index;startServerUpdate(state);return true end function
// StartServer_GametypeEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.gametype`, `state.maps`, `state.mapBits`, `state.maxPages` and additional values.
/// @param arenas Value used by `for each arena in arenas bits=gametypeBits(arena.type)`.
/// @param index Value assigned to `state.gametype`.
/// @param activated Value used by `if not activated then return false end if`.
function startServerGametypeEvent(state,arenas,index,activated) if not activated then return false end if;state.gametype=index;match=1<<remapGametype(index);if remapGametype(index)==GT_FFA then match=match|(1<<GT_SINGLE_PLAYER) end if;state.maps=[];state.mapBits=[];for each arena in arenas bits=gametypeBits(arena.type);if (bits&match)!=0 and len(state.maps)<64 then state.maps=state.maps+[strings.toUpperAscii(arena.map)];state.mapBits=state.mapBits+[bits] end if end for;state.maxPages=ntrunc((len(state.maps)+MAPS_PER_PAGE-1)/MAPS_PER_PAGE);state.page=0;state.currentMap=0;startServerUpdate(state);return true end function
// StartServer_MenuEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.page`, `state.actions`.
/// @param id Value used by `if id==15 and state.page>0 then state.page=state.page-1`.
/// @param activated Value used by `if not activated then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function startServerMenuEvent(state,id,activated,retailActive) if not activated then return false end if;if id==15 and state.page>0 then state.page=state.page-1;startServerUpdate(state) else if id==16 and state.page<state.maxPages-1 then state.page=state.page+1;startServerUpdate(state) else if id==18 then state.actions=emit(state.actions,"cvar","set","g_gameType",str(remapGametype(state.gametype)),0,retailActive);state.actions=emit(state.actions,"ui","push","server-options","",0,retailActive) else if id==17 then state.actions=emit(state.actions,"ui","pop","start-server","",0,retailActive) end if;return true end function
// StartServer_LevelshotDraw
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param slot Value used by `index=state.page*4+slot`.
/// @param available Value used by `if not available then shader="menu/art/unknownmap" end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function startServerLevelshotDraw(state,slot,available,retailActive) index=state.page*4+slot;if index>=len(state.maps) then return false end if;shader="levelshots/"+state.maps[index];if not available then shader="menu/art/unknownmap" end if;state.actions=emit(state.actions,"renderer","draw-levelshot",shader,state.maps[index],index,retailActive);return true end function
// StartServer_MenuInit
/// @param state Shared UI start server state passed to the helper calls in `startServerMenuInit`.
/// @param arenas Value used by `startServerGametypeEvent(state,arenas,0,true)`.
function startServerMenuInit(state,arenas) startServerGametypeEvent(state,arenas,0,true);return state end function
// StartServer_Cache
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param arenas Value used by `if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(...`.
/// @param buildScript Value used by `if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function startServerCache(state,arenas,buildScript,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/next_0","menu/art/next_1","menu/art/frame2_l","menu/art/frame1_r","menu/art/maps_select","menu/art/maps_selected","menu/art/unknownmap","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] state.actions=emit(state.actions,"renderer","register-shader",name,"",0,retailActive) end for;if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(arena.map),"",0,retailActive) end for end if;return len(state.actions) end function
// UI_StartServerMenu
/// @param state Mutable UI start server record/storage; this routine assigns `state.multiplayer`, `state.actions`.
/// @param arenas Value used by `startServerMenuInit(state,arenas)`.
/// @param multiplayer Value assigned to `state.multiplayer`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiStartServerMenu(state,arenas,multiplayer,retailActive) startServerMenuInit(state,arenas);state.multiplayer=multiplayer;state.actions=emit(state.actions,"ui","push","start-server","",0,retailActive);return state end function
// BotAlreadySelected
/// @param value Record read through `value.playerTypes`, `value.gametype`, `value.playerTeams`, `value.newBotIndex` and additional values.
/// @param name Name used to select or register the corresponding UI start server resource.
function botAlreadySelected(value,name) for i=1 to PLAYER_SLOTS-1 if value.playerTypes[i]==1 and (value.gametype<GT_TEAM or value.playerTeams[i]==value.playerTeams[value.newBotIndex]) and strings.equalsIgnoreCaseAscii(name,value.playerNames[i]) then return true end if end for;return false end function
/// Clamps `value` to the inclusive bounds `low` and `high` for UI start server.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
// ServerOptions_Start
/// @param value Mutable UI start server record/storage; this routine assigns `value.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function serverOptionsStart(value,retailActive) maxClients=0;for i=0 to PLAYER_SLOTS-1 if value.playerTypes[i]!=2 and not (value.playerTypes[i]==1 and value.playerNames[i]=="") then maxClients=maxClients+1 end if end for;uiSets=[];if value.gametype==GT_TOURNAMENT then uiSets=[["ui_tourney_fraglimit",str(value.fragLimit)],["ui_tourney_timelimit",str(value.timeLimit)]] else if value.gametype==GT_TEAM then uiSets=[["ui_team_fraglimit",str(value.fragLimit)],["ui_team_timelimit",str(value.timeLimit)],["ui_team_friendlt",str(value.friendlyFire)]] else if value.gametype==GT_CTF then uiSets=[["ui_ctf_fraglimit",str(value.fragLimit)],["ui_ctf_timelimit",str(value.timeLimit)],["ui_ctf_friendlt",str(value.friendlyFire)]] else uiSets=[["ui_ffa_fraglimit",str(value.fragLimit)],["ui_ffa_timelimit",str(value.timeLimit)]] end if;for each pair in uiSets value.actions=emit(value.actions,"cvar","set",pair[0],pair[1],0,retailActive) end for;sets=[["sv_maxclients",str(clamp(maxClients,0,12))],["dedicated",str(clamp(value.dedicated,0,2))],["timelimit",str(value.timeLimit)],["fraglimit",str(value.fragLimit)],["capturelimit",str(value.flagLimit)],["g_friendlyfire",str(value.friendlyFire)],["sv_pure",str(value.pure)],["sv_hostname",value.hostname],["sv_punkbuster",str(value.punkbuster)]];for each pair in sets value.actions=emit(value.actions,"cvar","set",pair[0],pair[1],0,retailActive) end for;value.actions=emit(value.actions,"command","append","map","wait ; wait ; map "+value.mapName+"\n",0,retailActive);value.actions=emit(value.actions,"command","append","wait","wait 3\n",0,retailActive);for i=1 to PLAYER_SLOTS-1 if value.playerTypes[i]==1 and value.playerNames[i]!="" and strings.substr(value.playerNames[i],0,1)!="-" then command="addbot "+value.playerNames[i]+" "+str(value.botSkill+1);if value.gametype>=GT_TEAM then team="Blue";if value.playerTeams[i]==1 then team="Red" end if;command=command+" "+team end if;value.actions=emit(value.actions,"command","append","addbot",command+"\n",i,retailActive) end if end for;if value.dedicated==0 and value.gametype>=GT_TEAM then team="Blue";if value.playerTeams[0]==1 then team="Red" end if;value.actions=emit(value.actions,"command","append","team","wait 5; team "+team+"\n",0,retailActive) end if;return maxClients end function
// ServerOptions_InitPlayerItems
/// @param value Mutable UI start server record/storage; this routine assigns `value.playerTypes`, `value.playerTypes[i]`, `value.playerTypes[0]`, `value.playerNames[0]` and additional values.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
function serverOptionsInitPlayerItems(value,playerName) initial=1;if value.multiplayer then initial=0 end if;value.playerTypes=array(PLAYER_SLOTS,initial);if value.multiplayer and value.gametype<GT_TEAM then for i=8 to 11 value.playerTypes[i]=2 end for end if;if value.dedicated==0 then value.playerTypes[0]=0;value.playerNames[0]=playerName end if;if value.gametype>=GT_TEAM then for i=0 to 11 value.playerTeams[i]=0;if i>=6 then value.playerTeams[i]=1 end if end for end if;return void end function
// ServerOptions_SetPlayerItems
/// @param value Mutable UI start server record/storage; this routine assigns `value.visibleNames[i]`, `value.visibleTeams[i]`, `value.visibleNames[0]`.
function serverOptionsSetPlayerItems(value) for i=0 to 11 value.visibleNames[i]=value.playerTypes[i]==1;value.visibleTeams[i]=value.gametype>=GT_TEAM and value.playerTypes[i]!=2 end for;if value.dedicated==0 then value.visibleNames[0]=true end if;return void end function
// ServerOptions_Event
/// @param value Mutable UI start server record/storage; this routine assigns `value.actions`.
/// @param id Value used by `if id==23 and activated then serverOptionsStart(value,retailActive)`.
/// @param activated Value used by `if id==23 and activated then serverOptionsStart(value,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function serverOptionsEvent(value,id,activated,retailActive) if id==23 and activated then serverOptionsStart(value,retailActive);return true end if;if id==24 and activated then value.actions=emit(value.actions,"ui","pop","server-options","",0,retailActive);return true end if;serverOptionsSetPlayerItems(value);return id==20 or id==21 or id==22 end function
// ServerOptions_PlayerNameEvent
/// @param value Mutable UI start server record/storage; this routine assigns `value.newBotIndex`, `value.actions`.
/// @param index Value assigned to `value.newBotIndex`.
/// @param activated Value used by `if not activated then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function serverOptionsPlayerNameEvent(value,index,activated,retailActive) if not activated then return false end if;value.newBotIndex=index;value.actions=emit(value.actions,"ui","push","bot-select",value.playerNames[index],index,retailActive);return true end function
// ServerOptions_StatusBar
function serverOptionsStatusBar() return "0 = NO LIMIT" end function
// ServerOptions_LevelshotDraw
/// @param value Mutable UI start server record/storage; this routine assigns `value.playerNames[value.newBotIndex]`, `value.newBot`, `value.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function serverOptionsLevelshotDraw(value,retailActive) if value.newBot then value.playerNames[value.newBotIndex]=value.newBotName;value.newBot=false end if;value.actions=emit(value.actions,"renderer","draw-levelshot","levelshots/"+value.mapName,value.mapName,value.gametype,retailActive);return true end function
// ServerOptions_InitBotNames
/// @param value Mutable UI start server record/storage; this routine assigns `value.playerNames[1]`, `value.playerNames[2]`, `value.playerNames[3]`, `value.playerTypes[3]` and additional values.
/// @param arena Record read through `arena.bots`.
/// @param bots Value used by `for each key in words(arena.bots) for each bot in bots if strings.equalsIgnoreCaseAscii(bot.name,key) and count<12 then value.playerNames[coun...`.
function serverOptionsInitBotNames(value,arena,bots) if value.gametype>=GT_TEAM then value.playerNames[1]="grunt";value.playerNames[2]="major";if value.gametype==GT_TEAM then value.playerNames[3]="visor" else value.playerTypes[3]=2 end if;value.playerTypes[4]=2;value.playerTypes[5]=2;value.playerNames[6]="sarge";value.playerNames[7]="grunt";value.playerNames[8]="major";if value.gametype==GT_TEAM then value.playerNames[9]="visor" else value.playerTypes[9]=2 end if;value.playerTypes[10]=2;value.playerTypes[11]=2;return void end if;count=1;for each key in words(arena.bots) for each bot in bots if strings.equalsIgnoreCaseAscii(bot.name,key) and count<12 then value.playerNames[count]=bot.name;count=count+1 end if end for end for;for i=count to 11 value.playerNames[i]="--------" end for;for i=count to 7 value.playerTypes[i]=0 end for;for i=8 to 11 if value.playerTypes[i]==1 then value.playerTypes[i]=2 end if end for;return void end function
// ServerOptions_SetMenuItems
/// @param value Mutable UI start server record/storage; this routine assigns `value.mapName`, `value.timeLimit`, `value.fragLimit`, `value.flagLimit`.
/// @param mapName Map name used to select the level and its associated assets.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param arena Value used by `serverOptionsInitBotNames(value,arena,bots)`.
/// @param bots Value used by `serverOptionsInitBotNames(value,arena,bots)`.
function serverOptionsSetMenuItems(value,mapName,playerName,arena,bots) value.mapName=strings.toUpperAscii(mapName);value.timeLimit=clamp(value.timeLimit,0,999);value.fragLimit=clamp(value.fragLimit,0,999);value.flagLimit=clamp(value.flagLimit,0,100);serverOptionsInitPlayerItems(value,playerName);serverOptionsSetPlayerItems(value);serverOptionsInitBotNames(value,arena,bots);serverOptionsSetPlayerItems(value);return void end function
// PlayerName_Draw
/// @param value Mutable UI start server record/storage; this routine assigns `value.actions`.
/// @param index Value used by `text=value.playerNames[index]`.
/// @param focused Value used by `value.actions=emit(value.actions,"ui","draw-player-name",text,str(focused),index,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playerNameDraw(value,index,focused,retailActive) text=value.playerNames[index];value.actions=emit(value.actions,"ui","draw-player-name",text,str(focused),index,retailActive);return text end function
// ServerOptions_MenuInit
/// @param value Mutable UI start server record/storage; this routine assigns `value.multiplayer`, `value.gametype`.
/// @param multiplayer Value assigned to `value.multiplayer`.
/// @param gametype Quake III game-type identifier.
/// @param mapName Map name used to select the level and its associated assets.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param arena Value used by `serverOptionsSetMenuItems(value,mapName,playerName,arena,bots)`.
/// @param bots Value used by `serverOptionsSetMenuItems(value,mapName,playerName,arena,bots)`.
function serverOptionsMenuInit(value,multiplayer,gametype,mapName,playerName,arena,bots) value.multiplayer=multiplayer;value.gametype=clamp(gametype,0,5);serverOptionsSetMenuItems(value,mapName,playerName,arena,bots);return value end function
// ServerOptions_Cache
/// @param value Mutable UI start server record/storage; this routine assigns `value.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function serverOptionsCache(value,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/fight_0","menu/art/fight_1","menu/art/maps_select","menu/art/unknownmap"] value.actions=emit(value.actions,"renderer","register-shader",name,"",0,retailActive) end for;return void end function
// UI_ServerOptionsMenu
/// @param value Mutable UI start server record/storage; this routine assigns `value.multiplayer`, `value.actions`.
/// @param multiplayer Value assigned to `value.multiplayer`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiServerOptionsMenu(value,multiplayer,retailActive) value.multiplayer=multiplayer;value.actions=emit(value.actions,"ui","push","server-options","",0,retailActive);return value end function
// UI_BotSelectMenu_SortCompare
/// @param a Record read through `a.name`.
/// @param b Record read through `b.name`.
function botSortCompare(a,b) left=bytes(strings.toLowerAscii(a.name));right=bytes(strings.toLowerAscii(b.name));count=len(left);if len(right)<count then count=len(right) end if;for i=0 to count-1 if left[i]<right[i] then return -1 else if left[i]>right[i] then return 1 end if end for;if len(left)<len(right) then return -1 end if;if len(left)>len(right) then return 1 end if;return 0 end function
// UI_BotSelectMenu_BuildList
/// @param state Mutable UI start server record/storage; this routine assigns `state.bots`, `state.sorted`, `state.modelPage`, `state.numPages`.
/// @param bots Sequence whose length/content is inspected by `botSelectBuildList`.
function botSelectBuildList(state,bots) state.bots=bots;state.sorted=[];remaining=bots;while len(remaining)>0 best=0;if len(remaining)>1 then for i=1 to len(remaining)-1 if botSortCompare(remaining[i],remaining[best])<0 then best=i end if end for end if;state.sorted=state.sorted+[remaining[best]];next=[];for i=0 to len(remaining)-1 if i!=best then next=next+[remaining[i]] end if end for;remaining=next end while;state.modelPage=0;state.numPages=ntrunc((len(bots)+15)/16);return len(bots) end function
// ServerPlayerIcon
/// @param modelAndSkin Sequence whose length/content is inspected by `serverPlayerIcon`.
/// @param skinExists Value used by `if not skinExists and skin!="default" then skin="default" end if`.
function serverPlayerIcon(modelAndSkin,skinExists) slash=-1;for i=0 to len(modelAndSkin)-1 if strings.substr(modelAndSkin,i,1)=="/" then slash=i end if end for;model=modelAndSkin;skin="default";if slash>=0 then model=strings.substr(modelAndSkin,0,slash);skin=strings.substr(modelAndSkin,slash+1,len(modelAndSkin)-slash-1) end if;if not skinExists and skin!="default" then skin="default" end if;return "models/players/"+model+"/icon_"+skin+".tga" end function
// UI_BotSelectMenu_UpdateGrid
/// @param state Mutable UI start server record/storage; this routine assigns `state.active[i]`, `state.names[i]`, `state.icons[i]`, `state.alreadySelected[i]`.
/// @param value Value used by `state.alreadySelected[i]=botAlreadySelected(value,bot.name) else state.active[i]=false`.
function botSelectUpdateGrid(state,value) start=state.modelPage*16;for i=0 to 15 if start+i<len(state.sorted) then state.active[i]=true;bot=state.sorted[start+i];state.names[i]=bot.name;state.icons[i]=serverPlayerIcon(bot.model,true);state.alreadySelected[i]=botAlreadySelected(value,bot.name) else state.active[i]=false;state.names[i]="";state.icons[i]="";state.alreadySelected[i]=false end if end for;return void end function
// UI_BotSelectMenu_Default
/// @param state Mutable UI start server record/storage; this routine assigns `state.selected`.
/// @param name Name used to select or register the corresponding UI start server resource.
function botSelectDefault(state,name) state.selected=0;for i=0 to len(state.sorted)-1 if strings.equalsIgnoreCaseAscii(state.sorted[i].name,name) then state.selected=i end if end for;return state.selected end function
// UI_BotSelectMenu_LeftEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.modelPage`, `state.selected`.
/// @param value Value used by `botSelectUpdateGrid(state,value)`.
/// @param activated Value used by `if activated and state.modelPage>0 then state.modelPage=state.modelPage-1`.
function botSelectLeftEvent(state,value,activated) if activated and state.modelPage>0 then state.modelPage=state.modelPage-1;state.selected=state.modelPage*16;botSelectUpdateGrid(state,value);return true end if;return false end function
// UI_BotSelectMenu_RightEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.modelPage`, `state.selected`.
/// @param value Value used by `botSelectUpdateGrid(state,value)`.
/// @param activated Value used by `if activated and state.modelPage<state.numPages-1 then state.modelPage=state.modelPage+1`.
function botSelectRightEvent(state,value,activated) if activated and state.modelPage<state.numPages-1 then state.modelPage=state.modelPage+1;state.selected=state.modelPage*16;botSelectUpdateGrid(state,value);return true end if;return false end function
// UI_BotSelectMenu_BotEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.selected`.
/// @param index Value tested by `not activated or index<0 or index>=16 or not state.active[index]` before the calculation continues.
/// @param activated Value used by `if not activated or index<0 or index>=16 or not state.active[index] then return false end if`.
function botSelectBotEvent(state,index,activated) if not activated or index<0 or index>=16 or not state.active[index] then return false end if;state.selected=state.modelPage*16+index;return true end function
// UI_BotSelectMenu_BackEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param activated Value used by `if not activated then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function botSelectBackEvent(state,activated,retailActive) if not activated then return false end if;state.actions=emit(state.actions,"ui","pop","bot-select","",0,retailActive);return true end function
// UI_BotSelectMenu_SelectEvent
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param value Mutable UI start server record/storage; this routine assigns `value.newBot`, `value.newBotName`.
/// @param activated Value used by `if not activated or state.selected>=len(state.sorted) then return false end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function botSelectSelectEvent(state,value,activated,retailActive) if not activated or state.selected>=len(state.sorted) then return false end if;value.newBot=true;value.newBotName=state.sorted[state.selected].name;state.actions=emit(state.actions,"ui","pop","bot-select","",0,retailActive);return true end function
// UI_BotSelectMenu_Cache
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function botSelectCache(state,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/accept_0","menu/art/accept_1","menu/art/opponents_select","menu/art/opponents_selected","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] state.actions=emit(state.actions,"renderer","register-shader",name,"",0,retailActive) end for;return void end function
// UI_BotSelectMenu_Init
/// @param state Mutable UI start server record/storage; this routine assigns `state.modelPage`.
/// @param value Value used by `botSelectUpdateGrid(state,value)`.
/// @param bots Value used by `botSelectBuildList(state,bots)`.
/// @param selected Value used by `botSelectDefault(state,selected)`.
function botSelectInit(state,value,bots,selected) botSelectBuildList(state,bots);botSelectDefault(state,selected);state.modelPage=ntrunc(state.selected/16);botSelectUpdateGrid(state,value);return state end function
// UI_BotSelectMenu
/// @param state Mutable UI start server record/storage; this routine assigns `state.actions`.
/// @param value Value used by `botSelectInit(state,value,bots,selected)`.
/// @param bots Value used by `botSelectInit(state,value,bots,selected)`.
/// @param selected Value used by `botSelectInit(state,value,bots,selected)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiBotSelectMenu(state,value,bots,selected,retailActive) botSelectInit(state,value,bots,selected);state.actions=emit(state.actions,"ui","push","bot-select","",0,retailActive);return state end function
