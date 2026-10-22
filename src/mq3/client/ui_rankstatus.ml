// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_rankstatus.c.
package mq3.client.ui_rankstatus
import mq3.client.ui_qmenu as q
import mq3.client.ui_rankings as rankings
const RANKSTATUS_FRAME="menu/art/cut_frame"
const ID_MESSAGE=100
const ID_OK=101
struct Action boundary kind name text dispatched end struct
struct State menu frame message ok status messageText actions pushed popped forcedOff retailActive end struct
function create(retailActive) return State(q.menu(true,false),void,void,void,0,"",[],false,false,false,retailActive) end function
function emit(state,boundary,kind,name,text) a=Action(boundary,kind,name,text,not state.retailActive);state.actions=state.actions+[a];return a end function
// RankStatus_MenuEvent
function RankStatus_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED or id!=ID_OK then return false end if;state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","rank-status","");if state.status==rankings.QGR_STATUS_NO_USER or state.status==rankings.QGR_STATUS_NO_MEMBERSHIP or state.status==rankings.QGR_STATUS_TIMEOUT or state.status==rankings.QGR_STATUS_INVALIDUSER or state.status==rankings.QGR_STATUS_ERROR then emit(state,"ui","open-menu","rankings","") else if state.status==rankings.QGR_STATUS_BAD_PASSWORD then emit(state,"ui","open-menu","rankings","");emit(state,"ui","open-menu","login","") else if state.status==rankings.QGR_STATUS_USER_EXISTS then emit(state,"ui","open-menu","rankings","");emit(state,"ui","open-menu","signup","") end if;return true
end function
// RankStatus_Cache
function RankStatus_Cache(state) emit(state,"renderer","register-shader",RANKSTATUS_FRAME,"");return 1 end function
// RankStatus_MenuInit
function RankStatus_MenuInit(state)
  state.menu=q.menu(true,false);keep=state.actions;state.actions=[];RankStatus_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,RANKSTATUS_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;state.message=q.item(q.MTYPE_PTEXT,"",ID_MESSAGE,320,214,q.QMF_CENTER_JUSTIFY|q.QMF_INACTIVE);state.message.string=state.messageText;state.message.style=q.UI_CENTER|q.UI_SMALLFONT;state.message.color=[1.0,0.43,0.0,1.0];state.ok=q.item(q.MTYPE_PTEXT,"",ID_OK,320,254,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);state.ok.string="OK";state.ok.style=q.UI_CENTER|q.UI_SMALLFONT;state.ok.color=[1.0,0.0,0.0,1.0];for each item in [state.frame,state.message,state.ok] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
function statusMessage(status) if status==rankings.QGR_STATUS_NO_USER then return "Username unavailable" end if;if status==rankings.QGR_STATUS_BAD_PASSWORD then return "Invalid password" end if;if status==rankings.QGR_STATUS_TIMEOUT then return "Timed out" end if;if status==rankings.QGR_STATUS_NO_MEMBERSHIP then return "No membership" end if;if status==rankings.QGR_STATUS_INVALIDUSER then return "Validation failed" end if;if status==rankings.QGR_STATUS_ERROR then return "Error" end if;return "" end function
// UI_RankStatusMenu
function UI_RankStatusMenu(state,status)
  state.status=status;state.messageText=statusMessage(status);if status==rankings.QGR_STATUS_NEW or status==rankings.QGR_STATUS_PENDING then return false end if;if status==rankings.QGR_STATUS_SPECTATOR or status==rankings.QGR_STATUS_ACTIVE then state.forcedOff=true;emit(state,"ui","force-menu-off","rank-status","");return false end if;if state.messageText=="" then return false end if;RankStatus_MenuInit(state);emit(state,"rank","reset-user","","");state.pushed=true;emit(state,"ui","push-menu","rank-status","");return true
end function
