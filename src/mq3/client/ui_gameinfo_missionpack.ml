// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/ui/ui_gameinfo.c (Missionpack UI path).
package mq3.client.ui_gameinfo_missionpack

import mq3.client.ui_gameinfo as base
import mq3.shared.info as info
import std.string as strings

/// Capacity limit for the maps collection or bounded storage used by this client module.
const MAX_MAPS=128
/// Capacity limit for the arenas collection or bounded storage used by this client module.
const MAX_ARENAS=1024
/// Capacity limit for the bots collection or bounded storage used by this client module.
const MAX_BOTS=1024
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when building Missionpack arena
/// game-type masks.
const GT_TOURNAMENT=1
/// Single-player game-type identifier retained by the Missionpack arena metadata interface alongside
/// its supported mode definitions.
const GT_SINGLE_PLAYER=2
/// Team-deathmatch game-type identifier retained by the Missionpack arena metadata interface alongside
/// its supported mode definitions.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when building Missionpack arena game-type masks.
const GT_CTF=4
/// Native game-type identifier selecting one-flag capture the flag.
const GT_1FCTF=5
/// Native game-type identifier selecting Overload.
const GT_OBELISK=6
/// Native game-type identifier selecting Harvester.
const GT_HARVESTER=7
/// Upper game-type count used to bound the Missionpack UI's game-mode tables.
const GT_MAX_GAME_TYPE=8

/// Stores UI gameinfo missionpack map info record, including `cinematic`, `mapLoadName`, `mapName`, `levelShot`, `imageName`, `typeBits` and additional values.
struct MapInfo
  /// When constructing this record, `mapInfo` supplies `-1` for this member.
  cinematic
  /// When constructing this record, `mapInfo` supplies `loadName` for this member.
  mapLoadName
  /// Virtual map name used to identify and launch this arena definition.
  mapName
  /// True while producing the menu screenshot for the current level.
  levelShot
  /// Levelshot image name associated with this Missionpack arena entry.
  imageName
  /// When constructing this record, `mapInfo` supplies `arenaTypeBits(info.value(arena,"type"))` for
  /// this member.
  typeBits
  /// When constructing this record, `mapInfo` supplies `number` for this member.
  skirmishNumber
end struct
/// Stores UI gameinfo missionpack queued engine action, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while loading Missionpack arena and bot
  /// definitions.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while loading Missionpack
  /// arena and bot definitions.
  kind
  /// Arena or bot-definition filename referenced by the Missionpack filesystem request.
  name
  /// Definition-file category attached to the Missionpack read request: arena or bot.
  text
  /// Numeric argument interpreted by the selected host operation while loading Missionpack arena and
  /// bot definitions.
  number
  /// True when this request is marked for native dispatch while loading Missionpack arena and bot
  /// definitions; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI gameinfo missionpack state, including `data`, `arenaInfos`, `botInfos`, `maps`, `gameTypeCounts`, `diagnostics` and additional values.
struct State
  /// When constructing this record, `create` supplies `base.create()` for this member. Used by `sync`
  /// and `UI_ParseInfos` during subsequent processing.
  data
  /// When constructing this record, `create` supplies an empty list for this member. Used by `sync` and
  /// `UI_LoadArenas` during subsequent processing.
  arenaInfos
  /// When constructing this record, `create` supplies an empty list for this member. Used by `sync` and
  /// `UI_LoadBots` during subsequent processing.
  botInfos
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_LoadArenas` during subsequent processing.
  maps
  /// When constructing this record, `create` supplies `array(GT_MAX_GAME_TYPE,0)` for this member. Used
  /// by `UI_LoadArenas` during subsequent processing.
  gameTypeCounts
  /// When constructing this record, `create` supplies an empty list for this member. Used by `sync`
  /// during subsequent processing.
  diagnostics
  /// Host requests queued while loading Missionpack arena and bot definitions, retained in request
  /// order.
  actions
  /// True when the retail QVM owns Missionpack arena and bot metadata, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
end struct

/// Creates a `mq3.client.ui_gameinfo_missionpack.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive)
  return State(base.create(),[],[],[],array(GT_MAX_GAME_TYPE,0),[],[],retailActive)
end function
/// Appends a UI gameinfo missionpack action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI gameinfo missionpack record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI gameinfo missionpack resource.
/// @param text Text consumed or emitted by `emit` in the UI gameinfo missionpack path.
/// @param number Value used by `action=Action(boundary,kind,name,text,number,not state.retailActive)`.
function emit(state,boundary,kind,name,text,number)
  action=Action(boundary,kind,name,text,number,not state.retailActive);state.actions=state.actions+[action];return action
end function
/// Updates `state.arenaInfos`, `state.botInfos`, `state.diagnostics` during UI gameinfo missionpack `sync`.
/// @param state Mutable UI gameinfo missionpack record/storage; this routine assigns `state.arenaInfos`, `state.botInfos`, `state.diagnostics`.
function sync(state) state.arenaInfos=state.data.arenas;state.botInfos=state.data.bots;state.diagnostics=state.data.diagnostics;return state end function
/// Computes `strings.indexOf(text,part,0)>=0` for UI gameinfo missionpack `contains`.
/// @param text Text consumed or emitted by `contains` in the UI gameinfo missionpack path.
/// @param part Value used by `return strings.indexOf(text,part,0)>=0`.
function contains(text,part) return strings.indexOf(text,part,0)>=0 end function

// UI_ParseInfos
/// @param state Record read through `state.data`.
/// @param text Text consumed or emitted by `UI_ParseInfos` in the UI gameinfo missionpack path.
/// @param max Value used by `parsed=base.UI_ParseInfos(state.data,text,max)`.
function UI_ParseInfos(state,text,max)
  parsed=base.UI_ParseInfos(state.data,text,max);sync(state);return parsed
end function

// UI_LoadArenasFromFile
/// @param state Record read through `state.data`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param text Text consumed or emitted by `UI_LoadArenasFromFile` in the UI gameinfo missionpack path.
function UI_LoadArenasFromFile(state,filename,text)
  emit(state,"filesystem","read",filename,"arena",0);count=base.UI_LoadArenasFromFile(state.data,filename,text);sync(state);return count
end function

/// Calls `mq3.client.ui_gameinfo_missionpack.contains` from UI gameinfo missionpack `arenaTypeBits`. The final path returns `bits`.
/// @param type Value used by `if type=="" then return 1<<GT_FFA end if`.
function arenaTypeBits(type)
  bits=0
  if type=="" then return 1<<GT_FFA end if
  if contains(type,"ffa") then bits=bits|(1<<GT_FFA) end if
  if contains(type,"tourney") then bits=bits|(1<<GT_TOURNAMENT) end if
  if contains(type,"ctf") then bits=bits|(1<<GT_CTF) end if
  if contains(type,"oneflag") then bits=bits|(1<<GT_1FCTF) end if
  if contains(type,"overload") then bits=bits|(1<<GT_OBELISK) end if
  if contains(type,"harvester") then bits=bits|(1<<GT_HARVESTER) end if
  return bits
end function
/// Calls `mq3.shared.info.value`, `mq3.client.ui_gameinfo_missionpack.MapInfo`, `mq3.client.ui_gameinfo_missionpack.arenaTypeBits` from UI gameinfo missionpack `mapInfo`.
/// @param arena Value used by `loadName=info.value(arena,"map")`.
/// @param number Value used by `return MapInfo(-1,loadName,info.value(arena,"longname"),-1,"levelshots/"+loadName,arenaTypeBits(info.value(arena,"type")),number)`.
function mapInfo(arena,number)
  loadName=info.value(arena,"map");return MapInfo(-1,loadName,info.value(arena,"longname"),-1,"levelshots/"+loadName,arenaTypeBits(info.value(arena,"type")),number)
end function

// UI_LoadArenas
/// @param state Mutable UI gameinfo missionpack record/storage; this routine assigns `state.data.arenas`, `state.data.diagnostics`, `state.arenaInfos`, `state.maps` and additional values.
/// @param primaryName Value used by `UI_LoadArenasFromFile(state,primaryName,primaryText)`.
/// @param primaryText Value used by `UI_LoadArenasFromFile(state,primaryName,primaryText)`.
/// @param additionalFiles Value used by `for each entry in additionalFiles UI_LoadArenasFromFile(state,entry[0],entry[1]) end for`.
function UI_LoadArenas(state,primaryName,primaryText,additionalFiles)
  state.data.arenas=[];state.data.diagnostics=[];state.arenaInfos=[];state.maps=[];state.gameTypeCounts=array(GT_MAX_GAME_TYPE,0)
  UI_LoadArenasFromFile(state,primaryName,primaryText)
  for each entry in additionalFiles UI_LoadArenasFromFile(state,entry[0],entry[1]) end for
  base.diagnostic(state.data,str(len(state.data.arenas))+" arenas parsed\n");if state.data.outOfMemory then base.diagnostic(state.data,"^3WARNING: not anough memory in pool to load all arenas\n") end if
  count=len(state.data.arenas);if count>MAX_MAPS then count=MAX_MAPS end if
  if count>0 then for index=0 to count-1
    map=mapInfo(state.data.arenas[index],index);state.maps=state.maps+[map]
    for gameType=0 to GT_MAX_GAME_TYPE-1 if (map.typeBits&(1<<gameType))!=0 then state.gameTypeCounts[gameType]=state.gameTypeCounts[gameType]+1 end if end for
  end for end if
  sync(state);return len(state.maps)
end function

// UI_LoadBotsFromFile
/// @param state Record read through `state.data`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param text Text consumed or emitted by `UI_LoadBotsFromFile` in the UI gameinfo missionpack path.
function UI_LoadBotsFromFile(state,filename,text)
  emit(state,"filesystem","read",filename,"bot",0);count=base.UI_LoadBotsFromFile(state.data,filename,text);sync(state);return count
end function

// UI_LoadBots
/// @param state Mutable UI gameinfo missionpack record/storage; this routine assigns `state.data.bots`, `state.botInfos`.
/// @param primaryName Value used by `UI_LoadBotsFromFile(state,primaryName,primaryText)`.
/// @param primaryText Value used by `UI_LoadBotsFromFile(state,primaryName,primaryText)`.
/// @param additionalFiles Value used by `for each entry in additionalFiles UI_LoadBotsFromFile(state,entry[0],entry[1]) end for`.
function UI_LoadBots(state,primaryName,primaryText,additionalFiles)
  state.data.bots=[];state.botInfos=[]
  UI_LoadBotsFromFile(state,primaryName,primaryText)
  for each entry in additionalFiles UI_LoadBotsFromFile(state,entry[0],entry[1]) end for
  base.diagnostic(state.data,str(len(state.data.bots))+" bots parsed\n");sync(state);return len(state.botInfos)
end function

// UI_GetBotInfoByNumber
/// @param state Record read through `state.data`.
/// @param num Value used by `value=base.UI_GetBotInfoByNumber(state.data,num)`.
function UI_GetBotInfoByNumber(state,num)
  value=base.UI_GetBotInfoByNumber(state.data,num);sync(state);return value
end function

// UI_GetBotInfoByName
/// @param state Record read through `state.data`.
/// @param name Argument 2 of `mq3.client.ui_gameinfo.UI_GetBotInfoByName`.
function UI_GetBotInfoByName(state,name) return base.UI_GetBotInfoByName(state.data,name) end function

// UI_GetNumBots
/// @param state Record read through `state.botInfos`.
function UI_GetNumBots(state) return len(state.botInfos) end function

// UI_GetBotNameByNumber
/// @param state Shared UI gameinfo missionpack state passed to the helper calls in `UI_GetBotNameByNumber`.
/// @param num Value used by `bot=UI_GetBotInfoByNumber(state,num)`.
function UI_GetBotNameByNumber(state,num)
  bot=UI_GetBotInfoByNumber(state,num);if bot==void then return "Sarge" end if;return info.value(bot,"name")
end function
