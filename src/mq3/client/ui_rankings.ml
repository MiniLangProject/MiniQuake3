// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_rankings.c.
package mq3.client.ui_rankings
import mq3.client.ui_qmenu as q

const RANKINGS_FRAME="menu/art/cut_frame"
const ID_LOGIN=100
const ID_LOGOUT=101
const ID_CREATE=102
const ID_SPECTATE=103
const ID_SETUP=104
const ID_LEAVE=105
const QGR_STATUS_NEW=0
const QGR_STATUS_SPECTATOR=1
const QGR_STATUS_ACTIVE=2
const QGR_STATUS_VALIDATING=3
const QGR_STATUS_PENDING=4
const QGR_STATUS_LEAVING=5
const QGR_STATUS_NO_USER=6
const QGR_STATUS_BAD_PASSWORD=7
const QGR_STATUS_USER_EXISTS=8
const QGR_STATUS_NO_MEMBERSHIP=9
const QGR_STATUS_TIMEOUT=10
const QGR_STATUS_INVALIDUSER=11
const QGR_STATUS_ERROR=12

struct Action boundary kind name text x y value dispatched end struct
struct State menu frame login logout createAccount spectate setup leave status actions pushed forcedOff popped retailActive end struct
function create(retailActive) return State(q.menu(true,false),void,void,void,void,void,void,void,QGR_STATUS_NEW,[],false,false,false,retailActive) end function
function emit(state,boundary,kind,name,text,x,y,value) a=Action(boundary,kind,name,text,x,y,value,not state.retailActive);state.actions=state.actions+[a];return a end function
function alphanumeric(c) return (c>=48 and c<=57) or (c>=65 and c<=90) or (c>=97 and c<=122) end function
function sanitize(text) data=bytes(text);result="";for each c in data if not alphanumeric(c) then break end if;result=result+decode(bytes([c])) end for;return result end function

// Rankings_DrawText
function Rankings_DrawText(state,field,focus,overstrike)
  rows=[];style=q.UI_LEFT|q.UI_SMALLFONT;if focus then style=style|q.UI_PULSE end if;x=field.x;y=field.y+4;for each c in bytes(field.buffer) rows=rows+[emit(state,"draw","char","white",decode(bytes([c])),x,y,style)];x=x+q.SMALLCHAR_WIDTH end for;if focus then cursor=10;if overstrike then cursor=11 end if;rows=rows+[emit(state,"draw","cursor","white",str(cursor),field.x+field.fieldCursor*q.SMALLCHAR_WIDTH,y,(style&(~q.UI_PULSE))|q.UI_BLINK)] end if;return rows
end function
// Rankings_DrawName
function Rankings_DrawName(state,field,focus,overstrike) field.buffer=sanitize(field.buffer);if field.fieldCursor>len(bytes(field.buffer)) then field.fieldCursor=len(bytes(field.buffer)) end if;return Rankings_DrawText(state,field,focus,overstrike) end function
// Rankings_DrawPassword
function Rankings_DrawPassword(state,field,focus,overstrike) original=sanitize(field.buffer);field.buffer=original;if field.fieldCursor>len(bytes(original)) then field.fieldCursor=len(bytes(original)) end if;field.buffer="";if len(bytes(original))>0 then for i=0 to len(bytes(original))-1 field.buffer=field.buffer+"*" end for end if;rows=Rankings_DrawText(state,field,focus,overstrike);field.buffer=original;return rows end function

// Rankings_MenuEvent
function Rankings_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED then return false end if
  if id==ID_LOGIN then emit(state,"ui","open-menu","login","",0,0,0)
  else if id==ID_LOGOUT then emit(state,"rank","logout","","",0,0,0);state.forcedOff=true;emit(state,"ui","force-menu-off","rankings","",0,0,0)
  else if id==ID_CREATE then emit(state,"ui","open-menu","signup","",0,0,0)
  else if id==ID_SPECTATE then emit(state,"command","execute-append","rank-spectate","cmd rank_spectate\n",0,0,0);state.forcedOff=true;emit(state,"ui","force-menu-off","rankings","",0,0,0)
  else if id==ID_SETUP then emit(state,"ui","open-menu","setup","",0,0,0)
  else if id==ID_LEAVE then emit(state,"command","execute-append","disconnect","disconnect\n",0,0,0);state.forcedOff=true;emit(state,"ui","force-menu-off","rankings","",0,0,0)
  else return false end if;return true
end function
function text(label,id,y,flags) item=q.item(q.MTYPE_PTEXT,"",id,320,y,flags);item.string=label;item.style=q.UI_CENTER|q.UI_SMALLFONT;item.color=[1.0,0.0,0.0,1.0];return item end function
// Rankings_Cache
function Rankings_Cache(state) emit(state,"renderer","register-shader",RANKINGS_FRAME,"",0,0,0);return 1 end function
// Rankings_MenuInit
function Rankings_MenuInit(state,status)
  state.menu=q.menu(true,false);state.actions=[];state.status=status;Rankings_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,RANKINGS_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;y=194;state.login=text("LOGIN",ID_LOGIN,y,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);y=y+20;state.logout=text("LOGOUT",ID_LOGOUT,y,q.QMF_HIDDEN|q.QMF_INACTIVE|q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);state.createAccount=text("SIGN UP",ID_CREATE,y,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);y=y+20;state.spectate=text("SPECTATE",ID_SPECTATE,y,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);y=y+20;state.setup=text("SETUP",ID_SETUP,y,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS);y=y+20;state.leave=text("LEAVE ARENA",ID_LEAVE,y,q.QMF_CENTER_JUSTIFY|q.QMF_PULSEIFFOCUS)
  if status!=QGR_STATUS_NEW and status!=QGR_STATUS_SPECTATOR then state.login.flags=state.login.flags|q.QMF_HIDDEN|q.QMF_INACTIVE;state.createAccount.flags=state.createAccount.flags|q.QMF_HIDDEN|q.QMF_INACTIVE;state.spectate.flags=state.spectate.flags|q.QMF_HIDDEN|q.QMF_INACTIVE;state.logout.flags=state.logout.flags&(~(q.QMF_HIDDEN|q.QMF_INACTIVE)) end if;if status==QGR_STATUS_VALIDATING or status==QGR_STATUS_PENDING or status==QGR_STATUS_LEAVING then state.login.flags=state.login.flags|q.QMF_GRAYED;state.createAccount.flags=state.createAccount.flags|q.QMF_GRAYED;state.logout.flags=state.logout.flags|q.QMF_GRAYED end if;state.setup.flags=state.setup.flags|q.QMF_HIDDEN|q.QMF_INACTIVE
  for each item in [state.frame,state.login,state.logout,state.createAccount,state.spectate,state.setup,state.leave] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
// UI_RankingsMenu
function UI_RankingsMenu(state,status) Rankings_MenuInit(state,status);state.pushed=true;emit(state,"ui","push-menu","rankings","",0,0,0);return state end function
