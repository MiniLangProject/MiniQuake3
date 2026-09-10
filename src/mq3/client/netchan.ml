// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 client channel wrapper from client/cl_net_chan.c.
package mq3.client.netchan
import mq3.qcommon.message as message
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric

const MAX_RELIABLE_COMMANDS=64
const CL_ENCODE_START=12
const CL_DECODE_START=4
const CLC_EOF=5

struct Connection challenge reliableCommands serverCommands end struct
struct Runtime transport connection newsize end struct

function createConnection()
  return Connection(0,array(MAX_RELIABLE_COMMANDS,""),array(MAX_RELIABLE_COMMANDS,""))
end function

function create(transport,connection)
  if connection==void then connection=createConnection() end if
  return Runtime(transport,connection,0)
end function

function commandByte(raw,index)
  if index<0 or index>=len(raw) then return 0 end if
  return raw[index]
end function

function mix(msg,start,key,text)
  raw=bytes(text);index=0
  if start<msg.cursize then
    for offset=start to msg.cursize-1
      value=commandByte(raw,index)
      if value==0 then index=0;value=commandByte(raw,index) end if
      if value>127 or value==37 then value=46 end if
      key=(key^(value<<(offset&1)))&255;index=index+1
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return void
end function

function encode(connection,msg)
  if msg.cursize<=CL_ENCODE_START then return void end if
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.bit=0;msg.readcount=0;msg.oob=false
  serverId=message.readI32(msg);messageAcknowledge=message.readI32(msg);reliableAcknowledge=message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  text=connection.serverCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  mix(msg,CL_ENCODE_START,(connection.challenge^serverId^messageAcknowledge)&255,text)
  return void
end function

function decodeMessage(connection,msg)
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.oob=false;reliableAcknowledge=message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  sequence=numeric.readI32(msg.data,0)
  text=connection.reliableCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  mix(msg,msg.readcount+CL_DECODE_START,(connection.challenge^sequence)&255,text)
  return void
end function

function transmitNextFragment(runtime,channel)
  return netchan.transmitNextFragment(runtime.transport,channel)
end function

function transmit(runtime,channel,msg)
  message.writeByte(msg,CLC_EOF)
  encode(runtime.connection,msg)
  return netchan.transmit(runtime.transport,channel,slice(msg.data,0,msg.cursize))
end function

function process(runtime,channel,msg)
  result=netchan.process(channel,slice(msg.data,0,msg.cursize),msg.maxsize)
  if not result.accepted then return false end if
  msg.data=result.data;msg.cursize=result.cursize;msg.readcount=result.readcount;msg.bit=result.bit
  decodeMessage(runtime.connection,msg);runtime.newsize=runtime.newsize+msg.cursize
  return true
end function
