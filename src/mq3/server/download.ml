// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 server download window from SV_WriteDownloadToClient/SV_NextDownload_f.
package mq3.server.download
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric

const MAX_DOWNLOAD_WINDOW=8
const MAX_DOWNLOAD_BLKSIZE=2048
const SVC_DOWNLOAD=6

struct State name handle size count clientBlock currentBlock xmitBlock blocks blockSizes eof sendTime rate snapshotMsec end struct
function create(name,rate,snapshotMsec)
  return State(name,void,0,0,0,0,0,array(MAX_DOWNLOAD_WINDOW,void),array(MAX_DOWNLOAD_WINDOW,0),false,0,rate,snapshotMsec)
end function
struct Server time allowDownload pure maxRate end struct
function server(time,allowDownload,pure,maxRate) return Server(time,allowDownload,pure,maxRate) end function
struct Services idPakFn openFn readFn closeFn dropFn context end struct
function services(idPakFn,openFn,readFn,closeFn,dropFn,context) return Services(idPakFn,openFn,readFn,closeFn,dropFn,context) end function

function close(state,host)
  if state.handle!=void and host!=void and host.closeFn!=void then host.closeFn(host,state.handle) end if
  state.handle=void;state.name=""
  for index=0 to MAX_DOWNLOAD_WINDOW-1 state.blocks[index]=bytes(0,0);state.blockSizes[index]=0 end for
  return void
end function

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

function blockCount(state,maxRate)
  rate=state.rate
  if maxRate!=0 then if maxRate<1000 then maxRate=1000 end if;if maxRate<rate then rate=maxRate end if end if
  if rate==0 then return 1 end if
  count=numeric.trunc32(((rate*state.snapshotMsec)/1000+MAX_DOWNLOAD_BLKSIZE)/MAX_DOWNLOAD_BLKSIZE)
  if count<0 then return 1 end if
  return count
end function

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

function acknowledge(state,serverState,host,block)
  if block!=state.clientBlock then if host!=void and host.dropFn!=void then host.dropFn(host,state,"broken download") end if;return false end if
  if state.blockSizes[state.clientBlock%MAX_DOWNLOAD_WINDOW]==0 then close(state,host);return true end if
  state.sendTime=serverState.time;state.clientBlock=state.clientBlock+1;return true
end function
