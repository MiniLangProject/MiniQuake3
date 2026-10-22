// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_cdkey.c.
package mq3.client.ui_cdkey

import std.string as strings

const QM_ACTIVATED=3
const ID_CDKEY=10
const ID_ACCEPT=11
const ID_BACK=12
const ART_FRAME="menu/art/cut_frame"
const ART_ACCEPT0="menu/art/accept_0"
const ART_ACCEPT1="menu/art/accept_1"
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"

struct Action boundary kind name text value dispatched end struct
struct Draw buffer focus cursorChar message status end struct
struct State buffer cursor focus overstrike menuDepth backVisible verified actions retailActive cached pushed menuEvents end struct

function create(retailActive) return State("",0,false,false,0,false,false,[],retailActive,false,false,[]) end function
function emit(state,kind,name,text,value) item=Action("ui-cdkey",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
// UI_CDKeyMenu_PreValidateKey
function preValidateKey(key)
  if len(key)!=16 then return 1 end if;allowed="237abcdghjlprstw";for each ch in key found=false;for each accept in allowed if ch==accept then found=true;break end if end for;if not found then return -1 end if end for;return 0
end function
// UI_CDKeyMenu_DrawKey
function drawKey(state)
  value=preValidateKey(state.buffer);message="The CD Key is not valid";if value==1 then message="Please enter your CD Key" else if value==0 then message="The CD Key appears to be valid, thank you" end if;cursor=0;if state.focus then if state.overstrike then cursor=11 else cursor=10 end if end if;emit(state,"field","cdkey",state.buffer,state.cursor);emit(state,"status","validation",message,value);if cursor!=0 then emit(state,"cursor","cdkey",str(cursor),state.cursor) end if;return Draw(state.buffer,state.focus,cursor,message,value)
end function
// UI_CDKeyMenu_Event
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if;if id==ID_ACCEPT then if len(state.buffer)>0 then emit(state,"set-cdkey","cdkey",state.buffer,0) end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","cdkey","",0);return true else if id==ID_BACK then state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","cdkey","",0);return true end if;return false
end function
// UI_CDKeyMenu_Cache
function cache(state) for each asset in [ART_ACCEPT0,ART_ACCEPT1,ART_BACK0,ART_BACK1,ART_FRAME] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 5 end function
// UI_CDKeyMenu_Init
function init(state,storedKey,verifyValid,menuDepth)
  state.actions=[];state.menuEvents=[];emit(state,"set-cvar","ui_cdkeychecked","1",0);cache(state);state.menuDepth=menuDepth;state.backVisible=menuDepth!=0;state.buffer=storedKey;if len(state.buffer)>16 then state.buffer=strings.substr(state.buffer,0,16) end if;state.verified=verifyValid;if not verifyValid then state.buffer="" end if;state.cursor=len(state.buffer);return state
end function
// UI_CDKeyMenu / UI_CDKeyMenu_f
function cdKeyMenu(state,storedKey,verifyValid,menuDepth) init(state,storedKey,verifyValid,menuDepth);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","cdkey","",0);return state end function
function cdKeyMenuF(state,storedKey,verifyValid,menuDepth) return cdKeyMenu(state,storedKey,verifyValid,menuDepth) end function
