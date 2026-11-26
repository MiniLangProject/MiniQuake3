// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_ai_weap.c.
package mq3.botlib.be_ai_weap

import mq3.botlib.ai_weapon_weights as weights
import mq3.botlib.ai_weapon_combat as combat
import mq3.botlib.ai_resource_pools as pools

/// Check that a weapon number refers to an entry in a loaded weapon configuration.
/// @param runtime Be AI weap runtime; accesses `config`.
/// @param weaponNum Operand used to evaluate the returned expression `weaponNum>0 and weaponNum<=len(runtime.config.weapons)`.
function BotValidWeaponNumber(runtime,weaponNum)
  if runtime==void or runtime.config==void or runtime.config is error then return false end if
  // Released Baseq3 compares against numweapons with >, so numweapons itself
  // is accepted here even though callers normally use 1..numweapons-1.
  return weaponNum>0 and weaponNum<=len(runtime.config.weapons)
end function
/// Forward `BotWeaponStateFromHandle` to `mq3.botlib.ai_resource_pools.weaponState` and return the delegated result.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param handle Handle identifying the allocated bot weapon state.
function BotWeaponStateFromHandle(statePools,handle) return pools.weaponState(statePools,handle) end function
/// List projectile names and valid weapon numbers and names from the weapon configuration.
/// @param config Configuration record; accesses `projectiles` and `weapons`.
function DumpWeaponConfig(config)
  if config==void or config is error then return "" end if;output=""
  for each projectile in config.projectiles output=output+"projectile "+projectile.name+"\n" end for
  for each weapon in config.weapons if weapon.valid then output=output+"weapon "+str(weapon.number)+" "+weapon.name+"\n" end if end for
  return output
end function
/// Forward `LoadWeaponConfig` to `mq3.botlib.ai_weapon_weights.parseWeaponConfig` and return the delegated result.
/// @param runtime Context forwarded to the configured host callbacks.
/// @param filename Filename supplied to the configured loader or file service.
function LoadWeaponConfig(runtime,filename) return weights.parseWeaponConfig(runtime,filename) end function
/// Forward `WeaponWeightIndex` to `mq3.botlib.ai_weapon_weights.weaponWeightIndex` and return the delegated result.
/// @param profile Configuration record; accesses `weights`.
/// @param config Configuration record; accesses `weapons`.
function WeaponWeightIndex(profile,config) return weights.weaponWeightIndex(profile,config) end function
/// Forward `BotFreeWeaponWeights` to `mq3.botlib.ai_weapon_weights.freeWeaponWeights` and return the delegated result.
/// @param runtime Value passed as argument 1 to `mq3.botlib.ai_weapon_weights.freeWeaponWeights`.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param weaponState Handle identifying the allocated bot weapon state.
function BotFreeWeaponWeights(runtime,statePools,weaponState) return weights.freeWeaponWeights(runtime,statePools,weaponState) end function
/// Forward `BotLoadWeaponWeights` to `mq3.botlib.ai_weapon_weights.loadWeaponWeights` and return the delegated result.
/// @param runtime AI weapon weights runtime; accesses `fuzzyRuntime`.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param weaponState Handle identifying the allocated bot weapon state.
/// @param filename Filename supplied to the configured loader or file service.
function BotLoadWeaponWeights(runtime,statePools,weaponState,filename) return weights.loadWeaponWeights(runtime,statePools,weaponState,filename) end function
/// Forward `BotGetWeaponInfo` to `mq3.botlib.ai_weapon_combat.weaponInfo` and return the delegated result.
/// @param runtime AI weapon combat runtime; accesses `config`.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param weaponState Handle identifying the allocated bot weapon state.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function BotGetWeaponInfo(runtime,statePools,weaponState,weapon) return combat.weaponInfo(runtime,statePools,weaponState,weapon) end function
/// Forward `BotChooseBestFightWeapon` to `mq3.botlib.ai_weapon_combat.chooseBestFightWeapon` and return the delegated result.
/// @param runtime AI weapon combat runtime; accesses `config`.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param weaponState Handle identifying the allocated bot weapon state.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function BotChooseBestFightWeapon(runtime,statePools,weaponState,inventory) return combat.chooseBestFightWeapon(runtime,statePools,weaponState,inventory) end function
/// Forward `BotResetWeaponState` to `mq3.botlib.ai_resource_pools.resetWeaponState` and return the delegated result.
/// @param statePools Bot resource pools; accesses `weaponStates`.
/// @param weaponState Handle identifying the allocated bot weapon state.
function BotResetWeaponState(statePools,weaponState) return pools.resetWeaponState(statePools,weaponState) end function
/// Forward `BotAllocWeaponState` to `mq3.botlib.ai_resource_pools.allocWeaponState` and return the delegated result.
/// @param statePools Bot resource pools; accesses `weaponStates`. May update `statePools.weaponStates[handle]` in place.
function BotAllocWeaponState(statePools) return pools.allocWeaponState(statePools) end function
/// Forward `BotFreeWeaponState` to `mq3.botlib.ai_resource_pools.freeWeaponState` and return the delegated result.
/// @param statePools Bot resource pools; accesses `weaponStates`. May update `statePools.weaponStates[handle]` in place.
/// @param handle Handle identifying the allocated bot weapon state.
function BotFreeWeaponState(statePools,handle) return pools.freeWeaponState(statePools,handle) end function
/// Apply `mq3.botlib.ai_weapon_weights.ensureConfig` while evaluating `BotSetupWeaponAI`. Return paths include `weights.BLERR_NOERROR`.
/// @param runtime AI weapon weights runtime; accesses `config`. May update `runtime.config` in place.
function BotSetupWeaponAI(runtime)
  if runtime==void then return weights.BLERR_CANNOTLOADWEAPONCONFIG end if
  config=weights.ensureConfig(runtime);if config is error then return weights.BLERR_CANNOTLOADWEAPONCONFIG end if;return weights.BLERR_NOERROR
end function
/// Apply `mq3.botlib.ai_resource_pools.weaponState`, `mq3.botlib.ai_resource_pools.freeWeaponState` and `mq3.botlib.ai_weapon_weights.shutdown` while evaluating `BotShutdownWeaponAI`. Return paths include `weights.shutdown(runtime)`.
/// @param runtime AI weapon weights runtime; accesses `config`. May update `runtime.config` in place.
/// @param statePools Bot resource pools; accesses `weaponStates`.
function BotShutdownWeaponAI(runtime,statePools)
  if statePools!=void then for handle=1 to pools.MAX_CLIENTS if pools.weaponState(statePools,handle)!=void then pools.freeWeaponState(statePools,handle) end if end for end if
  return weights.shutdown(runtime)
end function
