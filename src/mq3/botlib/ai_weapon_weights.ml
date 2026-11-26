// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Weapon/projectile configuration and weapon-weight binding from be_ai_weap.c.
package mq3.botlib.ai_weapon_weights

import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools
import mq3.vm.pc_parser as pc

const MAX_WEAPONINFO=32
const MAX_PROJECTILEINFO=32
const BLERR_NOERROR=0
const BLERR_CANNOTLOADWEAPONWEIGHTS=11
const BLERR_CANNOTLOADWEAPONCONFIG=12
const OP_LOAD_WEAPON_WEIGHTS=560

/// `Projectile` record for ai weapon weights, containing `name`, `model`, `flags`, `gravity` and `damage` and related fields.
struct Projectile name model flags gravity damage radius visibleDamage damageType healthIncrease push detonation bounce bounceFriction bounceStop end struct
/// `Weapon` record for ai weapon weights, containing `valid`, `number`, `name`, `model` and `level` and related fields.
struct Weapon valid number name model level weaponIndex flags projectileName numProjectiles horizontalSpread verticalSpread speed acceleration recoil offset angleOffset extraZVelocity ammoAmount ammoIndex activate reload spinup spindown projectile end struct
/// `WeaponConfig` record for ai weapon weights, containing `weapons` and `projectiles`.
struct WeaponConfig weapons projectiles end struct
/// `Reader` record for ai weapon weights, containing `registry` and `handle`.
struct Reader registry handle end struct
/// `Runtime` record for ai weapon weights, containing `context`, `readFn`, `fuzzyRuntime`, `config` and `fileReads`.
struct Runtime context readFn fuzzyRuntime config fileReads end struct

/// Construct error `7580` with diagnostic text `"AI weapon weights: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7580,"AI weapon weights: "+message) end function
/// Create a `mq3.botlib.ai_weapon_weights.Projectile` record with the declared empty defaults.
function emptyProjectile() return Projectile("","",0,0.0,0,0.0,0,0,0,0.0,0.0,0.0,0.0,0.0) end function
/// Create a `mq3.botlib.ai_weapon_weights.Weapon` record, initializing `recoil` as `[0.0,0.0,0.0]`, `offset` as `[0.0,0.0,0.0]` and `angleOffset` as `[0.0,0.0,0.0]`.
function emptyWeapon() return Weapon(false,0,"","",0,0,0,"",0,0.0,0.0,0.0,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0.0,0,0,0.0,0.0,0.0,0.0,void) end function
/// Create a `mq3.botlib.ai_weapon_weights.Runtime` record, initializing `context` from `context`, `readFn` from `readFn` and `fuzzyRuntime` from `fuzzyRuntime`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
/// @param fuzzyRuntime Initial value stored in `mq3.botlib.ai_weapon_weights.Runtime.fuzzyRuntime`.
function create(context,readFn,fuzzyRuntime) return Runtime(context,readFn,fuzzyRuntime,void,0) end function
/// Set `runtime.fileReads` to `runtime.fileReads+1` in `mq3.botlib.ai_weapon_weights.loadText`. Return paths include `runtime.readFn(runtime.context,fuzzy.botPath(name))`.
/// @param runtime AI weapon weights runtime; accesses `fileReads`, `readFn` and `context`. May update `runtime.fileReads` in place.
/// @param name Name used to identify the requested entry.
function loadText(runtime,name) runtime.fileReads=runtime.fileReads+1;return runtime.readFn(runtime.context,fuzzy.botPath(name)) end function
/// Build the `mq3.botlib.ai_weapon_weights.Reader` result for `open`. Return paths include `Reader(registry,handle)`.
/// @param runtime Context forwarded to the configured host callbacks.
/// @param name Name used to identify the requested entry.
function open(runtime,name) registry=pc.create(runtime,loadText);handle=pc.load(registry,name);if handle==0 then return fail("cannot load "+name) end if;return Reader(registry,handle) end function
/// Apply `mq3.vm.pc_parser.free` while evaluating `close`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function close(reader) pc.free(reader.registry,reader.handle);return void end function
/// Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function take(reader) return pc.read(reader.registry,reader.handle) end function
/// Apply `mq3.botlib.ai_weapon_weights.take` while evaluating `expect`. Return paths include `token`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
/// @param text Text to parse, format or deliver.
function expect(reader,text) token=take(reader);if token==void or token is error or token.text!=text then return fail("expected "+text) end if;return token end function
/// Apply `mq3.botlib.ai_weapon_weights.take` while evaluating `readString`. Return paths include `token.text`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function readString(reader) token=take(reader);if token==void or token is error or token.type!=pc.TT_STRING then return fail("expected string") end if;return token.text end function

/// Apply `mq3.botlib.ai_weapon_weights.expect`, `mq3.botlib.ai_weapon_weights.emptyProjectile` and `mq3.botlib.ai_weapon_weights.take` while evaluating `parseProjectile`. Return paths include `fail("unknown projectile field "+field.text)`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function parseProjectile(reader)
  if expect(reader,"{") is error then return fail("missing projectile body") end if;value=emptyProjectile()
  while true field=take(reader);if field==void or field is error then return fail("unterminated projectile") end if;if field.text=="}" then return value end if
    if field.text=="name" then item=readString(reader);if item is error then return item end if;value.name=item
    else if field.text=="model" then item=readString(reader);if item is error then return item end if;value.model=item
    else if field.text=="flags" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.flags=item
    else if field.text=="gravity" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.gravity=item
    else if field.text=="damage" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.damage=item
    else if field.text=="radius" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.radius=item
    else if field.text=="visdamage" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.visibleDamage=item
    else if field.text=="damagetype" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.damageType=item
    else if field.text=="healthinc" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.healthIncrease=item
    else if field.text=="push" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.push=item
    else if field.text=="detonation" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.detonation=item
    else if field.text=="bounce" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.bounce=item
    else if field.text=="bouncefric" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.bounceFriction=item
    else if field.text=="bouncestop" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.bounceStop=item
    else return fail("unknown projectile field "+field.text) end if
  end while
end function
/// Apply `mq3.botlib.ai_weapon_weights.expect`, `mq3.botlib.ai_weapon_weights.emptyWeapon` and `mq3.botlib.ai_weapon_weights.take` while evaluating `parseWeapon`. Return paths include `fail("unknown weapon field "+field.text)`.
/// @param reader Token-reader state; accesses `registry` and `handle`.
function parseWeapon(reader)
  if expect(reader,"{") is error then return fail("missing weapon body") end if;value=emptyWeapon()
  while true field=take(reader);if field==void or field is error then return fail("unterminated weapon") end if;if field.text=="}" then return value end if
    if field.text=="number" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.number=item
    else if field.text=="name" then item=readString(reader);if item is error then return item end if;value.name=item
    else if field.text=="level" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.level=item
    else if field.text=="model" then item=readString(reader);if item is error then return item end if;value.model=item
    else if field.text=="weaponindex" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.weaponIndex=item
    else if field.text=="flags" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.flags=item
    else if field.text=="projectile" then item=readString(reader);if item is error then return item end if;value.projectileName=item
    else if field.text=="numprojectiles" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.numProjectiles=item
    else if field.text=="hspread" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.horizontalSpread=item
    else if field.text=="vspread" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.verticalSpread=item
    else if field.text=="speed" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.speed=item
    else if field.text=="acceleration" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.acceleration=item
    else if field.text=="recoil" then item=fuzzy.readVector(reader);if item is error then return item end if;value.recoil=item
    else if field.text=="offset" then item=fuzzy.readVector(reader);if item is error then return item end if;value.offset=item
    else if field.text=="angleoffset" then item=fuzzy.readVector(reader);if item is error then return item end if;value.angleOffset=item
    else if field.text=="extrazvelocity" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.extraZVelocity=item
    else if field.text=="ammoamount" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.ammoAmount=item
    else if field.text=="ammoindex" then item=fuzzy.readInteger(reader);if item is error then return item end if;value.ammoIndex=item
    else if field.text=="activate" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.activate=item
    else if field.text=="reload" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.reload=item
    else if field.text=="spinup" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.spinup=item
    else if field.text=="spindown" then item=fuzzy.readComputed(reader);if item is error then return item end if;value.spindown=item
    else return fail("unknown weapon field "+field.text) end if
  end while
end function
/// Find a projectile definition by its exact name, returning void when absent.
/// @param projectiles Value used by `projectileNamed` in `for each projectile in projectiles if projectile.name==name then return projectile end if end for`.
/// @param name Lookup text matched against `projectile.name`.
function projectileNamed(projectiles,name) for each projectile in projectiles if projectile.name==name then return projectile end if end for;return void end function
/// Build the `mq3.botlib.ai_weapon_weights.WeaponConfig` result for `parseWeaponConfig`. Return paths include `WeaponConfig(weapons,projectiles)`.
/// @param runtime Context forwarded to the configured host callbacks.
/// @param filename Filename supplied to the configured loader or file service.
function parseWeaponConfig(runtime,filename)
  reader=open(runtime,filename);if reader is error then return reader end if;weapons=array(MAX_WEAPONINFO,void);for i=0 to MAX_WEAPONINFO-1 weapons[i]=emptyWeapon() end for;projectiles=[]
  while true token=take(reader);if token==void then break end if;if token is error then close(reader);return token end if
    if token.text=="projectileinfo" then if len(projectiles)>=MAX_PROJECTILEINFO then close(reader);return fail("too many projectiles") end if;value=parseProjectile(reader);if value is error then close(reader);return value end if;projectiles=projectiles+[value]
    else if token.text=="weaponinfo" then value=parseWeapon(reader);if value is error then close(reader);return value end if;if value.number<0 or value.number>=MAX_WEAPONINFO then close(reader);return fail("weapon number outside table") end if;value.valid=true;weapons[value.number]=value
    else close(reader);return fail("unknown definition "+token.text) end if
  end while;close(reader)
  for i=0 to MAX_WEAPONINFO-1 if weapons[i].valid then projectile=projectileNamed(projectiles,weapons[i].projectileName);if projectile==void or weapons[i].name=="" then return fail("weapon has invalid projectile") end if;weapons[i].projectile=projectile end if end for
  return WeaponConfig(weapons,projectiles)
end function
/// Set `runtime.config` to `parseWeaponConfig(runtime,"weapons.c")` in `mq3.botlib.ai_weapon_weights.ensureConfig`. Return paths include `runtime.config`.
/// @param runtime AI weapon weights runtime; accesses `config`. May update `runtime.config` in place.
function ensureConfig(runtime) if runtime.config==void then runtime.config=parseWeaponConfig(runtime,"weapons.c") end if;return runtime.config end function
/// Apply `mq3.botlib.ai_item_weights.findWeight` while evaluating `weaponWeightIndex`.
/// @param profile Configuration record; accesses `weights`.
/// @param config Configuration record; accesses `weapons`.
function weaponWeightIndex(profile,config) result=[];for each weapon in config.weapons if weapon.valid then result=result+[fuzzy.findWeight(profile,weapon.name)] else result=result+[-1] end if end for;return result end function
/// Apply `mq3.botlib.ai_resource_pools.weaponState` while evaluating `freeWeaponWeights`.
/// @param runtime Not read by this implementation; retained in the `freeWeaponWeights` signature.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param handle Handle identifying the allocated bot weapon state.
function freeWeaponWeights(runtime,statePools,handle) state=pools.weaponState(statePools,handle);if state==void then return 0 end if;state.weaponWeightConfig=void;state.weaponWeightIndex=void;return 0 end function
/// Apply `mq3.botlib.ai_resource_pools.weaponState`, `mq3.botlib.ai_weapon_weights.freeWeaponWeights` and `mq3.botlib.ai_item_weights.weightConfig` while evaluating `loadWeaponWeights`. Return paths include `BLERR_NOERROR`.
/// @param runtime AI weapon weights runtime; accesses `fuzzyRuntime`.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param handle Handle identifying the allocated bot weapon state.
/// @param filename Filename supplied to the configured loader or file service.
function loadWeaponWeights(runtime,statePools,handle,filename)
  state=pools.weaponState(statePools,handle);if state==void then return BLERR_CANNOTLOADWEAPONWEIGHTS end if;freeWeaponWeights(runtime,statePools,handle)
  profile=fuzzy.weightConfig(runtime.fuzzyRuntime,filename);if profile is error then return BLERR_CANNOTLOADWEAPONWEIGHTS end if;config=ensureConfig(runtime);if config is error then return BLERR_CANNOTLOADWEAPONCONFIG end if
  state.weaponWeightConfig=profile;state.weaponWeightIndex=weaponWeightIndex(profile,config);return BLERR_NOERROR
end function
/// Set `runtime.config` to `void` in `mq3.botlib.ai_weapon_weights.shutdown`.
/// @param runtime AI weapon weights runtime; accesses `config`. May update `runtime.config` in place.
function shutdown(runtime) if runtime!=void then runtime.config=void end if;return 0 end function
