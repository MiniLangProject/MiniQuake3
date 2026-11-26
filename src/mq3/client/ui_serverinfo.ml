// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_serverinfo.c.
package mq3.client.ui_serverinfo

import mq3.client.ui_qmenu as qmenu
import std.string as strings

/// Virtual asset path used to load the serverinfo framel renderer or menu resource.
const SERVERINFO_FRAMEL="menu/art/frame2_l"
/// Virtual asset path used to load the serverinfo framer renderer or menu resource.
const SERVERINFO_FRAMER="menu/art/frame1_r"
/// Virtual asset path used to load the serverinfo back0 renderer or menu resource.
const SERVERINFO_BACK0="menu/art/back_0"
/// Virtual asset path used to load the serverinfo back1 renderer or menu resource.
const SERVERINFO_BACK1="menu/art/back_1"
/// Menu control identifier routed to the add action by the menu event handler.
const ID_ADD=100
/// Event identifier of the Back control used to leave the server-information dialog and return to its
/// parent menu.
const ID_BACK=101
/// Capacity limit for the favoriteservers collection or bounded storage used by this client module.
const MAX_FAVORITESERVERS=16

/// Stores UI serverinfo queued engine action, including `boundary`, `kind`, `name`, `text`, `x`, `y` and additional values.
struct Action
  /// Host service category recorded with a request emitted while displaying current server cvars and
  /// handling the dialog controls.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while displaying current
  /// server cvars and handling the dialog controls.
  kind
  /// Favorite-server cvar, drawing color, menu target, or artwork resource selected by the
  /// server-information action.
  name
  /// Server-info label or value to draw, or the server address written into a favorite slot.
  text
  /// Horizontal position of this queued drawing operation in the virtual layout used by the
  /// server-information dialog.
  x
  /// Vertical position of this queued drawing operation in the virtual layout used by the
  /// server-information dialog.
  y
  /// Numeric argument interpreted by the selected host operation while displaying current server cvars
  /// and handling the dialog controls.
  number
  /// True when this request is marked for native dispatch while displaying current server cvars and
  /// handling the dialog controls; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI serverinfo state, including `menu`, `banner`, `framel`, `framer`, `back`, `add` and additional values.
struct State
  /// When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member. Used by
  /// `ServerInfo_Event` and `ServerInfo_MenuKey` during subsequent processing.
  menu
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  banner
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  framel
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  framer
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  back
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  add
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `UI_ServerInfoMenu` during subsequent processing.
  info
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `ServerInfo_MenuDraw` and `UI_ServerInfoMenu` during subsequent processing.
  pairs
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `ServerInfo_MenuDraw` and `UI_ServerInfoMenu` during subsequent processing.
  numlines
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `Favorites_Add` and `UI_ServerInfoMenu` during subsequent processing.
  currentAddress
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `Favorites_Add` and `UI_ServerInfoMenu` during subsequent processing.
  favorites
  /// Host requests queued while displaying current server cvars and handling the dialog controls,
  /// retained in request order.
  actions
  /// Records that the server-information dialog has been opened on the active menu stack.
  pushed
  /// Records a request to remove the server-information dialog from the active menu stack.
  popped
  /// True when the retail QVM owns the server-information dialog, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
end struct

/// Creates a `mq3.client.ui_serverinfo.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(qmenu.menu(true,true),void,void,void,void,void,"",[],0,"",[],[],false,false,retailActive) end function
/// Appends a UI serverinfo action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI serverinfo record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI serverinfo resource.
/// @param text Text consumed or emitted by `emit` in the UI serverinfo path.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param number Value used by `action=Action(boundary,kind,name,text,x,y,number,not state.retailActive)`.
function emit(state,boundary,kind,name,text,x,y,number) action=Action(boundary,kind,name,text,x,y,number,not state.retailActive);state.actions=state.actions+[action];return action end function
/// Compares two UI serverinfo names using ASCII case-insensitive equality.
/// @param a Argument 1 of `std.string.equalsIgnoreCaseAscii`.
/// @param b Argument 2 of `std.string.equalsIgnoreCaseAscii`.
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
/// Evaluates UI serverinfo `digitAddress` and returns `false`, `c>=48 and c<=57` according to its guard/selection conditions.
/// @param value Value tested by `value==""` before the calculation continues.
function digitAddress(value) if value=="" then return false end if;c=bytes(value)[0];return c>=48 and c<=57 end function
/// Calls `std.string.split` from UI serverinfo `infoPairs`. The final path returns `result`.
/// @param text Text consumed or emitted by `infoPairs` in the UI serverinfo path.
function infoPairs(text) fields=strings.split(text,"\\");at=0;if len(fields)>0 and fields[0]=="" then at=1 end if;result=[];while at+1<len(fields) if fields[at]=="" then break end if;result=result+[[fields[at],fields[at+1]]];at=at+2 end while;return result end function

// Favorites_Add
/// @param state Mutable UI serverinfo record/storage; this routine assigns `state.favorites`, `state.favorites[best-1]`.
function Favorites_Add(state)
  server=state.currentAddress;if server=="" then return 0 end if;best=0;for index=0 to MAX_FAVORITESERVERS-1 address="";if index<len(state.favorites) then address=state.favorites[index] end if;if same(server,address) then return 0 end if;if not digitAddress(address) and best==0 then best=index+1 end if end for
  if best==0 then return 0 end if;while len(state.favorites)<MAX_FAVORITESERVERS state.favorites=state.favorites+[""] end while;state.favorites[best-1]=server;emit(state,"cvar","set","server"+str(best),server,0,0,best);return best
end function

// ServerInfo_Event
/// @param state Mutable UI serverinfo record/storage; this routine assigns `state.popped`, `state.menu.popped`.
/// @param id Value used by `if id==ID_ADD then Favorites_Add(state)`.
/// @param event Event identifier compared with the supported activation/input events.
function ServerInfo_Event(state,id,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;if id==ID_ADD then Favorites_Add(state);state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","server-info","",0,0,0);return true end if;if id==ID_BACK then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","server-info","",0,0,0);return true end if;return false
end function

// ServerInfo_MenuDraw
/// @param state Record read through `state.numlines`, `state.pairs`.
/// @param realtime Current client real-time clock in milliseconds.
function ServerInfo_MenuDraw(state,realtime)
  rows=[];y=240-state.numlines*qmenu.SMALLCHAR_HEIGHT/2-20;for each pair in state.pairs rows=rows+[emit(state,"draw","string-right","red",pair[0]+":",312,y,qmenu.UI_RIGHT|qmenu.UI_SMALLFONT)];rows=rows+[emit(state,"draw","string-left","normal",pair[1],328,y,qmenu.UI_LEFT|qmenu.UI_SMALLFONT)];y=y+qmenu.SMALLCHAR_HEIGHT end for;rows=rows+[emit(state,"draw","menu","server-info","",0,0,realtime)];return rows
end function

// ServerInfo_MenuKey
/// @param state Record read through `state.menu`.
/// @param key Argument 2 of `mq3.client.ui_qmenu.Menu_DefaultKey`.
/// @param cursorx Argument 3 of `mq3.client.ui_qmenu.Menu_DefaultKey`.
/// @param cursory Argument 4 of `mq3.client.ui_qmenu.Menu_DefaultKey`.
function ServerInfo_MenuKey(state,key,cursorx,cursory) return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end function

// ServerInfo_Cache
/// @param state Shared UI serverinfo state passed to the helper calls in `ServerInfo_Cache`.
function ServerInfo_Cache(state) for each art in [SERVERINFO_FRAMEL,SERVERINFO_FRAMER,SERVERINFO_BACK0,SERVERINFO_BACK1] emit(state,"renderer","register-shader",art,"",0,0,0) end for;return 4 end function

/// Calls `mq3.client.ui_qmenu.item` from UI serverinfo `bitmap`. The final path returns `value`.
/// @param name Name used to select or register the corresponding UI serverinfo resource.
/// @param id Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `bitmap`.
/// @param y Vertical coordinate in the coordinate space used by `bitmap`.
/// @param flags Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param w Value assigned to `value.width`.
/// @param h Value assigned to `value.height`.
function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function

// UI_ServerInfoMenu
/// @param state Mutable UI serverinfo record/storage; this routine assigns `state.menu`, `state.actions`, `state.pushed`, `state.popped` and additional values.
/// @param serverInfo Value assigned to `state.info`.
/// @param svRunning Value used by `if svRunning then flags=flags|qmenu.QMF_GRAYED end if`.
/// @param currentAddress Value assigned to `state.currentAddress`.
/// @param favorites Value assigned to `state.favorites`.
function UI_ServerInfoMenu(state,serverInfo,svRunning,currentAddress,favorites)
  state.menu=qmenu.menu(true,true);state.actions=[];state.pushed=false;state.popped=false;state.info=serverInfo;state.pairs=infoPairs(serverInfo);state.numlines=len(state.pairs);if state.numlines>16 then state.numlines=16 end if;state.currentAddress=currentAddress;state.favorites=favorites;ServerInfo_Cache(state)
  state.banner=qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE);state.banner.string="SERVER INFO";state.banner.style=qmenu.UI_CENTER
  state.framel=bitmap(SERVERINFO_FRAMEL,-1,0,78,qmenu.QMF_INACTIVE,256,329);state.framer=bitmap(SERVERINFO_FRAMER,-1,376,76,qmenu.QMF_INACTIVE,256,334)
  flags=qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_PULSEIFFOCUS;if svRunning then flags=flags|qmenu.QMF_GRAYED end if;state.add=qmenu.item(qmenu.MTYPE_PTEXT,"",ID_ADD,320,371,flags);state.add.string="ADD TO FAVORITES";state.add.style=qmenu.UI_CENTER|qmenu.UI_SMALLFONT;state.add.color=[1.0,0.0,0.0,1.0]
  state.back=bitmap(SERVERINFO_BACK0,ID_BACK,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);state.back.focuspic=SERVERINFO_BACK1
  state.menu=qmenu.Menu_AddItem(state.menu,state.banner);state.menu=qmenu.Menu_AddItem(state.menu,state.framel);state.menu=qmenu.Menu_AddItem(state.menu,state.framer);state.menu=qmenu.Menu_AddItem(state.menu,state.add);state.menu=qmenu.Menu_AddItem(state.menu,state.back);state.menu.cursor=3;state.pushed=true;emit(state,"ui","push-menu","server-info","",0,0,0);return state
end function
