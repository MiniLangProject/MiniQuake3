// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_login.c.
package mq3.client.ui_login
import mq3.client.ui_qmenu as q
import mq3.client.ui_rankings as rankings
/// Virtual asset path used to load the login frame renderer or menu resource.
const LOGIN_FRAME="menu/art/cut_frame"
/// Menu control identifier routed to the name action by the menu event handler.
const ID_NAME=100
/// Menu control identifier routed to the name box action by the menu event handler.
const ID_NAME_BOX=101
/// Menu control identifier routed to the password action by the menu event handler.
const ID_PASSWORD=102
/// Menu control identifier routed to the password box action by the menu event handler.
const ID_PASSWORD_BOX=103
/// Menu control identifier routed to the login action by the menu event handler.
const ID_LOGIN=104
/// Menu control identifier routed to the cancel action by the menu event handler.
const ID_CANCEL=105
/// Stores UI login queued engine action, including `boundary`, `kind`, `name`, `text`, `text2`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while submitting account credentials or
  /// closing the login dialog.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while submitting account
  /// credentials or closing the login dialog.
  kind
  /// Login-menu target, account-operation label, or artwork resource referenced by the host action.
  name
  /// Sanitized account name passed to the rankings login operation; menu and asset actions leave it
  /// empty.
  text
  /// When constructing this record, `emit` supplies `text2` for this member.
  text2
  /// True when this request is marked for native dispatch while submitting account credentials or
  /// closing the login dialog; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI login state, including `menu`, `frame`, `name`, `nameBox`, `password`, `passwordBox` and additional values.
struct State
  /// When constructing this record, `create` supplies `q.menu(true,false)` for this member. Used by
  /// `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.
  menu
  /// Decorative bitmap widget drawing the border around the login menu.
  frame
  /// Account name entered in the ranking-service login or signup form.
  name
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.
  nameBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Login_MenuInit` during subsequent processing.
  password
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Login_MenuEvent` and `Login_MenuInit` during subsequent processing.
  passwordBox
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Login_MenuInit` during subsequent processing.
  login
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `Login_MenuInit` during subsequent processing.
  cancel
  /// Host requests queued while submitting account credentials or closing the login dialog, retained in
  /// request order.
  actions
  /// Records that the ranked-play login dialog has been opened on the active menu stack.
  pushed
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `Login_MenuEvent` during subsequent processing.
  forcedOff
  /// Records a request to remove the ranked-play login dialog from the active menu stack.
  popped
  /// True when the retail QVM owns the ranked-play login dialog, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
end struct
/// Creates a `mq3.client.ui_login.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(q.menu(true,false),void,void,void,void,void,void,void,[],false,false,false,retailActive) end function
/// Appends a UI login action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI login record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI login resource.
/// @param text Text consumed or emitted by `emit` in the UI login path.
/// @param text2 Value used by `a=Action(boundary,kind,name,text,text2,not state.retailActive)`.
function emit(state,boundary,kind,name,text,text2) a=Action(boundary,kind,name,text,text2,not state.retailActive);state.actions=state.actions+[a];return a end function
/// Calls `mq3.client.ui_qmenu.item` from UI login `field`. The final path returns `item`.
/// @param id Value used by `item=q.item(q.MTYPE_FIELD,"",id,x,y,0)`.
/// @param x Horizontal coordinate in the coordinate space used by `field`.
/// @param y Vertical coordinate in the coordinate space used by `field`.
function field(id,x,y) item=q.item(q.MTYPE_FIELD,"",id,x,y,0);item.widthInChars=16;item.maxchars=16;return item end function
/// Calls `mq3.client.ui_qmenu.item` from UI login `label`. The final path returns `item`.
/// @param text Value assigned to `item.string`.
/// @param id Value used by `item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE)`.
/// @param y Vertical coordinate in the coordinate space used by `label`.
function label(text,id,y) item=q.item(q.MTYPE_PTEXT,"",id,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_INACTIVE);item.string=text;item.style=q.UI_RIGHT|q.UI_SMALLFONT;item.color=[1.0,0.43,0.0,1.0];return item end function
/// Calls `mq3.client.ui_qmenu.item` from UI login `action`. The final path returns `item`.
/// @param text Value assigned to `item.string`.
/// @param id Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `action`.
/// @param y Vertical coordinate in the coordinate space used by `action`.
/// @param flags Value used by `item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags)`.
/// @param style Value assigned to `item.style`.
function action(text,id,x,y,flags,style) item=q.item(q.MTYPE_PTEXT,"",id,x,y,flags);item.string=text;item.style=style;item.color=[1.0,0.0,0.0,1.0];return item end function
// Login_MenuEvent
/// @param state Mutable UI login record/storage; this routine assigns `state.nameBox.buffer`, `state.passwordBox.buffer`, `state.forcedOff`, `state.popped` and additional values.
/// @param id Value used by `if id==ID_LOGIN then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer)`.
/// @param event Event identifier compared with the supported activation/input events.
function Login_MenuEvent(state,id,event)
  if event!=q.QM_ACTIVATED then return false end if;if id==ID_LOGIN then state.nameBox.buffer=rankings.sanitize(state.nameBox.buffer);state.passwordBox.buffer=rankings.sanitize(state.passwordBox.buffer);emit(state,"rank","login","user",state.nameBox.buffer,state.passwordBox.buffer);state.forcedOff=true;emit(state,"ui","force-menu-off","login","","");return true end if;if id==ID_CANCEL then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","login","","");return true end if;return false
end function
// Login_Cache
/// @param state Shared UI login state passed to the helper calls in `Login_Cache`.
function Login_Cache(state) emit(state,"renderer","register-shader",LOGIN_FRAME,"","");return 1 end function
// Login_MenuInit
/// @param state Mutable UI login record/storage; this routine assigns `state.menu`, `state.actions`, `state.frame`, `state.frame.width` and additional values.
function Login_MenuInit(state)
  state.menu=q.menu(true,false);state.actions=[];Login_Cache(state);state.frame=q.item(q.MTYPE_BITMAP,LOGIN_FRAME,-1,142,118,q.QMF_INACTIVE);state.frame.width=359;state.frame.height=256;y=214;state.name=label("NAME",ID_NAME,y);state.nameBox=field(ID_NAME_BOX,330,y);y=y+20;state.password=label("PASSWORD",ID_PASSWORD,y);state.passwordBox=field(ID_PASSWORD_BOX,330,y);y=y+40;state.login=action("LOGIN",ID_LOGIN,310,y,q.QMF_RIGHT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_RIGHT|q.UI_SMALLFONT);state.cancel=action("CANCEL",ID_CANCEL,330,y,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,q.UI_LEFT|q.UI_SMALLFONT);for each item in [state.frame,state.name,state.nameBox,state.password,state.passwordBox,state.login,state.cancel] state.menu=q.Menu_AddItem(state.menu,item) end for;return state
end function
// UI_LoginMenu
/// @param state Mutable UI login record/storage; this routine assigns `state.pushed`.
function UI_LoginMenu(state) Login_MenuInit(state);state.pushed=true;emit(state,"ui","push-menu","login","","");return state end function
