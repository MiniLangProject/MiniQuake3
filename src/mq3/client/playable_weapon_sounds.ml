// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 weapon sounds decoded from PK3 into playable_audio-compatible PCM.
package mq3.client.playable_weapon_sounds
import mq3.format.pk3 as pk3
import mq3.audio.wav as wav
import mq3.platform.playable_audio as audio

const PICKUP_PATH="sound/misc/w_pkup.wav"

struct Definition weapon classname firePaths impactPaths pickupPath end struct
struct Clip path sound end struct
struct WeaponSounds definition fire impact pickup end struct
struct Catalog weapons clips end struct

function fail(message) return error(7570,"Weapon sounds: "+message) end function

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

function isName(def,name)
  if stringEqualsIgnoreCaseAscii(def.weapon,name) or stringEqualsIgnoreCaseAscii(def.classname,name) then return true end if
  if def.weapon=="rocket" and stringEqualsIgnoreCaseAscii(name,"rocketlauncher") then return true end if
  if def.weapon=="rail" and stringEqualsIgnoreCaseAscii(name,"railgun") then return true end if
  if def.weapon=="plasma" and stringEqualsIgnoreCaseAscii(name,"plasmagun") then return true end if
  if def.weapon=="grenade" and stringEqualsIgnoreCaseAscii(name,"grenadelauncher") then return true end if
  return false
end function

function definition(name)
  if name==void then return void end if
  for each value in definitions() if isName(value,name) then return value end if end for
  return void
end function

function findClip(clips,path)
  for each clip in clips if stringEqualsIgnoreCaseAscii(clip.path,path) then return clip end if end for
  return void
end function

function decodeClip(path,data)
  decoded=try(wav.decode(data));if decoded is error then return fail("invalid WAV "+path) end if
  return Clip(path,decoded)
end function

function loadClip(archive,path)
  data=try(pk3.read(archive,path));if data is error then return fail("missing retail asset "+path) end if
  return decodeClip(path,data)
end function

function addPath(archive,clips,path)
  if findClip(clips,path)!=void then return clips end if
  clip=loadClip(archive,path);if clip is error then return clip end if
  return clips+[clip]
end function

function resolve(clips,paths)
  output=[]
  for each path in paths
    clip=findClip(clips,path);if clip==void then return fail("unresolved asset "+path) end if
    output=output+[clip]
  end for
  return output
end function

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

function find(catalog,name)
  if catalog==void or name==void then return void end if
  for each weapon in catalog.weapons if isName(weapon.definition,name) then return weapon end if end for
  return void
end function

function choose(clips,sequence)
  if clips==void or len(clips)==0 then return void end if
  index=sequence%len(clips);if index<0 then index=index+len(clips) end if
  return clips[index].sound
end function

function fireSound(catalog,name,sequence) weapon=find(catalog,name);if weapon==void then return void end if;return choose(weapon.fire,sequence) end function
function impactSound(catalog,name,sequence) weapon=find(catalog,name);if weapon==void then return void end if;return choose(weapon.impact,sequence) end function
function pickupSound(catalog,name) weapon=find(catalog,name);if weapon==void then return void end if;return weapon.pickup.sound end function

function play(sound)
  if sound==void then return fail("cannot play void sound") end if
  result=try(audio.play(sound));if result is error then return result end if
  return true
end function
