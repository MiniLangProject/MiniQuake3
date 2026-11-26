// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client download block receiver from client/cl_parse.c.
package mq3.client.download
import mq3.qcommon.message as message

/// Maximum byte length accepted for a native network message.
const MAX_MSGLEN=16384
/// Stores download state, including `downloadSize`, `downloadBlock`, `download`, `downloadTempName`, `downloadName`, `downloadCount`.
struct State
  /// Expected total size in bytes of the active download.
  downloadSize
  /// Download-block number the client is currently waiting to receive.
  downloadBlock
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseDownload`
  /// during subsequent processing.
  download
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `parseDownload` during subsequent processing.
  downloadTempName
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `parseDownload` during subsequent processing.
  downloadName
  /// Number of bytes accumulated for the active download.
  downloadCount
end struct
/// Stores download host-service callbacks, including `cvarValueFn`, `cvarStringFn`, `reliableFn`, `openFn`, `writeFn`, `closeFn` and additional values.
struct Services
  /// Host callback for the cvar value operation; an unset callback leaves that host operation
  /// unavailable.
  cvarValueFn
  /// Host callback for the cvar string operation; an unset callback leaves that host operation
  /// unavailable.
  cvarStringFn
  /// Host callback for the reliable operation; an unset callback leaves that host operation
  /// unavailable.
  reliableFn
  /// Host callback for the open operation; an unset callback leaves that host operation unavailable.
  openFn
  /// Host callback for the write operation; an unset callback leaves that host operation unavailable.
  writeFn
  /// Host callback for the close operation; an unset callback leaves that host operation unavailable.
  closeFn
  /// Host callback for the rename operation; an unset callback leaves that host operation unavailable.
  renameFn
  /// Host callback for the packet operation; an unset callback leaves that host operation unavailable.
  packetFn
  /// Host callback for the next operation; an unset callback leaves that host operation unavailable.
  nextFn
  /// Host callback for the print operation; an unset callback leaves that host operation unavailable.
  printFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for server-directed file
  /// downloads.
  context
end struct

/// Creates a `mq3.client.download.State` record. Initializes the record with the defaults written in this constructor.
function create() return State(0,0,0,"","",0) end function
/// Creates a `mq3.client.download.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void,void,void,void,void,void) end function
/// Calls `service` from download `call`.
/// @param service Value used by `if service!=void then service(host,a,b) end if`.
/// @param host host record passed to the download helper calls.
/// @param a Value used by `if service!=void then service(host,a,b) end if`.
/// @param b Value used by `if service!=void then service(host,a,b) end if`.
function call(service,host,a,b) if service!=void then service(host,a,b) end if;return void end function

/// Updates `state.downloadSize`, `state.download`, `state.downloadBlock`, `state.downloadCount` and additional values during download `parseDownload`.
/// @param state Mutable download record/storage; this routine assigns `state.downloadSize`, `state.download`, `state.downloadBlock`, `state.downloadCount` and additional values.
/// @param host Record read through `host.cvarValueFn`, `host.printFn`, `host.reliableFn`, `host.openFn` and additional values.
/// @param msg Record read through `msg.readcount`, `msg.cursize`.
function parseDownload(state,host,msg)
  if state==void or host==void or msg==void then return error(6910,"download: missing state") end if
  block=message.readI16(msg)
  if msg.readcount>msg.cursize then return error(6911,"download: truncated block") end if
  if block==0 then
    state.downloadSize=message.readI32(msg)
    if host.cvarValueFn!=void then host.cvarValueFn(host,"cl_downloadSize",state.downloadSize) end if
    if state.downloadSize<0 then
      text=message.readCString(msg)
      if msg.readcount>msg.cursize then return error(6912,"download: truncated error text") end if
      return error(6913,text)
    end if
  end if
  size=message.readI16(msg)
  if msg.readcount>msg.cursize then return error(6914,"download: truncated size") end if
  if size<0 or size>MAX_MSGLEN then return error(6915,"download: invalid block size") end if
  data=bytes(0)
  if size>0 then data=message.readData(msg,size);if msg.readcount>msg.cursize then return error(6916,"download: truncated data") end if end if
  if state.downloadBlock!=block then return false end if
  if state.download==0 then
    if state.downloadTempName=="" then
      if host.printFn!=void then host.printFn(host,"unrequested","") end if
      if host.reliableFn!=void then host.reliableFn(host,"stopdl") end if
      return false
    end if
    if host.openFn==void then return error(6917,"download: missing file-open host") end if
    state.download=host.openFn(host,state.downloadTempName)
    if state.download==0 then
      if host.printFn!=void then host.printFn(host,"create",state.downloadTempName) end if
      if host.reliableFn!=void then host.reliableFn(host,"stopdl") end if
      if host.nextFn!=void then host.nextFn(host) end if
      return false
    end if
  end if
  if size!=0 then
    if host.writeFn==void then return error(6918,"download: missing file-write host") end if
    host.writeFn(host,data,size,state.download)
  end if
  if host.reliableFn!=void then host.reliableFn(host,"nextdl "+str(state.downloadBlock)) end if
  state.downloadBlock=state.downloadBlock+1;state.downloadCount=state.downloadCount+size
  if host.cvarValueFn!=void then host.cvarValueFn(host,"cl_downloadCount",state.downloadCount) end if
  if size==0 then
    if state.download!=0 then
      if host.closeFn!=void then host.closeFn(host,state.download) end if
      state.download=0
      if host.renameFn!=void then host.renameFn(host,state.downloadTempName,state.downloadName) end if
    end if
    state.downloadTempName="";state.downloadName=""
    if host.cvarStringFn!=void then host.cvarStringFn(host,"cl_downloadName","") end if
    if host.packetFn!=void then host.packetFn(host);host.packetFn(host) end if
    if host.nextFn!=void then host.nextFn(host) end if
  end if
  return true
end function
