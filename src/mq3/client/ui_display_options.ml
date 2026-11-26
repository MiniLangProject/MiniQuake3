// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_display.c.
package mq3.client.ui_display_options

/// Activation callback event accepted by the display and gamma options menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the graphics action by the menu event handler.
const ID_GRAPHICS=10
/// Menu control identifier routed to the display action by the menu event handler.
const ID_DISPLAY=11
/// Menu control identifier routed to the sound action by the menu event handler.
const ID_SOUND=12
/// Menu control identifier routed to the network action by the menu event handler.
const ID_NETWORK=13
/// Menu control identifier routed to the brightness action by the menu event handler.
const ID_BRIGHTNESS=14
/// Menu control identifier routed to the screensize action by the menu event handler.
const ID_SCREENSIZE=15
/// Event identifier of the Back control used to leave the display and gamma options menu and return to
/// its parent menu.
const ID_BACK=16

/// Stores UI display options menu item, including `id`, `kind`, `name`, `x`, `y`, `minValue` and additional values.
struct Item
  /// Event-routing identifier of this selectable control in the display and gamma options menu.
  id
  /// Item category selecting pickup behavior or the type-specific UI control implementation.
  kind
  /// Visible label or artwork name of a display-options menu control.
  name
  /// Horizontal position of this menu control in the virtual layout used by the display and gamma
  /// options menu.
  x
  /// Vertical position of this menu control in the virtual layout used by the display and gamma options
  /// menu.
  y
  /// When constructing this record, `item` supplies `minValue` for this member.
  minValue
  /// When constructing this record, `item` supplies `maxValue` for this member.
  maxValue
  /// Current or default setting value held by this configuration variable or UI control.
  value
  /// When constructing this record, `item` supplies `active` for this member.
  active
end struct
/// Stores UI display options menu, including `wrapAround`, `fullscreen`, `cursor`, `items`, `assets`, `actions` and additional values.
struct Menu
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the display and gamma
  /// options menu.
  wrapAround
  /// Whether the display-options menu covers the entire UI instead of appearing over the underlying
  /// game view.
  fullscreen
  /// When constructing this record, `init` supplies `ID_DISPLAY` for this member.
  cursor
  /// Ordered child items participating in this menu's rendering and navigation.
  items
  /// Media resources retained for registering and drawing the artwork used by the display and gamma
  /// options menu.
  assets
  /// Host requests queued while drawing display controls and applying gamma or view-size settings,
  /// retained in request order.
  actions
  /// Cvar name/value changes queued by the display and gamma options menu for the host to apply.
  cvarWrites
end struct

/// Creates a `mq3.client.ui_display_options.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.
/// @param id Value used to initialize `Item.id`.
/// @param kind Value used to initialize `Item.kind`.
/// @param name Value used to initialize `Item.name`.
/// @param x Value used to initialize `Item.x`.
/// @param y Value used to initialize `Item.y`.
/// @param minValue Value used to initialize `Item.minValue`.
/// @param maxValue Value used to initialize `Item.maxValue`.
/// @param value Value used to initialize `Item.value`.
/// @param active Value used to initialize `Item.active`.
function item(id,kind,name,x,y,minValue,maxValue,value,active)
  return Item(id,kind,name,x,y,minValue,maxValue,value,active)
end function

// UI_DisplayOptionsMenu_Cache
function cache()
  return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
end function

// UI_DisplayOptionsMenu_Init
/// @param rGamma Value used by `items=items+[item(ID_BRIGHTNESS,"slider","Brightness:",400,222,5.0,20.0,rGamma*10.0,deviceSupportsGamma)]`.
/// @param cgViewsize Value used by `items=items+[item(ID_SCREENSIZE,"slider","Screen Size:",400,240,3.0,10.0,cgViewsize/10.0,true)]`.
/// @param deviceSupportsGamma Value used by `items=items+[item(ID_BRIGHTNESS,"slider","Brightness:",400,222,5.0,20.0,rGamma*10.0,deviceSupportsGamma)]`.
function init(rGamma,cgViewsize,deviceSupportsGamma)
  items=[]
  items=items+[item(0,"btext","SYSTEM SETUP",320,16,0.0,0.0,0.0,true)]
  items=items+[item(0,"bitmap","menu/art/frame2_l",0,78,0.0,0.0,0.0,false)]
  items=items+[item(0,"bitmap","menu/art/frame1_r",376,76,0.0,0.0,0.0,false)]
  items=items+[item(ID_GRAPHICS,"ptext","GRAPHICS",216,186,0.0,0.0,0.0,true)]
  items=items+[item(ID_DISPLAY,"ptext","DISPLAY",216,213,0.0,0.0,0.0,true)]
  items=items+[item(ID_SOUND,"ptext","SOUND",216,240,0.0,0.0,0.0,true)]
  items=items+[item(ID_NETWORK,"ptext","NETWORK",216,267,0.0,0.0,0.0,true)]
  items=items+[item(ID_BRIGHTNESS,"slider","Brightness:",400,222,5.0,20.0,rGamma*10.0,deviceSupportsGamma)]
  items=items+[item(ID_SCREENSIZE,"slider","Screen Size:",400,240,3.0,10.0,cgViewsize/10.0,true)]
  items=items+[item(ID_BACK,"bitmap","menu/art/back_0",0,416,0.0,0.0,0.0,true)]
  return Menu(true,true,ID_DISPLAY,items,cache(),[],[])
end function

// UI_DisplayOptionsMenu_Event
/// @param menu Mutable UI display options record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`.
/// @param id Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param value Value used by `else if id==ID_BRIGHTNESS then menu.cvarWrites=menu.cvarWrites+[["r_gamma",value/10.0]]`.
function event(menu,id,eventCode,value)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]
  else if id==ID_SOUND then menu.actions=menu.actions+["pop","sound"]
  else if id==ID_NETWORK then menu.actions=menu.actions+["pop","network"]
  else if id==ID_BRIGHTNESS then menu.cvarWrites=menu.cvarWrites+[["r_gamma",value/10.0]]
  else if id==ID_SCREENSIZE then menu.cvarWrites=menu.cvarWrites+[["cg_viewsize",value*10.0]]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"]
  end if
  return menu
end function

// UI_DisplayOptionsMenu
/// @param rGamma Argument 1 of `mq3.client.ui_display_options.init`.
/// @param cgViewsize Argument 2 of `mq3.client.ui_display_options.init`.
/// @param deviceSupportsGamma Argument 3 of `mq3.client.ui_display_options.init`.
function open(rGamma,cgViewsize,deviceSupportsGamma)
  return init(rGamma,cgViewsize,deviceSupportsGamma)
end function
