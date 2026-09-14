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

struct Projectile name model flags gravity damage radius visibleDamage damageType healthIncrease push detonation bounce bounceFriction bounceStop end struct
struct Weapon valid number name model level weaponIndex flags projectileName numProjectiles horizontalSpread verticalSpread speed acceleration recoil offset angleOffset extraZVelocity ammoAmount ammoIndex activate reload spinup spindown projectile end struct
struct WeaponConfig weapons projectiles end struct
struct Reader registry handle end struct
struct Runtime context readFn fuzzyRuntime config fileReads end struct

function fail(message) return error(7580,"AI weapon weights: "+message) end function
function emptyProjectile() return Projectile("","",0,0.0,0,0.0,0,0,0,0.0,0.0,0.0,0.0,0.0) end function
function emptyWeapon() return Weapon(false,0,"","",0,0,0,"",0,0.0,0.0,0.0,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0.0,0,0,0.0,0.0,0.0,0.0,void) end function
function create(context,readFn,fuzzyRuntime) return Runtime(context,readFn,fuzzyRuntime,void,0) end function
function loadText(runtime,name) runtime.fileReads=runtime.fileReads+1;return runtime.readFn(runtime.context,fuzzy.botPath(name)) end function
function open(runtime,name) registry=pc.create(runtime,loadText);handle=pc.load(registry,name);if handle==0 then return fail("cannot load "+name) end if;return Reader(registry,handle) end function
function close(reader) pc.free(reader.registry,reader.handle);return void end function
function take(reader) return pc.read(reader.registry,reader.handle) end function
function expect(reader,text) token=take(reader);if token==void or token is error or token.text!=text then return fail("expected "+text) end if;return token end function
function readString(reader) token=take(reader);if token==void or token is error or token.type!=pc.TT_STRING then return fail("expected string") end if;return token.text end function

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
function projectileNamed(projectiles,name) for each projectile in projectiles if projectile.name==name then return projectile end if end for;return void end function
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
function ensureConfig(runtime) if runtime.config==void then runtime.config=parseWeaponConfig(runtime,"weapons.c") end if;return runtime.config end function
function weaponWeightIndex(profile,config) result=[];for each weapon in config.weapons if weapon.valid then result=result+[fuzzy.findWeight(profile,weapon.name)] else result=result+[-1] end if end for;return result end function
function freeWeaponWeights(runtime,statePools,handle) state=pools.weaponState(statePools,handle);if state==void then return 0 end if;state.weaponWeightConfig=void;state.weaponWeightIndex=void;return 0 end function
function loadWeaponWeights(runtime,statePools,handle,filename)
  state=pools.weaponState(statePools,handle);if state==void then return BLERR_CANNOTLOADWEAPONWEIGHTS end if;freeWeaponWeights(runtime,statePools,handle)
  profile=fuzzy.weightConfig(runtime.fuzzyRuntime,filename);if profile is error then return BLERR_CANNOTLOADWEAPONWEIGHTS end if;config=ensureConfig(runtime);if config is error then return BLERR_CANNOTLOADWEAPONCONFIG end if
  state.weaponWeightConfig=profile;state.weaponWeightIndex=weaponWeightIndex(profile,config);return BLERR_NOERROR
end function
function shutdown(runtime) if runtime!=void then runtime.config=void end if;return 0 end function
