// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_ai_weap.c.
package mq3.botlib.be_ai_weap

import mq3.botlib.ai_weapon_weights as weights
import mq3.botlib.ai_weapon_combat as combat
import mq3.botlib.ai_resource_pools as pools

function BotValidWeaponNumber(runtime,weaponNum)
  if runtime==void or runtime.config==void or runtime.config is error then return false end if
  // Released Baseq3 compares against numweapons with >, so numweapons itself
  // is accepted here even though callers normally use 1..numweapons-1.
  return weaponNum>0 and weaponNum<=len(runtime.config.weapons)
end function
function BotWeaponStateFromHandle(statePools,handle) return pools.weaponState(statePools,handle) end function
function DumpWeaponConfig(config)
  if config==void or config is error then return "" end if;output=""
  for each projectile in config.projectiles output=output+"projectile "+projectile.name+"\n" end for
  for each weapon in config.weapons if weapon.valid then output=output+"weapon "+str(weapon.number)+" "+weapon.name+"\n" end if end for
  return output
end function
function LoadWeaponConfig(runtime,filename) return weights.parseWeaponConfig(runtime,filename) end function
function WeaponWeightIndex(profile,config) return weights.weaponWeightIndex(profile,config) end function
function BotFreeWeaponWeights(runtime,statePools,weaponState) return weights.freeWeaponWeights(runtime,statePools,weaponState) end function
function BotLoadWeaponWeights(runtime,statePools,weaponState,filename) return weights.loadWeaponWeights(runtime,statePools,weaponState,filename) end function
function BotGetWeaponInfo(runtime,statePools,weaponState,weapon) return combat.weaponInfo(runtime,statePools,weaponState,weapon) end function
function BotChooseBestFightWeapon(runtime,statePools,weaponState,inventory) return combat.chooseBestFightWeapon(runtime,statePools,weaponState,inventory) end function
function BotResetWeaponState(statePools,weaponState) return pools.resetWeaponState(statePools,weaponState) end function
function BotAllocWeaponState(statePools) return pools.allocWeaponState(statePools) end function
function BotFreeWeaponState(statePools,handle) return pools.freeWeaponState(statePools,handle) end function
function BotSetupWeaponAI(runtime)
  if runtime==void then return weights.BLERR_CANNOTLOADWEAPONCONFIG end if
  config=weights.ensureConfig(runtime);if config is error then return weights.BLERR_CANNOTLOADWEAPONCONFIG end if;return weights.BLERR_NOERROR
end function
function BotShutdownWeaponAI(runtime,statePools)
  if statePools!=void then for handle=1 to pools.MAX_CLIENTS if pools.weaponState(statePools,handle)!=void then pools.freeWeaponState(statePools,handle) end if end for end if
  return weights.shutdown(runtime)
end function
