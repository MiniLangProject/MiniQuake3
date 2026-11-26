// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_connect.c.
package mq3.client.ui_connect

import mq3.compat.numeric as numeric
import mq3.shared.info as info

const CA_UNINITIALIZED=0
const CA_DISCONNECTED=1
const CA_AUTHORIZING=2
const CA_CONNECTING=3
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_LOADING=6
const CA_PRIMED=7
const CA_ACTIVE=8
const CA_CINEMATIC=9
const K_ESCAPE=27
const EXEC_APPEND=2
const DOWNLOAD_LEFT=262

/// Stores UI connect queued engine action, including `boundary`, `kind`, `x`, `y`, `width`, `height` and additional values.
struct Action boundary kind x y width height text style color asset value dispatched end struct
/// Stores UI connect client state record, including `connState`, `connectPacketCount`, `servername`, `updateInfoString`, `messageString`, `serverInfo`.
struct ClientState connState connectPacketCount servername updateInfoString messageString serverInfo end struct
/// Stores UI connect download info record, including `name`, `percent`, `downloaded`, `total`, `estimate`, `copied` and additional values.
struct DownloadInfo name percent downloaded total estimate copied transferRate rateText leftWidth end struct
/// Stores UI connect state, including `client`, `realtime`, `downloadName`, `downloadSize`, `downloadCount`, `downloadTime` and additional values.
struct State client realtime downloadName downloadSize downloadCount downloadTime lastConnState lastLoadingText actions retailActive cacheCalls end struct

/// Creates a `mq3.client.ui_connect.ClientState` record. Assigns `connState` from `connState`, `connectPacketCount` from `connectPacketCount`, `servername` from `servername`, `updateInfoString` from `updateInfoString`.
/// @param connState Value used to initialize `ClientState.connState`.
/// @param connectPacketCount Value used to initialize `ClientState.connectPacketCount`.
/// @param servername Value used to initialize `ClientState.servername`.
/// @param updateInfoString Value used to initialize `ClientState.updateInfoString`.
/// @param messageString Value used to initialize `ClientState.messageString`.
/// @param serverInfo Value used to initialize `ClientState.serverInfo`.
function clientState(connState,connectPacketCount,servername,updateInfoString,messageString,serverInfo) return ClientState(connState,connectPacketCount,servername,updateInfoString,messageString,serverInfo) end function
/// Creates a `mq3.client.ui_connect.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(clientState(CA_DISCONNECTED,0,"","","",""),0,"",0,0,0,CA_UNINITIALIZED,"",[],retailActive,0) end function
/// Appends a UI connect action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI connect record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param width Width in the coordinate space used by `emit`.
/// @param height Height in the coordinate space used by `emit`.
/// @param text Text consumed or emitted by `emit` in the UI connect path.
/// @param style Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`.
/// @param color Color value used by the UI connect drawing or interpolation operation.
/// @param asset Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`.
/// @param value Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`.
function emit(state,kind,x,y,width,height,text,style,color,asset,value) item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive);state.actions=state.actions+[item];return item end function
/// Computes signed integer division through the MiniLang numeric compatibility helper.
/// @param a Value used by `negative=(a<0)!=(b<0)`.
/// @param b Value tested by `b==0` before the calculation continues.
function idiv(a,b)
  if b==0 then return error(7840,"ui connect integer divide by zero") end if;negative=(a<0)!=(b<0);aa=a;if aa<0 then aa=0-aa end if;bb=b;if bb<0 then bb=0-bb end if;value=numeric.quotient(aa,bb);if negative then return 0-value end if;return value
end function
/// Evaluates UI connect `twoDigits` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.
/// @param value Value tested by `value>=0 and value<10` before the calculation continues.
function twoDigits(value) if value>=0 and value<10 then return "0"+str(value) end if;return str(value) end function

// UI_ReadableSize
/// @param value Value tested by `value>gb`, `value>mb` and additional values before the calculation continues.
function readableSize(value)
  gb=1024*1024*1024;mb=1024*1024;if value>gb then whole=idiv(value,gb);fraction=idiv(numeric.mul32(value%gb,100),gb);return str(whole)+"."+twoDigits(fraction)+" GB" else if value>mb then whole=idiv(value,mb);fraction=idiv(numeric.mul32(value%mb,100),mb);return str(whole)+"."+twoDigits(fraction)+" MB" else if value>1024 then return str(idiv(value,1024))+" KB" end if;return str(value)+" bytes"
end function

// UI_PrintTime
/// @param time Value used by `seconds=idiv(time,1000)`.
function printTime(time)
  seconds=idiv(time,1000);if seconds>3600 then return str(idiv(seconds,3600))+" hr "+str(idiv(seconds%3600,60))+" min" else if seconds>60 then return str(idiv(seconds,60))+" min "+str(seconds%60)+" sec" end if;return str(seconds)+" sec"
end function

/// Calls `mq3.client.ui_connect.emit` from UI connect `drawText`. The final path returns `text`.
/// @param state Shared UI connect state passed to the helper calls in `drawText`.
/// @param x Horizontal coordinate in the coordinate space used by `drawText`.
/// @param y Vertical coordinate in the coordinate space used by `drawText`.
/// @param text Text consumed or emitted by `drawText` in the UI connect path.
/// @param style Value used by `emit(state,"text",x,y,0,0,text,style,color,"",0)`.
/// @param color Color value used by the UI connect drawing or interpolation operation.
function drawText(state,x,y,text,style,color) emit(state,"text",x,y,0,0,text,style,color,"",0);return text end function
/// Calls `mq3.client.ui_connect.emit` from UI connect `drawWrapped`. The final path returns `text`.
/// @param state Shared UI connect state passed to the helper calls in `drawWrapped`.
/// @param x Horizontal coordinate in the coordinate space used by `drawWrapped`.
/// @param y Vertical coordinate in the coordinate space used by `drawWrapped`.
/// @param width Width in the coordinate space used by `drawWrapped`.
/// @param height Height in the coordinate space used by `drawWrapped`.
/// @param text Text consumed or emitted by `drawWrapped` in the UI connect path.
/// @param style Value used by `emit(state,"wrapped-text",x,y,width,height,text,style,color,"",0)`.
/// @param color Color value used by the UI connect drawing or interpolation operation.
function drawWrapped(state,x,y,width,height,text,style,color) emit(state,"wrapped-text",x,y,width,height,text,style,color,"",0);return text end function

// UI_DisplayDownloadInfo
/// @param state Record read through `state.downloadSize`, `state.downloadCount`, `state.downloadTime`, `state.realtime`.
/// @param downloadName Value used by `nameText=downloadName`.
function displayDownloadInfo(state,downloadName)
  left=DOWNLOAD_LEFT;drawText(state,8,128,"Downloading:","left-small-dropshadow","white");drawText(state,8,160,"Estimated time left:","left-small-dropshadow","white");drawText(state,8,224,"Transfer rate:","left-small-dropshadow","white")
  percent=-1;nameText=downloadName;if state.downloadSize>0 then percent=idiv(numeric.mul32(state.downloadCount,100),state.downloadSize);nameText=downloadName+" ("+str(percent)+"%)" end if;drawText(state,left,128,nameText,"left-small-dropshadow","white")
  downloaded=readableSize(state.downloadCount);total=readableSize(state.downloadSize);estimate="estimating";copied="("+downloaded+" of "+total+" copied)";rate=0;rateText=""
  if state.downloadCount<4096 or state.downloadTime==0 then drawText(state,left,160,estimate,"left-small-dropshadow","white");drawText(state,left,192,copied,"left-small-dropshadow","white") else elapsed=idiv(state.realtime-state.downloadTime,1000);if elapsed!=0 then rate=idiv(state.downloadCount,elapsed) end if;if state.downloadSize!=0 and rate!=0 then totalSeconds=idiv(state.downloadSize,rate);remaining=totalSeconds-idiv(idiv(state.downloadCount,1024)*totalSeconds,idiv(state.downloadSize,1024));estimate=printTime(remaining*1000);drawText(state,left,160,estimate,"left-small-dropshadow","white");drawText(state,left,192,copied,"left-small-dropshadow","white") else drawText(state,left,160,estimate,"left-small-dropshadow","white");if state.downloadSize!=0 then drawText(state,left,192,copied,"left-small-dropshadow","white") else copied="("+downloaded+" copied)";drawText(state,left,192,copied,"left-small-dropshadow","white") end if end if;if rate!=0 then rateText=readableSize(rate)+"/Sec";drawText(state,left,224,rateText,"left-small-dropshadow","white") end if end if
  return DownloadInfo(downloadName,percent,downloaded,total,estimate,copied,rate,rateText,left)
end function

/// Updates `state.client`, `state.realtime`, `state.downloadName`, `state.downloadSize` and additional values during UI connect `configure`.
/// @param state Mutable UI connect record/storage; this routine assigns `state.client`, `state.realtime`, `state.downloadName`, `state.downloadSize` and additional values.
/// @param client Value assigned to `state.client`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param downloadName Value assigned to `state.downloadName`.
/// @param downloadSize Value assigned to `state.downloadSize`.
/// @param downloadCount Value assigned to `state.downloadCount`.
/// @param downloadTime Value assigned to `state.downloadTime`.
function configure(state,client,realtime,downloadName,downloadSize,downloadCount,downloadTime) state.client=client;state.realtime=realtime;state.downloadName=downloadName;state.downloadSize=downloadSize;state.downloadCount=downloadCount;state.downloadTime=downloadTime;return state end function

// UI_DrawConnectScreen
/// @param state Mutable UI connect record/storage; this routine assigns `state.actions`, `state.cacheCalls`, `state.lastLoadingText`, `state.lastConnState`.
/// @param overlay Value used by `if not overlay then emit(state,"background",0,0,640,480,"","white","white","menuback",0) end if`.
function drawConnectScreen(state,overlay)
  state.actions=[];state.cacheCalls=state.cacheCalls+1;emit(state,"menu-cache",0,0,0,0,"","","","",0);if not overlay then emit(state,"background",0,0,640,480,"","white","white","menuback",0) end if;cstate=state.client;mapname=info.value(cstate.serverInfo,"mapname");if mapname!="" then drawText(state,320,16,"Loading "+mapname,"big-center-dropshadow","white") end if;drawText(state,320,64,"Connecting to "+cstate.servername,"center-small-dropshadow","menu-text");drawText(state,320,448,info.value(cstate.updateInfoString,"motd"),"center-small-dropshadow","menu-text");if cstate.connState<CA_CONNECTED then drawWrapped(state,320,192,630,20,cstate.messageString,"center-small-dropshadow","menu-text") end if;if state.lastConnState>cstate.connState then state.lastLoadingText="" end if;state.lastConnState=cstate.connState
  status="";if cstate.connState==CA_CONNECTING then status="Awaiting challenge..."+str(cstate.connectPacketCount) else if cstate.connState==CA_CHALLENGING then status="Awaiting connection..."+str(cstate.connectPacketCount) else if cstate.connState==CA_CONNECTED then if state.downloadName!="" then displayDownloadInfo(state,state.downloadName);return "download" end if;status="Awaiting gamestate..." else if cstate.connState==CA_LOADING then return "loading" else if cstate.connState==CA_PRIMED then return "primed" else return "none" end if;drawText(state,320,128,status,"center-small-dropshadow","white");return status
end function

// Adapter for original_ui_session.Services.connectFn when the shared host
// context owns this module's State as `connectScreen`.
/// @param context Record read through `context.connectScreen`.
/// @param overlay Value used by `return drawConnectScreen(context.connectScreen,overlay)`.
function sessionDrawConnectScreen(context,overlay) if context==void or context.connectScreen==void then return error(7841,"ui connect session context is missing") end if;return drawConnectScreen(context.connectScreen,overlay) end function

// UI_KeyConnect
/// @param state Shared UI connect state passed to the helper calls in `keyConnect`.
/// @param key Key or control identifier used to select the corresponding UI connect entry.
function keyConnect(state,key) if key!=K_ESCAPE then return false end if;emit(state,"execute",0,0,0,0,"disconnect\n","","","",EXEC_APPEND);return true end function
