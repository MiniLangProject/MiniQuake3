// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmq3.c weapon choice and battle-inventory projection.
package mq3.game.bot_inventory_ai
import mq3.game.constants as c
import mq3.compat.numeric as n

const ENEMY_HORIZONTAL_DIST=200
const ENEMY_HEIGHT=201
const INVENTORY_ARMOR=1
const INVENTORY_GAUNTLET=4
const INVENTORY_SHOTGUN=5
const INVENTORY_MACHINEGUN=6
const INVENTORY_GRENADELAUNCHER=7
const INVENTORY_ROCKETLAUNCHER=8
const INVENTORY_LIGHTNING=9
const INVENTORY_RAILGUN=10
const INVENTORY_PLASMAGUN=11
const INVENTORY_BFG10K=13
const INVENTORY_GRAPPLINGHOOK=14
const INVENTORY_SHELLS=18
const INVENTORY_BULLETS=19
const INVENTORY_GRENADES=20
const INVENTORY_CELLS=21
const INVENTORY_LIGHTNINGAMMO=22
const INVENTORY_ROCKETS=23
const INVENTORY_SLUGS=24
const INVENTORY_BFGAMMO=25
const INVENTORY_HEALTH=29
const INVENTORY_TELEPORTER=30
const INVENTORY_MEDKIT=31
const INVENTORY_QUAD=35
const INVENTORY_ENVIRONMENTSUIT=36
const INVENTORY_HASTE=37
const INVENTORY_INVISIBILITY=38
const INVENTORY_REGEN=39
const INVENTORY_FLIGHT=40
const INVENTORY_REDFLAG=45
const INVENTORY_BLUEFLAG=46
struct Services chooseBestFn selectWeaponFn floatTimeFn entityInfoFn checkItemPickupFn context end struct
function create() return Services(void,void,void,void,void,void) end function
function bit(value) if value then return 1 end if return 0 end function
function chooseWeapon(services,bot)
  if bot.curPs.weaponstate==c.WEAPON_RAISING or bot.curPs.weaponstate==c.WEAPON_DROPPING then
    services.selectWeaponFn(services,bot.client,bot.weaponnum);return void
  end if
  newWeapon=services.chooseBestFn(services,bot.ws,bot.inventory)
  if bot.weaponnum!=newWeapon then bot.weaponchangeTime=services.floatTimeFn(services) end if
  bot.weaponnum=newWeapon;services.selectWeaponFn(services,bot.client,bot.weaponnum);return void
end function
function updateBattleInventory(services,bot,enemy)
  ent=services.entityInfoFn(services,enemy);dx=n.fsub(ent.origin[0],bot.origin[0]);dy=n.fsub(ent.origin[1],bot.origin[1]);dz=n.fsub(ent.origin[2],bot.origin[2])
  bot.inventory[ENEMY_HEIGHT]=n.trunc32(dz)
  bot.inventory[ENEMY_HORIZONTAL_DIST]=n.trunc32(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))))
  return void
end function
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
