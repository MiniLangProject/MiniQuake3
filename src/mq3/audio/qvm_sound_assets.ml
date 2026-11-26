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

/// Clip record for audio.qvm_sound_assets, containing `handle`, `path`, `sound`, `compressed`.
struct Clip handle path sound compressed end struct
/// Missing record for audio.qvm_sound_assets, containing `handle`, `path`, `reason`.
struct Missing handle path reason end struct
/// Catalog record for audio.qvm_sound_assets, containing `archive`, `clips`, `missing`, `registered`, `scanned`, `handles`.
struct Catalog archive clips missing registered scanned handles end struct

/// Create the audio.qvm_sound_assets error for `fail` with 7650 and the supplied diagnostic text.
/// @param message Message used in `("QVM sound assets: " + message)` and `error(7650, ("QVM sound assets: " + message))`.
function fail(message) return error(7650,"QVM sound assets: "+message) end function

/// Compute canonical path in audio.qvm_sound_assets; the normal completion returns `value`.
/// @param name Name used in `(name == void)` and `strings.toLowerAscii(name)`.
function canonicalPath(name)
  if name==void then return "" end if
  value=strings.replaceAll(strings.toLowerAscii(name),"\\","/")
  while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if value!="" and not strings.startsWith(value,"*") and not strings.endsWith(value,".wav") then value=value+".wav" end if
  return value
end function

/// Compute retail path in audio.qvm_sound_assets; the normal completion returns `value`.
/// @param name Name passed as `name` to `mq3.audio.qvm_sound_assets.canonicalPath`.
/// @param playerModel Player model used in `(playerModel == "")` and `(playerModel == void)`.
function retailPath(name,playerModel)
  canonical=canonicalPath(name);if not strings.startsWith(canonical,"*") then return canonical end if
  if playerModel==void or playerModel=="" then playerModel="sarge" end if
  tail=decode(slice(bytes(canonical),1,len(bytes(canonical))-1));value="sound/player/"+strings.toLowerAscii(playerModel)+"/"+tail
  if not strings.endsWith(value,".wav") then value=value+".wav" end if;return value
end function

/// Compute clip for handle in audio.qvm_sound_assets; the normal completion returns `clip`.
/// @param catalog Record exposing `handles`.
/// @param handle Zero-based index into `catalog.handles`.
function clipForHandle(catalog,handle)
  if catalog==void or handle<=0 or handle>=len(catalog.handles) then return void end if
  clip=catalog.handles[handle];if clip==false then return void end if;return clip
end function
/// Compute audio.qvm_sound_assets.missingForHandle as `((((catalog != void) and (handle > 0)) and (handle < len(catalog.handles))) and (catalog.handles[handle] == false))`.
/// @param catalog Record exposing `handles`.
/// @param handle Zero-based index into `catalog.handles`.
function missingForHandle(catalog,handle)
  return catalog!=void and handle>0 and handle<len(catalog.handles) and catalog.handles[handle]==false
end function

/// Compute clip for path in audio.qvm_sound_assets.
/// @param catalog Record exposing `clips`.
/// @param path Name passed as `name` to `mq3.audio.qvm_sound_assets.canonicalPath`.
function clipForPath(catalog,path)
  if catalog==void then return void end if
  wanted=canonicalPath(path)
  for each clip in catalog.clips if clip.path==wanted then return clip end if end for
  return void
end function

/// Decode retail wav in audio.qvm_sound_assets; the normal completion returns `wav.decode(padded)`.
/// @param data Data passed as `data` to `mq3.audio.wav.decode`.
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

/// Decode player path in audio.qvm_sound_assets; the normal completion returns `Clip(handle, canonical, sound, void)`.
/// @param archive Archive passed as `archive` to `mq3.format.pk3.read`.
/// @param handle Initial `handle` field stored in the returned or constructed `mq3.audio.qvm_sound_assets.Clip` record.
/// @param path Name passed as `name` to `mq3.audio.qvm_sound_assets.retailPath`.
/// @param playerModel Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.retailPath`.
function decodePlayerPath(archive,handle,path,playerModel)
  canonical=retailPath(path,playerModel)
  if canonical=="" then return fail("empty sound path") end if
  data=try(pk3.read(archive,canonical));if data is error then return fail("missing retail asset "+canonical) end if
  sound=try(decodeRetailWav(data));if sound is error then return fail("invalid WAV "+canonical) end if
  return Clip(handle,canonical,sound,void)
end function
/// Return `mq3.audio.qvm_sound_assets.decodePlayerPath(archive, handle, path, "sarge")` from `audio.qvm_sound_assets.decodePath`.
/// @param archive Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
/// @param handle Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
/// @param path Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
function decodePath(archive,handle,path) return decodePlayerPath(archive,handle,path,"sarge") end function

/// Return `mq3.audio.snd_mem_resample.convert(sound, EFFECT_OUTPUT_RATE)` from `audio.qvm_sound_assets.normalizeEffect`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_mem_resample.convert`.
function normalizeEffect(sound) return sndmem.convert(sound,EFFECT_OUTPUT_RATE) end function

/// Decode player effect path in audio.qvm_sound_assets; the normal completion returns `Clip(decoded.handle, decoded.path, sound, void)`.
/// @param archive Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
/// @param handle Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
/// @param path Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
/// @param playerModel Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.decodePlayerPath`.
function decodePlayerEffectPath(archive,handle,path,playerModel)
  decoded=try(decodePlayerPath(archive,handle,path,playerModel));if decoded is error then return decoded end if
  sound=try(normalizeEffect(decoded.sound));if sound is error then return fail("invalid effect WAV "+decoded.path+": "+str(sound)) end if
  return Clip(decoded.handle,decoded.path,sound,void)
end function
/// Return `mq3.audio.qvm_sound_assets.decodePlayerEffectPath(archive, handle, path, "sarge")` from `audio.qvm_sound_assets.decodeEffectPath`.
/// @param archive Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`.
/// @param handle Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`.
/// @param path Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`.
function decodeEffectPath(archive,handle,path) return decodePlayerEffectPath(archive,handle,path,"sarge") end function

/// Ensure path in audio.qvm_sound_assets; the normal completion returns `decoded`.
///
/// Direct state writes: `catalog.clips`.
/// @param catalog Record exposing `archive`, `clips`. Updated in place: `clips`.
/// @param path Path passed as `path` to `mq3.audio.qvm_sound_assets.clipForPath`.
function ensurePath(catalog,path)
  if catalog==void then return fail("catalog is void") end if
  existing=clipForPath(catalog,path);if existing!=void then return existing end if
  decoded=decodePath(catalog.archive,0,path);if decoded is error then return decoded end if
  catalog.clips=catalog.clips+[decoded];return decoded
end function

/// Load for player in audio.qvm_sound_assets; the normal completion returns `syncForPlayer(Catalog(archive, [], [], 0, 0, [void]), assetNames, kinds, playerModel)`.
/// @param archive Initial `archive` field stored in the returned or constructed `mq3.audio.qvm_sound_assets.Catalog` record.
/// @param assetNames Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
/// @param kinds Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
/// @param playerModel Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
function loadForPlayer(archive,assetNames,kinds,playerModel)
  if archive==void or assetNames==void or kinds==void then return fail("archive and handle tables are required") end if
  if len(assetNames)!=len(kinds) then return fail("asset and kind tables differ in length") end if
  return syncForPlayer(Catalog(archive,[],[],0,0,[void]),assetNames,kinds,playerModel)
end function
/// Return `mq3.audio.qvm_sound_assets.loadForPlayer(archive, assetNames, kinds, "sarge")` from `audio.qvm_sound_assets.load`.
/// @param archive Archive passed as `archive` to `mq3.audio.qvm_sound_assets.loadForPlayer`.
/// @param assetNames Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.loadForPlayer`.
/// @param kinds Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.loadForPlayer`.
function load(archive,assetNames,kinds) return loadForPlayer(archive,assetNames,kinds,"sarge") end function

/// Synchronize for player in audio.qvm_sound_assets; the normal completion returns `catalog`.
///
/// Direct state writes: `catalog.scanned`, `catalog.clips`, `catalog.missing`, `catalog.registered`, `catalog.handles`.
/// @param catalog Record exposing `scanned`, `clips`, `missing`, `handles`, `archive`, `registered`. Updated in place: `scanned`, `clips`, `missing`, `registered`, `handles`.
/// @param assetNames Asset names used in `len(assetNames)` and `assetNames[index]`.
/// @param kinds Kinds used in `len(kinds)` and `kinds[index]`.
/// @param playerModel Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`.
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
/// Return `mq3.audio.qvm_sound_assets.syncForPlayer(catalog, assetNames, kinds, "sarge")` from `audio.qvm_sound_assets.sync`.
/// @param catalog Catalog passed as `catalog` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
/// @param assetNames Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
/// @param kinds Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.syncForPlayer`.
function sync(catalog,assetNames,kinds) return syncForPlayer(catalog,assetNames,kinds,"sarge") end function
