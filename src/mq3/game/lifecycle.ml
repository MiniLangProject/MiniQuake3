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
import mq3.game.bot_lifecycle as bots
import mq3.game.bot_registry as botRegistry
import mq3.game.bot_clients as botClients
import mq3.game.bot_client_resources as botClientResources
import mq3.game.bot_population as botPopulation
import mq3.game.bot_ai_frame as botAiFrame
import mq3.game.client_connect as clientConnect
import mq3.game.server_commands as serverCommands
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
  botAllocateClientFn
  integerQueryFn
  spawnEffectFn
  entityObserveFn
  cvarEffectFn
  botState
  botRegistry
  botClients
  botClientResources
  botPopulation
  botAiFrame
end struct
function get(level)
  if level.lifecycleState == void then return error(476,"Game lifecycle requires module bindings") end if
  return level.lifecycleState
end function
function startBotFrame(level,time)
  state = get(level)
  if state.botAiFrame == void then return error(476,"Game lifecycle requires BotAI frame service") end if
  return botAiFrame.startFrame(level,state.botAiFrame,time)
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
function registryPrint(level,text)
  return gamePrint(level,text)
end function
function queuedBotUserinfo(level,slot)
  if level.userinfoFn == void then return error(476,"Bot client integration requires userinfo delivery") end if
  return level.userinfoFn(level,slot)
end function
function queuedBotBegin(level,slot)
  if level.clientBeginFn == void then return error(476,"Bot client integration requires ClientBegin") end if
  level.clientBeginFn(level,slot); return void
end function
function queuedBotDrop(level,slot,message)
  if level.dropClientFn == void then return error(476,"Bot client integration requires DropClient") end if
  level.dropClientFn(level,slot,message); return void
end function
function queuedBotPrint(level,text)
  return gamePrint(level,text)
end function
function resourceBotSetup(level,slot,settings,restart)
  return botClientResources.setupClient(get(level).botClientResources,slot,settings,restart)
end function
function resourceBotShutdown(state,slot,restart)
  if state.clientResources == void then return error(476,"Bot client integration requires resource bindings") end if
  return botClientResources.shutdownClient(state.clientResources,slot,restart)
end function
function populationMinimum(level)
  return botPopulation.checkMinimumPlayers(level,get(level).botPopulation)
end function
function populationPrint(level,text)
  return gamePrint(level,text)
end function
function populationConsole(level,mode,text)
  if level.consoleCommandFn == void then return error(476,"Bot population requires console-command delivery") end if
  level.consoleCommandFn(level,mode,text); return void
end function
function populationServer(level,slot,text)
  if level.serverCommandFn == void then return error(476,"Bot population requires server-command delivery") end if
  level.serverCommandFn(level,slot,text); return void
end function
function populationCvarSet(level,key,value)
  if level.cvarSetFn == void then return error(476,"Bot population requires Cvar_Set delivery") end if
  level.cvarSetFn(level,key,value); return void
end function
function populationSetUserinfo(level,slot,value)
  if level.userinfoSetFn == void then return error(476,"Bot population requires SetUserinfo delivery") end if
  level.userinfoSetFn(level,slot,value); return void
end function
function populationConnect(level,slot,firstTime,isBot)
  return clientConnect.connect(level,slot,firstTime,isBot)
end function
function populationAllocate(level)
  callback = get(level).botAllocateClientFn
  if callback == void then return error(476,"Bot population requires BotAllocateClient delivery") end if
  return callback(level)
end function
function populationAddCommand(level,argv)
  state = get(level).botPopulation
  state.botEnable = integerValue(level,"bot_enable") != 0
  state.clRunning = integerValue(level,"cl_running") != 0
  skill = cv.find(level.spawner.cvars,"g_spSkill"); if skill != void then state.spSkill = skill.value end if
  args = []; index = 1
  while index < len(argv) args = args+[argv[index]]; index = index+1 end while
  botPopulation.serviceAddBot(level,state,args); return void
end function
function populationListCommand(level,argv)
  botPopulation.botList(level,get(level).botPopulation); return void
end function
function defaultInitBots(level,restart)
  state = get(level); registry = state.botRegistry
  botsFile = cv.createVm(); arenasFile = cv.createVm(); minimum = cv.createVm()
  cv.registerVm(level.spawner.cvars,botsFile,"g_botsFile","",cv.INIT | cv.ROM)
  cv.registerVm(level.spawner.cvars,arenasFile,"g_arenasFile","",cv.INIT | cv.ROM)
  botRegistry.loadBots(registry,true,botsFile.string)
  botRegistry.loadArenas(registry,arenasFile.string)
  cv.registerVm(level.spawner.cvars,minimum,"bot_minplayers","0",cv.SERVERINFO)
  population = state.botPopulation; population.minimumVm = minimum; population.minimumPlayers = minimum.integer
  skill = cv.find(level.spawner.cvars,"g_spSkill"); if skill != void then population.spSkill = skill.value end if
  population.botEnable = integerValue(level,"bot_enable") != 0; population.clRunning = integerValue(level,"cl_running") != 0
  if level.spawner.gametype == 2 then
    if state.serverInfoFn == void then return error(476,"Single-player bot init requires serverinfo") end if
    serverinfo = infoStrings.copy(state.serverInfoFn(level,1024),1024)
    botPopulation.initSinglePlayer(level,population,restart != 0,infoStrings.value(serverinfo,"mapname"))
  end if
  return void
end function
function defaultBotConnect(level,slot,restart)
  return botClients.botConnect(level,get(level).botClients,slot,restart)
end function
function defaultRemoveQueuedBotBegin(level,slot)
  botClients.removeQueuedBotBegin(get(level).botClients,slot); return void
end function
function defaultBotShutdownClient(level,slot,restart)
  state = get(level).botState
  if state.shutdownClientFn == void then return error(476,"Bot client integration requires BotAIShutdownClient") end if
  return state.shutdownClientFn(state,slot,restart)
end function
function checkBotSpawn(level)
  return botClients.checkBotSpawn(level,get(level).botClients)
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
  level.bodyQueIndex = 0; level.bodyQue = array(8,void); level.podium1 = void; level.podium2 = void; level.podium3 = void
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
    ent.pos1 = freshEntity.pos1
    ent.pos2 = freshEntity.pos2
    ent.reached = freshEntity.reached
    ent.blocked = freshEntity.blocked
    ent.soundPos1 = freshEntity.soundPos1
    ent.sound1to2 = freshEntity.sound1to2
    ent.sound2to1 = freshEntity.sound2to1
    ent.soundPos2 = freshEntity.soundPos2
    ent.soundLoop = freshEntity.soundLoop
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
  state = State(buildDate,false,false,void,void,void,void,void,void,void,void,void,void,level.spawner.effectFn,level.observeFn,void,void,void,void,void,void,void)
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
  state.botState = bots.create(level.spawner.cvars); level.botLifecycleState = state.botState
  state.botRegistry = botRegistry.create(void,void,registryPrint,level)
  state.botClients = botClients.create()
  state.botClients.userinfoFn = queuedBotUserinfo; state.botClients.clientBeginFn = queuedBotBegin
  state.botClients.dropClientFn = queuedBotDrop; state.botClients.printFn = queuedBotPrint
  state.botClientResources = botClientResources.create(state.botState)
  state.botState.clientResources = state.botClientResources; state.botState.shutdownClientFn = resourceBotShutdown
  state.botClients.setupClientFn = resourceBotSetup
  state.botPopulation = botPopulation.create(state.botRegistry,state.botClients)
  state.botAiFrame = botAiFrame.create(state.botState)
  state.botPopulation.allocateClientFn = populationAllocate
  state.botPopulation.connectClientFn = populationConnect; state.botPopulation.setUserinfoFn = populationSetUserinfo
  state.botPopulation.consoleFn = populationConsole; state.botPopulation.serverCommandFn = populationServer
  state.botPopulation.printFn = populationPrint; state.botPopulation.cvarSetFn = populationCvarSet
  state.botClients.minimumPlayersFn = populationMinimum
  commandState = serverCommands.get(level)
  serverCommands.attach(level,populationAddCommand,populationListCommand,commandState.abortPodiumFn)
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
    if state.botSetupFn != void then state.botSetupFn(level,restart)
    else bots.setup(state.botState,restart) end if
    if state.botLoadMapFn != void then state.botLoadMapFn(level,restart)
    else bots.loadMap(state.botState,restart) end if
    if state.initBotsFn != void then state.initBotsFn(level,restart)
    else defaultInitBots(level,restart) end if
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
    if state.botShutdownFn != void then state.botShutdownFn(level,restart)
    else bots.shutdown(state.botState,restart) end if
  end if
  return void
end function
