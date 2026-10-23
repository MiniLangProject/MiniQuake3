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

struct Services context registerShaderFn stopSoundsFn consoleFn fileTellFn diagnosticFn end struct
struct GraphSample value color end struct
struct State renderer lifecycle services vidWidth vidHeight charSetShader whiteShader initialized timegraph debuggraph debugMove graphheight graphscale graphshift graphCurrent graphValues connectionState realtime uiLoaded keyCatchers stereoEnabled demoRecording spDemoRecording demoName demoFile recursive currentStereo end struct

function fail(message) return error(7810,"cl_scrn: "+message) end function
function services(context) return Services(context,void,void,void,void,void) end function
function create(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader)
  if renderState==void then renderState=renderer.create(void,void,void,void) end if
  if host==void then host=services(void) end if
  values=[];for index=0 to 1023 values=values+[GraphSample(0.0,0)] end for
  return State(renderState,uiLifecycle,host,width,height,charSetShader,whiteShader,false,0,0,0,32,1,0,0,values,lifecycle.CA_DISCONNECTED,0,true,0,false,false,false,"",void,0,STEREO_CENTER)
end function
function emit(state,kind,value) if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if;return void end function
function color(index)
  table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]]
  return table[index&7]
end function
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function

// SCR_AdjustFrom640 -- independent x/y scaling is intentional Baseq3 behavior.
function SCR_AdjustFrom640(state,x,y,w,h)
  if state==void or state.vidWidth<=0 or state.vidHeight<=0 then return fail("invalid video configuration") end if
  xscale=state.vidWidth/SCREEN_WIDTH;yscale=state.vidHeight/SCREEN_HEIGHT
  if x!=void then x=x*xscale end if;if y!=void then y=y*yscale end if;if w!=void then w=w*xscale end if;if h!=void then h=h*yscale end if
  return [x,y,w,h]
end function
function draw(state,x,y,w,h,s1,t1,s2,t2,shader) return renderer.RE_StretchPic(state.renderer,x,y,w,h,s1,t1,s2,t2,shader) end function
function SCR_DrawNamedPic(state,x,y,width,height,picname)
  if width==0 then return fail("named picture width is zero") end if
  if state.services.registerShaderFn==void then return fail("shader registration service unavailable") end if
  shader=state.services.registerShaderFn(state.services.context,picname);value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return shader
end function
function SCR_FillRect(state,x,y,width,height,rgba)
  renderer.RE_SetColor(state.renderer,rgba);value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,0.0,0.0,state.whiteShader);renderer.RE_SetColor(state.renderer,void);return value
end function
function SCR_DrawPic(state,x,y,width,height,shader)
  value=SCR_AdjustFrom640(state,x,y,width,height);draw(state,value[0],value[1],value[2],value[3],0.0,0.0,1.0,1.0,shader);return value
end function
function SCR_DrawChar(state,x,y,size,ch)
  ch=ch&255;if ch==32 or y<0-size then return false end if
  value=SCR_AdjustFrom640(state,x,y,size,size);row=ch>>4;col=ch&15;frow=row*0.0625;fcol=col*0.0625
  return draw(state,value[0],value[1],value[2],value[3],fcol,frow,fcol+0.0625,frow+0.0625,state.charSetShader)
end function
function SCR_DrawSmallChar(state,x,y,ch)
  ch=ch&255;if ch==32 or y<0-SMALLCHAR_HEIGHT then return false end if
  row=ch>>4;col=ch&15;frow=row*0.0625;fcol=col*0.0625
  return draw(state,x,y,SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT,fcol,frow,fcol+0.0625,frow+0.0625,state.charSetShader)
end function
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
function SCR_DrawBigString(state,x,y,text,alpha) return SCR_DrawStringExt(state,x,y,BIGCHAR_WIDTH,text,[1.0,1.0,1.0,alpha],false) end function
function SCR_DrawBigStringColor(state,x,y,text,rgba) return SCR_DrawStringExt(state,x,y,BIGCHAR_WIDTH,text,rgba,true) end function
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
function SCR_Strlen(text)
  data=bytes(text);index=0;count=0;while index<len(data) if isColor(data,index) then index=index+2 else count=count+1;index=index+1 end if end while;return count
end function
function SCR_GetBigStringWidth(text) return SCR_Strlen(text)*BIGCHAR_WIDTH end function

function SCR_DrawDemoRecording(state)
  if not state.demoRecording or state.spDemoRecording then return false end if
  pos=0;if state.services.fileTellFn!=void then pos=state.services.fileTellFn(state.services.context,state.demoFile) end if
  text="RECORDING "+state.demoName+": "+str(n.quotient(pos,1024))+"k";SCR_DrawStringExt(state,320-len(bytes(text))*4,20,8,text,color(7),true);return text
end function
function SCR_DebugGraph(state,value,colorIndex)
  index=state.graphCurrent&1023;state.graphValues[index].value=value;state.graphValues[index].color=colorIndex;state.graphCurrent=state.graphCurrent+1;return index
end function
function SCR_DrawDebugGraph(state)
  w=state.vidWidth;x=0;y=state.vidHeight;renderer.RE_SetColor(state.renderer,color(0));draw(state,x,y-state.graphheight,w,state.graphheight,0.0,0.0,0.0,0.0,state.whiteShader);renderer.RE_SetColor(state.renderer,void)
  columns=0;for a=0 to w-1
    index=(state.graphCurrent-1-a+1024)&1023;v=state.graphValues[index].value*state.graphscale+state.graphshift
    if v<0 then v=v+state.graphheight*(1+n.trunc32((0-v)/state.graphheight)) end if;h=n.trunc32(v)%state.graphheight
    draw(state,x+w-1-a,y-h,1,h,0.0,0.0,0.0,0.0,state.whiteShader);columns=columns+1
  end for;return columns
end function
function SCR_Init(state)
  if state==void then return fail("state is required") end if;state.timegraph=0;state.debuggraph=0;state.graphheight=32;state.graphscale=1;state.graphshift=0;state.initialized=true;return true
end function

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
function SCR_UpdateScreen(state)
  if state==void or not state.initialized then return false end if
  state.recursive=state.recursive+1;if state.recursive>2 then state.recursive=0;return fail("SCR_UpdateScreen: recursively called") end if;state.recursive=1
  frames=[]
  if state.stereoEnabled then left=SCR_DrawScreenField(state,STEREO_LEFT);if left is error then state.recursive=0;return left end if;frames=frames+[left];right=SCR_DrawScreenField(state,STEREO_RIGHT);if right is error then state.recursive=0;return right end if;frames=frames+[right]
  else center=SCR_DrawScreenField(state,STEREO_CENTER);if center is error then state.recursive=0;return center end if;frames=[center] end if
  ended=renderer.RE_EndFrame(state.renderer);state.recursive=0;if ended is error then return ended end if;return frames
end function
