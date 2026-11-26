// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_cinematics.c.
package mq3.client.ui_cinematics

import mq3.client.ui_gameinfo as game

const QM_ACTIVATED=3
const ID_BACK=10
const ID_CIN_IDLOGO=11
const ID_CIN_END=20
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ART_FRAMEL="menu/art/frame2_l"
const ART_FRAMER="menu/art/frame1_r"

/// Stores UI cinematics queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.
struct Action boundary kind name text value dispatched end struct
/// Stores UI cinematics state, including `data`, `demoVersion`, `names`, `labels`, `enabled`, `cursor` and additional values.
struct State data demoVersion names labels enabled cursor actions retailActive cached pushed menuEvents end struct

/// Creates a `mq3.client.ui_cinematics.State` record. Assigns `data` from `data`, `demoVersion` from `demoVersion`, `retailActive` from `retailActive`.
/// @param data Value used to initialize `State.data`.
/// @param demoVersion Value used to initialize `State.demoVersion`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(data,demoVersion,retailActive) return State(data,demoVersion,["idlogo","intro","tier1","tier2","tier3","tier4","tier5","tier6","tier7","end"],["ID LOGO","INTRO","Tier 1","Tier 2","Tier 3","Tier 4","Tier 5","Tier 6","Tier 7","END"],array(10,false),0,[],retailActive,false,false,[]) end function
/// Appends a UI cinematics action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI cinematics resource.
/// @param text Text consumed or emitted by `emit` in the UI cinematics path.
/// @param value Value used by `item=Action("ui-cinematics",kind,name,text,value,not state.retailActive)`.
function emit(state,kind,name,text,value) item=Action("ui-cinematics",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
// UI_CinematicsMenu_BackEvent
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function backEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","cinematics","",0);return true end function
// UI_CinematicsMenu_Event
/// @param state Record read through `state.names`, `state.demoVersion`.
/// @param id Value used by `n=id-ID_CIN_IDLOGO`.
/// @param event Event identifier compared with the supported activation/input events.
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if;n=id-ID_CIN_IDLOGO;if n<0 or n>=len(state.names) then return false end if;emit(state,"set-cvar","nextmap","ui_cinematics "+str(n),n);command="disconnect; cinematic "+state.names[n]+".RoQ\n";if state.demoVersion and id==ID_CIN_END then command="disconnect; cinematic demoEnd.RoQ 1\n" end if;emit(state,"execute","cinematic",command,2);return true
end function
// UI_CinematicsMenu_Cache
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.cached`.
function cache(state) for each asset in [ART_BACK0,ART_BACK1,ART_FRAMEL,ART_FRAMER] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 4 end function
// UI_CinematicsMenu_Init
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.enabled`, `state.enabled[0]` and additional values.
function init(state)
  state.actions=[];state.menuEvents=[];cache(state);state.enabled=array(10,false);state.enabled[0]=true;state.enabled[1]=not state.demoVersion;for tier=1 to 7 state.enabled[tier+1]=game.UI_CanShowTierVideo(state.data,tier) end for;state.enabled[9]=game.UI_CanShowTierVideo(state.data,8);state.cursor=0;return state
end function
// UI_CinematicsMenu / UI_CinematicsMenu_f
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.pushed`, `state.menuEvents`.
function cinematicsMenu(state) init(state);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","cinematics","",0);return state end function
/// Updates `state.cursor`, `state.menuEvents` during UI cinematics `cinematicsMenuF`.
/// @param state Mutable UI cinematics record/storage; this routine assigns `state.cursor`, `state.menuEvents`.
/// @param index Value assigned to `state.cursor`.
function cinematicsMenuF(state,index) cinematicsMenu(state);state.cursor=index;if state.cursor<0 then state.cursor=0 end if;if state.cursor>9 then state.cursor=9 end if;state.menuEvents=state.menuEvents+[["cursor",state.cursor]];return state end function
