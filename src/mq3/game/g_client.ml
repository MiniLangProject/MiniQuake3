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

function SP_info_player_deathmatch(level,ent) return spawnFunctions.playerDeathmatch(level,ent) end function
function SP_info_player_start(level,ent)
  ent.classname = "info_player_deathmatch"
  return spawnFunctions.playerDeathmatch(level,ent)
end function
function SP_info_player_intermission(level,ent) return void end function

function SpotWouldTelefrag(level,spot) return spawns.wouldTelefrag(level,spot) end function
function SelectNearestDeathmatchSpawnPoint(level,point) return spawns.nearest(level,point) end function
function SelectRandomDeathmatchSpawnPoint(level) return spawns.randomDeathmatch(level) end function
function SelectRandomFurthestSpawnPoint(level,avoidPoint,origin,angles) return spawns.furthest(level,avoidPoint,origin,angles) end function
function SelectSpawnPoint(level,avoidPoint,origin,angles) return spawns.selectSpawn(level,avoidPoint,origin,angles) end function
function SelectInitialSpawnPoint(level,origin,angles) return spawns.initial(level,origin,angles) end function
function SelectSpectatorSpawnPoint(level,origin,angles) return spawns.spectator(level,origin,angles) end function

function InitBodyQue(level) return bodies.initQueue(level) end function
function BodySink(level,ent) return bodies.sink(level,ent) end function
function CopyToBodyQue(level,ent) return bodies.copyToQueue(level,ent) end function
function SetClientViewAngle(ent,angle) return teleport.setClientViewAngle(ent,angle) end function
function respawn(level,ent) return deaths.respawn(level,ent) end function

function TeamCount(level,ignoreClientNum,team) return tournament.teamCount(level,ignoreClientNum,team) end function
function TeamLeader(level,team) return clientInfo.teamLeader(level,team) end function
function PickTeam(level,ignoreClientNum) return clientInfo.pickTeam(level,ignoreClientNum) end function

// The original ForceClientSkin helper is commented out in the pinned source,
// but the inventory intentionally retains its parsed `skin` parameter.  Keep
// the exact useful transformation available without mutating caller storage.
function skin(model,skinName)
  split = -1; index = len(bytes(model))-1
  while index >= 0
    if bytes(model)[index] == 47 then split = index; break end if
    index = index-1
  end while
  if split >= 0 then model = decode(slice(bytes(model),0,split)) end if
  return model+"/"+skinName
end function

function ClientCleanName(input,outSize) return clientInfo.cleanName(input,outSize) end function
function ClientUserinfoChanged(level,clientNum) return clientInfo.changed(level,clientNum) end function
function ClientConnect(level,clientNum,firstTime,isBot) return clientConnect.connect(level,clientNum,firstTime,isBot) end function
function ClientBegin(level,clientNum) return clientSpawn.clientBegin(level,clientNum) end function
function ClientSpawn(level,ent) return clientSpawn.spawn(level,ent,deaths.playerDie) end function
function ClientDisconnect(level,clientNum) return clientDisconnect.disconnect(level,clientNum) end function

// Game logic never calls ClientDisconnect directly when kicking a client.
// Keep the syscall boundary explicit so the engine performs its housekeeping
// and calls ClientDisconnect back through vmMain in the original order.
function trap_DropClient(level,clientNum,reason)
  if level.dropClientFn == void then return error(492,"trap_DropClient requires engine delivery") end if
  level.dropClientFn(level,clientNum,reason); return void
end function
