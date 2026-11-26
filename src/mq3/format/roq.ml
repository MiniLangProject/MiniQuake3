// SPDX-License-Identifier: GPL-2.0-or-later
// Bounded RoQ container and DPCM audio decoding, matching client/cl_cin.c.
package mq3.format.roq

import mq3.compat.numeric as numeric
import std.ds.list as lists

const MAGIC=0x1084
const QUAD_INFO=0x1001
const CODEBOOK=0x1002
const QUAD_VQ=0x1011
const QUAD_JPEG=0x1012
const QUAD_HANG=0x1013
const PACKET=0x1030
const SOUND_MONO=0x1020
const SOUND_STEREO=0x1021
const MAX_CHUNK_SIZE=65536

/// Chunk record for format.roq, containing `id`, `size`, `flags`, `dataOffset`.
struct Chunk id size flags dataOffset end struct
/// Movie record for format.roq, containing `data`, `fps`, `chunks`, `videoFrames`, `audioChunks`.
struct Movie data fps chunks videoFrames audioChunks end struct
/// Audio record for format.roq, containing `samples`, `frames`, `sampleRate`, `channels`, `bitsPerSample`, `blockAlign`.
struct Audio samples frames sampleRate channels bitsPerSample blockAlign end struct

/// Create the format.roq error for `fail` with 7690 and the supplied diagnostic text.
/// @param message Message used in `("RoQ: " + message)` and `error(7690, ("RoQ: " + message))`.
function fail(message) return error(7690,"RoQ: "+message) end function
/// Compute u 16 in format.roq; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function u16(data,offset) if offset<0 or offset+2>len(data) then return fail("truncated word") end if;return data[offset]|(data[offset+1]<<8) end function
/// Compute u 32 in format.roq; the normal completion returns `(((data[offset] | (data[(offset + 1)] << 8)) | (data[(offset + 2)] << 16)) | (data[(offset + 3)] << 24))`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function u32(data,offset) if offset<0 or offset+4>len(data) then return fail("truncated integer") end if;return data[offset]|(data[offset+1]<<8)|(data[offset+2]<<16)|(data[offset+3]<<24) end function

/// Parse roq in format.roq; the normal completion returns `Movie(data, fps, chunks.toArray(), videoFrames, audioChunks)`.
/// @param data Data passed as `data` to `mq3.format.roq.u16`.
function parse(data)
  if data==void or typeof(data)!="bytes" or len(data)<8 then return fail("truncated header") end if
  if u16(data,0)!=MAGIC then return fail("invalid signature") end if
  fps=u16(data,6);if fps==0 then fps=30 end if;if fps<1 or fps>120 then return fail("invalid frame rate") end if
  offset=8;chunks=lists.List.withCapacity(256);videoFrames=0;audioChunks=0
  while offset<len(data)
    if len(data)-offset<8 then return fail("truncated chunk header") end if
    id=u16(data,offset);size=u32(data,offset+2);flags=u16(data,offset+6)
    if size<0 or size>MAX_CHUNK_SIZE then return fail("invalid chunk size") end if
    if size>len(data)-offset-8 then return fail("truncated chunk payload") end if
    chunks.add(Chunk(id,size,flags,offset+8));if id==QUAD_VQ then videoFrames=videoFrames+1 end if;if id==SOUND_MONO or id==SOUND_STEREO then audioChunks=audioChunks+1 end if
    offset=offset+8+size
  end while
  return Movie(data,fps,chunks.toArray(),videoFrames,audioChunks)
end function

/// Compute signed 16 in format.roq; the normal completion returns `value`.
/// @param value Value used in `(value & 65535)` and `(value - 65536)`.
function signed16(value) value=value&65535;if value>=32768 then value=value-65536 end if;return value end function
/// Compute square delta in format.roq; the normal completion returns `(0 - (value * value))`.
/// @param value Value used in `(value < 128)` and `(value - 128)`.
function squareDelta(value) if value<128 then return value*value end if;value=value-128;return 0-value*value end function
/// Write 16 in format.roq; updates `output entries`.
///
/// Direct state writes: `output elements`.
/// @param output Mutable sequence written at `offset`, `(offset + 1)`.
/// @param offset Offset used in `(offset + 1)`.
/// @param value Value passed as `value` to `mq3.format.roq.signed16`.
function write16(output,offset,value) value=signed16(value);output[offset]=value&255;output[offset+1]=(value>>8)&255;return void end function

/// Decode mono in format.roq; the normal completion returns `Audio(output, chunk.size, 22050, 2, 16, 4)`.
/// @param movie Record exposing `data`.
/// @param chunk Record exposing `id`, `size`, `flags`, `dataOffset`.
function decodeMono(movie,chunk)
  if movie==void or chunk==void or chunk.id!=SOUND_MONO then return fail("mono sound chunk required") end if
  output=bytes(chunk.size*4,0);previous=chunk.flags
  for index=0 to chunk.size-1 previous=signed16(previous+squareDelta(movie.data[chunk.dataOffset+index]));write16(output,index*4,previous);write16(output,index*4+2,previous) end for
  return Audio(output,chunk.size,22050,2,16,4)
end function

/// Decode stereo in format.roq; the normal completion returns `Audio(output, frame, 22050, 2, 16, 4)`.
/// @param movie Record exposing `data`.
/// @param chunk Record exposing `id`, `size`, `flags`, `dataOffset`.
function decodeStereo(movie,chunk)
  if movie==void or chunk==void or chunk.id!=SOUND_STEREO or (chunk.size&1)!=0 then return fail("stereo sound chunk required") end if
  output=bytes(chunk.size*2,0);left=chunk.flags&0xff00;right=(chunk.flags&255)<<8;frame=0
  index=0
  while index<chunk.size
    left=signed16(left+squareDelta(movie.data[chunk.dataOffset+index]));right=signed16(right+squareDelta(movie.data[chunk.dataOffset+index+1]));write16(output,frame*4,left);write16(output,frame*4+2,right);frame=frame+1
    index=index+2
  end while
  return Audio(output,frame,22050,2,16,4)
end function
/// Decode audio in format.roq; the normal completion returns `fail("unsupported audio chunk")`.
/// @param movie Movie passed as `movie` to `mq3.format.roq.decodeMono`.
/// @param chunk Record exposing `id`.
function decodeAudio(movie,chunk) if chunk.id==SOUND_MONO then return decodeMono(movie,chunk) end if;if chunk.id==SOUND_STEREO then return decodeStereo(movie,chunk) end if;return fail("unsupported audio chunk") end function
