// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_confirm.c.
package mq3.client.ui_confirm

/// Activation callback event accepted by the confirmation dialog before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Connection-state value for a completed handshake before game-state loading, defined for integrating
/// confirmation menus with the client's connection-state vocabulary.
const CA_CONNECTED=5
/// Menu control identifier routed to the confirm no action by the menu event handler.
const ID_CONFIRM_NO=10
/// Menu control identifier routed to the confirm yes action by the menu event handler.
const ID_CONFIRM_YES=11
/// Virtual shader or image asset name used for the menu's confirm frame artwork.
const ART_CONFIRM_FRAME="menu/art/cut_frame"

/// Stores UI confirm confirm item record, including `id`, `label`, `x`, `y`.
struct ConfirmItem
  /// Event-routing identifier of this selectable control in the confirmation dialog.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Horizontal position of this menu control in the virtual layout used by the confirmation dialog.
  x
  /// Vertical position of this menu control in the virtual layout used by the confirmation dialog.
  y
end struct
/// Stores UI confirm confirm menu record, including `wrapAround`, `fullscreen`, `question`, `style`, `slashX`, `lines` and additional values.
struct ConfirmMenu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the confirmation dialog.
  wrapAround
  /// Whether the confirmation dialog covers the entire UI instead of appearing over the underlying game
  /// view.
  fullscreen
  /// When constructing this record, `openStyle` supplies `question` for this member.
  question
  /// UI drawing-style flags controlling alignment, font selection, and text emphasis.
  style
  /// When constructing this record, `openStyle` supplies `l2` for this member.
  slashX
  /// When constructing this record, `openStyle` supplies an empty list for this member.
  lines
  /// When constructing this record, `openStyle` supplies `items` for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the confirmation dialog.
  assets
  /// Host requests queued while drawing confirmation choices and accepting or rejecting the requested
  /// action, retained in request order.
  actions
  /// When constructing this record, `openStyle` supplies `false` for this member.
  result
  /// When constructing this record, `openStyle` supplies `drawCallback` for this member.
  drawCallback
  /// When constructing this record, `openStyle` supplies `actionCallback` for this member.
  actionCallback
end struct

// ConfirmMenu_Event
/// @param menu Mutable UI confirm record/storage; this routine assigns `menu.actions`, `menu.result`.
/// @param id Value assigned to `menu.result`.
/// @param eventCode Quake III event identifier selecting the event handler.
function event(menu,id,eventCode)
  if eventCode!=QM_ACTIVATED then return menu end if
  menu.actions=menu.actions+["pop"]
  menu.result=id!=ID_CONFIRM_NO
  if menu.actionCallback then menu.actions=menu.actions+["callback:"+str(menu.result)] end if
  return menu
end function

// ConfirmMenu_Key
/// @param menu Mutable UI confirm record/storage; this routine assigns `menu.actions`.
/// @param keyName Value used by `defaultKey=keyName`.
function key(menu,keyName)
  defaultKey=keyName
  if keyName=="KP_LEFTARROW" or keyName=="LEFTARROW" or keyName=="KP_RIGHTARROW" or keyName=="RIGHTARROW" then defaultKey="TAB"
  else if keyName=="n" or keyName=="N" then menu=event(menu,ID_CONFIRM_NO,QM_ACTIVATED)
  else if keyName=="y" or keyName=="Y" then menu=event(menu,ID_CONFIRM_YES,QM_ACTIVATED) end if
  menu.actions=menu.actions+["defaultKey:"+defaultKey]
  return menu
end function

// MessageMenu_Draw
/// @param menu Record read through `menu.lines`, `menu.drawCallback`.
function drawMessage(menu)
  actions=["pic:142,118,359,256:"+ART_CONFIRM_FRAME]
  y=188
  for each line in menu.lines actions=actions+["text:320,"+str(y)+":"+line];y=y+18 end for
  actions=actions+["drawMenu"]
  if menu.drawCallback then actions=actions+["drawCallback"] end if
  return actions
end function

// ConfirmMenu_Draw
/// @param menu Record read through `menu.question`, `menu.slashX`, `menu.drawCallback`.
function draw(menu)
  actions=["pic:142,118,359,256:"+ART_CONFIRM_FRAME,"text:320,204:"+menu.question,"text:"+str(menu.slashX)+",265:/","drawMenu"]
  if menu.drawCallback then actions=actions+["drawCallback"] end if
  return actions
end function

// ConfirmMenu_Cache
function cache() return [ART_CONFIRM_FRAME] end function

// UI_ConfirmMenu_Style
/// @param question Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`.
/// @param style Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`.
/// @param drawCallback Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`.
/// @param actionCallback Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`.
/// @param connectionState Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`.
/// @param yesNoWidth Value used by `l1=320-(yesNoWidth/2)`.
/// @param yesWidth Value used by `l2=l1+yesWidth+3`.
/// @param slashWidth Value used by `l3=l2+slashWidth+3`.
function openStyle(question,style,drawCallback,actionCallback,connectionState,yesNoWidth,yesWidth,slashWidth)
  l1=320-(yesNoWidth/2);l2=l1+yesWidth+3;l3=l2+slashWidth+3
  items=[ConfirmItem(ID_CONFIRM_YES,"YES",l1,264),ConfirmItem(ID_CONFIRM_NO,"NO",l3,264)]
  return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)
end function

// UI_ConfirmMenu
/// @param question Argument 1 of `mq3.client.ui_confirm.openStyle`.
/// @param drawCallback Argument 3 of `mq3.client.ui_confirm.openStyle`.
/// @param actionCallback Argument 4 of `mq3.client.ui_confirm.openStyle`.
/// @param connectionState Argument 5 of `mq3.client.ui_confirm.openStyle`.
/// @param yesNoWidth Argument 6 of `mq3.client.ui_confirm.openStyle`.
/// @param yesWidth Argument 7 of `mq3.client.ui_confirm.openStyle`.
/// @param slashWidth Argument 8 of `mq3.client.ui_confirm.openStyle`.
function open(question,drawCallback,actionCallback,connectionState,yesNoWidth,yesWidth,slashWidth)
  return openStyle(question,17,drawCallback,actionCallback,connectionState,yesNoWidth,yesWidth,slashWidth)
end function

// UI_Message
/// @param lines Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,"",21,0,lines,[item],cache(),["push","cursor:OK"],false,false,false)`.
/// @param connectionState Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,"",21,0,lines,[item],cache(),["push","cursor:OK"],false,false,false)`.
/// @param okWidth Value used by `l1=320-(okWidth/2)`.
function message(lines,connectionState,okWidth)
  l1=320-(okWidth/2)
  item=ConfirmItem(ID_CONFIRM_YES,"OK",l1,280)
  return ConfirmMenu(true,connectionState<CA_CONNECTED,"",21,0,lines,[item],cache(),["push","cursor:OK"],false,false,false)
end function
