// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_mods.c.
package mq3.client.ui_mods
import std.string as strings
/// Activation callback event accepted by the game-mod selection menu before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Event identifier of the Back control used to leave the game-mod selection menu and return to its
/// parent menu.
const ID_BACK=10
/// Menu control identifier routed to the go action by the menu event handler.
const ID_GO=11
/// Menu control identifier routed to the list action by the menu event handler.
const ID_LIST=12
/// Capacity limit for the mods collection or bounded storage used by this client module.
const MAX_MODS=64
/// Stores UI mods mod entry record, including `game`, `description`.
struct ModEntry
  /// When constructing this record, `parseInfo` supplies `game` for this member.
  game
  /// When constructing this record, `parseInfo` supplies `description` for this member.
  description
end struct
/// Stores UI mods mods menu record, including `wrapAround`, `fullscreen`, `entries`, `selected`, `assets`, `cvarWrites` and additional values.
struct ModsMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the game-mod selection
  /// menu.
  wrapAround
  /// Whether the mod-selection menu covers the entire UI instead of appearing over the underlying game
  /// view.
  fullscreen
  /// When constructing this record, `loadMods` supplies `[ModEntry("","Quake III Arena")]` for this
  /// member.
  entries
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// Media resources retained for registering and drawing the artwork used by the game-mod selection
  /// menu.
  assets
  /// Cvar name/value changes queued by the game-mod selection menu for the host to apply.
  cvarWrites
  /// When constructing this record, `loadMods` supplies an empty list for this member.
  commands
  /// Host requests queued while enumerating game modifications and switching the active game directory,
  /// retained in request order.
  actions
end struct
// UI_Mods_ParseInfos
/// @param menu Mutable UI mods record/storage; this routine assigns `menu.entries`.
/// @param modDir Value used by `game=modDir`.
/// @param modDesc Value used by `description=modDesc`.
function parseInfo(menu,modDir,modDesc)
  if len(menu.entries)>=MAX_MODS then return menu end if
  game=modDir;if len(game)>15 then game=strings.substr(game,0,15) end if
  description=modDesc;if len(description)>47 then description=strings.substr(description,0,47) end if
  menu.entries=menu.entries+[ModEntry(game,description)];return menu
end function
// UI_Mods_LoadMods
/// @param mods Value used by `for each item in mods if len(menu.entries)<MAX_MODS then menu=parseInfo(menu,item[0],item[1]) end if end for`.
function loadMods(mods)
  menu=ModsMenu(true,true,[ModEntry("","Quake III Arena")],0,[],[],[],["print:1 mods parsed"])
  for each item in mods if len(menu.entries)<MAX_MODS then menu=parseInfo(menu,item[0],item[1]) end if end for
  menu.actions=["print:"+str(len(menu.entries))+" mods parsed"]
  return menu
end function
// UI_Mods_MenuEvent
/// @param menu Mutable UI mods record/storage; this routine assigns `menu.cvarWrites`, `menu.commands`, `menu.actions`.
/// @param id Value used by `if id==ID_GO then menu.cvarWrites=menu.cvarWrites+["fs_game="+menu.entries[menu.selected].game]`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GO then menu.cvarWrites=menu.cvarWrites+["fs_game="+menu.entries[menu.selected].game];menu.commands=menu.commands+["vid_restart;"];menu.actions=menu.actions+["pop"]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_ModsMenu_Cache
function cache() return ["menu/art/back_0","menu/art/back_1","menu/art/load_0","menu/art/load_1","menu/art/frame2_l","menu/art/frame1_r"] end function
// UI_Mods_MenuInit
/// @param mods Value used by `menu=loadMods(mods)`.
function init(mods) menu=loadMods(mods);menu.assets=cache();return menu end function
// UI_ModsMenu
/// @param mods Value used by `menu=init(mods)`.
function open(mods) menu=init(mods);menu.actions=menu.actions+["push"];return menu end function
// UI_Mods_LoadModsFromFile (unused in the original build, retained as semantic helper)
/// @param menu Value used by `return parseInfo(menu,name,description)`.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param description Value used by `return parseInfo(menu,name,description)`.
function loadModFromFile(menu,filename,description)
  name=filename;if len(name)>=4 and strings.substr(name,len(name)-4,4)==".mod" then name=strings.substr(name,0,len(name)-4) end if
  return parseInfo(menu,name,description)
end function
