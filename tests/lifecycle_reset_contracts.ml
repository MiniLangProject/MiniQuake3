// SPDX-License-Identifier: GPL-2.0-or-later
// Focused lifecycle storage/host contracts. Full Init/Shutdown ordering is
// compared separately with the unchanged native game functions.
package lifecycle_reset_contracts
import mq3.game.lifecycle as lifecycle
import mq3.game.entities as resetGame
import mq3.game.entitystate as resetEntityState
import mq3.game.playerstate as resetPlayerState
import mq3.game.spawn as resetSpawn
import mq3.game.cvars as resetCvars
import mq3.game.memory as resetMemory
import mq3.game.weapon_state as resetWeapons
import mq3.game.ip_filters as resetIp
import mq3.game.server_commands as resetServer
import mq3.qcommon.cvar as resetCv
import mq3.compat.numeric as resetNumeric

struct LifecycleResetContext
  events
end struct
function lifecycleResetRequire(condition,label)
  if not condition then return error(499,"Lifecycle reset contract: "+label) end if
  return 1
end function
function lifecycleResetSequence(actual,expected)
  if len(actual) != len(expected) then return false end if
  for index = 0 to len(actual)-1
    if actual[index] != expected[index] then return false end if
  end for
  return true
end function
function lifecycleResetZero(actual,size)
  if len(actual) != size then return false end if
  for each value in actual
    if (typeof(value) != "int" and typeof(value) != "float") or value != 0 then return false end if
  end for
  return true
end function
function lifecycleResetNullSlots(actual,size)
  if len(actual) != size then return false end if
  for each value in actual
    if not (value is void) then return false end if
  end for
  return true
end function
function lifecycleResetPrint(level,text)
  level.context.events = level.context.events+[text]; return void
end function
function lifecycleResetSpawnEffect(state,kind,index,key,value)
  state.level.context.events = state.level.context.events+["spawn",kind,index,key,value]; return void
end function
function lifecycleResetCvarEffect(state,kind,index,key,value)
  state.level.context.events = state.level.context.events+["cvar",kind,index,key,value]; return void
end function
function lifecycleResetEntityObserve(level,kind,ent)
  level.context.events = level.context.events+["entity",kind,ent.slot,level.num_entities,ent.inuse]; return void
end function
function lifecycleResetLocate(level,count)
  level.context.events = level.context.events+["locate",count,level.entities[64].inuse]; return void
end function
function lifecycleResetQuery(level,name,value)
  level.context.events = level.context.events+["query",name,value]
  resetCv.set2(level.spawner.cvars,name,"19",true); return void
end function
function lifecycleResetHost(level)
  return void
end function
function lifecycleResetNativeFields(level)
  count = 0; state = lifecycle.get(level); heldEntities = level.entities; heldClients = level.clients
  heldScene = level.scene; heldSpawner = level.spawner; heldParser = level.spawner.parser
  heldRegistry = level.spawner.cvars; heldConfigstrings = level.spawner.configstrings; heldContext = level.context
  heldGameCvars = level.gameCvars; heldRows = heldGameCvars.rows; heldMaintenance = level.cvarMaintenance
  resetCvars.register(level)
  warmupVm = lifecycle.vm(level,"g_warmup"); warmupVm.modificationCount = 37; warmupVm.integer = 27
  for each row in heldRows
    if row.vmName == "g_warmup" then resetCvars.syncValue(level,row) end if
  end for
  heldMaintenance.password = "retained"; heldMaintenance.passwordModificationCount = 41; heldMaintenance.lastPasswordModificationCount = 40
  level.spawner.configstrings[29] = "host-owned configstring"
  level.spawner.context = heldContext; level.spawner.unportedFn = lifecycleResetHost
  level.spawner.gametype = 4; level.spawner.motd = "retained motd"; level.spawner.restarted = 3
  level.spawner.doWarmup = 2; level.spawner.gravity = 913.0
  level.randSeed = 123; level.shaderRemaps = [["from","to",1.5]]; heldRemaps = level.shaderRemaps
  level.itemRegistered[7] = 1; heldItems = level.itemRegistered; level.deathAnimIndex = 2
  weapon = resetWeapons.get(level); weapon.quadFactor = 3.5; weapon.forward[0] = 9.0; heldForward = weapon.forward
  arena = resetMemory.get(level); block = resetMemory.allocate(level,3); resetMemory.writeByte(block,1,173); arena.pool[31] = 229
  ip = resetIp.get(level); ip.count = 1; ip.filters[0].mask = 255; ip.filters[0].compare = 127; ip.banBuffer[9] = 85
  server = resetServer.get(level); server.botListFn = lifecycleResetHost
  level.redFlagStatus = 2; level.blueFlagStatus = 1; level.neutralFlagStatus = 4; level.redTakenTime = 300; level.blueTakenTime = 400
  level.lastFlagCapture = 12.5; level.lastCaptureTeam = 2; level.redObeliskAttackedTime = 500; level.blueObeliskAttackedTime = 600
  level.knockback = 123.5; level.friendlyFire = 7; level.blood = 8; level.maxclientsCvar = 9
  level.timelimit = 10; level.fraglimit = 11; level.capturelimit = 12; level.weaponRespawn = 13; level.weaponTeamRespawn = 14
  level.inactivity = 15; level.smoothClients = true; level.gravity = 913.0; level.playerSpeed = 321.0; level.dmflags = 16
  level.pmoveFixed = true; level.pmoveMsec = 17; level.synchronousClients = true; level.forceRespawn = 18
  level.listEntity = 19; level.allowVote = 20; level.teamAutoJoin = 21; level.maxGameClients = 22; level.teamForceBalance = 23
  level.cheats = 24; level.dedicated = 25; level.quadfactor = 4.5
  level.damageFn = lifecycleResetHost; level.doorTouch = lifecycleResetHost; level.logWriteFn = lifecycleResetHost
  level.userinfoFn = lifecycleResetHost; level.userinfoSetFn = lifecycleResetHost; level.fireWeaponFn = lifecycleResetHost
  state.openLogFn = lifecycleResetHost; state.closeLogFn = lifecycleResetHost; state.locateFn = lifecycleResetLocate
  state.entitiesBound = true; state.clientsBound = true
  level.num_entities = 84; level.time = 1000; level.startTime = 900; level.previousTime = 980; level.maxclients = 4
  level.framenum = 30; level.restarted = true; level.logFile = 3; level.teamScores = [1,2,3,4]; level.lastTeamLocationTime = 800
  level.newSession = true; level.numConnectedClients = 4; level.numNonSpectatorClients = 3; level.numPlayingClients = 2
  level.sortedClients = array(64,63); level.follow1 = 2; level.follow2 = 3; level.sndFry = 12; level.warmupModificationCount = 37
  level.voteString = "map q3dm1"; level.voteDisplayString = "change map"; level.voteTime = 600; level.voteExecuteTime = 700
  level.voteYes = 2; level.voteNo = 1; level.numVotingClients = 3; level.teamVoteString = ["red","blue"]
  level.teamVoteTime = [1,2]; level.teamVoteYes = [3,4]; level.teamVoteNo = [5,6]; level.numteamVotingClients = [7,8]
  level.intermissionQueued = 1; level.intermissiontime = 2; level.changemap = "q3dm2"; level.readyToExit = true; level.exitTime = 3
  level.intermission_origin = [1.0,2.0,3.0]; level.intermission_angle = [4.0,5.0,6.0]
  level.locationLinked = true; level.locationHead = level.entities[79]; level.bodyQueIndex = 5; level.bodyQue = array(8,level.entities[74])
  level.spawner.vars = [["classname","worldspawn"]]; level.spawner.chars = 23; level.spawner.spawning = true; level.spawner.warmupTime = -1
  level.entities[74].health = 109; level.clients[63].wins = 11
  lifecycle.clearLevel(level)
  count = count+lifecycleResetRequire(lifecycleResetZero([level.num_entities,level.time,level.startTime,level.previousTime,level.maxclients,level.framenum,level.logFile,
    level.lastTeamLocationTime,level.numConnectedClients,level.numNonSpectatorClients,level.numPlayingClients,level.follow1,level.follow2,level.sndFry,level.warmupModificationCount],15),"native timing/count fields become zero")
  count = count+lifecycleResetRequire(not level.restarted and not level.newSession and not level.readyToExit and not level.locationLinked,"native boolean fields become false")
  count = count+lifecycleResetRequire(lifecycleResetZero(level.teamScores,4) and lifecycleResetZero(level.sortedClients,64),"fixed native score/client arrays become zero")
  count = count+lifecycleResetRequire(level.voteString == "" and level.voteDisplayString == "" and lifecycleResetSequence(level.teamVoteString,["",""]),"inline native vote buffers become empty")
  count = count+lifecycleResetRequire(lifecycleResetZero([level.voteTime,level.voteExecuteTime,level.voteYes,level.voteNo,level.numVotingClients],5) and
    lifecycleResetZero(level.teamVoteTime,2) and lifecycleResetZero(level.teamVoteYes,2) and lifecycleResetZero(level.teamVoteNo,2) and lifecycleResetZero(level.numteamVotingClients,2),"all native vote counters become zero")
  count = count+lifecycleResetRequire(lifecycleResetZero([level.intermissionQueued,level.intermissiontime,level.exitTime,level.bodyQueIndex],4) and
    level.changemap is void and level.locationHead is void,"intermission/body/location scalars and pointers become zero")
  count = count+lifecycleResetRequire(lifecycleResetZero(level.intermission_origin,3) and lifecycleResetZero(level.intermission_angle,3) and
    resetNumeric.floatBits(level.intermission_origin[0]) == 0 and resetNumeric.floatBits(level.intermission_angle[2]) == 0,"intermission vectors contain positive float zero")
  count = count+lifecycleResetRequire(lifecycleResetNullSlots(level.bodyQue,8),"body queue has all eight NULL entries")
  count = count+lifecycleResetRequire(len(level.spawner.vars) == 0 and level.spawner.chars == 0 and not level.spawner.spawning and level.spawner.warmupTime == 0,"native spawn fields stored outside Level become zero")
  count = count+lifecycleResetRequire(not state.entitiesBound and not state.clientsBound and level.entities == heldEntities and level.clients == heldClients,
    "native pointer reset is distinct from retained backing arrays")
  count = count+lifecycleResetRequire(level.entities[74].health == 109 and level.clients[63].wins == 11,"level memset does not prematurely reset entities or clients")
  count = count+lifecycleResetRequire(level.scene == heldScene and level.spawner == heldSpawner and level.spawner.parser == heldParser and level.spawner.cvars == heldRegistry and
    level.spawner.configstrings == heldConfigstrings and heldConfigstrings[29] == "host-owned configstring" and level.context == heldContext,"engine world/token/configstring/registry storage survives")
  count = count+lifecycleResetRequire(level.spawner.context == heldContext and level.spawner.unportedFn == lifecycleResetHost and level.spawner.gametype == 4 and
    level.spawner.motd == "retained motd" and level.spawner.restarted == 3 and level.spawner.doWarmup == 2 and level.spawner.gravity == 913.0,"spawner host and VM mirrors survive")
  count = count+lifecycleResetRequire(level.gameCvars == heldGameCvars and heldGameCvars.rows == heldRows and heldGameCvars.registered and
    lifecycle.vm(level,"g_warmup") == warmupVm and warmupVm.modificationCount == 37 and level.warmup == 27 and level.warmupCvarModificationCount == 37,
    "Register-before-memset preserves VM warmup counter while clearing level warmup counter")
  count = count+lifecycleResetRequire(level.cvarMaintenance == heldMaintenance and heldGameCvars.passwordState == heldMaintenance and heldMaintenance.password == "retained" and
    heldMaintenance.passwordModificationCount == 41 and heldMaintenance.lastPasswordModificationCount == 40,"CheckCvars module-static observation survives")
  count = count+lifecycleResetRequire(lifecycleResetSequence([level.knockback,level.friendlyFire,level.blood,level.maxclientsCvar,level.timelimit,level.fraglimit,level.capturelimit,
    level.weaponRespawn,level.weaponTeamRespawn,level.inactivity,level.gravity,level.playerSpeed,level.dmflags,level.pmoveMsec,level.forceRespawn,level.listEntity,level.allowVote,
    level.teamAutoJoin,level.maxGameClients,level.teamForceBalance,level.cheats,level.dedicated,level.quadfactor],
    [123.5,7,8,9,10,11,12,13,14,15,913.0,321.0,16,17,18,19,20,21,22,23,24,25,4.5]) and level.smoothClients and level.pmoveFixed and level.synchronousClients,"all remaining Level VM Cvar mirrors survive")
  count = count+lifecycleResetRequire(level.randSeed == 123 and level.shaderRemaps == heldRemaps and heldRemaps[0][1] == "to" and level.itemRegistered == heldItems and
    heldItems[7] == 1 and level.deathAnimIndex == 2,"RNG, shader/item registrations and death animation static survive")
  count = count+lifecycleResetRequire(resetWeapons.get(level) == weapon and weapon.forward == heldForward and heldForward[0] == 9.0 and weapon.quadFactor == 3.5,
    "weapon static object and live vector aliases survive")
  count = count+lifecycleResetRequire(resetMemory.get(level) == arena and arena.allocPoint == 32 and resetMemory.readByte(block,1) == 173 and arena.pool[31] == 229,
    "arena cursor, existing block alias and padding survive level memset")
  resetMemory.init(level)
  count = count+lifecycleResetRequire(arena.allocPoint == 0 and resetMemory.readByte(block,1) == 173 and arena.pool[31] == 229,"separate G_InitMemory only rewinds retained arena")
  count = count+lifecycleResetRequire(resetIp.get(level) == ip and ip.count == 1 and ip.filters[0].mask == 255 and ip.filters[0].compare == 127 and ip.banBuffer[9] == 85,
    "IP table and mutable ban buffer survive")
  count = count+lifecycleResetRequire(lifecycleResetSequence([level.redFlagStatus,level.blueFlagStatus,level.neutralFlagStatus,level.redTakenTime,level.blueTakenTime,
    level.lastFlagCapture,level.lastCaptureTeam,level.redObeliskAttackedTime,level.blueObeliskAttackedTime],[2,1,4,300,400,12.5,2,500,600]),"teamgame static is separate from level memset")
  count = count+lifecycleResetRequire(resetServer.get(level) == server and server.botListFn == lifecycleResetHost and level.damageFn == lifecycleResetHost and
    level.doorTouch == lifecycleResetHost and level.logWriteFn == lifecycleResetHost and level.userinfoFn == lifecycleResetHost and level.userinfoSetFn == lifecycleResetHost and
    level.fireWeaponFn == lifecycleResetHost and state.openLogFn == lifecycleResetHost and state.closeLogFn == lifecycleResetHost and state.locateFn == lifecycleResetLocate,
    "host overrides and lifecycle services survive")
  return count
end function
function lifecycleResetArrays(level)
  count = 0; heldEntities = level.entities; heldClients = level.clients; sectors = level.scene.sectors
  ent = level.entities[64]; r = ent.r; heldState = ent.s; client = level.clients[63]; heldPs = client.ps
  resetGame.initEntity(ent); ent.client = client; ent.health = 43; ent.targetname = "old"; ent.teamchain = level.entities[65]
  ent.item = 7; ent.touch = lifecycleResetHost; ent.movedir = [1.0,2.0,3.0]; ent.waterlevel = 3; ent.physicsBounce = 0.75
  ent.s.pos.trBase = [4.0,5.0,6.0]; ent.s.event = 92
  r.number = 64; r.modelindex = 2; r.solid = 3; r.origin = [1.0,2.0,3.0]; r.angles = [4.0,5.0,6.0]
  r.linked = true; r.linkcount = 9; r.svFlags = 15; r.bmodel = true; r.mins = [-1.0,-2.0,-3.0]; r.maxs = [1.0,2.0,3.0]
  r.contents = 7; r.absmin = [-4.0,-5.0,-6.0]; r.absmax = [4.0,5.0,6.0]; r.currentOrigin = [7.0,8.0,9.0]
  r.currentAngles = [10.0,11.0,12.0]; r.ownerNum = 1023; r.singleClient = 13
  r.sector = 3; r.nextEntity = 4; r.clusters = [7,8]; heldClusters = r.clusters; r.lastCluster = 9; r.areanum = 10; r.areanum2 = 11
  sectors[0].head = 64
  for each index in [0,63,1022,1023]
    level.entities[index].inuse = true; level.entities[index].health = 101; level.entities[index].r.ownerNum = 1023; level.entities[index].s.number = index
  end for
  client.connected = 2; client.netname = "old player"; client.wins = 10; client.team = 2; client.hook = ent
  client.cmdAngles = [1,2,3]; client.damage_from = [1.0,2.0,3.0]; client.oldOrigin = [4.0,5.0,6.0]; client.noclip = true
  client.fireHeld = true; client.inactivityWarning = true; client.timeResidual = 73; client.ps.stats[0] = 101; client.ps.clientNum = 63
  level.clients[0].losses = 19; level.clients[0].ps.persistant[0] = 20
  level.context.events = []; lifecycle.clearEntities(level)
  count = count+lifecycleResetRequire(level.entities == heldEntities and level.entities[64] == ent and ent.r == r and level.scene.entities[64] == r,
    "entity-array reset keeps entity and shared-r identity")
  count = count+lifecycleResetRequire(ent.slot == 64 and ent.s != heldState and lifecycleResetZero(resetEntityState.words(ent.s),52),"entity metadata slot survives while all network words reset")
  count = count+lifecycleResetRequire(ent.client is void and not ent.inuse and ent.classname is void and ent.health == 0 and ent.targetname is void and ent.teamchain is void and
    ent.item is void and ent.touch is void and lifecycleResetZero(ent.movedir,3) and ent.waterlevel == 0 and ent.physicsBounce == 0.0,"private entity state becomes zero without G_InitGentity defaults")
  count = count+lifecycleResetRequire(lifecycleResetZero([r.number,r.modelindex,r.solid,r.linkcount,r.svFlags,r.contents,r.ownerNum,r.singleClient],8) and not r.linked and not r.bmodel and
    lifecycleResetZero(r.origin,3) and lifecycleResetZero(r.angles,3) and lifecycleResetZero(r.mins,3) and lifecycleResetZero(r.maxs,3) and lifecycleResetZero(r.absmin,3) and
    lifecycleResetZero(r.absmax,3) and lifecycleResetZero(r.currentOrigin,3) and lifecycleResetZero(r.currentAngles,3),"all modeled shared-r bytes become zero")
  count = count+lifecycleResetRequire(r.sector == 3 and r.nextEntity == 4 and r.clusters == heldClusters and lifecycleResetSequence(r.clusters,[7,8]) and r.lastCluster == 9 and
    r.areanum == 10 and r.areanum2 == 11 and level.scene.sectors == sectors and sectors[0].head == 64,"server sector/PVS metadata remains engine-owned")
  for each index in [0,63,1022,1023]
    other = level.entities[index]
    count = count+lifecycleResetRequire(other.slot == index and not other.inuse and other.health == 0 and other.r.ownerNum == 0 and other.s.number == 0,
      "array reset includes client, world and none slots "+str(index))
  end for
  count = count+lifecycleResetRequire(client.connected == 2 and client.wins == 10 and client.ps.stats[0] == 101 and level.clients[0].losses == 19,
    "entity memset does not reset persistent client storage")
  lifecycle.clearClients(level)
  count = count+lifecycleResetRequire(level.clients == heldClients and level.clients[63] == client and client.ps != heldPs and lifecycleResetZero(resetPlayerState.words(client.ps),117),
    "client object identity persists and all playerstate words become zero")
  count = count+lifecycleResetRequire(client.connected == 0 and client.netname == "" and client.wins == 0 and client.team == 0 and client.hook == void and
    lifecycleResetZero(client.cmdAngles,3) and lifecycleResetZero(client.damage_from,3) and lifecycleResetZero(client.oldOrigin,3) and not client.noclip and not client.fireHeld and
    not client.inactivityWarning and client.timeResidual == 0 and level.clients[0].losses == 0 and level.clients[0].ps.persistant[0] == 0,"session and per-frame client state reset at both array edges")
  count = count+lifecycleResetRequire(len(level.context.events) == 0 and ent.client == void,"both array memsets are silent and do not bind clients")
  for each index in [0,63]
    bound = resetGame.bindClient(level,level.entities[index],level.clients[index])
    count = count+lifecycleResetRequire(bound == heldClients[index] and level.entities[index].client == bound and not level.entities[index].inuse and
      level.entities[index].s.number == 0 and level.entities[index].r.number == 0,"client binding preserves zero entity state at slot "+str(index))
  end for
  count = count+lifecycleResetRequire(try(resetGame.bindClient(level,ent,client)) is error and ent.client == void,"client binding rejects the first nonclient slot")
  oldSlot = ent.slot; ent.slot = -1
  count = count+lifecycleResetRequire(try(resetGame.bindClient(level,ent,client)) is error and ent.client == void,"client binding rejects negative slots")
  ent.slot = oldSlot; return count
end function
function lifecycleResetHooksAndBounds(level)
  count = 0; state = lifecycle.get(level); level.context.events = []
  state.cvarEffectFn = lifecycleResetCvarEffect; state.locateFn = lifecycleResetLocate
  level.gamePrintFn = lifecycleResetPrint; level.dedicated = 0; level.logFile = 0
  lifecycle.cvarEffect(level.gameCvars,1,7,"key","value")
  lifecycle.cvarEffect(level.gameCvars,4,-1,"","diagnostic\n")
  count = count+lifecycleResetRequire(lifecycleResetSequence(level.context.events,["cvar",1,7,"key","value","diagnostic\n"]),"Cvar hooks forward original arguments and route diagnostics once")
  level.context.events = []
  lifecycle.spawnEffect(level.spawner,1,29,"","retained")
  lifecycle.spawnEffect(level.spawner,2,-1,"g_test","2")
  lifecycle.spawnEffect(level.spawner,3,-1,"","silent log\n")
  count = count+lifecycleResetRequire(lifecycleResetSequence(level.context.events,["spawn",1,29,"","retained","spawn",2,-1,"g_test","2"]),"spawn hooks forward config/Cvar effects and route logs to actual logger")
  level.context.events = []; level.num_entities = 64
  allocated = resetGame.spawn(level)
  count = count+lifecycleResetRequire(allocated == level.entities[64] and allocated.inuse and allocated.s.number == 64 and allocated.r.ownerNum == 1023 and
    lifecycleResetSequence(level.context.events,["locate",65,false,"entity",3,64,65,false]),"allocation Locate precedes observer and G_InitGentity mutations")
  level.context.events = []; state.locateFn = void
  count = count+lifecycleResetRequire(try(lifecycle.entityObserve(level,3,allocated)) is error and len(level.context.events) == 0,"missing Locate rejects before downstream allocation observation")
  lifecycle.entityObserve(level,2,allocated)
  count = count+lifecycleResetRequire(lifecycleResetSequence(level.context.events,["entity",2,64,65,true]),"nonallocation observation needs no Locate service")
  level.context.events = []; state.integerQueryFn = lifecycleResetQuery
  resetCv.set2(level.spawner.cvars,"reset_query","7",true)
  queryResult = lifecycle.integerValue(level,"reset_query")
  count = count+lifecycleResetRequire(queryResult == 7 and resetCv.find(level.spawner.cvars,"reset_query").integer == 19 and
    lifecycleResetSequence(level.context.events,["query","reset_query",7]),"integer query callback observes the actual captured engine value")
  state.integerQueryFn = void; level.context.events = []; heldParser = level.spawner.parser
  level.time = 733; level.randSeed = 919
  for each invalid in [-2147483649,2147483648,1.0,"1",void]
    count = count+lifecycleResetRequire(try(lifecycle.init(level,invalid,1,0,"")) is error,"invalid native levelTime "+str(invalid))
    count = count+lifecycleResetRequire(try(lifecycle.init(level,1,invalid,0,"")) is error,"invalid native randomSeed "+str(invalid))
    count = count+lifecycleResetRequire(try(lifecycle.init(level,1,1,invalid,"")) is error,"invalid native init restart "+str(invalid))
    count = count+lifecycleResetRequire(try(lifecycle.shutdown(level,invalid)) is error,"invalid native shutdown restart "+str(invalid))
  end for
  count = count+lifecycleResetRequire(try(lifecycle.init(level,1,1,0,7)) is error,"entity source must be a string")
  count = count+lifecycleResetRequire(level.spawner.parser == heldParser and level.time == 733 and level.randSeed == 919 and len(level.context.events) == 0,
    "invalid native arguments are rejected before host delivery or game mutation")
  count = count+lifecycleResetRequire(try(lifecycle.vm(level,"missing_vm")) is error,"missing VM mapping cannot silently fall back to a Cvar mirror")
  lifecycle.gamePrint(level,decode(bytes(1023,65)))
  count = count+lifecycleResetRequire(len(bytes(level.context.events[0])) == 1023 and try(lifecycle.gamePrint(level,decode(bytes(1024,65)))) is error and len(level.context.events) == 1,
    "G_Printf accepts its last valid payload byte and rejects overflow before delivery")
  level.gamePrintFn = void
  count = count+lifecycleResetRequire(try(lifecycle.gamePrint(level,"missing")) is error,"required game diagnostics cannot disappear")
  // Stop at the first required print: this exercises valid signed endpoints
  // and a NUL-terminated engine token stream without rebuilding an Init host.
  tokenSource = "{ }"+decode(bytes(1,0))+"ignored"
  count = count+lifecycleResetRequire(try(lifecycle.init(level,-2147483648,2147483647,-2147483648,tokenSource)) is error and
    lifecycleResetSequence(level.spawner.parser.data,bytes(tokenSource)) and level.time == 733 and level.randSeed == 919,"valid native endpoints reach the print boundary before srand or memset")
  return count
end function
function run(world)
  count = 0; level = resetGame.create(world)
  count = count+lifecycleResetRequire(try(lifecycle.get(level)) is error and try(lifecycle.clearLevel(level)) is error,"level reset requires module bindings")
  count = count+lifecycleResetRequire(try(lifecycle.attach(level,"test")) is error and level.lifecycleState == void,"module attachment requires engine spawn state")
  spawner = resetSpawn.create(level,"old tokens"); scene = level.scene; heldEntities = level.entities; heldClients = level.clients
  ent = level.entities[63]; shared = ent.r; client = level.clients[63]; registry = spawner.cvars; configstrings = spawner.configstrings
  level.context = LifecycleResetContext([]); context = level.context; level.gamePrintFn = lifecycleResetPrint
  level.observeFn = lifecycleResetEntityObserve; spawner.effectFn = lifecycleResetSpawnEffect
  resetCv.set2(registry,"g_gravity","913",true); configstrings[29] = "engine before VM"
  ent.inuse = true; ent.health = 93; shared.ownerNum = 1023; client.ps.stats[0] = 93; client.wins = 4
  level.deathAnimIndex = 2; level.itemRegistered[9] = 1; oldWeapon = resetWeapons.get(level); oldWeapon.quadFactor = 4.0
  oldArena = resetMemory.get(level); oldArena.pool[3] = 127; oldIp = resetIp.get(level); oldIp.count = 1
  oldMaintenance = level.cvarMaintenance; oldMaintenance.lastPasswordModificationCount = 12
  resetServer.get(level).botListFn = lifecycleResetHost; level.shaderRemaps = [["old","shader",2.0]]
  level.redFlagStatus = 2; level.blueFlagStatus = 1; level.neutralFlagStatus = 4; level.redTakenTime = 300; level.blueTakenTime = 400
  level.lastFlagCapture = 12.5; level.lastCaptureTeam = 2; level.redObeliskAttackedTime = 500; level.blueObeliskAttackedTime = 600
  count = count+lifecycleResetRequire(try(lifecycle.attach(level,decode(bytes(1013,65)))) is error and level.lifecycleState == void,"build-date diagnostic overflow rejected before attachment")
  count = count+lifecycleResetRequire(try(lifecycle.attach(level,"a"+decode(bytes(1,0))+"b")) is error and level.lifecycleState == void,"build date cannot contain embedded NUL")
  state = lifecycle.attach(level,decode(bytes(1012,65)))
  count = count+lifecycleResetRequire(len(bytes(state.buildDate)) == 1012 and not state.entitiesBound and not state.clientsBound and level.num_entities == 0,
    "fresh module uses BSS state with unbound native array pointers")
  count = count+lifecycleResetRequire(level.entities == heldEntities and level.entities[63] == ent and ent.r == shared and level.clients == heldClients and level.clients[63] == client and
    ent.client == void and not ent.inuse and ent.health == 0 and shared.ownerNum == 0 and client.ps.stats[0] == 0 and client.wins == 0,"fresh module zeroes persistent array objects without replacing their identities")
  count = count+lifecycleResetRequire(level.scene == scene and level.context == context and level.spawner == spawner and spawner.cvars == registry and
    spawner.configstrings == configstrings and configstrings[29] == "engine before VM" and resetCv.find(registry,"g_gravity").integer == 913,"fresh VM preserves existing engine storage")
  count = count+lifecycleResetRequire(level.knockback == 0.0 and level.blood == 0 and level.weaponRespawn == 0 and level.weaponTeamRespawn == 0 and level.gravity == 0.0 and
    level.playerSpeed == 0.0 and level.pmoveMsec == 0 and level.warmup == 0 and not level.gameCvars.registered and lifecycle.vm(level,"g_gravity").integer == 0,
    "fresh VM snapshots are zero before Register despite existing engine values and constructor defaults")
  count = count+lifecycleResetRequire(level.randSeed == 1 and level.deathAnimIndex == 0 and lifecycleResetZero(level.itemRegistered,256) and len(level.shaderRemaps) == 0 and
    level.weaponState == void and level.ipFilters == void and level.memoryState == void and level.serverCommands == void and level.cvarMaintenance != oldMaintenance and
    level.cvarMaintenance.lastPasswordModificationCount == -1,"fresh VM resets module statics and restores initialized static defaults")
  count = count+lifecycleResetRequire(lifecycleResetZero([level.redFlagStatus,level.blueFlagStatus,level.neutralFlagStatus,level.redTakenTime,level.blueTakenTime,
    level.lastFlagCapture,level.lastCaptureTeam,level.redObeliskAttackedTime,level.blueObeliskAttackedTime],9),"fresh VM also clears every teamgame static")
  count = count+lifecycleResetRequire(state.entityObserveFn == lifecycleResetEntityObserve and state.spawnEffectFn == lifecycleResetSpawnEffect and level.gamePrintFn == lifecycleResetPrint and
    level.observeFn == lifecycle.entityObserve and spawner.effectFn == lifecycle.spawnEffect and level.gameCvars.effectFn == lifecycle.cvarEffect,"attachment retains host hooks behind lifecycle adapters")
  count = count+lifecycleResetRequire(try(lifecycle.attach(level,"again")) is error and lifecycle.get(level) == state,"second attachment cannot silently replace a live VM image")
  count = count+lifecycleResetNativeFields(level)
  count = count+lifecycleResetArrays(level)
  count = count+lifecycleResetHooksAndBounds(level)
  return count
end function
