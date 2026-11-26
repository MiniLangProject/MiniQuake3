// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete sound-cache and RIFF loader corresponding to client/snd_mem.c.
package mq3.audio.snd_mem_runtime

import mq3.audio.snd_mem_resample as resample
import std.array as arrays

const SND_CHUNK_SIZE=1024
const BUFFER_BYTES=2052
const DEFAULT_SOUND_MEGS=8

/// Buffer record for audio.snd_mem_runtime, containing `samples`, `next`.
struct Buffer samples next end struct
/// Sfx record for audio.snd_mem_runtime, containing `soundName`, `soundCompressed`, `soundCompressionMethod`, `soundData`, `soundLength`, `lastTimeUsed`.
struct Sfx soundName soundCompressed soundCompressionMethod soundData soundLength lastTimeUsed end struct
/// WavInfo record for audio.snd_mem_runtime, containing `format`, `channels`, `rate`, `width`, `samples`, `dataofs`.
struct WavInfo format channels rate width samples dataofs end struct
/// ChunkReader record for audio.snd_mem_runtime, containing `data`, `dataPos`, `iffEnd`, `lastChunk`, `iffData`, `chunkLen`.
struct ChunkReader data dataPos iffEnd lastChunk iffData chunkLen end struct
/// Services record for audio.snd_mem_runtime, containing `readFileFn`, `freeFileFn`, `millisecondsFn`, `adpcmEncodeFn`, `freeOldestFn`, `diagnosticFn`, and 1 further fields.
struct Services readFileFn freeFileFn millisecondsFn adpcmEncodeFn freeOldestFn diagnosticFn context end struct
/// State record for audio.snd_mem_runtime, containing `buffers`, `freelist`, `inUse`, `totalInUse`, `scratch`, `scratchPointer`, and 3 further fields.
struct State buffers freelist inUse totalInUse scratch scratchPointer scratchIndex dmaSpeed services end struct

/// Create `mq3.audio.snd_mem_runtime.Services` with readFileFn=void; freeFileFn=void; millisecondsFn=void; adpcmEncodeFn=void; freeOldestFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void,void) end function
/// Create the audio.snd_mem_runtime error for `fail` with 7760 and the supplied diagnostic text.
/// @param message Message used in `("snd_mem: " + message)` and `error(7760, ("snd_mem: " + message))`.
function fail(message) return error(7760,"snd_mem: "+message) end function
/// Emit snd mem runtime in audio.snd_mem_runtime.
/// @param state Record exposing `services`.
/// @param message Message used in `state.services.diagnosticFn(state.services.context, message)`.
function emit(state,message) if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,message) end if end function
/// Compute reader in audio.snd_mem_runtime; the normal completion returns `ChunkReader(data, 0, len(data), 0, 0, 0)`.
/// @param data Initial `data` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.ChunkReader` record.
function reader(data) if data==void then return ChunkReader(void,0,0,0,0,0) end if;return ChunkReader(data,0,len(data),0,0,0) end function
/// Create `mq3.audio.snd_mem_runtime.WavInfo` with format=0; channels=0; rate=0; width=0; samples=0; dataofs=0.
function emptyInfo() return WavInfo(0,0,0,0,0,0) end function
/// Create `mq3.audio.snd_mem_runtime.Buffer` with samples=bytes((SND_CHUNK_SIZE * 2), 0); next=void.
function newBuffer() return Buffer(bytes(SND_CHUNK_SIZE*2,0),void) end function
/// Create snd mem runtime in audio.snd_mem_runtime; the normal completion returns `State([], [], 0, 0, bytes(((SND_CHUNK_SIZE * 2) * 4), 0), void, 0, dmaSpeed, host)`.
/// @param dmaSpeed Initial `dmaSpeed` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.State` record.
/// @param host Initial `services` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.State` record.
function create(dmaSpeed,host) if dmaSpeed<=0 then return fail("positive DMA rate required") end if;if host==void then host=services() end if;return State([],[],0,0,bytes(SND_CHUNK_SIZE*2*4,0),void,0,dmaSpeed,host) end function

/// Update `state.buffers`, `state.freelist`, `state.inUse`, `state.totalInUse` in audio.snd_mem_runtime; the normal completion returns `count`.
///
/// Direct state writes: `state.buffers`, `state.freelist`, `state.inUse`, `state.totalInUse`, `state.scratch`, `state.scratchPointer`, `state.scratchIndex`.
/// @param state Record exposing `buffers`, `freelist`. Updated in place: `buffers`, `freelist`, `inUse`, `totalInUse`, `scratch`, `scratchPointer` and further fields.
/// @param soundMegs Sound megs used in `(soundMegs <= 0)` and `(soundMegs * 1536)`.
function SND_setup(state,soundMegs)
  if state==void then return fail("missing state") end if
  if soundMegs<=0 then soundMegs=DEFAULT_SOUND_MEGS end if
  count=soundMegs*1536;state.buffers=[];state.freelist=[]
  for index=0 to count-1 value=newBuffer();state.buffers=state.buffers+[value];state.freelist=state.freelist+[value] end for
  state.inUse=count*BUFFER_BYTES;state.totalInUse=0;state.scratch=bytes(SND_CHUNK_SIZE*2*4,0);state.scratchPointer=void;state.scratchIndex=0;emit(state,"Sound memory manager started");return count
end function
/// Update `state.freelist`, `state.inUse`, `value.next` in audio.snd_mem_runtime.
///
/// Direct state writes: `state.freelist`, `state.inUse`, `value.next`.
/// @param state Record exposing `freelist`, `inUse`. Updated in place: `freelist`, `inUse`.
/// @param value Updated in place: `next`.
function SND_free(state,value)
  if state==void or value==void then return fail("missing state or buffer") end if
  value.next=void;state.freelist=state.freelist+[value];state.inUse=state.inUse+BUFFER_BYTES;return void
end function
/// Update `state.freelist`, `state.inUse`, `state.totalInUse` in audio.snd_mem_runtime; the normal completion returns `value`.
///
/// Direct state writes: `state.freelist`, `state.inUse`, `state.totalInUse`.
/// @param state Record exposing `freelist`, `services`, `inUse`, `totalInUse`. Updated in place: `freelist`, `inUse`, `totalInUse`.
function SND_malloc(state)
  if state==void then return fail("missing state") end if
  if len(state.freelist)==0 and state.services.freeOldestFn!=void then state.services.freeOldestFn(state.services.context) end if
  if len(state.freelist)==0 then return fail("sound buffer exhausted") end if
  index=len(state.freelist)-1;value=state.freelist[index];state.freelist=arrays.slice(state.freelist,0,index);state.inUse=state.inUse-BUFFER_BYTES;state.totalInUse=state.totalInUse+BUFFER_BYTES;value.next=void;return value
end function
/// Compute display free memory in audio.snd_mem_runtime; the normal completion returns `value`.
/// @param state Record exposing `inUse`, `totalInUse`.
function S_DisplayFreeMemory(state) if state==void then return fail("missing state") end if;value=[state.inUse,state.totalInUse];emit(state,"free="+str(state.inUse)+" used="+str(state.totalInUse));return value end function

/// Get little short in audio.snd_mem_runtime; the normal completion returns `result`.
///
/// Direct state writes: `value.dataPos`.
/// @param value Record exposing `data`, `dataPos`, `iffEnd`. Updated in place: `dataPos`.
function GetLittleShort(value)
  if value==void or value.data==void or value.dataPos+2>value.iffEnd then return fail("short outside RIFF") end if
  result=value.data[value.dataPos]|(value.data[value.dataPos+1]<<8);value.dataPos=value.dataPos+2;if result>=32768 then result=result-65536 end if;return result
end function
/// Get little long in audio.snd_mem_runtime; the normal completion returns `result`.
///
/// Direct state writes: `value.dataPos`.
/// @param value Record exposing `data`, `dataPos`, `iffEnd`. Updated in place: `dataPos`.
function GetLittleLong(value)
  if value==void or value.data==void or value.dataPos+4>value.iffEnd then return fail("long outside RIFF") end if
  result=value.data[value.dataPos]|(value.data[value.dataPos+1]<<8)|(value.data[value.dataPos+2]<<16)|(value.data[value.dataPos+3]<<24);value.dataPos=value.dataPos+4;if result>=2147483648 then result=result-4294967296 end if;return result
end function
/// Compute chunk name in audio.snd_mem_runtime; the normal completion returns `decode(slice(data, offset, 4))`.
/// @param data Data used in `len(data)` and `slice(data, offset, 4)`.
/// @param offset Offset used in `(offset < 0)` and `(offset + 4)`.
function chunkName(data,offset) if offset<0 or offset+4>len(data) then return "" end if;return decode(slice(data,offset,4)) end function
/// Find next chunk in audio.snd_mem_runtime; updates `value.dataPos`, `value.chunkLen`, `value.lastChunk`.
///
/// Direct state writes: `value.dataPos`, `value.chunkLen`, `value.lastChunk`.
/// @param value Record exposing `data`, `lastChunk`, `iffEnd`. Updated in place: `dataPos`, `chunkLen`, `lastChunk`.
/// @param name Name used in `bytes(name)` and `len(bytes(name))`.
function FindNextChunk(value,name)
  if value==void or value.data==void or len(bytes(name))<4 then return fail("invalid chunk search") end if
  while true
    start=value.lastChunk
    if start>=value.iffEnd then value.dataPos=-1;return -1 end if
    if start+8>value.iffEnd then value.dataPos=-1;return -1 end if
    value.dataPos=start+4;length=GetLittleLong(value);if length is error or length<0 then value.dataPos=-1;return -1 end if
    value.chunkLen=length;value.dataPos=start;value.lastChunk=start+8+((length+1)&~1)
    if chunkName(value.data,start)==decode(slice(bytes(name),0,4)) then return start end if
  end while
end function
/// Find chunk in audio.snd_mem_runtime; the normal completion returns `FindNextChunk(value, name)`.
///
/// Direct state writes: `value.lastChunk`.
/// @param value Record exposing `iffData`. Updated in place: `lastChunk`.
/// @param name Name passed as `name` to `mq3.audio.snd_mem_runtime.FindNextChunk`.
function FindChunk(value,name) value.lastChunk=value.iffData;return FindNextChunk(value,name) end function
/// Compute bytes equal in audio.snd_mem_runtime; the normal completion returns `(decode(slice(data, offset, len(bytes(text)))) == text)`.
/// @param data Data used in `len(data)` and `slice(data, offset, len(bytes(text)))`.
/// @param offset Offset used in `(offset < 0)` and `(offset + len(bytes(text)))`.
/// @param text Text used in `bytes(text)` and `len(bytes(text))`.
function bytesEqual(data,offset,text) if offset<0 or offset+len(bytes(text))>len(data) then return false end if;return decode(slice(data,offset,len(bytes(text))))==text end function
/// Get wavinfo in audio.snd_mem_runtime; the normal completion returns `WavInfo(format, channels, rate, width, (dataLength / width), dataofs)`.
/// @param name Reserved argument; this implementation does not read its value.
/// @param wav Data passed as `data` to `mq3.audio.snd_mem_runtime.reader`.
/// @param wavlength Wavlength used in `(wavlength < 0)` and `(wavlength > len(wav))`.
function GetWavinfo(name,wav,wavlength)
  info=emptyInfo();if wav==void then return info end if
  if wavlength<0 or wavlength>len(wav) then return fail("invalid WAV length") end if
  value=reader(wav);value.iffEnd=wavlength;value.iffData=0
  riff=FindChunk(value,"RIFF");if riff<0 or not bytesEqual(wav,riff+8,"WAVE") then return info end if
  value.iffData=riff+12;fmt=FindChunk(value,"fmt ");if fmt<0 then return info end if
  value.dataPos=fmt+8;format=GetLittleShort(value);if format is error then return info end if;channels=GetLittleShort(value);rate=GetLittleLong(value);if channels is error or rate is error then return info end if
  value.dataPos=value.dataPos+6;widthBits=GetLittleShort(value);if widthBits is error then return info end if;width=widthBits/8
  if format!=1 or width<=0 then return info end if
  dataChunk=FindChunk(value,"data");if dataChunk<0 then return info end if
  value.dataPos=dataChunk+4;dataLength=GetLittleLong(value);if dataLength is error or dataLength<0 then return info end if
  dataofs=value.dataPos;if dataofs+dataLength>wavlength then return info end if
  return WavInfo(format,channels,rate,width,dataLength/width,dataofs)
end function

/// Compute resample sfx raw in audio.snd_mem_runtime; the normal completion returns `resample.resampleRaw(data, inrate, inwidth, samples, state.dmaSpeed)`.
/// @param state Record exposing `dmaSpeed`.
/// @param inrate Input rate passed as `inputRate` to `mq3.audio.snd_mem_resample.resampleRaw`.
/// @param inwidth Input width passed as `inputWidth` to `mq3.audio.snd_mem_resample.resampleRaw`.
/// @param samples Samples passed as `samples` to `mq3.audio.snd_mem_resample.resampleRaw`.
/// @param data Data passed as `data` to `mq3.audio.snd_mem_resample.resampleRaw`.
function ResampleSfxRaw(state,inrate,inwidth,samples,data)
  if state==void then return fail("missing state") end if
  return resample.resampleRaw(data,inrate,inwidth,samples,state.dmaSpeed)
end function
/// Write chunk sample in audio.snd_mem_runtime.
/// @param chunk Record exposing `samples`.
/// @param index Index used in `(index * 2)` and `((index * 2) + 1)`.
/// @param source Source used in `source[offset]` and `source[(offset + 1)]`.
/// @param offset Zero-based index into `source`.
function writeChunkSample(chunk,index,source,offset) chunk.samples[index*2]=source[offset];chunk.samples[index*2+1]=source[offset+1] end function
/// Update `sfx.soundLength`, `sfx.soundData` in audio.snd_mem_runtime; the normal completion returns `count`.
///
/// Direct state writes: `sfx.soundLength`, `sfx.soundData`.
/// @param state State passed as `state` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`.
/// @param sfx Record exposing `soundLength`. Updated in place: `soundLength`, `soundData`.
/// @param inrate Inrate passed as `inrate` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`.
/// @param inwidth Inwidth passed as `inwidth` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`.
/// @param data Data passed as `data` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`.
/// @param compressed Reserved argument; this implementation does not read its value.
function ResampleSfx(state,sfx,inrate,inwidth,data,compressed)
  if state==void or sfx==void then return fail("missing state or sound") end if
  converted=ResampleSfxRaw(state,inrate,inwidth,sfx.soundLength,data);if converted is error then return converted end if
  count=len(converted)/2;sfx.soundLength=count;sfx.soundData=void;chunk=void
  for index=0 to count-1
    part=index&(SND_CHUNK_SIZE-1)
    if part==0 then next=SND_malloc(state);if next is error then return next end if;if chunk==void then sfx.soundData=next else chunk.next=next end if;chunk=next end if
    writeChunkSample(chunk,part,converted,index*2)
  end for
  return count
end function
/// Release file in audio.snd_mem_runtime.
/// @param state Record exposing `services`.
/// @param data Data used in `state.services.freeFileFn(state.services.context, data)`.
function releaseFile(state,data) if state.services.freeFileFn!=void then state.services.freeFileFn(state.services.context,data) end if;return void end function
/// Load sound in audio.snd_mem_runtime; the normal completion returns `true`.
///
/// Direct state writes: `sfx.lastTimeUsed`, `sfx.soundCompressionMethod`, `sfx.soundData`, `sfx.soundLength`.
/// @param state Record exposing `services`.
/// @param sfx Record exposing `soundName`, `soundCompressed`. Updated in place: `lastTimeUsed`, `soundCompressionMethod`, `soundData`, `soundLength`.
function S_LoadSound(state,sfx)
  if state==void or sfx==void then return fail("missing state or sound") end if
  if sfx.soundName=="" or slice(bytes(sfx.soundName),0,1)==bytes("*") then return false end if
  if state.services.readFileFn==void then return false end if
  data=state.services.readFileFn(state.services.context,sfx.soundName);if data==void or data is error then return false end if
  info=GetWavinfo(sfx.soundName,data,len(data));if info is error or info.channels!=1 then releaseFile(state,data);return false end if
  now=0;if state.services.millisecondsFn!=void then now=state.services.millisecondsFn(state.services.context) end if;sfx.lastTimeUsed=now+1
  if sfx.soundCompressed then
    pcm=try(ResampleSfxRaw(state,info.rate,info.width,info.samples,slice(data,info.dataofs,len(data)-info.dataofs)));if pcm is error then releaseFile(state,data);return pcm end if
    if state.services.adpcmEncodeFn==void then releaseFile(state,data);return fail("compressed sound encoder unavailable") end if
    encoded=try(state.services.adpcmEncodeFn(state.services.context,sfx,pcm));if encoded is error then releaseFile(state,data);return encoded end if;if encoded==void then releaseFile(state,data);return fail("compressed sound encoder returned no data") end if
    sfx.soundCompressionMethod=1;sfx.soundData=encoded;sfx.soundLength=len(pcm)/2
  else
    sfx.soundCompressionMethod=0;sfx.soundLength=info.samples;sfx.soundData=void
    loaded=try(ResampleSfx(state,sfx,info.rate,info.width,slice(data,info.dataofs,len(data)-info.dataofs),false));if loaded is error then releaseFile(state,data);return loaded end if
  end if
  releaseFile(state,data);return true
end function
