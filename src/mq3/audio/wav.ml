// SPDX-License-Identifier: GPL-2.0-or-later
// Checked RIFF/WAVE PCM reader for sound assets loaded through the PK3 filesystem.
package mq3.audio.wav

const MAX_PCM_BYTES=67108864
const MIN_SAMPLE_RATE=4000
const MAX_SAMPLE_RATE=192000

struct Sound sampleRate channels bitsPerSample blockAlign byteRate samples end struct

function fail(message) return error(7490,"WAV: "+message) end function
function u16(data,offset) return data[offset]|(data[offset+1]<<8) end function
function u32(data,offset) return data[offset]|(data[offset+1]<<8)|(data[offset+2]<<16)|(data[offset+3]<<24) end function
function tag(data,offset,a,b,c,d)
  return data[offset]==a and data[offset+1]==b and data[offset+2]==c and data[offset+3]==d
end function
function copy(data,offset,count)
  output=bytes(count,0)
  if count>0 then for index=0 to count-1 output[index]=data[offset+index] end for end if
  return output
end function

function decode(data)
  if data==void or len(data)<12 then return fail("truncated RIFF header") end if
  if not tag(data,0,82,73,70,70) then return fail("missing RIFF signature") end if
  if not tag(data,8,87,65,86,69) then return fail("missing WAVE signature") end if
  riffSize=u32(data,4)
  if riffSize<4 then return fail("invalid RIFF size") end if
  if riffSize>len(data)-8 then return fail("truncated RIFF payload") end if
  limit=riffSize+8;offset=12;formatOffset=-1;formatSize=0;dataOffset=-1;dataSize=0
  while offset<limit
    if limit-offset<8 then return fail("truncated chunk header") end if
    chunkSize=u32(data,offset+4)
    if chunkSize<0 or chunkSize>limit-offset-8 then return fail("truncated chunk payload") end if
    if formatOffset<0 and tag(data,offset,102,109,116,32) then formatOffset=offset+8;formatSize=chunkSize end if
    if dataOffset<0 and tag(data,offset,100,97,116,97) then dataOffset=offset+8;dataSize=chunkSize end if
    offset=offset+8+chunkSize
    if (chunkSize&1)!=0 then
      if offset>=limit then return fail("missing chunk padding") end if
      offset=offset+1
    end if
  end while
  if offset!=limit then return fail("chunk alignment exceeds RIFF") end if
  if formatOffset<0 then return fail("missing fmt chunk") end if
  if formatSize<16 then return fail("short fmt chunk") end if
  if dataOffset<0 then return fail("missing data chunk") end if
  if dataSize<1 then return fail("empty PCM data") end if
  if dataSize>MAX_PCM_BYTES then return fail("PCM data is too large") end if

  format=u16(data,formatOffset);channels=u16(data,formatOffset+2);sampleRate=u32(data,formatOffset+4)
  byteRate=u32(data,formatOffset+8);blockAlign=u16(data,formatOffset+12);bits=u16(data,formatOffset+14)
  if format!=1 then return fail("only integer PCM is supported") end if
  if channels!=1 and channels!=2 then return fail("only mono or stereo is supported") end if
  if sampleRate<MIN_SAMPLE_RATE or sampleRate>MAX_SAMPLE_RATE then return fail("invalid sample rate") end if
  if bits!=8 and bits!=16 then return fail("only 8-bit or 16-bit PCM is supported") end if
  expectedAlign=channels*(bits/8)
  if blockAlign!=expectedAlign then return fail("invalid block alignment") end if
  if byteRate!=sampleRate*blockAlign then return fail("invalid byte rate") end if
  if (dataSize%blockAlign)!=0 then return fail("partial PCM frame") end if
  return Sound(sampleRate,channels,bits,blockAlign,byteRate,copy(data,dataOffset,dataSize))
end function
