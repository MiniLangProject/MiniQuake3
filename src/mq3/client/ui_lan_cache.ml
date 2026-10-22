// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Binary compatibility with client/cl_ui.c's servercache.dat.
package mq3.client.ui_lan_cache

import std.fs as fs
import std.string as strings
import mq3.compat.numeric as n
import mq3.client.ui_lan_browser as lan

const CACHE_NAME="servercache.dat"
const NETADR_SIZE=20
const SERVER_INFO_SIZE=152
const HEADER_SIZE=16
const GLOBAL_BYTES=lan.MAX_GLOBAL_SERVERS*SERVER_INFO_SIZE
const OTHER_BYTES=lan.MAX_OTHER_SERVERS*SERVER_INFO_SIZE
const PAYLOAD_SIZE=GLOBAL_BYTES+OTHER_BYTES+OTHER_BYTES
const CACHE_SIZE=HEADER_SIZE+PAYLOAD_SIZE

const NA_BAD=1
const NA_LOOPBACK=2
const NA_BROADCAST=3
const NA_IP=4

struct Services readFn writeFn context end struct
struct DiskContext root end struct

function services(readFn,writeFn,context) return Services(readFn,writeFn,context) end function

function path(root,name)
  if root=="" then return name end if
  tail=bytes(root)[len(bytes(root))-1];if tail==47 or tail==92 then return root+name end if
  return root+"/"+name
end function
function diskRead(context,name) return fs.readAllBytes(path(context.root,name)) end function
function diskWrite(context,name,data) return fs.writeAllBytes(path(context.root,name),data) end function
function diskServices(root) return services(diskRead,diskWrite,DiskContext(root)) end function

function copyText(data,offset,capacity)
  count=0;while count<capacity and data[offset+count]!=0 count=count+1 end while
  return decode(slice(data,offset,count))
end function
function writeText(data,offset,capacity,text)
  encoded=bytes(text);count=len(encoded);if count>=capacity then count=capacity-1 end if
  if count>0 then copyBytes(data,offset,encoded,0,count) end if
  return void
end function

function parseOctet(text)
  if text=="" then return -1 end if;value=toNumber(text);if value<0 or value>255 then return -1 end if
  // Reject partial numeric conversions (the network layer resolves names before
  // Baseq3 stores a netadr_t, so the cache itself only contains numeric bytes).
  for each valueByte in bytes(text) if valueByte<48 or valueByte>57 then return -1 end if end for
  return value
end function
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
function addressText(data,offset)
  addressType=n.readI32(data,offset);port=(data[offset+18]<<8)|data[offset+19]
  suffix="";if port!=0 then suffix=":"+str(port) end if
  if addressType==NA_LOOPBACK then return "localhost"+suffix end if
  if addressType!=NA_IP and addressType!=NA_BROADCAST then return "" end if
  return str(data[offset+4])+"."+str(data[offset+5])+"."+str(data[offset+6])+"."+str(data[offset+7])+suffix
end function
function writeAddress(data,offset,text)
  parsed=parsedAddress(text);n.writeU32(data,offset,parsed[0]);data[offset+4]=parsed[1];data[offset+5]=parsed[2];data[offset+6]=parsed[3];data[offset+7]=parsed[4]
  data[offset+18]=(parsed[5]>>8)&255;data[offset+19]=parsed[5]&255;return void
end function

function writeServer(data,offset,value)
  if value==void then return void end if
  writeAddress(data,offset,value.address);writeText(data,offset+20,32,value.hostName);writeText(data,offset+52,32,value.mapName);writeText(data,offset+84,32,value.game)
  n.writeU32(data,offset+116,value.netType);n.writeU32(data,offset+120,value.gameType);n.writeU32(data,offset+124,value.clients);n.writeU32(data,offset+128,value.maxClients)
  visible=0;if value.visible then visible=1 end if
  n.writeU32(data,offset+132,value.minPing);n.writeU32(data,offset+136,value.maxPing);n.writeU32(data,offset+140,value.ping);n.writeU32(data,offset+144,visible);n.writeU32(data,offset+148,value.punkbuster)
  return void
end function
function readServer(data,offset)
  value=lan.server(addressText(data,offset),copyText(data,offset+20,32));value.mapName=copyText(data,offset+52,32);value.game=copyText(data,offset+84,32)
  value.netType=n.readI32(data,offset+116);value.gameType=n.readI32(data,offset+120);value.clients=n.readI32(data,offset+124);value.maxClients=n.readI32(data,offset+128)
  value.minPing=n.readI32(data,offset+132);value.maxPing=n.readI32(data,offset+136);value.ping=n.readI32(data,offset+140);value.visible=n.readI32(data,offset+144)!=0;value.punkbuster=n.readI32(data,offset+148);return value
end function

function writeList(data,offset,values,capacity)
  count=len(values);if count>capacity then count=capacity end if
  if count>0 then for index=0 to count-1 writeServer(data,offset+index*SERVER_INFO_SIZE,values[index]) end for end if;return void
end function
function readList(data,offset,count)
  result=[];if count>0 then for index=0 to count-1 result=result+[readServer(data,offset+index*SERVER_INFO_SIZE)] end for end if;return result
end function
function reset(state)
  state.globalServers=[];state.mplayer=[];state.favorites=[];return void
end function

// LAN_SaveServersToCache writes three counts, the combined fixed-array size,
// then globalServers, mplayerServers and favoriteServers in that exact order.
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
function decodeInto(state,data)
  reset(state);if data==void or len(data)<HEADER_SIZE then return false end if
  globalCount=n.readI32(data,0);mplayerCount=n.readI32(data,4);favoriteCount=n.readI32(data,8);payload=n.readI32(data,12)
  if payload!=PAYLOAD_SIZE or len(data)<CACHE_SIZE then return false end if
  if globalCount<0 or globalCount>lan.MAX_GLOBAL_SERVERS or mplayerCount<0 or mplayerCount>lan.MAX_OTHER_SERVERS or favoriteCount<0 or favoriteCount>lan.MAX_OTHER_SERVERS then return false end if
  state.globalServers=readList(data,HEADER_SIZE,globalCount)
  state.mplayer=readList(data,HEADER_SIZE+GLOBAL_BYTES,mplayerCount)
  state.favorites=readList(data,HEADER_SIZE+GLOBAL_BYTES+OTHER_BYTES,favoriteCount);return true
end function

function save(state,host)
  if state==void or host==void or host.writeFn==void then return false end if
  result=try(host.writeFn(host.context,CACHE_NAME,encode(state)));if result is error then return false end if;return result==true
end function
function load(state,host)
  if state==void then return false end if;reset(state)
  if host==void or host.readFn==void then return false end if
  data=try(host.readFn(host.context,CACHE_NAME));if data is error then return false end if;return decodeInto(state,data)
end function
