// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 msg_t primitives, including the protocol-68 Huffman bitstream.
package mq3.qcommon.message
import mq3.compat.numeric as n
import mq3.qcommon.huffman as huffman

const MAX_STRING_CHARS = 1024
const BIG_INFO_STRING = 8192

/// Message record for qcommon.message, containing `allowoverflow`, `overflowed`, `oob`, `data`, `maxsize`, `cursize`, and 3 further fields.
struct Message
  allowoverflow
  overflowed
  oob
  data
  maxsize
  cursize
  readcount
  bit
  codec
end struct

/// Compute init storage with codec in qcommon.message; the normal completion returns `Message(false, false, oob, data, length, 0, 0, 0, codec)`.
/// @param data Initial `data` field stored in the returned or constructed `mq3.qcommon.message.Message` record.
/// @param length Initial `maxsize` field stored in the returned or constructed `mq3.qcommon.message.Message` record.
/// @param oob Initial `oob` field stored in the returned or constructed `mq3.qcommon.message.Message` record.
/// @param codec Initial `codec` field stored in the returned or constructed `mq3.qcommon.message.Message` record.
function initStorageWithCodec(data,length,oob,codec)
  if codec==void then codec=huffman.initMessageStatic() end if
  return Message(false,false,oob,data,length,0,0,0,codec)
end function

/// Return `mq3.qcommon.message.initStorageWithCodec(data, length, oob, void)` from `qcommon.message.initStorage`.
/// @param data Data passed as `data` to `mq3.qcommon.message.initStorageWithCodec`.
/// @param length Length passed as `length` to `mq3.qcommon.message.initStorageWithCodec`.
/// @param oob Oob passed as `oob` to `mq3.qcommon.message.initStorageWithCodec`.
function initStorage(data,length,oob)
  return initStorageWithCodec(data,length,oob,void)
end function

/// Return `mq3.qcommon.message.initStorage(bytes(length, 0), length, false)` from `qcommon.message.init`.
/// @param length Length passed as `length` to `mq3.qcommon.message.initStorage`.
function init(length)
  return initStorage(bytes(length,0),length,false)
end function

/// Return `mq3.qcommon.message.initStorage(bytes(length, 0), length, true)` from `qcommon.message.initOob`.
/// @param length Length passed as `length` to `mq3.qcommon.message.initStorage`.
function initOob(length)
  return initStorage(bytes(length,0),length,true)
end function

/// Clear message in qcommon.message; updates `msg.cursize`, `msg.overflowed`, `msg.bit`.
///
/// Direct state writes: `msg.cursize`, `msg.overflowed`, `msg.bit`.
/// @param msg Updated in place: `cursize`, `overflowed`, `bit`.
function clear(msg)
  msg.cursize = 0; msg.overflowed = false; msg.bit = 0
  return void
end function

/// Update `msg.oob` in qcommon.message.
///
/// Direct state writes: `msg.oob`.
/// @param msg Updated in place: `oob`.
function bitstream(msg)
  msg.oob = false; return void
end function

/// Begin reading in qcommon.message; updates `msg.readcount`, `msg.bit`, `msg.oob`.
///
/// Direct state writes: `msg.readcount`, `msg.bit`, `msg.oob`.
/// @param msg Updated in place: `readcount`, `bit`, `oob`.
function beginReading(msg)
  msg.readcount = 0; msg.bit = 0; msg.oob = false
  return void
end function

/// Begin reading oob in qcommon.message; updates `msg.readcount`, `msg.bit`, `msg.oob`.
///
/// Direct state writes: `msg.readcount`, `msg.bit`, `msg.oob`.
/// @param msg Updated in place: `readcount`, `bit`, `oob`.
function beginReadingOob(msg)
  msg.readcount = 0; msg.bit = 0; msg.oob = true
  return void
end function

// MSG_Copy preserves all source cursor/state fields and installs independent
// storage containing the bytes written so far.  Baseq3 deliberately retains
// src->maxsize; length is only the destination-capacity guard.
/// @param source Record exposing `cursize`, `data`, `allowoverflow`, `overflowed`, `oob`, `maxsize`, `readcount` and further fields.
/// @param length Length used in `bytes(length, 0)` and `(length < source.cursize)`.
function copy(source,length)
  if source==void or length<source.cursize then return error(6810,"message.copy: destination is smaller than source") end if
  data=bytes(length,0)
  if source.cursize>0 then for index=0 to source.cursize-1 data[index]=source.data[index] end for end if
  return Message(source.allowoverflow,source.overflowed,source.oob,data,source.maxsize,source.cursize,source.readcount,source.bit,source.codec)
end function

/// Write bits in qcommon.message; the normal completion returns `true`.
///
/// Validation failures include `message.writeBits: invalid bit width`; `message.writeBits: invalid OOB width`.
/// Direct state writes: `msg.overflowed`, `msg.cursize`, `msg.bit`.
/// @param msg Record exposing `maxsize`, `cursize`, `oob`, `data`, `bit`, `codec`. Updated in place: `overflowed`, `cursize`, `bit`.
/// @param value Value used in `(value & 1)` and `(value >> 8)`.
/// @param bits Bits used in `(bits == 0)` and `(bits > 32)`.
function writeBits(msg,value,bits)
  if msg.maxsize-msg.cursize < 4 then
    msg.overflowed = true; return false
  end if
  if bits == 0 or bits < -31 or bits > 32 then return error(6802,"message.writeBits: invalid bit width") end if
  width = bits
  if width < 0 then width = 0-width end if
  if msg.oob then
    if width != 8 and width != 16 and width != 32 then return error(6804,"message.writeBits: invalid OOB width") end if
    msg.data[msg.cursize] = value & 255
    if width >= 16 then msg.data[msg.cursize+1] = (value >> 8) & 255 end if
    if width == 32 then
      msg.data[msg.cursize+2] = (value >> 16) & 255
      msg.data[msg.cursize+3] = (value >> 24) & 255
    end if
    msg.cursize = msg.cursize+(width>>3)
    if width == 32 then msg.bit = msg.bit+8 else msg.bit = msg.bit+width end if
  else
    if width != 32 then value=value & (0xFFFFFFFF>>(32-width)) end if
    remainder=width&7
    required=remainder; pending=value>>remainder; probe=0
    while probe<width-remainder
      required=required+huffman.bitLength(msg.codec,pending&255)
      pending=pending>>8; probe=probe+8
    end while
    if ((msg.bit+required)>>3)+1 > msg.maxsize or ((msg.bit+required+7)>>3)>len(msg.data) then
      msg.overflowed=true; return false
    end if
    if remainder != 0 then
      for index=0 to remainder-1
        msg.bit=huffman.putBit(value&1,msg.data,msg.bit); value=value>>1
      end for
      width=width-remainder
    end if
    index=0
    while index<width
      msg.bit=huffman.transmit(msg.codec,value&255,msg.data,msg.bit)
      value=value>>8; index=index+8
    end while
    msg.cursize=(msg.bit>>3)+1
  end if
  return true
end function

/// Return `mq3.qcommon.message.writeBits(msg, value, 8)` from `qcommon.message.writeChar`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeBits`.
function writeChar(msg,value) return writeBits(msg,value,8) end function
/// Return `mq3.qcommon.message.writeBits(msg, value, 8)` from `qcommon.message.writeByte`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeBits`.
function writeByte(msg,value) return writeBits(msg,value,8) end function
/// Return `mq3.qcommon.message.writeBits(msg, value, 16)` from `qcommon.message.writeShort`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeBits`.
function writeShort(msg,value) return writeBits(msg,value,16) end function
/// Return `mq3.qcommon.message.writeBits(msg, value, 32)` from `qcommon.message.writeLong`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Value passed as `value` to `mq3.qcommon.message.writeBits`.
function writeLong(msg,value) return writeBits(msg,value,32) end function
/// Return `mq3.qcommon.message.writeBits(msg, n.i32(n.floatBits(value)), 32)` from `qcommon.message.writeFloat`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeBits`.
/// @param value Floating-point value to narrow and reinterpret.
function writeFloat(msg,value) return writeBits(msg,n.i32(n.floatBits(value)),32) end function
/// Return `mq3.qcommon.message.writeByte(msg, (n.trunc32(n.fdiv(n.fmul(value, 256.0), 360.0)) & 255))` from `qcommon.message.writeAngle`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param value Left floating-point operand.
function writeAngle(msg,value) return writeByte(msg,n.trunc32(n.fdiv(n.fmul(value,256.0),360.0))&255) end function
/// Return `mq3.qcommon.message.writeShort(msg, (n.trunc32(n.fdiv(n.fmul(value, 65536.0), 360.0)) & 65535))` from `qcommon.message.writeAngle16`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeShort`.
/// @param value Left floating-point operand.
function writeAngle16(msg,value) return writeShort(msg,n.trunc32(n.fdiv(n.fmul(value,65536.0),360.0))&65535) end function

/// Write data in qcommon.message.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param data Sequence traversed as `value` by the loop in `writeData`.
function writeData(msg,data)
  for each value in data writeByte(msg,value) end for
  return void
end function

/// Write string in qcommon.message.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
function writeString(msg,text)
  if text == void then writeByte(msg,0); return void end if
  raw = bytes(text)
  length = 0
  while length < len(raw) and raw[length] != 0 length = length+1 end while
  if length >= MAX_STRING_CHARS then writeByte(msg,0); return void end if
  if length > 0 then
    for index = 0 to length-1
      value = raw[index]
      if value > 127 then value = 46 end if
      writeByte(msg,value)
    end for
  end if
  writeByte(msg,0); return void
end function

/// Write big string in qcommon.message.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
function writeBigString(msg,text)
  if text==void then writeByte(msg,0);return void end if
  raw=bytes(text);length=0
  while length<len(raw) and raw[length]!=0 length=length+1 end while
  if length>=BIG_INFO_STRING then writeByte(msg,0);return void end if
  if length>0 then
    for index=0 to length-1
      value=raw[index];if value>127 then value=46 end if;writeByte(msg,value)
    end for
  end if
  writeByte(msg,0);return void
end function

/// Read bits in qcommon.message; the normal completion returns `n.i32(value)`.
///
/// Validation failures include `message.readBits: invalid OOB width`.
/// Direct state writes: `msg.readcount`, `msg.bit`.
/// @param msg Record exposing `oob`, `readcount`, `data`, `bit`, `cursize`, `codec`. Updated in place: `readcount`, `bit`.
/// @param bits Bits operand used by `readBits`; its reads are shown in the implementation.
function readBits(msg,bits)
  width = bits; signed = false
  if width < 0 then width = 0-width; signed = true end if
  value=0; signWidth=width
  if msg.oob then
    if width != 8 and width != 16 and width != 32 then return error(6806,"message.readBits: invalid OOB width") end if
    offset = msg.readcount; octets = width>>3
    if offset < 0 or offset+octets > len(msg.data) then
      msg.readcount = msg.readcount+octets; msg.bit = msg.bit+width
      return 0
    end if
    value = msg.data[offset]
    if width >= 16 then value = value | (msg.data[offset+1] << 8) end if
    if width == 32 then value = value | (msg.data[offset+2] << 16) | (msg.data[offset+3] << 24) end if
    msg.readcount = msg.readcount+octets; msg.bit = msg.bit+width
  else
    remainder=width&7
    limit=msg.cursize*8
    physical=len(msg.data)*8
    if physical<limit then limit=physical end if
    if remainder != 0 then
      for index=0 to remainder-1
        pair=huffman.getBitBounded(msg.data,msg.bit,limit)
        if not pair[2] then msg.readcount=msg.cursize+1; return 0 end if
        msg.bit=pair[1]
        value=value | (pair[0]<<index)
      end for
      width=width-remainder; signWidth=width
    end if
    index=0
    while index<width
      decoded=huffman.receiveBounded(msg.codec,msg.data,msg.bit,limit)
      if not decoded[2] then msg.readcount=msg.cursize+1; return 0 end if
      msg.bit=decoded[1]
      value=value | (decoded[0]<<(index+remainder)); index=index+8
    end while
    msg.readcount=(msg.bit>>3)+1
  end if
  if signed then
    if signWidth>0 and signWidth<32 and (value & (1<<(signWidth-1))) != 0 then
      value=value | (-1 ^ ((1<<signWidth)-1))
    else if signWidth==32 then value=n.i32(value)
    end if
  end if
  return n.i32(value)
end function

/// Read i 8 in qcommon.message; the normal completion returns `value`.
/// @param msg Record exposing `readcount`, `cursize`.
function readI8(msg)
  value = n.i8(readBits(msg,8))
  if msg.readcount > msg.cursize then return -1 end if
  return value
end function

/// Read u 8 in qcommon.message; the normal completion returns `value`.
/// @param msg Record exposing `readcount`, `cursize`.
function readU8(msg)
  value = readBits(msg,8) & 255
  if msg.readcount > msg.cursize then return -1 end if
  return value
end function

/// Read i 16 in qcommon.message; the normal completion returns `value`.
/// @param msg Record exposing `readcount`, `cursize`.
function readI16(msg)
  value = n.i16(readBits(msg,16))
  if msg.readcount > msg.cursize then return -1 end if
  return value
end function

/// Read i 32 in qcommon.message; the normal completion returns `value`.
/// @param msg Record exposing `readcount`, `cursize`.
function readI32(msg)
  value = n.i32(readBits(msg,32))
  if msg.readcount > msg.cursize then return -1 end if
  return value
end function

/// Read float in qcommon.message; the normal completion returns `n.bitsFloat(value)`.
/// @param msg Record exposing `readcount`, `cursize`.
function readFloat(msg)
  value=readBits(msg,32)
  if msg.readcount>msg.cursize then return n.f32(-1.0) end if
  return n.bitsFloat(value)
end function

/// Return `mq3.compat.numeric.fmul(readI16(msg), (360.0 / 65536.0))` from `qcommon.message.readAngle16`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readI16`.
function readAngle16(msg) return n.fmul(readI16(msg),360.0/65536.0) end function

/// Read text in qcommon.message; the normal completion returns `result`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
/// @param lineOnly Line only used in `(lineOnly and (value == 10))` and `(not lineOnly and (value > 127))`.
function readText(msg,lineOnly)
  result = ""; count = 0
  while count < MAX_STRING_CHARS-1
    value = readU8(msg)
    if value == -1 or value == 0 or (lineOnly and value == 10) then break end if
    if value == 37 or (not lineOnly and value > 127) then value = 46 end if
    result = result+decode(bytes([value])); count = count+1
  end while
  return result
end function

/// Return `mq3.qcommon.message.readText(msg, false)` from `qcommon.message.readCString`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readText`.
function readCString(msg) return readText(msg,false) end function
/// Return `mq3.qcommon.message.readText(msg, true)` from `qcommon.message.readCStringLine`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readText`.
function readCStringLine(msg) return readText(msg,true) end function

/// Read big c string in qcommon.message; the normal completion returns `text`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
function readBigCString(msg)
  text="";length=0
  while length<BIG_INFO_STRING-1
    value=readU8(msg)
    if value<0 or value==0 then break end if
    if value==37 then value=46 end if
    text=text+decode(bytes([value]));length=length+1
  end while
  return text
end function

/// Read data in qcommon.message; the normal completion returns `result`.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.readU8`.
/// @param length Length used in `(length > 0)` and `(length - 1)`.
function readData(msg,length)
  result = bytes(length,0)
  if length > 0 then
    for index = 0 to length-1 result[index] = readU8(msg) & 255 end for
  end if
  return result
end function
