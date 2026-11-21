// SPDX-License-Identifier: GPL-2.0-or-later
// Resolve the global renderer/sound handle table emitted by the retail QVMs
// into checked PCM clips from the PK3 filesystem.
package mq3.audio.qvm_sound_assets

import mq3.format.pk3 as pk3
import mq3.audio.wav as wav
import mq3.audio.snd_mem_resample as sndmem
import std.string as strings
import std.ds.list as lists

const EFFECT_OUTPUT_RATE=22050
// Three buffers at 22050 Hz hold at most 139 ms of sampled audio.
const CHUNK_FRAMES=1024

struct Clip handle path sound compressed end struct
struct Missing handle path reason end struct
struct Catalog archive clips missing registered scanned handles end struct

function fail(message) return error(7650,"QVM sound assets: "+message) end function

function canonicalPath(name)
  if name==void then return "" end if
  value=strings.replaceAll(strings.toLowerAscii(name),"\\","/")
  while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if value!="" and not strings.startsWith(value,"*") and not strings.endsWith(value,".wav") then value=value+".wav" end if
  return value
end function

function retailPath(name,playerModel)
  canonical=canonicalPath(name);if not strings.startsWith(canonical,"*") then return canonical end if
  if playerModel==void or playerModel=="" then playerModel="sarge" end if
  tail=decode(slice(bytes(canonical),1,len(bytes(canonical))-1));value="sound/player/"+strings.toLowerAscii(playerModel)+"/"+tail
  if not strings.endsWith(value,".wav") then value=value+".wav" end if;return value
end function

function clipForHandle(catalog,handle)
  if catalog==void or handle<=0 or handle>=len(catalog.handles) then return void end if
  clip=catalog.handles[handle];if clip==false then return void end if;return clip
end function
function missingForHandle(catalog,handle)
  return catalog!=void and handle>0 and handle<len(catalog.handles) and catalog.handles[handle]==false
end function

function clipForPath(catalog,path)
  if catalog==void then return void end if
  wanted=canonicalPath(path)
  for each clip in catalog.clips if clip.path==wanted then return clip end if end for
  return void
end function

function decodeRetailWav(data)
  sound=try(wav.decode(data));if not (sound is error) then return sound end if
  // pak0's jumppad.wav omits the RIFF pad byte after its final odd-sized data
  // chunk. The original Quake reader accepts it, so repair that exact EOF form
  // locally while keeping the shared WAV decoder strict for other malformed data.
  if data==void or len(data)<12 or (len(data)&1)==0 then return sound end if
  declared=data[4]|(data[5]<<8)|(data[6]<<16)|(data[7]<<24);if declared+8!=len(data) then return sound end if
  padded=bytes(len(data)+1,0);for index=0 to len(data)-1 padded[index]=data[index] end for
  size=len(padded)-8;padded[4]=size&255;padded[5]=(size>>8)&255;padded[6]=(size>>16)&255;padded[7]=(size>>24)&255
  return wav.decode(padded)
end function

function decodePlayerPath(archive,handle,path,playerModel)
  canonical=retailPath(path,playerModel)
  if canonical=="" then return fail("empty sound path") end if
  data=try(pk3.read(archive,canonical));if data is error then return fail("missing retail asset "+canonical) end if
  sound=try(decodeRetailWav(data));if sound is error then return fail("invalid WAV "+canonical) end if
  return Clip(handle,canonical,sound,void)
end function
function decodePath(archive,handle,path) return decodePlayerPath(archive,handle,path,"sarge") end function

function normalizeEffect(sound) return sndmem.convert(sound,EFFECT_OUTPUT_RATE) end function

function decodePlayerEffectPath(archive,handle,path,playerModel)
  decoded=try(decodePlayerPath(archive,handle,path,playerModel));if decoded is error then return decoded end if
  sound=try(normalizeEffect(decoded.sound));if sound is error then return fail("invalid effect WAV "+decoded.path+": "+str(sound)) end if
  return Clip(decoded.handle,decoded.path,sound,void)
end function
function decodeEffectPath(archive,handle,path) return decodePlayerEffectPath(archive,handle,path,"sarge") end function

function ensurePath(catalog,path)
  if catalog==void then return fail("catalog is void") end if
  existing=clipForPath(catalog,path);if existing!=void then return existing end if
  decoded=decodePath(catalog.archive,0,path);if decoded is error then return decoded end if
  catalog.clips=catalog.clips+[decoded];return decoded
end function

function loadForPlayer(archive,assetNames,kinds,playerModel)
  if archive==void or assetNames==void or kinds==void then return fail("archive and handle tables are required") end if
  if len(assetNames)!=len(kinds) then return fail("asset and kind tables differ in length") end if
  return syncForPlayer(Catalog(archive,[],[],0,0,[void]),assetNames,kinds,playerModel)
end function
function load(archive,assetNames,kinds) return loadForPlayer(archive,assetNames,kinds,"sarge") end function

function syncForPlayer(catalog,assetNames,kinds,playerModel)
  if catalog==void or assetNames==void or kinds==void or len(assetNames)!=len(kinds) then return fail("invalid catalog synchronization") end if
  // Handles are append-only within a VM session.
  count=len(assetNames)
  if count<catalog.scanned then return fail("asset table was reset without rebuilding the sound catalog") end if
  if count==catalog.scanned then return catalog end if
  newSounds=0
  for index=catalog.scanned to count-1 if kinds[index]=="sound" then newSounds=newSounds+1 end if end for
  if newSounds==0 then catalog.scanned=count;return catalog end if
  clips=lists.List.withCapacity(len(catalog.clips)+newSounds);for each clip in catalog.clips clips.add(clip) end for
  missing=lists.List.withCapacity(len(catalog.missing)+newSounds);for each item in catalog.missing missing.add(item) end for
  handles=array(count+1,void);copyArray(handles,0,catalog.handles,0,len(catalog.handles))
  for index=catalog.scanned to count-1
    if kinds[index]=="sound" then
      handle=index+1;path=canonicalPath(assetNames[index]);decoded=try(decodePlayerEffectPath(catalog.archive,handle,path,playerModel))
      if decoded is error then missing.add(Missing(handle,path,str(decoded)));handles[handle]=false
      else clips.add(decoded);handles[handle]=decoded end if
    end if
  end for
  catalog.clips=clips.toArray();catalog.missing=missing.toArray();catalog.registered=catalog.registered+newSounds;catalog.scanned=count;catalog.handles=handles
  return catalog
end function
function sync(catalog,assetNames,kinds) return syncForPlayer(catalog,assetNames,kinds,"sarge") end function
