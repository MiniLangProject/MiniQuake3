// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_specifyserver.c.
package mq3.client.ui_specify_server
const QM_ACTIVATED=3
const ID_SPECIFYSERVERBACK=102
const ID_SPECIFYSERVERGO=103
struct SpecifyServerMenu wrapAround fullscreen domain port domainWidth domainMax portWidth portMax assets commands actions end struct
// SpecifyServer_Event
function event(menu,id,eventCode)
  if id==ID_SPECIFYSERVERGO and eventCode==QM_ACTIVATED and menu.domain!="" then address=menu.domain;if menu.port!="" then address=address+":"+menu.port end if;menu.commands=menu.commands+["connect "+address+"\n"]
  else if id==ID_SPECIFYSERVERBACK and eventCode==QM_ACTIVATED then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// SpecifyServer_Cache
function cache() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1","menu/art/fight_0","menu/art/fight_1"] end function
// SpecifyServer_MenuInit
function init() return SpecifyServerMenu(true,true,"","27960",38,80,6,5,cache(),[],[]) end function
// UI_SpecifyServerMenu
function open() menu=init();menu.actions=menu.actions+["push"];return menu end function
