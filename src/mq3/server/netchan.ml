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

/// Client record for server.netchan, containing `challenge`, `lastClientCommandString`, `reliableCommands`, `channel`, `queue`, `queueInitialized`.
struct Client
  challenge
  lastClientCommandString
  reliableCommands
  channel
  queue
  queueInitialized
end struct

/// Create `mq3.server.netchan.Client` with challenge=challenge; lastClientCommandString=""; reliableCommands=array(MAX_RELIABLE_COMMANDS, ""); channel=channel; queue=queues.Queue.withCapacity(8); queueInitialized=true.
/// @param challenge Initial `challenge` field stored in the returned or constructed `mq3.server.netchan.Client` record.
/// @param channel Initial `channel` field stored in the returned or constructed `mq3.server.netchan.Client` record.
function client(challenge,channel)
  return Client(challenge,"",array(MAX_RELIABLE_COMMANDS,""),channel,queues.Queue.withCapacity(8),true)
end function

/// Compute require client in server.netchan.
///
/// Validation failures include `server netchan: invalid client`; `server netchan: invalid reliable ring`.
/// @param clientState Record exposing `channel`, `reliableCommands`.
function requireClient(clientState)
  if clientState==void or clientState.channel==void then return error(6960,"server netchan: invalid client") end if
  if clientState.reliableCommands==void or len(clientState.reliableCommands)!=MAX_RELIABLE_COMMANDS then return error(6961,"server netchan: invalid reliable ring") end if
  return void
end function

/// Compute clone message in server.netchan; the normal completion returns `target`.
/// @param source Record exposing `maxsize`, `allowoverflow`, `overflowed`, `oob`, `cursize`, `readcount`, `bit` and further fields.
function cloneMessage(source)
  target=message.init(source.maxsize)
  target.allowoverflow=source.allowoverflow;target.overflowed=source.overflowed;target.oob=source.oob
  target.cursize=source.cursize;target.readcount=source.readcount;target.bit=source.bit
  if source.cursize>0 then for index=0 to source.cursize-1 target.data[index]=source.data[index] end for end if
  return target
end function

/// Compute command byte in server.netchan; the normal completion returns `[value, (index + 1)]`.
/// @param raw Raw used in `len(raw)` and `raw[index]`.
/// @param index Zero-based index into `raw`.
function commandByte(raw,index)
  if len(raw)==0 then return [0,1] end if
  if index>=len(raw) or raw[index]==0 then index=0 end if
  value=raw[index]
  if value>127 or value==37 then value=46 end if
  return [value,index+1]
end function

// First four physical bytes remain clear. The initial compressed long is read
// only to reproduce the original msg_t cursor save/restore behavior.
/// @param clientState Record exposing `lastClientCommandString`, `challenge`, `channel`.
/// @param msg Record exposing `cursize`, `readcount`, `bit`, `oob`, `data`. Updated in place: `bit`, `readcount`, `oob`.
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
      pair=commandByte(raw,index);key=(key^(pair[0]<<(offset&1)))&255;index=pair[1]
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return msg
end function

// The three compressed client header longs remain logically unread by the
// caller. Payload are restored exactly before the payload XOR begins.
/// @param clientState Record exposing `reliableCommands`, `challenge`.
/// @param msg Record exposing `readcount`, `bit`, `oob`, `cursize`, `data`. Updated in place: `oob`, `bit`, `readcount`.
function decodeMessage(clientState,msg)
  requireClient(clientState)
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  // The Huffman stream starts immediately after the physical netchan header.
  // Decode an offset-zero view so the codec sees precisely the same bit origin.
  headerLength=msg.cursize-savedRead;if headerLength<0 then headerLength=0 end if
  headerData=slice(msg.data,savedRead,headerLength);probe=message.initStorage(headerData,len(headerData),false);probe.cursize=len(headerData)
  serverId=message.readI32(probe);messageAcknowledge=message.readI32(probe);reliableAcknowledge=message.readI32(probe)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  raw=bytes(clientState.reliableCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]);index=0
  key=(clientState.challenge^serverId^messageAcknowledge)&255
  start=msg.readcount+SV_DECODE_START
  if start<msg.cursize then
    for offset=start to msg.cursize-1
      pair=commandByte(raw,index);key=(key^(pair[0]<<(offset&1)))&255;index=pair[1]
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return msg
end function

/// Return `mq3.server.netchan.decodeMessage(clientState, msg)` from `server.netchan.decode`.
/// @param clientState Client state passed as `clientState` to `mq3.server.netchan.decodeMessage`.
/// @param msg Msg passed as `msg` to `mq3.server.netchan.decodeMessage`.
function decode(clientState,msg) return decodeMessage(clientState,msg) end function

/// Compute transmit in server.netchan; the normal completion returns `net.transmit(runtime, clientState.channel, data)`.
///
/// Validation failures include `server netchan: queue is not initialized`.
/// @param runtime Runtime passed as `runtime` to `mq3.qcommon.netchan.transmitNextFragment`.
/// @param clientState Record exposing `channel`, `queueInitialized`, `queue`.
/// @param msg Record exposing `cursize`, `data`.
function transmit(runtime,clientState,msg)
  requireClient(clientState)
  message.writeByte(msg,SVC_EOF)
  if clientState.channel.unsentFragments then
    if not clientState.queueInitialized then return error(6962,"server netchan: queue is not initialized") end if
    clientState.queue.enqueue(cloneMessage(msg))
    return net.transmitNextFragment(runtime,clientState.channel)
  end if
  encode(clientState,msg)
  data=bytes(msg.cursize,0);if msg.cursize>0 then for index=0 to msg.cursize-1 data[index]=msg.data[index] end for end if
  return net.transmit(runtime,clientState.channel,data)
end function

// Snapshot construction already appends svc_EOF before reaching the netchan
// boundary. This entry point applies the server XOR and drains every fragment
// without adding a second terminator.
/// @param runtime Runtime passed as `runtime` to `mq3.qcommon.netchan.transmit`.
/// @param clientState Record exposing `channel`.
/// @param payload Payload used in `len(payload)` and `(payload == void)`.
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

/// Compute transmit next fragment in server.netchan; the normal completion returns `packets`.
///
/// Validation failures include `server netchan: queue is not initialized after fragment drain`.
/// @param runtime Runtime passed as `runtime` to `mq3.qcommon.netchan.transmitNextFragment`.
/// @param clientState Record exposing `channel`, `queueInitialized`, `queue`.
function transmitNextFragment(runtime,clientState)
  requireClient(clientState)
  first=net.transmitNextFragment(runtime,clientState.channel);packets=[first]
  if not clientState.channel.unsentFragments then
    if not clientState.queueInitialized then return error(6963,"server netchan: queue is not initialized after fragment drain") end if
    if not clientState.queue.isEmpty() then
      queued=clientState.queue.dequeue();encode(clientState,queued)
      data=bytes(queued.cursize,0);if queued.cursize>0 then for index=0 to queued.cursize-1 data[index]=queued.data[index] end for end if
      packets=packets+[net.transmit(runtime,clientState.channel,data)]
    end if
  end if
  return packets
end function

/// Process netchan in server.netchan; the normal completion returns `net.ProcessResult(true, decodedData, result.cursize, result.readcount, result.bit)`.
/// @param clientState Record exposing `channel`.
/// @param data Data passed as `data` to `mq3.qcommon.netchan.process`.
/// @param maxsize Maxsize passed as `maxsize` to `mq3.qcommon.netchan.process`.
function process(clientState,data,maxsize)
  requireClient(clientState)
  result=net.process(clientState.channel,data,maxsize)
  if not result.accepted then return result end if
  headerSize=result.readcount;bodySize=result.cursize-headerSize
  body=message.initStorage(slice(result.data,headerSize,bodySize),bodySize,false);body.cursize=bodySize
  decodeMessage(clientState,body)
  decodedData=bytes(result.cursize,0)
  if headerSize>0 then for index=0 to headerSize-1 decodedData[index]=result.data[index] end for end if
  if bodySize>0 then for index=0 to bodySize-1 decodedData[headerSize+index]=body.data[index] end for end if
  return net.ProcessResult(true,decodedData,result.cursize,result.readcount,result.bit)
end function
