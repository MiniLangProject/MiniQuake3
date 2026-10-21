// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_network.c.
package mq3.client.ui_network_options
const QM_ACTIVATED=3
const ID_GRAPHICS=10
const ID_DISPLAY=11
const ID_SOUND=12
const ID_NETWORK=13
const ID_RATE=14
const ID_BACK=15
struct Item id kind name x y value end struct
struct Menu wrapAround fullscreen cursor items assets actions cvarWrites end struct
function item(id,kind,name,x,y,value) return Item(id,kind,name,x,y,value) end function
function rateIndex(rate) if rate<=2500 then return 0 else if rate<=3000 then return 1 else if rate<=4000 then return 2 else if rate<=5000 then return 3 end if;return 4 end function
function rateValue(index) if index==0 then return 2500 else if index==1 then return 3000 else if index==2 then return 4000 else if index==3 then return 5000 else if index==4 then return 25000 end if;return -1 end function
// UI_NetworkOptionsMenu_Cache
function cache() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"] end function
// UI_NetworkOptionsMenu_Init
function init(rate)
  items=[item(0,"btext","SYSTEM SETUP",320,16,0),item(0,"bitmap","menu/art/frame2_l",0,78,0),item(0,"bitmap","menu/art/frame1_r",376,76,0),item(ID_GRAPHICS,"ptext","GRAPHICS",216,186,0),item(ID_DISPLAY,"ptext","DISPLAY",216,213,0),item(ID_SOUND,"ptext","SOUND",216,240,0),item(ID_NETWORK,"ptext","NETWORK",216,267,0),item(ID_RATE,"spin","Data Rate:",400,222,rateIndex(rate)),item(ID_BACK,"bitmap","menu/art/back_0",0,416,0)]
  return Menu(true,true,ID_NETWORK,items,cache(),[],[])
end function
// UI_NetworkOptionsMenu_Event
function event(menu,id,eventCode,value)
  if eventCode!=QM_ACTIVATED then return menu end if
  if id==ID_GRAPHICS then menu.actions=menu.actions+["pop","graphics"] else if id==ID_DISPLAY then menu.actions=menu.actions+["pop","display"] else if id==ID_SOUND then menu.actions=menu.actions+["pop","sound"] else if id==ID_RATE then mapped=rateValue(value);if mapped>=0 then menu.cvarWrites=menu.cvarWrites+[["rate",mapped]] end if else if id==ID_BACK then menu.actions=menu.actions+["pop"] end if
  return menu
end function
// UI_NetworkOptionsMenu
function open(rate) return init(rate) end function
