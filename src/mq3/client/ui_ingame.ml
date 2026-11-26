// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_ingame.c.
package mq3.client.ui_ingame

const QM_ACTIVATED=3
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const TEAM_SPECTATOR=3
const ID_TEAM=10
const ID_ADDBOTS=11
const ID_REMOVEBOTS=12
const ID_SETUP=13
const ID_SERVERINFO=14
const ID_LEAVEARENA=15
const ID_RESTART=16
const ID_QUIT=17
const ID_RESUME=18
const ID_TEAMORDERS=19
const INGAME_FRAME="menu/art/addbotframe"

/// Stores UI ingame in game item record, including `id`, `label`, `y`, `grayed`.
struct InGameItem id label y grayed end struct
/// Stores UI ingame in game menu record, including `wrapAround`, `fullscreen`, `frame`, `items`, `assets`, `commands` and additional values.
struct InGameMenu wrapAround fullscreen frame items assets commands actions cursorX cursorY end struct

// InGame_RestartAction
/// @param menu Mutable UI ingame record/storage; this routine assigns `menu.actions`, `menu.commands`.
/// @param result Value used by `if not result then return menu end if`.
function restartAction(menu,result)
  if not result then return menu end if
  menu.actions=menu.actions+["pop"]
  menu.commands=menu.commands+["map_restart 0\n"]
  return menu
end function

// InGame_QuitAction
/// @param menu Mutable UI ingame record/storage; this routine assigns `menu.actions`.
/// @param result Value used by `if result then menu.actions=menu.actions+["pop","credits"] end if`.
function quitAction(menu,result)
  if result then menu.actions=menu.actions+["pop","credits"] end if
  return menu
end function

// InGame_Event
/// @param menu Mutable UI ingame record/storage; this routine assigns `menu.actions`, `menu.commands`.
/// @param id Value used by `if id==ID_TEAM then menu.actions=menu.actions+["team"]`.
/// @param notification Value used by `if notification!=QM_ACTIVATED then return menu end if`.
function event(menu,id,notification)
  if notification!=QM_ACTIVATED then return menu end if
  if id==ID_TEAM then menu.actions=menu.actions+["team"]
  else if id==ID_SETUP then menu.actions=menu.actions+["setup"]
  else if id==ID_LEAVEARENA then menu.commands=menu.commands+["disconnect\n"]
  else if id==ID_RESTART then menu.actions=menu.actions+["confirm:RESTART ARENA?"]
  else if id==ID_QUIT then menu.actions=menu.actions+["confirm:EXIT GAME?"]
  else if id==ID_SERVERINFO then menu.actions=menu.actions+["serverInfo"]
  else if id==ID_ADDBOTS then menu.actions=menu.actions+["addBots"]
  else if id==ID_REMOVEBOTS then menu.actions=menu.actions+["removeBots"]
  else if id==ID_TEAMORDERS then menu.actions=menu.actions+["teamOrders"]
  else if id==ID_RESUME then menu.actions=menu.actions+["pop"] end if
  return menu
end function

// InGame_Cache
function cache() return [INGAME_FRAME] end function

// InGame_MenuInit
/// @param serverRunning Value used by `botGrayed=not serverRunning or not botEnable or gametype==GT_SINGLE_PLAYER`.
/// @param botEnable Value used by `botGrayed=not serverRunning or not botEnable or gametype==GT_SINGLE_PLAYER`.
/// @param gametype Quake III game-type identifier.
/// @param playerTeam Value used by `ordersGrayed=gametype<GT_TEAM or playerTeam==TEAM_SPECTATOR`.
function init(serverRunning,botEnable,gametype,playerTeam)
  botGrayed=not serverRunning or not botEnable or gametype==GT_SINGLE_PLAYER
  ordersGrayed=gametype<GT_TEAM or playerTeam==TEAM_SPECTATOR
  restartGrayed=not serverRunning
  y=88;items=[]
  items=items+[InGameItem(ID_TEAM,"START",y,false)];y=y+28
  items=items+[InGameItem(ID_ADDBOTS,"ADD BOTS",y,botGrayed)];y=y+28
  items=items+[InGameItem(ID_REMOVEBOTS,"REMOVE BOTS",y,botGrayed)];y=y+28
  items=items+[InGameItem(ID_TEAMORDERS,"TEAM ORDERS",y,ordersGrayed)];y=y+28
  items=items+[InGameItem(ID_SETUP,"SETUP",y,false)];y=y+28
  items=items+[InGameItem(ID_SERVERINFO,"SERVER INFO",y,false)];y=y+28
  items=items+[InGameItem(ID_RESTART,"RESTART ARENA",y,restartGrayed)];y=y+28
  items=items+[InGameItem(ID_RESUME,"RESUME GAME",y,false)];y=y+28
  items=items+[InGameItem(ID_LEAVEARENA,"LEAVE ARENA",y,false)];y=y+28
  items=items+[InGameItem(ID_QUIT,"EXIT GAME",y,false)]
  return InGameMenu(true,false,INGAME_FRAME,items,cache(),[],[],319,80)
end function

// UI_InGameMenu
/// @param serverRunning Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`.
/// @param botEnable Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`.
/// @param gametype Quake III game-type identifier.
/// @param playerTeam Value used by `menu=init(serverRunning,botEnable,gametype,playerTeam)`.
function open(serverRunning,botEnable,gametype,playerTeam)
  menu=init(serverRunning,botEnable,gametype,playerTeam)
  menu.actions=menu.actions+["resetStack","push"]
  return menu
end function
