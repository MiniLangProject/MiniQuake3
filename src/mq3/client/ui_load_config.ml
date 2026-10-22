// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_loadconfig.c.
package mq3.client.ui_load_config
import std.string as strings
const QM_ACTIVATED=3
const ID_BACK=10
const ID_GO=11
const ID_LIST=12
const ID_LEFT=13
const ID_RIGHT=14
const MAX_CONFIGS=128
struct LoadConfigMenu wrapAround fullscreen names selected goHidden assets commands actions end struct
function displayName(name) lower=strings.toLowerAscii(name);if strings.endsWith(lower,".cfg") then name=strings.substr(name,0,len(name)-4) end if;return strings.toUpperAscii(name) end function
// LoadConfig_MenuEvent
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
function init(files)
  names=[];for each file in files if len(names)<MAX_CONFIGS then names=names+[displayName(file)] end if end for
  hidden=len(names)==0;if hidden then names=["No Files Found."] end if
  return LoadConfigMenu(true,true,names,0,hidden,cache(),[],[])
end function
// UI_LoadConfigMenu
function open(files) menu=init(files);menu.actions=menu.actions+["push"];return menu end function
