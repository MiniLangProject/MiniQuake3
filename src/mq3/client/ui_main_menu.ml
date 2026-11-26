// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_menu.c.
package mq3.client.ui_main_menu
import mq3.compat.transcendental as trans
import std.string as strings

/// Activation callback event accepted by the base-game main menu before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the singleplayer action by the menu event handler.
const ID_SINGLEPLAYER=10
/// Menu control identifier routed to the multiplayer action by the menu event handler.
const ID_MULTIPLAYER=11
/// Menu control identifier routed to the setup action by the menu event handler.
const ID_SETUP=12
/// Menu control identifier routed to the demos action by the menu event handler.
const ID_DEMOS=13
/// Menu control identifier routed to the cinematics action by the menu event handler.
const ID_CINEMATICS=14
/// Menu control identifier routed to the teamarena action by the menu event handler.
const ID_TEAMARENA=15
/// Menu control identifier routed to the mods action by the menu event handler.
const ID_MODS=16
/// Menu control identifier routed to the exit action by the menu event handler.
const ID_EXIT=17
/// Virtual asset path used to load the main banner model renderer or menu resource.
const MAIN_BANNER_MODEL="models/mapobjects/banner/banner5.md3"

/// Stores UI main menu main item record, including `id`, `label`, `y`.
struct MainItem
  /// Event-routing identifier of this selectable control in the base-game main menu.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Vertical position of this menu control in the virtual layout used by the base-game main menu.
  y
end struct
/// Stores UI main menu main draw record, including `bannerModel`, `yaw`, `errorMessage`, `demoVersion`, `actions`.
struct MainDraw
  /// Model resource selected for the banner presentation.
  bannerModel
  /// When constructing this record, `draw` supplies `yaw` for this member.
  yaw
  /// When constructing this record, `draw` supplies `menu.errorMessage` for this member.
  errorMessage
  /// When constructing this record, `draw` supplies `demoVersion` for this member.
  demoVersion
  /// Host requests queued while drawing the main menu and opening its selected destination, retained in
  /// request order.
  actions
end struct
/// Stores UI main menu main menu record, including `fullscreen`, `wrapAround`, `showlogo`, `items`, `assets`, `cvarWrites` and additional values.
struct MainMenu
  /// Whether the main menu covers the entire UI instead of appearing over the underlying game view.
  fullscreen
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the base-game main menu.
  wrapAround
  /// When constructing this record, `open` supplies `true` for this member.
  showlogo
  /// When constructing this record, `open` supplies an empty list for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the base-game main menu.
  assets
  /// Cvar name/value changes queued by the base-game main menu for the host to apply.
  cvarWrites
  /// When constructing this record, `open` supplies an empty list for this member.
  commands
  /// Host requests queued while drawing the main menu and opening its selected destination, retained in
  /// request order.
  actions
  /// When constructing this record, `open` supplies `errorMessage` for this member.
  errorMessage
end struct

// MainMenu_ExitAction
/// @param menu Mutable UI main menu record/storage; this routine assigns `menu.actions`.
/// @param result Value used by `if not result then return menu end if`.
function exitAction(menu,result)
  if not result then return menu end if
  menu.actions=menu.actions+["pop","credits"]
  return menu
end function

// Main_MenuEvent
/// @param menu Mutable UI main menu record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`, `menu.commands`.
/// @param id Value used by `if id==ID_SINGLEPLAYER then menu.actions=menu.actions+["spLevel"]`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_SINGLEPLAYER then menu.actions=menu.actions+["spLevel"]
  else if id==ID_MULTIPLAYER then menu.actions=menu.actions+["arenaServers"]
  else if id==ID_SETUP then menu.actions=menu.actions+["setup"]
  else if id==ID_DEMOS then menu.actions=menu.actions+["demos"]
  else if id==ID_CINEMATICS then menu.actions=menu.actions+["cinematics"]
  else if id==ID_MODS then menu.actions=menu.actions+["mods"]
  else if id==ID_TEAMARENA then menu.cvarWrites=menu.cvarWrites+["fs_game=missionpack"];menu.commands=menu.commands+["vid_restart;"]
  else if id==ID_EXIT then menu.actions=menu.actions+["confirm:EXIT GAME?"] end if
  return menu
end function

// MainMenu_Cache
function cache() return [MAIN_BANNER_MODEL] end function

// ErrorMessage_Key
/// @param menu Mutable UI main menu record/storage; this routine assigns `menu.cvarWrites`, `menu.actions`.
/// @param key Accepted for compatibility with `errorMessageKey`; the current implementation does not read it.
function errorMessageKey(menu,key)
  menu.cvarWrites=menu.cvarWrites+["com_errorMessage="]
  menu.actions=menu.actions+["mainMenu","nullSound"]
  return menu
end function

// Main_MenuDraw
/// @param menu Record read through `menu.errorMessage`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param demoVersion Value used by `if demoVersion then actions=actions+["text:320,372:DEMO FOR MATURE AUDIENCES DEMO","text:320,400:copyright"]`.
function draw(menu,realtime,demoVersion)
  yaw=180.0+5.0*trans.sin(realtime/5000.0)
  actions=["clearScene","addModel:"+MAIN_BANNER_MODEL,"renderScene:0,0,640,120:60,19.6875"]
  if menu.errorMessage!="" then actions=actions+["autoWrap:320,192,600,20:"+menu.errorMessage]
  else actions=actions+["drawMenu"] end if
  if demoVersion then actions=actions+["text:320,372:DEMO      FOR MATURE AUDIENCES      DEMO","text:320,400:copyright"]
  else actions=actions+["text:320,450:copyright"] end if
  return MainDraw(MAIN_BANNER_MODEL,yaw,menu.errorMessage,demoVersion,actions)
end function

// UI_TeamArenaExists
/// @param modNames Sequence read at `modNames[i]`.
function teamArenaExists(modNames)
  i=0
  while i<len(modNames)
    if strings.equalsIgnoreCaseAscii(modNames[i],"missionpack") then return true end if
    i=i+1
  end while
  return false
end function

/// Calls `mq3.client.ui_main_menu.MainItem` from UI main menu `buildItems`. The final path returns `items`.
/// @param hasTeamArena Value used by `if hasTeamArena then y=y+34`.
function buildItems(hasTeamArena)
  y=134;items=[]
  items=items+[MainItem(ID_SINGLEPLAYER,"SINGLE PLAYER",y)];y=y+34
  items=items+[MainItem(ID_MULTIPLAYER,"MULTIPLAYER",y)];y=y+34
  items=items+[MainItem(ID_SETUP,"SETUP",y)];y=y+34
  items=items+[MainItem(ID_DEMOS,"DEMOS",y)];y=y+34
  items=items+[MainItem(ID_CINEMATICS,"CINEMATICS",y)]
  if hasTeamArena then y=y+34;items=items+[MainItem(ID_TEAMARENA,"TEAM ARENA",y)] end if
  y=y+34;items=items+[MainItem(ID_MODS,"MODS",y)]
  y=y+34;items=items+[MainItem(ID_EXIT,"EXIT",y)]
  return items
end function

// UI_MainMenu
/// @param demoVersion Value used by `if not demoVersion and not cdKeyChecked and not cdKeyValid then menu.actions=menu.actions+["cdKey"]`.
/// @param cdKeyChecked Value used by `if not demoVersion and not cdKeyChecked and not cdKeyValid then menu.actions=menu.actions+["cdKey"]`.
/// @param cdKeyValid Value used by `if not demoVersion and not cdKeyChecked and not cdKeyValid then menu.actions=menu.actions+["cdKey"]`.
/// @param errorMessage Value used by `menu=MainMenu(true,true,true,[],cache(),["sv_killserver=1"],[],[],errorMessage)`.
/// @param modNames Value used by `menu.items=buildItems(teamArenaExists(modNames))`.
function open(demoVersion,cdKeyChecked,cdKeyValid,errorMessage,modNames)
  menu=MainMenu(true,true,true,[],cache(),["sv_killserver=1"],[],[],errorMessage)
  if not demoVersion and not cdKeyChecked and not cdKeyValid then menu.actions=menu.actions+["cdKey"];return menu end if
  if errorMessage!="" then menu.actions=menu.actions+["keyCatcher:UI","resetStack","pushError"];return menu end if
  menu.items=buildItems(teamArenaExists(modNames))
  menu.actions=menu.actions+["keyCatcher:UI","resetStack","push"]
  return menu
end function
