// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file facade for code/qcommon/msg.c.
package mq3.qcommon.msg

import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta
import mq3.qcommon.message_state_delta as stateDelta
import mq3.qcommon.huffman as huffman

/// ChangeReport record for qcommon.msg, containing `counts`, `printFn`, `context`.
struct ChangeReport
  /// Per-field counters recording which network fields changed.
  counts
  /// Host callback that prints per-field delta-compression change counts.
  printFn
  /// Caller-supplied data associated with printing statistics about changed network delta fields.
  context
end struct
/// NUHuffman record for qcommon.msg, containing `compressor`, `decompressor`, `frequencies`.
struct NUHuffman
  /// Huffman state used to encode outgoing message data.
  compressor
  /// Huffman state used to decode incoming message data.
  decompressor
  /// Reference symbol frequencies used to initialize both codec directions.
  frequencies
end struct

/// Compute init in qcommon.msg; the normal completion returns `message.initStorage(data, length, false)`.
/// @param data Data passed as `data` to `mq3.qcommon.message.initStorage`.
/// @param length Length passed as `length` to `mq3.qcommon.message.initStorage`.
function MSG_Init(data,length) if data==void then data=bytes(length,0) end if;return message.initStorage(data,length,false) end function
/// Compute init oob in qcommon.msg; the normal completion returns `message.initStorage(data, length, true)`.
/// @param data Data passed as `data` to `mq3.qcommon.message.initStorage`.
/// @param length Length passed as `length` to `mq3.qcommon.message.initStorage`.
function MSG_InitOOB(data,length) if data==void then data=bytes(length,0) end if;return message.initStorage(data,length,true) end function
/// Return `mq3.qcommon.message.clear(msg)` from `qcommon.msg.MSG_Clear`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.clear`.
function MSG_Clear(msg) return message.clear(msg) end function
/// Return `mq3.qcommon.message.bitstream(msg)` from `qcommon.msg.MSG_Bitstream`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.bitstream`.
function MSG_Bitstream(msg) return message.bitstream(msg) end function
/// Return `mq3.qcommon.message.beginReading(msg)` from `qcommon.msg.MSG_BeginReading`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.beginReading`.
function MSG_BeginReading(msg) return message.beginReading(msg) end function
/// Return `mq3.qcommon.message.beginReadingOob(msg)` from `qcommon.msg.MSG_BeginReadingOOB`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.beginReadingOob`.
function MSG_BeginReadingOOB(msg) return message.beginReadingOob(msg) end function
/// Return `mq3.qcommon.message.copy(source, length)` from `qcommon.msg.MSG_Copy`.
/// @param source Source passed as `source` to `mq3.qcommon.message.copy`.
/// @param length Length passed as `length` to `mq3.qcommon.message.copy`.
function MSG_Copy(source,length) return message.copy(source,length) end function

/// Return `mq3.qcommon.message.writeBits(msg, value, bits)` from `qcommon.msg.MSG_WriteBits`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeBits`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.writeBits`.
function MSG_WriteBits(msg,value,bits) return message.writeBits(msg,value,bits) end function
/// Return `mq3.qcommon.message.readBits(msg, bits)` from `qcommon.msg.MSG_ReadBits`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBits`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message.readBits`.
function MSG_ReadBits(msg,bits) return message.readBits(msg,bits) end function
/// Return `mq3.qcommon.message.writeChar(msg, value)` from `qcommon.msg.MSG_WriteChar`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeChar`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeChar`.
function MSG_WriteChar(msg,value) return message.writeChar(msg,value) end function
/// Return `mq3.qcommon.message.writeByte(msg, value)` from `qcommon.msg.MSG_WriteByte`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeByte`.
function MSG_WriteByte(msg,value) return message.writeByte(msg,value) end function
/// Write data in qcommon.msg; the normal completion returns `message.writeData(msg, slice(data, 0, length))`.
///
/// Validation failures include `MSG_WriteData: invalid length`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeData`.
/// @param data Data used in `len(data)` and `(length > len(data))`.
/// @param length Length used in `(length < 0)` and `(length > len(data))`.
function MSG_WriteData(msg,data,length) if length<0 or length>len(data) then return error(6802,"MSG_WriteData: invalid length") end if;return message.writeData(msg,slice(data,0,length)) end function
/// Return `mq3.qcommon.message.writeShort(msg, value)` from `qcommon.msg.MSG_WriteShort`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeShort`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeShort`.
function MSG_WriteShort(msg,value) return message.writeShort(msg,value) end function
/// Return `mq3.qcommon.message.writeLong(msg, value)` from `qcommon.msg.MSG_WriteLong`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeLong`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeLong`.
function MSG_WriteLong(msg,value) return message.writeLong(msg,value) end function
/// Return `mq3.qcommon.message.writeFloat(msg, value)` from `qcommon.msg.MSG_WriteFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeFloat`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeFloat`.
function MSG_WriteFloat(msg,value) return message.writeFloat(msg,value) end function
/// Return `mq3.qcommon.message.writeString(msg, value)` from `qcommon.msg.MSG_WriteString`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeString`.
/// @param value Text passed as `text` to `mq3.qcommon.message.writeString`.
function MSG_WriteString(msg,value) return message.writeString(msg,value) end function
/// Return `mq3.qcommon.message.writeBigString(msg, value)` from `qcommon.msg.MSG_WriteBigString`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBigString`.
/// @param value Text passed as `text` to `mq3.qcommon.message.writeBigString`.
function MSG_WriteBigString(msg,value) return message.writeBigString(msg,value) end function
/// Return `mq3.qcommon.message.writeAngle(msg, value)` from `qcommon.msg.MSG_WriteAngle`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeAngle`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeAngle`.
function MSG_WriteAngle(msg,value) return message.writeAngle(msg,value) end function
/// Return `mq3.qcommon.message.writeAngle16(msg, value)` from `qcommon.msg.MSG_WriteAngle16`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeAngle16`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeAngle16`.
function MSG_WriteAngle16(msg,value) return message.writeAngle16(msg,value) end function
/// Return `mq3.qcommon.message.readI8(msg)` from `qcommon.msg.MSG_ReadChar`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readI8`.
function MSG_ReadChar(msg) return message.readI8(msg) end function
/// Return `mq3.qcommon.message.readU8(msg)` from `qcommon.msg.MSG_ReadByte`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
function MSG_ReadByte(msg) return message.readU8(msg) end function
/// Return `mq3.qcommon.message.readI16(msg)` from `qcommon.msg.MSG_ReadShort`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readI16`.
function MSG_ReadShort(msg) return message.readI16(msg) end function
/// Return `mq3.qcommon.message.readI32(msg)` from `qcommon.msg.MSG_ReadLong`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readI32`.
function MSG_ReadLong(msg) return message.readI32(msg) end function
/// Return `mq3.qcommon.message.readFloat(msg)` from `qcommon.msg.MSG_ReadFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readFloat`.
function MSG_ReadFloat(msg) return message.readFloat(msg) end function
/// Return `mq3.qcommon.message.readCString(msg)` from `qcommon.msg.MSG_ReadString`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readCString`.
function MSG_ReadString(msg) return message.readCString(msg) end function
/// Return `mq3.qcommon.message.readBigCString(msg)` from `qcommon.msg.MSG_ReadBigString`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readBigCString`.
function MSG_ReadBigString(msg) return message.readBigCString(msg) end function
/// Return `mq3.qcommon.message.readCStringLine(msg)` from `qcommon.msg.MSG_ReadStringLine`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readCStringLine`.
function MSG_ReadStringLine(msg) return message.readCStringLine(msg) end function
/// Return `mq3.qcommon.message.readAngle16(msg)` from `qcommon.msg.MSG_ReadAngle16`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readAngle16`.
function MSG_ReadAngle16(msg) return message.readAngle16(msg) end function
/// Return `mq3.qcommon.message.readData(msg, length)` from `qcommon.msg.MSG_ReadData`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readData`.
/// @param length Length passed as `length` to `mq3.qcommon.message.readData`.
function MSG_ReadData(msg,length) return message.readData(msg,length) end function

/// Return `mq3.qcommon.message_delta.writeDelta(msg, oldValue, newValue, bits)` from `qcommon.msg.MSG_WriteDelta`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDelta`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDelta`.
/// @param newValue New v passed as `newV` to `mq3.qcommon.message_delta.writeDelta`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message_delta.writeDelta`.
function MSG_WriteDelta(msg,oldValue,newValue,bits) return delta.writeDelta(msg,oldValue,newValue,bits) end function
/// Return `mq3.qcommon.message_delta.readDelta(msg, oldValue, bits)` from `qcommon.msg.MSG_ReadDelta`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDelta`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.readDelta`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message_delta.readDelta`.
function MSG_ReadDelta(msg,oldValue,bits) return delta.readDelta(msg,oldValue,bits) end function
/// Return `mq3.qcommon.message_delta.writeDeltaFloat(msg, oldValue, newValue)` from `qcommon.msg.MSG_WriteDeltaFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaFloat`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaFloat`.
/// @param newValue New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaFloat`.
function MSG_WriteDeltaFloat(msg,oldValue,newValue) return delta.writeDeltaFloat(msg,oldValue,newValue) end function
/// Return `mq3.qcommon.message_delta.readDeltaFloat(msg, oldValue)` from `qcommon.msg.MSG_ReadDeltaFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaFloat`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaFloat`.
function MSG_ReadDeltaFloat(msg,oldValue) return delta.readDeltaFloat(msg,oldValue) end function
/// Return `mq3.qcommon.message_delta.writeDeltaKey(msg, key, oldValue, newValue, bits)` from `qcommon.msg.MSG_WriteDeltaKey`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaKey`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKey`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaKey`.
/// @param newValue New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaKey`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message_delta.writeDeltaKey`.
function MSG_WriteDeltaKey(msg,key,oldValue,newValue,bits) return delta.writeDeltaKey(msg,key,oldValue,newValue,bits) end function
/// Return `mq3.qcommon.message_delta.readDeltaKey(msg, key, oldValue, bits)` from `qcommon.msg.MSG_ReadDeltaKey`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaKey`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKey`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaKey`.
/// @param bits Bits passed as `bits` to `mq3.qcommon.message_delta.readDeltaKey`.
function MSG_ReadDeltaKey(msg,key,oldValue,bits) return delta.readDeltaKey(msg,key,oldValue,bits) end function
/// Return `mq3.qcommon.message_delta.writeDeltaKeyFloat(msg, key, oldValue, newValue)` from `qcommon.msg.MSG_WriteDeltaKeyFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`.
/// @param newValue New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`.
function MSG_WriteDeltaKeyFloat(msg,key,oldValue,newValue) return delta.writeDeltaKeyFloat(msg,key,oldValue,newValue) end function
/// Return `mq3.qcommon.message_delta.readDeltaKeyFloat(msg, key, oldValue)` from `qcommon.msg.MSG_ReadDeltaKeyFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaKeyFloat`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKeyFloat`.
/// @param oldValue Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaKeyFloat`.
function MSG_ReadDeltaKeyFloat(msg,key,oldValue) return delta.readDeltaKeyFloat(msg,key,oldValue) end function
/// Return `mq3.qcommon.message_delta.writeDeltaUsercmd(msg, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaUsercmd`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaUsercmd`.
/// @param fromValue Previous passed as `previous` to `mq3.qcommon.message_delta.writeDeltaUsercmd`.
/// @param toValue Current passed as `current` to `mq3.qcommon.message_delta.writeDeltaUsercmd`.
function MSG_WriteDeltaUsercmd(msg,fromValue,toValue) return delta.writeDeltaUsercmd(msg,fromValue,toValue) end function
/// Return `mq3.qcommon.message_delta.readDeltaUsercmd(msg, fromValue)` from `qcommon.msg.MSG_ReadDeltaUsercmd`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaUsercmd`.
/// @param fromValue Previous passed as `previous` to `mq3.qcommon.message_delta.readDeltaUsercmd`.
function MSG_ReadDeltaUsercmd(msg,fromValue) return delta.readDeltaUsercmd(msg,fromValue) end function
/// Return `mq3.qcommon.message_delta.writeDeltaUsercmdKey(msg, key, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaUsercmdKey`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`.
/// @param fromValue Previous passed as `previous` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`.
/// @param toValue Current passed as `current` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`.
function MSG_WriteDeltaUsercmdKey(msg,key,fromValue,toValue) return delta.writeDeltaUsercmdKey(msg,key,fromValue,toValue) end function
/// Return `mq3.qcommon.message_delta.readDeltaUsercmdKey(msg, key, fromValue)` from `qcommon.msg.MSG_ReadDeltaUsercmdKey`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`.
/// @param key Key passed as `key` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`.
/// @param fromValue Previous passed as `previous` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`.
function MSG_ReadDeltaUsercmdKey(msg,key,fromValue) return delta.readDeltaUsercmdKey(msg,key,fromValue) end function

/// Return `mq3.qcommon.message_state_delta.writeDeltaEntity(msg, fromValue, toValue, force)` from `qcommon.msg.MSG_WriteDeltaEntity`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_state_delta.writeDeltaEntity`.
/// @param fromValue Base state passed as `baseState` to `mq3.qcommon.message_state_delta.writeDeltaEntity`.
/// @param toValue Next state passed as `nextState` to `mq3.qcommon.message_state_delta.writeDeltaEntity`.
/// @param force Force passed as `force` to `mq3.qcommon.message_state_delta.writeDeltaEntity`.
function MSG_WriteDeltaEntity(msg,fromValue,toValue,force) return stateDelta.writeDeltaEntity(msg,fromValue,toValue,force) end function
/// Return `mq3.qcommon.message_state_delta.readDeltaEntity(msg, fromValue, number)` from `qcommon.msg.MSG_ReadDeltaEntity`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_state_delta.readDeltaEntity`.
/// @param fromValue Base state passed as `baseState` to `mq3.qcommon.message_state_delta.readDeltaEntity`.
/// @param number Number passed as `number` to `mq3.qcommon.message_state_delta.readDeltaEntity`.
function MSG_ReadDeltaEntity(msg,fromValue,number) return stateDelta.readDeltaEntity(msg,fromValue,number) end function
/// Return `mq3.qcommon.message_state_delta.writeDeltaPlayerstate(msg, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaPlayerstate`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`.
/// @param fromValue Base state passed as `baseState` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`.
/// @param toValue Next state passed as `nextState` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`.
function MSG_WriteDeltaPlayerstate(msg,fromValue,toValue) return stateDelta.writeDeltaPlayerstate(msg,fromValue,toValue) end function
/// Return `mq3.qcommon.message_state_delta.readDeltaPlayerstate(msg, fromValue)` from `qcommon.msg.MSG_ReadDeltaPlayerstate`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_state_delta.readDeltaPlayerstate`.
/// @param fromValue Base state passed as `baseState` to `mq3.qcommon.message_state_delta.readDeltaPlayerstate`.
function MSG_ReadDeltaPlayerstate(msg,fromValue) return stateDelta.readDeltaPlayerstate(msg,fromValue) end function

/// Compute report change vectors f in qcommon.msg; the normal completion returns `rows`.
/// @param report Record exposing `counts`, `printFn`, `context`.
function MSG_ReportChangeVectors_f(report)
  if report==void then return [] end if;rows=[]
  for index=0 to 255 if report.counts[index]!=0 then text=str(index)+" used "+str(report.counts[index])+"\n";rows=rows+[text];if report.printFn!=void then report.printFn(report.context,text) end if end if end for
  return rows
end function

// Baseq3 trains the global compressor and decompressor identically. Messages
// own immutable equivalents in MiniLang, avoiding process-global mutation.
function MSG_initHuffman() return huffman.initMessageStatic() end function
/// Compute n uinit huffman in qcommon.msg; the normal completion returns `NUHuffman(compressor, decompressor, frequencies)`.
///
/// Validation failures include `MSG_NUinitHuffman: missing sample`.
/// @param data Data used in `(data == void)`.
function MSG_NUinitHuffman(data)
  if data==void then return error(6802,"MSG_NUinitHuffman: missing sample") end if
  compressor=huffman.init();decompressor=huffman.init();frequencies=array(256,0)
  for each value in data value=value&255;huffman.addRef(compressor,value);huffman.addRef(decompressor,value);frequencies[value]=frequencies[value]+1 end for
  for value=0 to 255 if frequencies[value]==0 then huffman.addRef(compressor,value);huffman.addRef(decompressor,value) end if end for
  return NUHuffman(compressor,decompressor,frequencies)
end function
