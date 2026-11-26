// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_credits.c.
package mq3.client.ui_credits
import mq3.compat.numeric as n
const K_CHAR_FLAG=1024
const EXEC_APPEND=2
const UI_CENTER=1
const UI_SMALLFONT=16
const PROP_HEIGHT=27
const PROP_SMALL_SIZE_SCALE=0.75
const SMALLCHAR_HEIGHT=16
/// Stores UI credits draw record, including `text`, `x`, `y`, `style`, `color`, `proportional`.
struct Draw text x y style color proportional end struct
/// Stores UI credits state, including `fullscreen`, `drawFn`, `keyFn`, `pushed`, `commands`.
struct State fullscreen drawFn keyFn pushed commands end struct
/// Creates a `mq3.client.ui_credits.Draw` record. Assigns `text` from `text`, `y` from `y`, `color` from `color`, `proportional` from `proportional`.
/// @param text Value used to initialize `Draw.text`.
/// @param y Value used to initialize `Draw.y`.
/// @param color Value used to initialize `Draw.color`.
/// @param proportional Value used to initialize `Draw.proportional`.
function row(text,y,color,proportional) return Draw(text,320,y,UI_CENTER|UI_SMALLFONT,color,proportional) end function
/// Adapts `mq3.compat.numeric.trunc32` to UI credits `gap`, returning its result for `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`.
/// @param y Argument 1 of `mq3.compat.numeric.trunc32`; passed as `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`.
/// @param scale Argument 1 of `mq3.compat.numeric.trunc32`; passed as `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`.
function gap(y,scale) return n.trunc32(y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE) end function
// UI_CreditMenu_Draw
function draw()
  white=[1.0,1.0,1.0,1.0];red=[1.0,0.0,0.0,1.0];rows=[];y=12;rows=rows+[row("id Software is:",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Programming",y,white,true)];y=gap(y,1.0);rows=rows+[row("John Carmack, Robert A. Duffy, Jim Dose'",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Art",y,white,true)];y=gap(y,1.0);rows=rows+[row("Adrian Carmack, Kevin Cloud,",y,white,true)];y=gap(y,1.0);rows=rows+[row("Kenneth Scott, Seneca Menard, Fred Nilsson",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Game Designer",y,white,true)];y=gap(y,1.0);rows=rows+[row("Graeme Devine",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Level Design",y,white,true)];y=gap(y,1.0);rows=rows+[row("Tim Willits, Christian Antkow, Paul Jaquays",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("CEO",y,white,true)];y=gap(y,1.0);rows=rows+[row("Todd Hollenshead",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Director of Business Development",y,white,true)];y=gap(y,1.0);rows=rows+[row("Marty Stratton",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Biz Assist and id Mom",y,white,true)];y=gap(y,1.0);rows=rows+[row("Donna Jackson",y,white,true)]
  y=gap(y,1.42);rows=rows+[row("Development Assistance",y,white,true)];y=gap(y,1.0);rows=rows+[row("Eric Webb",y,white,true)]
  y=gap(y,1.35);rows=rows+[row("To order: 1-800-idgames     www.quake3arena.com     www.idsoftware.com",y,red,false)];y=y+SMALLCHAR_HEIGHT;rows=rows+[row("Quake III Arena(c) 1999-2000, Id Software, Inc.  All Rights Reserved",y,red,false)];return rows
end function
// UI_CreditMenu_Key
/// @param keyCode Value used by `if (keyCode&K_CHAR_FLAG)!=0 then return [] end if`.
function key(keyCode) if (keyCode&K_CHAR_FLAG)!=0 then return [] end if;return [[EXEC_APPEND,"quit\n"]] end function
// UI_CreditMenu
function open() return State(true,draw,key,true,[]) end function
