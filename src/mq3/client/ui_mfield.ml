// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_mfield.c.
package mq3.client.ui_mfield

import mq3.client.ui_qmenu as qmenu
import std.string as strings

const MAX_EDIT_LINE=256
const K_SHIFT=138
const K_CTRL=137

/// Stores UI mfield host action record, including `boundary`, `kind`, `text`, `x`, `y`, `style` and additional values.
struct HostAction boundary kind text x y style cursorChar dispatched end struct
/// Stores UI mfield field record, including `buffer`, `cursor`, `scroll`, `widthInChars`, `maxchars`, `overstrike` and additional values.
struct Field buffer cursor scroll widthInChars maxchars overstrike clipboard actions end struct
/// Stores UI mfield draw result record, including `text`, `x`, `y`, `style`, `cursorX`, `cursorChar` and additional values.
struct DrawResult text x y style cursorX cursorChar charWidth actions end struct
/// Stores UI mfield menu field record, including `field`, `name`, `flags`, `x`, `y`, `left` and additional values.
struct MenuField field name flags x y left top right bottom menuPosition parentCursor end struct
/// Stores UI mfield menu key result record, including `sound`, `key`.
struct MenuKeyResult sound key end struct

/// Creates a `mq3.client.ui_mfield.Field` record. Assigns `widthInChars` from `widthInChars`, `maxchars` from `maxchars`.
/// @param widthInChars Value used to initialize `Field.widthInChars`.
/// @param maxchars Value used to initialize `Field.maxchars`.
function field(widthInChars,maxchars) return Field("",0,0,widthInChars,maxchars,false,"",[]) end function
/// Creates a `mq3.client.ui_mfield.HostAction` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `text` from `text`, `x` from `x`.
/// @param boundary Value used to initialize `HostAction.boundary`.
/// @param kind Value used to initialize `HostAction.kind`.
/// @param text Value used to initialize `HostAction.text`.
/// @param x Value used to initialize `HostAction.x`.
/// @param y Value used to initialize `HostAction.y`.
/// @param style Value used to initialize `HostAction.style`.
/// @param cursorChar Value used to initialize `HostAction.cursorChar`.
/// @param retailActive Value used to initialize `HostAction.dispatched`.
function action(boundary,kind,text,x,y,style,cursorChar,retailActive) return HostAction(boundary,kind,text,x,y,style,cursorChar,not retailActive) end function
/// Clamps `value` to the inclusive bounds `low` and `high` for UI mfield.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
/// Calls `decode` from UI mfield `byteText`. The final path returns `decode(bytes(data))`.
/// @param value Value used by `c=value&255`.
function byteText(value) c=value&255;data=[c];return decode(bytes(data)) end function
/// Computes `bytes(text)[index]` for UI mfield `byteAt`.
/// @param text Text consumed or emitted by `byteAt` in the UI mfield path.
/// @param index Value used by `return bytes(text)[index]`.
function byteAt(text,index) return bytes(text)[index] end function
/// Calls `decode`, `slice` from UI mfield `eraseAt`. The final path returns `result`.
/// @param text Text consumed or emitted by `eraseAt` in the UI mfield path.
/// @param index Value tested by `index<0 or index>=len(data)`, `index>0` and additional values before the calculation continues.
function eraseAt(text,index)
  data=bytes(text);if index<0 or index>=len(data) then return text end if;result="";if index>0 then result=result+decode(slice(data,0,index)) end if;if index+1<len(data) then result=result+decode(slice(data,index+1,len(data)-index-1)) end if;return result
end function
/// Calls `mq3.client.ui_mfield.clamp`, `decode`, `slice` and additional helpers from UI mfield `insertAt`. The final path returns `result`.
/// @param text Text consumed or emitted by `insertAt` in the UI mfield path.
/// @param index Value tested by `index>0`, `index<len(data)` before the calculation continues.
/// @param value Value used by `result=result+byteText(value)`.
function insertAt(text,index,value)
  data=bytes(text);index=clamp(index,0,len(data));result="";if index>0 then result=result+decode(slice(data,0,index)) end if;result=result+byteText(value);if index<len(data) then result=result+decode(slice(data,index,len(data)-index)) end if;return result
end function
/// Calls `mq3.client.ui_mfield.byteText`, `decode`, `slice` from UI mfield `overwriteAt`. The final path returns `result`.
/// @param text Text consumed or emitted by `overwriteAt` in the UI mfield path.
/// @param index Value tested by `index>=len(data)`, `index>0` and additional values before the calculation continues.
/// @param value Value used by `if index>=len(data) then return text+byteText(value) end if`.
function overwriteAt(text,index,value)
  data=bytes(text);if index>=len(data) then return text+byteText(value) end if;result="";if index>0 then result=result+decode(slice(data,0,index)) end if;result=result+byteText(value);if index+1<len(data) then result=result+decode(slice(data,index+1,len(data)-index-1)) end if;return result
end function

// MField_Draw
/// @param edit Mutable UI mfield record/storage; this routine assigns `edit.scroll`, `edit.actions`.
/// @param x Horizontal coordinate in the coordinate space used by `MField_Draw`.
/// @param y Vertical coordinate in the coordinate space used by `MField_Draw`.
/// @param style Value used by `actions=[action("renderer","draw-string",visible,x,y,style,0,retailActive)]`.
/// @param color Accepted for compatibility with `MField_Draw`; the current implementation does not read it.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function MField_Draw(edit,x,y,style,color,retailActive)
  drawLen=edit.widthInChars;textLen=len(bytes(edit.buffer))+1;prestep=0
  if textLen>drawLen then
    if edit.scroll+drawLen>textLen then edit.scroll=textLen-drawLen;if edit.scroll<0 then edit.scroll=0 end if end if
    prestep=edit.scroll
  end if
  if prestep+drawLen>textLen then drawLen=textLen-prestep end if
  if drawLen>=1024 then return error(7801,"drawLen >= MAX_STRING_CHARS") end if
  visible="";available=len(bytes(edit.buffer))-prestep;if available>0 and drawLen>0 then take=drawLen;if take>available then take=available end if;visible=decode(slice(bytes(edit.buffer),prestep,take)) end if
  actions=[action("renderer","draw-string",visible,x,y,style,0,retailActive)]
  cursorX=-1;cursorChar=0;charWidth=0
  if (style&qmenu.UI_PULSE)!=0 then
    if edit.overstrike then cursorChar=11 else cursorChar=10 end if
    cursorStyle=(style&(~qmenu.UI_PULSE))|qmenu.UI_BLINK
    if (cursorStyle&qmenu.UI_SMALLFONT)!=0 then charWidth=qmenu.SMALLCHAR_WIDTH else if (cursorStyle&128)!=0 then charWidth=32 else charWidth=qmenu.BIGCHAR_WIDTH end if
    drawX=x;if (cursorStyle&qmenu.UI_CENTER)!=0 then drawX=x-len(bytes(visible))*charWidth/2 else if (cursorStyle&qmenu.UI_RIGHT)!=0 then drawX=x-len(bytes(visible))*charWidth end if
    cursorX=drawX+(edit.cursor-prestep)*charWidth;actions=actions+[action("renderer","draw-char","",cursorX,y,cursorStyle&(~(qmenu.UI_CENTER|qmenu.UI_RIGHT)),cursorChar,retailActive)]
  end if
  edit.actions=edit.actions+actions;return DrawResult(visible,x,y,style,cursorX,cursorChar,charWidth,actions)
end function

// MField_Paste
/// @param edit Mutable UI mfield record/storage; this routine assigns `edit.clipboard`, `edit.actions`.
/// @param clipboard Value assigned to `edit.clipboard`.
function MField_Paste(edit,clipboard)
  edit.clipboard=clipboard;edit.actions=edit.actions+[action("system","clipboard-read",clipboard,0,0,0,0,true)];data=bytes(clipboard);pasteLen=len(data);if pasteLen>63 then pasteLen=63 end if;if pasteLen>0 then for i=0 to pasteLen-1 MField_CharEvent(edit,data[i]) end for end if;return edit
end function

// MField_KeyDownEvent
/// @param edit Mutable UI mfield record/storage; this routine assigns `edit.clipboard`, `edit.buffer`, `edit.cursor`, `edit.scroll` and additional values.
/// @param key Key or control identifier used to select the corresponding UI mfield entry.
/// @param shiftDown Value used by `if (key==qmenu.K_INS or key==qmenu.K_KP_INS) and shiftDown then MField_Paste(edit,clipboard)`.
/// @param ctrlDown Value used by `if key==qmenu.K_HOME or key==qmenu.K_KP_HOME or (lower==97 and ctrlDown) then edit.cursor=0`.
/// @param clipboard Value assigned to `edit.clipboard`.
function MField_KeyDownEvent(edit,key,shiftDown,ctrlDown,clipboard)
  edit.clipboard=clipboard
  if (key==qmenu.K_INS or key==qmenu.K_KP_INS) and shiftDown then MField_Paste(edit,clipboard);return edit end if
  textLen=len(bytes(edit.buffer))
  if key==qmenu.K_DEL or key==qmenu.K_KP_DEL then if edit.cursor<textLen then edit.buffer=eraseAt(edit.buffer,edit.cursor) end if;return edit end if
  if key==qmenu.K_RIGHTARROW or key==qmenu.K_KP_RIGHTARROW then if edit.cursor<textLen then edit.cursor=edit.cursor+1 end if;if edit.cursor>=edit.scroll+edit.widthInChars and edit.cursor<=textLen then edit.scroll=edit.scroll+1 end if;return edit end if
  if key==qmenu.K_LEFTARROW or key==qmenu.K_KP_LEFTARROW then if edit.cursor>0 then edit.cursor=edit.cursor-1 end if;if edit.cursor<edit.scroll then edit.scroll=edit.scroll-1 end if;return edit end if
  lower=key;if lower>=65 and lower<=90 then lower=lower+32 end if
  if key==qmenu.K_HOME or key==qmenu.K_KP_HOME or (lower==97 and ctrlDown) then edit.cursor=0;edit.scroll=0;return edit end if
  if key==qmenu.K_END or key==qmenu.K_KP_END or (lower==101 and ctrlDown) then edit.cursor=textLen;edit.scroll=textLen-edit.widthInChars+1;if edit.scroll<0 then edit.scroll=0 end if;return edit end if
  if key==qmenu.K_INS or key==qmenu.K_KP_INS then edit.overstrike=not edit.overstrike;edit.actions=edit.actions+[action("keyboard","set-overstrike","",0,0,0,0,true)];return edit end if
  return edit
end function

// MField_CharEvent
/// @param edit Mutable UI mfield record/storage; this routine assigns `edit.buffer`, `edit.cursor`, `edit.scroll`.
/// @param ch Value used by `if ch==22 then return MField_Paste(edit,edit.clipboard) end if`.
function MField_CharEvent(edit,ch)
  if ch==22 then return MField_Paste(edit,edit.clipboard) end if
  if ch==3 then return MField_Clear(edit) end if
  textLen=len(bytes(edit.buffer))
  if ch==8 then if edit.cursor>0 then edit.buffer=eraseAt(edit.buffer,edit.cursor-1);edit.cursor=edit.cursor-1;if edit.cursor<edit.scroll then edit.scroll=edit.scroll-1 end if end if;return edit end if
  if ch==1 then edit.cursor=0;edit.scroll=0;return edit end if
  if ch==5 then edit.cursor=textLen;edit.scroll=edit.cursor-edit.widthInChars+1;if edit.scroll<0 then edit.scroll=0 end if;return edit end if
  if ch<32 then return edit end if
  if not edit.overstrike then
    if edit.cursor==MAX_EDIT_LINE-1 or (edit.maxchars!=0 and edit.cursor>=edit.maxchars) then return edit end if
    edit.buffer=overwriteAt(edit.buffer,edit.cursor,ch)
  else
    if textLen==MAX_EDIT_LINE-1 or (edit.maxchars!=0 and textLen>=edit.maxchars) then return edit end if
    edit.buffer=insertAt(edit.buffer,edit.cursor,ch)
  end if
  if edit.maxchars==0 or edit.cursor<edit.maxchars-1 then edit.cursor=edit.cursor+1 end if
  if edit.cursor>=edit.widthInChars then edit.scroll=edit.scroll+1 end if
  return edit
end function

// MField_Clear
/// @param edit Mutable UI mfield record/storage; this routine assigns `edit.buffer`, `edit.cursor`, `edit.scroll`.
function MField_Clear(edit) edit.buffer="";edit.cursor=0;edit.scroll=0;return edit end function

// MenuField_Init
/// @param value Mutable UI mfield record/storage; this routine assigns `value.left`, `value.top`, `value.right`, `value.bottom`.
function MenuField_Init(value)
  MField_Clear(value.field);w=0;h=0;if (value.flags&qmenu.QMF_SMALLFONT)!=0 then w=qmenu.SMALLCHAR_WIDTH;h=qmenu.SMALLCHAR_HEIGHT else w=qmenu.BIGCHAR_WIDTH;h=qmenu.BIGCHAR_HEIGHT end if;l=0;if value.name!="" then l=(len(bytes(value.name))+1)*w end if;value.left=value.x-l;value.top=value.y;value.right=value.x+w+value.field.widthInChars*w;value.bottom=value.y+h;return value
end function

// MenuField_Draw
/// @param value Record read through `value.flags`, `value.parentCursor`, `value.menuPosition`, `value.left` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function MenuField_Draw(value,retailActive)
  w=0;style=0;if (value.flags&qmenu.QMF_SMALLFONT)!=0 then w=qmenu.SMALLCHAR_WIDTH;style=qmenu.UI_SMALLFONT else w=qmenu.BIGCHAR_WIDTH;style=0 end if;focus=value.parentCursor==value.menuPosition;if focus then style=style|qmenu.UI_PULSE end if;actions=[]
  if focus then actions=actions+[action("renderer","fill-focus","",value.left,value.top,style,0,retailActive),action("renderer","draw-char","",value.x,value.y,qmenu.UI_CENTER|qmenu.UI_BLINK|style,13,retailActive)] end if
  if value.name!="" then actions=actions+[action("renderer","draw-string",value.name,value.x-w,value.y,style|qmenu.UI_RIGHT,0,retailActive)] end if
  drawn=MField_Draw(value.field,value.x+w,value.y,style,void,retailActive);actions=actions+drawn.actions;return actions
end function

// MenuField_Key
/// @param value Record read through `value.flags`, `value.field`.
/// @param key Key or control identifier used to select the corresponding UI mfield entry.
/// @param shiftDown Value used by `MField_KeyDownEvent(value.field,key,shiftDown,ctrlDown,clipboard)`.
/// @param ctrlDown Value used by `MField_KeyDownEvent(value.field,key,shiftDown,ctrlDown,clipboard)`.
/// @param clipboard Value used by `if key==22 then MField_Paste(value.field,clipboard) else MField_CharEvent(value.field,key) end if`.
function MenuField_Key(value,key,shiftDown,ctrlDown,clipboard)
  original=key
  if key==qmenu.K_KP_ENTER or key==qmenu.K_ENTER or key==qmenu.K_JOY1 or key==qmenu.K_JOY2 or key==qmenu.K_JOY3 or key==qmenu.K_JOY4 then return MenuKeyResult(qmenu.SOUND_NONE,qmenu.K_TAB) end if
  if key==qmenu.K_TAB or key==qmenu.K_KP_DOWNARROW or key==qmenu.K_DOWNARROW or key==qmenu.K_KP_UPARROW or key==qmenu.K_UPARROW then return MenuKeyResult(qmenu.SOUND_NONE,key) end if
  if (key&qmenu.K_CHAR_FLAG)!=0 then
    key=key&(~qmenu.K_CHAR_FLAG)
    if (value.flags&qmenu.QMF_UPPERCASE)!=0 and key>=97 and key<=122 then key=key-32 else if (value.flags&qmenu.QMF_LOWERCASE)!=0 and key>=65 and key<=90 then key=key+32 else if (value.flags&qmenu.QMF_NUMBERSONLY)!=0 and ((key>=65 and key<=90) or (key>=97 and key<=122)) then return MenuKeyResult(qmenu.SOUND_BUZZ,original) end if
    if key==22 then MField_Paste(value.field,clipboard) else MField_CharEvent(value.field,key) end if
  else
    MField_KeyDownEvent(value.field,key,shiftDown,ctrlDown,clipboard)
  end if
  return MenuKeyResult(qmenu.SOUND_NONE,original)
end function
