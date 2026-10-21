// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_options.c.
package mq3.client.ui_system_config
const QM_ACTIVATED=3
const CA_CONNECTED=5
const ID_GRAPHICS=10
const ID_DISPLAY=11
const ID_SOUND=12
const ID_NETWORK=13
const ID_BACK=14
struct Item id kind name x y end struct
struct Menu wrapAround fullscreen items assets actions pushed end struct
function item(id,kind,name,x,y) return Item(id,kind,name,x,y) end function
// SystemConfig_Cache
function cache() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"] end function
// Options_MenuInit
function init(connState)
  items=[item(0,"btext","SYSTEM SETUP",320,16),item(0,"bitmap","menu/art/frame2_l",8,76),item(0,"bitmap","menu/art/frame1_r",376,76),item(ID_GRAPHICS,"ptext","GRAPHICS",320,168),item(ID_DISPLAY,"ptext","DISPLAY",320,202),item(ID_SOUND,"ptext","SOUND",320,236),item(ID_NETWORK,"ptext","NETWORK",320,270),item(ID_BACK,"bitmap","menu/art/back_0",0,416)]
  return Menu(true,connState<CA_CONNECTED,items,cache(),[],false)
end function
// Options_Event
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GRAPHICS then menu.actions=menu.actions+["graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["display"] else if id==ID_SOUND then menu.actions=menu.actions+["sound"] else if id==ID_NETWORK then menu.actions=menu.actions+["network"] else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_SystemConfigMenu
function open(connState) menu=init(connState);menu.pushed=true;return menu end function
