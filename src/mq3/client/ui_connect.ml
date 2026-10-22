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

struct Action boundary kind x y width height text style color asset value dispatched end struct
struct ClientState connState connectPacketCount servername updateInfoString messageString serverInfo end struct
struct DownloadInfo name percent downloaded total estimate copied transferRate rateText leftWidth end struct
struct State client realtime downloadName downloadSize downloadCount downloadTime lastConnState lastLoadingText actions retailActive cacheCalls end struct

function clientState(connState,connectPacketCount,servername,updateInfoString,messageString,serverInfo) return ClientState(connState,connectPacketCount,servername,updateInfoString,messageString,serverInfo) end function
function create(retailActive) return State(clientState(CA_DISCONNECTED,0,"","","",""),0,"",0,0,0,CA_UNINITIALIZED,"",[],retailActive,0) end function
function emit(state,kind,x,y,width,height,text,style,color,asset,value) item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive);state.actions=state.actions+[item];return item end function
function idiv(a,b)
  if b==0 then return error(7840,"ui connect integer divide by zero") end if;negative=(a<0)!=(b<0);aa=a;if aa<0 then aa=0-aa end if;bb=b;if bb<0 then bb=0-bb end if;value=numeric.quotient(aa,bb);if negative then return 0-value end if;return value
end function
function twoDigits(value) if value>=0 and value<10 then return "0"+str(value) end if;return str(value) end function

// UI_ReadableSize
function readableSize(value)
  gb=1024*1024*1024;mb=1024*1024;if value>gb then whole=idiv(value,gb);fraction=idiv(numeric.mul32(value%gb,100),gb);return str(whole)+"."+twoDigits(fraction)+" GB" else if value>mb then whole=idiv(value,mb);fraction=idiv(numeric.mul32(value%mb,100),mb);return str(whole)+"."+twoDigits(fraction)+" MB" else if value>1024 then return str(idiv(value,1024))+" KB" end if;return str(value)+" bytes"
end function

// UI_PrintTime
function printTime(time)
  seconds=idiv(time,1000);if seconds>3600 then return str(idiv(seconds,3600))+" hr "+str(idiv(seconds%3600,60))+" min" else if seconds>60 then return str(idiv(seconds,60))+" min "+str(seconds%60)+" sec" end if;return str(seconds)+" sec"
end function

function drawText(state,x,y,text,style,color) emit(state,"text",x,y,0,0,text,style,color,"",0);return text end function
function drawWrapped(state,x,y,width,height,text,style,color) emit(state,"wrapped-text",x,y,width,height,text,style,color,"",0);return text end function

// UI_DisplayDownloadInfo
function displayDownloadInfo(state,downloadName)
  left=DOWNLOAD_LEFT;drawText(state,8,128,"Downloading:","left-small-dropshadow","white");drawText(state,8,160,"Estimated time left:","left-small-dropshadow","white");drawText(state,8,224,"Transfer rate:","left-small-dropshadow","white")
  percent=-1;nameText=downloadName;if state.downloadSize>0 then percent=idiv(numeric.mul32(state.downloadCount,100),state.downloadSize);nameText=downloadName+" ("+str(percent)+"%)" end if;drawText(state,left,128,nameText,"left-small-dropshadow","white")
  downloaded=readableSize(state.downloadCount);total=readableSize(state.downloadSize);estimate="estimating";copied="("+downloaded+" of "+total+" copied)";rate=0;rateText=""
  if state.downloadCount<4096 or state.downloadTime==0 then drawText(state,left,160,estimate,"left-small-dropshadow","white");drawText(state,left,192,copied,"left-small-dropshadow","white") else elapsed=idiv(state.realtime-state.downloadTime,1000);if elapsed!=0 then rate=idiv(state.downloadCount,elapsed) end if;if state.downloadSize!=0 and rate!=0 then totalSeconds=idiv(state.downloadSize,rate);remaining=totalSeconds-idiv(idiv(state.downloadCount,1024)*totalSeconds,idiv(state.downloadSize,1024));estimate=printTime(remaining*1000);drawText(state,left,160,estimate,"left-small-dropshadow","white");drawText(state,left,192,copied,"left-small-dropshadow","white") else drawText(state,left,160,estimate,"left-small-dropshadow","white");if state.downloadSize!=0 then drawText(state,left,192,copied,"left-small-dropshadow","white") else copied="("+downloaded+" copied)";drawText(state,left,192,copied,"left-small-dropshadow","white") end if end if;if rate!=0 then rateText=readableSize(rate)+"/Sec";drawText(state,left,224,rateText,"left-small-dropshadow","white") end if end if
  return DownloadInfo(downloadName,percent,downloaded,total,estimate,copied,rate,rateText,left)
end function

function configure(state,client,realtime,downloadName,downloadSize,downloadCount,downloadTime) state.client=client;state.realtime=realtime;state.downloadName=downloadName;state.downloadSize=downloadSize;state.downloadCount=downloadCount;state.downloadTime=downloadTime;return state end function

// UI_DrawConnectScreen
function drawConnectScreen(state,overlay)
  state.actions=[];state.cacheCalls=state.cacheCalls+1;emit(state,"menu-cache",0,0,0,0,"","","","",0);if not overlay then emit(state,"background",0,0,640,480,"","white","white","menuback",0) end if;cstate=state.client;mapname=info.value(cstate.serverInfo,"mapname");if mapname!="" then drawText(state,320,16,"Loading "+mapname,"big-center-dropshadow","white") end if;drawText(state,320,64,"Connecting to "+cstate.servername,"center-small-dropshadow","menu-text");drawText(state,320,448,info.value(cstate.updateInfoString,"motd"),"center-small-dropshadow","menu-text");if cstate.connState<CA_CONNECTED then drawWrapped(state,320,192,630,20,cstate.messageString,"center-small-dropshadow","menu-text") end if;if state.lastConnState>cstate.connState then state.lastLoadingText="" end if;state.lastConnState=cstate.connState
  status="";if cstate.connState==CA_CONNECTING then status="Awaiting challenge..."+str(cstate.connectPacketCount) else if cstate.connState==CA_CHALLENGING then status="Awaiting connection..."+str(cstate.connectPacketCount) else if cstate.connState==CA_CONNECTED then if state.downloadName!="" then displayDownloadInfo(state,state.downloadName);return "download" end if;status="Awaiting gamestate..." else if cstate.connState==CA_LOADING then return "loading" else if cstate.connState==CA_PRIMED then return "primed" else return "none" end if;drawText(state,320,128,status,"center-small-dropshadow","white");return status
end function

// Adapter for original_ui_session.Services.connectFn when the shared host
// context owns this module's State as `connectScreen`.
function sessionDrawConnectScreen(context,overlay) if context==void or context.connectScreen==void then return error(7841,"ui connect session context is missing") end if;return drawConnectScreen(context.connectScreen,overlay) end function

// UI_KeyConnect
function keyConnect(state,key) if key!=K_ESCAPE then return false end if;emit(state,"execute",0,0,0,0,"disconnect\n","","","",EXEC_APPEND);return true end function
