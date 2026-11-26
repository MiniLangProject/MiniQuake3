// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_signup.c.
package mq3.client.ui_signup
import mq3.client.ui_qmenu as q
import mq3.client.ui_rankings as rankings
/// Virtual asset path used to load the signup frame renderer or menu resource.
const SIGNUP_FRAME="menu/art/cut_frame"
/// Menu control identifier routed to the name action by the menu event handler.
const ID_NAME=100
/// Menu control identifier routed to the name box action by the menu event handler.
const ID_NAME_BOX=101
/// Menu control identifier routed to the password action by the menu event handler.
const ID_PASSWORD=102
/// Menu control identifier routed to the password box action by the menu event handler.
const ID_PASSWORD_BOX=103
/// Menu control identifier routed to the again action by the menu event handler.
const ID_AGAIN=104
/// Menu control identifier routed to the again box action by the menu event handler.
const ID_AGAIN_BOX=105
/// Menu control identifier routed to the email action by the menu event handler.
const ID_EMAIL=106
/// Menu control identifier routed to the email box action by the menu event handler.
const ID_EMAIL_BOX=107
/// Menu control identifier routed to the signup action by the menu event handler.
const ID_SIGNUP=108
/// Menu control identifier routed to the cancel action by the menu event handler.
const ID_CANCEL=109
/// Stores UI signup queued engine action, including `boundary`, `kind`, `name`, `text`, `text2`, `text3` and additional values.
struct Action
  /// Host service category recorded with a request emitted while collecting and submitting a new
  /// ranked-play account.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while collecting and
  /// submitting a new ranked-play account.
  kind
  /// Signup-menu target, account-creation label, or artwork resource referenced by the action.
  name
  /// Sanitized account name supplied to the rankings account-creation request.
  text
  /// When constructing this record, `emit` supplies `text2` for this member.
  text2
  /// When constructing this record, `emit` supplies `text3` for this member.
  text3
  /// True when this request is marked for native dispatch while collecting and submitting a new
  /// ranked-play account; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI signup state, including `menu`, `frame`, `name`, `nameBox`, `password`, `passwordBox` and additional values.
struct State
  /// When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by
  /// `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.
  menu
  /// Decorative bitmap widget drawing the border around the account-signup menu.
  frame
  /// Account name entered in the ranking-service login or signup form.
  name
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.
  nameBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuInit` during subsequent processing.
  password
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.
  passwordBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuInit` during subsequent processing.
  again
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.
  againBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuInit` during subsequent processing.
  email
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuEvent` and `Signup_MenuInit` during subsequent processing.
  emailBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuInit` during subsequent processing.
  signup
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Signup_MenuInit` during subsequent processing.
  cancel
  /// When constructing this record, `create` supplies `rankings.QGR_STATUS_NEW` for this member. Used
  /// by `Signup_MenuInit` during subsequent processing.
  status
  /// Host requests queued while collecting and submitting a new ranked-play account, retained in
  /// request order.
  actions
  /// Records that the ranked-play account-signup dialog has been opened on the active menu stack.
  pushed
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `Signup_MenuEvent` during subsequent processing.
  forcedOff
  /// Records a request to remove the ranked-play account-signup dialog from the active menu stack.
  popped
  /// True when the retail QVM owns the ranked-play account-signup dialog, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
end struct
/// Creates a `mq3.client.ui_signup.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(q.menu(true,false),void,void,void,void,void,void,void,void,void,void,void,rankings.QGR_STATUS_NEW,[],false,false,false,retailActive) end function
/// Appends a UI signup action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI signup record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI signup resource.
/// @param text Text consumed or emitted by `emit` in the UI signup path.
/// @param text2 Value used by `a=Action(boundary,kind,name,text,text2,text3,not state.retailActive)`.
/// @param text3 Value used by `a=Action(boundary,kind,name,text,text2,text3,not state.retailActive)`.
function emit(state,boundary,kind,name,text,text2,text3) a=Action(boundary,kind,name,text,text2,text3,not state.retailActive);state.actions=state.actions+[a];return a end function
/// Calls `mq3.client.ui_qmenu.item` from UI signup `field`. The final path returns `item`.
/// @param id Value used by `item=q.item(q.MTYPE_FIELD,"",id,330,y,0)`.
/// @param y Vertical coordinate in the coordinate space used by `field`.
/// @param maxchars Value assigned to `item.maxchars`.
function field(id,y,maxchars) item=q.item(q.MTYPE_FIELD,"",id,330,y,0);item.widthInChars=16;item.maxchars=maxchars;return item end function
/// Calls `mq3.client.ui_qmenu.item` from UI signup `label`. The final path returns `item`.
/// @param text Value assigned to `item.string`.
/// @param id Value used by `item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE)`.
/// @param y Vertical coordinate in the coordinate space used by `label`.
function label(text,id,y) item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE);item.string=text;item.style=q.UI_RIGHT|q.UI_SMALLFONT;item.color=[1.0,0.43,0.0,1.0];return item end function
/// Calls `mq3.client.ui_qmenu.item` from UI signup `button`. The final path returns `item`.
/// @param text Value assigned to `item.string`.
/// @param id Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `button`.
/// @param y Vertical coordinate in the coordinate space used by `button`.
/// @param flags Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`.
/// @param style Value assigned to `item.style`.
function button(text,id,x,y,flags,style) item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags);item.string=text;item.style=style;item.color=[1.0,0.0,0.0,1.0];return item end function
// Signup_MenuEvent
/// @param state Mutable UI signup record/storage; this routine assigns `state.nameBox.buffer`, `state.passwordBox.buffer`, `state.againBox.buffer`, `state.forcedOff` and additional values.
/// @param id Value used by `if id==ID_SIGNUP then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer)`.
/// @param event Event identifier compared with the supported activation/input events.
function Signup_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED then return false end if;if id==ID_SIGNUP then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer);state.passwordBox.buffer=rankings.sanitize(state.passwordBox.buffer);state.againBox.buffer=rankings.sanitize(state.againBox.buffer);if state.passwordBox.buffer!=state.againBox.buffer then return false end if;emit(state,"rank","create-user","user",state.nameBox.buffer,state.passwordBox.buffer,state.emailBox.buffer);state.forcedOff=true;emit(state,"ui","force-menu-off","signup","","","");return true end if;if id==ID_CANCEL then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","signup","","","");return true end if;return false
end function
// Signup_Cache
/// @param state Shared UI signup state passed to the helper calls in `Signup_Cache`.
function Signup_Cache(state) emit(state,"renderer","register-shader",SIGNUP_FRAME,"","","");return 1 end function
// Signup_MenuInit
/// @param state Mutable UI signup record/storage; this routine assigns `state.menu`, `state.actions`, `state.status`, `state.frame` and additional values.
/// @param status Value assigned to `state.status`.
function Signup_MenuInit(state,status)
  state.menu=q.menu(true,false);state.actions=[];state.status=status;Signup_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,SIGNUP_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;y=194;state.name=label("NAME",ID_NAME,y);state.nameBox=field(ID_NAME_BOX,y,16);y=y+20;state.password=label("PASSWORD",ID_PASSWORD,y);state.passwordBox=field(ID_PASSWORD_BOX,y,16);y=y+20;state.again=label("(AGAIN)",ID_AGAIN,y);state.againBox=field(ID_AGAIN_BOX,y,16);y=y+20;state.email=label("EMAIL",ID_EMAIL,y);state.emailBox=field(ID_EMAIL_BOX,y,255);y=y+40;state.signup=button("SIGN UP",ID_SIGNUP,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_RIGHT|q.UI_SMALLFONT);state.cancel=button("CANCEL",ID_CANCEL,330,y,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_LEFT|q.UI_SMALLFONT)
  if status!=rankings.QGR_STATUS_NEW and status!=rankings.QGR_STATUS_SPECTATOR then for each item in [state.nameBox,state.passwordBox,state.againBox,state.emailBox,state.signup] item.flags=item.flags|q.QMF_INACTIVE end for;state.signup.color=[0.5,0.5,0.5,1.0] end if;for each item in [state.frame,state.name,state.nameBox,state.password,state.passwordBox,state.again,state.againBox,state.email,state.emailBox,state.signup,state.cancel] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
// UI_SignupMenu
/// @param state Mutable UI signup record/storage; this routine assigns `state.pushed`.
/// @param status Value used by `Signup_MenuInit(state,status)`.
function UI_SignupMenu(state,status) Signup_MenuInit(state,status);state.pushed=true;emit(state,"ui","push-menu","signup","","","");return state end function
