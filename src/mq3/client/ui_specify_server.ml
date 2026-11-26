// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_specifyserver.c.
package mq3.client.ui_specify_server
/// Activation callback event accepted by the direct server-address dialog before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the specifyserverback action by the menu event handler.
const ID_SPECIFYSERVERBACK=102
/// Menu control identifier routed to the specifyservergo action by the menu event handler.
const ID_SPECIFYSERVERGO=103
/// Stores UI specify server specify server menu record, including `wrapAround`, `fullscreen`, `domain`, `port`, `domainWidth`, `domainMax` and additional values.
struct SpecifyServerMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the direct server-address
  /// dialog.
  wrapAround
  /// Whether the manual server-address menu covers the entire UI instead of appearing over the
  /// underlying game view.
  fullscreen
  /// When constructing this record, `init` supplies an empty string for this member.
  domain
  /// When constructing this record, `init` supplies `"27960"` for this member.
  port
  /// When constructing this record, `init` supplies `38` for this member.
  domainWidth
  /// When constructing this record, `init` supplies `80` for this member.
  domainMax
  /// When constructing this record, `init` supplies `6` for this member.
  portWidth
  /// When constructing this record, `init` supplies `5` for this member.
  portMax
  /// Media resources retained for registering and drawing the artwork used by the direct server-address
  /// dialog.
  assets
  /// When constructing this record, `init` supplies an empty list for this member.
  commands
  /// Host requests queued while accepting a server address and issuing a connection command, retained
  /// in request order.
  actions
end struct
// SpecifyServer_Event
/// @param menu Mutable UI specify server record/storage; this routine assigns `menu.commands`, `menu.actions`.
/// @param id Value used by `if id==ID_SPECIFYSERVERGO and eventCode==QM_ACTIVATED and menu.domain!="" then address=menu.domain`.
/// @param eventCode Quake III event identifier selecting the event handler.
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
