// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic protocol-68 channel core from qcommon/net_chan.c.
package mq3.qcommon.netchan
import mq3.compat.numeric as n
import mq3.qcommon.headers as qcommonHeaders

const NS_CLIENT = 0
const NS_SERVER = 1
const MAX_PACKETLEN = 1400
const FRAGMENT_SIZE = 1300
const PACKET_HEADER = 10
const MAX_MSGLEN = qcommonHeaders.MAX_MSGLEN
const FRAGMENT_BIT = 0x80000000
const SCRAMBLE_START = 6

struct Address type ip port end struct

struct Runtime
  qport
  sendPacketFn
  context
end struct

struct Channel
  sock
  dropped
  remoteAddress
  qport
  incomingSequence
  outgoingSequence
  fragmentSequence
  fragmentLength
  fragmentBuffer
  unsentFragments
  unsentFragmentStart
  unsentLength
  unsentBuffer
end struct

struct ProcessResult accepted data cursize readcount bit end struct

function init(port)
  return Runtime(port&0xffff,void,void)
end function

function setup(sock,address,qport)
  return Channel(sock,0,address,qport,0,1,0,0,bytes(MAX_MSGLEN,0),false,0,0,bytes(MAX_MSGLEN,0))
end function

function writeShort(data,offset,value)
  data[offset]=value&255;data[offset+1]=(value>>8)&255;return void
end function

function writeLong(data,offset,value)
  n.writeU32(data,offset,n.i32(value));return void
end function

function readShort(data,offset)
  value=data[offset]|(data[offset+1]<<8)
  if value>=32768 then return value-65536 end if
  return value
end function

function emit(runtime,channel,packet)
  if runtime.sendPacketFn==void then return error(3512,"Netchan transmit requires NET_SendPacket service") end if
  runtime.sendPacketFn(runtime,channel.sock,packet,channel.remoteAddress);return void
end function

function transmitNextFragment(runtime,channel)
  if not channel.unsentFragments then return error(3512,"Netchan has no pending fragments") end if
  fragmentLength=FRAGMENT_SIZE
  if channel.unsentFragmentStart+fragmentLength>channel.unsentLength then fragmentLength=channel.unsentLength-channel.unsentFragmentStart end if
  header=8;if channel.sock==NS_CLIENT then header=10 end if
  packet=bytes(header+fragmentLength,0)
  writeLong(packet,0,n.i32(channel.outgoingSequence|FRAGMENT_BIT));offset=4
  if channel.sock==NS_CLIENT then writeShort(packet,offset,runtime.qport);offset=offset+2 end if
  writeShort(packet,offset,channel.unsentFragmentStart);writeShort(packet,offset+2,fragmentLength)
  if fragmentLength>0 then copyBytes(packet,header,channel.unsentBuffer,channel.unsentFragmentStart,fragmentLength) end if
  emit(runtime,channel,packet);channel.unsentFragmentStart=channel.unsentFragmentStart+fragmentLength
  // An exact multiple needs a trailing zero-length fragment, like Baseq3.
  if channel.unsentFragmentStart==channel.unsentLength and fragmentLength!=FRAGMENT_SIZE then
    channel.outgoingSequence=channel.outgoingSequence+1;channel.unsentFragments=false
  end if
  return packet
end function

function transmit(runtime,channel,data)
  length=len(data);if length>MAX_MSGLEN then return error(3512,"Netchan_Transmit length exceeds MAX_MSGLEN") end if
  channel.unsentFragmentStart=0
  if length>=FRAGMENT_SIZE then
    channel.unsentFragments=true;channel.unsentLength=length
    if length>0 then copyBytes(channel.unsentBuffer,0,data,0,length) end if
    return transmitNextFragment(runtime,channel)
  end if
  header=4;if channel.sock==NS_CLIENT then header=6 end if;packet=bytes(header+length,0)
  writeLong(packet,0,channel.outgoingSequence);channel.outgoingSequence=channel.outgoingSequence+1;offset=4
  if channel.sock==NS_CLIENT then writeShort(packet,offset,runtime.qport) end if
  if length>0 then copyBytes(packet,header,data,0,length) end if
  emit(runtime,channel,packet);return packet
end function

function rejected(data,readcount)
  return ProcessResult(false,data,len(data),readcount,readcount*8)
end function

function process(channel,data,maxsize)
  cursize=len(data);if cursize<4 then return rejected(data,cursize) end if
  sequence=n.readI32(data,0);fragmented=(sequence&FRAGMENT_BIT)!=0
  if fragmented then sequence=n.i32(sequence&0x7fffffff) end if
  readcount=4
  if channel.sock==NS_SERVER then if readcount+2>cursize then return rejected(data,cursize) end if;readShort(data,readcount);readcount=readcount+2 end if
  fragmentStart=0;fragmentLength=0
  if fragmented then
    if readcount+4>cursize then return rejected(data,cursize) end if
    fragmentStart=readShort(data,readcount);fragmentLength=readShort(data,readcount+2);readcount=readcount+4
  end if
  if sequence<=channel.incomingSequence then return rejected(data,readcount) end if
  channel.dropped=sequence-(channel.incomingSequence+1)
  if fragmented then
    if sequence!=channel.fragmentSequence then channel.fragmentSequence=sequence;channel.fragmentLength=0 end if
    if fragmentStart!=channel.fragmentLength then return rejected(data,readcount) end if
    if fragmentLength<0 or readcount+fragmentLength>cursize or channel.fragmentLength+fragmentLength>MAX_MSGLEN then return rejected(data,readcount) end if
    if fragmentLength>0 then copyBytes(channel.fragmentBuffer,channel.fragmentLength,data,readcount,fragmentLength) end if
    channel.fragmentLength=channel.fragmentLength+fragmentLength
    if fragmentLength==FRAGMENT_SIZE then return rejected(data,readcount) end if
    // Baseq3 checks only the payload length, then writes its four-byte sequence
    // prefix as well. Include that prefix in the bound to avoid a four-byte
    // write past an exactly maxsize allocation.
    if channel.fragmentLength+4>maxsize then return rejected(data,readcount) end if
    result=bytes(channel.fragmentLength+4,0);writeLong(result,0,sequence)
    if channel.fragmentLength>0 then copyBytes(result,4,channel.fragmentBuffer,0,channel.fragmentLength) end if
    channel.fragmentLength=0;channel.incomingSequence=sequence
    return ProcessResult(true,result,len(result),4,32)
  end if
  channel.incomingSequence=sequence
  return ProcessResult(true,data,cursize,readcount,readcount*8)
end function

// These two routines are inside Baseq3's #if 0 block, but keeping the exact
// transform here makes the complete source-file contract available to tools
// and preserves the original reversible packet codec.
function scramblePacket(data)
  c=len(data);if c<=SCRAMBLE_START then return data end if
  if c>MAX_PACKETLEN then return error(3512,"Netchan scramble exceeds MAX_PACKETLEN") end if
  result=bytes(data);sequence=array(c,0);seed=n.i32(n.mul32(n.readI32(result,0),3)^n.mul32(c,123))
  for index=0 to c-1 seed=n.add32(n.mul32(119,seed),1);sequence[index]=n.u32(seed) end for
  mask=1;while mask<c-SCRAMBLE_START mask=(mask<<1)+1 end while;mask=mask>>1
  for index=SCRAMBLE_START to c-1 target=SCRAMBLE_START+(sequence[index]&mask);temporary=result[target];result[target]=result[index];result[index]=temporary end for
  for index=SCRAMBLE_START to c-1 result[index]=result[index]^(sequence[index]&255) end for
  return result
end function

function unscramblePacket(data)
  c=len(data);if c<=SCRAMBLE_START then return data end if
  if c>MAX_PACKETLEN then return error(3512,"Netchan unscramble exceeds MAX_PACKETLEN") end if
  result=bytes(data);sequence=array(c,0);seed=n.i32(n.mul32(n.readI32(result,0),3)^n.mul32(c,123))
  for index=0 to c-1 seed=n.add32(n.mul32(119,seed),1);sequence[index]=n.u32(seed) end for
  for index=SCRAMBLE_START to c-1 result[index]=result[index]^(sequence[index]&255) end for
  mask=1;while mask<c-SCRAMBLE_START mask=(mask<<1)+1 end while;mask=mask>>1
  index=c-1;while index>=SCRAMBLE_START target=SCRAMBLE_START+(sequence[index]&mask);temporary=result[target];result[target]=result[index];result[index]=temporary;index=index-1 end while
  return result
end function
