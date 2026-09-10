// SPDX-License-Identifier: GPL-2.0-or-later
// Original map objects through the complete real lifecycle/game fixture.
import mq3.game.lifecycle as gameLifecycle
import map_object_contracts as mapContracts
import mq3.game.map_targets as mapTargets
import mq3.game.portals as portals
import mq3.game.items as mapItems
import mq3.game.movers as movers
import mq3.game.frame as frame
import mq3.shared.parser as mapParser
import mq3.game.cvars as gameCvars
import mq3.game.memory as memory
import mq3.game.bodies as lifecycleBodies
import mq3.game.ip_filters as filters
import mq3.game.weapon_state as weaponState
import mq3.game.targets as targets
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.entitystate as es
import mq3.game.client_info as clientInfo
import mq3.game.spawn as spawn
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings
import std.fs as fs
struct Reader
  data
  offset
end struct
struct Check
  expected
  offset
  words
  effects
  location
  memoryWatermark
  openHandle
  serverInfo
  normalizations
  mutationKind
  mutationArg
  mutationRemaining
  mutationAction
  mutationText
end struct
function readInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete lifecycle input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid lifecycle test string") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected lifecycle output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Lifecycle mismatch at byte "+str(check.offset)+" ["+check.location+"] got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function boolWord(check,value)
  if value then return word(check,1) end if
  return word(check,0)
end function
function textWord(check,value)
  if value == void then return word(check,-1) end if
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Lifecycle string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function floatWords(check,values)
  for each value in values
    word(check,n.floatBits(value))
  end for
  return void
end function
function connectClientSnapshot(check,client)
  words(check,ps.words(client.ps))
  word(check,client.team)
  words(check,client.cmdAngles)
  boolWord(check,client.noclip)
  word(check,client.damage_armor)
  word(check,client.damage_blood)
  word(check,client.damage_knockback)
  floatWords(check,client.damage_from)
  boolWord(check,client.damage_fromWorld)
  word(check,client.lasthurt_client)
  word(check,client.lasthurt_mod)
  word(check,n.floatBits(client.lasthurtcarrier))
  word(check,client.accuracy_hits)
  boolWord(check,client.hook != void)
  word(check,client.connected)
  word(check,client.spectatorState)
  word(check,client.spectatorClient)
  word(check,client.spectatorTime)
  word(check,client.enterTime)
  word(check,client.accuracy_shots)
  textWord(check,client.netname)
  boolWord(check,client.readyToExit)
  word(check,client.lastkilled_client)
  word(check,client.respawnTime)
  word(check,client.rewardTime)
  word(check,client.lastKillTime)
  word(check,client.cmdWeapon)
  word(check,n.floatBits(client.lastfraggedcarrier))
  word(check,client.fragcarrier)
  word(check,client.carrierdefense)
  word(check,client.basedefense)
  boolWord(check,client.predictItemPickup)
  word(check,client.captures)
  word(check,client.flagrecovery)
  word(check,client.assists)
  word(check,n.floatBits(client.lastreturnedflag))
  word(check,n.floatBits(client.flagsince))
  boolWord(check,client.localClient)
  boolWord(check,client.initialSpawn)
  boolWord(check,client.pmoveFixed)
  word(check,client.maxHealth)
  word(check,client.teamStateState)
  word(check,client.teamStateLocation)
  word(check,client.voteCount)
  word(check,client.teamVoteCount)
  boolWord(check,client.teamInfo)
  word(check,client.wins)
  word(check,client.losses)
  word(check,clientInfo.leaderValue(client))
  word(check,client.cmdServerTime)
  word(check,client.cmdButtons)
  word(check,client.cmdForwardmove)
  word(check,client.cmdRightmove)
  word(check,client.cmdUpmove)
  word(check,client.lastCmdTime)
  word(check,client.buttons)
  word(check,client.oldbuttons)
  word(check,client.latched_buttons)
  floatWords(check,client.oldOrigin)
  word(check,client.accurateCount)
  word(check,client.inactivityTime)
  boolWord(check,client.inactivityWarning)
  word(check,client.airOutTime)
  boolWord(check,client.fireHeld)
  word(check,client.switchTeamTime)
  word(check,client.timeResidual)
  return void
end function

function pointer(check,ent)
  if ent == void then return word(check,-1) end if
  return word(check,ent.slot)
end function
function entitySnapshot(level,ent)
  check = level.context; check.location = "entity "+str(ent.slot)
  words(check,es.words(ent.s)); boolWord(check,ent.inuse)
  slot = -1
  if ent.client != void then
    for i = 0 to 63
      if ent.client == level.clients[i] then slot = i; break end if
    end for
  end if
  word(check,slot); textWord(check,ent.classname)
  word(check,ent.freetime); boolWord(check,ent.neverFree); word(check,ent.eventTime); boolWord(check,ent.freeAfterEvent); boolWord(check,ent.unlinkAfterEvent)
  words(check,[ent.health,ent.flags]); boolWord(check,ent.takedamage); word(check,ent.clipmask); boolWord(check,ent.physicsObject); word(check,n.floatBits(ent.physicsBounce))
  words(check,[ent.nextthink,ent.timestamp,ent.count]); item = -1; if not (ent.item is void) then item = ent.item end if; word(check,item)
  boolWord(check,ent.think != void); boolWord(check,ent.die != void); boolWord(check,ent.touch != void); boolWord(check,ent.pain != void)
  pointer(check,ent.enemy); pointer(check,ent.parent)
  words(check,[ent.r.contents,ent.r.svFlags,ent.r.ownerNum,ent.r.singleClient]); boolWord(check,ent.r.linked); word(check,ent.r.linkcount)
  floatWords(check,ent.r.mins); floatWords(check,ent.r.maxs); floatWords(check,ent.r.currentOrigin); floatWords(check,ent.r.currentAngles); floatWords(check,ent.r.absmin); floatWords(check,ent.r.absmax)
  return void
end function

function blobWord(check,data)
  word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Lifecycle bytes mismatch at byte "+str(check.offset)+" ["+check.location+"]") end if
    check.offset = check.offset+1
  end for
  return void
end function
function lifecycleEntityWords(level,ent)
  check = level.context; word(check,ent.slot); entitySnapshot(level,ent)
  word(check,ent.spawnflags); textWord(check,ent.target); textWord(check,ent.targetname); textWord(check,ent.model); textWord(check,ent.model2)
  floatWords(check,[ent.speed,ent.wait,ent.random]); textWord(check,ent.message); textWord(check,ent.team); word(check,ent.damage)
  textWord(check,ent.targetShaderName); textWord(check,ent.targetShaderNewName); floatWords(check,ent.movedir); boolWord(check,ent.use != void)
  pointer(check,ent.activator); words(check,[ent.noise_index,ent.fly_sound_debounce_time]); pointer(check,ent.nextTrain)
  word(check,ent.moverState); pointer(check,ent.target_ent); words(check,[ent.splashDamage,ent.splashRadius,ent.methodOfDeath,ent.splashMethodOfDeath])
  pointer(check,ent.teammaster); pointer(check,ent.teamchain); words(check,[ent.waterlevel,ent.watertype,ent.pain_debounce_time]); boolWord(check,ent.r.bmodel)
  word(check,len(ent.r.clusters))
  for clusterIndex = 0 to 15
    cluster = 0; if clusterIndex < len(ent.r.clusters) then cluster = ent.r.clusters[clusterIndex] end if; word(check,cluster)
  end for
  words(check,[ent.r.lastCluster,ent.r.areanum,ent.r.areanum2,ent.r.sector])
  return void
end function
function lifecycleSnapshot(level)
  check = level.context; state = gameLifecycle.get(level); check.location = "level"
  word(check,900); snapshotSize = n.readI32(check.expected,check.offset); word(check,snapshotSize); snapshotStart = check.offset
  boolWord(check,state.entitiesBound); boolWord(check,state.clientsBound)
  words(check,[level.time,level.previousTime,level.startTime,level.num_entities,level.maxclients,level.framenum,level.logFile,level.sndFry])
  boolWord(check,level.newSession); boolWord(check,level.restarted)
  words(check,[level.warmupModificationCount,level.spawner.warmupTime]); boolWord(check,level.spawner.spawning)
  words(check,[len(level.spawner.vars),level.spawner.chars,level.bodyQueIndex]); boolWord(check,level.locationLinked); pointer(check,level.locationHead)
  words(check,[level.follow1,level.follow2,level.lastTeamLocationTime,level.numConnectedClients,level.numNonSpectatorClients,level.numPlayingClients,level.numVotingClients])
  words(check,level.numteamVotingClients); words(check,level.teamScores); words(check,level.sortedClients)
  for each body in level.bodyQue
    pointer(check,body)
  end for
  words(check,[level.intermissionQueued,level.intermissiontime]); boolWord(check,level.readyToExit); word(check,level.exitTime)
  floatWords(check,level.intermission_origin); floatWords(check,level.intermission_angle); textWord(check,level.changemap)
  textWord(check,level.voteString); textWord(check,level.voteDisplayString); words(check,[level.voteTime,level.voteExecuteTime,level.voteYes,level.voteNo])
  for teamIndex = 0 to 1
    textWord(check,level.teamVoteString[teamIndex]); words(check,[level.teamVoteTime[teamIndex],level.teamVoteYes[teamIndex],level.teamVoteNo[teamIndex]])
  end for
  for each spawnVar in level.spawner.vars
    textWord(check,spawnVar[0]); textWord(check,spawnVar[1])
  end for
  check.location = "module statics"
  word(check,n.floatBits(level.lastFlagCapture)); words(check,[level.lastCaptureTeam,level.redFlagStatus,level.blueFlagStatus,level.neutralFlagStatus,
    level.redTakenTime,level.blueTakenTime,level.redObeliskAttackedTime,level.blueObeliskAttackedTime])
  words(check,level.itemRegistered); word(check,len(level.shaderRemaps))
  for each remap in level.shaderRemaps
    textWord(check,remap[0]); textWord(check,remap[1]); word(check,n.floatBits(remap[2]))
  end for
  weapon = weaponState.get(level); word(check,n.floatBits(weapon.quadFactor)); floatWords(check,weapon.forward); floatWords(check,weapon.right)
  floatWords(check,weapon.up); floatWords(check,weapon.muzzle)
  arena = memory.get(level); word(check,arena.allocPoint)
  if arena.allocPoint > check.memoryWatermark then check.memoryWatermark = arena.allocPoint end if
  blobWord(check,slice(arena.pool,0,check.memoryWatermark))
  ipState = filters.get(level); word(check,ipState.count)
  for each filter in ipState.filters
    words(check,[filter.mask,filter.compare])
  end for
  blobWord(check,filters.banBytes(level)); word(check,len(level.gameCvars.rows))
  for each row in level.gameCvars.rows
    check.location = "VM Cvar "+row.name; word(check,row.modificationCount); boolWord(check,row.vm != void)
    if row.vm != void then
      words(check,[row.vm.handle,row.vm.modificationCount,n.floatBits(row.vm.value),row.vm.integer]); textWord(check,row.vm.string)
    end if
  end for
  registry = level.spawner.cvars; words(check,[registry.numIndexes,registry.modifiedFlags])
  for index = 0 to registry.numIndexes-1
    variable = registry.indexes[index]; check.location = "engine Cvar "+variable.name
    textWord(check,variable.name); textWord(check,variable.string); textWord(check,variable.resetString); textWord(check,variable.latchedString)
    word(check,variable.flags); boolWord(check,variable.modified); words(check,[variable.modificationCount,variable.integer,n.floatBits(variable.value)])
  end for
  for configIndex = 0 to 1023
    check.location = "config "+str(configIndex); textWord(check,level.spawner.configstrings[configIndex])
  end for
  for clientIndex = 0 to 63
    check.location = "client "+str(clientIndex); connectClientSnapshot(check,level.clients[clientIndex])
  end for
  limit = level.num_entities; if limit < 128 then limit = 128 end if; if limit > 1022 then limit = 1022 end if
  word(check,limit+2)
  for entIndex = 0 to limit-1
    lifecycleEntityWords(level,level.entities[entIndex])
  end for
  lifecycleEntityWords(level,level.entities[1022]); lifecycleEntityWords(level,level.entities[1023])
  mapObjectExtraState(level)
  if check.offset-snapshotStart != snapshotSize then return error(499,"Invalid native lifecycle snapshot length") end if
  return void
end function
function lifecycleEffect(level,kind,a,b,key,value)
  check = level.context; lifecycleSnapshot(level); check.location = "effect "+str(kind)
  words(check,[901,kind,a,b]); textWord(check,key); blobWord(check,value); check.effects = check.effects+1; mapObjectMutation(level,kind,a); return void
end function
function lifecycleTextEffect(level,kind,a,b,key,value)
  return lifecycleEffect(level,kind,a,b,key,bytes(value))
end function
function lifecyclePrintHook(level,text)
  return lifecycleTextEffect(level,1,0,0,"",text)
end function
function lifecycleCvarHook(cvarState,kind,index,key,value)
  level = cvarState.level
  if kind == 1 then return lifecycleTextEffect(level,2,index,cvarState.rows[index].flags,key,value) end if
  if kind == 2 then return lifecycleTextEffect(level,3,index,0,"","") end if
  if kind == 3 then return lifecycleTextEffect(level,4,-1,0,key,value) end if
  return error(499,"Unexpected lifecycle Cvar boundary")
end function
function lifecycleSpawnHook(spawner,kind,index,key,value)
  level = spawner.level
  if kind == 1 then
    if index == 23 and spawner.gametype == 4 and level.redFlagStatus == 0 and level.blueFlagStatus == -1 then
      level.context.normalizations = level.context.normalizations+1
    end if
    return lifecycleTextEffect(level,5,index,0,"",value)
  end if
  if kind == 2 then return lifecycleTextEffect(level,4,0,0,key,value) end if
  return error(499,"Unexpected lifecycle spawn boundary")
end function
function lifecycleEntityHook(level,kind,ent)
  if kind == 3 then return void end if
  if kind == 1 then return lifecycleTextEffect(level,7,ent.slot,0,"","") end if
  if kind == 2 then return lifecycleTextEffect(level,8,ent.slot,0,"","") end if
  return error(499,"Unexpected lifecycle entity boundary")
end function
function lifecycleUnportedHook(spawner,ent,kind,index)
  return lifecycleTextEffect(spawner.level,18,ent.slot,index,ent.classname,"")
end function
function lifecycleLocateHook(level,count)
  return lifecycleTextEffect(level,6,count,0,"","")
end function
function lifecycleOpenHook(level,name,mode)
  lifecycleTextEffect(level,9,mode,level.context.openHandle,name,""); return level.context.openHandle
end function
function lifecycleInfoHook(level,capacity)
  lifecycleTextEffect(level,10,capacity,0,"",level.context.serverInfo); return level.context.serverInfo
end function
function lifecycleWriteHook(level,data,handle)
  return lifecycleEffect(level,11,handle,len(data),"",data)
end function
function lifecycleCloseHook(level,handle)
  return lifecycleTextEffect(level,12,handle,0,"","")
end function
function lifecycleBotSetupHook(level,restart)
  return lifecycleTextEffect(level,13,restart,0,"","")
end function
function lifecycleBotLoadHook(level,restart)
  return lifecycleTextEffect(level,14,restart,0,"","")
end function
function lifecycleInitBotsHook(level,restart)
  return lifecycleTextEffect(level,15,restart,0,"","")
end function
function lifecycleBotShutdownHook(level,restart)
  return lifecycleTextEffect(level,16,restart,0,"","")
end function
function lifecycleQueryHook(level,name,value)
  return lifecycleTextEffect(level,17,value,0,name,"")
end function
function lifecycleServerCommandHook(level,client,message)
  return lifecycleTextEffect(level,20,client,0,"",message)
end function
function mapObjectMinimumPlayers(level)
  return void
end function
function lifecycleFixture(world,check,buildDate)
  level = game.create(world); spawn.create(level,""); level.context = check; state = gameLifecycle.attach(level,buildDate)
  state.cvarEffectFn = lifecycleCvarHook; state.spawnEffectFn = lifecycleSpawnHook; state.entityObserveFn = lifecycleEntityHook
  state.openLogFn = lifecycleOpenHook; state.serverInfoFn = lifecycleInfoHook; state.locateFn = lifecycleLocateHook
  state.closeLogFn = lifecycleCloseHook; state.botSetupFn = lifecycleBotSetupHook; state.botLoadMapFn = lifecycleBotLoadHook
  state.initBotsFn = lifecycleInitBotsHook; state.botShutdownFn = lifecycleBotShutdownHook; state.integerQueryFn = lifecycleQueryHook
  state.botClients.minimumPlayersFn = mapObjectMinimumPlayers
  level.spawner.unportedFn = lifecycleUnportedHook; level.gamePrintFn = lifecyclePrintHook; level.logWriteFn = lifecycleWriteHook
  level.serverCommandFn = lifecycleServerCommandHook; level.teamMessageFn = mapObjectPrintMsg; return level
end function
function lifecyclePoison(level)
  state = gameLifecycle.get(level); state.entitiesBound = true; state.clientsBound = true
  level.time = 123456; level.previousTime = -7; level.startTime = 17; level.num_entities = 99; level.maxclients = 2
  level.framenum = 42; level.logFile = 17; level.sndFry = 777; level.newSession = true; level.restarted = true
  level.warmupModificationCount = 9; level.spawner.warmupTime = -1; level.spawner.spawning = true
  level.spawner.vars = [["poison","old"]]; level.spawner.chars = 11; level.bodyQueIndex = 3; level.bodyQue[0] = level.entities[88]
  level.locationLinked = true; level.locationHead = level.entities[99]; level.follow1 = 13; level.follow2 = -2
  level.lastTeamLocationTime = 77; level.teamScores[1] = 123; level.sortedClients[0] = 9
  level.intermissionQueued = 77; level.intermissiontime = 88; level.readyToExit = true; level.exitTime = 99
  level.intermission_origin = [1.0,2.0,3.0]; level.intermission_angle = [4.0,5.0,6.0]; level.changemap = "oldmap"
  level.voteString = "old vote"; level.voteDisplayString = "shown"; level.voteTime = 100; level.voteYes = 2
  level.teamVoteString[1] = "old team vote"; level.teamVoteNo[1] = 3
  ent = level.entities[0]; ent.health = 91; ent.client = level.clients[0]; ent.inuse = true; ent.s.eType = 1
  ent = level.entities[127]; ent.classname = "poisoned"; ent.target = "target"; ent.targetname = "named"; ent.model = "oldmodel"
  ent.team = "oldteam"; ent.health = 77; ent.s.number = 127; ent.s.pos.trBase = [7.0,8.0,9.0]; ent.teammaster = level.entities[0]
  level.entities[1022].classname = "oldworld"; level.entities[1022].s.number = 1022; level.entities[1023].classname = "oldend"
  client = level.clients[0]; client.ps.stats[0] = 49; client.team = 1; client.connected = 2; client.netname = "Before init"
  client.spectatorTime = 345; client.hook = level.entities[80]
  level.itemRegistered[200] = 17; level.redFlagStatus = 1; level.blueFlagStatus = 2; level.redTakenTime = 45; level.lastFlagCapture = 1.25
  targets.addRemap(level,"old","new",1.5); weapon = weaponState.get(level); weapon.quadFactor = 2.5
  weapon.forward = [1.0,2.0,3.0]; weapon.muzzle = [4.0,5.0,6.0]
  allocation = memory.allocate(level,128)
  for index = 0 to 127
    allocation.state.pool[allocation.offset+index] = 97
  end for
  ipState = filters.get(level); ipState.count = 1; ipState.filters[0].mask = 16777215; ipState.filters[0].compare = 197121
  return void
end function
function lifecycleAction(level,kind,a,b,c,first,second)
  switch kind
    case 1
      gameLifecycle.init(level,a,b,c,first)
    end case
    case 2
      gameLifecycle.shutdown(level,a)
    end case
    case 3
      cv.set2(level.spawner.cvars,first,second,a != 0)
    end case
    case 4
      level.context.openHandle = a; level.context.serverInfo = first
    end case
    case 5
      lifecyclePoison(level)
    end case
    case 6
      words(level.context,[902,game.random(level)])
    end case
    case 7
      client = level.clients[a]; parts = strings.split(first,",")
      if len(parts) != 6 then return error(499,"Invalid lifecycle session fixture") end if
      client.connected = b; client.team = c; client.spectatorTime = textnum.atoi(parts[0]); client.spectatorState = textnum.atoi(parts[1])
      client.spectatorClient = textnum.atoi(parts[2]); client.wins = textnum.atoi(parts[3]); client.losses = textnum.atoi(parts[4]); client.teamLeader = textnum.atoi(parts[5])
    end case
    case 8
      allocation = memory.allocate(level,a)
      if a > 0 then
        for index = 0 to a-1
          allocation.state.pool[allocation.offset+index] = b & 255
        end for
      end if
    end case
    case 9
      level.spawner.configstrings[a] = first
    end case
    case 10
      gameCvars.update(level)
    end case
    case 11
      level.time = a
    end case
    case 12
      memory.status(level)
    end case
    case 13
      lifecycleBodies.initQueue(level)
    end case
    case 14
      spawnResult = spawn.callSpawn(level.spawner,level.entities[a]); word(level.context,904); boolWord(level.context,spawnResult)
    end case
    case default
      return mapObjectAction(level,kind,a,b,c,first,second)
    end case
  end switch
  return void
end function
function mapObjectEntityScalar(ent,field,value,level)
  switch field
    case 1
      ent.spawnflags = value
    end case
    case 2
      ent.count = value
    end case
    case 3
      ent.health = value
    end case
    case 4
      ent.s.number = value
    end case
    case 5
      ent.s.frame = value
    end case
    case 6
      ent.s.clientNum = value
    end case
    case 7
      ent.s.powerups = value
    end case
    case 8
      ent.s.eType = value
    end case
    case 9
      ent.r.svFlags = value
    end case
    case 10
      ent.r.ownerNum = value
    end case
    case 11
      ent.inuse = value != 0
    end case
    case 14
      ent.s.modelindex = value
    end case
    case 15
      ent.nextthink = value
    end case
    case 16
      ent.flags = value
    end case
    case 17
      ent.wait = n.bitsFloat(value)
    end case
    case 18
      ent.random = n.bitsFloat(value)
    end case
    case 19
      ent.speed = n.bitsFloat(value)
    end case
    case 20
      ent.neverFree = value != 0
    end case
    case 21
      ent.freeAfterEvent = value != 0
    end case
    case 22
      ent.unlinkAfterEvent = value != 0
    end case
    case 23
      ent.r.contents = value
    end case
    case 24
      ent.s.eFlags = value
    end case
    case 25
      ent.r.singleClient = value
    end case
    case 26
      ent.eventTime = value
    end case
    case 27
      ent.s.event = value
    end case
    case 28
      ent.s.eventParm = value
    end case
    case 29
      ent.physicsObject = value != 0
    end case
    case 30
      ent.takedamage = value != 0
    end case
    case 31
      ent.s.groundEntityNum = value
    end case
    case 32
      ent.s.pos.trType = value
    end case
    case 33
      ent.s.pos.trTime = value
    end case
    case 34
      ent.s.pos.trDuration = value
    end case
    case 35
      ent.clipmask = value
    end case
    case 12
      ent.client = void; if value >= 0 then ent.client = level.clients[value] end if
    end case
    case 13
      ent.item = void; if value >= 0 then ent.item = value end if
    end case
    case default
      return error(499,"Invalid map scalar fixture")
    end case
  end switch
  return void
end function
function mapObjectCText(value)
  data = bytes(value); count = 0
  while count < len(data) and data[count] != 0
    count = count+1
  end while
  return decode(slice(data,0,count))
end function
function mapObjectPrintMsg(level,recipient,value)
  value = mapObjectCText(value)
  if len(bytes(value)) >= 1024 then return error(499,"PrintMsg fixture overflow") end if
  value = strings.replaceAll(value,"\"","'")
  return level.serverCommandFn(level,recipient,"print \""+value+"\"")
end function
function mapObjectCallbackWords(check,ent)
  think = 99
  if ent.think is void then think = 0
  else if ent.think == portals.locateCamera then think = 1
  else if ent.think == mapItems.respawn then think = 2
  else if ent.think == mapItems.finishSpawning then think = 3 end if
  use = 99
  if ent.use is void then use = 0
  else if ent.use == mapTargets.giveUse then use = 1
  else if ent.use == mapTargets.removePowerupsUse then use = 2
  else if ent.use == mapTargets.scoreUse then use = 3
  else if ent.use == mapTargets.printUse then use = 4 end if
  touch = 99; if ent.touch is void then touch = 0 else if ent.touch == mapItems.touch then touch = 1 end if
  words(check,[think,use,touch]); return void
end function
function mapObjectExtraState(level)
  check = level.context; check.location = "map callback and mutation state"
  words(check,[950,check.mutationKind,check.mutationArg,check.mutationRemaining]); words(check,check.mutationAction); textWord(check,check.mutationText)
  limit = level.num_entities; if limit < 128 then limit = 128 end if; if limit > 1022 then limit = 1022 end if
  word(check,limit+2)
  for index = 0 to limit-1
    mapObjectCallbackWords(check,level.entities[index])
  end for
  mapObjectCallbackWords(check,level.entities[1022]); mapObjectCallbackWords(check,level.entities[1023]); return void
end function
function mapObjectMutation(level,kind,arg)
  check = level.context
  if check.mutationRemaining <= 0 or kind != check.mutationKind then return void end if
  if check.mutationArg != -999 and arg != check.mutationArg then return void end if
  check.mutationRemaining = check.mutationRemaining-1
  if check.mutationRemaining == 0 then
    action = check.mutationAction; mapObjectAction(level,action[0],action[1],action[2],action[3],check.mutationText,"")
  end if
  return void
end function
function mapObjectVector(ent,field,value)
  vector = void
  switch field
    case 1
      vector = ent.s.origin
    end case
    case 2
      vector = ent.r.currentOrigin
    end case
    case 3
      vector = ent.client.ps.origin
    end case
    case 4
      vector = ent.s.angles
    end case
    case 5
      vector = ent.r.mins
    end case
    case 6
      vector = ent.r.maxs
    end case
    case 7
      vector = ent.s.origin2
    end case
    case 8
      vector = ent.s.pos.trBase
    end case
    case 9
      vector = ent.movedir
    end case
    case 10
      vector = ent.client.ps.viewangles
    end case
  end switch
  parts = strings.split(value,",")
  for axis = 0 to 2
    vector[axis] = n.bitsFloat(textnum.atoi(parts[axis]))
  end for
  return void
end function
function mapObjectText(ent,field,value)
  switch field
    case 1
      ent.target = value
    end case
    case 2
      ent.targetname = value
    end case
    case 3
      ent.message = value
    end case
    case 4
      ent.classname = value
    end case
    case 5
      ent.team = value
    end case
    case 6
      ent.targetShaderName = value
    end case
    case 7
      ent.targetShaderNewName = value
    end case
  end switch
  return void
end function
function mapObjectClientScalar(client,field,value,text)
  switch field
    case 1
      client.connected = value
    end case
    case 2
      client.team = value
    end case
    case 3
      client.ps.persistant[3] = value
    end case
    case 4
      client.ps.persistant[0] = value
    end case
    case 5
      client.ps.stats[0] = value
    end case
    case 6
      client.ps.stats[6] = value
    end case
    case 7
      client.predictItemPickup = value != 0
    end case
    case 8
      client.ps.stats[3] = value
    end case
    case 9
      client.spectatorState = value
    end case
    case 10
      client.spectatorClient = value
    end case
    case 11
      client.ps.pm_type = value
    end case
    case 12
      client.ps.stats[2] = value
    end case
    case 13
      data = bytes(mapObjectCText(text)); if len(data)>31 then data = slice(data,0,31) end if; client.netname = decode(data)
    end case
  end switch
  return void
end function
function mapObjectAction(level,kind,a,b,c,first,second)
  switch kind
    case 20
      other = void; if b >= 0 then other = level.entities[b] end if
      ent = level.entities[a]; ent.use(level,ent,other,level.entities[c])
    end case
    case 21
      mapObjectEntityScalar(level.entities[a],b,c,level)
    end case
    case 22
      mapObjectVector(level.entities[a],b,first)
    end case
    case 23
      value = void; if c == 0 then value = mapObjectCText(first) end if; mapObjectText(level.entities[a],b,value)
    end case
    case 24
      mapObjectClientScalar(level.clients[a],b,c,first)
    end case
    case 25
      level.clients[a].ps.powerups[b] = c
    end case
    case 26
      level.clients[a].ps.ammo[b] = c
    end case
    case 27
      if a == 1 then level.spawner.warmupTime = b
      else if a == 2 then gameLifecycle.vm(level,"g_gametype").integer = b; level.spawner.gametype = b
      else if a == 3 then level.maxclients = b
      else if a == 4 then level.num_entities = b end if
    end case
    case 28
      if b != 0 then game.link(level,level.entities[a]) else game.unlink(level,level.entities[a]) end if
    end case
    case 29
      level.spawner.parser = mapParser.create(first); level.spawner.spawning = true
      if not spawn.parseVars(level.spawner) then return error(499,"Invalid map vars fixture") end if
    end case
    case 30
      check = level.context; check.mutationKind = a; check.mutationArg = b; check.mutationRemaining = c
      check.mutationText = mapObjectCText(second); parts = strings.split(first,",")
      for index = 0 to 3
        check.mutationAction[index] = textnum.atoi(parts[index])
      end for
    end case
    case 31
      ent = level.entities[a]
      switch b
        case 1
          mapTargets.giveSpawn(level,ent)
        end case
        case 2
          mapTargets.removePowerupsSpawn(level,ent)
        end case
        case 3
          mapTargets.scoreSpawn(level,ent)
        end case
        case 4
          mapTargets.printSpawn(level,ent)
        end case
        case 5
          portals.surface(level,ent)
        end case
        case 6
          portals.camera(level,ent)
        end case
        case 7
          portals.locateCamera(level,ent)
        end case
        case 8
          game.runThink(level,ent)
        end case
        case 9
          game.free(level,ent)
        end case
        case 10
          mapItems.finishSpawning(level,ent)
        end case
      end switch
    end case
    case 32
      mapItems.setFlagStatus(level,a,b)
    end case
    case 33
      level.randSeed = a
    end case
    case 34
      activator = void; if b >= 0 then activator = level.entities[b] end if; targets.useTargets(level,level.entities[a],activator)
    end case
    case 35
      level.previousTime = level.time; level.time = b; movers.run(level,level.entities[a])
    end case
    case 36
      ent = level.entities[a]
      ent.touch(level,ent,level.entities[b],void)
    end case
    case 37
      frame.run(level,a)
    end case
    case default
      return error(499,"Invalid map action")
    end case
  end switch
  return void
end function

function mapObjectContracts(world)
  total = mapContracts.run(world); print "PASS: "+str(total)+" map-object runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3] == "--contracts" then return mapObjectContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0)
  check = Check(fs.readAllBytes(args[2]),0,0,0,"initial",256,7,"\\mapname\\asset-free\\sv_hostname\\MiniQuake3",0,0,0,0,[0,0,0,0],"")
  level = lifecycleFixture(world,check,readString(reader)); count = readInt(reader)
  if count > 0 then
    for actionIndex = 1 to count
      kind = readInt(reader); a = readInt(reader); b = readInt(reader); c = readInt(reader); first = readString(reader); second = readString(reader)
      lifecycleAction(level,kind,a,b,c,first,second); lifecycleSnapshot(level)
    end for
  end if
  words(check,[902,game.random(level),903,check.normalizations])
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete lifecycle stream") end if
  print "PASS: "+str(count)+" map-object actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
