// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_team.c.
package mq3.client.ui_team
const QM_ACTIVATED=3
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const ID_JOINRED=100
const ID_JOINBLUE=101
const ID_JOINGAME=102
const ID_SPECTATE=103
/// Stores UI team team item record, including `id`, `label`, `y`, `grayed`.
struct TeamItem id label y grayed end struct
/// Stores UI team team menu record, including `wrapAround`, `fullscreen`, `items`, `assets`, `commands`, `actions`.
struct TeamMenu wrapAround fullscreen items assets commands actions end struct
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
