// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_removebots.c.
package mq3.client.ui_remove_bots

import mq3.shared.info as info
import mq3.compat.textnumbers as numbers

const QM_ACTIVATED=3
const ID_UP=10
const ID_DOWN=11
const ID_DELETE=12
const ID_BACK=13
const ID_BOTNAME0=20
const ART_BACKGROUND="menu/art/addbotframe"
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ART_DELETE0="menu/art/delete_0"
const ART_DELETE1="menu/art/delete_1"
const ART_ARROWS="menu/art/arrows_vert_0"
const ART_ARROWUP="menu/art/arrows_vert_top"
const ART_ARROWDOWN="menu/art/arrows_vert_bot"

/// Stores UI remove bots queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.
struct Action boundary kind name text value dispatched end struct
/// Stores UI remove bots state, including `playerInfos`, `numBots`, `baseBotNum`, `selectedBotNum`, `botnames`, `botClientNums` and additional values.
struct State playerInfos numBots baseBotNum selectedBotNum botnames botClientNums visibleCount actions retailActive pushed cached menuEvents end struct

/// Creates a `mq3.client.ui_remove_bots.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State([],0,0,0,["","","","","","",""],[],0,[],retailActive,false,false,[]) end function
/// Appends a UI remove bots action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI remove bots resource.
/// @param text Text consumed or emitted by `emit` in the UI remove bots path.
/// @param value Value used by `item=Action("ui-remove-bots",kind,name,text,value,not state.retailActive)`.
function emit(state,kind,name,text,value) item=Action("ui-remove-bots",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
/// Evaluates UI remove bots `clean` and returns `result` according to its guard/selection conditions.
/// @param value Sequence read at `value[at]`, `value[at+1]`.
function clean(value) result="";at=0;while at<len(value) if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else result=result+value[at];at=at+1 end if end while;return result end function

// UI_RemoveBotsMenu_GetBots
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.playerInfos`, `state.botClientNums`, `state.numBots`.
/// @param serverInfo Value used by `maxClients=numbers.atoi(info.value(serverInfo,"sv_maxclients"))`.
/// @param playerInfos Sequence read at `playerInfos[n]`.
function getBots(state,serverInfo,playerInfos)
  state.playerInfos=playerInfos;state.botClientNums=[];state.numBots=0;maxClients=numbers.atoi(info.value(serverInfo,"sv_maxclients"));if maxClients>len(playerInfos) then maxClients=len(playerInfos) end if;for n=0 to maxClients-1 player=playerInfos[n];if numbers.atoi(info.value(player,"skill"))!=0 then state.botClientNums=state.botClientNums+[n];state.numBots=state.numBots+1 end if end for;return state.numBots
end function
// UI_RemoveBotsMenu_SetBotNames
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.botnames`, `state.botnames[n]`.
function setBotNames(state)
  state.botnames=["","","","","","",""];for n=0 to 6 at=state.baseBotNum+n;if at<state.numBots then client=state.botClientNums[at];if client>=0 and client<len(state.playerInfos) then state.botnames[n]=clean(info.value(state.playerInfos[client],"n")) end if end if end for;return state.botnames
end function
// UI_RemoveBotsMenu_DeleteEvent
/// @param state Record read through `state.numBots`, `state.baseBotNum`, `state.selectedBotNum`, `state.botClientNums`.
/// @param event Event identifier compared with the supported activation/input events.
function deleteEvent(state,event) if event!=QM_ACTIVATED or state.numBots==0 then return false end if;at=state.baseBotNum+state.selectedBotNum;if at<0 or at>=len(state.botClientNums) then return false end if;client=state.botClientNums[at];emit(state,"execute","clientkick","clientkick "+str(client)+"\n",2);return true end function
// UI_RemoveBotsMenu_BotEvent
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.selectedBotNum`.
/// @param id Value used by `selected=id-ID_BOTNAME0`.
/// @param event Event identifier compared with the supported activation/input events.
function botEvent(state,id,event) if event!=QM_ACTIVATED then return false end if;selected=id-ID_BOTNAME0;if selected<0 or selected>=state.visibleCount then return false end if;state.selectedBotNum=selected;return true end function
// UI_RemoveBotsMenu_BackEvent
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function backEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","remove-bots","",0);return true end function
// UI_RemoveBotsMenu_UpEvent / UI_RemoveBotsMenu_DownEvent
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.baseBotNum`.
/// @param event Event identifier compared with the supported activation/input events.
function upEvent(state,event) if event!=QM_ACTIVATED or state.baseBotNum<=0 then return false end if;state.baseBotNum=state.baseBotNum-1;setBotNames(state);return true end function
/// Updates `state.baseBotNum` during UI remove bots `downEvent`.
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.baseBotNum`.
/// @param event Event identifier compared with the supported activation/input events.
function downEvent(state,event) if event!=QM_ACTIVATED or state.baseBotNum+7>=state.numBots then return false end if;state.baseBotNum=state.baseBotNum+1;setBotNames(state);return true end function
// UI_RemoveBots_Cache
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.cached`.
function cache(state) for each asset in [ART_BACKGROUND,ART_BACK0,ART_BACK1,ART_DELETE0,ART_DELETE1] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 5 end function
// UI_RemoveBotsMenu_Init
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.baseBotNum`, `state.selectedBotNum` and additional values.
/// @param serverInfo Value used by `getBots(state,serverInfo,playerInfos)`.
/// @param playerInfos Value used by `getBots(state,serverInfo,playerInfos)`.
function init(state,serverInfo,playerInfos) state.actions=[];state.menuEvents=[];state.baseBotNum=0;state.selectedBotNum=0;cache(state);getBots(state,serverInfo,playerInfos);setBotNames(state);state.visibleCount=state.numBots;if state.visibleCount>7 then state.visibleCount=7 end if;return state end function
// UI_RemoveBotsMenu
/// @param state Mutable UI remove bots record/storage; this routine assigns `state.pushed`, `state.menuEvents`.
/// @param serverInfo Value used by `init(state,serverInfo,playerInfos)`.
/// @param playerInfos Value used by `init(state,serverInfo,playerInfos)`.
function removeBotsMenu(state,serverInfo,playerInfos) init(state,serverInfo,playerInfos);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","remove-bots","",0);return state end function
