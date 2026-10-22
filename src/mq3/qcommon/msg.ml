// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file facade for code/qcommon/msg.c.
package mq3.qcommon.msg

import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta
import mq3.qcommon.message_state_delta as stateDelta
import mq3.qcommon.huffman as huffman

struct ChangeReport counts printFn context end struct
struct NUHuffman compressor decompressor frequencies end struct

function MSG_Init(data,length) if data==void then data=bytes(length,0) end if;return message.initStorage(data,length,false) end function
function MSG_InitOOB(data,length) if data==void then data=bytes(length,0) end if;return message.initStorage(data,length,true) end function
function MSG_Clear(msg) return message.clear(msg) end function
function MSG_Bitstream(msg) return message.bitstream(msg) end function
function MSG_BeginReading(msg) return message.beginReading(msg) end function
function MSG_BeginReadingOOB(msg) return message.beginReadingOob(msg) end function
function MSG_Copy(source,length) return message.copy(source,length) end function

function MSG_WriteBits(msg,value,bits) return message.writeBits(msg,value,bits) end function
function MSG_ReadBits(msg,bits) return message.readBits(msg,bits) end function
function MSG_WriteChar(msg,value) return message.writeChar(msg,value) end function
function MSG_WriteByte(msg,value) return message.writeByte(msg,value) end function
function MSG_WriteData(msg,data,length) if length<0 or length>len(data) then return error(6802,"MSG_WriteData: invalid length") end if;return message.writeData(msg,slice(data,0,length)) end function
function MSG_WriteShort(msg,value) return message.writeShort(msg,value) end function
function MSG_WriteLong(msg,value) return message.writeLong(msg,value) end function
function MSG_WriteFloat(msg,value) return message.writeFloat(msg,value) end function
function MSG_WriteString(msg,value) return message.writeString(msg,value) end function
function MSG_WriteBigString(msg,value) return message.writeBigString(msg,value) end function
function MSG_WriteAngle(msg,value) return message.writeAngle(msg,value) end function
function MSG_WriteAngle16(msg,value) return message.writeAngle16(msg,value) end function
function MSG_ReadChar(msg) return message.readI8(msg) end function
function MSG_ReadByte(msg) return message.readU8(msg) end function
function MSG_ReadShort(msg) return message.readI16(msg) end function
function MSG_ReadLong(msg) return message.readI32(msg) end function
function MSG_ReadFloat(msg) return message.readFloat(msg) end function
function MSG_ReadString(msg) return message.readCString(msg) end function
function MSG_ReadBigString(msg) return message.readBigCString(msg) end function
function MSG_ReadStringLine(msg) return message.readCStringLine(msg) end function
function MSG_ReadAngle16(msg) return message.readAngle16(msg) end function
function MSG_ReadData(msg,length) return message.readData(msg,length) end function

function MSG_WriteDelta(msg,oldValue,newValue,bits) return delta.writeDelta(msg,oldValue,newValue,bits) end function
function MSG_ReadDelta(msg,oldValue,bits) return delta.readDelta(msg,oldValue,bits) end function
function MSG_WriteDeltaFloat(msg,oldValue,newValue) return delta.writeDeltaFloat(msg,oldValue,newValue) end function
function MSG_ReadDeltaFloat(msg,oldValue) return delta.readDeltaFloat(msg,oldValue) end function
function MSG_WriteDeltaKey(msg,key,oldValue,newValue,bits) return delta.writeDeltaKey(msg,key,oldValue,newValue,bits) end function
function MSG_ReadDeltaKey(msg,key,oldValue,bits) return delta.readDeltaKey(msg,key,oldValue,bits) end function
function MSG_WriteDeltaKeyFloat(msg,key,oldValue,newValue) return delta.writeDeltaKeyFloat(msg,key,oldValue,newValue) end function
function MSG_ReadDeltaKeyFloat(msg,key,oldValue) return delta.readDeltaKeyFloat(msg,key,oldValue) end function
function MSG_WriteDeltaUsercmd(msg,fromValue,toValue) return delta.writeDeltaUsercmd(msg,fromValue,toValue) end function
function MSG_ReadDeltaUsercmd(msg,fromValue) return delta.readDeltaUsercmd(msg,fromValue) end function
function MSG_WriteDeltaUsercmdKey(msg,key,fromValue,toValue) return delta.writeDeltaUsercmdKey(msg,key,fromValue,toValue) end function
function MSG_ReadDeltaUsercmdKey(msg,key,fromValue) return delta.readDeltaUsercmdKey(msg,key,fromValue) end function

function MSG_WriteDeltaEntity(msg,fromValue,toValue,force) return stateDelta.writeDeltaEntity(msg,fromValue,toValue,force) end function
function MSG_ReadDeltaEntity(msg,fromValue,number) return stateDelta.readDeltaEntity(msg,fromValue,number) end function
function MSG_WriteDeltaPlayerstate(msg,fromValue,toValue) return stateDelta.writeDeltaPlayerstate(msg,fromValue,toValue) end function
function MSG_ReadDeltaPlayerstate(msg,fromValue) return stateDelta.readDeltaPlayerstate(msg,fromValue) end function

function MSG_ReportChangeVectors_f(report)
  if report==void then return [] end if;rows=[]
  for index=0 to 255 if report.counts[index]!=0 then text=str(index)+" used "+str(report.counts[index])+"\n";rows=rows+[text];if report.printFn!=void then report.printFn(report.context,text) end if end if end for
  return rows
end function

// Baseq3 trains the global compressor and decompressor identically. Messages
// own immutable equivalents in MiniLang, avoiding process-global mutation.
function MSG_initHuffman() return huffman.initMessageStatic() end function
function MSG_NUinitHuffman(data)
  if data==void then return error(6802,"MSG_NUinitHuffman: missing sample") end if
  compressor=huffman.init();decompressor=huffman.init();frequencies=array(256,0)
  for each value in data value=value&255;huffman.addRef(compressor,value);huffman.addRef(decompressor,value);frequencies[value]=frequencies[value]+1 end for
  for value=0 to 255 if frequencies[value]==0 then huffman.addRef(compressor,value);huffman.addRef(decompressor,value) end if end for
  return NUHuffman(compressor,decompressor,frequencies)
end function
