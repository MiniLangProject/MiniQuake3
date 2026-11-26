// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 entityState_t and playerState_t delta codecs baseState qcommon/msg.c.
package mq3.qcommon.message_state_delta
import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate

/// Don't need to send any more.
const GENTITYNUM_BITS = 10
/// Maximum number of addressable game-entity slots.
const MAX_GENTITIES = 1024
/// Number of payload bits used when a delta-compressed float is represented as an integer.
const FLOAT_INT_BITS = 13
/// Bias added to signed integer-like floats before compact delta encoding.
const FLOAT_INT_BIAS = 4096

// Struct byte offsets in the exact, deliberately hand-tuned wire order of msg.c.
function entityOffsets() return [16,24,28,36,40,32,64,44,60,180,132,4,200,184,196,148,12,8,140,192,168,120,20,48,92,96,100,176,188,160,144,156,204,112,104,108,164,116,84,52,56,68,72,76,80,88,124,128,136,152,172] end function
/// Compute qcommon.message_state_delta.entityBits as `[32, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 8, 8, 8, 8, 10, 8, 19, 10, 8, 8, 0, 32, 8, 0, 0, 0, 24, 16, 8, 10, 8, 8, 0, 0, 0, 8, 0, 32, 32, 32, 0, 0, 0, 0, 32, 0, 0, 0, 32, 16]`.
function entityBits() return [32,0,0,0,0,0,0,0,0,10,0,8,8,8,8,10,8,19,10,8,8,0,32,8,0,0,0,24,16,8,10,8,8,0,0,0,8,0,32,32,32,0,0,0,0,32,0,0,0,32,16] end function
/// Compute qcommon.message_state_delta.playerOffsets as `[0, 20, 24, 8, 32, 36, 156, 152, 44, 28, 40, 72, 16, 108, 84, 88, 112, 76, 116, 12, 68, 148, 104, 128, 48, 52, 60, 132, 164, 168, 172, 176, 180, 440, 4, 56, 64, 80, 120, 124, 140, 144, 160, 92, 96, 100, 448, 444]`.
function playerOffsets() return [0,20,24,8,32,36,156,152,44,28,40,72,16,108,84,88,112,76,116,12,68,148,104,128,48,52,60,132,164,168,172,176,180,440,4,56,64,80,120,124,140,144,160,92,96,100,448,444] end function
/// Compute qcommon.message_state_delta.playerBits as `[32, 0, 0, 8, 0, 0, 0, 0, - 16, 0, 0, 8, - 16, 16, 8, 4, 8, 8, 8, 16, 10, 4, 16, 10, 16, 16, 16, 8, - 8, 8, 8, 8, 8, 8, 8, 16, 16, 12, 8, 8, 8, 5, 0, 0, 0, 0, 10, 16]`.
function playerBits() return [32,0,0,8,0,0,0,0,-16,0,0,8,-16,16,8,4,8,8,8,16,10,4,16,10,16,16,16,8,-8,8,8,8,8,8,8,16,16,12,8,8,8,5,0,0,0,0,10,16] end function

/// Compute state data in qcommon.message_state_delta; the normal completion returns `data`.
/// @param words Words used in `len(words)` and `words[index]`.
/// @param size Size used in `bytes(size, 0)`.
function stateData(words,size)
  data=bytes(size,0)
  for index=0 to len(words)-1 n.writeU32(data,index*4,words[index]) end for
  return data
end function

/// Return `mq3.qcommon.message_state_delta.stateData(entitystate.words(state), entitystate.BYTE_SIZE)` from `qcommon.message_state_delta.entityData`.
/// @param state State passed as `state` to `mq3.game.entitystate.words`.
function entityData(state) return stateData(entitystate.words(state),entitystate.BYTE_SIZE) end function
/// Return `mq3.qcommon.message_state_delta.stateData(playerstate.words(state), playerstate.BYTE_SIZE)` from `qcommon.message_state_delta.playerData`.
/// @param state Ps passed as `ps` to `mq3.game.playerstate.words`.
function playerData(state) return stateData(playerstate.words(state),playerstate.BYTE_SIZE) end function

/// Write float in qcommon.message_state_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param raw Low 32 bits containing an IEEE-754 binary32 encoding.
/// @param allowZero Allow zero operand used by `writeFloat`; its reads are shown in the implementation.
function writeFloat(msg,raw,allowZero)
  value=n.bitsFloat(raw); trunc=n.trunc32(value)
  if allowZero then
    if value==0.0 then message.writeBits(msg,0,1);return void end if
    message.writeBits(msg,1,1)
  end if
  if trunc==value and trunc+FLOAT_INT_BIAS>=0 and trunc+FLOAT_INT_BIAS<(1<<FLOAT_INT_BITS) then
    message.writeBits(msg,0,1);message.writeBits(msg,trunc+FLOAT_INT_BIAS,FLOAT_INT_BITS)
  else
    message.writeBits(msg,1,1);message.writeBits(msg,raw,32)
  end if
  return void
end function

/// Read float in qcommon.message_state_delta; the normal completion returns `message.readBits(msg, 32)`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param allowZero Allow zero used in `(allowZero and (message.readBits(msg, 1) == 0))`.
function readFloat(msg,allowZero)
  if allowZero and message.readBits(msg,1)==0 then return n.floatBits(0.0) end if
  if message.readBits(msg,1)==0 then return n.floatBits(n.f32(message.readBits(msg,FLOAT_INT_BITS)-FLOAT_INT_BIAS)) end if
  return message.readBits(msg,32)
end function

// Returns true when a record was emitted. A void `nextState` emits a remove record.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param baseState Record exposing `number`.
/// @param nextState Record exposing `number`.
/// @param force Force operand used by `writeDeltaEntity`; its reads are shown in the implementation.
function writeDeltaEntity(msg,baseState,nextState,force)
  if nextState==void then
    if baseState==void then return false end if
    message.writeBits(msg,baseState.number,GENTITYNUM_BITS);message.writeBits(msg,1,1);return true
  end if
  if nextState.number<0 or nextState.number>=MAX_GENTITIES then return error(6840,"message delta: bad entity number") end if
  if baseState==void then baseState=entitystate.create() end if
  fromData=entityData(baseState);toData=entityData(nextState);lc=0;offsets=entityOffsets();widths=entityBits()
  for index=0 to len(offsets)-1
    offset=offsets[index]
    if n.readI32(fromData,offset)!=n.readI32(toData,offset) then lc=index+1 end if
  end for
  if lc==0 then
    if not force then return false end if
    message.writeBits(msg,nextState.number,GENTITYNUM_BITS);message.writeBits(msg,0,1);message.writeBits(msg,0,1);return true
  end if
  message.writeBits(msg,nextState.number,GENTITYNUM_BITS);message.writeBits(msg,0,1);message.writeBits(msg,1,1);message.writeByte(msg,lc)
  for index=0 to lc-1
    offset=offsets[index];old=n.readI32(fromData,offset);value=n.readI32(toData,offset)
    if old==value then message.writeBits(msg,0,1) else
      message.writeBits(msg,1,1);bits=widths[index]
      if bits==0 then writeFloat(msg,value,true) else
        if value==0 then message.writeBits(msg,0,1) else message.writeBits(msg,1,1);message.writeBits(msg,value,bits) end if
      end if
    end if
  end for
  return true
end function

// The entity number has already been consumed, as in MSG_ReadDeltaEntity.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param baseState Source passed as `source` to `mq3.game.entitystate.copy`.
/// @param number Number used in `(number < 0)` and `(number >= MAX_GENTITIES)`.
function readDeltaEntity(msg,baseState,number)
  if number<0 or number>=MAX_GENTITIES then return error(6841,"message delta: bad entity number") end if
  if baseState==void then baseState=entitystate.create() end if
  if message.readBits(msg,1)==1 then result=entitystate.create();result.number=MAX_GENTITIES-1;return result end if
  if message.readBits(msg,1)==0 then result=entitystate.copy(baseState);result.number=number;return result end if
  lc=message.readU8(msg)
  offsets=entityOffsets();widths=entityBits()
  if lc<0 or lc>len(offsets) then return error(6842,"message delta: bad entity field count") end if
  data=entityData(baseState)
  if lc>0 then
    for index=0 to lc-1
      if message.readBits(msg,1)==1 then
        bits=widths[index];value=0
        if bits==0 then value=readFloat(msg,true)
        else if message.readBits(msg,1)==0 then value=0 else value=message.readBits(msg,bits) end if
        n.writeU32(data,offsets[index],value)
      end if
    end for
  end if
  result=entitystate.load(data,0);result.number=number;return result
end function

/// Compute array mask in qcommon.message_state_delta; the normal completion returns `mask`.
/// @param toValues To values used in `toValues[index]` and `(toValues[index] != fromValues[index])`.
/// @param fromValues From values used in `fromValues[index]` and `(toValues[index] != fromValues[index])`.
function arrayMask(toValues,fromValues)
  mask=0
  for index=0 to 15 if toValues[index]!=fromValues[index] then mask=mask|(1<<index) end if end for
  return mask
end function

/// Write short array in qcommon.message_state_delta.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeShort`.
/// @param mask Value passed as `value` to `mq3.qcommon.message.writeShort`.
/// @param values Values used in `values[index]` and `message.writeShort(msg, values[index])`.
function writeShortArray(msg,mask,values)
  message.writeShort(msg,mask)
  for index=0 to 15 if (mask&(1<<index))!=0 then message.writeShort(msg,values[index]) end if end for
  return void
end function

/// Write delta playerstate in qcommon.message_state_delta.
///
/// Validation failures include `message delta: missing playerstate`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param baseState Record exposing `stats`, `persistant`, `ammo`, `powerups`.
/// @param nextState Record exposing `stats`, `persistant`, `ammo`, `powerups`.
function writeDeltaPlayerstate(msg,baseState,nextState)
  if nextState==void then return error(6843,"message delta: missing playerstate") end if
  if baseState==void then baseState=playerstate.create() end if
  fromData=playerData(baseState);toData=playerData(nextState);lc=0;offsets=playerOffsets();widths=playerBits()
  for index=0 to len(offsets)-1
    offset=offsets[index]
    if n.readI32(fromData,offset)!=n.readI32(toData,offset) then lc=index+1 end if
  end for
  message.writeByte(msg,lc)
  if lc>0 then
    for index=0 to lc-1
      offset=offsets[index];old=n.readI32(fromData,offset);value=n.readI32(toData,offset)
      if old==value then message.writeBits(msg,0,1) else
        message.writeBits(msg,1,1);bits=widths[index]
        if bits==0 then writeFloat(msg,value,false) else message.writeBits(msg,value,bits) end if
      end if
    end for
  end if
  statsMask=arrayMask(nextState.stats,baseState.stats);persistantMask=arrayMask(nextState.persistant,baseState.persistant)
  ammoMask=arrayMask(nextState.ammo,baseState.ammo);powerupMask=arrayMask(nextState.powerups,baseState.powerups)
  if statsMask==0 and persistantMask==0 and ammoMask==0 and powerupMask==0 then message.writeBits(msg,0,1);return void end if
  message.writeBits(msg,1,1)
  if statsMask!=0 then message.writeBits(msg,1,1);writeShortArray(msg,statsMask,nextState.stats) else message.writeBits(msg,0,1) end if
  if persistantMask!=0 then message.writeBits(msg,1,1);writeShortArray(msg,persistantMask,nextState.persistant) else message.writeBits(msg,0,1) end if
  if ammoMask!=0 then message.writeBits(msg,1,1);writeShortArray(msg,ammoMask,nextState.ammo) else message.writeBits(msg,0,1) end if
  if powerupMask!=0 then
    message.writeBits(msg,1,1);message.writeShort(msg,powerupMask)
    for index=0 to 15 if (powerupMask&(1<<index))!=0 then message.writeLong(msg,nextState.powerups[index]) end if end for
  else message.writeBits(msg,0,1) end if
  return void
end function

/// Read short array in qcommon.message_state_delta; updates `values entries`.
///
/// Direct state writes: `values elements`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readI16`.
/// @param values Mutable sequence written at `index`.
function readShortArray(msg,values)
  mask=message.readI16(msg)
  for index=0 to 15 if (mask&(1<<index))!=0 then values[index]=message.readI16(msg) end if end for
  return void
end function

/// Read delta playerstate in qcommon.message_state_delta; the normal completion returns `result`.
///
/// Validation failures include `message delta: bad player field count`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
/// @param baseState State passed as `state` to `mq3.qcommon.message_state_delta.playerData`.
function readDeltaPlayerstate(msg,baseState)
  if baseState==void then baseState=playerstate.create() end if
  data=playerData(baseState);lc=message.readU8(msg);offsets=playerOffsets();widths=playerBits()
  if lc<0 or lc>len(offsets) then return error(6844,"message delta: bad player field count") end if
  if lc>0 then
    for index=0 to lc-1
      if message.readBits(msg,1)==1 then
        bits=widths[index];value=0
        if bits==0 then value=readFloat(msg,false) else value=message.readBits(msg,bits) end if
        n.writeU32(data,offsets[index],value)
      end if
    end for
  end if
  result=playerstate.load(data,0)
  if message.readBits(msg,1)==1 then
    if message.readBits(msg,1)==1 then readShortArray(msg,result.stats) end if
    if message.readBits(msg,1)==1 then readShortArray(msg,result.persistant) end if
    if message.readBits(msg,1)==1 then readShortArray(msg,result.ammo) end if
    if message.readBits(msg,1)==1 then
      mask=message.readI16(msg)
      for index=0 to 15 if (mask&(1<<index))!=0 then result.powerups[index]=message.readI32(msg) end if end for
    end if
  end if
  return result
end function
