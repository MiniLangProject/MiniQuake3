// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of botlib/l_crc.c (CRC-16/CCITT-XMODEM form).
package mq3.botlib.crc16

/// Initial CRC-16 accumulator value before input bytes are processed.
const INIT_VALUE=0xffff
/// Final XOR applied to the CRC-16 accumulator.
const XOR_VALUE=0

/// Compute one CRC-16 lookup-table entry using polynomial 0x1021 and eight shift steps.
/// @param index Index of the entry to access.
function tableValue(index)
  value=(index&255)<<8
  for bit=0 to 7
    if (value&0x8000)!=0 then value=((value<<1)^0x1021)&0xffff else value=(value<<1)&0xffff end if
  end for
  return value
end function

/// Return `INIT_VALUE` for `init`.
function init() return INIT_VALUE end function
/// Fold one byte into the running 16-bit cyclic redundancy check.
/// @param crc Operand used to evaluate the returned expression `(((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff`.
/// @param value Operand used to evaluate the returned expression `(((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff`.
function processByte(crc,value) return (((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff end function
/// Return `(crc^XOR_VALUE)&0xffff` for `value`.
/// @param crc Operand used to evaluate the returned expression `(crc^XOR_VALUE)&0xffff`.
function value(crc) return (crc^XOR_VALUE)&0xffff end function

/// Update the 16-bit cyclic redundancy check over the selected byte span.
/// @param data Array or byte sequence accessed at `offset+index`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param count Number of entries or bytes processed by this call.
function processSpan(data,offset,count)
  crc=init()
  if data==void or count<=0 then return value(crc) end if
  for index=0 to count-1 crc=processByte(crc,data[offset+index]) end for
  return value(crc)
end function

/// Apply `mq3.botlib.crc16.value`, `mq3.botlib.crc16.init` and `mq3.botlib.crc16.processSpan` while evaluating `processString`. Return paths include `processSpan(data,0,len(data))`.
/// @param text Text to parse, format or deliver.
function processString(text)
  if text==void then return value(init()) end if
  data=bytes(text);return processSpan(data,0,len(data))
end function

/// Apply `mq3.botlib.crc16.processByte` while evaluating `continueSpan`.
/// @param crc Value used by `continueSpan` in `result=crc&0xffff`.
/// @param data Array or byte sequence accessed at `offset+index`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param count Number of entries or bytes processed by this call.
function continueSpan(crc,data,offset,count)
  result=crc&0xffff
  if data==void or count<=0 then return result end if
  for index=0 to count-1 result=processByte(result,data[offset+index]) end for
  return result
end function
