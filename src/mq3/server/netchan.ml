// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server-side protocol-68 netchan wrapper from server/sv_net_chan.c.
package mq3.server.netchan
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import std.ds.queue as queues

const MAX_RELIABLE_COMMANDS=64
const SV_ENCODE_START=4
const SV_DECODE_START=12
const SVC_EOF=8

struct Client
  challenge
  lastClientCommandString
  reliableCommands
  channel
  queue
  queueInitialized
end struct

function client(challenge,channel)
  return Client(challenge,"",array(MAX_RELIABLE_COMMANDS,""),channel,queues.Queue.withCapacity(8),true)
end function

function requireClient(clientState)
  if clientState==void or clientState.channel==void then return error(6960,"server netchan: invalid client") end if
  if clientState.reliableCommands==void or len(clientState.reliableCommands)!=MAX_RELIABLE_COMMANDS then return error(6961,"server netchan: invalid reliable ring") end if
  return void
end function

function cloneMessage(source)
  target=message.init(source.maxsize)
  target.allowoverflow=source.allowoverflow;target.overflowed=source.overflowed;target.oob=source.oob
  target.cursize=source.cursize;target.readcount=source.readcount;target.bit=source.bit
  if source.cursize>0 then copyBytes(target.data,0,source.data,0,source.cursize) end if
  return target
end function

function commandByte(raw,index)
  if len(raw)==0 then return [0,1] end if
  if index>=len(raw) or raw[index]==0 then index=0 end if
  value=raw[index]
  if value>127 or value==37 then value=46 end if
  return [value,index+1]
end function

// First four physical bytes remain clear. The initial compressed long is read
// only to reproduce the original msg_t cursor save/restore behavior.
function encode(clientState,msg)
  requireClient(clientState)
  if msg.cursize<SV_ENCODE_START then return msg end if
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.bit=0;msg.readcount=0;msg.oob=false;message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  raw=bytes(clientState.lastClientCommandString);index=0
  key=(clientState.challenge^clientState.channel.outgoingSequence)&255
  if msg.cursize>SV_ENCODE_START then
    for offset=SV_ENCODE_START to msg.cursize-1
      // Avoid allocating a two-element array for every network byte.
      value=0
      if len(raw)>0 then
        if index>=len(raw) or raw[index]==0 then index=0 end if
        value=raw[index];index=index+1
        if value>127 or value==37 then value=46 end if
      end if
      key=(key^(value<<(offset&1)))&255
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return msg
end function

// The three compressed client header longs remain logically unread by the
// caller. Cursors are restored exactly before the payload XOR begins.
function decodeMessage(clientState,msg)
  requireClient(clientState)
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  // Preserve the actual msg_t bit origin, just like SV_Netchan_Decode.
  // Reading directly avoids a full payload copy merely to inspect 3 longs.
  msg.oob=false
  serverId=message.readI32(msg);messageAcknowledge=message.readI32(msg);reliableAcknowledge=message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  raw=bytes(clientState.reliableCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]);index=0
  key=(clientState.challenge^serverId^messageAcknowledge)&255
  start=msg.readcount+SV_DECODE_START
  if start<msg.cursize then
    for offset=start to msg.cursize-1
      // Avoid allocating a two-element array for every network byte.
      value=0
      if len(raw)>0 then
        if index>=len(raw) or raw[index]==0 then index=0 end if
        value=raw[index];index=index+1
        if value>127 or value==37 then value=46 end if
      end if
      key=(key^(value<<(offset&1)))&255
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return msg
end function

function decode(clientState,msg) return decodeMessage(clientState,msg) end function

function transmit(runtime,clientState,msg)
  requireClient(clientState)
  message.writeByte(msg,SVC_EOF)
  if clientState.channel.unsentFragments then
    if not clientState.queueInitialized then return error(6962,"server netchan: queue is not initialized") end if
    clientState.queue.enqueue(cloneMessage(msg))
    return net.transmitNextFragment(runtime,clientState.channel)
  end if
  encode(clientState,msg)
  data=bytes(msg.cursize,0);if msg.cursize>0 then copyBytes(data,0,msg.data,0,msg.cursize) end if
  return net.transmit(runtime,clientState.channel,data)
end function

// Snapshot construction already appends svc_EOF before reaching the netchan
// boundary. This entry point applies the server XOR and drains every fragment
// without adding a second terminator.
function transmitPayload(runtime,clientState,payload)
  requireClient(clientState)
  if runtime==void or payload==void then return error(6964,"server netchan: invalid payload transport") end if
  msg=message.initStorage(slice(payload,0,len(payload)),len(payload),false);msg.cursize=len(payload);encode(clientState,msg)
  first=net.transmit(runtime,clientState.channel,slice(msg.data,0,msg.cursize))
  if first is error then return first end if
  while clientState.channel.unsentFragments
    next=net.transmitNextFragment(runtime,clientState.channel);if next is error then return next end if
  end while
  return first
end function

function transmitNextFragment(runtime,clientState)
  requireClient(clientState)
  first=net.transmitNextFragment(runtime,clientState.channel);packets=[first]
  if not clientState.channel.unsentFragments then
    if not clientState.queueInitialized then return error(6963,"server netchan: queue is not initialized after fragment drain") end if
    if not clientState.queue.isEmpty() then
      queued=clientState.queue.dequeue();encode(clientState,queued)
      data=bytes(queued.cursize,0);if queued.cursize>0 then copyBytes(data,0,queued.data,0,queued.cursize) end if
      packets=packets+[net.transmit(runtime,clientState.channel,data)]
    end if
  end if
  return packets
end function

function process(clientState,data,maxsize)
  requireClient(clientState)
  result=net.process(clientState.channel,data,maxsize)
  if not result.accepted then return result end if
  // Retain independent decoded storage without slicing/copying the body twice.
  decodedData=bytes(result.data)
  decoded=message.initStorage(decodedData,len(decodedData),false)
  decoded.cursize=result.cursize;decoded.readcount=result.readcount;decoded.bit=result.bit
  decodeMessage(clientState,decoded)
  return net.ProcessResult(true,decodedData,result.cursize,result.readcount,result.bit)
end function
