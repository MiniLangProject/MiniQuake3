// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete g_spawn.c facade. State replaces the original level globals and
// pointer output parameters; the productive lifecycle enters through here.
package mq3.game.g_spawn
import mq3.game.spawn as spawnKernel
import mq3.game.spawn_tables as tables

function G_SpawnString(state,key,defaultString)
  return spawnKernel.getString(state,key,defaultString)
end function
function G_SpawnFloat(state,key,defaultString)
  return spawnKernel.getFloat(state,key,defaultString)
end function
function G_SpawnInt(state,key,defaultString)
  return spawnKernel.getInt(state,key,defaultString)
end function
function G_SpawnVector(state,key,defaultString,initial)
  return spawnKernel.getVector(state,key,defaultString,initial)
end function
function fields()
  return tables.fields()
end function
function spawns(state)
  if state.missionpack then return tables.missionpackClasses() end if
  return tables.classes()
end function
function G_CallSpawn(state,ent)
  return spawnKernel.callSpawn(state,ent)
end function
function G_NewString(value)
  return spawnKernel.newString(value)
end function
function G_ParseField(state,key,value,ent)
  return spawnKernel.parseLevelField(state.level,key,value,ent)
end function
function G_SpawnGEntityFromSpawnVars(state)
  return spawnKernel.fromVars(state)
end function
function G_AddSpawnVarToken(state,value)
  return spawnKernel.addToken(state,value)
end function
function G_ParseSpawnVars(state)
  return spawnKernel.parseVars(state)
end function
function SP_worldspawn(state)
  return spawnKernel.worldspawn(state)
end function
function G_SpawnEntitiesFromString(state)
  return spawnKernel.load(state)
end function
function SP_item_botroam(ent)
  // Deliberately empty in the original game source.
  return void
end function
