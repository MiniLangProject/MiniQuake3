// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 server download window from SV_WriteDownloadToClient/SV_NextDownload_f.
package mq3.server.download
import mq3.qcommon.message as message
import mq3.qcommon.command_buffer as commandBuffer
import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers

const MAX_DOWNLOAD_WINDOW=8
const MAX_DOWNLOAD_BLKSIZE=2048
const SVC_DOWNLOAD=6
const MAX_QPATH=64

/// State record for server.download, containing `name`, `handle`, `size`, `count`, `clientBlock`, `currentBlock`, and 7 further fields.
struct State name handle size count clientBlock currentBlock xmitBlock blocks blockSizes eof sendTime rate snapshotMsec end struct
/// Create `mq3.server.download.State` with name=name; handle=void; size=0; count=0; 9 further fields.
/// @param name Initial `name` field stored in the returned or constructed `mq3.server.download.State` record.
/// @param rate Initial `rate` field stored in the returned or constructed `mq3.server.download.State` record.
/// @param snapshotMsec Initial `snapshotMsec` field stored in the returned or constructed `mq3.server.download.State` record.
function create(name,rate,snapshotMsec)
  return State(name,void,0,0,0,0,0,array(MAX_DOWNLOAD_WINDOW,void),array(MAX_DOWNLOAD_WINDOW,0),false,0,rate,snapshotMsec)
end function
/// Server record for server.download, containing `time`, `allowDownload`, `pure`, `maxRate`.
struct Server time allowDownload pure maxRate end struct
/// Create `mq3.server.download.Server` with time=time; allowDownload=allowDownload; pure=pure; maxRate=maxRate.
/// @param time Initial `time` field stored in the returned or constructed `mq3.server.download.Server` record.
/// @param allowDownload Initial `allowDownload` field stored in the returned or constructed `mq3.server.download.Server` record.
/// @param pure Initial `pure` field stored in the returned or constructed `mq3.server.download.Server` record.
/// @param maxRate Initial `maxRate` field stored in the returned or constructed `mq3.server.download.Server` record.
function server(time,allowDownload,pure,maxRate) return Server(time,allowDownload,pure,maxRate) end function
/// Services record for server.download, containing `idPakFn`, `openFn`, `readFn`, `closeFn`, `dropFn`, `context`.
struct Services idPakFn openFn readFn closeFn dropFn context end struct
/// Create `mq3.server.download.Services` with idPakFn=idPakFn; openFn=openFn; readFn=readFn; closeFn=closeFn; dropFn=dropFn; context=context.
/// @param idPakFn Initial `idPakFn` field stored in the returned or constructed `mq3.server.download.Services` record.
/// @param openFn Initial `openFn` field stored in the returned or constructed `mq3.server.download.Services` record.
/// @param readFn Initial `readFn` field stored in the returned or constructed `mq3.server.download.Services` record.
/// @param closeFn Initial `closeFn` field stored in the returned or constructed `mq3.server.download.Services` record.
/// @param dropFn Initial `dropFn` field stored in the returned or constructed `mq3.server.download.Services` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.download.Services` record.
function services(idPakFn,openFn,readFn,closeFn,dropFn,context) return Services(idPakFn,openFn,readFn,closeFn,dropFn,context) end function

// Adapter for the four download builtins in SV_ExecuteClientCommand.  Keeping
// it next to the window state makes the reliable command path and the snapshot
// writer operate on the same live download cursor.
struct CommandRuntime state serverState downloadHost sendGamestateFn context end struct
/// Create `mq3.server.download.CommandRuntime` with state=state; serverState=serverState; downloadHost=downloadHost; sendGamestateFn=sendGamestateFn; context=context.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record.
/// @param serverState Initial `serverState` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record.
/// @param downloadHost Initial `downloadHost` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record.
/// @param sendGamestateFn Initial `sendGamestateFn` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record.
function commandRuntime(state,serverState,downloadHost,sendGamestateFn,context)
  return CommandRuntime(state,serverState,downloadHost,sendGamestateFn,context)
end function

/// Close download in server.download; updates `state.handle`, `state.name`.
///
/// Direct state writes: `state.handle`, `state.name`.
/// @param state Record exposing `handle`, `blocks`, `blockSizes`. Updated in place: `handle`, `name`.
/// @param host Record exposing `closeFn`.
function close(state,host)
  if state.handle!=void and host!=void and host.closeFn!=void then host.closeFn(host,state.handle) end if
  state.handle=void;state.name=""
  for index=0 to MAX_DOWNLOAD_WINDOW-1 state.blocks[index]=bytes(0,0);state.blockSizes[index]=0 end for
  return void
end function

/// Compute qpath in server.download; the normal completion returns `decode(slice(data, 0, count))`.
/// @param name Name used in `bytes(name)`.
function qpath(name)
  data=bytes(name);count=len(data);if count>=MAX_QPATH then count=MAX_QPATH-1 end if
  return decode(slice(data,0,count))
end function

/// Begin download in server.download; updates `state.name`.
///
/// Validation failures include `download command: missing state or host`.
/// Direct state writes: `state.name`.
/// @param state Updated in place: `name`.
/// @param host Host passed as `host` to `mq3.server.download.close`.
/// @param name Name passed as `name` to `mq3.server.download.qpath`.
function beginDownload(state,host,name)
  if state==void or host==void then return error(6916,"download command: missing state or host") end if
  close(state,host);state.name=qpath(name);return void
end function

/// Stop download in server.download.
///
/// Validation failures include `download command: missing state or host`.
/// @param state State passed as `state` to `mq3.server.download.close`.
/// @param host Host passed as `host` to `mq3.server.download.close`.
function stopDownload(state,host)
  if state==void or host==void then return error(6916,"download command: missing state or host") end if
  close(state,host);return void
end function

/// Compute done download in server.download.
///
/// Validation failures include `download command: missing runtime`.
/// @param runtime Record exposing `sendGamestateFn`.
/// @param clientState Client state used in `runtime.sendGamestateFn(runtime, clientState)`.
function doneDownload(runtime,clientState)
  if runtime==void then return error(6916,"download command: missing runtime") end if
  if runtime.sendGamestateFn!=void then runtime.sendGamestateFn(runtime,clientState) end if
  return void
end function

// Signature-compatible with client_command_dispatch.Services.downloadFn.
/// @param dispatchHost Record exposing `downloadContext`.
/// @param clientState Client state passed as `clientState` to `mq3.server.download.doneDownload`.
/// @param name Name used in `(name == "nextdl")` and `(name == "stopdl")`.
/// @param parser State passed as `state` to `mq3.qcommon.command_buffer.argv`.
function dispatchCommand(dispatchHost,clientState,name,parser)
  if dispatchHost==void or not (dispatchHost.downloadContext is CommandRuntime) then return error(6916,"download command: missing binding") end if
  runtime=dispatchHost.downloadContext
  if name=="download" then return beginDownload(runtime.state,runtime.downloadHost,commandBuffer.argv(parser,1)) end if
  if name=="nextdl" then return acknowledge(runtime.state,runtime.serverState,runtime.downloadHost,textnumbers.atoi(commandBuffer.argv(parser,1))) end if
  if name=="stopdl" then return stopDownload(runtime.state,runtime.downloadHost) end if
  if name=="donedl" then return doneDownload(runtime,clientState) end if
  return error(6916,"download command: unsupported builtin "+name)
end function

/// Compute failure text in server.download; the normal completion returns `(("File \"" + state.name) + "\" not found on server for autodownloading.\n")`.
/// @param state Record exposing `name`.
/// @param serverState Record exposing `allowDownload`, `pure`.
/// @param idPack Id pack operand used by `failureText`; its reads are shown in the implementation.
/// @param missionPack Mission pack operand used by `failureText`; its reads are shown in the implementation.
function failureText(state,serverState,idPack,missionPack)
  if idPack then
    if missionPack then return "Cannot autodownload Team Arena file \""+state.name+"\"\nThe Team Arena mission pack can be found in your local game store." end if
    return "Cannot autodownload id pk3 file \""+state.name+"\""
  end if
  if not serverState.allowDownload then
    if serverState.pure then return "Could not download \""+state.name+"\" because autodownloading is disabled on the server.\n\nYou will need to get this file elsewhere before you can connect to this pure server.\n" end if
    return "Could not download \""+state.name+"\" because autodownloading is disabled on the server.\n\nThe server you are connecting to is not a pure server, set autodownload to No in your settings and you might be able to join the game anyway.\n"
  end if
  return "File \""+state.name+"\" not found on server for autodownloading.\n"
end function

/// Open if needed in server.download; the normal completion returns `true`.
///
/// Validation failures include `download: missing filesystem service`.
/// Direct state writes: `state.name`, `state.handle`, `state.size`, `state.currentBlock`, `state.clientBlock`, `state.xmitBlock`, `state.count`, `state.eof`.
/// @param state Record exposing `handle`, `name`. Updated in place: `name`, `handle`, `size`, `currentBlock`, `clientBlock`, `xmitBlock` and further fields.
/// @param serverState Record exposing `allowDownload`.
/// @param host Record exposing `idPakFn`, `openFn`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
function openIfNeeded(state,serverState,host,msg)
  if state.handle!=void then return true end if
  if host==void or host.idPakFn==void or host.openFn==void then return error(6910,"download: missing filesystem service") end if
  mission=host.idPakFn(host,state.name,"missionpack");idPack=mission or host.idPakFn(host,state.name,"baseq3");opened=void
  if serverState.allowDownload and not idPack then opened=host.openFn(host,state.name) end if
  if opened==void or len(opened)<2 or opened[1]<=0 then
    message.writeByte(msg,SVC_DOWNLOAD);message.writeShort(msg,0);message.writeLong(msg,-1);message.writeString(msg,failureText(state,serverState,idPack,mission));state.name="";return false
  end if
  state.handle=opened[0];state.size=opened[1];state.currentBlock=0;state.clientBlock=0;state.xmitBlock=0;state.count=0;state.eof=false
  return true
end function

/// Compute block count in server.download; the normal completion returns `count`.
/// @param state Record exposing `rate`, `snapshotMsec`.
/// @param maxRate Max rate used in `(maxRate != 0)` and `(maxRate < 1000)`.
function blockCount(state,maxRate)
  rate=state.rate
  if maxRate!=0 then if maxRate<1000 then maxRate=1000 end if;if maxRate<rate then rate=maxRate end if end if
  if rate==0 then return 1 end if
  count=numeric.trunc32(((rate*state.snapshotMsec)/1000+MAX_DOWNLOAD_BLKSIZE)/MAX_DOWNLOAD_BLKSIZE)
  if count<0 then return 1 end if
  return count
end function

/// Write to client in server.download; the normal completion returns `written`.
///
/// Direct state writes: `state.count`, `state.currentBlock`, `state.eof`, `state.xmitBlock`, `state.sendTime`.
/// @param state Record exposing `name`, `currentBlock`, `clientBlock`, `size`, `count`, `handle`, `blocks` and further fields. Updated in place: `count`, `currentBlock`, `eof`, `xmitBlock`, `sendTime`.
/// @param serverState Record exposing `maxRate`, `time`.
/// @param host Record exposing `readFn`.
/// @param msg Msg passed as `msg` to `mq3.server.download.openIfNeeded`.
function writeToClient(state,serverState,host,msg)
  if state.name=="" then return 0 end if
  if not openIfNeeded(state,serverState,host,msg) then return 1 end if
  while state.currentBlock-state.clientBlock<MAX_DOWNLOAD_WINDOW and state.size!=state.count
    index=state.currentBlock%MAX_DOWNLOAD_WINDOW;chunk=host.readFn(host,state.handle,MAX_DOWNLOAD_BLKSIZE)
    if chunk==void then state.count=state.size;break end if
    state.blocks[index]=chunk;state.blockSizes[index]=len(chunk);state.count=state.count+len(chunk);state.currentBlock=state.currentBlock+1
  end while
  if state.count==state.size and not state.eof and state.currentBlock-state.clientBlock<MAX_DOWNLOAD_WINDOW then
    state.blockSizes[state.currentBlock%MAX_DOWNLOAD_WINDOW]=0;state.currentBlock=state.currentBlock+1;state.eof=true
  end if
  remaining=blockCount(state,serverState.maxRate);written=0
  while remaining>0
    if state.clientBlock==state.currentBlock then return written end if
    if state.xmitBlock==state.currentBlock then
      if serverState.time-state.sendTime>1000 then state.xmitBlock=state.clientBlock else return written end if
    end if
    index=state.xmitBlock%MAX_DOWNLOAD_WINDOW;message.writeByte(msg,SVC_DOWNLOAD);message.writeShort(msg,state.xmitBlock)
    if state.xmitBlock==0 then message.writeLong(msg,state.size) end if
    size=state.blockSizes[index];message.writeShort(msg,size)
    if size>0 then message.writeData(msg,state.blocks[index]) end if
    state.xmitBlock=state.xmitBlock+1;state.sendTime=serverState.time;written=written+1;remaining=remaining-1
  end while
  return written
end function

/// Update `state.sendTime`, `state.clientBlock` in server.download; the normal completion returns `true`.
///
/// Direct state writes: `state.sendTime`, `state.clientBlock`.
/// @param state Record exposing `clientBlock`, `blockSizes`. Updated in place: `sendTime`, `clientBlock`.
/// @param serverState Record exposing `time`.
/// @param host Record exposing `dropFn`.
/// @param block Block used in `(block != state.clientBlock)`.
function acknowledge(state,serverState,host,block)
  if block!=state.clientBlock then if host!=void and host.dropFn!=void then host.dropFn(host,state,"broken download") end if;return false end if
  if state.blockSizes[state.clientBlock%MAX_DOWNLOAD_WINDOW]==0 then close(state,host);return true end if
  state.sendTime=serverState.time;state.clientBlock=state.clientBlock+1;return true
end function
