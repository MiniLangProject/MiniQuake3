// SPDX-License-Identifier: GPL-2.0-or-later
// Read normal Quake III protocol-68 demos through the live client parser.
package mq3.client.demo_playback

import mq3.client.demo as demo
import mq3.client.protocol_runtime as protocolRuntime
import mq3.client.server_stream as serverStream
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3
import mq3.platform.file as file
import mq3.qcommon.message as message
import std.fs as fs
import std.string as strings

/// Filename suffix used for demos encoded with this client's network protocol version.
const EXTENSION=".dm_68"
/// Capacity limit for the archived demo collection or bounded storage used by this client module.
const MAX_ARCHIVED_DEMO=64*1024*1024
/// Capacity limit for the start packets collection or bounded storage used by this client module.
const MAX_START_PACKETS=1024
/// Capacity limit for the frame packets collection or bounded storage used by this client module.
const MAX_FRAME_PACKETS=128

/// Stores demo playback playback record, including `protocol`, `mapName`, `completed`, `handle`, `archiveData`, `offset` and additional values.
struct Playback
  /// Network protocol version advertised or required by the client connection.
  protocol
  /// Map name extracted from the demo's initial game state.
  mapName
  /// When constructing this record, `open` supplies `false` for this member. Used by `close` and
  /// `advance` during subsequent processing.
  completed
  /// When constructing this record, `open` supplies `handle` for this member. Used by `close` and
  /// `read` during subsequent processing.
  handle
  /// When constructing this record, `open` supplies `archiveData` for this member. Used by `close` and
  /// `read` during subsequent processing.
  archiveData
  /// When constructing this record, `open` supplies `0` for this member. Used by `read` during
  /// subsequent processing.
  offset
  /// When constructing this record, `open` supplies `bytes(8,0)` for this member. Used by `readPacket`
  /// during subsequent processing.
  header
  /// When constructing this record, `open` supplies `payload` for this member. Used by `readPacket`
  /// during subsequent processing.
  payload
  /// When constructing this record, `open` supplies `bytes(4,0)` for this member. Used by `read` during
  /// subsequent processing.
  transferred
  /// When constructing this record, `open` supplies
  /// `message.initStorage(payload,demo.MAX_MSGLEN,false)` for this member. Used by `readPacket` during
  /// subsequent processing.
  msg
end struct

/// Creates the demo playback error `6928` with diagnostic text `"demo playback: "+reason`.
/// @param reason Argument 2 of `error`; passed as `"demo playback: "+reason`.
function fail(reason) return error(6928,"demo playback: "+reason) end function

/// Calls `std.string.toLowerAscii`, `std.string.endsWith` from demo playback `filename`. The final path returns `name+EXTENSION`.
/// @param name Name used to select or register the corresponding demo playback resource.
function filename(name)
  raw=bytes(name)
  if len(raw)==0 or len(raw)>128 or raw[0]==46 or raw[len(raw)-1]==32 or raw[len(raw)-1]==46 then return void end if
  for each ch in raw
    if ch<32 or ch==34 or ch==42 or ch==47 or ch==58 or ch==60 or ch==62 or ch==63 or ch==92 or ch==124 then return void end if
  end for
  lower=strings.toLowerAscii(name)
  if strings.endsWith(lower,EXTENSION) then return name end if
  return name+EXTENSION
end function

/// Updates `playback.handle`, `playback.archiveData`, `playback.completed` during demo playback `close`.
/// @param playback Mutable demo playback record/storage; this routine assigns `playback.handle`, `playback.archiveData`, `playback.completed`.
function close(playback)
  if playback==void then return void end if
  if playback.handle!=-1 then file.CloseHandle(playback.handle);playback.handle=-1 end if
  playback.archiveData=void
  playback.completed=true
  return void
end function

/// Updates `playback.offset` during demo playback `read`.
/// @param playback Mutable demo playback record/storage; this routine assigns `playback.offset`.
/// @param output Value used by `if not file.ReadFile(playback.handle,nativeBytesPtr(output),count,playback.transferred,0) then return fail("could not read demo data") end if`.
/// @param count Value tested by `not file.ReadFile(playback.handle,nativeBytesPtr(output),count,playback.transferred,0)`, `count>available` and additional values before the calculation continues.
function read(playback,output,count)
  if playback.handle!=-1 then
    if not file.ReadFile(playback.handle,nativeBytesPtr(output),count,playback.transferred,0) then return fail("could not read demo data") end if
    return n.readU32(playback.transferred,0)
  end if
  available=len(playback.archiveData)-playback.offset
  if count>available then count=available end if
  if count>0 then
    copyBytes(output,0,playback.archiveData,playback.offset,count)
    playback.offset=playback.offset+count
  end if
  return count
end function

/// Updates `playback.msg.cursize` during demo playback `readPacket`.
/// @param playback Mutable demo playback record/storage; this routine assigns `playback.msg.cursize`.
/// @param realtime Current client real-time clock in milliseconds.
function readPacket(playback,realtime)
  amount=try(read(playback,playback.header,8));if amount is error then return amount end if
  if amount==0 then close(playback);return false end if
  if amount!=8 then return fail("truncated message header") end if

  length=n.readI32(playback.header,4)
  if length==-1 then close(playback);return false end if
  if length<=0 or length>demo.MAX_MSGLEN then return fail("invalid message length") end if
  amount=try(read(playback,playback.payload,length));if amount is error then return amount end if
  if amount!=length then return fail("truncated message body") end if

  sequence=n.readI32(playback.header,0)
  dispatcher=playback.protocol.dispatcher
  if sequence<0 then return fail("invalid message sequence") end if
  dispatcher.snapshotState.serverMessageSequence=sequence
  dispatcher.snapshotState.realtime=realtime
  playback.msg.cursize=length;message.beginReading(playback.msg)
  parsed=try(protocolRuntime.parse(playback.protocol,playback.msg))
  if parsed is error then return parsed end if
  return true
end function

/// Updates `playback.mapName` during demo playback `updateMap`.
/// @param playback Mutable demo playback record/storage; this routine assigns `playback.mapName`.
function updateMap(playback)
  mapName=try(serverStream.mapName(playback.protocol))
  if mapName is error then return mapName end if
  if mapName=="" or len(bytes(mapName))>55 then return fail("invalid demo map name") end if
  playback.mapName=mapName
  return true
end function

/// Calls `std.fs.joinPath`, `std.fs.isFile` from demo playback `loosePath`. The final path returns `path`.
/// @param dataRoot Value used by `if dataRoot=="" then return "" end if`.
/// @param leaf Value used by `path=fs.joinPath(fs.joinPath(dataRoot,"demos"),leaf)`.
function loosePath(dataRoot,leaf)
  if dataRoot=="" then return "" end if
  path=fs.joinPath(fs.joinPath(dataRoot,"demos"),leaf)
  if fs.isFile(path) then return path end if
  return ""
end function

/// Calls `mq3.client.demo_playback.filename`, `mq3.format.pk3.findEntry`, `mq3.client.demo_playback.loosePath` and additional helpers from demo playback `open`.
/// @param dataRoot Value used by `mounted=archive!=void and archive.modArchive!=void and dataRoot!=""`.
/// @param archive Opened game archive supplying maps, models, textures or other assets. Record read through `archive.modArchive`.
/// @param name Name used to select or register the corresponding demo playback resource.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function open(dataRoot,archive,name,now)
  leaf=filename(name)
  if leaf==void then return fail("invalid demo filename") end if
  relative="demos/"+leaf
  mounted=archive!=void and archive.modArchive!=void and dataRoot!=""
  active=archive
  if mounted then active=archive.modArchive end if
  entry=pk3.findEntry(active,relative)
  path=""
  if entry==void then
    path=loosePath(dataRoot,leaf)
    if path=="" and mounted then
      entry=pk3.findEntry(archive,relative)
      if entry==void then path=loosePath(fs.joinPath(fs.joinPath(dataRoot,".."),"baseq3"),leaf) end if
    end if
  end if
  if entry!=void and entry.sourceDirectoryOffset==-1 then path=entry.sourcePath end if

  handle=-1;archiveData=void
  if path!="" then
    handle=file.CreateFileW(path,0x80000000,1,0,3,0x08000080,0)
    if handle==-1 then return fail("cannot open "+relative) end if
  else
    if entry==void then return fail(relative+" was not found") end if
    if entry.size>MAX_ARCHIVED_DEMO then return fail("archived demo exceeds 64 MiB") end if
    archiveData=try(pk3.readEntry(archive,entry))
    if archiveData is error then return archiveData end if
  end if

  payload=bytes(demo.MAX_MSGLEN,0)
  playback=Playback(protocolRuntime.create(void),"",false,handle,archiveData,0,bytes(8,0),payload,bytes(4,0),message.initStorage(payload,demo.MAX_MSGLEN,false))
  for packetIndex=0 to MAX_START_PACKETS-1
    gotPacket=try(readPacket(playback,now))
    if gotPacket is error then close(playback);return gotPacket end if
    if not gotPacket then break end if
    if serverStream.ready(playback.protocol) then
      named=try(updateMap(playback))
      if named is error then close(playback);return named end if
      return playback
    end if
  end for
  close(playback)
  return fail("no active snapshot at the start of "+relative)
end function

// Read ahead through the next snapshot for Cgame interpolation. After a new
// gamestate, stop at its first active snapshot so Cgame can initialize again.
/// @param playback Record read through `playback.completed`, `playback.protocol.dispatcher.snapshotState`, `playback.protocol`.
/// @param serverTime Authoritative server timestamp in milliseconds.
/// @param realtime Current client real-time clock in milliseconds.
function advance(playback,serverTime,realtime)
  if playback.completed then return 0 end if
  initialEpoch=playback.protocol.dispatcher.snapshotState
  if serverStream.ready(playback.protocol) and initialEpoch.snap.serverTime>serverTime then return 0 end if
  for index=0 to MAX_FRAME_PACKETS-1
    gotPacket=try(readPacket(playback,realtime))
    if gotPacket is error then close(playback);return gotPacket end if
    if not gotPacket then return index end if
    if serverStream.ready(playback.protocol) then
      epoch=playback.protocol.dispatcher.snapshotState
      if epoch!=initialEpoch then
        named=try(updateMap(playback))
        if named is error then close(playback);return named end if
        return index+1
      end if
      if epoch.snap.serverTime>serverTime then return index+1 end if
    end if
  end for
  if not serverStream.ready(playback.protocol) then close(playback);return fail("no active snapshot after gamestate") end if
  return MAX_FRAME_PACKETS
end function
