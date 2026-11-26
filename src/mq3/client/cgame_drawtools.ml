// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_drawtools.c. Renderer calls are kept
// as typed boundary actions and are suppressed while the retail cgame QVM is
// the authoritative scene producer.
package mq3.client.cgame_drawtools

import mq3.compat.numeric as n
import mq3.compat.transcendental as crt

/// Native team identifier for red, used by player and team presentation.
const TEAM_RED=1
/// Native team identifier for blue, used by player and team presentation.
const TEAM_BLUE=2
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16
/// Bigchar font metric controlling height in virtual UI coordinates.
const BIGCHAR_HEIGHT=16
/// Smallchar font metric controlling width in virtual UI coordinates.
const SMALLCHAR_WIDTH=8
/// Smallchar font metric controlling height in virtual UI coordinates.
const SMALLCHAR_HEIGHT=16
/// Duration in milliseconds of the standard CGame presentation fade.
const FADE_TIME=200
/// Fraction of incoming damage absorbed by armor before reducing health.
const ARMOR_PROTECTION=0.66
/// Prop font metric controlling gap width in virtual UI coordinates.
const PROP_GAP_WIDTH=3
/// Prop font metric controlling space width in virtual UI coordinates.
const PROP_SPACE_WIDTH=8
/// Prop font metric controlling height in virtual UI coordinates.
const PROP_HEIGHT=27
/// Propb font metric controlling gap width in virtual UI coordinates.
const PROPB_GAP_WIDTH=4
/// Propb font metric controlling space width in virtual UI coordinates.
const PROPB_SPACE_WIDTH=12
/// Propb font metric controlling height in virtual UI coordinates.
const PROPB_HEIGHT=36
/// Time-scaling divisor used to compute the proportional-text pulse animation.
const PULSE_DIVISOR=75.0
/// UI text-style flag selecting left-aligned text.
const UI_LEFT=0
/// UI text-style flag selecting horizontally centered text.
const UI_CENTER=1
/// UI text-style flag selecting right-aligned text.
const UI_RIGHT=2
/// UI text-style flag selecting the horizontal-alignment bits.
const UI_FORMATMASK=7
/// UI text-style flag selecting the small fixed-width font.
const UI_SMALLFONT=0x10
/// UI text-style flag selecting a shadow behind the text.
const UI_DROPSHADOW=0x800
/// UI text-style flag selecting the subdued inverse text style.
const UI_INVERSE=0x2000
/// UI text-style flag selecting a pulsing text color or brightness.
const UI_PULSE=0x4000

/// Stores client game drawtools draw action record, including `kind`, `x`, `y`, `width`, `height`, `s1` and additional values.
struct DrawAction
  /// Operation selector telling the host how to interpret a request emitted while drawing scaled text,
  /// pictures, and rectangles for CGame.
  kind
  /// Horizontal coordinate of a CGame text, image, or rectangle request in its drawing coordinate
  /// space.
  x
  /// Vertical coordinate of a CGame text, image, or rectangle request in its drawing coordinate space.
  y
  /// Destination rectangle width carried by the low-level HUD drawing action.
  width
  /// Destination rectangle height carried by the low-level HUD drawing action.
  height
  /// When constructing this record, `action` supplies `s1` for this member.
  s1
  /// When constructing this record, `action` supplies `t1` for this member.
  t1
  /// When constructing this record, `action` supplies `s2` for this member.
  s2
  /// When constructing this record, `action` supplies `t2` for this member.
  t2
  /// Texture material passed to the HUD stretch-picture request; empty for a color-only action.
  shader
  /// Optional RGBA modulation copied into the low-level HUD drawing action.
  color
  /// True when this request is marked for native dispatch while drawing scaled text, pictures, and
  /// rectangles for CGame; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game drawtools state, including `screenXScale`, `screenYScale`, `screenXBias`, `vidWidth`, `vidHeight`, `refX` and additional values.
struct State
  /// Horizontal virtual-screen scaling factor derived from the renderer configuration.
  screenXScale
  /// Vertical virtual-screen scaling factor derived from the renderer configuration.
  screenYScale
  /// Horizontal centering offset used when the actual display is wider than the virtual UI.
  screenXBias
  /// When constructing this record, `create` supplies `640` for this member. Used by `tileClear` during
  /// subsequent processing.
  vidWidth
  /// When constructing this record, `create` supplies `480` for this member. Used by `tileClear` during
  /// subsequent processing.
  vidHeight
  /// When constructing this record, `create` supplies `0` for this member. Used by `tileClear` during
  /// subsequent processing.
  refX
  /// When constructing this record, `create` supplies `0` for this member. Used by `tileClear` during
  /// subsequent processing.
  refY
  /// When constructing this record, `create` supplies `640` for this member. Used by `tileClear` during
  /// subsequent processing.
  refWidth
  /// When constructing this record, `create` supplies `480` for this member. Used by `tileClear` during
  /// subsequent processing.
  refHeight
  /// Client-game time in milliseconds used by drawing helpers for text blinking and color fading.
  time
  /// Local-player health combined with armor when choosing the HUD health color.
  health
  /// Armor contribution used with health to calculate the HUD health color.
  armor
  /// Shader resource selected for white rendering.
  whiteShader
  /// Shader resource selected for charset rendering.
  charsetShader
  /// Shader resource selected for back tile rendering.
  backTileShader
  /// When constructing this record, `create` supplies `"charsetProp"` for this member. Used by
  /// `drawProportionalString` during subsequent processing.
  charsetProp
  /// When constructing this record, `create` supplies `"charsetPropGlow"` for this member. Used by
  /// `drawProportionalString` during subsequent processing.
  charsetPropGlow
  /// When constructing this record, `create` supplies `"charsetPropB"` for this member. Used by
  /// `drawBannerString2` during subsequent processing.
  charsetPropB
  /// Host requests queued while drawing scaled text, pictures, and rectangles for CGame, retained in
  /// request order.
  actions
  /// When constructing this record, `create` supplies `0` for this member. Used by `publish` during
  /// subsequent processing.
  emitted
  /// Number of requests withheld from native dispatch while drawing scaled text, pictures, and
  /// rectangles for CGame because the retail QVM owns their effects.
  suppressed
end struct

/// Creates a `mq3.client.cgame_drawtools.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(1.0,1.0,0.0,640,480,0,0,640,480,0,100,0,"white","charset","backtile","charsetProp","charsetPropGlow","charsetPropB",[],0,0)
end function
/// Evaluates client game drawtools `copyColor` and returns `void`, `[color[0],color[1],color[2],color[3]]` according to its guard/selection conditions.
/// @param color Sequence read at `color[0]`, `color[1]`, `color[2]`, `color[3]`.
function copyColor(color) if color==void then return void end if;return [color[0],color[1],color[2],color[3]] end function
/// Creates a `mq3.client.cgame_drawtools.DrawAction` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.
/// @param kind Value used to initialize `DrawAction.kind`.
/// @param x Value used to initialize `DrawAction.x`.
/// @param y Value used to initialize `DrawAction.y`.
/// @param width Value used to initialize `DrawAction.width`.
/// @param height Value used to initialize `DrawAction.height`.
/// @param s1 Value used to initialize `DrawAction.s1`.
/// @param t1 Value used to initialize `DrawAction.t1`.
/// @param s2 Value used to initialize `DrawAction.s2`.
/// @param t2 Value used to initialize `DrawAction.t2`.
/// @param shader Value used to initialize `DrawAction.shader`.
/// @param color Value used to initialize `DrawAction.color`.
/// @param dispatched Value used to initialize `DrawAction.dispatched`.
function action(kind,x,y,width,height,s1,t1,s2,t2,shader,color,dispatched) return DrawAction(kind,x,y,width,height,s1,t1,s2,t2,shader,copyColor(color),dispatched) end function
/// Updates `value.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game drawtools `publish`.
/// @param state Mutable client game drawtools record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
/// @param value Mutable client game drawtools record/storage; this routine assigns `value.dispatched`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function publish(state,value,retailActive)
  value.dispatched=not retailActive;state.actions=state.actions+[value];if value.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return value
end function
/// Updates `state.actions` during client game drawtools `clear`.
/// @param state Mutable client game drawtools record/storage; this routine assigns `state.actions`.
function clear(state) state.actions=[];return void end function
/// Adapts `mq3.client.cgame_drawtools.publish` to client game drawtools `setColor`, returning its result for `state, action("set-color",0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,"",color,false), retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_drawtools.publish`.
/// @param color Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("set-color",0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,"",color,false)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.publish`.
function setColor(state,color,retailActive) return publish(state,action("set-color",0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,"",color,false),retailActive) end function
/// Adapts `mq3.client.cgame_drawtools.publish` to client game drawtools `stretchPic`, returning its result for `state, action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false), retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_drawtools.publish`.
/// @param x Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param y Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param width Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param height Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param s1 Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param t1 Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param s2 Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param t2 Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param shader Argument 2 of `mq3.client.cgame_drawtools.publish`; passed as `action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.publish`.
function stretchPic(state,x,y,width,height,s1,t1,s2,t2,shader,retailActive) return publish(state,action("stretch-pic",x,y,width,height,s1,t1,s2,t2,shader,void,false),retailActive) end function

// CG_AdjustFrom640
/// @param state Record read through `state.screenXScale`, `state.screenYScale`.
/// @param x Horizontal coordinate in the coordinate space used by `adjustFrom640`.
/// @param y Vertical coordinate in the coordinate space used by `adjustFrom640`.
/// @param width Width in the coordinate space used by `adjustFrom640`.
/// @param height Height in the coordinate space used by `adjustFrom640`.
function adjustFrom640(state,x,y,width,height) return [n.fmul(x,state.screenXScale),n.fmul(y,state.screenYScale),n.fmul(width,state.screenXScale),n.fmul(height,state.screenYScale)] end function

// CG_FillRect
/// @param state Record read through `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `fillRect`.
/// @param y Vertical coordinate in the coordinate space used by `fillRect`.
/// @param width Width in the coordinate space used by `fillRect`.
/// @param height Height in the coordinate space used by `fillRect`.
/// @param color Color value used by the client game drawtools drawing or interpolation operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function fillRect(state,x,y,width,height,color,retailActive)
  setColor(state,color,retailActive);p=adjustFrom640(state,x,y,width,height);stretchPic(state,p[0],p[1],p[2],p[3],0.0,0.0,0.0,0.0,state.whiteShader,retailActive);setColor(state,void,retailActive);return void
end function
// CG_DrawSides
/// @param state Record read through `state.screenXScale`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `drawSides`.
/// @param y Vertical coordinate in the coordinate space used by `drawSides`.
/// @param width Width in the coordinate space used by `drawSides`.
/// @param height Height in the coordinate space used by `drawSides`.
/// @param size Value used by `scaled=n.fmul(size,state.screenXScale)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawSides(state,x,y,width,height,size,retailActive)
  p=adjustFrom640(state,x,y,width,height);scaled=n.fmul(size,state.screenXScale);stretchPic(state,p[0],p[1],scaled,p[3],0.0,0.0,0.0,0.0,state.whiteShader,retailActive);stretchPic(state,n.fadd(p[0],n.fsub(p[2],scaled)),p[1],scaled,p[3],0.0,0.0,0.0,0.0,state.whiteShader,retailActive);return void
end function
// CG_DrawTopBottom
/// @param state Record read through `state.screenYScale`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `drawTopBottom`.
/// @param y Vertical coordinate in the coordinate space used by `drawTopBottom`.
/// @param width Width in the coordinate space used by `drawTopBottom`.
/// @param height Height in the coordinate space used by `drawTopBottom`.
/// @param size Value used by `scaled=n.fmul(size,state.screenYScale)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawTopBottom(state,x,y,width,height,size,retailActive)
  p=adjustFrom640(state,x,y,width,height);scaled=n.fmul(size,state.screenYScale);stretchPic(state,p[0],p[1],p[2],scaled,0.0,0.0,0.0,0.0,state.whiteShader,retailActive);stretchPic(state,p[0],n.fadd(p[1],n.fsub(p[3],scaled)),p[2],scaled,0.0,0.0,0.0,0.0,state.whiteShader,retailActive);return void
end function
// CG_DrawRect
/// @param state Shared client game drawtools state passed to the helper calls in `drawRect`.
/// @param x Horizontal coordinate in the coordinate space used by `drawRect`.
/// @param y Vertical coordinate in the coordinate space used by `drawRect`.
/// @param width Width in the coordinate space used by `drawRect`.
/// @param height Height in the coordinate space used by `drawRect`.
/// @param size Value used by `drawTopBottom(state,x,y,width,height,size,retailActive)`.
/// @param color Color value used by the client game drawtools drawing or interpolation operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawRect(state,x,y,width,height,size,color,retailActive) setColor(state,color,retailActive);drawTopBottom(state,x,y,width,height,size,retailActive);drawSides(state,x,y,width,height,size,retailActive);setColor(state,void,retailActive);return void end function
// CG_DrawPic
/// @param state Shared client game drawtools state passed to the helper calls in `drawPic`.
/// @param x Horizontal coordinate in the coordinate space used by `drawPic`.
/// @param y Vertical coordinate in the coordinate space used by `drawPic`.
/// @param width Width in the coordinate space used by `drawPic`.
/// @param height Height in the coordinate space used by `drawPic`.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawPic(state,x,y,width,height,shader,retailActive) p=adjustFrom640(state,x,y,width,height);return stretchPic(state,p[0],p[1],p[2],p[3],0.0,0.0,1.0,1.0,shader,retailActive) end function

// CG_DrawChar
/// @param state Record read through `state.charsetShader`.
/// @param x Horizontal coordinate in the coordinate space used by `drawChar`.
/// @param y Vertical coordinate in the coordinate space used by `drawChar`.
/// @param width Width in the coordinate space used by `drawChar`.
/// @param height Height in the coordinate space used by `drawChar`.
/// @param ch Value used by `value=ch&255`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawChar(state,x,y,width,height,ch,retailActive)
  value=ch&255;if value==32 then return void end if;p=adjustFrom640(state,x*1.0,y*1.0,width*1.0,height*1.0);row=value>>4;col=value&15;frow=n.fmul(row*1.0,0.0625);fcol=n.fmul(col*1.0,0.0625);return stretchPic(state,p[0],p[1],p[2],p[3],fcol,frow,n.fadd(fcol,0.0625),n.fadd(frow,0.0625),state.charsetShader,retailActive)
end function
/// Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for client game drawtools `isColor`.
/// @param data Sequence read at `data[index]`, `data[index+1]`.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
/// Calls `mq3.client.cgame_drawtools.copyColor` from client game drawtools `colorTable`. The final path returns `copyColor(table[index&7])`.
/// @param index Value used by `return copyColor(table[index&7])`.
function colorTable(index)
  table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]];return copyColor(table[index&7])
end function
/// Computes `(code-48)&7` for client game drawtools `colorIndex`.
/// @param code Value used by `return (code-48)&7`.
function colorIndex(code) return (code-48)&7 end function

// CG_DrawStringExt
/// @param state Shared client game drawtools state passed to the helper calls in `drawStringExt`.
/// @param x Horizontal coordinate in the coordinate space used by `drawStringExt`.
/// @param y Vertical coordinate in the coordinate space used by `drawStringExt`.
/// @param text Text consumed or emitted by `drawStringExt` in the client game drawtools path.
/// @param setColorValue Sequence read at `setColorValue[3]`.
/// @param forceColor Value used by `if not forceColor then color=colorTable(colorIndex(data[index+1]))`.
/// @param shadow Value used by `if shadow then`.
/// @param charWidth Value used by `if isColor(data,index) then index=index+2 else drawChar(state,xx+2,y+2,charWidth,charHeight,data[index],retailActive)`.
/// @param charHeight Value used by `if isColor(data,index) then index=index+2 else drawChar(state,xx+2,y+2,charWidth,charHeight,data[index],retailActive)`.
/// @param maxChars Value used by `limit=maxChars`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawStringExt(state,x,y,text,setColorValue,forceColor,shadow,charWidth,charHeight,maxChars,retailActive)
  limit=maxChars;if limit<=0 then limit=32767 end if;data=bytes(text)
  if shadow then
    setColor(state,[0.0,0.0,0.0,setColorValue[3]],retailActive);index=0;xx=x;count=0
    while index<len(data) and count<limit
      if isColor(data,index) then index=index+2 else drawChar(state,xx+2,y+2,charWidth,charHeight,data[index],retailActive);count=count+1;xx=xx+charWidth;index=index+1 end if
    end while
  end if
  setColor(state,setColorValue,retailActive);index=0;xx=x;count=0
  while index<len(data) and count<limit
    if isColor(data,index) then
      if not forceColor then color=colorTable(colorIndex(data[index+1]));color[3]=setColorValue[3];setColor(state,color,retailActive) end if;index=index+2
    else drawChar(state,xx,y,charWidth,charHeight,data[index],retailActive);xx=xx+charWidth;count=count+1;index=index+1 end if
  end while
  setColor(state,void,retailActive);return void
end function
// CG_DrawBigString
/// @param state Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param x Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param y Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param text Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param alpha Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
function drawBigString(state,x,y,text,alpha,retailActive) return drawStringExt(state,x,y,text,[1.0,1.0,1.0,alpha],false,true,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,0,retailActive) end function
// CG_DrawBigStringColor
/// @param state Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param x Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param y Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param text Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param color Argument 5 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
function drawBigStringColor(state,x,y,text,color,retailActive) return drawStringExt(state,x,y,text,color,true,true,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,0,retailActive) end function
// CG_DrawSmallString
/// @param state Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param x Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param y Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param text Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param alpha Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
function drawSmallString(state,x,y,text,alpha,retailActive) return drawStringExt(state,x,y,text,[1.0,1.0,1.0,alpha],false,false,SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT,0,retailActive) end function
// CG_DrawSmallStringColor
/// @param state Argument 1 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param x Argument 2 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param y Argument 3 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param text Argument 4 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param color Argument 5 of `mq3.client.cgame_drawtools.drawStringExt`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.drawStringExt`.
function drawSmallStringColor(state,x,y,text,color,retailActive) return drawStringExt(state,x,y,text,color,true,false,SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT,0,retailActive) end function
// CG_DrawStrlen
/// @param text Text consumed or emitted by `drawStrlen` in the client game drawtools path.
function drawStrlen(text) data=bytes(text);index=0;count=0;while index<len(data) if isColor(data,index) then index=index+2 else index=index+1;count=count+1 end if end while;return count end function

// CG_TileClearBox
/// @param state Argument 1 of `mq3.client.cgame_drawtools.stretchPic`.
/// @param x Argument 2, 6, 8 of `mq3.client.cgame_drawtools.stretchPic`; passed as `x*1.0`, `x/64.0`, `(x+width)/64.0`.
/// @param y Argument 3, 7, 9 of `mq3.client.cgame_drawtools.stretchPic`; passed as `y*1.0`, `y/64.0`, `(y+height)/64.0`.
/// @param width Argument 4, 8 of `mq3.client.cgame_drawtools.stretchPic`; passed as `width*1.0`, `(x+width)/64.0`.
/// @param height Argument 5, 9 of `mq3.client.cgame_drawtools.stretchPic`; passed as `height*1.0`, `(y+height)/64.0`.
/// @param shader Argument 10 of `mq3.client.cgame_drawtools.stretchPic`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_drawtools.stretchPic`.
function tileClearBox(state,x,y,width,height,shader,retailActive) return stretchPic(state,x*1.0,y*1.0,width*1.0,height*1.0,x/64.0,y/64.0,(x+width)/64.0,(y+height)/64.0,shader,retailActive) end function
// CG_TileClear
/// @param state Record read through `state.vidWidth`, `state.vidHeight`, `state.refX`, `state.refY` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function tileClear(state,retailActive)
  w=state.vidWidth;h=state.vidHeight;if state.refX==0 and state.refY==0 and state.refWidth==w and state.refHeight==h then return void end if;top=state.refY;bottom=top+state.refHeight-1;left=state.refX;right=left+state.refWidth-1
  tileClearBox(state,0,0,w,top,state.backTileShader,retailActive);tileClearBox(state,0,bottom,w,h-bottom,state.backTileShader,retailActive);tileClearBox(state,0,top,left,bottom-top+1,state.backTileShader,retailActive);tileClearBox(state,right,top,w-right,bottom-top+1,state.backTileShader,retailActive);return void
end function

// CG_FadeColor
/// @param state Record read through `state.time`.
/// @param startMsec Value used by `if startMsec==0 then return void end if`.
/// @param totalMsec Value used by `if t>=totalMsec then return void end if`.
function fadeColor(state,startMsec,totalMsec)
  if startMsec==0 then return void end if;t=state.time-startMsec;if t>=totalMsec then return void end if;alpha=1.0;if totalMsec-t<FADE_TIME then alpha=n.f32((totalMsec-t)*1.0/FADE_TIME) end if;return [1.0,1.0,1.0,alpha]
end function
// CG_TeamColor
/// @param team Value used by `if team==TEAM_RED then return [1.0,0.2,0.2,1.0] end if`.
function teamColor(team) if team==TEAM_RED then return [1.0,0.2,0.2,1.0] end if;if team==TEAM_BLUE then return [0.2,0.2,1.0,1.0] end if;if team==TEAM_SPECTATOR then return [0.7,0.7,0.7,1.0] end if;return [1.0,1.0,1.0,1.0] end function
// CG_GetColorForHealth
/// @param health Value used by `if health<=0 then return [0.0,0.0,0.0,1.0] end if`.
/// @param armor Value used by `count=armor`.
function getColorForHealth(health,armor)
  if health<=0 then return [0.0,0.0,0.0,1.0] end if;count=armor;maximum=n.trunc32(health*ARMOR_PROTECTION/(1.0-ARMOR_PROTECTION));if maximum<count then count=maximum end if;total=health+count;blue=0.0;if total>=100 then blue=1.0 else if total>=66 then blue=n.f32((total-66)/33.0) end if;green=0.0;if total>60 then green=1.0 else if total>=30 then green=n.f32((total-30)/30.0) end if;return [1.0,green,blue,1.0]
end function
// CG_ColorForHealth
/// @param state Record read through `state.health`, `state.armor`.
function colorForHealth(state) return getColorForHealth(state.health,state.armor) end function

/// Evaluates client game drawtools `propMap` and returns `invalid+visible` according to its guard/selection conditions.
function propMap()
  invalid=[];for i=0 to 31 invalid=invalid+[[0,0,-1]] end for
  visible=[[0,0,8],[11,122,7],[154,181,14],[55,122,17],[79,122,18],[101,122,23],[153,122,18],[9,93,7],[207,122,8],[230,122,9],[177,122,18],[30,152,18],[85,181,7],[34,93,11],[110,181,6],[130,152,14],[22,64,17],[41,64,12],[58,64,17],[78,64,18],[98,64,19],[120,64,18],[141,64,18],[204,64,16],[162,64,17],[182,64,18],[59,181,7],[35,181,7],[203,152,14],[56,93,14],[228,152,14],[177,181,18],[28,122,22],[5,4,18],[27,4,18],[48,4,18],[69,4,17],[90,4,13],[106,4,13],[121,4,18],[143,4,17],[164,4,8],[175,4,16],[195,4,18],[216,4,12],[230,4,23],[6,34,18],[27,34,18],[48,34,18],[68,34,18],[90,34,17],[110,34,18],[130,34,14],[146,34,18],[166,34,19],[185,34,29],[215,34,18],[234,34,18],[5,64,14],[60,152,7],[106,151,13],[83,152,7],[128,122,17],[4,152,21],[134,181,5],[5,4,18],[27,4,18],[48,4,18],[69,4,17],[90,4,13],[106,4,13],[121,4,18],[143,4,17],[164,4,8],[175,4,16],[195,4,18],[216,4,12],[230,4,23],[6,34,18],[27,34,18],[48,34,18],[68,34,18],[90,34,17],[110,34,18],[130,34,14],[146,34,18],[166,34,19],[185,34,29],[215,34,18],[234,34,18],[5,64,14],[153,152,13],[11,181,5],[180,152,13],[79,93,17],[0,0,-1]];return invalid+visible
end function
/// Builds the client game drawtools `propMapB` sequence from `[[11,12,33],[49,12,31],[85,12,31],[120,12,30],[156,12,21],[183,12,21],[207,12,32],[13,55,30],[49,55,13],[66,55,29],[101,55,31],[135,55,21],[158,55,40],[204,55,32],[12,97,31],[48,97,31],[82,97,30],[...`.
function propMapB() return [[11,12,33],[49,12,31],[85,12,31],[120,12,30],[156,12,21],[183,12,21],[207,12,32],[13,55,30],[49,55,13],[66,55,29],[101,55,31],[135,55,21],[158,55,40],[204,55,32],[12,97,31],[48,97,31],[82,97,30],[118,97,30],[153,97,30],[185,97,25],[213,97,30],[11,139,32],[42,139,51],[93,139,32],[126,139,31],[158,139,25]] end function

// UI_DrawBannerString2
/// @param state Record read through `state.screenXScale`, `state.screenXBias`, `state.charsetPropB`.
/// @param x Horizontal coordinate in the coordinate space used by `drawBannerString2`.
/// @param y Vertical coordinate in the coordinate space used by `drawBannerString2`.
/// @param text Text consumed or emitted by `drawBannerString2` in the client game drawtools path.
/// @param color Color value used by the client game drawtools drawing or interpolation operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawBannerString2(state,x,y,text,color,retailActive)
  setColor(state,color,retailActive);ax=n.fadd(n.fmul(x*1.0,state.screenXScale),state.screenXBias);ay=n.fmul(y*1.0,state.screenXScale);data=bytes(text);map=propMapB()
  if len(data)>0 then for index=0 to len(data)-1 ch=data[index]&127;if ch==32 then ax=n.fadd(ax,n.fmul((PROPB_SPACE_WIDTH+PROPB_GAP_WIDTH)*1.0,state.screenXScale)) else if ch>=65 and ch<=90 then glyph=map[ch-65];aw=n.fmul(glyph[2]*1.0,state.screenXScale);ah=n.fmul(PROPB_HEIGHT*1.0,state.screenXScale);stretchPic(state,ax,ay,aw,ah,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+PROPB_HEIGHT)/256.0,state.charsetPropB,retailActive);ax=n.fadd(ax,n.fadd(aw,n.fmul(PROPB_GAP_WIDTH*1.0,state.screenXScale))) end if end for end if
  setColor(state,void,retailActive);return void
end function
/// Calls `mq3.client.cgame_drawtools.propMapB` from client game drawtools `bannerWidth`. The final path returns `width-PROPB_GAP_WIDTH`.
/// @param text Text consumed or emitted by `bannerWidth` in the client game drawtools path.
function bannerWidth(text) data=bytes(text);if len(data)==0 then return -PROPB_GAP_WIDTH end if;map=propMapB();width=0;for index=0 to len(data)-1 ch=data[index];if ch==32 then width=width+PROPB_SPACE_WIDTH else if ch>=65 and ch<=90 then width=width+map[ch-65][2]+PROPB_GAP_WIDTH end if end for;return width-PROPB_GAP_WIDTH end function
// UI_DrawBannerString
/// @param state Shared client game drawtools state passed to the helper calls in `drawBannerString`.
/// @param x Horizontal coordinate in the coordinate space used by `drawBannerString`.
/// @param y Vertical coordinate in the coordinate space used by `drawBannerString`.
/// @param text Text consumed or emitted by `drawBannerString` in the client game drawtools path.
/// @param style Value used by `format=style&UI_FORMATMASK`.
/// @param color Sequence read at `color[3]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawBannerString(state,x,y,text,style,color,retailActive)
  width=bannerWidth(text);format=style&UI_FORMATMASK;if format==UI_CENTER then x=x-n.trunc32(width/2) else if format==UI_RIGHT then x=x-width end if;if (style&UI_DROPSHADOW)!=0 then drawBannerString2(state,x+2,y+2,text,[0.0,0.0,0.0,color[3]],retailActive) end if;return drawBannerString2(state,x,y,text,color,retailActive)
end function
// UI_ProportionalStringWidth
/// @param text Text consumed or emitted by `proportionalStringWidth` in the client game drawtools path.
function proportionalStringWidth(text) data=bytes(text);if len(data)==0 then return -PROP_GAP_WIDTH end if;map=propMap();width=0;for index=0 to len(data)-1 glyph=map[data[index]&127];if glyph[2]!=-1 then width=width+glyph[2]+PROP_GAP_WIDTH end if end for;return width-PROP_GAP_WIDTH end function
// UI_DrawProportionalString2
/// @param state Record read through `state.screenXScale`, `state.screenXBias`.
/// @param x Horizontal coordinate in the coordinate space used by `drawProportionalString2`.
/// @param y Vertical coordinate in the coordinate space used by `drawProportionalString2`.
/// @param text Text consumed or emitted by `drawProportionalString2` in the client game drawtools path.
/// @param color Color value used by the client game drawtools drawing or interpolation operation.
/// @param sizeScale Value used by `if ch==32 then aw=n.fmul(PROP_SPACE_WIDTH*1.0,n.fmul(state.screenXScale,sizeScale)) else if glyph[2]!=-1 then aw=n.fmul(glyph[2]*1.0,n.fmul(st...`.
/// @param charset Value used by `stretchPic(state,ax,ay,aw,ah,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+PROP_HEIGHT)/256.0,charset,retailActive) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawProportionalString2(state,x,y,text,color,sizeScale,charset,retailActive)
  setColor(state,color,retailActive);ax=n.fadd(n.fmul(x*1.0,state.screenXScale),state.screenXBias);ay=n.fmul(y*1.0,state.screenXScale);data=bytes(text);map=propMap()
  if len(data)>0 then for index=0 to len(data)-1 ch=data[index]&127;glyph=map[ch];aw=0.0;if ch==32 then aw=n.fmul(PROP_SPACE_WIDTH*1.0,n.fmul(state.screenXScale,sizeScale)) else if glyph[2]!=-1 then aw=n.fmul(glyph[2]*1.0,n.fmul(state.screenXScale,sizeScale));ah=n.fmul(PROP_HEIGHT*1.0,n.fmul(state.screenXScale,sizeScale));stretchPic(state,ax,ay,aw,ah,glyph[0]/256.0,glyph[1]/256.0,(glyph[0]+glyph[2])/256.0,(glyph[1]+PROP_HEIGHT)/256.0,charset,retailActive) end if;ax=n.fadd(ax,n.fadd(aw,n.fmul(PROP_GAP_WIDTH*1.0,n.fmul(state.screenXScale,sizeScale)))) end for end if
  setColor(state,void,retailActive);return void
end function
// UI_ProportionalSizeScale
/// @param style Value used by `if (style&UI_SMALLFONT)!=0 then return 0.75 end if`.
function proportionalSizeScale(style) if (style&UI_SMALLFONT)!=0 then return 0.75 end if;return 1.0 end function
// UI_DrawProportionalString
/// @param state Record read through `state.charsetProp`, `state.time`, `state.charsetPropGlow`.
/// @param x Horizontal coordinate in the coordinate space used by `drawProportionalString`.
/// @param y Vertical coordinate in the coordinate space used by `drawProportionalString`.
/// @param text Text consumed or emitted by `drawProportionalString` in the client game drawtools path.
/// @param style Value used by `scale=proportionalSizeScale(style)`.
/// @param color Sequence read at `color[3]`, `color[0]`, `color[1]`, `color[2]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawProportionalString(state,x,y,text,style,color,retailActive)
  scale=proportionalSizeScale(style);format=style&UI_FORMATMASK;if format==UI_CENTER then x=x-n.trunc32(proportionalStringWidth(text)*scale/2.0) else if format==UI_RIGHT then x=x-n.trunc32(proportionalStringWidth(text)*scale) end if
  if (style&UI_DROPSHADOW)!=0 then drawProportionalString2(state,x+2,y+2,text,[0.0,0.0,0.0,color[3]],scale,state.charsetProp,retailActive) end if
  if (style&UI_INVERSE)!=0 then return drawProportionalString2(state,x,y,text,[n.fmul(color[0],0.8),n.fmul(color[1],0.8),n.fmul(color[2],0.8),color[3]],scale,state.charsetProp,retailActive) end if
  if (style&UI_PULSE)!=0 then drawProportionalString2(state,x,y,text,color,scale,state.charsetProp,retailActive);pulse=[color[0],color[1],color[2],n.fadd(0.5,n.fmul(0.5,crt.sin(state.time/PULSE_DIVISOR)))];return drawProportionalString2(state,x,y,text,pulse,scale,state.charsetPropGlow,retailActive) end if
  return drawProportionalString2(state,x,y,text,color,scale,state.charsetProp,retailActive)
end function
