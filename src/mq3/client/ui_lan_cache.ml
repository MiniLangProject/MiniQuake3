// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Binary compatibility with client/cl_ui.c's servercache.dat.
package mq3.client.ui_lan_cache

import std.fs as fs
import std.string as strings
import mq3.compat.numeric as n
import mq3.client.ui_lan_browser as lan

/// Filename used to persist the native server-browser cache.
const CACHE_NAME="servercache.dat"
/// Size in bytes of the native network-address record used by the compatibility ABI.
const NETADR_SIZE=20
/// Size in bytes reserved for a native server-information record during ABI marshalling.
const SERVER_INFO_SIZE=152
/// Byte length of the persisted server-cache header.
const HEADER_SIZE=16
/// Byte count used when storing or marshalling the global data.
const GLOBAL_BYTES=lan.MAX_GLOBAL_SERVERS*SERVER_INFO_SIZE
/// Byte count used when storing or marshalling the other data.
const OTHER_BYTES=lan.MAX_OTHER_SERVERS*SERVER_INFO_SIZE
/// Byte length of the server-list record blocks stored after the cache header.
const PAYLOAD_SIZE=GLOBAL_BYTES+OTHER_BYTES+OTHER_BYTES
/// Total byte length of the persisted cache header and server-list payload.
const CACHE_SIZE=HEADER_SIZE+PAYLOAD_SIZE

/// Network-address kind identifying a bad destination.
const NA_BAD=1
/// Network-address kind identifying a loopback destination.
const NA_LOOPBACK=2
/// Network-address kind identifying a broadcast destination.
const NA_BROADCAST=3
/// Network-address kind identifying a ip destination.
const NA_IP=4

/// Stores UI LAN cache host-service callbacks, including `readFn`, `writeFn`, `context`.
struct Services
  /// Host callback for the read operation; an unset callback leaves that host operation unavailable.
  readFn
  /// Host callback for the write operation; an unset callback leaves that host operation unavailable.
  writeFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for server-browser cache
  /// persistence.
  context
end struct
/// Stores UI LAN cache disk context record, including `root`.
struct DiskContext
  /// When constructing this record, `diskServices` supplies `root` for this member.
  root
end struct

/// Creates a `mq3.client.ui_lan_cache.Services` record. Assigns `readFn` from `readFn`, `writeFn` from `writeFn`, `context` from `context`.
/// @param readFn Value used to initialize `Services.readFn`.
/// @param writeFn Value used to initialize `Services.writeFn`.
/// @param context Value used to initialize `Services.context`.
function services(readFn,writeFn,context) return Services(readFn,writeFn,context) end function

/// Evaluates UI LAN cache `path` and returns `name`, `root+name`, `root+"/"+name` according to its guard/selection conditions.
/// @param root Value used by `if root=="" then return name end if`.
/// @param name Name used to select or register the corresponding UI LAN cache resource.
function path(root,name)
  if root=="" then return name end if
  tail=bytes(root)[len(bytes(root))-1];if tail==47 or tail==92 then return root+name end if
  return root+"/"+name
end function
/// Adapts `std.fs.readAllBytes` to UI LAN cache `diskRead`, returning its result for `path(context.root,name)`.
/// @param context Record read through `context.root`.
/// @param name Argument 1 of `std.fs.readAllBytes`; passed as `path(context.root,name)`.
function diskRead(context,name) return fs.readAllBytes(path(context.root,name)) end function
/// Adapts `std.fs.writeAllBytes` to UI LAN cache `diskWrite`, returning its result for `path(context.root,name), data`.
/// @param context Record read through `context.root`.
/// @param name Argument 1 of `std.fs.writeAllBytes`; passed as `path(context.root,name)`.
/// @param data Argument 2 of `std.fs.writeAllBytes`.
function diskWrite(context,name,data) return fs.writeAllBytes(path(context.root,name),data) end function
/// Adapts `mq3.client.ui_lan_cache.services` to UI LAN cache `diskServices`, returning its result for `diskRead, diskWrite, DiskContext(root)`.
/// @param root Argument 3 of `mq3.client.ui_lan_cache.services`; passed as `DiskContext(root)`.
function diskServices(root) return services(diskRead,diskWrite,DiskContext(root)) end function

/// Calls `decode`, `slice` from UI LAN cache `copyText`. The final path returns `decode(slice(data,offset,count))`.
/// @param data Sequence read at `data[offset+count]`.
/// @param offset Value used by `while count<capacity and data[offset+count]!=0 count=count+1 end while`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function copyText(data,offset,capacity)
  count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while
  return decode(slice(data,offset,count))
end function
/// Calls `copyBytes` from UI LAN cache `writeText`.
/// @param data Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`.
/// @param offset Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
/// @param text Text consumed or emitted by `writeText` in the UI LAN cache path.
function writeText(data,offset,capacity,text)
  encoded=bytes(text);count=len(encoded);if count>=capacity then count=capacity-1 end if
  if count>0 then copyBytes(data,offset,encoded,0,count) end if
  return void
end function

/// Calls `toNumber` from UI LAN cache `parseOctet`. The final path returns `value`.
/// @param text Text consumed or emitted by `parseOctet` in the UI LAN cache path.
function parseOctet(text)
  if text=="" then return -1 end if;value=toNumber(text);if value<0 or value>255 then return -1 end if
  // Reject partial numeric conversions (the network layer resolves names before
  // Baseq3 stores a netadr_t, so the cache itself only contains numeric bytes).
  for each valueByte in bytes(text) if valueByte<48 or valueByte>57 then return -1 end if end for
  return value
end function
/// Calls `std.string.lastIndexOf`, `decode`, `slice` and additional helpers from UI LAN cache `parsedAddress`. The final path returns `[addressType,a,b,c,d,port]`.
/// @param text Text consumed or emitted by `parsedAddress` in the UI LAN cache path.
function parsedAddress(text)
  colon=strings.lastIndexOf(text,":");host=text;port=0
  if colon>=0 then
    host=decode(slice(bytes(text),0,colon));portText=decode(slice(bytes(text),colon+1,len(bytes(text))-colon-1));port=toNumber(portText)
    if port<0 or port>65535 then port=0 end if
  end if
  if strings.toLowerAscii(host)=="localhost" then return [NA_LOOPBACK,0,0,0,0,port] end if
  fields=strings.split(host,".");if len(fields)!=4 then return [NA_BAD,0,0,0,0,port] end if
  a=parseOctet(fields[0]);b=parseOctet(fields[1]);c=parseOctet(fields[2]);d=parseOctet(fields[3])
  if a<0 or b<0 or c<0 or d<0 then return [NA_BAD,0,0,0,0,port] end if
  addressType=NA_IP;if a==255 and b==255 and c==255 and d==255 then addressType=NA_BROADCAST end if
  return [addressType,a,b,c,d,port]
end function
/// Calls `mq3.compat.numeric.readI32` from UI LAN cache `addressText`. The final path returns `str(data[offset+4])+"."+str(data[offset+5])+"."+str(data[offset+6])+"."+str(data[offset+7])+suffix`.
/// @param data Sequence read at `data[offset+18]`, `data[offset+19]`, `data[offset+4]`, `data[offset+5]` and additional values.
/// @param offset Value used by `addressType=n.readI32(data,offset)`.
function addressText(data,offset)
  addressType=n.readI32(data,offset);port=(data[offset+18]<<8)|data[offset+19]
  suffix="";if port!=0 then suffix=":"+str(port) end if
  if addressType==NA_LOOPBACK then return "localhost"+suffix end if
  if addressType!=NA_IP and addressType!=NA_BROADCAST then return "" end if
  return str(data[offset+4])+"."+str(data[offset+5])+"."+str(data[offset+6])+"."+str(data[offset+7])+suffix
end function
/// Updates `data[offset+4]`, `data[offset+5]`, `data[offset+6]`, `data[offset+7]` and additional values during UI LAN cache `writeAddress`.
/// @param data Mutable sequence; this routine writes `data[offset+4]`, `data[offset+5]`, `data[offset+6]`, `data[offset+7]` and additional values.
/// @param offset Value used by `n.writeU32(data,offset,parsed[0])`.
/// @param text Text consumed or emitted by `writeAddress` in the UI LAN cache path.
function writeAddress(data,offset,text)
  parsed=parsedAddress(text);n.writeU32(data,offset,parsed[0]);data[offset+4]=parsed[1];data[offset+5]=parsed[2];data[offset+6]=parsed[3];data[offset+7]=parsed[4]
  data[offset+18]=(parsed[5]>>8)&255;data[offset+19]=parsed[5]&255;return void
end function

/// Calls `mq3.client.ui_lan_cache.writeAddress`, `mq3.client.ui_lan_cache.writeText`, `mq3.compat.numeric.writeU32` from UI LAN cache `writeServer`.
/// @param data Value used by `writeAddress(data,offset,value.address)`.
/// @param offset Value used by `writeAddress(data,offset,value.address)`.
/// @param value Record read through `value.address`, `value.hostName`, `value.mapName`, `value.game` and additional values.
function writeServer(data,offset,value)
  if value==void then return void end if
  writeAddress(data,offset,value.address);writeText(data,offset+20,32,value.hostName);writeText(data,offset+52,32,value.mapName);writeText(data,offset+84,32,value.game)
  n.writeU32(data,offset+116,value.netType);n.writeU32(data,offset+120,value.gameType);n.writeU32(data,offset+124,value.clients);n.writeU32(data,offset+128,value.maxClients)
  visible=0;if value.visible then visible=1 end if
  n.writeU32(data,offset+132,value.minPing);n.writeU32(data,offset+136,value.maxPing);n.writeU32(data,offset+140,value.ping);n.writeU32(data,offset+144,visible);n.writeU32(data,offset+148,value.punkbuster)
  return void
end function
/// Calls `mq3.client.ui_lan_browser.server`, `mq3.client.ui_lan_cache.addressText`, `mq3.client.ui_lan_cache.copyText` and additional helpers from UI LAN cache `readServer`. The final path returns `value`.
/// @param data Value used by `value=lan.server(addressText(data,offset),copyText(data,offset+20,32))`.
/// @param offset Value used by `value=lan.server(addressText(data,offset),copyText(data,offset+20,32))`.
function readServer(data,offset)
  value=lan.server(addressText(data,offset),copyText(data,offset+20,32));value.mapName=copyText(data,offset+52,32);value.game=copyText(data,offset+84,32)
  value.netType=n.readI32(data,offset+116);value.gameType=n.readI32(data,offset+120);value.clients=n.readI32(data,offset+124);value.maxClients=n.readI32(data,offset+128)
  value.minPing=n.readI32(data,offset+132);value.maxPing=n.readI32(data,offset+136);value.ping=n.readI32(data,offset+140);value.visible=n.readI32(data,offset+144)!=0;value.punkbuster=n.readI32(data,offset+148);return value
end function

/// Calls `mq3.client.ui_lan_cache.writeServer` from UI LAN cache `writeList`.
/// @param data Value used by `if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if`.
/// @param offset Value used by `if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if`.
/// @param values Sequence read at `values[index]`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function writeList(data,offset,values,capacity)
  count=len(values);if count>capacity then count=capacity end if
  if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if;return void
end function
/// Calls `mq3.client.ui_lan_cache.readServer` from UI LAN cache `readList`. The final path returns `result`.
/// @param data Value used by `if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if`.
/// @param offset Value used by `if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if`.
/// @param count Value tested by `count>0` before the calculation continues.
function readList(data,offset,count)
  result=[];if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if;return result
end function
/// Updates `state.globalServers`, `state.mplayer`, `state.favorites` during UI LAN cache `reset`.
/// @param state Mutable UI LAN cache record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`.
function reset(state)
  state.globalServers=[];state.mplayer=[];state.favorites=[];return void
end function

// LAN_SaveServersToCache writes three counts, the combined fixed-array size,
// then globalServers, mplayerServers and favoriteServers in that exact order.
/// @param state Record read through `state.globalServers`, `state.mplayer`, `state.favorites`.
function encode(state)
  globalCount=len(state.globalServers);if globalCount>lan.MAX_GLOBAL_SERVERS then globalCount=lan.MAX_GLOBAL_SERVERS end if
  mplayerCount=len(state.mplayer);if mplayerCount>lan.MAX_OTHER_SERVERS then mplayerCount=lan.MAX_OTHER_SERVERS end if
  favoriteCount=len(state.favorites);if favoriteCount>lan.MAX_OTHER_SERVERS then favoriteCount=lan.MAX_OTHER_SERVERS end if
  data=bytes(CACHE_SIZE,0);n.writeU32(data,0,globalCount);n.writeU32(data,4,mplayerCount);n.writeU32(data,8,favoriteCount);n.writeU32(data,12,PAYLOAD_SIZE)
  writeList(data,HEADER_SIZE,state.globalServers,lan.MAX_GLOBAL_SERVERS)
  writeList(data,HEADER_SIZE+GLOBAL_BYTES,state.mplayer,lan.MAX_OTHER_SERVERS)
  writeList(data,HEADER_SIZE+GLOBAL_BYTES+OTHER_BYTES,state.favorites,lan.MAX_OTHER_SERVERS)
  return data
end function

// Baseq3 resets all three counts before opening the file and rejects a cache
// whose fixed-array size differs from this executable's serverInfo_t layout.
/// @param state Mutable UI LAN cache record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`.
/// @param data Payload whose length/content is inspected by `decodeInto`.
function decodeInto(state,data)
  reset(state);if data==void or len(data)<HEADER_SIZE then return false end if
  globalCount=n.readI32(data,0);mplayerCount=n.readI32(data,4);favoriteCount=n.readI32(data,8);payload=n.readI32(data,12)
  if payload!=PAYLOAD_SIZE or len(data)<CACHE_SIZE then return false end if
  if globalCount<0 or globalCount>lan.MAX_GLOBAL_SERVERS or mplayerCount<0 or mplayerCount>lan.MAX_OTHER_SERVERS or favoriteCount<0 or favoriteCount>lan.MAX_OTHER_SERVERS then return false end if
  state.globalServers=readList(data,HEADER_SIZE,globalCount)
  state.mplayer=readList(data,HEADER_SIZE+GLOBAL_BYTES,mplayerCount)
  state.favorites=readList(data,HEADER_SIZE+GLOBAL_BYTES+OTHER_BYTES,favoriteCount);return true
end function

/// Calls `host.writeFn`, `mq3.client.ui_lan_cache.encode` from UI LAN cache `save`. The final path returns `result==true`.
/// @param state Shared UI LAN cache state passed to the helper calls in `save`.
/// @param host Record read through `host.writeFn`, `host.context`.
function save(state,host)
  if state==void or host==void or host.writeFn==void then return false end if
  result=try(host.writeFn(host.context,CACHE_NAME,encode(state)));if result is error then return false end if;return result==true
end function
/// Calls `mq3.client.ui_lan_cache.reset`, `host.readFn`, `mq3.client.ui_lan_cache.decodeInto` from UI LAN cache `load`. The final path returns `decodeInto(state,data)`.
/// @param state Shared UI LAN cache state passed to the helper calls in `load`.
/// @param host Record read through `host.readFn`, `host.context`.
function load(state,host)
  if state==void then return false end if;reset(state)
  if host==void or host.readFn==void then return false end if
  data=try(host.readFn(host.context,CACHE_NAME));if data is error then return false end if;return decodeInto(state,data)
end function
