// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_setup.c.
package mq3.client.ui_setup
/// Activation callback event accepted by the player and system setup menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the customizeplayer action by the menu event handler.
const ID_CUSTOMIZEPLAYER=10
/// Menu control identifier routed to the customizecontrols action by the menu event handler.
const ID_CUSTOMIZECONTROLS=11
/// Menu control identifier routed to the systemconfig action by the menu event handler.
const ID_SYSTEMCONFIG=12
/// Menu control identifier routed to the game action by the menu event handler.
const ID_GAME=13
/// Menu control identifier routed to the cdkey action by the menu event handler.
const ID_CDKEY=14
/// Menu control identifier routed to the defaults action by the menu event handler.
const ID_DEFAULTS=17
/// Event identifier of the Back control used to leave the player and system setup menu and return to
/// its parent menu.
const ID_BACK=18
/// Stores UI setup setup item record, including `id`, `label`, `y`.
struct SetupItem
  /// Event-routing identifier of this selectable control in the player and system setup menu.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Vertical position of this menu control in the virtual layout used by the player and system setup
  /// menu.
  y
end struct
/// Stores UI setup setup menu record, including `wrapAround`, `fullscreen`, `items`, `assets`, `commands`, `actions`.
struct SetupMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the player and system
  /// setup menu.
  wrapAround
  /// Whether the player setup menu covers the entire UI instead of appearing over the underlying game
  /// view.
  fullscreen
  /// When constructing this record, `init` supplies `items` for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the player and system
  /// setup menu.
  assets
  /// When constructing this record, `init` supplies an empty list for this member.
  commands
  /// Host requests queued while opening player, controls, system, and other setup destinations,
  /// retained in request order.
  actions
end struct
// Setup_ResetDefaults_Action
/// @param menu Mutable UI setup record/storage; this routine assigns `menu.commands`.
/// @param result Value used by `if result then menu.commands=menu.commands+["exec default.cfg\n","cvar_restart\n","vid_restart\n"] end if`.
function resetDefaultsAction(menu,result) if result then menu.commands=menu.commands+["exec default.cfg\n","cvar_restart\n","vid_restart\n"] end if;return menu end function
// Setup_ResetDefaults_Draw
function resetDefaultsDraw() return ["text:320,356:WARNING: This will reset *ALL*","text:320,383:options to their default values."] end function
// UI_SetupMenu_Event
/// @param menu Mutable UI setup record/storage; this routine assigns `menu.actions`.
/// @param id Value used by `if id==ID_CUSTOMIZEPLAYER then menu.actions=menu.actions+["playerSettings"]`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_CUSTOMIZEPLAYER then menu.actions=menu.actions+["playerSettings"]
  else if id==ID_CUSTOMIZECONTROLS then menu.actions=menu.actions+["controls"]
  else if id==ID_SYSTEMCONFIG then menu.actions=menu.actions+["graphicsOptions"]
  else if id==ID_GAME then menu.actions=menu.actions+["preferences"]
  else if id==ID_CDKEY then menu.actions=menu.actions+["cdKey"]
  else if id==ID_DEFAULTS then menu.actions=menu.actions+["confirm:SET TO DEFAULTS?:resetDefaultsDraw:resetDefaultsAction"]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_SetupMenu_Cache
function cache() return ["menu/art/back_0","menu/art/back_1","menu/art/frame2_l","menu/art/frame1_r"] end function
// UI_SetupMenu_Init
/// @param paused Value used by `if not paused then items=items+[SetupItem(ID_DEFAULTS,"DEFAULTS",304)] end if`.
function init(paused)
  items=[SetupItem(ID_CUSTOMIZEPLAYER,"PLAYER",134),SetupItem(ID_CUSTOMIZECONTROLS,"CONTROLS",168),SetupItem(ID_SYSTEMCONFIG,"SYSTEM",202),SetupItem(ID_GAME,"GAME OPTIONS",236),SetupItem(ID_CDKEY,"CD Key",270)]
  if not paused then items=items+[SetupItem(ID_DEFAULTS,"DEFAULTS",304)] end if
  items=items+[SetupItem(ID_BACK,"BACK",416)]
  return SetupMenu(true,true,items,cache(),[],[])
end function
// UI_SetupMenu
/// @param paused Value used by `menu=init(paused)`.
function open(paused) menu=init(paused);menu.actions=menu.actions+["push"];return menu end function
