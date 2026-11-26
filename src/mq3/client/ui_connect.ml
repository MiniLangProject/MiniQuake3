// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_connect.c.
package mq3.client.ui_connect

import mq3.compat.numeric as numeric
import mq3.shared.info as info

/// Client connection state before the client subsystem has been initialized.
const CA_UNINITIALIZED=0
/// Client connection state with no active server connection.
const CA_DISCONNECTED=1
/// Client connection state while waiting for authorization to contact the server.
const CA_AUTHORIZING=2
/// Client connection state while requesting a challenge from the server.
const CA_CONNECTING=3
/// Client connection state while replying to the server challenge and requesting connection.
const CA_CHALLENGING=4
/// Connection-state value for a completed handshake before game-state loading, defined for displaying
/// the current connection and loading stage.
const CA_CONNECTED=5
/// Client connection state while level media and game state are being loaded.
const CA_LOADING=6
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Native connection-state value for fully active gameplay, retained alongside the connection screen's
/// loading-state definitions.
const CA_ACTIVE=8
/// Client connection state used for fullscreen cinematic playback.
const CA_CINEMATIC=9
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
/// Console execution mode that appends text to the pending command buffer.
const EXEC_APPEND=2
/// Horizontal anchor used to position the download-progress text.
const DOWNLOAD_LEFT=262

/// Stores UI connect queued engine action, including `boundary`, `kind`, `x`, `y`, `width`, `height` and additional values.
struct Action
  /// Host service category recorded with a request emitted while drawing connection status and download
  /// progress.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while drawing connection
  /// status and download progress.
  kind
  /// Horizontal position of this queued drawing operation in the virtual layout used by the connection
  /// and download-progress screen.
  x
  /// Vertical position of this queued drawing operation in the virtual layout used by the connection
  /// and download-progress screen.
  y
  /// Width of the image or rectangle drawn on the connection and download screen.
  width
  /// Height of the image or rectangle drawn on the connection and download screen.
  height
  /// Connection or download message to draw, or command text such as the disconnect request issued from
  /// the connection screen.
  text
  /// UI drawing-style flags controlling alignment, font selection, and text emphasis.
  style
  /// Optional RGBA tint for the connection-screen drawing request.
  color
  /// When constructing this record, `emit` supplies `asset` for this member.
  asset
  /// Value payload supplied to the selected host operation while drawing connection status and download
  /// progress.
  value
  /// True when this request is marked for native dispatch while drawing connection status and download
  /// progress; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI connect client state record, including `connState`, `connectPacketCount`, `servername`, `updateInfoString`, `messageString`, `serverInfo`.
struct ClientState
  /// When constructing this record, `clientState` supplies `connState` for this member.
  connState
  /// Number of connection-handshake packets sent, also used by progress displays.
  connectPacketCount
  /// When constructing this record, `clientState` supplies `servername` for this member.
  servername
  /// When constructing this record, `clientState` supplies `updateInfoString` for this member.
  updateInfoString
  /// When constructing this record, `clientState` supplies `messageString` for this member.
  messageString
  /// When constructing this record, `clientState` supplies `serverInfo` for this member.
  serverInfo
end struct
/// Stores UI connect download info record, including `name`, `percent`, `downloaded`, `total`, `estimate`, `copied` and additional values.
struct DownloadInfo
  /// Virtual filename of the package or file currently being downloaded.
  name
  /// When constructing this record, `displayDownloadInfo` supplies `percent` for this member.
  percent
  /// When constructing this record, `displayDownloadInfo` supplies `downloaded` for this member.
  downloaded
  /// When constructing this record, `displayDownloadInfo` supplies `total` for this member.
  total
  /// When constructing this record, `displayDownloadInfo` supplies `estimate` for this member.
  estimate
  /// When constructing this record, `displayDownloadInfo` supplies `copied` for this member.
  copied
  /// When constructing this record, `displayDownloadInfo` supplies `rate` for this member.
  transferRate
  /// When constructing this record, `displayDownloadInfo` supplies `rateText` for this member.
  rateText
  /// When constructing this record, `displayDownloadInfo` supplies `left` for this member.
  leftWidth
end struct
/// Stores UI connect state, including `client`, `realtime`, `downloadName`, `downloadSize`, `downloadCount`, `downloadTime` and additional values.
struct State
  /// Player slot associated with this score or client-side record.
  client
  /// Current UI clock in milliseconds used to derive download rate and remaining-time estimates.
  realtime
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `configure` and `drawConnectScreen` during subsequent processing.
  downloadName
  /// Expected total size in bytes of the active download.
  downloadSize
  /// Number of bytes accumulated for the active download.
  downloadCount
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `displayDownloadInfo` and `configure` during subsequent processing.
  downloadTime
  /// When constructing this record, `create` supplies `CA_UNINITIALIZED` for this member. Used by
  /// `drawConnectScreen` during subsequent processing.
  lastConnState
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `drawConnectScreen` during subsequent processing.
  lastLoadingText
  /// Host requests queued while drawing connection status and download progress, retained in request
  /// order.
  actions
  /// True when the retail QVM owns the connection and download-progress screen, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
  /// When constructing this record, `create` supplies `0` for this member. Used by `drawConnectScreen`
  /// during subsequent processing.
  cacheCalls
end struct

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
