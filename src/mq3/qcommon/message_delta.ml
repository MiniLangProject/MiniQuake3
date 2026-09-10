// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 scalar and usercmd delta codecs from qcommon/msg.c.
package mq3.qcommon.message_delta
import mq3.compat.numeric as n
import mq3.qcommon.message as message

struct UserCommand
  serverTime
  angles
  buttons
  weapon
  forwardmove
  rightmove
  upmove
end struct

function userCommand(serverTime,angle0,angle1,angle2,buttons,weapon,forwardmove,rightmove,upmove)
  return UserCommand(serverTime,[angle0,angle1,angle2],buttons,weapon,forwardmove,rightmove,upmove)
end function

function writeDelta(msg,oldV,newV,bits)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,newV,bits); return void
end function

function readDelta(msg,oldV,bits)
  if message.readBits(msg,1) != 0 then return message.readBits(msg,bits) end if
  return oldV
end function

function writeDeltaFloat(msg,oldV,newV)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,n.floatBits(newV),32); return void
end function

function readDeltaFloat(msg,oldV)
  if message.readBits(msg,1) != 0 then return n.bitsFloat(message.readBits(msg,32)) end if
  return oldV
end function

// This is deliberately the original table rather than a derived bits-wide
// mask: MSG_ReadDeltaKey indexes kbitmask with bits, not bits-1.
function keyMask(bits)
  masks=[0x00000001,0x00000003,0x00000007,0x0000000f,0x0000001f,0x0000003f,0x0000007f,0x000000ff,0x000001ff,0x000003ff,0x000007ff,0x00000fff,0x00001fff,0x00003fff,0x00007fff,0x0000ffff,0x0001ffff,0x0003ffff,0x0007ffff,0x000fffff,0x001fffff,0x003fffff,0x007fffff,0x00ffffff,0x01ffffff,0x03ffffff,0x07ffffff,0x0fffffff,0x1fffffff,0x3fffffff,0x7fffffff,0xffffffff]
  return masks[bits]
end function

function writeDeltaKey(msg,key,oldV,newV,bits)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,newV^key,bits); return void
end function

function readDeltaKey(msg,key,oldV,bits)
  if message.readBits(msg,1) != 0 then return message.readBits(msg,bits) ^ (key & keyMask(bits)) end if
  return oldV
end function

function writeDeltaKeyFloat(msg,key,oldV,newV)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,n.floatBits(newV)^key,32); return void
end function

function readDeltaKeyFloat(msg,key,oldV)
  if message.readBits(msg,1) != 0 then return n.bitsFloat(message.readBits(msg,32)^key) end if
  return oldV
end function

function writeTime(msg,previous,current)
  delta=n.i32(current.serverTime-previous.serverTime)
  if delta < 256 then
    message.writeBits(msg,1,1); message.writeBits(msg,delta,8)
  else
    message.writeBits(msg,0,1); message.writeBits(msg,current.serverTime,32)
  end if
  return void
end function

function readTime(msg,previous)
  if message.readBits(msg,1) != 0 then return n.add32(previous.serverTime,message.readBits(msg,8)) end if
  return message.readBits(msg,32)
end function

function writeDeltaUsercmd(msg,previous,current)
  writeTime(msg,previous,current)
  writeDelta(msg,previous.angles[0],current.angles[0],16)
  writeDelta(msg,previous.angles[1],current.angles[1],16)
  writeDelta(msg,previous.angles[2],current.angles[2],16)
  writeDelta(msg,previous.forwardmove,current.forwardmove,8)
  writeDelta(msg,previous.rightmove,current.rightmove,8)
  writeDelta(msg,previous.upmove,current.upmove,8)
  writeDelta(msg,previous.buttons,current.buttons,16)
  writeDelta(msg,previous.weapon,current.weapon,8)
  return void
end function

function readDeltaUsercmd(msg,previous)
  current=userCommand(readTime(msg,previous),0,0,0,0,0,0,0,0)
  current.angles[0]=readDelta(msg,previous.angles[0],16)
  current.angles[1]=readDelta(msg,previous.angles[1],16)
  current.angles[2]=readDelta(msg,previous.angles[2],16)
  current.forwardmove=n.i8(readDelta(msg,previous.forwardmove,8))
  current.rightmove=n.i8(readDelta(msg,previous.rightmove,8))
  current.upmove=n.i8(readDelta(msg,previous.upmove,8))
  current.buttons=readDelta(msg,previous.buttons,16)
  current.weapon=readDelta(msg,previous.weapon,8)&255
  return current
end function

function samePayload(previous,current)
  return previous.angles[0]==current.angles[0] and previous.angles[1]==current.angles[1] and previous.angles[2]==current.angles[2] and previous.forwardmove==current.forwardmove and previous.rightmove==current.rightmove and previous.upmove==current.upmove and previous.buttons==current.buttons and previous.weapon==current.weapon
end function

function writeDeltaUsercmdKey(msg,key,previous,current)
  writeTime(msg,previous,current)
  if samePayload(previous,current) then message.writeBits(msg,0,1); return void end if
  key=n.i32(key^current.serverTime); message.writeBits(msg,1,1)
  writeDeltaKey(msg,key,previous.angles[0],current.angles[0],16)
  writeDeltaKey(msg,key,previous.angles[1],current.angles[1],16)
  writeDeltaKey(msg,key,previous.angles[2],current.angles[2],16)
  writeDeltaKey(msg,key,previous.forwardmove,current.forwardmove,8)
  writeDeltaKey(msg,key,previous.rightmove,current.rightmove,8)
  writeDeltaKey(msg,key,previous.upmove,current.upmove,8)
  writeDeltaKey(msg,key,previous.buttons,current.buttons,16)
  writeDeltaKey(msg,key,previous.weapon,current.weapon,8)
  return void
end function

function readDeltaUsercmdKey(msg,key,previous)
  current=userCommand(readTime(msg,previous),0,0,0,0,0,0,0,0)
  if message.readBits(msg,1) != 0 then
    key=n.i32(key^current.serverTime)
    current.angles[0]=readDeltaKey(msg,key,previous.angles[0],16)
    current.angles[1]=readDeltaKey(msg,key,previous.angles[1],16)
    current.angles[2]=readDeltaKey(msg,key,previous.angles[2],16)
    current.forwardmove=n.i8(readDeltaKey(msg,key,previous.forwardmove,8))
    current.rightmove=n.i8(readDeltaKey(msg,key,previous.rightmove,8))
    current.upmove=n.i8(readDeltaKey(msg,key,previous.upmove,8))
    current.buttons=readDeltaKey(msg,key,previous.buttons,16)
    current.weapon=readDeltaKey(msg,key,previous.weapon,8)&255
  else
    current.angles[0]=previous.angles[0];current.angles[1]=previous.angles[1];current.angles[2]=previous.angles[2]
    current.forwardmove=previous.forwardmove;current.rightmove=previous.rightmove;current.upmove=previous.upmove
    current.buttons=previous.buttons;current.weapon=previous.weapon
  end if
  return current
end function
