// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_team.c.
package mq3.client.ui_team
/// Activation callback event accepted by the team-selection menu before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when choosing valid team and spectator
/// actions for the current rules.
const GT_TOURNAMENT=1
/// Native game-type value for single-player arena progression, used when choosing valid team and
/// spectator actions for the current rules.
const GT_SINGLE_PLAYER=2
/// Team-deathmatch rules identifier retained in the team menu's native game-type vocabulary.
const GT_TEAM=3
/// Capture-the-flag rules identifier retained in the team menu's native game-type vocabulary.
const GT_CTF=4
/// Menu control identifier routed to the joinred action by the menu event handler.
const ID_JOINRED=100
/// Menu control identifier routed to the joinblue action by the menu event handler.
const ID_JOINBLUE=101
/// Menu control identifier routed to the joingame action by the menu event handler.
const ID_JOINGAME=102
/// Menu control identifier routed to the spectate action by the menu event handler.
const ID_SPECTATE=103
/// Stores UI team team item record, including `id`, `label`, `y`, `grayed`.
struct TeamItem
  /// Event-routing identifier of this selectable control in the team-selection menu.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Vertical position of this menu control in the virtual layout used by the team-selection menu.
  y
  /// When constructing this record, `init` supplies `teamDisabled` for this member.
  grayed
end struct
/// Stores UI team team menu record, including `wrapAround`, `fullscreen`, `items`, `assets`, `commands`, `actions`.
struct TeamMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the team-selection menu.
  wrapAround
  /// Whether the team-selection menu covers the entire UI instead of appearing over the underlying game
  /// view.
  fullscreen
  /// When constructing this record, `init` supplies `items` for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the team-selection menu.
  assets
  /// When constructing this record, `init` supplies an empty list for this member.
  commands
  /// Host requests queued while selecting a team or spectator status, retained in request order.
  actions
end struct
// TeamMain_MenuEvent
/// @param menu Mutable UI team record/storage; this routine assigns `menu.commands`, `menu.actions`.
/// @param id Value used by `if id==ID_JOINRED then command="cmd team red\n" else if id==ID_JOINBLUE then command="cmd team blue\n" else if id==ID_JOINGAME then command="c...`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  command=""
  if id==ID_JOINRED then command="cmd team red\n" else if id==ID_JOINBLUE then command="cmd team blue\n" else if id==ID_JOINGAME then command="cmd team free\n" else if id==ID_SPECTATE then command="cmd team spectator\n" end if
  if command!="" then menu.commands=menu.commands+[command];menu.actions=menu.actions+["forceOff"] end if
  return menu
end function
// TeamMain_Cache
function cache() return ["menu/art/cut_frame"] end function
// TeamMain_MenuInit
/// @param gametype Quake III game-type identifier.
function init(gametype)
  teamDisabled=gametype==GT_SINGLE_PLAYER or gametype==GT_FFA or gametype==GT_TOURNAMENT
  freeDisabled=not teamDisabled
  items=[TeamItem(ID_JOINRED,"JOIN RED",194,teamDisabled),TeamItem(ID_JOINBLUE,"JOIN BLUE",214,teamDisabled),TeamItem(ID_JOINGAME,"JOIN GAME",234,freeDisabled),TeamItem(ID_SPECTATE,"SPECTATE",254,false)]
  return TeamMenu(true,false,items,cache(),[],[])
end function
// UI_TeamMainMenu
/// @param gametype Quake III game-type identifier.
function open(gametype) menu=init(gametype);menu.actions=menu.actions+["push"];return menu end function
