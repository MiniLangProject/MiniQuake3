// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/g_client.c.  The split modules
// own the tested kernels; this package is the productive qagame boundary.
package mq3.game.g_client
import mq3.game.spawn_functions as spawnFunctions
import mq3.game.player_spawns as spawns
import mq3.game.bodies as bodies
import mq3.game.teleport as teleport
import mq3.game.deaths as deaths
import mq3.game.tournament as tournament
import mq3.game.client_info as clientInfo
import mq3.game.client_connect as clientConnect
import mq3.game.client_spawn as clientSpawn
import mq3.game.client_disconnect as clientDisconnect
import std.string as strings

/// Forward `SP_info_player_deathmatch` to `mq3.game.spawn_functions.playerDeathmatch` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function SP_info_player_deathmatch(level,ent) return spawnFunctions.playerDeathmatch(level,ent) end function
/// Set `ent.classname` to `"info_player_deathmatch"` in `mq3.game.g_client.SP_info_player_start`. Return paths include `spawnFunctions.playerDeathmatch(level,ent)`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `classname`. May update `ent.classname` in place.
function SP_info_player_start(level,ent)
  ent.classname = "info_player_deathmatch"
  return spawnFunctions.playerDeathmatch(level,ent)
end function
/// Return `void` for `SP_info_player_intermission`.
/// @param level Not read by this implementation; retained in the `SP_info_player_intermission` signature.
/// @param ent Not read by this implementation; retained in the `SP_info_player_intermission` signature.
function SP_info_player_intermission(level,ent) return void end function

/// Forward `SpotWouldTelefrag` to `mq3.game.player_spawns.wouldTelefrag` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param spot Spot record; accesses `s`.
function SpotWouldTelefrag(level,spot) return spawns.wouldTelefrag(level,spot) end function
/// Forward `SelectNearestDeathmatchSpawnPoint` to `mq3.game.player_spawns.nearest` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param point Three-component point used by the geometric query.
function SelectNearestDeathmatchSpawnPoint(level,point) return spawns.nearest(level,point) end function
/// Forward `SelectRandomDeathmatchSpawnPoint` to `mq3.game.player_spawns.randomDeathmatch` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
function SelectRandomDeathmatchSpawnPoint(level) return spawns.randomDeathmatch(level) end function
/// Forward `SelectRandomFurthestSpawnPoint` to `mq3.game.player_spawns.furthest` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param avoidPoint Three-component point used by the geometric query.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function SelectRandomFurthestSpawnPoint(level,avoidPoint,origin,angles) return spawns.furthest(level,avoidPoint,origin,angles) end function
/// Forward `SelectSpawnPoint` to `mq3.game.player_spawns.selectSpawn` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param avoidPoint Three-component point used by the geometric query.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function SelectSpawnPoint(level,avoidPoint,origin,angles) return spawns.selectSpawn(level,avoidPoint,origin,angles) end function
/// Forward `SelectInitialSpawnPoint` to `mq3.game.player_spawns.initial` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function SelectInitialSpawnPoint(level,origin,angles) return spawns.initial(level,origin,angles) end function
/// Forward `SelectSpectatorSpawnPoint` to `mq3.game.player_spawns.spectator` and return the delegated result.
/// @param level Game-level state; accesses `intermission_origin` and `intermission_angle`.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function SelectSpectatorSpawnPoint(level,origin,angles) return spawns.spectator(level,origin,angles) end function

/// Forward `InitBodyQue` to `mq3.game.bodies.initQueue` and return the delegated result.
/// @param level Game-level state; accesses `bodyQueIndex` and `bodyQue`. May update `level.bodyQueIndex`, `level.bodyQue` and `level.bodyQue[i]` in place.
function InitBodyQue(level) return bodies.initQueue(level) end function
/// Forward `BodySink` to `mq3.game.bodies.sink` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `timestamp`, `physicsObject`, `nextthink` and `s`. May update `ent.physicsObject`, `ent.nextthink` and `ent.s.pos.trBase[2]` in place.
function BodySink(level,ent) return bodies.sink(level,ent) end function
/// Forward `CopyToBodyQue` to `mq3.game.bodies.copyToQueue` and return the delegated result.
/// @param level Game-level state; accesses `scene`, `bodyQue`, `bodyQueIndex` and `time`. May update `level.bodyQueIndex` in place.
/// @param ent Game entity; accesses `s`, `client`, `r` and `health`.
function CopyToBodyQue(level,ent) return bodies.copyToQueue(level,ent) end function
/// Forward `SetClientViewAngle` to `mq3.game.teleport.setClientViewAngle` and return the delegated result.
/// @param ent Game entity; accesses `client` and `s`. May update `ent.client.ps.delta_angles[axis]`, `ent.s.angles` and `ent.client.ps.viewangles` in place.
/// @param angle Pitch, yaw and roll angles in degrees.
function SetClientViewAngle(ent,angle) return teleport.setClientViewAngle(ent,angle) end function
/// Forward `respawn` to `mq3.game.deaths.respawn` and return the delegated result.
/// @param level Game-level state; accesses `playerDieFn`. May update `level.playerDieFn` in place.
/// @param ent Game entity; accesses `client` and `s`.
function respawn(level,ent) return deaths.respawn(level,ent) end function

/// Forward `TeamCount` to `mq3.game.tournament.teamCount` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param ignoreClientNum Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`.
/// @param team Team identifier used by the game rules.
function TeamCount(level,ignoreClientNum,team) return tournament.teamCount(level,ignoreClientNum,team) end function
/// Forward `TeamLeader` to `mq3.game.client_info.teamLeader` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param team Team identifier used by the game rules.
function TeamLeader(level,team) return clientInfo.teamLeader(level,team) end function
/// Forward `PickTeam` to `mq3.game.client_info.pickTeam` and return the delegated result.
/// @param level Game-level state; accesses `teamScores`.
/// @param ignoreClientNum Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`.
function PickTeam(level,ignoreClientNum) return clientInfo.pickTeam(level,ignoreClientNum) end function

// The original ForceClientSkin helper is commented out in the pinned source,
// but the inventory intentionally retains its parsed `skin` parameter.  Keep
// the exact useful transformation available without mutating caller storage.
/// @param model Value passed as argument 1 to `bytes`.
/// @param skinName Operand used to evaluate the returned expression `model+"/"+skinName`.
function skin(model,skinName)
  split = -1; index = len(bytes(model))-1
  while index >= 0
    if bytes(model)[index] == 47 then split = index; break end if
    index = index-1
  end while
  if split >= 0 then model = decode(slice(bytes(model),0,split)) end if
  return model+"/"+skinName
end function

/// Forward `ClientCleanName` to `mq3.game.client_info.cleanName` and return the delegated result.
/// @param input Text to parse, format or deliver.
/// @param outSize Maximum number of entries to allocate or retain.
function ClientCleanName(input,outSize) return clientInfo.cleanName(input,outSize) end function
/// Forward `ClientUserinfoChanged` to `mq3.game.client_info.changed` and return the delegated result.
/// @param level Game-level state; accesses `entities`, `userinfoFn`, `serverCommandFn`, `spawner` and `gameLogFn`.
/// @param clientNum Client slot number.
function ClientUserinfoChanged(level,clientNum) return clientInfo.changed(level,clientNum) end function
/// Forward `ClientConnect` to `mq3.game.client_connect.connect` and return the delegated result.
/// @param level Game-level state; accesses `entities`, `userinfoFn`, `filterPacketFn`, `cvarMaintenance` and `clients` and related fields.
/// @param clientNum Client slot number.
/// @param firstTime Value used by `connect` in `if firstTime or level.newSession then sessions.initClient(level,client,info) end if`.
/// @param isBot Value used by `connect` in `if isBot then`.
function ClientConnect(level,clientNum,firstTime,isBot) return clientConnect.connect(level,clientNum,firstTime,isBot) end function
/// Forward `ClientBegin` to `mq3.game.client_spawn.clientBegin` and return the delegated result.
/// @param level Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `entities` and `time` and related fields.
/// @param clientNum Client slot number.
function ClientBegin(level,clientNum) return clientSpawn.clientBegin(level,clientNum) end function
/// Forward `ClientSpawn` to `mq3.game.client_spawn.spawn` and return the delegated result.
/// @param level Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `respawnFn` and `clientBeginFn` and related fields. May update `level.playerDieFn`, `level.respawnFn` and `level.clientBeginFn` in place.
/// @param ent Game entity; accesses `slot`, `client`, `s`, `takedamage` and `inuse` and related fields. May update `ent.s.eFlags`, `ent.s.groundEntityNum` and `ent.client` and additional fields in place.
function ClientSpawn(level,ent) return clientSpawn.spawn(level,ent,deaths.playerDie) end function
/// Forward `ClientDisconnect` to `mq3.game.client_disconnect.disconnect` and return the delegated result.
/// @param level Game-level state; accesses `removeQueuedBotBeginFn`, `lifecycleState`, `entities`, `maxclients` and `clients` and related fields. May update `level.clients[winner].wins` in place.
/// @param clientNum Client slot number.
function ClientDisconnect(level,clientNum) return clientDisconnect.disconnect(level,clientNum) end function

// Game logic never calls ClientDisconnect directly when kicking a client.
// Keep the syscall boundary explicit so the engine performs its housekeeping
// and calls ClientDisconnect back through vmMain in the original order.
/// @param level Game-level state; accesses `dropClientFn`.
/// @param clientNum Client slot number.
/// @param reason Reason text recorded with the operation.
function trap_DropClient(level,clientNum,reason)
  if level.dropClientFn == void then return error(492,"trap_DropClient requires engine delivery") end if
  level.dropClientFn(level,clientNum,reason); return void
end function
