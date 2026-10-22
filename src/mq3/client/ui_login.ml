// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_login.c.
package mq3.client.ui_login
import mq3.client.ui_qmenu as q
import mq3.client.ui_rankings as rankings
const LOGIN_FRAME="menu/art/cut_frame"
const ID_NAME=100
const ID_NAME_BOX=101
const ID_PASSWORD=102
const ID_PASSWORD_BOX=103
const ID_LOGIN=104
const ID_CANCEL=105
struct Action boundary kind name text text2 dispatched end struct
struct State menu frame name nameBox password passwordBox login cancel actions pushed forcedOff popped retailActive end struct
function create(retailActive) return State(q.menu(true,false),void,void,void,void,void,void,void,[],false,false,false,retailActive) end function
function emit(state,boundary,kind,name,text,text2) a=Action(boundary,kind,name,text,text2,not state.retailActive);state.actions=state.actions+[a];return a end function
function field(id,x,y) item=q.item(q.MTYPE_FIELD,"",id,x,y,0);item.widthInChars=16;item.maxchars=16;return item end function
function label(text,id,y) item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE);item.string=text;item.style=q.UI_RIGHT|q.UI_SMALLFONT;item.color=[1.0,0.43,0.0,1.0];return item end function
function action(text,id,x,y,flags,style) item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags);item.string=text;item.style=style;item.color=[1.0,0.0,0.0,1.0];return item end function
// Login_MenuEvent
function Login_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED then return false end if;if id==ID_LOGIN then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer);state.passwordBox.buffer=rankings.sanitize(state.passwordBox.buffer);emit(state,"rank","login","user",state.nameBox.buffer,state.passwordBox.buffer);state.forcedOff=true;emit(state,"ui","force-menu-off","login","","");return true end if;if id==ID_CANCEL then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","login","","");return true end if;return false
end function
// Login_Cache
function Login_Cache(state) emit(state,"renderer","register-shader",LOGIN_FRAME,"","");return 1 end function
// Login_MenuInit
function Login_MenuInit(state)
  state.menu=q.menu(true,false);state.actions=[];Login_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,LOGIN_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;y=214;state.name=label("NAME",ID_NAME,y);state.nameBox=field(ID_NAME_BOX,330,y);y=y+20;state.password=label("PASSWORD",ID_PASSWORD,y);state.passwordBox=field(ID_PASSWORD_BOX,330,y);y=y+40;state.login=action("LOGIN",ID_LOGIN,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_RIGHT|q.UI_SMALLFONT);state.cancel=action("CANCEL",ID_CANCEL,330,y,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_LEFT|q.UI_SMALLFONT);for each item in [state.frame,state.name,state.nameBox,state.password,state.passwordBox,state.login,state.cancel] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
// UI_LoginMenu
function UI_LoginMenu(state) Login_MenuInit(state);state.pushed=true;emit(state,"ui","push-menu","login","","");return state end function
