// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/ui/ui_gameinfo.c (Missionpack UI path).
package mq3.client.ui_gameinfo_missionpack

import mq3.client.ui_gameinfo as base
import mq3.shared.info as info
import std.string as strings

const MAX_MAPS=128
const MAX_ARENAS=1024
const MAX_BOTS=1024
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const GT_MAX_GAME_TYPE=8

struct MapInfo cinematic mapLoadName mapName levelShot imageName typeBits skirmishNumber end struct
struct Action boundary kind name text number dispatched end struct
struct State data arenaInfos botInfos maps gameTypeCounts diagnostics actions retailActive end struct

function create(retailActive)
  return State(base.create(),[],[],[],array(GT_MAX_GAME_TYPE,0),[],[],retailActive)
end function
function emit(state,boundary,kind,name,text,number)
  action=Action(boundary,kind,name,text,number,not state.retailActive);state.actions=state.actions+[action];return action
end function
function sync(state) state.arenaInfos=state.data.arenas;state.botInfos=state.data.bots;state.diagnostics=state.data.diagnostics;return state end function
function contains(text,part) return strings.indexOf(text,part,0)>=0 end function

// UI_ParseInfos
function UI_ParseInfos(state,text,max)
  parsed=base.UI_ParseInfos(state.data,text,max);sync(state);return parsed
end function

// UI_LoadArenasFromFile
function UI_LoadArenasFromFile(state,filename,text)
  emit(state,"filesystem","read",filename,"arena",0);count=base.UI_LoadArenasFromFile(state.data,filename,text);sync(state);return count
end function

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
function mapInfo(arena,number)
  loadName=info.value(arena,"map");return MapInfo(-1,loadName,info.value(arena,"longname"),-1,"levelshots/"+loadName,arenaTypeBits(info.value(arena,"type")),number)
end function

// UI_LoadArenas
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
function UI_LoadBotsFromFile(state,filename,text)
  emit(state,"filesystem","read",filename,"bot",0);count=base.UI_LoadBotsFromFile(state.data,filename,text);sync(state);return count
end function

// UI_LoadBots
function UI_LoadBots(state,primaryName,primaryText,additionalFiles)
  state.data.bots=[];state.botInfos=[]
  UI_LoadBotsFromFile(state,primaryName,primaryText)
  for each entry in additionalFiles UI_LoadBotsFromFile(state,entry[0],entry[1]) end for
  base.diagnostic(state.data,str(len(state.data.bots))+" bots parsed\n");sync(state);return len(state.botInfos)
end function

// UI_GetBotInfoByNumber
function UI_GetBotInfoByNumber(state,num)
  value=base.UI_GetBotInfoByNumber(state.data,num);sync(state);return value
end function

// UI_GetBotInfoByName
function UI_GetBotInfoByName(state,name) return base.UI_GetBotInfoByName(state.data,name) end function

// UI_GetNumBots
function UI_GetNumBots(state) return len(state.botInfos) end function

// UI_GetBotNameByNumber
function UI_GetBotNameByNumber(state,num)
  bot=UI_GetBotInfoByNumber(state,num);if bot==void then return "Sarge" end if;return info.value(bot,"name")
end function
