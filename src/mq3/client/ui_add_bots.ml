// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_addbots.c.
package mq3.client.ui_add_bots

import mq3.client.ui_gameinfo as game
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import std.string as strings

/// Activation callback event accepted by the Add Bots menu before it processes the selected control
/// action.
const QM_ACTIVATED=3
/// Native game-type value for team deathmatch, used when deciding whether bot additions require a team
/// selection.
const GT_TEAM=3
/// Native Back-control identifier exposed by the Add Bots menu for returning to the surrounding menu.
const ID_BACK=10
/// Menu control identifier routed to the go action by the menu event handler.
const ID_GO=11
/// Menu control identifier routed to the list action by the menu event handler.
const ID_LIST=12
/// Menu control identifier routed to the up action by the menu event handler.
const ID_UP=13
/// Menu control identifier routed to the down action by the menu event handler.
const ID_DOWN=14
/// Menu control identifier routed to the skill action by the menu event handler.
const ID_SKILL=15
/// Menu control identifier routed to the team action by the menu event handler.
const ID_TEAM=16
/// Menu control identifier routed to the botname0 action by the menu event handler.
const ID_BOTNAME0=20
/// Virtual shader or image asset name used for the menu's back0 artwork.
const ART_BACK0="menu/art/back_0"
/// Virtual shader or image asset name used for the menu's back1 artwork.
const ART_BACK1="menu/art/back_1"
/// Virtual shader or image asset name used for the menu's fight0 artwork.
const ART_FIGHT0="menu/art/accept_0"
/// Virtual shader or image asset name used for the menu's fight1 artwork.
const ART_FIGHT1="menu/art/accept_1"
/// Virtual shader or image asset name used for the menu's background artwork.
const ART_BACKGROUND="menu/art/addbotframe"
/// Virtual shader or image asset name used for the menu's arrows artwork.
const ART_ARROWS="menu/art/arrows_vert_0"
/// Virtual shader or image asset name used for the menu's arrowup artwork.
const ART_ARROWUP="menu/art/arrows_vert_top"
/// Virtual shader or image asset name used for the menu's arrowdown artwork.
const ART_ARROWDOWN="menu/art/arrows_vert_bot"

/// Stores UI add bots queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while populating bot choices and issuing
  /// bot-addition commands.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while populating bot
  /// choices and issuing bot-addition commands.
  kind
  /// Bot-menu target or media asset, or the addbot command name, selected by the action kind.
  name
  /// Complete addbot command assembled from the selected bot, skill, team, and delay; empty for menu
  /// and asset actions.
  text
  /// Value payload supplied to the selected host operation while populating bot choices and issuing
  /// bot-addition commands.
  value
  /// True when this request is marked for native dispatch while populating bot choices and issuing
  /// bot-addition commands; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI add bots state, including `data`, `numBots`, `delay`, `baseBotNum`, `selectedBotNum`, `sortedBotNums` and additional values.
struct State
  /// When constructing this record, `create` supplies `data` for this member. Used by `sortCompare` and
  /// `setBotNames` during subsequent processing.
  data
  /// When constructing this record, `create` supplies `0` for this member. Used by `getSortedBotNums`
  /// and `downEvent` during subsequent processing.
  numBots
  /// When constructing this record, `create` supplies `1000` for this member. Used by `fightEvent` and
  /// `init` during subsequent processing.
  delay
  /// When constructing this record, `create` supplies `0` for this member. Used by `setBotNames` and
  /// `upEvent` during subsequent processing.
  baseBotNum
  /// When constructing this record, `create` supplies `0` for this member. Used by `fightEvent` and
  /// `botEvent` during subsequent processing.
  selectedBotNum
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `getSortedBotNums` and `setBotNames` during subsequent processing.
  sortedBotNums
  /// When constructing this record, `create` supplies `["","","","","","",""]` for this member. Used by
  /// `setBotNames` and `fightEvent` during subsequent processing.
  botnames
  /// When constructing this record, `create` supplies `0` for this member. Used by `fightEvent` and
  /// `init` during subsequent processing.
  skill
  /// Selected index into the team-name menu used when constructing an addbot command.
  team
  /// When constructing this record, `create` supplies `["Free"]` for this member. Used by `fightEvent`
  /// and `init` during subsequent processing.
  teamNames
  /// When constructing this record, `create` supplies `true` for this member. Used by `init` during
  /// subsequent processing.
  teamGrayed
  /// When constructing this record, `create` supplies `0` for this member. Used by `botEvent` and
  /// `draw` during subsequent processing.
  visibleCount
  /// Host requests queued while populating bot choices and issuing bot-addition commands, retained in
  /// request order.
  actions
  /// True when the retail QVM owns the Add Bots menu, so the native observer records requests without
  /// emitting duplicate host effects.
  retailActive
  /// Records that the Add Bots menu has been opened on the active menu stack.
  pushed
  /// True once the module's required media has been cached or registered.
  cached
  /// Menu-stack and selection events queued for the host adapter.
  menuEvents
end struct

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
