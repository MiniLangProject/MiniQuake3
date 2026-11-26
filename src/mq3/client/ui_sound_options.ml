// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_sound.c.
package mq3.client.ui_sound_options

const QM_ACTIVATED=3
const ID_GRAPHICS=10
const ID_DISPLAY=11
const ID_SOUND=12
const ID_NETWORK=13
const ID_EFFECTSVOLUME=14
const ID_MUSICVOLUME=15
const ID_QUALITY=16
const ID_BACK=18

/// Stores UI sound options menu item, including `id`, `kind`, `name`, `x`, `y`, `minValue` and additional values.
struct Item id kind name x y minValue maxValue value active end struct
/// Stores UI sound options menu, including `wrapAround`, `fullscreen`, `cursor`, `items`, `assets`, `actions` and additional values.
struct Menu wrapAround fullscreen cursor items assets actions cvarWrites commands end struct

/// Creates a `mq3.client.ui_sound_options.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.
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

// UI_SoundOptionsMenu_Cache
function cache()
  return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
end function

// UI_SoundOptionsMenu_Init
/// @param sVolume Value used by `items=items+[item(ID_EFFECTSVOLUME,"slider","Effects Volume:",400,213,0.0,10.0,sVolume*10.0,true)]`.
/// @param sMusicVolume Value used by `items=items+[item(ID_MUSICVOLUME,"slider","Music Volume:",400,231,0.0,10.0,sMusicVolume*10.0,true)]`.
/// @param sCompression Value used by `items=items+[item(ID_QUALITY,"spin","Sound Quality:",400,249,0.0,1.0,1.0-sCompression,true)]`.
function init(sVolume,sMusicVolume,sCompression)
  items=[]
  items=items+[item(0,"btext","SYSTEM SETUP",320,16,0.0,0.0,0.0,true)]
  items=items+[item(0,"bitmap","menu/art/frame2_l",0,78,0.0,0.0,0.0,false)]
  items=items+[item(0,"bitmap","menu/art/frame1_r",376,76,0.0,0.0,0.0,false)]
  items=items+[item(ID_GRAPHICS,"ptext","GRAPHICS",216,186,0.0,0.0,0.0,true)]
  items=items+[item(ID_DISPLAY,"ptext","DISPLAY",216,213,0.0,0.0,0.0,true)]
  items=items+[item(ID_SOUND,"ptext","SOUND",216,240,0.0,0.0,0.0,true)]
  items=items+[item(ID_NETWORK,"ptext","NETWORK",216,267,0.0,0.0,0.0,true)]
  items=items+[item(ID_EFFECTSVOLUME,"slider","Effects Volume:",400,213,0.0,10.0,sVolume*10.0,true)]
  items=items+[item(ID_MUSICVOLUME,"slider","Music Volume:",400,231,0.0,10.0,sMusicVolume*10.0,true)]
  items=items+[item(ID_QUALITY,"spin","Sound Quality:",400,249,0.0,1.0,1.0-sCompression,true)]
  items=items+[item(ID_BACK,"bitmap","menu/art/back_0",0,416,0.0,0.0,0.0,true)]
  return Menu(true,true,ID_SOUND,items,cache(),[],[],[])
end function

// UI_SoundOptionsMenu_Event
/// @param menu Mutable UI sound options record/storage; this routine assigns `menu.actions`, `menu.cvarWrites`, `menu.commands`.
/// @param id Value used by `if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param value Value tested by `value!=0.0` before the calculation continues.
function event(menu,id,eventCode,value)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"]
  else if id==ID_DISPLAY then menu.actions=menu.actions+["pop","display"]
  else if id==ID_NETWORK then menu.actions=menu.actions+["pop","network"]
  else if id==ID_EFFECTSVOLUME then menu.cvarWrites=menu.cvarWrites+[["s_volume",value/10.0]]
  else if id==ID_MUSICVOLUME then menu.cvarWrites=menu.cvarWrites+[["s_musicvolume",value/10.0]]
  else if id==ID_QUALITY then
    if value!=0.0 then menu.cvarWrites=menu.cvarWrites+[["s_khz",22.0],["s_compression",0.0]]
    else menu.cvarWrites=menu.cvarWrites+[["s_khz",11.0],["s_compression",1.0]] end if
    menu.actions=menu.actions+["forceOff"]
    menu.commands=menu.commands+["snd_restart\n"]
  else if id==ID_BACK then menu.actions=menu.actions+["pop"]
  end if
  return menu
end function

// UI_SoundOptionsMenu
/// @param sVolume Argument 1 of `mq3.client.ui_sound_options.init`.
/// @param sMusicVolume Argument 2 of `mq3.client.ui_sound_options.init`.
/// @param sCompression Argument 3 of `mq3.client.ui_sound_options.init`.
function open(sVolume,sMusicVolume,sCompression)
  return init(sVolume,sMusicVolume,sCompression)
end function
