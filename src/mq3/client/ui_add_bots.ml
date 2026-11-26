// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_addbots.c.
package mq3.client.ui_add_bots

import mq3.client.ui_gameinfo as game
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import std.string as strings

const QM_ACTIVATED=3
const GT_TEAM=3
const ID_BACK=10
const ID_GO=11
const ID_LIST=12
const ID_UP=13
const ID_DOWN=14
const ID_SKILL=15
const ID_TEAM=16
const ID_BOTNAME0=20
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ART_FIGHT0="menu/art/accept_0"
const ART_FIGHT1="menu/art/accept_1"
const ART_BACKGROUND="menu/art/addbotframe"
const ART_ARROWS="menu/art/arrows_vert_0"
const ART_ARROWUP="menu/art/arrows_vert_top"
const ART_ARROWDOWN="menu/art/arrows_vert_bot"

/// Stores UI add bots queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.
struct Action boundary kind name text value dispatched end struct
/// Stores UI add bots state, including `data`, `numBots`, `delay`, `baseBotNum`, `selectedBotNum`, `sortedBotNums` and additional values.
struct State data numBots delay baseBotNum selectedBotNum sortedBotNums botnames skill team teamNames teamGrayed visibleCount actions retailActive pushed cached menuEvents end struct

/// Creates a `mq3.client.ui_add_bots.State` record. Assigns `data` from `data`, `retailActive` from `retailActive`.
/// @param data Value used to initialize `State.data`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(data,retailActive) return State(data,0,1000,0,0,[],["","","","","","",""],0,0,["Free"],true,0,[],retailActive,false,false,[]) end function
/// Appends a UI add bots action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI add bots record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI add bots resource.
/// @param text Text consumed or emitted by `emit` in the UI add bots path.
/// @param value Value used by `item=Action("ui-add-bots",kind,name,text,value,not state.retailActive)`.
function emit(state,kind,name,text,value) item=Action("ui-add-bots",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
/// Calls `std.string.toLowerAscii` from UI add bots `compareNames`. The final path returns `0`.
/// @param left Value used by `a=bytes(strings.toLowerAscii(left))`.
/// @param right Value used by `b=bytes(strings.toLowerAscii(right))`.
function compareNames(left,right)
  a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));count=len(a);if len(b)<count then count=len(b) end if;for i=0 to count-1 if a[i]<b[i] then return -1 else if a[i]>b[i] then return 1 end if end for;if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0
end function

// UI_AddBotsMenu_SortCompare
/// @param state Record read through `state.data`.
/// @param first Value used by `a=game.UI_GetBotInfoByNumber(state.data,first)`.
/// @param second Value used by `b=game.UI_GetBotInfoByNumber(state.data,second)`.
function sortCompare(state,first,second) a=game.UI_GetBotInfoByNumber(state.data,first);b=game.UI_GetBotInfoByNumber(state.data,second);if a==void then return 1 end if;if b==void then return -1 end if;return compareNames(info.value(a,"name"),info.value(b,"name")) end function
// UI_AddBotsMenu_GetSortedBotNums
/// @param state Mutable UI add bots record/storage; this routine assigns `state.sortedBotNums`.
function getSortedBotNums(state)
  state.sortedBotNums=[];remaining=[];for n=0 to state.numBots-1 remaining=remaining+[n] end for
  while len(remaining)>0 best=0;if len(remaining)>1 then for n=1 to len(remaining)-1 if sortCompare(state,remaining[n],remaining[best])<0 then best=n end if end for end if;state.sortedBotNums=state.sortedBotNums+[remaining[best]];next=[];for n=0 to len(remaining)-1 if n!=best then next=next+[remaining[n]] end if end for;remaining=next end while;return state.sortedBotNums
end function
// UI_AddBotsMenu_SetBotNames
/// @param state Mutable UI add bots record/storage; this routine assigns `state.botnames`, `state.botnames[n]`.
function setBotNames(state)
  state.botnames=["","","","","","",""];for n=0 to 6 at=state.baseBotNum+n;if at<len(state.sortedBotNums) then botInfo=game.UI_GetBotInfoByNumber(state.data,state.sortedBotNums[at]);if botInfo!=void then state.botnames[n]=info.value(botInfo,"name") end if end if end for;return state.botnames
end function
// UI_AddBotsMenu_FightEvent
/// @param state Mutable UI add bots record/storage; this routine assigns `state.delay`.
/// @param event Event identifier compared with the supported activation/input events.
function fightEvent(state,event)
  if event!=QM_ACTIVATED then return false end if;team=state.teamNames[state.team];skill=state.skill+1;command="addbot "+state.botnames[state.selectedBotNum]+" "+str(skill)+" "+team+" "+str(state.delay)+"\n";emit(state,"execute","addbot",command,2);state.delay=state.delay+1500;return true
end function
// UI_AddBotsMenu_BotEvent
/// @param state Mutable UI add bots record/storage; this routine assigns `state.selectedBotNum`.
/// @param id Value used by `selected=id-ID_BOTNAME0`.
/// @param event Event identifier compared with the supported activation/input events.
function botEvent(state,id,event) if event!=QM_ACTIVATED then return false end if;selected=id-ID_BOTNAME0;if selected<0 or selected>=state.visibleCount then return false end if;state.selectedBotNum=selected;return true end function
// UI_AddBotsMenu_BackEvent
/// @param state Mutable UI add bots record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function backEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","add-bots","",0);return true end function
// UI_AddBotsMenu_UpEvent / UI_AddBotsMenu_DownEvent
/// @param state Mutable UI add bots record/storage; this routine assigns `state.baseBotNum`.
/// @param event Event identifier compared with the supported activation/input events.
function upEvent(state,event) if event!=QM_ACTIVATED or state.baseBotNum<=0 then return false end if;state.baseBotNum=state.baseBotNum-1;setBotNames(state);return true end function
/// Updates `state.baseBotNum` during UI add bots `downEvent`.
/// @param state Mutable UI add bots record/storage; this routine assigns `state.baseBotNum`.
/// @param event Event identifier compared with the supported activation/input events.
function downEvent(state,event) if event!=QM_ACTIVATED or state.baseBotNum+7>=state.numBots then return false end if;state.baseBotNum=state.baseBotNum+1;setBotNames(state);return true end function
// UI_AddBotsMenu_Draw
/// @param state Record read through `state.visibleCount`.
function draw(state) emit(state,"banner","ADD BOTS","",0);emit(state,"pic",ART_BACKGROUND,"",0);emit(state,"menu-draw","add-bots","",0);return state.visibleCount end function
// UI_AddBots_Cache
/// @param state Mutable UI add bots record/storage; this routine assigns `state.cached`.
function cache(state) for each asset in [ART_BACK0,ART_BACK1,ART_FIGHT0,ART_FIGHT1,ART_BACKGROUND,ART_ARROWS,ART_ARROWUP,ART_ARROWDOWN] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 8 end function
// UI_AddBotsMenu_Init
/// @param state Mutable UI add bots record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.delay`, `state.baseBotNum` and additional values.
/// @param gametype Quake III game-type identifier.
/// @param spSkill Value used by `state.skill=numbers.atoi(str(spSkill))-1`.
function init(state,gametype,spSkill)
  state.actions=[];state.menuEvents=[];state.delay=1000;state.baseBotNum=0;state.selectedBotNum=0;cache(state);state.numBots=game.UI_GetNumBots(state.data);state.visibleCount=state.numBots;if state.visibleCount>7 then state.visibleCount=7 end if;state.skill=numbers.atoi(str(spSkill))-1;if state.skill<0 then state.skill=0 end if;if state.skill>4 then state.skill=4 end if;if gametype>=GT_TEAM then state.teamNames=["Red","Blue"];state.teamGrayed=false else state.teamNames=["Free"];state.teamGrayed=true end if;state.team=0;getSortedBotNums(state);setBotNames(state);return state
end function
// UI_AddBotsMenu
/// @param state Mutable UI add bots record/storage; this routine assigns `state.pushed`, `state.menuEvents`.
/// @param gametype Quake III game-type identifier.
/// @param spSkill Value used by `init(state,gametype,spSkill)`.
function addBotsMenu(state,gametype,spSkill) init(state,gametype,spSkill);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","add-bots","",0);return state end function
