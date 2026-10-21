// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_display.c.
package mq3.client.ui_display_options

const QM_ACTIVATED=3
const ID_GRAPHICS=10
const ID_DISPLAY=11
const ID_SOUND=12
const ID_NETWORK=13
const ID_BRIGHTNESS=14
const ID_SCREENSIZE=15
const ID_BACK=16

struct Item id kind name x y minValue maxValue value active end struct
struct Menu wrapAround fullscreen cursor items assets actions cvarWrites end struct

function item(id,kind,name,x,y,minValue,maxValue,value,active)
  return Item(id,kind,name,x,y,minValue,maxValue,value,active)
end function

// UI_DisplayOptionsMenu_Cache
function cache()
  return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
end function

// UI_DisplayOptionsMenu_Init
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
function open(rGamma,cgViewsize,deviceSupportsGamma)
  return init(rGamma,cgViewsize,deviceSupportsGamma)
end function
