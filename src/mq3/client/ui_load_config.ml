// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_loadconfig.c.
package mq3.client.ui_load_config
import std.string as strings
/// Activation callback event accepted by the configuration-file loading menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Event identifier of the Back control used to leave the configuration-file loading menu and return to
/// its parent menu.
const ID_BACK=10
/// Menu control identifier routed to the go action by the menu event handler.
const ID_GO=11
/// Menu control identifier routed to the list action by the menu event handler.
const ID_LIST=12
/// Menu control identifier routed to the left action by the menu event handler.
const ID_LEFT=13
/// Menu control identifier routed to the right action by the menu event handler.
const ID_RIGHT=14
/// Capacity limit for the configs collection or bounded storage used by this client module.
const MAX_CONFIGS=128
/// Stores UI load config load config menu record, including `wrapAround`, `fullscreen`, `names`, `selected`, `goHidden`, `assets` and additional values.
struct LoadConfigMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the configuration-file
  /// loading menu.
  wrapAround
  /// Whether the configuration-loading menu covers the entire UI instead of appearing over the
  /// underlying game view.
  fullscreen
  /// When constructing this record, `init` supplies `names` for this member.
  names
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// When constructing this record, `init` supplies `hidden` for this member.
  goHidden
  /// Media resources retained for registering and drawing the artwork used by the configuration-file
  /// loading menu.
  assets
  /// When constructing this record, `init` supplies an empty list for this member.
  commands
  /// Host requests queued while listing configuration files and executing the selected file, retained
  /// in request order.
  actions
end struct
/// Calls `std.string.toLowerAscii`, `std.string.endsWith`, `std.string.substr` and additional helpers from UI load config `displayName`. The final path returns `strings.toUpperAscii(name)`.
/// @param name Name whose length/content is inspected by `displayName`.
function displayName(name) lower=strings.toLowerAscii(name);if strings.endsWith(lower,".cfg") then name=strings.substr(name,0,len(name)-4) end if;return strings.toUpperAscii(name) end function
// LoadConfig_MenuEvent
/// @param menu Mutable UI load config record/storage; this routine assigns `menu.commands`, `menu.actions`.
/// @param id Value used by `if id==ID_GO and not menu.goHidden then menu.commands=menu.commands+["exec "+menu.names[menu.selected]+"\n"]`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GO and not menu.goHidden then menu.commands=menu.commands+["exec "+menu.names[menu.selected]+"\n"];menu.actions=menu.actions+["pop"]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"]
  else if id==ID_LEFT then menu.actions=menu.actions+["scroll:left"]
  else if id==ID_RIGHT then menu.actions=menu.actions+["scroll:right"] end if
  return menu
end function
// UI_LoadConfig_Cache
function cache() return ["menu/art/back_0","menu/art/back_1","menu/art/load_0","menu/art/load_1","menu/art/frame2_l","menu/art/frame1_r","menu/art/arrows_horz_0","menu/art/arrows_horz_left","menu/art/arrows_horz_right"] end function
// LoadConfig_MenuInit
/// @param files Value used by `for each file in files if len(names)<MAX_CONFIGS then names=names+[displayName(file)] end if end for`.
function init(files)
  names=[];for each file in files if len(names)<MAX_CONFIGS then names=names+[displayName(file)] end if end for
  hidden=len(names)==0;if hidden then names=["No Files Found."] end if
  return LoadConfigMenu(true,true,names,0,hidden,cache(),[],[])
end function
// UI_LoadConfigMenu
/// @param files Value used by `menu=init(files)`.
function open(files) menu=init(files);menu.actions=menu.actions+["push"];return menu end function
