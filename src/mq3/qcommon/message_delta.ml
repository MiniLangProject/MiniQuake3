// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 scalar and usercmd delta codecs from qcommon/msg.c.
package mq3.qcommon.message_delta
import mq3.compat.numeric as n
import mq3.qcommon.message as message

/// UserCommand record for qcommon.message_delta, containing `serverTime`, `angles`, `buttons`, `weapon`, `forwardmove`, `rightmove`, and 1 further fields.
struct UserCommand
  /// Server simulation timestamp carried by this user command.
  serverTime
  /// Pitch, yaw, and roll values carried by the entity or user command.
  angles
  /// Bit mask of pressed user-command buttons.
  buttons
  /// Weapon identifier selected by the bot or user command.
  weapon
  /// Signed forward/backward movement input.
  forwardmove
  /// Signed right/left movement input.
  rightmove
  /// Signed upward/downward movement input.
  upmove
end struct

/// Create `mq3.qcommon.message_delta.UserCommand` with serverTime=serverTime; angles=[angle0, angle1, angle2]; buttons=buttons; weapon=weapon; forwardmove=forwardmove; rightmove=rightmove; upmove=upmove.
/// @param serverTime Initial `serverTime` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param angle0 Angle 0 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`.
/// @param angle1 Angle 1 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`.
/// @param angle2 Angle 2 used in `UserCommand(serverTime, [angle0, angle1, angle2], buttons, weapon, forwardmove, rightmove, upmove)`.
/// @param buttons Initial `buttons` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param weapon Initial `weapon` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param forwardmove Initial `forwardmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param rightmove Initial `rightmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param upmove Initial `upmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
function userCommand(serverTime,angle0,angle1,angle2,buttons,weapon,forwardmove,rightmove,upmove)
  return UserCommand(serverTime,[angle0,angle1,angle2],buttons,weapon,forwardmove,rightmove,upmove)
end function

/// Write delta in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param oldV Old v used in `(oldV == newV)`.
/// @param newV Value passed as `value` to `mq3.qcommon.message.writeBits`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.writeBits`.
function writeDelta(msg,oldV,newV,bits)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,newV,bits); return void
end function

/// Read delta in qcommon.message_delta; the normal completion returns `oldV`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param oldV Value returned unchanged by this function.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.readBits`.
function readDelta(msg,oldV,bits)
  if message.readBits(msg,1) != 0 then return message.readBits(msg,bits) end if
  return oldV
end function

/// Write delta float in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param oldV Old v used in `(oldV == newV)`.
/// @param newV Floating-point value to narrow and reinterpret.
function writeDeltaFloat(msg,oldV,newV)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,n.floatBits(newV),32); return void
end function

/// Read delta float in qcommon.message_delta; the normal completion returns `oldV`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param oldV Value returned unchanged by this function.
function readDeltaFloat(msg,oldV)
  if message.readBits(msg,1) != 0 then return n.bitsFloat(message.readBits(msg,32)) end if
  return oldV
end function

// This is deliberately the original table rather than a derived bits-wide
// mask: MSG_ReadDeltaKey indexes kbitmask with bits, not bits-1.
/// @param bits Zero-based index into `masks`.
function keyMask(bits)
  masks=[0x00000001,0x00000003,0x00000007,0x0000000f,0x0000001f,0x0000003f,0x0000007f,0x000000ff,0x000001ff,0x000003ff,0x000007ff,0x00000fff,0x00001fff,0x00003fff,0x00007fff,0x0000ffff,0x0001ffff,0x0003ffff,0x0007ffff,0x000fffff,0x001fffff,0x003fffff,0x007fffff,0x00ffffff,0x01ffffff,0x03ffffff,0x07ffffff,0x0fffffff,0x1fffffff,0x3fffffff,0x7fffffff,0xffffffff]
  return masks[bits]
end function

/// Write delta key in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param key Key used in `(newV ^ key)` and `message.writeBits(msg, (newV ^ key), bits)`.
/// @param oldV Old v used in `(oldV == newV)`.
/// @param newV New v used in `(newV ^ key)` and `(oldV == newV)`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.writeBits`.
function writeDeltaKey(msg,key,oldV,newV,bits)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,newV^key,bits); return void
end function

/// Read delta key in qcommon.message_delta; the normal completion returns `oldV`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param key Key used in `(key & keyMask(bits))` and `(message.readBits(msg, bits) ^ (key & keyMask(bits)))`.
/// @param oldV Value returned unchanged by this function.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.readBits`.
function readDeltaKey(msg,key,oldV,bits)
  if message.readBits(msg,1) != 0 then return message.readBits(msg,bits) ^ (key & keyMask(bits)) end if
  return oldV
end function

/// Write delta key float in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param key Key used in `(n.floatBits(newV) ^ key)` and `message.writeBits(msg, (n.floatBits(newV) ^ key), 32)`.
/// @param oldV Old v used in `(oldV == newV)`.
/// @param newV Floating-point value to narrow and reinterpret.
function writeDeltaKeyFloat(msg,key,oldV,newV)
  if oldV == newV then message.writeBits(msg,0,1); return void end if
  message.writeBits(msg,1,1); message.writeBits(msg,n.floatBits(newV)^key,32); return void
end function

/// Read delta key float in qcommon.message_delta; the normal completion returns `oldV`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param key Key used in `(message.readBits(msg, 32) ^ key)` and `n.bitsFloat((message.readBits(msg, 32) ^ key))`.
/// @param oldV Value returned unchanged by this function.
function readDeltaKeyFloat(msg,key,oldV)
  if message.readBits(msg,1) != 0 then return n.bitsFloat(message.readBits(msg,32)^key) end if
  return oldV
end function

/// Write time in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param previous Record exposing `serverTime`.
/// @param current Record exposing `serverTime`.
function writeTime(msg,previous,current)
  delta=n.i32(current.serverTime-previous.serverTime)
  if delta < 256 then
    message.writeBits(msg,1,1); message.writeBits(msg,delta,8)
  else
    message.writeBits(msg,0,1); message.writeBits(msg,current.serverTime,32)
  end if
  return void
end function

/// Read time in qcommon.message_delta; the normal completion returns `message.readBits(msg, 32)`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param previous Record exposing `serverTime`.
function readTime(msg,previous)
  if message.readBits(msg,1) != 0 then return n.add32(previous.serverTime,message.readBits(msg,8)) end if
  return message.readBits(msg,32)
end function

/// Write delta usercmd in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeTime`.
/// @param previous Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
/// @param current Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
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

/// Read delta usercmd in qcommon.message_delta; the normal completion returns `current`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readTime`.
/// @param previous Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
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

/// Compare user-command angles, movement axes, buttons, and weapon while excluding the server timestamp.
/// @param previous Previous user-command payload.
/// @param current Current user-command payload to compare.
function samePayload(previous,current)
  return previous.angles[0]==current.angles[0] and previous.angles[1]==current.angles[1] and previous.angles[2]==current.angles[2] and previous.forwardmove==current.forwardmove and previous.rightmove==current.rightmove and previous.upmove==current.upmove and previous.buttons==current.buttons and previous.weapon==current.weapon
end function

/// Write delta usercmd key in qcommon.message_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeTime`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKey`.
/// @param previous Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
/// @param current Record exposing `serverTime`, `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
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

/// Read delta usercmd key in qcommon.message_delta; the normal completion returns `current`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readTime`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKey`.
/// @param previous Record exposing `angles`, `forwardmove`, `rightmove`, `upmove`, `buttons`, `weapon`.
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
