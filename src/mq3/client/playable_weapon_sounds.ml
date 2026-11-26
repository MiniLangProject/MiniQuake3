// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 weapon sounds decoded from PK3 into playable_audio-compatible PCM.
package mq3.client.playable_weapon_sounds
import mq3.format.pk3 as pk3
import mq3.audio.wav as wav
import mq3.platform.playable_audio as audio

const PICKUP_PATH="sound/misc/w_pkup.wav"

/// Stores playable weapon sounds definition record, including `weapon`, `classname`, `firePaths`, `impactPaths`, `pickupPath`.
struct Definition weapon classname firePaths impactPaths pickupPath end struct
/// Stores playable weapon sounds clip record, including `path`, `sound`.
struct Clip path sound end struct
/// Stores playable weapon sounds weapon sounds record, including `definition`, `fire`, `impact`, `pickup`.
struct WeaponSounds definition fire impact pickup end struct
/// Stores playable weapon sounds catalog record, including `weapons`, `clips`.
struct Catalog weapons clips end struct

/// Creates the playable weapon sounds error `7570` with diagnostic text `"Weapon sounds: "+message`.
/// @param message Argument 2 of `error`; passed as `"Weapon sounds: "+message`.
function fail(message) return error(7570,"Weapon sounds: "+message) end function

/// Builds the playable weapon sounds `definitions` sequence from `[ Definition("gauntlet","weapon_gauntlet",["sound/weapons/melee/fstrun.wav"],[],PICKUP_PATH), Definition("machinegun","weapon_machinegun",["sound/weapons/machinegun/machgf1b.wav","sound/weapons/mac...`.
function definitions()
  return [
    Definition("gauntlet","weapon_gauntlet",["sound/weapons/melee/fstrun.wav"],[],PICKUP_PATH),
    Definition("machinegun","weapon_machinegun",["sound/weapons/machinegun/machgf1b.wav","sound/weapons/machinegun/machgf2b.wav","sound/weapons/machinegun/machgf3b.wav","sound/weapons/machinegun/machgf4b.wav"],["sound/weapons/machinegun/ric1.wav","sound/weapons/machinegun/ric2.wav","sound/weapons/machinegun/ric3.wav"],PICKUP_PATH),
    Definition("shotgun","weapon_shotgun",["sound/weapons/shotgun/sshotf1b.wav"],[],PICKUP_PATH),
    Definition("rocket","weapon_rocketlauncher",["sound/weapons/rocket/rocklf1a.wav"],["sound/weapons/rocket/rocklx1a.wav"],PICKUP_PATH),
    Definition("lightning","weapon_lightning",["sound/weapons/lightning/lg_fire.wav"],["sound/weapons/lightning/lg_hit.wav","sound/weapons/lightning/lg_hit2.wav","sound/weapons/lightning/lg_hit3.wav"],PICKUP_PATH),
    Definition("rail","weapon_railgun",["sound/weapons/railgun/railgf1a.wav"],["sound/weapons/plasma/plasmx1a.wav"],PICKUP_PATH),
    Definition("plasma","weapon_plasmagun",["sound/weapons/plasma/hyprbf1a.wav"],["sound/weapons/plasma/plasmx1a.wav"],PICKUP_PATH),
    Definition("grenade","weapon_grenadelauncher",["sound/weapons/grenade/grenlf1a.wav"],["sound/weapons/rocket/rocklx1a.wav"],PICKUP_PATH),
    Definition("bfg","weapon_bfg",["sound/weapons/bfg/bfg_fire.wav"],["sound/weapons/rocket/rocklx1a.wav"],PICKUP_PATH)
  ]
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable weapon sounds `isName`.
/// @param def Record read through `def.weapon`, `def.classname`.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
function isName(def,name)
  if stringEqualsIgnoreCaseAscii(def.weapon,name) or stringEqualsIgnoreCaseAscii(def.classname,name) then return true end if
  if def.weapon=="rocket" and stringEqualsIgnoreCaseAscii(name,"rocketlauncher") then return true end if
  if def.weapon=="rail" and stringEqualsIgnoreCaseAscii(name,"railgun") then return true end if
  if def.weapon=="plasma" and stringEqualsIgnoreCaseAscii(name,"plasmagun") then return true end if
  if def.weapon=="grenade" and stringEqualsIgnoreCaseAscii(name,"grenadelauncher") then return true end if
  return false
end function

/// Calls `mq3.client.playable_weapon_sounds.definitions`, `mq3.client.playable_weapon_sounds.isName` from playable weapon sounds `definition`. The final path returns `value`.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
function definition(name)
  if name==void then return void end if
  for each value in definitions() if isName(value,name) then return value end if end for
  return void
end function

/// Searches the playable weapon sounds collection for find clip, returning `void` when no entry matches.
/// @param clips Value used by `for each clip in clips if stringEqualsIgnoreCaseAscii(clip.path,path) then return clip end if end for`.
/// @param path File or asset path used by this operation.
function findClip(clips,path)
  for each clip in clips if stringEqualsIgnoreCaseAscii(clip.path,path) then return clip end if end for
  return void
end function

/// Calls `mq3.audio.wav.decode`, `mq3.client.playable_weapon_sounds.Clip` from playable weapon sounds `decodeClip`. The final path returns `Clip(path,decoded)`.
/// @param path File or asset path used by this operation.
/// @param data Value used by `decoded=try(wav.decode(data))`.
function decodeClip(path,data)
  decoded=try(wav.decode(data));if decoded is error then return fail("invalid WAV "+path) end if
  return Clip(path,decoded)
end function

/// Calls `mq3.format.pk3.read`, `mq3.client.playable_weapon_sounds.decodeClip` from playable weapon sounds `loadClip`. The final path returns `decodeClip(path,data)`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param path File or asset path used by this operation.
function loadClip(archive,path)
  data=try(pk3.read(archive,path));if data is error then return fail("missing retail asset "+path) end if
  return decodeClip(path,data)
end function

/// Calls `mq3.client.playable_weapon_sounds.findClip`, `mq3.client.playable_weapon_sounds.loadClip` from playable weapon sounds `addPath`. The final path returns `clips+[clip]`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param clips Value used by `if findClip(clips,path)!=void then return clips end if`.
/// @param path File or asset path used by this operation.
function addPath(archive,clips,path)
  if findClip(clips,path)!=void then return clips end if
  clip=loadClip(archive,path);if clip is error then return clip end if
  return clips+[clip]
end function

/// Calls `mq3.client.playable_weapon_sounds.findClip` from playable weapon sounds `resolve`. The final path returns `output`.
/// @param clips Value used by `clip=findClip(clips,path)`.
/// @param paths Value used by `for each path in paths`.
function resolve(clips,paths)
  output=[]
  for each path in paths
    clip=findClip(clips,path);if clip==void then return fail("unresolved asset "+path) end if
    output=output+[clip]
  end for
  return output
end function

/// Calls `mq3.client.playable_weapon_sounds.definitions`, `mq3.client.playable_weapon_sounds.addPath`, `mq3.client.playable_weapon_sounds.resolve` and additional helpers from playable weapon sounds `load`. The final path returns `Catalog(weapons,clips)`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
function load(archive)
  if archive==void then return fail("archive is void") end if
  clips=[]
  for each def in definitions()
    for each path in def.firePaths clips=addPath(archive,clips,path);if clips is error then return clips end if end for
    for each path in def.impactPaths clips=addPath(archive,clips,path);if clips is error then return clips end if end for
    clips=addPath(archive,clips,def.pickupPath);if clips is error then return clips end if
  end for
  weapons=[]
  for each def in definitions()
    fire=resolve(clips,def.firePaths);if fire is error then return fire end if
    impact=resolve(clips,def.impactPaths);if impact is error then return impact end if
    pickup=findClip(clips,def.pickupPath);if pickup==void then return fail("unresolved pickup asset") end if
    weapons=weapons+[WeaponSounds(def,fire,impact,pickup)]
  end for
  return Catalog(weapons,clips)
end function

/// Searches the playable weapon sounds collection for find, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.weapons`.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
function find(catalog,name)
  if catalog==void or name==void then return void end if
  for each weapon in catalog.weapons if isName(weapon.definition,name) then return weapon end if end for
  return void
end function

/// Evaluates playable weapon sounds `choose` and returns `void`, `clips[index].sound` according to its guard/selection conditions.
/// @param clips Sequence read at `clips[index]`.
/// @param sequence Value used by `index=sequence%len(clips)`.
function choose(clips,sequence)
  if clips==void or len(clips)==0 then return void end if
  index=sequence%len(clips);if index<0 then index=index+len(clips) end if
  return clips[index].sound
end function

/// Calls `mq3.client.playable_weapon_sounds.find`, `mq3.client.playable_weapon_sounds.choose` from playable weapon sounds `fireSound`. The final path returns `choose(weapon.fire,sequence)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
/// @param sequence Value used by `return choose(weapon.fire,sequence)`.
function fireSound(catalog,name,sequence) weapon=find(catalog,name);if weapon==void then return void end if;return choose(weapon.fire,sequence) end function
/// Calls `mq3.client.playable_weapon_sounds.find`, `mq3.client.playable_weapon_sounds.choose` from playable weapon sounds `impactSound`. The final path returns `choose(weapon.impact,sequence)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
/// @param sequence Value used by `return choose(weapon.impact,sequence)`.
function impactSound(catalog,name,sequence) weapon=find(catalog,name);if weapon==void then return void end if;return choose(weapon.impact,sequence) end function
/// Calls `mq3.client.playable_weapon_sounds.find` from playable weapon sounds `pickupSound`. The final path returns `weapon.pickup.sound`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param name Name used to select or register the corresponding playable weapon sounds resource.
function pickupSound(catalog,name) weapon=find(catalog,name);if weapon==void then return void end if;return weapon.pickup.sound end function

/// Calls `mq3.platform.playable_audio.play` from playable weapon sounds `play`.
/// @param sound Sound handle or asset name passed to the audio action.
function play(sound)
  if sound==void then return fail("cannot play void sound") end if
  result=try(audio.play(sound));if result is error then return result end if
  return true
end function
