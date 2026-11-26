// SPDX-License-Identifier: GPL-2.0-or-later
// Looped-on target_speaker extraction and retail WAV loading for map ambience.
package mq3.client.playable_ambient_sounds

import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.audio.wav as wav
import std.string as strings

/// Marker indicating that the looping animation or media path is enabled.
const LOOPED_ON=1

/// Stores playable ambient sounds speaker record, including `noise`, `origin`, `globalSound`, `sound`.
struct Speaker
  /// When constructing this record, `loopDefinitions` supplies `path` for this member. Used by `load`
  /// and `globalLoops` during subsequent processing.
  noise
  /// Map-space source position used to spatialize an ambient speaker's sound.
  origin
  /// Sound resource selected for the global event or effect.
  globalSound
  /// Decoded WAV sound data resolved for this map speaker; absent until its asset loads.
  sound
end struct
/// Stores playable ambient sounds catalog record, including `speakers`, `uniqueSounds`, `skipped`.
struct Catalog
  /// When constructing this record, `load` supplies `loaded` for this member. Used by `globalLoops`
  /// during subsequent processing.
  speakers
  /// Sound resources selected for the unique event or effect.
  uniqueSounds
  /// When constructing this record, `load` supplies `skipped` for this member.
  skipped
end struct

/// Creates the playable ambient sounds error `7610` with diagnostic text `"preview ambience: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview ambience: "+message`.
function fail(message) return error(7610,"preview ambience: "+message) end function

/// Calls `std.string.toLowerAscii` from playable ambient sounds `field`. The final path returns `""`.
/// @param fields Value used by `for each pair in fields if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if end for`.
/// @param key Key or control identifier used to select the corresponding playable ambient sounds entry.
function field(fields,key)
  wanted=strings.toLowerAscii(key)
  for each pair in fields if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if end for
  return ""
end function

/// Calls `std.string.toLowerAscii`, `std.string.startsWith`, `std.string.endsWith` from playable ambient sounds `soundPath`. The final path returns `value`.
/// @param noise Value used by `value=strings.toLowerAscii(noise)`.
function soundPath(noise)
  value=strings.toLowerAscii(noise)
  if value=="" or strings.startsWith(value,"*") then return "" end if
  if not strings.endsWith(value,".wav") then value=value+".wav" end if
  return value
end function

/// Calls `std.string.toLowerAscii`, `mq3.client.playable_ambient_sounds.field`, `toNumber` and additional helpers from playable ambient sounds `loopDefinitions`. The final path returns `result`.
/// @param entities Value used by `if entities==void then return fail("entities are required") end if`.
function loopDefinitions(entities)
  if entities==void then return fail("entities are required") end if
  result=[]
  for each entity in entities
    if strings.toLowerAscii(field(entity,"classname"))=="target_speaker" then
      flags=0;flagText=field(entity,"spawnflags");if flagText!="" then flags=toNumber(flagText) end if
      path=soundPath(field(entity,"noise"))
      if (flags&LOOPED_ON)!=0 and path!="" then
        parsed=field(entity,"origin");origin=[0.0,0.0,0.0]
        if parsed!="" then parts=strings.split(parsed," ");if len(parts)==3 then origin=[toNumber(parts[0]),toNumber(parts[1]),toNumber(parts[2])] end if end if
        result=result+[Speaker(path,origin,(flags&4)!=0,void)]
      end if
    end if
  end for
  return result
end function

/// Calls `mq3.format.bsp.entities`, `mq3.client.playable_ambient_sounds.loopDefinitions`, `mq3.format.pk3.read` and additional helpers from playable ambient sounds `load`. The final path returns `Catalog(loaded,unique,skipped)`.
/// @param map map record passed to the playable ambient sounds helper calls.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
function load(map,archive)
  if map==void or archive==void then return fail("map and archive are required") end if
  entities=bsp.entities(map);if entities is error then return entities end if
  speakers=loopDefinitions(entities);if speakers is error then return speakers end if
  unique=[];skipped=[]
  for each speaker in speakers
    existing=void
    for each entry in unique if entry[0]==speaker.noise then existing=entry[1] end if end for
    if existing==void then
      data=try(pk3.read(archive,speaker.noise))
      if data is error then skipped=skipped+[speaker.noise]
      else
        decoded=try(wav.decode(data))
        if decoded is error then skipped=skipped+[speaker.noise] else existing=decoded;unique=unique+[[speaker.noise,decoded]] end if
      end if
    end if
    speaker.sound=existing
  end for
  loaded=[];for each speaker in speakers if speaker.sound!=void then loaded=loaded+[speaker] end if end for
  return Catalog(loaded,unique,skipped)
end function

// WinMM currently has no listener-relative attenuation. Playing spatial map
// speakers as full-volume global loops is both inaccurate and easily clips.
// Until the mixer owns positions, start only speakers carrying Baseq3's global
// sound flag and deduplicate equal sound paths.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.speakers`.
function globalLoops(catalog)
  if catalog==void then return [] end if
  result=[];paths=[]
  for each speaker in catalog.speakers
    seen=false;for each path in paths if path==speaker.noise then seen=true end if end for
    if speaker.globalSound and speaker.sound!=void and not seen then result=result+[[speaker.noise,speaker.sound]];paths=paths+[speaker.noise] end if
  end for
  return result
end function
