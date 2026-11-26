// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_options.c.
package mq3.client.ui_system_config
/// Activation callback event accepted by the system-configuration submenu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Connection-state value for a completed handshake before game-state loading, defined for retaining
/// the native connection-state vocabulary used by system menus.
const CA_CONNECTED=5
/// Menu control identifier routed to the graphics action by the menu event handler.
const ID_GRAPHICS=10
/// Menu control identifier routed to the display action by the menu event handler.
const ID_DISPLAY=11
/// Menu control identifier routed to the sound action by the menu event handler.
const ID_SOUND=12
/// Menu control identifier routed to the network action by the menu event handler.
const ID_NETWORK=13
/// Event identifier of the Back control used to leave the system-configuration submenu and return to
/// its parent menu.
const ID_BACK=14
/// Stores UI system config menu item, including `id`, `kind`, `name`, `x`, `y`.
struct Item
  /// Event-routing identifier of this selectable control in the system-configuration submenu.
  id
  /// Item category selecting pickup behavior or the type-specific UI control implementation.
  kind
  /// Label or artwork name identifying a control in the system-configuration menu.
  name
  /// Horizontal position of this menu control in the virtual layout used by the system-configuration
  /// submenu.
  x
  /// Vertical position of this menu control in the virtual layout used by the system-configuration
  /// submenu.
  y
end struct
/// Stores UI system config menu, including `wrapAround`, `fullscreen`, `items`, `assets`, `actions`, `pushed`.
struct Menu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the system-configuration
  /// submenu.
  wrapAround
  /// Whether the system-configuration menu covers the entire UI instead of appearing over the
  /// underlying game view.
  fullscreen
  /// Ordered child items participating in this menu's rendering and navigation.
  items
  /// Media resources retained for registering and drawing the artwork used by the system-configuration
  /// submenu.
  assets
  /// Host requests queued while opening graphics, display, sound, and network option screens, retained
  /// in request order.
  actions
  /// Records that the system-configuration submenu has been opened on the active menu stack.
  pushed
end struct
/// Creates a `mq3.client.ui_system_config.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.
/// @param id Value used to initialize `Item.id`.
/// @param kind Value used to initialize `Item.kind`.
/// @param name Value used to initialize `Item.name`.
/// @param x Value used to initialize `Item.x`.
/// @param y Value used to initialize `Item.y`.
function item(id,kind,name,x,y) return Item(id,kind,name,x,y) end function
// SystemConfig_Cache
function cache() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"] end function
// Options_MenuInit
/// @param connState Value used by `return Menu(true,connState<CA_CONNECTED,items,cache(),[],false)`.
function init(connState)
  items=[item(0,"btext","SYSTEM SETUP",320,16),item(0,"bitmap","menu/art/frame2_l",8,76),item(0,"bitmap","menu/art/frame1_r",376,76),item(ID_GRAPHICS,"ptext","GRAPHICS",320,168),item(ID_DISPLAY,"ptext","DISPLAY",320,202),item(ID_SOUND,"ptext","SOUND",320,236),item(ID_NETWORK,"ptext","NETWORK",320,270),item(ID_BACK,"bitmap","menu/art/back_0",0,416)]
  return Menu(true,connState<CA_CONNECTED,items,cache(),[],false)
end function
// Options_Event
/// @param menu Mutable UI system config record/storage; this routine assigns `menu.actions`.
/// @param id Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["display"] else if id==I...`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GRAPHICS then menu.actions=menu.actions+["graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["display"] else if id==ID_SOUND then menu.actions=menu.actions+["sound"] else if id==ID_NETWORK then menu.actions=menu.actions+["network"] else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_SystemConfigMenu
/// @param connState Value used by `menu=init(connState)`.
function open(connState) menu=init(connState);menu.pushed=true;return menu end function
