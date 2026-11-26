// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmq3.c weapon choice and battle-inventory projection.
package mq3.game.bot_inventory_ai
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.compat.numeric as n

const ENEMY_HORIZONTAL_DIST=headers.ENEMY_HORIZONTAL_DIST
const ENEMY_HEIGHT=headers.ENEMY_HEIGHT
const INVENTORY_ARMOR=headers.INVENTORY_ARMOR
const INVENTORY_GAUNTLET=headers.INVENTORY_GAUNTLET
const INVENTORY_SHOTGUN=headers.INVENTORY_SHOTGUN
const INVENTORY_MACHINEGUN=headers.INVENTORY_MACHINEGUN
const INVENTORY_GRENADELAUNCHER=headers.INVENTORY_GRENADELAUNCHER
const INVENTORY_ROCKETLAUNCHER=headers.INVENTORY_ROCKETLAUNCHER
const INVENTORY_LIGHTNING=headers.INVENTORY_LIGHTNING
const INVENTORY_RAILGUN=headers.INVENTORY_RAILGUN
const INVENTORY_PLASMAGUN=headers.INVENTORY_PLASMAGUN
const INVENTORY_BFG10K=headers.INVENTORY_BFG10K
const INVENTORY_GRAPPLINGHOOK=headers.INVENTORY_GRAPPLINGHOOK
const INVENTORY_SHELLS=headers.INVENTORY_SHELLS
const INVENTORY_BULLETS=headers.INVENTORY_BULLETS
const INVENTORY_GRENADES=headers.INVENTORY_GRENADES
const INVENTORY_CELLS=headers.INVENTORY_CELLS
const INVENTORY_LIGHTNINGAMMO=headers.INVENTORY_LIGHTNINGAMMO
const INVENTORY_ROCKETS=headers.INVENTORY_ROCKETS
const INVENTORY_SLUGS=headers.INVENTORY_SLUGS
const INVENTORY_BFGAMMO=headers.INVENTORY_BFGAMMO
const INVENTORY_HEALTH=headers.INVENTORY_HEALTH
const INVENTORY_TELEPORTER=headers.INVENTORY_TELEPORTER
const INVENTORY_MEDKIT=headers.INVENTORY_MEDKIT
const INVENTORY_QUAD=headers.INVENTORY_QUAD
const INVENTORY_ENVIRONMENTSUIT=headers.INVENTORY_ENVIRONMENTSUIT
const INVENTORY_HASTE=headers.INVENTORY_HASTE
const INVENTORY_INVISIBILITY=headers.INVENTORY_INVISIBILITY
const INVENTORY_REGEN=headers.INVENTORY_REGEN
const INVENTORY_FLIGHT=headers.INVENTORY_FLIGHT
const INVENTORY_REDFLAG=headers.INVENTORY_REDFLAG
const INVENTORY_BLUEFLAG=headers.INVENTORY_BLUEFLAG
/// `Services` record for bot inventory ai, containing `chooseBestFn`, `selectWeaponFn`, `floatTimeFn`, `entityInfoFn` and `checkItemPickupFn` and related fields.
struct Services chooseBestFn selectWeaponFn floatTimeFn entityInfoFn checkItemPickupFn context end struct
/// Create a `mq3.game.bot_inventory_ai.Services` record with the declared empty defaults.
function create() return Services(void,void,void,void,void,void) end function
/// Convert a truth value to the integer one or zero for inventory flags.
/// @param value Value used by `bit` in `if value then return 1 end if return 0`.
function bit(value) if value then return 1 end if return 0 end function
/// Set `bot.weaponchangeTime` to `services.floatTimeFn(services)` and `bot.weaponnum` to `newWeapon` in `mq3.game.bot_inventory_ai.chooseWeapon`.
/// @param services Host service callbacks; accesses `selectWeaponFn`, `chooseBestFn` and `floatTimeFn`.
/// @param bot Bot AI state; accesses `curPs`, `client`, `weaponnum`, `ws` and `inventory` and related fields. May update `bot.weaponchangeTime` and `bot.weaponnum` in place.
function chooseWeapon(services,bot)
  if bot.curPs.weaponstate==c.WEAPON_RAISING or bot.curPs.weaponstate==c.WEAPON_DROPPING then
    services.selectWeaponFn(services,bot.client,bot.weaponnum);return void
  end if
  newWeapon=services.chooseBestFn(services,bot.ws,bot.inventory)
  if bot.weaponnum!=newWeapon then bot.weaponchangeTime=services.floatTimeFn(services) end if
  bot.weaponnum=newWeapon;services.selectWeaponFn(services,bot.client,bot.weaponnum);return void
end function
/// Set `bot.inventory[ENEMY_HEIGHT]` to `n.trunc32(dz)` and `bot.inventory[ENEMY_HORIZONTAL_DIST]` to `n.trunc32(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))))` in `mq3.game.bot_inventory_ai.updateBattleInventory`.
/// @param services Host service callbacks; accesses `entityInfoFn`.
/// @param bot Bot AI state; accesses `origin` and `inventory`. May update `bot.inventory[ENEMY_HEIGHT]` and `bot.inventory[ENEMY_HORIZONTAL_DIST]` in place.
/// @param enemy Value passed as argument 2 to `services.entityInfoFn`.
function updateBattleInventory(services,bot,enemy)
  ent=services.entityInfoFn(services,enemy);dx=n.fsub(ent.origin[0],bot.origin[0]);dy=n.fsub(ent.origin[1],bot.origin[1]);dz=n.fsub(ent.origin[2],bot.origin[2])
  bot.inventory[ENEMY_HEIGHT]=n.trunc32(dz)
  bot.inventory[ENEMY_HORIZONTAL_DIST]=n.trunc32(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))))
  return void
end function
/// Update `bot.inventory[INVENTORY_ARMOR]`, `bot.inventory[INVENTORY_GAUNTLET]`, `bot.inventory[INVENTORY_SHOTGUN]` and `bot.inventory[INVENTORY_MACHINEGUN]` and related state during `updateInventory`.
/// @param services Host service callbacks; accesses `checkItemPickupFn`.
/// @param bot Bot AI state; accesses `inventory` and `curPs`. May update `bot.inventory[INVENTORY_ARMOR]`, `bot.inventory[INVENTORY_GAUNTLET]` and `bot.inventory[INVENTORY_SHOTGUN]` and additional fields in place.
function updateInventory(services,bot)
  old=[];for each value in bot.inventory old=old+[value] end for;p=bot.curPs;weapons=p.stats[c.STAT_WEAPONS]
  bot.inventory[INVENTORY_ARMOR]=p.stats[c.STAT_ARMOR]
  bot.inventory[INVENTORY_GAUNTLET]=bit((weapons&(1<<c.WP_GAUNTLET))!=0)
  bot.inventory[INVENTORY_SHOTGUN]=bit((weapons&(1<<c.WP_SHOTGUN))!=0)
  bot.inventory[INVENTORY_MACHINEGUN]=bit((weapons&(1<<c.WP_MACHINEGUN))!=0)
  bot.inventory[INVENTORY_GRENADELAUNCHER]=bit((weapons&(1<<c.WP_GRENADE_LAUNCHER))!=0)
  bot.inventory[INVENTORY_ROCKETLAUNCHER]=bit((weapons&(1<<c.WP_ROCKET_LAUNCHER))!=0)
  bot.inventory[INVENTORY_LIGHTNING]=bit((weapons&(1<<c.WP_LIGHTNING))!=0)
  bot.inventory[INVENTORY_RAILGUN]=bit((weapons&(1<<c.WP_RAILGUN))!=0)
  bot.inventory[INVENTORY_PLASMAGUN]=bit((weapons&(1<<c.WP_PLASMAGUN))!=0)
  bot.inventory[INVENTORY_BFG10K]=bit((weapons&(1<<c.WP_BFG))!=0)
  bot.inventory[INVENTORY_GRAPPLINGHOOK]=bit((weapons&(1<<c.WP_GRAPPLING_HOOK))!=0)
  bot.inventory[INVENTORY_SHELLS]=p.ammo[c.WP_SHOTGUN];bot.inventory[INVENTORY_BULLETS]=p.ammo[c.WP_MACHINEGUN]
  bot.inventory[INVENTORY_GRENADES]=p.ammo[c.WP_GRENADE_LAUNCHER];bot.inventory[INVENTORY_CELLS]=p.ammo[c.WP_PLASMAGUN]
  bot.inventory[INVENTORY_LIGHTNINGAMMO]=p.ammo[c.WP_LIGHTNING];bot.inventory[INVENTORY_ROCKETS]=p.ammo[c.WP_ROCKET_LAUNCHER]
  bot.inventory[INVENTORY_SLUGS]=p.ammo[c.WP_RAILGUN];bot.inventory[INVENTORY_BFGAMMO]=p.ammo[c.WP_BFG]
  bot.inventory[INVENTORY_HEALTH]=p.stats[c.STAT_HEALTH];bot.inventory[INVENTORY_TELEPORTER]=bit(p.stats[c.STAT_HOLDABLE_ITEM]==26);bot.inventory[INVENTORY_MEDKIT]=bit(p.stats[c.STAT_HOLDABLE_ITEM]==27)
  bot.inventory[INVENTORY_QUAD]=bit(p.powerups[c.PW_QUAD]!=0);bot.inventory[INVENTORY_ENVIRONMENTSUIT]=bit(p.powerups[c.PW_BATTLESUIT]!=0)
  bot.inventory[INVENTORY_HASTE]=bit(p.powerups[c.PW_HASTE]!=0);bot.inventory[INVENTORY_INVISIBILITY]=bit(p.powerups[c.PW_INVIS]!=0)
  bot.inventory[INVENTORY_REGEN]=bit(p.powerups[c.PW_REGEN]!=0);bot.inventory[INVENTORY_FLIGHT]=bit(p.powerups[c.PW_FLIGHT]!=0)
  bot.inventory[INVENTORY_REDFLAG]=bit(p.powerups[c.PW_REDFLAG]!=0);bot.inventory[INVENTORY_BLUEFLAG]=bit(p.powerups[c.PW_BLUEFLAG]!=0)
  if services.checkItemPickupFn!=void then services.checkItemPickupFn(services,bot,old) end if
  return void
end function
