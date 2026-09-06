// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_main.c module entry/exit. Engine services are explicit bindings.
package mq3.game.lifecycle
import mq3.game.entities as game
import mq3.game.cvars as gameCvars
import mq3.game.cvar_maintenance as maintenance
import mq3.game.ip_filters as ipFilters
import mq3.game.memory as memory
import mq3.game.logging as logging
import mq3.game.session as sessions
import mq3.game.bodies as bodies
import mq3.game.items as items
import mq3.game.initialization as initialization
import mq3.game.spawn as spawn
import mq3.game.spawn_values as values
import mq3.server.world as sv
import mq3.qcommon.cvar as cv
import mq3.shared.parser as parser
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n

struct State
  buildDate
  entitiesBound
  clientsBound
  openLogFn
  closeLogFn
  serverInfoFn
  locateFn
  botSetupFn
  botLoadMapFn
  initBotsFn
  botShutdownFn
  integerQueryFn
  spawnEffectFn
  entityObserveFn
  cvarEffectFn
end struct
function get(level)
  if level.lifecycleState == void then return error(476,"Game lifecycle requires module bindings") end if
  return level.lifecycleState
end function
function gamePrint(level,text)
  if len(bytes(text)) > 1023 then return error(476,"Game diagnostic exceeds original G_Printf buffer") end if
  if level.gamePrintFn == void then return error(476,"Game lifecycle requires diagnostic delivery") end if
  level.gamePrintFn(level,text); return void
end function
function vm(level,name)
  for each row in gameCvars.moduleState(level).rows
    if row.vmName == name and row.vm != void then return row.vm end if
  end for
  return error(476,"Missing lifecycle VM Cvar: "+name)
end function
function integerValue(level,name)
  value = 0; variable = cv.find(level.spawner.cvars,name)
  if variable != void then value = variable.integer end if
  state = get(level)
  if state.integerQueryFn != void then state.integerQueryFn(level,name,value) end if
  return value
end function
function cvarEffect(cvarState,kind,index,key,value)
  level = cvarState.level; state = get(level)
  if kind == 4 then return gamePrint(level,value) end if
  if state.cvarEffectFn != void then state.cvarEffectFn(cvarState,kind,index,key,value) end if
  return void
end function
function spawnEffect(spawner,kind,index,key,value)
  level = spawner.level; state = get(level)
  if kind == 3 then return logging.write(level,value) end if
  if state.spawnEffectFn != void then state.spawnEffectFn(spawner,kind,index,key,value) end if
  return void
end function
function entityObserve(level,kind,ent)
  state = get(level)
  if kind == 3 then
    if state.locateFn == void then return error(476,"Game allocation requires LocateGameData delivery") end if
    state.locateFn(level,level.num_entities)
  end if
  if state.entityObserveFn != void then state.entityObserveFn(level,kind,ent) end if
  return void
end function
function clearLevel(level)
  // Only fields of native level_locals_t. Cvar mirrors, module statics, engine
  // storage and host interfaces deliberately survive this memset phase.
  state = get(level); state.entitiesBound = false; state.clientsBound = false
  level.num_entities = 0; level.time = 0; level.startTime = 0; level.previousTime = 0
  level.maxclients = 0; level.framenum = 0; level.restarted = false; level.logFile = 0
  level.teamScores = array(4,0); level.lastTeamLocationTime = 0; level.newSession = false
  level.numConnectedClients = 0; level.numNonSpectatorClients = 0; level.numPlayingClients = 0
  level.sortedClients = array(64,0); level.follow1 = 0; level.follow2 = 0; level.sndFry = 0
  level.warmupModificationCount = 0; level.voteString = ""; level.voteDisplayString = ""
  level.voteTime = 0; level.voteExecuteTime = 0; level.voteYes = 0; level.voteNo = 0; level.numVotingClients = 0
  level.teamVoteString = array(2,""); level.teamVoteTime = array(2,0); level.teamVoteYes = array(2,0)
  level.teamVoteNo = array(2,0); level.numteamVotingClients = array(2,0)
  level.intermissionQueued = 0; level.intermissiontime = 0; level.changemap = void
  level.readyToExit = false; level.exitTime = 0; level.intermission_origin = [0.0,0.0,0.0]
  level.intermission_angle = [0.0,0.0,0.0]; level.locationLinked = false; level.locationHead = void
  level.bodyQueIndex = 0; level.bodyQue = array(8,void)
  level.spawner.vars = []; level.spawner.chars = 0; level.spawner.spawning = false; level.spawner.warmupTime = 0
  return void
end function
function clearEntities(level)
  // g_entities has stable array addresses. Its shared-r bytes are separate
  // from the server's sector/PVS metadata, which GAME_INIT does not memset.
  for index = 0 to 1023
    ent = level.entities[index]; r = ent.r; fresh = sv.entity(index)
    r.number = 0
    r.modelindex = fresh.modelindex
    r.solid = fresh.solid
    r.origin = fresh.origin
    r.angles = fresh.angles
    r.linked = fresh.linked
    r.linkcount = fresh.linkcount
    r.svFlags = fresh.svFlags
    r.bmodel = fresh.bmodel
    r.mins = fresh.mins
    r.maxs = fresh.maxs
    r.contents = fresh.contents
    r.absmin = fresh.absmin
    r.absmax = fresh.absmax
    r.currentOrigin = fresh.currentOrigin
    r.currentAngles = fresh.currentAngles
    r.ownerNum = fresh.ownerNum
    r.singleClient = fresh.singleClient
    freshEntity = game.blank(index,r)
    ent.s = freshEntity.s
    ent.client = freshEntity.client
    ent.inuse = freshEntity.inuse
    ent.classname = freshEntity.classname
    ent.freetime = freshEntity.freetime
    ent.neverFree = freshEntity.neverFree
    ent.eventTime = freshEntity.eventTime
    ent.freeAfterEvent = freshEntity.freeAfterEvent
    ent.touch = freshEntity.touch
    ent.target = freshEntity.target
    ent.targetname = freshEntity.targetname
    ent.spawnflags = freshEntity.spawnflags
    ent.model = freshEntity.model
    ent.model2 = freshEntity.model2
    ent.speed = freshEntity.speed
    ent.message = freshEntity.message
    ent.team = freshEntity.team
    ent.wait = freshEntity.wait
    ent.random = freshEntity.random
    ent.count = freshEntity.count
    ent.health = freshEntity.health
    ent.damage = freshEntity.damage
    ent.targetShaderName = freshEntity.targetShaderName
    ent.targetShaderNewName = freshEntity.targetShaderNewName
    ent.flags = freshEntity.flags
    ent.movedir = freshEntity.movedir
    ent.nextthink = freshEntity.nextthink
    ent.think = freshEntity.think
    ent.use = freshEntity.use
    ent.activator = freshEntity.activator
    ent.unlinkAfterEvent = freshEntity.unlinkAfterEvent
    ent.physicsObject = freshEntity.physicsObject
    ent.noise_index = freshEntity.noise_index
    ent.fly_sound_debounce_time = freshEntity.fly_sound_debounce_time
    ent.nextTrain = freshEntity.nextTrain
    ent.takedamage = freshEntity.takedamage
    ent.moverState = freshEntity.moverState
    ent.enemy = freshEntity.enemy
    ent.pain = freshEntity.pain
    ent.die = freshEntity.die
    ent.timestamp = freshEntity.timestamp
    ent.parent = freshEntity.parent
    ent.target_ent = freshEntity.target_ent
    ent.splashDamage = freshEntity.splashDamage
    ent.splashRadius = freshEntity.splashRadius
    ent.methodOfDeath = freshEntity.methodOfDeath
    ent.splashMethodOfDeath = freshEntity.splashMethodOfDeath
    ent.clipmask = freshEntity.clipmask
    ent.physicsBounce = freshEntity.physicsBounce
    ent.item = freshEntity.item
    ent.teammaster = freshEntity.teammaster
    ent.teamchain = freshEntity.teamchain
    ent.waterlevel = freshEntity.waterlevel
    ent.watertype = freshEntity.watertype
    ent.pain_debounce_time = freshEntity.pain_debounce_time
    level.scene.entities[index] = r
  end for
  return void
end function
function clearClients(level)
  for index = 0 to 63
    game.resetClient(level.clients[index])
  end for
  return void
end function
function attach(level,buildDate)
  if level.lifecycleState != void then return error(476,"Module is already attached; use a fresh level for a new VM image") end if
  if level.spawner == void then return error(476,"Module requires an engine world and entity-token source") end if
  infoStrings.textBytes(buildDate)
  if len(bytes(buildDate)) > 1012 then return error(476,"Build date exceeds original initialization diagnostic buffer") end if
  state = State(buildDate,false,false,void,void,void,void,void,void,void,void,void,level.spawner.effectFn,level.observeFn,void)
  level.lifecycleState = state
  // A newly loaded VM image starts with zeroed game storage, even though the
  // convenient isolated-fixture constructors have nonzero defaults.
  clearLevel(level); clearEntities(level); clearClients(level)
  level.randSeed = 1; level.shaderRemaps = []; level.itemRegistered = array(256,0)
  level.deathAnimIndex = 0; level.weaponState = void; level.ipFilters = void; level.memoryState = void
  level.serverCommands = void; level.cvarMaintenance = maintenance.create()
  level.redFlagStatus = 0; level.blueFlagStatus = 0; level.neutralFlagStatus = 0
  level.redTakenTime = 0; level.blueTakenTime = 0; level.lastFlagCapture = 0.0; level.lastCaptureTeam = 0
  level.redObeliskAttackedTime = 0; level.blueObeliskAttackedTime = 0
  cvarState = gameCvars.attach(level,buildDate)
  for each row in cvarState.rows
    gameCvars.syncValue(level,row)
  end for
  cvarState.effectFn = cvarEffect; level.spawner.effectFn = spawnEffect; level.observeFn = entityObserve
  level.gameLogFn = logging.write
  return state
end function
function init(level,levelTime,randomSeed,restart,entityText)
  state = get(level)
  if typeof(levelTime) != "int" or levelTime < -2147483648 or levelTime > 2147483647 then return error(476,"Invalid native level time") end if
  if typeof(randomSeed) != "int" or randomSeed < -2147483648 or randomSeed > 2147483647 then return error(476,"Invalid native random seed") end if
  if typeof(restart) != "int" or restart < -2147483648 or restart > 2147483647 then return error(476,"Invalid native restart argument") end if
  if typeof(entityText) != "string" then return error(476,"Entity token source must be a byte-preserving string") end if
  level.spawner.parser = parser.create(entityText)
  gamePrint(level,"------- Game Initialization -------\n")
  gamePrint(level,"gamename: baseq3\n"); gamePrint(level,"gamedate: "+state.buildDate+"\n")
  level.randSeed = n.i32(randomSeed)
  gameCvars.register(level); ipFilters.processBans(level); memory.init(level)
  clearLevel(level); level.time = levelTime; level.startTime = levelTime
  level.sndFry = values.soundIndex(level.spawner,"sound/player/fry.wav")
  logName = vm(level,"g_log").string
  if level.spawner.gametype != 2 and logName != "" then
    if state.openLogFn == void then return error(476,"Game lifecycle requires logfile opening") end if
    mode = 2
    if vm(level,"g_logSync").integer != 0 then mode = 3 end if
    level.logFile = state.openLogFn(level,logName,mode)
    if typeof(level.logFile) != "int" or level.logFile < -2147483648 or level.logFile > 2147483647 then return error(476,"Logfile host must return a native integer handle") end if
    if level.logFile == 0 then gamePrint(level,"WARNING: Couldn't open logfile: "+vm(level,"g_log").string+"\n")
    else
      if state.serverInfoFn == void then return error(476,"Game lifecycle requires engine serverinfo") end if
      serverinfo = infoStrings.copy(state.serverInfoFn(level,1024),1024)
      logging.write(level,"------------------------------------------------------------\n")
      logging.write(level,"InitGame: "+serverinfo+"\n")
    end if
  else gamePrint(level,"Not logging to disk.\n") end if
  sessions.initWorld(level)
  clearEntities(level); state.entitiesBound = true
  level.maxclients = vm(level,"g_maxclients").integer
  clearClients(level); state.clientsBound = true
  if level.maxclients < 0 or level.maxclients > 64 then return error(476,"Game client range exceeds original storage") end if
  index = 0
  while index < level.maxclients
    level.entities[index].client = level.clients[index]; index = index+1
  end while
  level.num_entities = 64
  if state.locateFn == void then return error(476,"Game lifecycle requires LocateGameData delivery") end if
  state.locateFn(level,level.num_entities)
  bodies.initQueue(level); items.clearRegistered(level); spawn.load(level.spawner)
  initialization.findTeams(level)
  if level.spawner.gametype >= 3 then items.checkTeamItems(level) end if
  items.saveRegistered(level); gamePrint(level,"-----------------------------------\n")
  if level.spawner.gametype == 2 or integerValue(level,"com_buildScript") != 0 then
    values.modelIndex(level.spawner,"models/mapobjects/podium/podium4.md3")
    values.soundIndex(level.spawner,"sound/player/gurp1.wav"); values.soundIndex(level.spawner,"sound/player/gurp2.wav")
  end if
  if integerValue(level,"bot_enable") != 0 then
    if state.botSetupFn == void then return error(476,"Game lifecycle requires BotAISetup") end if
    state.botSetupFn(level,restart)
    if state.botLoadMapFn == void then return error(476,"Game lifecycle requires BotAILoadMap") end if
    state.botLoadMapFn(level,restart)
    if state.initBotsFn == void then return error(476,"Game lifecycle requires G_InitBots") end if
    state.initBotsFn(level,restart)
  end if
  gameCvars.remapTeamShaders(level); return void
end function
function shutdown(level,restart)
  state = get(level)
  if typeof(restart) != "int" or restart < -2147483648 or restart > 2147483647 then return error(476,"Invalid native restart argument") end if
  gamePrint(level,"==== ShutdownGame ====\n")
  if level.logFile != 0 then
    logging.write(level,"ShutdownGame:\n"); logging.write(level,"------------------------------------------------------------\n")
    if state.closeLogFn == void then return error(476,"Game lifecycle requires logfile closing") end if
    state.closeLogFn(level,level.logFile)
  end if
  sessions.writeWorld(level)
  if integerValue(level,"bot_enable") != 0 then
    if state.botShutdownFn == void then return error(476,"Game lifecycle requires BotAIShutdown") end if
    state.botShutdownFn(level,restart)
  end if
  return void
end function
