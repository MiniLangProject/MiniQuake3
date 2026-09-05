// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// g_utils lifecycle and target selection. Game fields grow with ported rules;
// the full network entityState lives in s, the server collision fields in r.
package mq3.game.entities
import mq3.game.cvar_maintenance as cvarMaintenance
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.snapshot as snapshot
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.compat.numeric as n
import std.string as strings
struct Client
  ps
  team
  cmdAngles
  noclip
  damage_armor
  damage_blood
  damage_knockback
  damage_from
  damage_fromWorld
  lasthurt_client
  lasthurt_mod
  lasthurtcarrier
  accuracy_hits
  hook
  connected
  spectatorState
  spectatorClient
  spectatorTime
  enterTime
  accuracy_shots
  netname
  readyToExit
  lastkilled_client
  respawnTime
  rewardTime
  lastKillTime
  cmdWeapon
  lastfraggedcarrier
  fragcarrier
  carrierdefense
  basedefense
  predictItemPickup
  captures
  flagrecovery
  assists
  lastreturnedflag
  flagsince
  localClient
  initialSpawn
  pmoveFixed
  maxHealth
  teamStateState
  teamStateLocation
  voteCount
  teamVoteCount
  teamInfo
  wins
  losses
  teamLeader
  cmdServerTime
  cmdButtons
  cmdForwardmove
  cmdRightmove
  cmdUpmove
  lastCmdTime
  buttons
  oldbuttons
  latched_buttons
  oldOrigin
  accurateCount
  inactivityTime
  inactivityWarning
  airOutTime
  fireHeld
  switchTeamTime
  timeResidual
end struct
struct Entity
  slot
  s
  r
  client
  inuse
  classname
  freetime
  neverFree
  eventTime
  freeAfterEvent
  touch
  target
  targetname
  spawnflags
  model
  model2
  speed
  message
  team
  wait
  random
  count
  health
  damage
  targetShaderName
  targetShaderNewName
  flags
  movedir
  nextthink
  think
  use
  activator
  unlinkAfterEvent
  physicsObject
  noise_index
  fly_sound_debounce_time
  nextTrain
  takedamage
  moverState
  enemy
  pain
  die
  timestamp
  parent
  target_ent
  splashDamage
  splashRadius
  methodOfDeath
  splashMethodOfDeath
  clipmask
  physicsBounce
  item
  teammaster
  teamchain
  waterlevel
  watertype
  pain_debounce_time
end struct
struct Level
  scene
  entities
  num_entities
  time
  startTime
  randSeed
  damageFn
  doorTouch
  observeFn
  context
  spawner
  shaderRemaps
  runEntityFn
  locationLinked
  locationHead
  intermissionQueued
  knockback
  friendlyFire
  traceObserveFn
  previousTime
  itemRegistered
  blood
  bodyQueIndex
  bodyQue
  intermission_origin
  intermission_angle
  clients
  maxclients
  maxclientsCvar
  sortedClients
  teamScores
  follow1
  follow2
  numConnectedClients
  numNonSpectatorClients
  numPlayingClients
  numVotingClients
  numteamVotingClients
  intermissiontime
  timelimit
  fraglimit
  capturelimit
  readyToExit
  exitTime
  serverCommandFn
  gameLogFn
  matchTransitionFn
  deathAnimIndex
  itemDropFn
  flagReturnFn
  teamMessageFn
  clientSpawnFn
  redFlagStatus
  blueFlagStatus
  neutralFlagStatus
  redTakenTime
  blueTakenTime
  lastFlagCapture
  lastCaptureTeam
  weaponRespawn
  weaponTeamRespawn
  inactivity
  userinfoFn
  usercmdFn
  clientThinkFn
  clientEndFrameFn
  moveIntermissionFn
  sndFry
  smoothClients
  clientBeginFn
  gravity
  playerSpeed
  dmflags
  pmoveFixed
  pmoveMsec
  synchronousClients
  forceRespawn
  cvarSetFn
  dropClientFn
  followCycleFn
  gauntletAttackFn
  fireWeaponFn
  botTestAasFn
  respawnFn
  playerDieFn
  framenum
  restarted
  frameStageFn
  listEntity
  warmup
  warmupModificationCount
  warmupCvarModificationCount
  tournamentAddFn
  consoleCommandFn
  voteString
  voteTime
  voteExecuteTime
  voteYes
  voteNo
  teamVoteString
  teamVoteTime
  teamVoteYes
  teamVoteNo
  clientUserinfoChangedFn
  lastTeamLocationTime
  cvarMaintenance
  gameCvars
  updateCvarsFn
end struct
function createClient(state,team,cmdAngles)
  return Client(state,team,cmdAngles,false,0,0,0,[0.0,0.0,0.0],false,0,0,0.0,0,void,0,0,0,0,0,0,"",false,0,0,0,0,0,0.0,0,0,0,false,0,0,0,0.0,0.0,
    false,false,false,0,0,0,0,0,false,0,0,false,0,0,0,0,0,0,0,0,0,[0.0,0.0,0.0],0,0,false,0,false,0,0)
end function
function blank(slot,r)
  return Entity(slot,es.create(),r,void,false,void,0,false,0,false,void,void,void,0,void,void,0.0,void,void,0.0,0.0,0,0,0,void,void,0,[0.0,0.0,0.0],0,void,void,void,false,false,0,0,void,false,0,void,void,void,0,void,void,0,0,0,0,0,0.0,void,void,void,0,0,0)
end function
function create(world)
  scene = sv.create(world); level = Level(scene,[],64,0,0,1,void,void,void,void,void,[],void,false,void,0,1000.0,0,void,0,array(256,0),1,0,[],[0.0,0.0,0.0],[0.0,0.0,0.0],[],0,0,array(64,0),array(4,0),0,0,0,0,0,0,array(2,0),0,0,0,0,false,0,void,void,void,0,void,void,void,void,0,0,0,0,0,0.0,0,5,30,0,void,void,void,void,void,0,false,void,800,320,0,false,8,false,0,void,void,void,void,void,void,void,void,0,false,void,0,20,0,0,void,void,
    "",0,0,0,0,array(2,""),array(2,0),array(2,0),array(2,0),void,0,cvarMaintenance.create(),void,void)
  for i = 0 to 1023
    level.entities = level.entities+[blank(i,scene.entities[i])]
  end for
  for i = 0 to 63
    level.clients = level.clients+[createClient(ps.create(),0,[0,0,0])]
  end for
  return level
end function
function bindClient(level,ent,client)
  if ent.slot < 0 or ent.slot >= 64 then return error(495,"Invalid client binding slot") end if
  ent.client = client; level.clients[ent.slot] = client
  return client
end function
function observe(level,kind,ent)
  if level.observeFn != void then level.observeFn(level,kind,ent) end if
  return void
end function
function initEntity(ent)
  ent.inuse = true; ent.classname = "noclass"; ent.s.number = ent.slot; ent.r.number = ent.slot; ent.r.ownerNum = 1023
  return ent
end function
function spawn(level)
  if level.num_entities < 64 or level.num_entities > 1022 then return error(483,"Invalid game entity count") end if
  i = 64
  while i < level.num_entities
    ent = level.entities[i]
    if not ent.inuse and not (ent.freetime > n.add32(level.startTime,2000) and n.i32(level.time-ent.freetime) < 1000) then return initEntity(ent) end if
    i = i+1
  end while
  // In the original valid range, the force pass is unreachable: 1022 != 1024.
  if i == 1022 then return error(483,"G_Spawn: no free entities") end if
  level.num_entities = level.num_entities+1; ent = level.entities[i]
  observe(level,3,ent)
  return initEntity(ent)
end function
function entitiesFree(level)
  i = 64
  while i < level.num_entities
    if not level.entities[i].inuse then return true end if
    i = i+1
  end while
  return false
end function
function syncSpatial(ent)
  ent.r.number = ent.s.number; ent.r.modelindex = ent.s.modelindex; ent.r.solid = ent.s.solid
  ent.r.origin = movement.copy(ent.s.origin); ent.r.angles = movement.copy(ent.s.angles)
  return void
end function
function link(level,ent)
  syncSpatial(ent); sv.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  observe(level,1,ent)
  return void
end function
function unlink(level,ent)
  sv.unlinkEntity(level.scene,ent.slot); observe(level,2,ent)
  return void
end function
function free(level,ent)
  unlink(level,ent)
  if ent.neverFree then return void end if
  // The server's svEntity metadata is separate from the zeroed gentity in C.
  old = ent.r; r = sv.entity(ent.slot); r.number = 0
  r.clusters = old.clusters; r.lastCluster = old.lastCluster; r.areanum = old.areanum; r.areanum2 = old.areanum2; r.nextEntity = old.nextEntity
  ent.r = r; level.scene.entities[ent.slot] = r
  ent.s = es.create(); ent.client = void; ent.inuse = false; ent.classname = "freed"; ent.freetime = level.time
  ent.neverFree = false; ent.eventTime = 0; ent.freeAfterEvent = false; ent.touch = void; ent.target = void; ent.targetname = void; ent.spawnflags = 0
  ent.model = void; ent.model2 = void; ent.speed = 0.0; ent.message = void; ent.team = void; ent.wait = 0.0; ent.random = 0.0
  ent.count = 0; ent.health = 0; ent.damage = 0; ent.targetShaderName = void; ent.targetShaderNewName = void; ent.flags = 0
  ent.movedir = [0.0,0.0,0.0]; ent.nextthink = 0; ent.think = void
  ent.use = void; ent.activator = void; ent.unlinkAfterEvent = false; ent.physicsObject = false
  ent.noise_index = 0; ent.fly_sound_debounce_time = 0; ent.nextTrain = void
  ent.takedamage = false; ent.moverState = 0; ent.enemy = void; ent.pain = void; ent.die = void; ent.timestamp = 0
  ent.parent = void; ent.target_ent = void; ent.splashDamage = 0; ent.splashRadius = 0; ent.methodOfDeath = 0; ent.splashMethodOfDeath = 0; ent.clipmask = 0; ent.physicsBounce = 0.0
  ent.item = void; ent.teammaster = void; ent.teamchain = void
  ent.waterlevel = 0; ent.watertype = 0
  ent.pain_debounce_time = 0
  return void
end function
function runThink(level,ent)
  thinktime = n.f32(ent.nextthink)
  if thinktime <= 0 or thinktime > n.f32(level.time) then return void end if
  ent.nextthink = 0
  if ent.think == void then return error(485,"NULL ent->think") end if
  ent.think(level,ent)
  return void
end function
function setOrigin(ent,origin)
  ent.s.pos.trBase = movement.copy(origin); ent.s.pos.trType = c.TR_STATIONARY; ent.s.pos.trTime = 0; ent.s.pos.trDuration = 0
  ent.s.pos.trDelta = [0.0,0.0,0.0]; ent.r.currentOrigin = movement.copy(origin)
  return void
end function
function tempEntity(level,origin,event)
  ent = spawn(level); ent.s.eType = c.ET_EVENTS+event; ent.classname = "tempEntity"
  ent.eventTime = level.time; ent.freeAfterEvent = true
  snapped = movement.copy(origin); snapshot.snapVector(snapped); setOrigin(ent,snapped); link(level,ent)
  return ent
end function
function random(level)
  // Native Windows rand profile; separate from Q_rand and the QVM rand profile.
  level.randSeed = n.add32(n.mul32(level.randSeed,214013),2531011)
  return (n.u32(level.randSeed) >> 16) & 32767
end function
function pickTarget(level,name)
  if name == void then return void end if
  choices = []; i = 0
  while i < level.num_entities
    ent = level.entities[i]; i = i+1
    if ent.inuse and ent.targetname != void and strings.equalsIgnoreCaseAscii(ent.targetname,name) then
      choices = choices+[ent]
      if len(choices) == 32 then break end if
    end if
  end while
  if len(choices) == 0 then return void end if
  return choices[random(level) % len(choices)]
end function
