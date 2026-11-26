// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete client/cl_scrn.c facade over the productive renderer command stream
// and the unchanged-ui.qvm screen lifecycle.
package mq3.client.cl_scrn_runtime

import mq3.renderer.tr_cmds_runtime as renderer
import mq3.renderer.command_queue as commands
import mq3.client.ui_host_lifecycle as lifecycle
import mq3.compat.numeric as n

const SCREEN_WIDTH=640.0
const SCREEN_HEIGHT=480.0
const SMALLCHAR_WIDTH=8
const SMALLCHAR_HEIGHT=16
const BIGCHAR_WIDTH=16
const STEREO_CENTER=0
const STEREO_LEFT=1
const STEREO_RIGHT=2

/// Stores engine client scrn runtime host-service callbacks, including `context`, `registerShaderFn`, `stopSoundsFn`, `consoleFn`, `fileTellFn`, `diagnosticFn`.
struct Services context registerShaderFn stopSoundsFn consoleFn fileTellFn diagnosticFn end struct
/// Stores engine client scrn runtime graph sample record, including `value`, `color`.
struct GraphSample value color end struct
/// Stores engine client scrn runtime state, including `renderer`, `lifecycle`, `services`, `vidWidth`, `vidHeight`, `charSetShader` and additional values.
struct State renderer lifecycle services vidWidth vidHeight charSetShader whiteShader initialized timegraph debuggraph debugMove graphheight graphscale graphshift graphCurrent graphValues connectionState realtime uiLoaded keyCatchers stereoEnabled demoRecording spDemoRecording demoName demoFile recursive currentStereo end struct

/// Creates the engine client scrn runtime error `7810` with diagnostic text `"cl_scrn: "+message`.
/// @param message Argument 2 of `error`; passed as `"cl_scrn: "+message`.
function fail(message) return error(7810,"cl_scrn: "+message) end function
/// Creates a `mq3.client.cl_scrn_runtime.Services` record. Assigns `context` from `context`.
/// @param context Value used to initialize `Services.context`.
function services(context) return Services(context,void,void,void,void,void) end function
/// Calls `mq3.renderer.tr_cmds_runtime.create`, `mq3.client.cl_scrn_runtime.services`, `mq3.client.cl_scrn_runtime.GraphSample` and additional helpers from engine client scrn runtime `create`.
/// @param renderState Value used by `if renderState==void then renderState=renderer.create(void,void,void,void) end if`.
/// @param uiLifecycle Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`.
/// @param host host record passed to the engine client scrn runtime helper calls.
/// @param width Width in the coordinate space used by `create`.
/// @param height Height in the coordinate space used by `create`.
/// @param charSetShader Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`.
/// @param whiteShader Value used by `return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,...`.
function create(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader)
  if renderState==void then renderState=renderer.create(void,void,void,void) end if
  if host==void then host=services(void) end if
  values=[];for index=0 to 1023 values=values+[GraphSample(0.0,0)] end for
  return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,0,false,false,false,"",void,0,STEREO_CENTER)
end function
/// Calls `state.services.diagnosticFn` from engine client scrn runtime `emit`.
/// @param state Record read through `state.services.diagnosticFn`, `state.services.context`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param value Value used by `if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if`.
function emit(state,kind,value) if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if;return void end function
/// Evaluates engine client scrn runtime `color` and returns `table[index&7]` according to its guard/selection conditions.
/// @param index Value used by `return table[index&7]`.
function color(index)
  table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]]
  return table[index&7]
end function
/// Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for engine client scrn runtime `isColor`.
/// @param data Sequence read at `data[index]`, `data[index+1]`.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function

// SCR_AdjustFrom640 -- independent x/y scaling is intentional Baseq3 behavior.
/// @param state Record read through `state.vidWidth`, `state.vidHeight`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_AdjustFrom640`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_AdjustFrom640`.
/// @param w Width in the coordinate space used by `SCR_AdjustFrom640`.
/// @param h Height in the coordinate space used by `SCR_AdjustFrom640`.
function SCR_AdjustFrom640(state,x,y,w,h)
  if state==void or state.vidWidth<=0 or state.vidHeight<=0 then return fail("invalid video configuration") end if
  xscale=state.vidWidth/SCREEN_WIDTH;yscale=state.vidHeight/SCREEN_HEIGHT
  if x!=void then x=x*xscale end if;if y!=void then y=y*yscale end if;if w!=void then w=w*xscale end if;if h!=void then h=h*yscale end if
  return [x,y,w,h]
end function
/// Adapts `mq3.renderer.tr_cmds_runtime.RE_StretchPic` to engine client scrn runtime `draw`, returning its result for `state.renderer, x, y, w, h, s1, t1, s2, t2, shader`.
/// @param state Record read through `state.renderer`.
/// @param x Argument 2 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param y Argument 3 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param w Argument 4 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param h Argument 5 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param s1 Argument 6 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param t1 Argument 7 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param s2 Argument 8 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param t2 Argument 9 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
/// @param shader Argument 10 of `mq3.renderer.tr_cmds_runtime.RE_StretchPic`.
function draw(state,x,y,w,h,s1,t1,s2,t2,shader) return renderer.RE_StretchPic(state.renderer,x,y,w,h,s1,t1,s2,t2,shader) end function
/// Calls `state.services.registerShaderFn`, `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawNamedPic`. The final path returns `shader`.
/// @param state Record read through `state.services.registerShaderFn`, `state.services.context`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawNamedPic`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawNamedPic`.
/// @param width Width in the coordinate space used by `SCR_DrawNamedPic`.
/// @param height Height in the coordinate space used by `SCR_DrawNamedPic`.
/// @param picname Value used by `shader=state.services.registerShaderFn(state.services.context,picname)`.
function SCR_DrawNamedPic(state,x,y,width,height,picname)
  if width==0 then return fail("named picture width is zero") end if
  if state.services.registerShaderFn==void then return fail("shader registration service unavailable") end if
  shader=state.services.registerShaderFn(state.services.context,picname);value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return shader
end function
/// Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_FillRect`. The final path returns `value`.
/// @param state Record read through `state.renderer`, `state.whiteShader`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_FillRect`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_FillRect`.
/// @param width Width in the coordinate space used by `SCR_FillRect`.
/// @param height Height in the coordinate space used by `SCR_FillRect`.
/// @param rgba Value used by `renderer.RE_SetColor(state.renderer,rgba)`.
function SCR_FillRect(state,x,y,width,height,rgba)
  renderer.RE_SetColor(state.renderer,rgba);value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,0.0,0.0,state.whiteShader);renderer.RE_SetColor(state.renderer,void);return value
end function
/// Calls `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawPic`. The final path returns `value`.
/// @param state Shared engine client scrn runtime state passed to the helper calls in `SCR_DrawPic`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawPic`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawPic`.
/// @param width Width in the coordinate space used by `SCR_DrawPic`.
/// @param height Height in the coordinate space used by `SCR_DrawPic`.
/// @param shader Shader handle or asset name selected for this draw operation.
function SCR_DrawPic(state,x,y,width,height,shader)
  value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return value
end function
/// Calls `mq3.client.cl_scrn_runtime.SCR_AdjustFrom640`, `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawChar`.
/// @param state Record read through `state.charSetShader`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawChar`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawChar`.
/// @param size Value tested by `ch==32 or y<0-size` before the calculation continues.
/// @param ch Value used by `ch=ch&255`.
function SCR_DrawChar(state,x,y,size,ch)
  ch=ch&255;if ch==32 or y<0-size then return false end if
  value=SCR_AdjustFrom640(state,x,y,size,size);row=ch>>4;col=ch&15;frow=row*0.0625;fcol=col*0.0625
  return draw(state,value[0],value[1],value[2],value[3],fcol,frow,fcol+0.0625,frow+0.0625,state.charSetShader)
end function
/// Calls `mq3.client.cl_scrn_runtime.draw` from engine client scrn runtime `SCR_DrawSmallChar`.
/// @param state Record read through `state.charSetShader`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawSmallChar`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawSmallChar`.
/// @param ch Value used by `ch=ch&255`.
function SCR_DrawSmallChar(state,x,y,ch)
  ch=ch&255;if ch==32 or y<0-SMALLCHAR_HEIGHT then return false end if
  row=ch>>4;col=ch&15;frow=row*0.0625;fcol=col*0.0625
  return draw(state,x,y,SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT,fcol,frow,fcol+0.0625,frow+0.0625,state.charSetShader)
end function
/// Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.isColor`, `mq3.client.cl_scrn_runtime.SCR_DrawChar` and additional helpers from engine client scrn runtime `SCR_DrawStringExt`. The final path returns `drawn`.
/// @param state Record read through `state.renderer`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawStringExt`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawStringExt`.
/// @param size Value tested by `if SCR_DrawChar(state,xx+2,y+2,size,data[index])`, `if SCR_DrawChar(state,xx,y,size,data[index])` before the calculation continues.
/// @param text Text consumed or emitted by `SCR_DrawStringExt` in the engine client scrn runtime path.
/// @param setColor Sequence read at `setColor[3]`.
/// @param forceColor Value used by `if not forceColor then rgba=color(data[index+1])`.
function SCR_DrawStringExt(state,x,y,size,text,setColor,forceColor)
  data=bytes(text);xx=x;renderer.RE_SetColor(state.renderer,[0.0,0.0,0.0,setColor[3]]);index=0;drawn=0
  while index<len(data)
    if isColor(data,index) then index=index+2;continue end if
    if SCR_DrawChar(state,xx+2,y+2,size,data[index]) then drawn=drawn+1 end if;xx=n.trunc32(xx+size);index=index+1
  end while
  xx=x;renderer.RE_SetColor(state.renderer,setColor);index=0
  while index<len(data)
    if isColor(data,index) then
      if not forceColor then rgba=color(data[index+1]);rgba[3]=setColor[3];renderer.RE_SetColor(state.renderer,rgba) end if;index=index+2;continue
    end if
    if SCR_DrawChar(state,xx,y,size,data[index]) then drawn=drawn+1 end if;xx=n.trunc32(xx+size);index=index+1
  end while
  renderer.RE_SetColor(state.renderer,void);return drawn
end function
/// Adapts `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` to engine client scrn runtime `SCR_DrawBigString`, returning its result for `state, x, y, BIGCHAR_WIDTH, text, [1.0,1.0,1.0,alpha], false`.
/// @param state Argument 1 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param x Argument 2 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param y Argument 3 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param text Argument 5 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param alpha Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
function SCR_DrawBigString(state,x,y,text,alpha) return SCR_DrawStringExt(state,x,y,BIGCHAR_WIDTH,text,[1.0,1.0,1.0,alpha],false) end function
/// Adapts `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` to engine client scrn runtime `SCR_DrawBigStringColor`, returning its result for `state, x, y, BIGCHAR_WIDTH, text, rgba, true`.
/// @param state Argument 1 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param x Argument 2 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param y Argument 3 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param text Argument 5 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
/// @param rgba Argument 6 of `mq3.client.cl_scrn_runtime.SCR_DrawStringExt`.
function SCR_DrawBigStringColor(state,x,y,text,rgba) return SCR_DrawStringExt(state,x,y,BIGCHAR_WIDTH,text,rgba,true) end function
/// Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.isColor`, `mq3.client.cl_scrn_runtime.color` and additional helpers from engine client scrn runtime `SCR_DrawSmallStringExt`. The final path returns `drawn`.
/// @param state Record read through `state.renderer`.
/// @param x Horizontal coordinate in the coordinate space used by `SCR_DrawSmallStringExt`.
/// @param y Vertical coordinate in the coordinate space used by `SCR_DrawSmallStringExt`.
/// @param text Text consumed or emitted by `SCR_DrawSmallStringExt` in the engine client scrn runtime path.
/// @param setColor Sequence read at `setColor[3]`.
/// @param forceColor Value used by `if not forceColor then rgba=color(data[index+1])`.
function SCR_DrawSmallStringExt(state,x,y,text,setColor,forceColor)
  data=bytes(text);xx=x;renderer.RE_SetColor(state.renderer,setColor);index=0;drawn=0
  while index<len(data)
    if isColor(data,index) then
      if not forceColor then rgba=color(data[index+1]);rgba[3]=setColor[3];renderer.RE_SetColor(state.renderer,rgba) end if;index=index+2;continue
    end if
    if SCR_DrawSmallChar(state,xx,y,data[index]) then drawn=drawn+1 end if;xx=xx+SMALLCHAR_WIDTH;index=index+1
  end while
  renderer.RE_SetColor(state.renderer,void);return drawn
end function
/// Calls `mq3.client.cl_scrn_runtime.isColor` from engine client scrn runtime `SCR_Strlen`. The final path returns `count`.
/// @param text Text consumed or emitted by `SCR_Strlen` in the engine client scrn runtime path.
function SCR_Strlen(text)
  data=bytes(text);index=0;count=0;while index<len(data) if isColor(data,index) then index=index+2 else count=count+1;index=index+1 end if end while;return count
end function
/// Computes `SCR_Strlen(text)*BIGCHAR_WIDTH` for engine client scrn runtime `SCR_GetBigStringWidth`.
/// @param text Text consumed or emitted by `SCR_GetBigStringWidth` in the engine client scrn runtime path.
function SCR_GetBigStringWidth(text) return SCR_Strlen(text)*BIGCHAR_WIDTH end function

/// Calls `state.services.fileTellFn`, `mq3.compat.numeric.quotient`, `mq3.client.cl_scrn_runtime.SCR_DrawStringExt` and additional helpers from engine client scrn runtime `SCR_DrawDemoRecording`. The final path returns `text`.
/// @param state Record read through `state.demoRecording`, `state.spDemoRecording`, `state.services.fileTellFn`, `state.services.context` and additional values.
function SCR_DrawDemoRecording(state)
  if not state.demoRecording or state.spDemoRecording then return false end if
  pos=0;if state.services.fileTellFn!=void then pos=state.services.fileTellFn(state.services.context,state.demoFile) end if
  text="RECORDING "+state.demoName+": "+str(n.quotient(pos,1024))+"k";SCR_DrawStringExt(state,320-len(bytes(text))*4,20,8,text,color(7),true);return text
end function
/// Updates `state.graphValues[index].value`, `state.graphValues[index].color`, `state.graphCurrent` during engine client scrn runtime `SCR_DebugGraph`.
/// @param state Mutable engine client scrn runtime record/storage; this routine assigns `state.graphValues[index].value`, `state.graphValues[index].color`, `state.graphCurrent`.
/// @param value Value used by `state.graphValues[index].value=value`.
/// @param colorIndex Value used by `state.graphValues[index].color=colorIndex`.
function SCR_DebugGraph(state,value,colorIndex)
  index=state.graphCurrent&1023;state.graphValues[index].value=value;state.graphValues[index].color=colorIndex;state.graphCurrent=state.graphCurrent+1;return index
end function
/// Calls `mq3.renderer.tr_cmds_runtime.RE_SetColor`, `mq3.client.cl_scrn_runtime.color`, `mq3.client.cl_scrn_runtime.draw` and additional helpers from engine client scrn runtime `SCR_DrawDebugGraph`. The final path returns `columns`.
/// @param state Record read through `state.vidWidth`, `state.vidHeight`, `state.renderer`, `state.graphheight` and additional values.
function SCR_DrawDebugGraph(state)
  w=state.vidWidth;x=0;y=state.vidHeight;renderer.RE_SetColor(state.renderer,color(0));draw(state,x,y-state.graphheight,w,state.graphheight,0.0,0.0,0.0,0.0,state.whiteShader);renderer.RE_SetColor(state.renderer,void)
  columns=0;for a=0 to w-1
    index=(state.graphCurrent-1-a+1024)&1023;v=state.graphValues[index].value*state.graphscale+state.graphshift
    if v<0 then v=v+state.graphheight*(1+n.trunc32((0-v)/state.graphheight)) end if;h=n.trunc32(v)%state.graphheight
    draw(state,x+w-1-a,y-h,1,h,0.0,0.0,0.0,0.0,state.whiteShader);columns=columns+1
  end for;return columns
end function
/// Updates `state.timegraph`, `state.debuggraph`, `state.graphheight`, `state.graphscale` and additional values during engine client scrn runtime `SCR_Init`.
/// @param state Mutable engine client scrn runtime record/storage; this routine assigns `state.timegraph`, `state.debuggraph`, `state.graphheight`, `state.graphscale` and additional values.
function SCR_Init(state)
  if state==void then return fail("state is required") end if;state.timegraph=0;state.debuggraph=0;state.graphheight=32;state.graphscale=1;state.graphshift=0;state.initialized=true;return true
end function

/// Updates `state.currentStereo` during engine client scrn runtime `SCR_DrawScreenField`.
/// @param state Mutable engine client scrn runtime record/storage; this routine assigns `state.currentStereo`.
/// @param stereoFrame Value assigned to `state.currentStereo`.
function SCR_DrawScreenField(state,stereoFrame)
  state.currentStereo=stereoFrame;begun=renderer.RE_BeginFrame(state.renderer,stereoFrame);if begun is error then return begun end if
  // Original code clears the complete physical target behind non-active UI on widescreen.
  if state.connectionState!=lifecycle.CA_ACTIVE and state.vidWidth*480>state.vidHeight*640 then renderer.RE_SetColor(state.renderer,color(0));draw(state,0,0,state.vidWidth,state.vidHeight,0.0,0.0,0.0,0.0,state.whiteShader);renderer.RE_SetColor(state.renderer,void) end if
  if not state.uiLoaded or state.lifecycle==void then emit(state,"missingUI",void);return void end if
  if state.connectionState==lifecycle.CA_DISCONNECTED and state.services.stopSoundsFn!=void then full=state.lifecycle.fullscreenFn(state.lifecycle.context);if full is error then return full end if;if not full then state.services.stopSoundsFn(state.services.context) end if end if
  frame=lifecycle.drawScreen(state.lifecycle,state.connectionState,state.realtime);if frame is error then return frame end if
  if state.connectionState==lifecycle.CA_ACTIVE and not frame.fullscreen then SCR_DrawDemoRecording(state) end if
  if state.services.consoleFn!=void then state.services.consoleFn(state.services.context) end if
  if state.debuggraph!=0 or state.timegraph!=0 or state.debugMove!=0 then SCR_DrawDebugGraph(state) end if
  return frame
end function
/// Updates `state.recursive` during engine client scrn runtime `SCR_UpdateScreen`.
/// @param state Mutable engine client scrn runtime record/storage; this routine assigns `state.recursive`.
function SCR_UpdateScreen(state)
  if state==void or not state.initialized then return false end if
  state.recursive=state.recursive+1;if state.recursive>2 then state.recursive=0;return fail("SCR_UpdateScreen: recursively called") end if;state.recursive=1
  frames=[]
  if state.stereoEnabled then left=SCR_DrawScreenField(state,STEREO_LEFT);if left is error then state.recursive=0;return left end if;frames=frames+[left];right=SCR_DrawScreenField(state,STEREO_RIGHT);if right is error then state.recursive=0;return right end if;frames=frames+[right]
  else center=SCR_DrawScreenField(state,STEREO_CENTER);if center is error then state.recursive=0;return center end if;frames=[center] end if
  ended=renderer.RE_EndFrame(state.renderer);state.recursive=0;if ended is error then return ended end if;return frames
end function
