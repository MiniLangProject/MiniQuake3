// SPDX-License-Identifier: GPL-2.0-or-later
// RSA MD4 and Quake III's 32-bit block checksum folding.
package mq3.qcommon.md4
import mq3.compat.numeric as n

// C-named little-endian conversion helpers.  The original functions accept
// output pointers; the native facade returns the produced buffer/word array so
// callers cannot observe partially initialized storage.
function Encode(input,length)
  if input==void or length<0 or (length&3)!=0 or length>len(input)*4 then return error(7820,"MD4 Encode: invalid length") end if
  output=bytes(length,0)
  if length>0 then for index=0 to length/4-1 n.writeU32(output,index*4,input[index]) end for end if
  return output
end function

function Decode(input,length)
  if input==void or typeof(input)!="bytes" or length<0 or (length&3)!=0 or length>len(input) then return error(7821,"MD4 Decode: invalid length") end if
  output=array(length/4,0)
  if length>0 then for index=0 to len(output)-1 output[index]=n.readI32(input,index*4) end for end if
  return output
end function

function rol(value, amount)
  value = n.u32(value)
  return n.i32((value << amount) | (value >> (32-amount)))
end function

function add3(a,b,c)
  return n.add32(n.add32(a,b),c)
end function

function step(work,target,word,rotation,round)
  b = work[(target+1)&3]; c = work[(target+2)&3]; d = work[(target+3)&3]
  mix = 0; constant = 0
  if round == 1 then mix = (b & c) | (n.i32(~b) & d); constant = 0
  else if round == 2 then mix = (b & c) | (b & d) | (c & d); constant = 0x5a827999
  else mix = b ^ c ^ d; constant = 0x6ed9eba1
  end if
  work[target] = rol(n.add32(add3(work[target],mix,word),constant),rotation)
  return void
end function

function transform(state,block,offset)
  words = Decode(slice(block,offset,64),64)
  work = [state[0],state[1],state[2],state[3]]
  r1 = [3,7,11,19]; r2 = [3,5,9,13]; r3 = [3,9,11,15]
  for index = 0 to 15
    step(work,[0,3,2,1][index&3],words[index],r1[index&3],1)
  end for
  order2 = [0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15]
  for index = 0 to 15
    step(work,[0,3,2,1][index&3],words[order2[index]],r2[index&3],2)
  end for
  order3 = [0,8,4,12,2,10,6,14,1,9,5,13,3,11,7,15]
  for index = 0 to 15
    step(work,[0,3,2,1][index&3],words[order3[index]],r3[index&3],3)
  end for
  for index = 0 to 3
    state[index] = n.add32(state[index],work[index])
  end for
  return void
end function

function digest(data)
  length = len(data)
  paddedLength = ((length+8) | 63)+1
  padded = bytes(paddedLength,0)
  if length > 0 then
    for index = 0 to length-1
      padded[index] = data[index]
    end for
  end if
  padded[length] = 0x80
  bitLow = n.i32(n.shl32(length,3)); bitHigh = n.shr32(length,29)
  n.writeU32(padded,paddedLength-8,bitLow); n.writeU32(padded,paddedLength-4,bitHigh)
  state = [0x67452301,n.i32(0xefcdab89),n.i32(0x98badcfe),0x10325476]
  offset = 0
  while offset < paddedLength
    transform(state,padded,offset); offset = offset+64
  end while
  result = bytes(16,0)
  for index = 0 to 3
    n.writeU32(result,index*4,state[index])
  end for
  return result
end function

function blockChecksum(data)
  hash = digest(data)
  return n.i32(n.readI32(hash,0)^n.readI32(hash,4)^n.readI32(hash,8)^n.readI32(hash,12))
end function

function blockChecksumKey(data,key)
  keyed = bytes(len(data)+4,0); n.writeU32(keyed,0,key)
  if len(data) > 0 then
    for index = 0 to len(data)-1
      keyed[index+4] = data[index]
    end for
  end if
  return blockChecksum(keyed)
end function
