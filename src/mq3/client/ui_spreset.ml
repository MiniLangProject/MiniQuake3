// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_spreset.c.
package mq3.client.ui_spreset

import mq3.client.ui_gameinfo as gameinfo
import mq3.client.ui_qmenu as qmenu
import mq3.client.cgame_drawtools as drawtools
import mq3.compat.numeric as numeric

const ID_NO=100
const ID_YES=101
const CA_CONNECTED=5

/// Stores UI spreset reset record, including `game`, `menu`, `no`, `yes`, `slashX`, `popped` and additional values.
struct Reset game menu no yes slashX popped popCount levelMenuOpened cvarWrites assets drawRows pushed end struct

/// Creates a `mq3.client.ui_spreset.Reset` record. Assigns `game` from `game`.
/// @param game Value used to initialize `Reset.game`.
function create(game) return Reset(game,qmenu.menu(true,true),void,void,0,false,0,false,[],[],[],false) end function
/// Builds the UI spreset `draw` sequence from `[kind,x,y,w,h,text,style,color,asset]`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param x Horizontal coordinate in the coordinate space used by `draw`.
/// @param y Vertical coordinate in the coordinate space used by `draw`.
/// @param w Width in the coordinate space used by `draw`.
/// @param h Height in the coordinate space used by `draw`.
/// @param text Text consumed or emitted by `draw` in the UI spreset path.
/// @param style Value used by `return [kind,x,y,w,h,text,style,color,asset]`.
/// @param color Color value used by the UI spreset drawing or interpolation operation.
/// @param asset Value used by `return [kind,x,y,w,h,text,style,color,asset]`.
function draw(kind,x,y,w,h,text,style,color,asset) return [kind,x,y,w,h,text,style,color,asset] end function

// Reset_MenuEvent
/// @param value Mutable UI spreset record/storage; this routine assigns `value.popped`, `value.popCount`, `value.cvarWrites`, `value.levelMenuOpened`.
/// @param id Value used by `if id==ID_NO then return true end if`.
/// @param event Event identifier compared with the supported activation/input events.
function Reset_MenuEvent(value,id,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;value.popped=true;value.popCount=value.popCount+1;if id==ID_NO then return true end if;gameinfo.UI_NewGame(value.game);value.cvarWrites=value.cvarWrites+[["ui_spSelection","0"]];value.popCount=value.popCount+1;value.levelMenuOpened=true;return true
end function

// Reset_MenuKey
/// @param value Record read through `value.menu`.
/// @param key Key or control identifier used to select the corresponding UI spreset entry.
/// @param cursorx Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
/// @param cursory Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
function Reset_MenuKey(value,key,cursorx,cursory)
  if key==qmenu.K_KP_LEFTARROW or key==qmenu.K_LEFTARROW or key==qmenu.K_KP_RIGHTARROW or key==qmenu.K_RIGHTARROW then key=qmenu.K_TAB
  else if key==110 or key==78 then Reset_MenuEvent(value,ID_NO,qmenu.QM_ACTIVATED)
  else if key==121 or key==89 then Reset_MenuEvent(value,ID_YES,qmenu.QM_ACTIVATED) end if
  current=qmenu.Menu_ItemAtCursor(value.menu);activate=key==qmenu.K_ENTER or key==qmenu.K_KP_ENTER or qmenu.joystickActivate(key)
  if (key==qmenu.K_MOUSE1 or key==qmenu.K_MOUSE3) and current!=void and (current.flags&qmenu.QMF_HASMOUSEFOCUS)!=0 then activate=true end if
  if activate and current!=void and (current.flags&(qmenu.QMF_MOUSEONLY|qmenu.QMF_GRAYED|qmenu.QMF_INACTIVE))==0 then Reset_MenuEvent(value,current.id,qmenu.QM_ACTIVATED);return qmenu.SOUND_MOVE end if
  return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function

// Reset_MenuDraw
/// @param value Mutable UI spreset record/storage; this routine assigns `value.drawRows`.
/// @param realtime Current client real-time clock in milliseconds.
function Reset_MenuDraw(value,realtime)
  rows=[draw("bitmap",142,118,359,256,"",0,void,"menu/art/cut_frame"),draw("proportional",320,204,0,0,"RESET GAME?",qmenu.UI_CENTER|128,[1.0,0.0,0.0,1.0],""),draw("proportional",value.slashX,265,0,0,"/",qmenu.UI_LEFT|128,[1.0,0.0,0.0,1.0],"")];rows=rows+qmenu.Menu_Draw(value.menu,realtime);warnings=["WARNING: This resets all of the","single player game variables.","Do this only if you want to","start over from the beginning."];for index=0 to 3 rows=rows+[draw("proportional",320,356+27*index,0,0,warnings[index],qmenu.UI_CENTER|qmenu.UI_SMALLFONT,[1.0,1.0,0.0,1.0],"")] end for;value.drawRows=rows;return rows
end function

// Reset_Cache
function Reset_Cache() return ["menu/art/cut_frame"] end function

// UI_ResetMenu
/// @param game Value used by `value=create(game)`.
/// @param connectionState Value assigned to `value.menu.fullscreen`.
function UI_ResetMenu(game,connectionState)
  value=create(game);value.assets=Reset_Cache();n1=drawtools.proportionalStringWidth("YES/NO");n2=drawtools.proportionalStringWidth("YES")+3;n3=drawtools.proportionalStringWidth("/")+3;l1=320-numeric.trunc32(n1/2);l2=l1+n2;l3=l2+n3;value.slashX=l2;value.menu.fullscreen=connectionState<CA_CONNECTED
  value.yes=qmenu.item(qmenu.MTYPE_PTEXT,"",ID_YES,l1,264,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS);value.yes.string="YES";value.yes.color=[1.0,0.0,0.0,1.0];value.yes.style=qmenu.UI_LEFT
  value.no=qmenu.item(qmenu.MTYPE_PTEXT,"",ID_NO,l3,264,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS);value.no.string="NO";value.no.color=[1.0,0.0,0.0,1.0];value.no.style=qmenu.UI_LEFT
  value.menu=qmenu.Menu_AddItem(value.menu,value.yes);value.menu=qmenu.Menu_AddItem(value.menu,value.no);qmenu.Menu_SetCursorToItem(value.menu,value.menu.items[1]);value.pushed=true;return value
end function
