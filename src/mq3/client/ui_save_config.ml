// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_saveconfig.c.
package mq3.client.ui_save_config
import std.string as strings
const QM_ACTIVATED=3
struct SaveConfigMenu wrapAround fullscreen name maxchars widthInChars assets commands actions end struct
function stripExtension(name) at=strings.lastIndexOf(name,".");if at>=0 then return strings.substr(name,0,at) end if;return name end function
// UI_SaveConfigMenu_BackEvent
function backEvent(menu,eventCode) if eventCode==QM_ACTIVATED then menu.actions=menu.actions+["pop"] end if;return menu end function
// UI_SaveConfigMenu_SaveEvent
function saveEvent(menu,eventCode)
  if eventCode!=QM_ACTIVATED or menu.name=="" then return menu end if
  menu.commands=menu.commands+["writeconfig "+stripExtension(menu.name)+".cfg\n"];menu.actions=menu.actions+["pop"];return menu
end function
// UI_SaveConfigMenu_SavenameDraw
function drawName(menu,focused) style="left+small";color="red";if focused then style="left+pulse+small";color="highlight" end if;return ["text:320,192:Enter filename:","fill:240,227,"+str(menu.widthInChars*8)+",16","field:"+style+":"+color+":"+menu.name] end function
// UI_SaveConfigMenu_Cache
function cache() return ["menu/art/back_0","menu/art/back_1","menu/art/save_0","menu/art/save_1","menu/art/cut_frame"] end function
// UI_SaveConfigMenu_Init
function init() return SaveConfigMenu(true,true,"",20,20,cache(),[],[]) end function
// UI_SaveConfigMenu
function open() menu=init();menu.actions=menu.actions+["push"];return menu end function
