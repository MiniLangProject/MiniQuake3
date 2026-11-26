// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_cdkey.c.
package mq3.client.ui_cdkey

import std.string as strings

/// Activation callback event accepted by the product-key entry menu before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the cdkey action by the menu event handler.
const ID_CDKEY=10
/// Menu control identifier routed to the accept action by the menu event handler.
const ID_ACCEPT=11
/// Event identifier of the Back control used to leave the product-key entry menu and return to its
/// parent menu.
const ID_BACK=12
/// Virtual shader or image asset name used for the menu's frame artwork.
const ART_FRAME="menu/art/cut_frame"
/// Virtual shader or image asset name used for the menu's accept0 artwork.
const ART_ACCEPT0="menu/art/accept_0"
/// Virtual shader or image asset name used for the menu's accept1 artwork.
const ART_ACCEPT1="menu/art/accept_1"
/// Virtual shader or image asset name used for the menu's back0 artwork.
const ART_BACK0="menu/art/back_0"
/// Virtual shader or image asset name used for the menu's back1 artwork.
const ART_BACK1="menu/art/back_1"

/// Stores UI cdkey queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while validating and storing the entered
  /// product key.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while validating and
  /// storing the entered product key.
  kind
  /// CD-key menu control, console variable, or artwork resource targeted by the host action.
  name
  /// Entered CD-key text, validation message, or cvar value emitted by the key-entry menu.
  text
  /// Value payload supplied to the selected host operation while validating and storing the entered
  /// product key.
  value
  /// True when this request is marked for native dispatch while validating and storing the entered
  /// product key; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI cdkey draw record, including `buffer`, `focus`, `cursorChar`, `message`, `status`.
struct Draw
  /// When constructing this record, `drawKey` supplies `state.buffer` for this member.
  buffer
  /// When constructing this record, `drawKey` supplies `state.focus` for this member.
  focus
  /// When constructing this record, `drawKey` supplies `cursor` for this member.
  cursorChar
  /// When constructing this record, `drawKey` supplies `message` for this member.
  message
  /// When constructing this record, `drawKey` supplies `value` for this member.
  status
end struct
/// Stores UI cdkey state, including `buffer`, `cursor`, `focus`, `overstrike`, `menuDepth`, `backVisible` and additional values.
struct State
  /// When constructing this record, `create` supplies an empty string for this member.
  buffer
  /// When constructing this record, `create` supplies `0` for this member. Used by `drawKey` and `init`
  /// during subsequent processing.
  cursor
  /// True when the product-key entry field has keyboard focus, enabling its insert or overstrike cursor
  /// glyph.
  focus
  /// When constructing this record, `create` supplies `false` for this member. Used by `drawKey` during
  /// subsequent processing.
  overstrike
  /// When constructing this record, `create` supplies `0` for this member. Used by `init` during
  /// subsequent processing.
  menuDepth
  /// When constructing this record, `create` supplies `false` for this member. Used by `init` during
  /// subsequent processing.
  backVisible
  /// When constructing this record, `create` supplies `false` for this member. Used by `init` during
  /// subsequent processing.
  verified
  /// Host requests queued while validating and storing the entered product key, retained in request
  /// order.
  actions
  /// True when the retail QVM owns the product-key entry menu, so the native observer records requests
  /// without emitting duplicate host effects.
  retailActive
  /// True once the module's required media has been cached or registered.
  cached
  /// Records that the product-key entry menu has been opened on the active menu stack.
  pushed
  /// Menu-stack and selection events queued for the host adapter.
  menuEvents
end struct

/// Creates a `mq3.client.ui_cdkey.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State("",0,false,false,0,false,false,[],retailActive,false,false,[]) end function
/// Appends a UI cdkey action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI cdkey record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI cdkey resource.
/// @param text Text consumed or emitted by `emit` in the UI cdkey path.
/// @param value Value used by `item=Action("ui-cdkey",kind,name,text,value,not state.retailActive)`.
function emit(state,kind,name,text,value) item=Action("ui-cdkey",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
// UI_CDKeyMenu_PreValidateKey
/// @param key Sequence whose length/content is inspected by `preValidateKey`.
function preValidateKey(key)
  if len(key)!=16 then return 1 end if;allowed="237abcdghjlprstw";for each ch in key found=false;for each accept in allowed if ch==accept then found=true;break end if end for;if not found then return -1 end if end for;return 0
end function
// UI_CDKeyMenu_DrawKey
/// @param state Record read through `state.buffer`, `state.focus`, `state.overstrike`, `state.cursor`.
function drawKey(state)
  value=preValidateKey(state.buffer);message="The CD Key is not valid";if value==1 then message="Please enter your CD Key" else if value==0 then message="The CD Key appears to be valid, thank you" end if;cursor=0;if state.focus then if state.overstrike then cursor=11 else cursor=10 end if end if;emit(state,"field","cdkey",state.buffer,state.cursor);emit(state,"status","validation",message,value);if cursor!=0 then emit(state,"cursor","cdkey",str(cursor),state.cursor) end if;return Draw(state.buffer,state.focus,cursor,message,value)
end function
// UI_CDKeyMenu_Event
/// @param state Mutable UI cdkey record/storage; this routine assigns `state.menuEvents`.
/// @param id Value used by `if id==ID_ACCEPT then if len(state.buffer)>0 then emit(state,"set-cdkey","cdkey",state.buffer,0) end if`.
/// @param event Event identifier compared with the supported activation/input events.
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if;if id==ID_ACCEPT then if len(state.buffer)>0 then emit(state,"set-cdkey","cdkey",state.buffer,0) end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","cdkey","",0);return true else if id==ID_BACK then state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","cdkey","",0);return true end if;return false
end function
// UI_CDKeyMenu_Cache
/// @param state Mutable UI cdkey record/storage; this routine assigns `state.cached`.
function cache(state) for each asset in [ART_ACCEPT0,ART_ACCEPT1,ART_BACK0,ART_BACK1,ART_FRAME] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 5 end function
// UI_CDKeyMenu_Init
/// @param state Mutable UI cdkey record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.menuDepth`, `state.backVisible` and additional values.
/// @param storedKey Value assigned to `state.buffer`.
/// @param verifyValid Value assigned to `state.verified`.
/// @param menuDepth Value assigned to `state.menuDepth`, `state.backVisible`.
function init(state,storedKey,verifyValid,menuDepth)
  state.actions=[];state.menuEvents=[];emit(state,"set-cvar","ui_cdkeychecked","1",0);cache(state);state.menuDepth=menuDepth;state.backVisible=menuDepth!=0;state.buffer=storedKey;if len(state.buffer)>16 then state.buffer=strings.substr(state.buffer,0,16) end if;state.verified=verifyValid;if not verifyValid then state.buffer="" end if;state.cursor=len(state.buffer);return state
end function
// UI_CDKeyMenu / UI_CDKeyMenu_f
/// @param state Mutable UI cdkey record/storage; this routine assigns `state.pushed`, `state.menuEvents`.
/// @param storedKey Value used by `init(state,storedKey,verifyValid,menuDepth)`.
/// @param verifyValid Value used by `init(state,storedKey,verifyValid,menuDepth)`.
/// @param menuDepth Value used by `init(state,storedKey,verifyValid,menuDepth)`.
function cdKeyMenu(state,storedKey,verifyValid,menuDepth) init(state,storedKey,verifyValid,menuDepth);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","cdkey","",0);return state end function
/// Adapts `mq3.client.ui_cdkey.cdKeyMenu` to UI cdkey `cdKeyMenuF`, returning its result for `state, storedKey, verifyValid, menuDepth`.
/// @param state Argument 1 of `mq3.client.ui_cdkey.cdKeyMenu`.
/// @param storedKey Argument 2 of `mq3.client.ui_cdkey.cdKeyMenu`.
/// @param verifyValid Argument 3 of `mq3.client.ui_cdkey.cdKeyMenu`.
/// @param menuDepth Argument 4 of `mq3.client.ui_cdkey.cdKeyMenu`.
function cdKeyMenuF(state,storedKey,verifyValid,menuDepth) return cdKeyMenu(state,storedKey,verifyValid,menuDepth) end function
