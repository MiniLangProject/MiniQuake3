// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete g_spawn.c facade. State replaces the original level globals and
// pointer output parameters; the productive lifecycle enters through here.
package mq3.game.g_spawn
import mq3.game.spawn as spawnKernel
import mq3.game.spawn_tables as tables

/// Forward `G_SpawnString` to `mq3.game.spawn.getString` and return the delegated result.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param defaultString Value used when the requested entry is unavailable.
function G_SpawnString(state,key,defaultString)
  return spawnKernel.getString(state,key,defaultString)
end function
/// Forward `G_SpawnFloat` to `mq3.game.spawn.getFloat` and return the delegated result.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param defaultString Value used when the requested entry is unavailable.
function G_SpawnFloat(state,key,defaultString)
  return spawnKernel.getFloat(state,key,defaultString)
end function
/// Forward `G_SpawnInt` to `mq3.game.spawn.getInt` and return the delegated result.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param defaultString Value used when the requested entry is unavailable.
function G_SpawnInt(state,key,defaultString)
  return spawnKernel.getInt(state,key,defaultString)
end function
/// Forward `G_SpawnVector` to `mq3.game.spawn.getVector` and return the delegated result.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param defaultString Value used when the requested entry is unavailable.
/// @param initial Value passed as argument 2 to `mq3.compat.textnumbers.vector`.
function G_SpawnVector(state,key,defaultString,initial)
  return spawnKernel.getVector(state,key,defaultString,initial)
end function
/// Forward `fields` to `mq3.game.spawn_tables.fields` and return the delegated result.
function fields()
  return tables.fields()
end function
/// Apply `mq3.game.spawn_tables.missionpackClasses` and `mq3.game.spawn_tables.classes` while evaluating `spawns`. Return paths include `tables.classes()`.
/// @param state G spawn state; accesses `missionpack`.
function spawns(state)
  if state.missionpack then return tables.missionpackClasses() end if
  return tables.classes()
end function
/// Forward `G_CallSpawn` to `mq3.game.spawn.callSpawn` and return the delegated result.
/// @param state Spawn state; accesses `missionpack`, `level` and `unportedFn`.
/// @param ent Game entity; accesses `classname`.
function G_CallSpawn(state,ent)
  return spawnKernel.callSpawn(state,ent)
end function
/// Forward `G_NewString` to `mq3.game.spawn.newString` and return the delegated result.
/// @param value Value passed as argument 1 to `bytes`.
function G_NewString(value)
  return spawnKernel.newString(value)
end function
/// Forward `G_ParseField` to `mq3.game.spawn.parseLevelField` and return the delegated result.
/// @param state G spawn state; accesses `level`.
/// @param key Lookup key or field name used by the operation.
/// @param value Value passed as argument 1 to `bytes`.
/// @param ent Game entity; accesses `classname`, `s`, `model`, `model2` and `spawnflags` and related fields. May update `ent.classname`, `ent.s.origin` and `ent.model` and additional fields in place.
function G_ParseField(state,key,value,ent)
  return spawnKernel.parseLevelField(state.level,key,value,ent)
end function
/// Forward `G_SpawnGEntityFromSpawnVars` to `mq3.game.spawn.fromVars` and return the delegated result.
/// @param state Spawn state; accesses `level`, `vars`, `gametype` and `missionpack`.
function G_SpawnGEntityFromSpawnVars(state)
  return spawnKernel.fromVars(state)
end function
/// Forward `G_AddSpawnVarToken` to `mq3.game.spawn.addToken` and return the delegated result.
/// @param state Spawn state; accesses `chars`. May update `state.chars` in place.
/// @param value Value passed as argument 1 to `bytes`.
function G_AddSpawnVarToken(state,value)
  return spawnKernel.addToken(state,value)
end function
/// Forward `G_ParseSpawnVars` to `mq3.game.spawn.parseVars` and return the delegated result.
/// @param state Spawn state; accesses `vars` and `chars`. May update `state.vars` and `state.chars` in place.
function G_ParseSpawnVars(state)
  return spawnKernel.parseVars(state)
end function
/// Forward `SP_worldspawn` to `mq3.game.spawn.worldspawn` and return the delegated result.
/// @param state Spawn state; accesses `level`, `motd`, `restarted`, `warmupTime` and `doWarmup`. May update `state.level.entities[1022].s.number`, `state.level.entities[1022].classname` and `state.warmupTime` in place.
function SP_worldspawn(state)
  return spawnKernel.worldspawn(state)
end function
/// Forward `G_SpawnEntitiesFromString` to `mq3.game.spawn.load` and return the delegated result.
/// @param state Spawn state; accesses `spawning` and `vars`. May update `state.spawning` and `state.vars` in place.
function G_SpawnEntitiesFromString(state)
  return spawnKernel.load(state)
end function
/// Return `void` for `SP_item_botroam`.
/// @param ent Not read by this implementation; retained in the `SP_item_botroam` signature.
function SP_item_botroam(ent)
  // Deliberately empty in the original game source.
  return void
end function
