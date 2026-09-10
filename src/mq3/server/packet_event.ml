// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Incoming sequenced-packet routing from SV_PacketEvent in server/sv_main.c.
package mq3.server.packet_event
import mq3.qcommon.message as message
import mq3.server.connectionless as serverConnectionless
import mq3.server.netchan as serverNetchan
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric

const CS_FREE=0
const CS_ZOMBIE=1
const NA_LOOPBACK=2
const NA_IP=4

struct Client state netchan lastPacketTime end struct
function client(state,serverNetchanState) return Client(state,serverNetchanState,0) end function

struct Runtime time clients end struct
function runtime(clients) return Runtime(0,clients) end function

struct Services connectionlessRuntime connectionlessHost processFn executeFn disconnectFn diagnosticFn context end struct
function services(connectionlessRuntime,connectionlessHost)
  return Services(connectionlessRuntime,connectionlessHost,processNetchan,void,void,void,void)
end function

function sameBase(left,right)
  if left==void or right==void or left.type!=right.type then return false end if
  if left.type==NA_LOOPBACK then return true end if
  if left.type==NA_IP then return left.ip==right.ip end if
  return false
end function

function isOob(msg)
  return msg.cursize>=4 and numeric.readI32(msg.data,0)==-1
end function

function messageBytes(msg)
  result=bytes(msg.cursize,0)
  if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if
  return result
end function

// Concrete SV_Netchan_Process adapter. Tests can replace processFn with the
// deterministic host callback used by the unchanged-C transition oracle.
function processNetchan(host,clientState,msg)
  result=serverNetchan.process(clientState.netchan,messageBytes(msg),msg.maxsize)
  if not result.accepted then return false end if
  msg.data=result.data;msg.cursize=result.cursize;msg.readcount=result.readcount;msg.bit=result.bit
  return true
end function

function packetEvent(state,host,source,msg)
  if state==void or state.clients==void or host==void or source==void or msg==void then return error(6991,"server packet event: missing input") end if
  if isOob(msg) then
    if host.connectionlessRuntime==void or host.connectionlessHost==void then return error(6992,"server packet event: missing connectionless service") end if
    serverConnectionless.dispatch(host.connectionlessRuntime,host.connectionlessHost,source,msg)
    return "oob"
  end if

  // Baseq3 deliberately performs the OOB reads even for a runt packet. The
  // message API returns -1 on underflow, making its unsigned qport 65535.
  message.beginReadingOob(msg);message.readI32(msg);qport=message.readI16(msg)&0xffff
  for each candidate in state.clients
    if candidate.state!=CS_FREE and candidate.netchan!=void and candidate.netchan.channel!=void and sameBase(source,candidate.netchan.channel.remoteAddress) and candidate.netchan.channel.qport==qport then
      if candidate.netchan.channel.remoteAddress.port!=source.port then
        if host.diagnosticFn!=void then host.diagnosticFn(host,candidate,source) end if
        candidate.netchan.channel.remoteAddress.port=source.port
      end if
      if host.processFn==void then return error(6993,"server packet event: missing netchan process") end if
      if host.processFn(host,candidate,msg) then
        if candidate.state!=CS_ZOMBIE then
          candidate.lastPacketTime=state.time
          if host.executeFn==void then return error(6994,"server packet event: missing client-message executor") end if
          host.executeFn(host,candidate,msg)
        end if
        return "accepted"
      end if
      return "rejected"
    end if
  end for
  if host.disconnectFn==void then return error(6995,"server packet event: missing disconnect sender") end if
  host.disconnectFn(host,source,"disconnect")
  return "unknown"
end function
