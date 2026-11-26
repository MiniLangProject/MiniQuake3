// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_qmenu.c.  Rendering is expressed as
// deterministic commands so both the native host and tests can consume it.
package mq3.client.ui_qmenu

import std.string as strings
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as transcendental
import mq3.client.cgame_drawtools as drawtools
import mq3.client.keycodes as q3keys
import mq3.client.ui_local as q3local

/// Menu-widget kind selecting null behavior and widget-specific data.
const MTYPE_NULL=q3local.MTYPE_NULL
/// Menu-widget kind selecting slider behavior and widget-specific data.
const MTYPE_SLIDER=q3local.MTYPE_SLIDER
/// Menu-widget kind selecting action behavior and widget-specific data.
const MTYPE_ACTION=q3local.MTYPE_ACTION
/// Menu-widget kind selecting spincontrol behavior and widget-specific data.
const MTYPE_SPINCONTROL=q3local.MTYPE_SPINCONTROL
/// Menu-widget kind selecting field behavior and widget-specific data.
const MTYPE_FIELD=q3local.MTYPE_FIELD
/// Menu-widget kind selecting radiobutton behavior and widget-specific data.
const MTYPE_RADIOBUTTON=q3local.MTYPE_RADIOBUTTON
/// Menu-widget kind selecting bitmap behavior and widget-specific data.
const MTYPE_BITMAP=q3local.MTYPE_BITMAP
/// Menu-widget kind selecting text behavior and widget-specific data.
const MTYPE_TEXT=q3local.MTYPE_TEXT
/// Menu-widget kind selecting scrolllist behavior and widget-specific data.
const MTYPE_SCROLLLIST=q3local.MTYPE_SCROLLLIST
/// Menu-widget kind selecting ptext behavior and widget-specific data.
const MTYPE_PTEXT=q3local.MTYPE_PTEXT
/// Menu-widget kind selecting btext behavior and widget-specific data.
const MTYPE_BTEXT=q3local.MTYPE_BTEXT
/// Menu-item flag used to blink the item while it is drawn.
const QMF_BLINK=q3local.QMF_BLINK
/// Menu-item flag used to draw the item's text with the small font.
const QMF_SMALLFONT=q3local.QMF_SMALLFONT
/// Menu-item flag used to align the item to the left of its horizontal anchor.
const QMF_LEFT_JUSTIFY=q3local.QMF_LEFT_JUSTIFY
/// Menu-item flag used to center the item around its horizontal anchor.
const QMF_CENTER_JUSTIFY=q3local.QMF_CENTER_JUSTIFY
/// Menu-item flag used to align the item to the right of its horizontal anchor.
const QMF_RIGHT_JUSTIFY=q3local.QMF_RIGHT_JUSTIFY
/// Menu-item flag used to restrict editable text to numeric input.
const QMF_NUMBERSONLY=q3local.QMF_NUMBERSONLY
/// Menu-item flag used to draw the item in its highlighted style.
const QMF_HIGHLIGHT=q3local.QMF_HIGHLIGHT
/// Menu-item flag used to highlight the item only while it has focus.
const QMF_HIGHLIGHT_IF_FOCUS=q3local.QMF_HIGHLIGHT_IF_FOCUS
/// Menu-item flag used to pulse the item only while it has focus.
const QMF_PULSEIFFOCUS=q3local.QMF_PULSEIFFOCUS
/// Menu-item flag used to record that the pointer currently focuses this item.
const QMF_HASMOUSEFOCUS=q3local.QMF_HASMOUSEFOCUS
/// Menu-item flag used to suppress the ordinary on/off text for a radio button.
const QMF_NOONOFFTEXT=q3local.QMF_NOONOFFTEXT
/// Menu-item flag used to allow selection through the pointer but skip keyboard navigation.
const QMF_MOUSEONLY=q3local.QMF_MOUSEONLY
/// Menu-item flag used to omit the item from display and normal selection.
const QMF_HIDDEN=q3local.QMF_HIDDEN
/// Menu-item flag used to display the item as unavailable.
const QMF_GRAYED=q3local.QMF_GRAYED
/// Menu-item flag used to exclude the item from interactive activation.
const QMF_INACTIVE=q3local.QMF_INACTIVE
/// Menu-item flag used to preserve the item's caller-supplied initialization.
const QMF_NODEFAULTINIT=q3local.QMF_NODEFAULTINIT
/// Menu-item flag used to delegate rendering to the item's owner-draw callback.
const QMF_OWNERDRAW=q3local.QMF_OWNERDRAW
/// Menu-item flag used to animate the item's color or brightness with a pulse.
const QMF_PULSE=q3local.QMF_PULSE
/// Menu-item flag used to convert entered characters to lowercase.
const QMF_LOWERCASE=q3local.QMF_LOWERCASE
/// Menu-item flag used to convert entered characters to uppercase.
const QMF_UPPERCASE=q3local.QMF_UPPERCASE
/// Menu-item flag used to suppress ordinary menu feedback sounds for this item.
const QMF_SILENT=q3local.QMF_SILENT
/// Menu callback event reporting that the item was gotfocus.
const QM_GOTFOCUS=q3local.QM_GOTFOCUS
/// Menu callback event reporting that the item was lostfocus.
const QM_LOSTFOCUS=q3local.QM_LOSTFOCUS
/// Activation callback event accepted by the shared base-game menu-widget toolkit before it processes
/// the selected control action.
const QM_ACTIVATED=q3local.QM_ACTIVATED

/// Engine key code for the tab input, used by menu and client key-event handling.
const K_TAB=q3keys.K_TAB
/// Engine key code for the enter input, used by menu and client key-event handling.
const K_ENTER=q3keys.K_ENTER
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=q3keys.K_ESCAPE
/// Engine key code for the space input, used by menu and client key-event handling.
const K_SPACE=q3keys.K_SPACE
/// Engine key code for the backspace input, used by menu and client key-event handling.
const K_BACKSPACE=q3keys.K_BACKSPACE
/// Engine key code for the uparrow input, used by menu and client key-event handling.
const K_UPARROW=q3keys.K_UPARROW
/// Engine key code for the downarrow input, used by menu and client key-event handling.
const K_DOWNARROW=q3keys.K_DOWNARROW
/// Engine key code for the leftarrow input, used by menu and client key-event handling.
const K_LEFTARROW=q3keys.K_LEFTARROW
/// Engine key code for the rightarrow input, used by menu and client key-event handling.
const K_RIGHTARROW=q3keys.K_RIGHTARROW
/// Engine key code for the ins input, used by menu and client key-event handling.
const K_INS=q3keys.K_INS
/// Engine key code for the del input, used by menu and client key-event handling.
const K_DEL=q3keys.K_DEL
/// Engine key code for the pgdn input, used by menu and client key-event handling.
const K_PGDN=q3keys.K_PGDN
/// Engine key code for the pgup input, used by menu and client key-event handling.
const K_PGUP=q3keys.K_PGUP
/// Engine key code for the home input, used by menu and client key-event handling.
const K_HOME=q3keys.K_HOME
/// Engine key code for the end input, used by menu and client key-event handling.
const K_END=q3keys.K_END
/// Engine key code for the f11 input, used by menu and client key-event handling.
const K_F11=q3keys.K_F11
/// Engine key code for the f12 input, used by menu and client key-event handling.
const K_F12=q3keys.K_F12
/// Engine key code for the kp home input, used by menu and client key-event handling.
const K_KP_HOME=q3keys.K_KP_HOME
/// Engine key code for the kp uparrow input, used by menu and client key-event handling.
const K_KP_UPARROW=q3keys.K_KP_UPARROW
/// Engine key code for the kp pgup input, used by menu and client key-event handling.
const K_KP_PGUP=q3keys.K_KP_PGUP
/// Engine key code for the kp leftarrow input, used by menu and client key-event handling.
const K_KP_LEFTARROW=q3keys.K_KP_LEFTARROW
/// Engine key code for the kp rightarrow input, used by menu and client key-event handling.
const K_KP_RIGHTARROW=q3keys.K_KP_RIGHTARROW
/// Engine key code for the kp end input, used by menu and client key-event handling.
const K_KP_END=q3keys.K_KP_END
/// Engine key code for the kp downarrow input, used by menu and client key-event handling.
const K_KP_DOWNARROW=q3keys.K_KP_DOWNARROW
/// Engine key code for the kp pgdn input, used by menu and client key-event handling.
const K_KP_PGDN=q3keys.K_KP_PGDN
/// Engine key code for the kp enter input, used by menu and client key-event handling.
const K_KP_ENTER=q3keys.K_KP_ENTER
/// Engine key code for the kp ins input, used by menu and client key-event handling.
const K_KP_INS=q3keys.K_KP_INS
/// Engine key code for the kp del input, used by menu and client key-event handling.
const K_KP_DEL=q3keys.K_KP_DEL
/// Engine key code for the mouse1 input, used by menu and client key-event handling.
const K_MOUSE1=q3keys.K_MOUSE1
/// Engine key code for the mouse2 input, used by menu and client key-event handling.
const K_MOUSE2=q3keys.K_MOUSE2
/// Engine key code for the mouse3 input, used by menu and client key-event handling.
const K_MOUSE3=q3keys.K_MOUSE3
/// Engine key code for the joy1 input, used by menu and client key-event handling.
const K_JOY1=q3keys.K_JOY1
/// Engine key code for the joy2 input, used by menu and client key-event handling.
const K_JOY2=q3keys.K_JOY2
/// Engine key code for the joy3 input, used by menu and client key-event handling.
const K_JOY3=q3keys.K_JOY3
/// Engine key code for the joy4 input, used by menu and client key-event handling.
const K_JOY4=q3keys.K_JOY4
/// Engine key code for the aux1 input, used by menu and client key-event handling.
const K_AUX1=q3keys.K_AUX1
/// Engine key code for the aux16 input, used by menu and client key-event handling.
const K_AUX16=q3keys.K_AUX16
/// Engine key code for the char flag input, used by menu and client key-event handling.
const K_CHAR_FLAG=q3keys.K_CHAR_FLAG

/// UI text-style flag selecting left-aligned text.
const UI_LEFT=0
/// UI text-style flag selecting horizontally centered text.
const UI_CENTER=1
/// UI text-style flag selecting right-aligned text.
const UI_RIGHT=2
/// UI text-style flag selecting the small fixed-width font.
const UI_SMALLFONT=16
/// UI text-style flag selecting periodic visibility blinking.
const UI_BLINK=32
/// UI text-style flag selecting a pulsing text color or brightness.
const UI_PULSE=64
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16
/// Bigchar font metric controlling height in virtual UI coordinates.
const BIGCHAR_HEIGHT=16
/// Smallchar font metric controlling width in virtual UI coordinates.
const SMALLCHAR_WIDTH=8
/// Smallchar font metric controlling height in virtual UI coordinates.
const SMALLCHAR_HEIGHT=16
/// Prop font metric controlling height in virtual UI coordinates.
const PROP_HEIGHT=27
/// Prop font metric controlling gap width in virtual UI coordinates.
const PROP_GAP_WIDTH=3
/// Logical step range used to map a menu slider between its minimum and maximum.
const SLIDER_RANGE=10
/// Capacity limit for the menuitems collection or bounded storage used by this client module.
const MAX_MENUITEMS=64

/// Menu feedback-sound selector for the none interaction.
const SOUND_NONE=0
/// Menu feedback-sound selector for the in interaction.
const SOUND_IN=1
/// Menu feedback-sound selector for the move interaction.
const SOUND_MOVE=2
/// Menu feedback-sound selector for the out interaction.
const SOUND_OUT=3
/// Menu feedback-sound selector for the buzz interaction.
const SOUND_BUZZ=4
/// Menu feedback-sound selector for the null interaction.
const SOUND_NULL=-1

/// Builds the UI qmenu `colorText` sequence from `[1.0,1.0,1.0,1.0]`.
function colorText() return [1.0,1.0,1.0,1.0] end function
/// Builds the UI qmenu `colorDisabled` sequence from `[0.5,0.5,0.5,1.0]`.
function colorDisabled() return [0.5,0.5,0.5,1.0] end function
/// Builds the UI qmenu `colorNormal` sequence from `[1.0,0.43,0.0,1.0]`.
function colorNormal() return [1.0,0.43,0.0,1.0] end function
/// Builds the UI qmenu `colorHighlight` sequence from `[1.0,1.0,0.0,1.0]`.
function colorHighlight() return [1.0,1.0,0.0,1.0] end function
/// Builds the UI qmenu `colorListbar` sequence from `[1.0,0.43,0.0,0.30]`.
function colorListbar() return [1.0,0.43,0.0,0.30] end function

/// Stores UI qmenu menu, including `cursor`, `cursor_prev`, `items`, `wrapAround`, `fullscreen`, `showlogo` and additional values.
struct Menu
  /// When constructing this record, `menu` supplies `0` for this member.
  cursor
  /// When constructing this record, `menu` supplies `-1` for this member.
  cursor_prev
  /// Ordered child items participating in this menu's rendering and navigation.
  items
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the shared base-game
  /// menu-widget toolkit.
  wrapAround
  /// Whether the active menu covers the entire UI instead of appearing over the underlying game view.
  fullscreen
  /// When constructing this record, `menu` supplies `false` for this member.
  showlogo
  /// Records a request to remove the shared base-game menu-widget toolkit from the active menu stack.
  popped
  /// When constructing this record, `menu` supplies `false` for this member.
  debug
  /// When constructing this record, `menu` supplies an empty list for this member.
  commands
end struct
/// Stores UI qmenu menu item, including `type`, `name`, `id`, `x`, `y`, `left` and additional values.
struct Item
  /// UI item kind selecting its type-specific behavior and payload.
  type
  /// Item label or bitmap asset path selected by the menu widget's type.
  name
  /// Event-routing identifier of this selectable control in the shared base-game menu-widget toolkit.
  id
  /// Horizontal position of this menu control in the virtual layout used by the shared base-game
  /// menu-widget toolkit.
  x
  /// Vertical position of this menu control in the virtual layout used by the shared base-game
  /// menu-widget toolkit.
  y
  /// Left boundary of the interactive or clipped region.
  left
  /// Top boundary of the interactive or clipped region.
  top
  /// Right boundary of the interactive or clipped region.
  right
  /// Bottom boundary of the interactive or clipped region.
  bottom
  /// Index of this item within its owning menu's item list.
  menuPosition
  /// When constructing this record, `item` supplies `flags` for this member.
  flags
  /// When constructing this record, `item` supplies an absent (`void`) value for this member.
  callback
  /// When constructing this record, `item` supplies an absent (`void`) value for this member.
  statusbar
  /// When constructing this record, `item` supplies an absent (`void`) value for this member.
  ownerdraw
  /// When constructing this record, `item` supplies an empty string for this member.
  string
  /// UI drawing-style flags controlling alignment, font selection, and text emphasis.
  style
  /// Base RGBA item color used before disabled, focused, or pulsing menu styling.
  color
  /// When constructing this record, `item` supplies an empty string for this member.
  focuspic
  /// Fallback image asset used when the menu bitmap's requested image cannot be loaded.
  errorpic
  /// Normal bitmap material cache slot, reset to zero when the menu bitmap is initialized.
  shader
  /// When constructing this record, `item` supplies `0` for this member.
  focusshader
  /// Bitmap width in UI units, or character-cell column width for a scrolling-list item.
  width
  /// Bitmap height in UI units, or visible row count per column for a scrolling-list item.
  height
  /// When constructing this record, `item` supplies an absent (`void`) value for this member.
  focuscolor
  /// When constructing this record, `item` supplies `0.0` for this member.
  minvalue
  /// When constructing this record, `item` supplies `0.0` for this member.
  maxvalue
  /// When constructing this record, `item` supplies `0.0` for this member.
  curvalue
  /// When constructing this record, `item` supplies `0.0` for this member.
  range
  /// When constructing this record, `item` supplies `0` for this member.
  oldvalue
  /// Number of entries currently present in the menu or selection list.
  numitems
  /// When constructing this record, `item` supplies `0` for this member.
  listTop
  /// When constructing this record, `item` supplies an empty list for this member.
  itemnames
  /// Column descriptors used to lay out a listbox's displayed data.
  columns
  /// When constructing this record, `item` supplies `0` for this member.
  separation
  /// When constructing this record, `item` supplies `0` for this member.
  fieldCursor
  /// Character offset used to scroll the editable field's visible text.
  fieldScroll
  /// Number of character columns visible in the editable text or console field.
  widthInChars
  /// When constructing this record, `item` supplies an empty string for this member.
  buffer
  /// When constructing this record, `item` supplies `0` for this member.
  maxchars
  /// When constructing this record, `item` supplies an empty list for this member.
  events
end struct
/// Stores UI qmenu key result record, including `sound`, `key`.
struct KeyResult
  /// Menu SOUND_* feedback code selected by key handling for navigation, activation, or rejected input.
  sound
  /// When constructing this record, `MenuField_Key` supplies `key` for this member.
  key
end struct

/// Creates a `mq3.client.ui_qmenu.Menu` record. Assigns `wrapAround` from `wrapAround`, `fullscreen` from `fullscreen`.
/// @param wrapAround Value used to initialize `Menu.wrapAround`.
/// @param fullscreen Value used to initialize `Menu.fullscreen`.
function menu(wrapAround,fullscreen)
  return Menu(0,-1,[],wrapAround,fullscreen,false,false,false,[])
end function

/// Creates a `mq3.client.ui_qmenu.Item` record. Assigns `type` from `type`, `name` from `name`, `id` from `id`, `x` from `x`.
/// @param type Value used to initialize `Item.type`.
/// @param name Value used to initialize `Item.name`.
/// @param id Value used to initialize `Item.id`.
/// @param x Value used to initialize `Item.x`.
/// @param y Value used to initialize `Item.y`.
/// @param flags Value used to initialize `Item.flags`.
function item(type,name,id,x,y,flags)
  return Item(type,name,id,x,y,0,0,0,0,-1,flags,void,void,void,"",0,colorText(),"","",0,0,0,0,void,0.0,0.0,0.0,0.0,0,0,0,[],0,0,0,0,0,"",0,[])
end function

/// Builds the UI qmenu `emit` sequence from `[kind,x,y,w,h,text,style,color,asset]`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param w Width in the coordinate space used by `emit`.
/// @param h Height in the coordinate space used by `emit`.
/// @param text Text consumed or emitted by `emit` in the UI qmenu path.
/// @param style Value used by `return [kind,x,y,w,h,text,style,color,asset]`.
/// @param color Color value used by the UI qmenu drawing or interpolation operation.
/// @param asset Value used by `return [kind,x,y,w,h,text,style,color,asset]`.
function emit(kind,x,y,w,h,text,style,color,asset)
  return [kind,x,y,w,h,text,style,color,asset]
end function

/// Computes `value.menuPosition==m.cursor` for UI qmenu `focused`.
/// @param m Record read through `m.cursor`.
/// @param value Record read through `value.menuPosition`.
function focused(m,value) return value.menuPosition==m.cursor end function
/// Adapts `mq3.compat.numeric.trunc32` to UI qmenu `idiv`, returning its result for `a/b`.
/// @param a Argument 1 of `mq3.compat.numeric.trunc32`; passed as `a/b`.
/// @param b Argument 1 of `mq3.compat.numeric.trunc32`; passed as `a/b`.
function idiv(a,b) return numeric.trunc32(a/b) end function
/// Updates `value.events` during UI qmenu `notify`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.events`.
/// @param event Event identifier compared with the supported activation/input events.
function notify(value,event) value.events=value.events+[event];if value.callback!=void then value.callback(value,event) end if;return value end function

// Text_Init / Text_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.flags`.
function Text_Init(value) value.flags=value.flags|QMF_INACTIVE;return value end function
/// Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.emit` from UI qmenu `Text_Draw`. The final path returns `[emit("string",value.x,value.y,0,0,text,value.style,color,"")]`.
/// @param m Accepted for compatibility with `Text_Draw`; the current implementation does not read it.
/// @param value Record read through `value.name`, `value.string`, `value.color`, `value.flags` and additional values.
function Text_Draw(m,value)
  text=value.name+value.string;color=value.color;if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() end if
  return [emit("string",value.x,value.y,0,0,text,value.style,color,"")]
end function

// BText_Init / BText_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.flags`.
function BText_Init(value) value.flags=value.flags|QMF_INACTIVE;return value end function
/// Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.emit` from UI qmenu `BText_Draw`. The final path returns `[emit("banner",value.x,value.y,0,0,value.string,value.style,color,"")]`.
/// @param m Accepted for compatibility with `BText_Draw`; the current implementation does not read it.
/// @param value Record read through `value.color`, `value.flags`, `value.x`, `value.y` and additional values.
function BText_Draw(m,value)
  color=value.color;if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() end if
  return [emit("banner",value.x,value.y,0,0,value.string,value.style,color,"")]
end function

/// Evaluates UI qmenu `proportionalScale` and returns `0.75`, `1.0` according to its guard/selection conditions.
/// @param style Value used by `if (style&UI_SMALLFONT)!=0 then return 0.75 end if`.
function proportionalScale(style) if (style&UI_SMALLFONT)!=0 then return 0.75 end if;return 1.0 end function
/// Adapts `mq3.client.cgame_drawtools.proportionalStringWidth` to UI qmenu `proportionalWidth`, returning its result for `value`.
/// @param value Argument 1 of `mq3.client.cgame_drawtools.proportionalStringWidth`.
function proportionalWidth(value) return drawtools.proportionalStringWidth(value) end function

// PText_Init / PText_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`.
function PText_Init(value)
  scale=proportionalScale(value.style);x=value.x;w=numeric.trunc32(proportionalWidth(value.string)*scale);h=numeric.trunc32(PROP_HEIGHT*scale)
  if (value.flags&QMF_RIGHT_JUSTIFY)!=0 then x=x-w else if (value.flags&QMF_CENTER_JUSTIFY)!=0 then x=x-w/2 end if
  value.left=x-PROP_GAP_WIDTH*scale;value.right=x+w+PROP_GAP_WIDTH*scale;value.top=value.y;value.bottom=value.y+h;return value
end function
/// Calls `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.emit` from UI qmenu `PText_Draw`. The final path returns `[emit("proportional",value.x,value.y,0,0,value.string,style,color,"")]`.
/// @param m Value tested by `focused(m,value)` before the calculation continues.
/// @param value Record read through `value.color`, `value.style`, `value.flags`, `value.x` and additional values.
function PText_Draw(m,value)
  color=value.color;style=value.style;if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() end if
  if (value.flags&QMF_PULSEIFFOCUS)!=0 then if focused(m,value) then style=style|UI_PULSE else style=style|128 end if end if
  return [emit("proportional",value.x,value.y,0,0,value.string,style,color,"")]
end function

// Bitmap_Init / Bitmap_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom` and additional values.
function Bitmap_Init(value)
  x=value.x;w=value.width;h=value.height;if w<0 then w=-w end if;if h<0 then h=-h end if
  if (value.flags&QMF_RIGHT_JUSTIFY)!=0 then x=x-w else if (value.flags&QMF_CENTER_JUSTIFY)!=0 then x=x-w/2 end if
  value.left=x;value.right=x+w;value.top=value.y;value.bottom=value.y+h;value.shader=0;value.focusshader=0;return value
end function
/// Calls `mq3.client.ui_qmenu.emit`, `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused` and additional helpers from UI qmenu `Bitmap_Draw`. The final path returns `rows`.
/// @param m Value used by `focus=focused(m,value)`.
/// @param value Record read through `value.x`, `value.flags`, `value.width`, `value.name` and additional values.
/// @param realtime Current client real-time clock in milliseconds.
function Bitmap_Draw(m,value,realtime)
  x=value.x;if (value.flags&QMF_RIGHT_JUSTIFY)!=0 then x=x-value.width else if (value.flags&QMF_CENTER_JUSTIFY)!=0 then x=x-value.width/2 end if
  rows=[];if (value.flags&QMF_GRAYED)!=0 then if value.name!="" then rows=rows+[emit("bitmap",x,value.y,value.width,value.height,"",0,colorDisabled(),value.name)] end if;return rows end if
  if value.name!="" then rows=rows+[emit("bitmap",x,value.y,value.width,value.height,"",0,void,value.name)] end if
  focus=focused(m,value);overlay=(value.flags&(QMF_PULSE|QMF_PULSEIFFOCUS))!=0 and focus
  if overlay then color=[1.0,1.0,1.0,1.0];if value.focuscolor!=void then color=[value.focuscolor[0],value.focuscolor[1],value.focuscolor[2],value.focuscolor[3]] end if;color[3]=0.5+0.5*transcendental.sin(realtime/75.0);rows=rows+[emit("bitmap",x,value.y,value.width,value.height,"",UI_PULSE,color,value.focuspic)]
  else if (value.flags&QMF_HIGHLIGHT)!=0 or ((value.flags&QMF_HIGHLIGHT_IF_FOCUS)!=0 and focus) then rows=rows+[emit("bitmap",x,value.y,value.width,value.height,"",0,value.focuscolor,value.focuspic)] end if
  return rows
end function

// Action_Init / Action_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`.
function Action_Init(value) value.left=value.x;value.right=value.x+len(bytes(value.name))*BIGCHAR_WIDTH;value.top=value.y;value.bottom=value.y+BIGCHAR_HEIGHT;return value end function
/// Calls `mq3.client.ui_qmenu.colorText`, `mq3.client.ui_qmenu.colorDisabled`, `mq3.client.ui_qmenu.focused` and additional helpers from UI qmenu `Action_Draw`. The final path returns `rows`.
/// @param m Value tested by `(value.flags&QMF_PULSEIFFOCUS)!=0 and focused(m,value)`, `(value.flags&QMF_HIGHLIGHT_IF_FOCUS)!=0 and focused(m,value)` and additional values before the calculation continues.
/// @param value Record read through `value.flags`, `value.x`, `value.y`, `value.name`.
function Action_Draw(m,value)
  style=0;color=colorText();if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() else if (value.flags&QMF_PULSEIFFOCUS)!=0 and focused(m,value) then color=colorHighlight();style=UI_PULSE else if (value.flags&QMF_HIGHLIGHT_IF_FOCUS)!=0 and focused(m,value) then color=colorHighlight() else if (value.flags&QMF_BLINK)!=0 then color=colorHighlight();style=UI_BLINK end if
  rows=[emit("string",value.x,value.y,0,0,value.name,UI_LEFT|style,color,"")];if focused(m,value) then rows=rows+[emit("char",value.x-BIGCHAR_WIDTH,value.y,0,0,"13",UI_LEFT|UI_BLINK,color,"")] end if;return rows
end function

// RadioButton_Init / RadioButton_Key / RadioButton_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`.
function RadioButton_Init(value) l=len(bytes(value.name));value.left=value.x-(l+1)*SMALLCHAR_WIDTH;value.right=value.x+6*SMALLCHAR_WIDTH;value.top=value.y;value.bottom=value.y+SMALLCHAR_HEIGHT;return value end function
/// Updates `value.curvalue` during UI qmenu `RadioButton_Key`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.curvalue`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
function RadioButton_Key(value,key)
  activate=key==K_JOY1 or key==K_JOY2 or key==K_JOY3 or key==K_JOY4 or key==K_ENTER or key==K_KP_ENTER or key==K_KP_LEFTARROW or key==K_LEFTARROW or key==K_KP_RIGHTARROW or key==K_RIGHTARROW
  if key==K_MOUSE1 then activate=(value.flags&QMF_HASMOUSEFOCUS)!=0 end if
  if activate then value.curvalue=1-value.curvalue;notify(value,QM_ACTIVATED);return SOUND_MOVE end if;return SOUND_NONE
end function
/// Calls `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `RadioButton_Draw`. The final path returns `rows`.
/// @param m Value used by `focus=focused(m,value)`.
/// @param value Record read through `value.flags`, `value.left`, `value.top`, `value.right` and additional values.
function RadioButton_Draw(m,value)
  focus=focused(m,value);style=UI_LEFT|UI_SMALLFONT;color=colorNormal();if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() else if focus then color=colorHighlight();style=style|UI_PULSE end if
  rows=[];if focus then rows=rows+[emit("fill",value.left,value.top,value.right-value.left+1,value.bottom-value.top+1,"",0,colorListbar(),"")]+[emit("char",value.x,value.y,0,0,"13",UI_CENTER|UI_BLINK|UI_SMALLFONT,color,"")] end if
  if value.name!="" then rows=rows+[emit("string",value.x-SMALLCHAR_WIDTH,value.y,0,0,value.name,UI_RIGHT|UI_SMALLFONT,color,"")] end if
  state="off";asset="menu/art/switch_off";if value.curvalue!=0 then state="on";asset="menu/art/switch_on" end if
  rows=rows+[emit("bitmap",value.x+SMALLCHAR_WIDTH,value.y+2,16,16,"",0,void,asset)]
  rows=rows+[emit("string",value.x+SMALLCHAR_WIDTH+16,value.y,0,0,state,style,color,"")];return rows
end function

// Slider_Init / Slider_Key / Slider_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.right`, `value.top`, `value.bottom`.
function Slider_Init(value) l=len(bytes(value.name));value.left=value.x-(l+1)*SMALLCHAR_WIDTH;value.right=value.x+(SLIDER_RANGE+3)*SMALLCHAR_WIDTH;value.top=value.y;value.bottom=value.y+SMALLCHAR_HEIGHT;return value end function
/// Updates `value.curvalue` during UI qmenu `Slider_Key`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.curvalue`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
/// @param cursorx Value used by `if key==K_MOUSE1 then value.curvalue=((cursorx-value.x-2*SMALLCHAR_WIDTH)/(SLIDER_RANGE*SMALLCHAR_WIDTH))*(value.maxvalue-value.minvalue)+valu...`.
function Slider_Key(value,key,cursorx)
  sound=SOUND_NONE;old=value.curvalue
  if key==K_MOUSE1 then value.curvalue=((cursorx-value.x-2*SMALLCHAR_WIDTH)/(SLIDER_RANGE*SMALLCHAR_WIDTH))*(value.maxvalue-value.minvalue)+value.minvalue;if value.curvalue<value.minvalue then value.curvalue=value.minvalue end if;if value.curvalue>value.maxvalue then value.curvalue=value.maxvalue end if;if value.curvalue!=old then sound=SOUND_MOVE end if
  else if key==K_KP_LEFTARROW or key==K_LEFTARROW then if value.curvalue>value.minvalue then value.curvalue=value.curvalue-1;sound=SOUND_MOVE else sound=SOUND_BUZZ end if
  else if key==K_KP_RIGHTARROW or key==K_RIGHTARROW then if value.curvalue<value.maxvalue then value.curvalue=value.curvalue+1;sound=SOUND_MOVE else sound=SOUND_BUZZ end if end if
  if sound!=SOUND_NONE then notify(value,QM_ACTIVATED) end if;return sound
end function
/// Updates `value.range` during UI qmenu `Slider_Draw`.
/// @param m Value used by `focus=focused(m,value)`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.range`.
function Slider_Draw(m,value)
  focus=focused(m,value);style=UI_SMALLFONT;color=colorNormal();if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() else if focus then color=colorHighlight();style=style|UI_PULSE end if
  if value.maxvalue>value.minvalue then value.range=(value.curvalue-value.minvalue)/(value.maxvalue-value.minvalue);if value.range<0 then value.range=0 end if;if value.range>1 then value.range=1 end if else value.range=0 end if
  thumb="menu/art/sliderbutt_0";if (style&UI_PULSE)!=0 then thumb="menu/art/sliderbutt_1" end if
  return [emit("string",value.x-SMALLCHAR_WIDTH,value.y,0,0,value.name,UI_RIGHT|style,color,""),emit("bitmap",value.x+SMALLCHAR_WIDTH,value.y,96,16,"",0,color,"menu/art/slider2"),emit("bitmap",value.x+2*SMALLCHAR_WIDTH+(SLIDER_RANGE-1)*SMALLCHAR_WIDTH*value.range-2,value.y-2,12,20,"",0,void,thumb)]
end function

// SpinControl_Init / SpinControl_Key / SpinControl_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.left`, `value.numitems`, `value.top`, `value.right` and additional values.
function SpinControl_Init(value)
  label=len(bytes(value.name))*SMALLCHAR_WIDTH;value.left=value.x-SMALLCHAR_WIDTH-label;longest=0;for each text in value.itemnames if len(bytes(text))>longest then longest=len(bytes(text)) end if end for;value.numitems=len(value.itemnames);value.top=value.y;value.right=value.x+(longest+1)*SMALLCHAR_WIDTH;value.bottom=value.y+SMALLCHAR_HEIGHT;return value
end function
/// Updates `value.curvalue` during UI qmenu `SpinControl_Key`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.curvalue`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
function SpinControl_Key(value,key)
  sound=SOUND_NONE;if key==K_MOUSE1 then value.curvalue=value.curvalue+1;if value.curvalue>=value.numitems then value.curvalue=0 end if;sound=SOUND_MOVE else if key==K_KP_LEFTARROW or key==K_LEFTARROW then if value.curvalue>0 then value.curvalue=value.curvalue-1;sound=SOUND_MOVE else sound=SOUND_BUZZ end if else if key==K_KP_RIGHTARROW or key==K_RIGHTARROW then if value.curvalue<value.numitems-1 then value.curvalue=value.curvalue+1;sound=SOUND_MOVE else sound=SOUND_BUZZ end if end if;if sound!=SOUND_NONE then notify(value,QM_ACTIVATED) end if;return sound
end function
/// Calls `mq3.client.ui_qmenu.focused`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `SpinControl_Draw`.
/// @param m Value used by `focus=focused(m,value)`.
/// @param value Record read through `value.flags`, `value.left`, `value.top`, `value.right` and additional values.
function SpinControl_Draw(m,value)
  focus=focused(m,value);style=UI_SMALLFONT;color=colorNormal();if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() else if focus then color=colorHighlight();style=style|UI_PULSE else if (value.flags&QMF_BLINK)!=0 then color=colorHighlight();style=style|UI_BLINK end if
  rows=[];if focus then rows=rows+[emit("fill",value.left,value.top,value.right-value.left+1,value.bottom-value.top+1,"",0,colorListbar(),"")]+[emit("char",value.x,value.y,0,0,"13",UI_CENTER|UI_BLINK|UI_SMALLFONT,color,"")] end if;return rows+[emit("string",value.x-SMALLCHAR_WIDTH,value.y,0,0,value.name,style|UI_RIGHT,color,""),emit("string",value.x+SMALLCHAR_WIDTH,value.y,0,0,value.itemnames[value.curvalue],style|UI_LEFT,color,"")]
end function

// ScrollList_Init / ScrollList_Key / ScrollList_Draw
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.oldvalue`, `value.curvalue`, `value.listTop`, `value.columns` and additional values.
function ScrollList_Init(value)
  value.oldvalue=0;value.curvalue=0;value.listTop=0;if value.columns==0 then value.columns=1;value.separation=0 else if value.separation==0 then value.separation=3 end if;w=((value.width+value.separation)*value.columns-value.separation)*SMALLCHAR_WIDTH;value.left=value.x;value.top=value.y;value.right=value.x+w;value.bottom=value.y+value.height*SMALLCHAR_HEIGHT;if (value.flags&QMF_CENTER_JUSTIFY)!=0 then value.left=value.left-w/2;value.right=value.right-w/2 end if;value.numitems=len(value.itemnames);return value
end function
/// Updates `value.oldvalue`, `value.curvalue`, `value.listTop` during UI qmenu `ScrollList_Key`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.oldvalue`, `value.curvalue`, `value.listTop`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
/// @param cursorx Value used by `if cursorx>=x and cursorx<x+w and cursory>=value.y and cursory<value.y+value.height*SMALLCHAR_HEIGHT then column=idiv(idiv(cursorx-x,SMALLCHAR...`.
/// @param cursory Value used by `if cursorx>=x and cursorx<x+w and cursory>=value.y and cursory<value.y+value.height*SMALLCHAR_HEIGHT then column=idiv(idiv(cursorx-x,SMALLCHAR...`.
function ScrollList_Key(value,key,cursorx,cursory)
  if value.numitems==0 then return SOUND_BUZZ end if
  if key==K_MOUSE1 then if (value.flags&QMF_HASMOUSEFOCUS)==0 then return SOUND_NONE end if;x=value.x;w=((value.width+value.separation)*value.columns-value.separation)*SMALLCHAR_WIDTH;if (value.flags&QMF_CENTER_JUSTIFY)!=0 then x=x-w/2 end if;if cursorx>=x and cursorx<x+w and cursory>=value.y and cursory<value.y+value.height*SMALLCHAR_HEIGHT then column=idiv(idiv(cursorx-x,SMALLCHAR_WIDTH),value.width+value.separation);row=idiv(cursory-value.y,SMALLCHAR_HEIGHT);index=column*value.height+row;if value.listTop+index<value.numitems then value.oldvalue=value.curvalue;value.curvalue=value.listTop+index;if value.oldvalue!=value.curvalue then notify(value,QM_GOTFOCUS);return SOUND_MOVE end if end if end if;return SOUND_NULL end if
  if key==K_KP_HOME or key==K_HOME then value.oldvalue=value.curvalue;value.curvalue=0;value.listTop=0;if value.oldvalue!=value.curvalue then notify(value,QM_GOTFOCUS);return SOUND_MOVE end if;return SOUND_BUZZ end if
  if key==K_KP_END or key==K_END then value.oldvalue=value.curvalue;value.curvalue=value.numitems-1;if value.columns>1 then c=(idiv(value.curvalue,value.height)+1)*value.height;value.listTop=c-value.columns*value.height else value.listTop=value.curvalue-(value.height-1) end if;if value.listTop<0 then value.listTop=0 end if;if value.oldvalue!=value.curvalue then notify(value,QM_GOTFOCUS);return SOUND_MOVE end if;return SOUND_BUZZ end if
  if key==K_PGUP or key==K_KP_PGUP then if value.columns>1 then return SOUND_NULL end if;if value.curvalue<=0 then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=value.curvalue-(value.height-1);if value.curvalue<0 then value.curvalue=0 end if;value.listTop=value.curvalue;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key==K_PGDN or key==K_KP_PGDN then if value.columns>1 then return SOUND_NULL end if;if value.curvalue>=value.numitems-1 then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=value.curvalue+value.height-1;if value.curvalue>value.numitems-1 then value.curvalue=value.numitems-1 end if;value.listTop=value.curvalue-(value.height-1);if value.listTop<0 then value.listTop=0 end if;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key==K_KP_UPARROW or key==K_UPARROW then if value.curvalue==0 then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=value.curvalue-1;if value.curvalue<value.listTop then if value.columns==1 then value.listTop=value.listTop-1 else value.listTop=value.listTop-value.height end if end if;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key==K_KP_DOWNARROW or key==K_DOWNARROW then if value.curvalue==value.numitems-1 then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=value.curvalue+1;if value.curvalue>=value.listTop+value.columns*value.height then if value.columns==1 then value.listTop=value.listTop+1 else value.listTop=value.listTop+value.height end if end if;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key==K_KP_LEFTARROW or key==K_LEFTARROW then if value.columns==1 then return SOUND_NULL end if;if value.curvalue<value.height then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=value.curvalue-value.height;if value.curvalue<value.listTop then value.listTop=value.listTop-value.height end if;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key==K_KP_RIGHTARROW or key==K_RIGHTARROW then if value.columns==1 then return SOUND_NULL end if;c=value.curvalue+value.height;if c>=value.numitems then return SOUND_BUZZ end if;value.oldvalue=value.curvalue;value.curvalue=c;if value.curvalue>value.listTop+value.columns*value.height-1 then value.listTop=value.listTop+value.height end if;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if
  if key<32 or key>126 then return SOUND_NONE end if;if key>=65 and key<=90 then key=key+32 end if
  for offset=1 to value.numitems index=(value.curvalue+offset)%value.numitems;data=bytes(value.itemnames[index]);if len(data)>0 then first=data[0];if first>=65 and first<=90 then first=first+32 end if;if first==key then if index<value.listTop then value.listTop=index else if index>value.listTop+value.height-1 then value.listTop=index+1-value.height end if;if value.curvalue!=index then value.oldvalue=value.curvalue;value.curvalue=index;notify(value,QM_GOTFOCUS);return SOUND_MOVE end if;return SOUND_BUZZ end if end if end for;return SOUND_BUZZ
end function
/// Calls `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.emit`, `mq3.client.ui_qmenu.colorListbar` and additional helpers from UI qmenu `ScrollList_Draw`. The final path returns `rows`.
/// @param m Value tested by `focused(m,value)` before the calculation continues.
/// @param value Record read through `value.x`, `value.columns`, `value.y`, `value.listTop` and additional values.
function ScrollList_Draw(m,value)
  rows=[];x=value.x;for column=0 to value.columns-1 y=value.y;base=value.listTop+column*value.height;for index=base to base+value.height-1 if index>=value.numitems then break end if;color=colorNormal();style=UI_LEFT|UI_SMALLFONT;if index==value.curvalue then u=x-2;if (value.flags&QMF_CENTER_JUSTIFY)!=0 then u=u-value.width*SMALLCHAR_WIDTH/2-1 end if;rows=rows+[emit("fill",u,y,value.width*SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT+2,"",0,colorListbar(),"")];color=colorHighlight();if focused(m,value) then style=style|UI_PULSE end if end if;if (value.flags&QMF_CENTER_JUSTIFY)!=0 then style=style|UI_CENTER end if;rows=rows+[emit("string",x,y,0,0,value.itemnames[index],style,color,"")];y=y+SMALLCHAR_HEIGHT end for;x=x+(value.width+value.separation)*SMALLCHAR_WIDTH end for;return rows
end function

// q3_ui/ui_mfield.c boundary used by the QMenu dispatcher.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.widthInChars`, `value.maxchars`, `value.fieldCursor`, `value.fieldScroll` and additional values.
function MenuField_Init(value)
  if value.widthInChars<=0 then value.widthInChars=20 end if;if value.maxchars<=0 then value.maxchars=255 end if;value.fieldCursor=len(bytes(value.buffer));value.fieldScroll=0;value.left=value.x;value.right=value.x+value.widthInChars*SMALLCHAR_WIDTH;value.top=value.y;value.bottom=value.y+SMALLCHAR_HEIGHT;return value
end function
/// Evaluates UI qmenu `normalizedByte` and returns `value+32`, `value-32`, `value` according to its guard/selection conditions.
/// @param value Value tested by `(flags&QMF_LOWERCASE)!=0 and value>=65 and value<=90`, `(flags&QMF_UPPERCASE)!=0 and value>=97 and value<=122` before the calculation continues.
/// @param flags Value used by `if (flags&QMF_LOWERCASE)!=0 and value>=65 and value<=90 then return value+32 end if`.
function normalizedByte(value,flags) if (flags&QMF_LOWERCASE)!=0 and value>=65 and value<=90 then return value+32 end if;if (flags&QMF_UPPERCASE)!=0 and value>=97 and value<=122 then return value-32 end if;return value end function
/// Updates `value.buffer`, `value.fieldCursor`, `value.fieldScroll` during UI qmenu `MenuField_Key`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.buffer`, `value.fieldCursor`, `value.fieldScroll`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
function MenuField_Key(value,key)
  if (key&K_CHAR_FLAG)!=0 then c=key&255;if c==8 then key=K_BACKSPACE else if c<32 then return KeyResult(SOUND_NONE,key) else if (value.flags&QMF_NUMBERSONLY)!=0 and (c<48 or c>57) then return KeyResult(SOUND_NONE,key) else if len(bytes(value.buffer))>=value.maxchars then return KeyResult(SOUND_NONE,key) else c=normalizedByte(c,value.flags);before=strings.substr(value.buffer,0,value.fieldCursor);after=strings.substr(value.buffer,value.fieldCursor,len(bytes(value.buffer))-value.fieldCursor);value.buffer=before+decode(bytes([c]))+after;value.fieldCursor=value.fieldCursor+1;if value.fieldCursor-value.fieldScroll>value.widthInChars then value.fieldScroll=value.fieldScroll+1 end if;return KeyResult(SOUND_NULL,0) end if end if
  if key==K_DEL or key==K_KP_DEL then data=bytes(value.buffer);if value.fieldCursor<len(data) then value.buffer=strings.substr(value.buffer,0,value.fieldCursor)+strings.substr(value.buffer,value.fieldCursor+1,len(data)-value.fieldCursor-1) end if;return KeyResult(SOUND_NULL,0) end if
  if key==K_RIGHTARROW or key==K_KP_RIGHTARROW then if value.fieldCursor<len(bytes(value.buffer)) then value.fieldCursor=value.fieldCursor+1;if value.fieldCursor-value.fieldScroll>value.widthInChars then value.fieldScroll=value.fieldScroll+1 end if end if;return KeyResult(SOUND_NULL,0) end if
  if key==K_LEFTARROW or key==K_KP_LEFTARROW then if value.fieldCursor>0 then value.fieldCursor=value.fieldCursor-1;if value.fieldCursor<value.fieldScroll then value.fieldScroll=value.fieldCursor end if end if;return KeyResult(SOUND_NULL,0) end if
  if key==K_HOME or key==K_KP_HOME then value.fieldCursor=0;value.fieldScroll=0;return KeyResult(SOUND_NULL,0) end if
  if key==K_END or key==K_KP_END then value.fieldCursor=len(bytes(value.buffer));value.fieldScroll=value.fieldCursor-value.widthInChars;if value.fieldScroll<0 then value.fieldScroll=0 end if;return KeyResult(SOUND_NULL,0) end if
  if key==K_INS or key==K_KP_INS then return KeyResult(SOUND_NULL,0) end if;return KeyResult(SOUND_NONE,key)
end function
/// Calls `std.string.substr`, `mq3.client.ui_qmenu.colorNormal`, `mq3.client.ui_qmenu.colorDisabled` and additional helpers from UI qmenu `MenuField_Draw`. The final path returns `rows`.
/// @param m Value tested by `focused(m,value)` before the calculation continues.
/// @param value Record read through `value.buffer`, `value.fieldScroll`, `value.widthInChars`, `value.flags` and additional values.
function MenuField_Draw(m,value)
  data=bytes(value.buffer);finish=value.fieldScroll+value.widthInChars;if finish>len(data) then finish=len(data) end if;text=strings.substr(value.buffer,value.fieldScroll,finish-value.fieldScroll);color=colorNormal();if (value.flags&QMF_GRAYED)!=0 then color=colorDisabled() else if focused(m,value) then color=colorHighlight() end if;rows=[emit("string",value.x,value.y,0,0,text,UI_LEFT|UI_SMALLFONT,color,"")];if focused(m,value) then rows=rows+[emit("char",value.x+(value.fieldCursor-value.fieldScroll)*SMALLCHAR_WIDTH,value.y,0,0,"11",UI_BLINK|UI_SMALLFONT,color,"")] end if;return rows
end function

// Menu_AddItem / cursor and focus functions.
/// @param m Mutable UI qmenu record/storage; this routine assigns `m.items`.
/// @param value Mutable UI qmenu record/storage; this routine assigns `value.menuPosition`, `value.flags`.
function Menu_AddItem(m,value)
  if len(m.items)>=MAX_MENUITEMS then return error(7950,"Menu_AddItem: excessive items") end if;value.menuPosition=len(m.items);value.flags=value.flags&(~QMF_HASMOUSEFOCUS)
  if (value.flags&QMF_NODEFAULTINIT)==0 then if value.type==MTYPE_ACTION then value=Action_Init(value) else if value.type==MTYPE_FIELD then value=MenuField_Init(value) else if value.type==MTYPE_SPINCONTROL then value=SpinControl_Init(value) else if value.type==MTYPE_RADIOBUTTON then value=RadioButton_Init(value) else if value.type==MTYPE_SLIDER then value=Slider_Init(value) else if value.type==MTYPE_BITMAP then value=Bitmap_Init(value) else if value.type==MTYPE_TEXT then value=Text_Init(value) else if value.type==MTYPE_SCROLLLIST then value=ScrollList_Init(value) else if value.type==MTYPE_PTEXT then value=PText_Init(value) else if value.type==MTYPE_BTEXT then value=BText_Init(value) else return error(7951,"Menu_Init: unknown type") end if end if;m.items=m.items+[value];return m
end function
/// Calls `mq3.client.ui_qmenu.notify` from UI qmenu `Menu_CursorMoved`. The final path returns `m`.
/// @param m Record read through `m.cursor_prev`, `m.cursor`, `m.items`.
function Menu_CursorMoved(m)
  if m.cursor_prev==m.cursor then return m end if;if m.cursor_prev>=0 and m.cursor_prev<len(m.items) then notify(m.items[m.cursor_prev],QM_LOSTFOCUS) end if;if m.cursor>=0 and m.cursor<len(m.items) then notify(m.items[m.cursor],QM_GOTFOCUS) end if;return m
end function
/// Updates `m.cursor_prev`, `m.cursor` during UI qmenu `Menu_SetCursor`.
/// @param m Mutable UI qmenu record/storage; this routine assigns `m.cursor_prev`, `m.cursor`.
/// @param cursor Value assigned to `m.cursor`.
function Menu_SetCursor(m,cursor)
  if cursor<0 or cursor>=len(m.items) then return m end if;if (m.items[cursor].flags&(QMF_GRAYED|QMF_INACTIVE))!=0 then return m end if;m.cursor_prev=m.cursor;m.cursor=cursor;return Menu_CursorMoved(m)
end function
/// Calls `mq3.client.ui_qmenu.Menu_SetCursor` from UI qmenu `Menu_SetCursorToItem`. The final path returns `m`.
/// @param m Record read through `m.items`.
/// @param value Value tested by `m.items[index]==value` before the calculation continues.
function Menu_SetCursorToItem(m,value)
  for index=0 to len(m.items)-1 if m.items[index]==value then return Menu_SetCursor(m,index) end if end for;return m
end function
/// Updates `m.cursor` during UI qmenu `Menu_AdjustCursor`.
/// @param m Mutable UI qmenu record/storage; this routine assigns `m.cursor`.
/// @param direction Direction vector used by the spatial calculation.
function Menu_AdjustCursor(m,direction)
  origin=m.cursor_prev;attempts=0
  while attempts<=len(m.items) if m.cursor<0 or m.cursor>=len(m.items) then if not m.wrapAround then m.cursor=origin;return m end if;if m.cursor<0 then m.cursor=len(m.items)-1 else m.cursor=0 end if end if;if (m.items[m.cursor].flags&(QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE))==0 then return m end if;m.cursor=m.cursor+direction;attempts=attempts+1 end while;m.cursor=origin;return m
end function
/// Evaluates UI qmenu `Menu_ItemAtCursor` and returns `void`, `m.items[m.cursor]` according to its guard/selection conditions.
/// @param m Record read through `m.cursor`, `m.items`.
function Menu_ItemAtCursor(m) if m.cursor<0 or m.cursor>=len(m.items) then return void end if;return m.items[m.cursor] end function
/// Calls `mq3.client.ui_qmenu.notify` from UI qmenu `Menu_ActivateItem`. The final path returns `SOUND_NONE`.
/// @param m Accepted for compatibility with `Menu_ActivateItem`; the current implementation does not read it.
/// @param value Record read through `value.callback`, `value.flags`.
function Menu_ActivateItem(m,value) if value.callback!=void then notify(value,QM_ACTIVATED);if (value.flags&QMF_SILENT)==0 then return SOUND_MOVE end if end if;return SOUND_NONE end function

/// Calls `value.ownerdraw`, `mq3.client.ui_qmenu.RadioButton_Draw`, `mq3.client.ui_qmenu.MenuField_Draw` and additional helpers from UI qmenu `drawItem`.
/// @param m Value used by `if value.type==MTYPE_RADIOBUTTON then return RadioButton_Draw(m,value) end if`.
/// @param value Record read through `value.ownerdraw`, `value.type`.
/// @param realtime Current client real-time clock in milliseconds.
function drawItem(m,value,realtime)
  if value.ownerdraw!=void then return value.ownerdraw(value) end if;if value.type==MTYPE_RADIOBUTTON then return RadioButton_Draw(m,value) end if;if value.type==MTYPE_FIELD then return MenuField_Draw(m,value) end if;if value.type==MTYPE_SLIDER then return Slider_Draw(m,value) end if;if value.type==MTYPE_SPINCONTROL then return SpinControl_Draw(m,value) end if;if value.type==MTYPE_ACTION then return Action_Draw(m,value) end if;if value.type==MTYPE_BITMAP then return Bitmap_Draw(m,value,realtime) end if;if value.type==MTYPE_TEXT then return Text_Draw(m,value) end if;if value.type==MTYPE_SCROLLLIST then return ScrollList_Draw(m,value) end if;if value.type==MTYPE_PTEXT then return PText_Draw(m,value) end if;if value.type==MTYPE_BTEXT then return BText_Draw(m,value) end if;return error(7952,"Menu_Draw: unknown type")
end function
// Menu_Draw
/// @param m Record read through `m.items`.
/// @param realtime Current client real-time clock in milliseconds.
function Menu_Draw(m,realtime)
  rows=[];for each value in m.items if (value.flags&QMF_HIDDEN)==0 then drawn=drawItem(m,value,realtime);if drawn is error then return drawn end if;rows=rows+drawn end if end for;current=Menu_ItemAtCursor(m);if current!=void and current.statusbar!=void then extra=current.statusbar(current);if extra!=void then rows=rows+extra end if end if;return rows
end function

/// Computes `(key>=K_JOY1 and key<=K_JOY4) or (key>=K_AUX1 and key<=K_AUX16)` for UI qmenu `joystickActivate`.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
function joystickActivate(key) return (key>=K_JOY1 and key<=K_JOY4) or (key>=K_AUX1 and key<=K_AUX16) end function
// Menu_DefaultKey
/// @param m Mutable UI qmenu record/storage; this routine assigns `m.popped`, `m.debug`, `m.commands`, `m.cursor_prev` and additional values.
/// @param key Key or control identifier used to select the corresponding UI qmenu entry.
/// @param cursorx Value used by `if current.type==MTYPE_SPINCONTROL then sound=SpinControl_Key(current,key) else if current.type==MTYPE_RADIOBUTTON then sound=RadioButton_Key(...`.
/// @param cursory Value used by `if current.type==MTYPE_SPINCONTROL then sound=SpinControl_Key(current,key) else if current.type==MTYPE_RADIOBUTTON then sound=RadioButton_Key(...`.
function Menu_DefaultKey(m,key,cursorx,cursory)
  if key==K_MOUSE2 or key==K_ESCAPE then m.popped=true;return SOUND_OUT end if;if len(m.items)==0 then return SOUND_NONE end if;current=Menu_ItemAtCursor(m)
  if current!=void and (current.flags&(QMF_GRAYED|QMF_INACTIVE))==0 then sound=SOUND_NONE;if current.type==MTYPE_SPINCONTROL then sound=SpinControl_Key(current,key) else if current.type==MTYPE_RADIOBUTTON then sound=RadioButton_Key(current,key) else if current.type==MTYPE_SLIDER then sound=Slider_Key(current,key,cursorx) else if current.type==MTYPE_SCROLLLIST then sound=ScrollList_Key(current,key,cursorx,cursory) else if current.type==MTYPE_FIELD then result=MenuField_Key(current,key);sound=result.sound;key=result.key end if;if sound!=SOUND_NONE then return sound end if end if
  if key==K_F11 then m.debug=not m.debug else if key==K_F12 then m.commands=m.commands+["screenshot\n"] else if key==K_UPARROW or key==K_KP_UPARROW then old=m.cursor;m.cursor_prev=m.cursor;m.cursor=m.cursor-1;Menu_AdjustCursor(m,-1);if old!=m.cursor then Menu_CursorMoved(m);return SOUND_MOVE end if else if key==K_TAB or key==K_DOWNARROW or key==K_KP_DOWNARROW then old=m.cursor;m.cursor_prev=m.cursor;m.cursor=m.cursor+1;Menu_AdjustCursor(m,1);if old!=m.cursor then Menu_CursorMoved(m);return SOUND_MOVE end if else if key==K_MOUSE1 or key==K_MOUSE3 then if current!=void and (current.flags&QMF_HASMOUSEFOCUS)!=0 and (current.flags&(QMF_GRAYED|QMF_INACTIVE))==0 then return Menu_ActivateItem(m,current) end if else if key==K_ENTER or key==K_KP_ENTER or joystickActivate(key) then if current!=void and (current.flags&(QMF_MOUSEONLY|QMF_GRAYED|QMF_INACTIVE))==0 then return Menu_ActivateItem(m,current) end if end if;return SOUND_NONE
end function

// Menu_Cache
/// @param ragePro Value used by `if ragePro then back="menubackRagePro" end if`.
function Menu_Cache(ragePro)
  back="menuback";if ragePro then back="menubackRagePro" end if
  return ["gfx/2d/bigchars","menu/art/font1_prop.tga","menu/art/font1_prop_glo.tga","menu/art/font2_prop.tga","menu/art/3_cursor2","menu/art/switch_on","menu/art/switch_off","white",back,"menubacknologo","sound/misc/menu1.wav","sound/misc/menu2.wav","sound/misc/menu3.wav","sound/misc/menu4.wav","sound/weapons/change.wav","menu/art/slider2","menu/art/sliderbutt_0","menu/art/sliderbutt_1"]
end function
