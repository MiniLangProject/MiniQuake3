// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_mods.c.
package mq3.client.ui_mods
import std.string as strings
const QM_ACTIVATED=3
const ID_BACK=10
const ID_GO=11
const ID_LIST=12
const MAX_MODS=64
struct ModEntry game description end struct
struct ModsMenu wrapAround fullscreen entries selected assets cvarWrites commands actions end struct
// UI_Mods_ParseInfos
function parseInfo(menu,modDir,modDesc)
  if len(menu.entries)>=MAX_MODS then return menu end if
  game=modDir;if len(game)>15 then game=strings.substr(game,0,15) end if
  description=modDesc;if len(description)>47 then description=strings.substr(description,0,47) end if
  menu.entries=menu.entries+[ModEntry(game,description)];return menu
end function
// UI_Mods_LoadMods
function loadMods(mods)
  menu=ModsMenu(true,true,[ModEntry("","Quake III Arena")],0,[],[],[],["print:1 mods parsed"])
  for each item in mods if len(menu.entries)<MAX_MODS then menu=parseInfo(menu,item[0],item[1]) end if end for
  menu.actions=["print:"+str(len(menu.entries))+" mods parsed"]
  return menu
end function
// UI_Mods_MenuEvent
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GO then menu.cvarWrites=menu.cvarWrites+["fs_game="+menu.entries[menu.selected].game];menu.commands=menu.commands+["vid_restart;"];menu.actions=menu.actions+["pop"]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_ModsMenu_Cache
function cache() return ["menu/art/back_0","menu/art/back_1","menu/art/load_0","menu/art/load_1","menu/art/frame2_l","menu/art/frame1_r"] end function
// UI_Mods_MenuInit
function init(mods) menu=loadMods(mods);menu.assets=cache();return menu end function
// UI_ModsMenu
function open(mods) menu=init(mods);menu.actions=menu.actions+["push"];return menu end function
// UI_Mods_LoadModsFromFile (unused in the original build, retained as semantic helper)
function loadModFromFile(menu,filename,description)
  name=filename;if len(name)>=4 and strings.substr(name,len(name)-4,4)==".mod" then name=strings.substr(name,0,len(name)-4) end if
  return parseInfo(menu,name,description)
end function
