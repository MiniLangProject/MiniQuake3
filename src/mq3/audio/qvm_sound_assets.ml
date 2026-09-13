// SPDX-License-Identifier: GPL-2.0-or-later
// Resolve the global renderer/sound handle table emitted by the retail QVMs
// into checked PCM clips from the PK3 filesystem.
package mq3.audio.qvm_sound_assets

import mq3.format.pk3 as pk3
import mq3.audio.wav as wav
import std.string as strings

struct Clip handle path sound end struct
struct Missing handle path reason end struct
struct Catalog archive clips missing registered end struct

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
  if catalog==void or handle<=0 then return void end if
  for each clip in catalog.clips if clip.handle==handle then return clip end if end for
  return void
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
  return Clip(handle,canonical,sound)
end function
function decodePath(archive,handle,path) return decodePlayerPath(archive,handle,path,"sarge") end function

function ensurePath(catalog,path)
  if catalog==void then return fail("catalog is void") end if
  existing=clipForPath(catalog,path);if existing!=void then return existing end if
  decoded=decodePath(catalog.archive,0,path);if decoded is error then return decoded end if
  catalog.clips=catalog.clips+[decoded];return decoded
end function

function loadForPlayer(archive,assetNames,kinds,playerModel)
  if archive==void or assetNames==void or kinds==void then return fail("archive and handle tables are required") end if
  if len(assetNames)!=len(kinds) then return fail("asset and kind tables differ in length") end if
  clips=[];missing=[];registered=0
  for index=0 to len(assetNames)-1
    if kinds[index]=="sound" then
      registered=registered+1;path=canonicalPath(assetNames[index]);decoded=try(decodePlayerPath(archive,index+1,path,playerModel))
      if decoded is error then missing=missing+[Missing(index+1,path,str(decoded))] else clips=clips+[decoded] end if
    end if
  end for
  return Catalog(archive,clips,missing,registered)
end function
function load(archive,assetNames,kinds) return loadForPlayer(archive,assetNames,kinds,"sarge") end function
