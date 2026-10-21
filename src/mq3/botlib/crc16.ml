// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of botlib/l_crc.c (CRC-16/CCITT-XMODEM form).
package mq3.botlib.crc16

const INIT_VALUE=0xffff
const XOR_VALUE=0

function tableValue(index)
  value=(index&255)<<8
  for bit=0 to 7
    if (value&0x8000)!=0 then value=((value<<1)^0x1021)&0xffff else value=(value<<1)&0xffff end if
  end for
  return value
end function

function init() return INIT_VALUE end function
function processByte(crc,value) return (((crc&0xffff)<<8)^tableValue(((crc>>8)^(value&255))&255))&0xffff end function
function value(crc) return (crc^XOR_VALUE)&0xffff end function

function processSpan(data,offset,count)
  crc=init()
  if data==void or count<=0 then return value(crc) end if
  for index=0 to count-1 crc=processByte(crc,data[offset+index]) end for
  return value(crc)
end function

function processString(text)
  if text==void then return value(init()) end if
  data=bytes(text);return processSpan(data,0,len(data))
end function

function continueSpan(crc,data,offset,count)
  result=crc&0xffff
  if data==void or count<=0 then return result end if
  for index=0 to count-1 result=processByte(result,data[offset+index]) end for
  return result
end function
