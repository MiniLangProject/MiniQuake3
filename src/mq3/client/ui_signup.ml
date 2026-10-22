// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_signup.c.
package mq3.client.ui_signup
import mq3.client.ui_qmenu as q
import mq3.client.ui_rankings as rankings
const SIGNUP_FRAME="menu/art/cut_frame"
const ID_NAME=100
const ID_NAME_BOX=101
const ID_PASSWORD=102
const ID_PASSWORD_BOX=103
const ID_AGAIN=104
const ID_AGAIN_BOX=105
const ID_EMAIL=106
const ID_EMAIL_BOX=107
const ID_SIGNUP=108
const ID_CANCEL=109
struct Action boundary kind name text text2 text3 dispatched end struct
struct State menu frame name nameBox password passwordBox again againBox email emailBox signup cancel status actions pushed forcedOff popped retailActive end struct
function create(retailActive) return State(q.menu(true,false),void,void,void,void,void,void,void,void,void,void,void,rankings.QGR_STATUS_NEW,[],false,false,false,retailActive) end function
function emit(state,boundary,kind,name,text,text2,text3) a=Action(boundary,kind,name,text,text2,text3,not state.retailActive);state.actions=state.actions+[a];return a end function
function field(id,y,maxchars) item=q.item(q.MTYPE_FIELD,"",id,330,y,0);item.widthInChars=16;item.maxchars=maxchars;return item end function
function label(text,id,y) item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE);item.string=text;item.style=q.UI_RIGHT|q.UI_SMALLFONT;item.color=[1.0,0.43,0.0,1.0];return item end function
function button(text,id,x,y,flags,style) item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags);item.string=text;item.style=style;item.color=[1.0,0.0,0.0,1.0];return item end function
// Signup_MenuEvent
function Signup_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED then return false end if;if id==ID_SIGNUP then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer);state.passwordBox.buffer=rankings.sanitize(state.passwordBox.buffer);state.againBox.buffer=rankings.sanitize(state.againBox.buffer);if state.passwordBox.buffer!=state.againBox.buffer then return false end if;emit(state,"rank","create-user","user",state.nameBox.buffer,state.passwordBox.buffer,state.emailBox.buffer);state.forcedOff=true;emit(state,"ui","force-menu-off","signup","","","");return true end if;if id==ID_CANCEL then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","signup","","","");return true end if;return false
end function
// Signup_Cache
function Signup_Cache(state) emit(state,"renderer","register-shader",SIGNUP_FRAME,"","","");return 1 end function
// Signup_MenuInit
function Signup_MenuInit(state,status)
  state.menu=q.menu(true,false);state.actions=[];state.status=status;Signup_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,SIGNUP_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;y=194;state.name=label("NAME",ID_NAME,y);state.nameBox=field(ID_NAME_BOX,y,16);y=y+20;state.password=label("PASSWORD",ID_PASSWORD,y);state.passwordBox=field(ID_PASSWORD_BOX,y,16);y=y+20;state.again=label("(AGAIN)",ID_AGAIN,y);state.againBox=field(ID_AGAIN_BOX,y,16);y=y+20;state.email=label("EMAIL",ID_EMAIL,y);state.emailBox=field(ID_EMAIL_BOX,y,255);y=y+40;state.signup=button("SIGN UP",ID_SIGNUP,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_RIGHT|q.UI_SMALLFONT);state.cancel=button("CANCEL",ID_CANCEL,330,y,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_LEFT|q.UI_SMALLFONT)
  if status!=rankings.QGR_STATUS_NEW and status!=rankings.QGR_STATUS_SPECTATOR then for each item in [state.nameBox,state.passwordBox,state.againBox,state.emailBox,state.signup] item.flags=item.flags|q.QMF_INACTIVE end for;state.signup.color=[0.5,0.5,0.5,1.0] end if;for each item in [state.frame,state.name,state.nameBox,state.password,state.passwordBox,state.again,state.againBox,state.email,state.emailBox,state.signup,state.cancel] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
// UI_SignupMenu
function UI_SignupMenu(state,status) Signup_MenuInit(state,status);state.pushed=true;emit(state,"ui","push-menu","signup","","","");return state end function
