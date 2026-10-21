// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_menu.c.
package mq3.client.ui_main_menu
import mq3.compat.transcendental as trans
import std.string as strings

const QM_ACTIVATED=3
const ID_SINGLEPLAYER=10
const ID_MULTIPLAYER=11
const ID_SETUP=12
const ID_DEMOS=13
const ID_CINEMATICS=14
const ID_TEAMARENA=15
const ID_MODS=16
const ID_EXIT=17
const MAIN_BANNER_MODEL="models/mapobjects/banner/banner5.md3"

struct MainItem id label y end struct
struct MainDraw bannerModel yaw errorMessage demoVersion actions end struct
struct MainMenu fullscreen wrapAround showlogo items assets cvarWrites commands actions errorMessage end struct

// MainMenu_ExitAction
function exitAction(menu,result)
  if not result then return menu end if
  menu.actions=menu.actions+["pop","credits"]
  return menu
end function

// Main_MenuEvent
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
function errorMessageKey(menu,key)
  menu.cvarWrites=menu.cvarWrites+["com_errorMessage="]
  menu.actions=menu.actions+["mainMenu","nullSound"]
  return menu
end function

// Main_MenuDraw
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
function teamArenaExists(modNames)
  i=0
  while i<len(modNames)
    if strings.equalsIgnoreCaseAscii(modNames[i],"missionpack") then return true end if
    i=i+1
  end while
  return false
end function

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
function open(demoVersion,cdKeyChecked,cdKeyValid,errorMessage,modNames)
  menu=MainMenu(true,true,true,[],cache(),["sv_killserver=1"],[],[],errorMessage)
  if not demoVersion and not cdKeyChecked and not cdKeyValid then menu.actions=menu.actions+["cdKey"];return menu end if
  if errorMessage!="" then menu.actions=menu.actions+["keyCatcher:UI","resetStack","pushError"];return menu end if
  menu.items=buildItems(teamArenaExists(modNames))
  menu.actions=menu.actions+["keyCatcher:UI","resetStack","push"]
  return menu
end function
