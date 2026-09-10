// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.client_commands as clientCommands
import mq3.game.server_commands as serverCommands
import mq3.game.memory as serverMemory
import mq3.game.ip_filters as serverFilters
import mq3.game.command_args as commandArgs
import mq3.shared.info as commandInfo
import mq3.game.weapons as weapons
import mq3.game.weapon_hitscan as weaponHitscan
import mq3.game.weapon_state as weaponState
import mq3.game.missiles as weaponMissiles
import mq3.server.world as weaponWorld
import std.string as fixtureStrings
import mq3.game.follow_commands as followCommands
import mq3.game.intermission as intermissionFlow
import mq3.game.bot_lifecycle as botLifecycle
import mq3.game.client_spawn as clientSpawn
import mq3.game.scores as scores
import mq3.game.session as sessions
import mq3.game.tournament as tournament
import mq3.game.client_active as clientActive
import mq3.game.pmove as pmove
import mq3.compat.textnumbers as textnum
import mq3.game.team_changes as teamChanges
import mq3.game.client_disconnect as clientDisconnect
import mq3.game.client_info as clientInfo
import mq3.game.cvars as gameCvars
import mq3.game.bodies as bodies
import mq3.game.deaths as deaths
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.entitystate as es
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
struct Reader
  data
  offset
end struct
struct Check
  expected
  offset
  words
  events
  actions
  userinfos
  location
  followMode
  intermissionMode
  commandsMode
  weaponsMode
  serverCommandsMode
  traces
end struct
function readInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete team change input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid team change test string") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected team change output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Team change mismatch at byte "+str(check.offset)+" ["+check.location+"] got "+str(n.u32(value))+" wanted "+str(wanted)) end if
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
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Userinfo string mismatch at byte "+str(check.offset)) end if
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
  words(check,[ent.nextthink,ent.timestamp,ent.count]); item = -1; if ent.item != void then item = ent.item end if; word(check,item)
  boolWord(check,ent.think != void); boolWord(check,ent.die != void); boolWord(check,ent.touch != void); boolWord(check,ent.pain != void)
  pointer(check,ent.enemy); pointer(check,ent.parent)
  words(check,[ent.r.contents,ent.r.svFlags,ent.r.ownerNum,ent.r.singleClient]); boolWord(check,ent.r.linked); word(check,ent.r.linkcount)
  floatWords(check,ent.r.mins); floatWords(check,ent.r.maxs); floatWords(check,ent.r.currentOrigin); floatWords(check,ent.r.currentAngles); floatWords(check,ent.r.absmin); floatWords(check,ent.r.absmax)
  return void
end function
function snapshot(level)
  check = level.context; check.location = "level"
  words(check,[220,level.time,level.spawner.gametype,level.maxclients,level.teamForceBalance,level.maxGameClients,level.num_entities,level.follow1,level.follow2,
    level.numConnectedClients,level.numNonSpectatorClients,level.numPlayingClients,level.numVotingClients])
  words(check,level.numteamVotingClients); words(check,level.sortedClients); words(check,level.teamScores); boolWord(check,level.spawner.spawning); word(check,len(level.spawner.vars))
  words(check,[level.intermissiontime,level.intermissionQueued,level.spawner.warmupTime,level.bodyQueIndex])
  for each body in level.bodyQue
    pointer(check,body)
  end for
  words(check,[level.redFlagStatus,level.blueFlagStatus]); words(check,level.itemRegistered)
  for index = 0 to 63
    check.location = "client "+str(index); connectClientSnapshot(check,level.clients[index]); textWord(check,level.spawner.configstrings[544+index])
  end for
  for index = 0 to level.num_entities-1
    entitySnapshot(level,level.entities[index])
  end for
  check.location = "configs"; textWord(check,level.spawner.configstrings[6]); textWord(check,level.spawner.configstrings[7]); textWord(check,level.spawner.configstrings[23])
  if check.followMode then word(check,level.warmupModificationCount); boolWord(check,level.restarted); words(check,[level.warmup,level.warmupCvarModificationCount]); textWord(check,level.spawner.configstrings[5]) end if
  if check.intermissionMode then
    check.location = "intermission"; floatWords(check,level.intermission_origin); floatWords(check,level.intermission_angle)
    word(check,level.maxclientsCvar); boolWord(check,level.readyToExit); words(check,[level.exitTime,level.timelimit,level.fraglimit])
    textWord(check,level.changemap); textWord(check,level.spawner.configstrings[22]); textWord(check,sessions.cvarText(level,"session"))
    for index = 0 to 63
      textWord(check,sessions.cvarText(level,"session"+str(index)))
    end for
  end if
  if check.commandsMode then
    check.location = "commands"
    words(check,[level.cheats,level.dedicated,level.allowVote])
    textWord(check,level.voteString); textWord(check,level.voteDisplayString)
    words(check,[level.voteTime,level.voteExecuteTime,level.voteYes,level.voteNo])
    for each value in level.teamVoteString
      textWord(check,value)
    end for
    words(check,level.teamVoteTime); words(check,level.teamVoteYes); words(check,level.teamVoteNo)
    for index = 8 to 21
      textWord(check,level.spawner.configstrings[index])
    end for
    for index = 0 to 63
      textWord(check,check.userinfos[index])
    end for
    nextmap = cv.find(level.spawner.cvars,"nextmap"); rotation = ""
    if nextmap != void then rotation = nextmap.string end if
    textWord(check,rotation); pointer(check,level.locationHead)
    for index = 0 to level.num_entities-1
      textWord(check,level.entities[index].message); pointer(check,level.entities[index].nextTrain)
    end for
  end if
  if check.weaponsMode then
    check.location = "weapons"
    word(check,n.floatBits(level.quadfactor)); word(check,level.friendlyFire); word(check,n.floatBits(level.knockback))
    state = weaponState.get(level); word(check,n.floatBits(state.quadFactor))
    floatWords(check,state.forward); floatWords(check,state.right); floatWords(check,state.up); floatWords(check,state.muzzle)
    for index = 0 to 63
      pointer(check,level.clients[index].hook)
    end for
    for index = 0 to level.num_entities-1
      ent = level.entities[index]
      words(check,[ent.damage,ent.splashDamage,ent.splashRadius,ent.methodOfDeath,ent.splashMethodOfDeath])
      pointer(check,ent.target_ent)
    end for
  end if
  if check.serverCommandsMode then
    check.location = "server commands"
    mem = serverMemory.get(level); filters = serverFilters.get(level)
    words(check,[mem.allocPoint,mem.debugAlloc,filters.count])
    for each filter in filters.filters
      words(check,[filter.mask,filter.compare])
    end for
    banData = serverFilters.banBytes(level)
    for index = 0 to 63
      word(check,n.readU32(banData,index*4))
    end for
    word(check,serverFilters.filterVm(level,"g_filterBan").integer)
    textWord(check,cv.find(level.spawner.cvars,"g_banIPs").string)
  end if
  return void
end function
function weaponTraceRecord(level,start,finish,mins,maxs,passEntity,mask,hit)
  snapshot(level); check = level.context; check.location = "weapon trace"; tr = hit.trace
  words(check,[227,passEntity,mask]); boolWord(check,mins != void); boolWord(check,maxs != void)
  floatWords(check,start); floatWords(check,finish)
  if mins == void then floatWords(check,[0.0,0.0,0.0]) else floatWords(check,mins) end if
  if maxs == void then floatWords(check,[0.0,0.0,0.0]) else floatWords(check,maxs) end if
  word(check,n.floatBits(tr.fraction)); floatWords(check,tr.normal); word(check,n.floatBits(tr.distance))
  words(check,[tr.surfaceFlags,tr.contents]); boolWord(check,tr.startsolid); boolWord(check,tr.allsolid)
  floatWords(check,hit.endpos); words(check,[tr.planeMetadata,hit.entityNum]); check.traces = check.traces+1
  return void
end function
function record(level,kind,arg,text)
  if level.context == void then return void end if
  snapshot(level); level.context.location = "event "+str(kind)
  words(level.context,[221,kind,arg]); textWord(level.context,text); level.context.events = level.context.events+1; return void
end function
function observe(level,kind,ent)
  if kind == 3 then return record(level,14,level.num_entities," ") end if
  return record(level,kind,ent.slot," ")
end function
function effect(state,kind,index,key,value)
  return record(state.level,3,index,value)
end function
function userinfo(level,slot)
  record(level,4,slot," "); return level.context.userinfos[slot]
end function
function usercmd(level,slot,client)
  record(level,5,slot," "); client.cmdAngles = [0,0,0]; client.cmdServerTime = 0; client.cmdButtons = 0; client.cmdWeapon = 0
  client.cmdForwardmove = 0; client.cmdRightmove = 0; client.cmdUpmove = 0; return void
end function
function think(level,slot)
  return record(level,6,slot," ")
end function
function endFrame(level,ent)
  return record(level,7,ent.slot," ")
end function
function intermission(level,ent)
  record(level,8,ent.slot," "); ent.client.ps.pm_type = c.PM_INTERMISSION
  ent.client.ps.origin = [level.intermission_origin[0],level.intermission_origin[1],level.intermission_origin[2]]; return void
end function
function gameLog(level,message)
  return record(level,9,-1,message)
end function
function serverCommand(level,slot,message)
  return record(level,10,slot,message)
end function
function teamMessage(level,slot,message)
  return record(level,11,slot,message)
end function
function removeQueued(level,slot)
  return record(level,12,slot," ")
end function
function botShutdown(level,slot,restart)
  if restart then return error(499,"Unexpected bot restart") end if
  record(level,13,slot,"0"); return true
end function
function gamePrint(level,message)
  return record(level,15,-1,message)
end function
function followCvar(level,key,value)
  return record(level,16,0,key+"="+value)
end function
function followConsole(level,mode,text)
  return record(level,17,mode,text)
end function
function intermissionCvar(level,key,value)
  cv.set2(level.spawner.cvars,key,value,true); return record(level,16,0,key+"="+value)
end function
function intermissionBot(level)
  return record(level,18,0," ")
end function
function intermissionUpdate(level)
  return record(level,19,0," ")
end function
function intermissionPads(level)
  return record(level,20,0," ")
end function
function commandUserinfoSet(level,slot,text)
  level.context.userinfos[slot] = text; return record(level,21,slot,text)
end function
function serverBotArgs(argv)
  text = ""
  for each arg in argv
    text = text+str(len(bytes(arg)))+":"+arg
  end for
  return text
end function
function serverAddBot(level,argv)
  return record(level,22,len(argv),serverBotArgs(argv))
end function
function serverBotList(level,argv)
  return record(level,23,len(argv),serverBotArgs(argv))
end function
function serverAbortPodium(level,argv)
  return record(level,24,len(argv),serverBotArgs(argv))
end function
function serverConfigure(level)
  serverMemory.init(level); serverMemory.get(level).debugAlloc = 0
  banVm = cv.createVm(); filterVm = cv.createVm()
  cv.registerVm(level.spawner.cvars,banVm,"g_banIPs","",0)
  cv.registerVm(level.spawner.cvars,filterVm,"g_filterBan","1",0)
  serverFilters.bindVm(level,banVm,filterVm)
  serverCommands.attach(level,serverAddBot,serverBotList,serverAbortPodium)
  return void
end function
function spot(level,slot,name,origin,angles)
  ent = game.initEntity(level.entities[slot]); ent.classname = name; ent.s.origin = origin; ent.s.angles = angles; return void
end function
function configure(level,reader,check)
  s = spawn.create(level,""); level.maxclients = readInt(reader); level.maxclientsCvar = level.maxclients
  s.gametype = readInt(reader); level.time = readInt(reader); level.teamForceBalance = readInt(reader); level.maxGameClients = readInt(reader)
  level.numNonSpectatorClients = readInt(reader); level.intermissiontime = readInt(reader); s.warmupTime = readInt(reader)
  level.teamScores[1] = readInt(reader); level.teamScores[2] = readInt(reader); level.sortedClients[0] = readInt(reader); level.sortedClients[1] = readInt(reader); level.blood = readInt(reader)
  level.startTime = 1000; s.spawning = true; s.vars = [["a","1"],["b","2"],["c","3"]]
  spot(level,64,"info_player_deathmatch",[0.0,0.0,64.0],[10.0,20.0,30.0]); level.entities[64].spawnflags = 1
  spot(level,65,"info_player_deathmatch",[1000.0,0.0,64.0],[-15.0,180.0,1.0])
  spot(level,66,"info_player_deathmatch",[-500.0,300.0,96.0],[45.0,-90.0,5.0])
  spot(level,67,"team_CTF_redplayer",[100.0,200.0,80.0],[1.0,91.0,2.0])
  spot(level,68,"team_CTF_redspawn",[110.0,210.0,90.0],[3.0,93.0,4.0])
  spot(level,69,"team_CTF_blueplayer",[-100.0,-200.0,100.0],[5.0,-95.0,6.0])
  spot(level,70,"team_CTF_bluespawn",[-110.0,-210.0,110.0],[7.0,-97.0,8.0])
  spot(level,71,"info_player_intermission",[25.0,35.0,512.0],[9.0,135.0,11.0])
  level.num_entities = 72; bodies.initQueue(level)
  for i = 80 to 81
    ent = game.initEntity(level.entities[i]); tag = c.PW_REDFLAG; ent.classname = "team_CTF_redflag"
    if i == 81 then tag = c.PW_BLUEFLAG; ent.classname = "team_CTF_blueflag" end if
    ent.item = deaths.powerupItem(tag); ent.s.eType = c.ET_ITEM; ent.s.modelindex = ent.item
    ent.s.pos.trBase = [400.0,n.f32((i-80)*100),100.0]; ent.r.currentOrigin = [400.0,n.f32((i-80)*100),100.0]
    ent.r.mins = [-15.0,-15.0,-15.0]; ent.r.maxs = [15.0,15.0,15.0]; ent.r.contents = 0x40000000; game.link(level,ent)
  end for
  level.num_entities = 82
  for index = 0 to 63
    q = []
    for part = 0 to 27
      q = q+[readInt(reader)]
    end for
    ent = level.entities[index]; client = level.clients[index]
    if q[1] != 0 then game.initEntity(ent) end if
    if q[0] != 0 then game.bindClient(level,ent,client) end if
    ent.inuse = q[1] != 0; ent.classname = "player"; ent.r.svFlags = q[2]
    client.connected = q[3]; client.team = q[4]; client.spectatorState = q[5]; client.spectatorClient = q[6]; client.spectatorTime = q[7]
    client.wins = q[8]; client.losses = q[9]; client.teamLeader = q[10]; ent.health = q[11]; client.ps.stats[c.STAT_HEALTH] = q[11]; client.ps.pm_type = q[12]; client.ps.pm_flags = q[13]
    client.ps.clientNum = q[14]; ent.s.clientNum = q[15]; ent.flags = q[16]; client.switchTeamTime = q[17]; client.ps.weapon = q[18]; ent.s.weapon = q[18]; client.ps.ammo[q[18]] = q[19]
    client.ps.weaponstate = q[20]; client.cmdWeapon = q[21]; client.ps.stats[c.STAT_WEAPONS] = (1 << q[18]) | (1 << q[21])
    for tag = 1 to c.PW_NUM_POWERUPS-1
      if (q[22] & (1 << tag)) != 0 then client.ps.powerups[tag] = q[23] end if
    end for
    client.ps.groundEntityNum = q[24]; ent.s.groundEntityNum = q[24]; client.ps.persistant[c.PERS_SCORE] = q[26]; client.ps.eFlags = q[27]; client.ps.persistant[c.PERS_TEAM] = q[4]
    client.maxHealth = 100; client.ps.stats[c.STAT_MAX_HEALTH] = 100; client.teamStateState = 1; client.teamStateLocation = 7; client.enterTime = 70
    client.ps.origin = [n.f32(3000+index*100),0.0,128.0]; ent.s.origin = [n.f32(3000+index*100),0.0,128.0]
    ent.s.pos.trBase = [n.f32(3000+index*100),0.0,128.0]; ent.r.currentOrigin = [n.f32(3000+index*100),0.0,128.0]
    client.ps.velocity = [1.25,-2.5,3.75]; client.ps.viewangles = [0.0,35.0,0.0]; ent.s.angles = [0.0,35.0,0.0]
    ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.contents = 0x02000000; ent.takedamage = true; ent.s.modelindex = 9
    client.netname = readString(reader); check.userinfos[index] = readString(reader); s.configstrings[544+index] = "before-"+str(index)
    if q[25] != 0 and q[1] != 0 then game.link(level,ent) end if
  end for
  level.context = check; level.observeFn = observe; s.effectFn = effect; level.userinfoFn = userinfo; level.usercmdFn = usercmd
  level.clientThinkFn = think; level.clientEndFrameFn = endFrame; level.moveIntermissionFn = intermission; level.gameLogFn = gameLog; level.serverCommandFn = serverCommand
  level.teamMessageFn = teamMessage; level.removeQueuedBotBeginFn = removeQueued; level.botShutdownFn = botShutdown; level.gamePrintFn = gamePrint
  if check.followMode then level.cvarSetFn = followCvar; level.consoleCommandFn = followConsole end if
  if check.intermissionMode then
    level.moveIntermissionFn = void; level.matchTransitionFn = void; level.playerDieFn = deaths.playerDie
    level.cvarSetFn = intermissionCvar; level.botInterbreedEndMatchFn = intermissionBot
    level.updateTournamentInfoFn = intermissionUpdate; level.spawnVictoryPadsFn = intermissionPads
    level.changemap = void; level.readyToExit = false; level.exitTime = 0
  end if
  if check.commandsMode then
    level.userinfoSetFn = commandUserinfoSet; s.spawning = false; s.vars = []
  end if
  if check.weaponsMode then
    for index = 0 to 63
      if level.entities[index].client != void then
        level.entities[index].die = deaths.playerDie
        level.entities[index].client.ps.viewheight = 26; level.entities[index].client.ps.viewangles = [0.0,0.0,0.0]
      end if
    end for
    level.playerSpeed = 320; level.quadfactor = 3.0; level.pmoveMsec = 8; level.gravity = 800; level.inactivity = 0
    level.traceObserveFn = weaponTraceRecord; level.fireWeaponFn = void; level.gauntletAttackFn = void
  end if
  if check.serverCommandsMode then serverConfigure(level) end if
  // No Begin/death/item/rank/userinfo overrides: all those game routines are real.
  return void
end function

function weaponFixtureValues(request)
  result = array(16,0); index = 0
  if request == "" then return result end if
  for each token in fixtureStrings.split(request,",")
    if index >= 16 then return error(499,"Too many weapon fixture words") end if
    result[index] = textnum.atoi(token); index = index+1
  end for
  return result
end function
function weaponFixtureRelink(level,ent)
  if ent.r.linked then
    game.syncSpatial(ent); weaponWorld.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  end if
  return void
end function
function weaponFixtureScalar(level,slot,field,value)
  ent = level.entities[slot]; client = level.clients[slot]
  switch field
    case 1
      ent.s.weapon = value; client.ps.weapon = value
    end case
    case 2
      client.ps.viewheight = value
    end case
    case 3
      level.quadfactor = n.bitsFloat(value)
    end case
    case 4
      client.accuracy_shots = value
    end case
    case 5
      client.accuracy_hits = value
    end case
    case 6
      client.accurateCount = value
    end case
    case 7
      client.ps.stats[c.STAT_ARMOR] = value
    end case
    case 8
      ent.health = value; client.ps.stats[c.STAT_HEALTH] = value
    end case
    case 9
      client.ps.stats[c.STAT_MAX_HEALTH] = value
    end case
    case 10
      ent.takedamage = value != 0
    end case
    case 11
      ent.r.contents = value; weaponFixtureRelink(level,ent)
    end case
    case 12
      ent.client = void; if value != 0 then ent.client = client end if
    end case
    case 13
      level.friendlyFire = value
    end case
    case 14
      level.knockback = n.bitsFloat(value)
    end case
    case 15
      client.ps.powerups[c.PW_QUAD] = value
    end case
    case 16
      client.fireHeld = value != 0
    end case
    case 17
      client.hook = void; if value != -1 then client.hook = level.entities[value] end if
    end case
    case 18
      ent.die = void; if value != 0 then ent.die = deaths.playerDie end if
    end case
    case 19
      client.ps.eFlags = value
    end case
    case 20
      client.ps.weaponTime = value
    end case
    case 21
      client.noclip = value != 0
    end case
    case 22
      client.ps.commandTime = value
    end case
    case 23
      ent.enemy = void; if value != -1 then ent.enemy = level.entities[value] end if
    end case
    case 24
      ent.flags = value
    end case
    case 25
      client.ps.pm_flags = value
    end case
    case 26
      client.rewardTime = value
    end case
    case 27
      client.ps.persistant[c.PERS_IMPRESSIVE_COUNT] = value
    end case
    case 28
      client.ps.stats[c.STAT_WEAPONS] = value
    end case
    case 29
      client.ps.weaponstate = value
    end case
    case 30
      ent.s.weapon = value
    end case
    case 31
      client.ps.weapon = value
    end case
    case 32
      client.ps.stats[c.STAT_HEALTH] = value
    end case
    case default
      return error(499,"Invalid weapon scalar fixture")
    end case
  end switch
  return void
end function
function weaponFixtureVector(level,slot,field,value)
  ent = level.entities[slot]; client = level.clients[slot]; state = weaponState.get(level)
  vector = [n.bitsFloat(value[0]),n.bitsFloat(value[1]),n.bitsFloat(value[2])]
  switch field
    case 1
      client.ps.origin = [vector[0],vector[1],vector[2]]; ent.s.origin = [vector[0],vector[1],vector[2]]
      ent.s.pos.trBase = [vector[0],vector[1],vector[2]]; ent.r.currentOrigin = [vector[0],vector[1],vector[2]]
      weaponFixtureRelink(level,ent)
    end case
    case 2
      client.ps.viewangles = vector
    end case
    case 3
      ent.s.pos.trBase = vector
    end case
    case 4
      client.oldOrigin = vector
    end case
    case 5
      client.ps.velocity = vector
    end case
    case 6
      ent.r.mins = vector; weaponFixtureRelink(level,ent)
    end case
    case 7
      ent.r.maxs = vector; weaponFixtureRelink(level,ent)
    end case
    case 8
      state.forward = vector
    end case
    case 9
      state.right = vector
    end case
    case 10
      state.up = vector
    end case
    case 11
      state.muzzle = vector
    end case
    case default
      return error(499,"Invalid weapon vector fixture")
    end case
  end switch
  return void
end function
function weaponFixtureDirect(level,ent,method,value)
  state = weaponState.get(level); result = [0.0,0.0,0.0]
  first = [n.bitsFloat(value[0]),n.bitsFloat(value[1]),n.bitsFloat(value[2])]
  second = [n.bitsFloat(value[3]),n.bitsFloat(value[4]),n.bitsFloat(value[5])]
  third = [n.bitsFloat(value[6]),n.bitsFloat(value[7]),n.bitsFloat(value[8])]
  switch method
    case 1
      weaponHitscan.bullet(level,ent,n.bitsFloat(value[0]),value[1])
    end case
    case 2
      weaponHitscan.shotgunPattern(level,first,second,value[6],ent)
    end case
    case 3
      hit = weaponHitscan.shotgunPellet(level,first,second,ent); word(level.context,224); boolWord(level.context,hit)
    end case
    case 4
      weaponHitscan.shotgun(level,ent)
    end case
    case 5
      weaponHitscan.rail(level,ent)
    end case
    case 6
      weaponHitscan.lightning(level,ent)
    end case
    case 7
      weapons.grenade(level,ent)
    end case
    case 8
      weapons.rocket(level,ent)
    end case
    case 9
      weapons.plasma(level,ent)
    end case
    case 10
      weapons.bfg(level,ent)
    end case
    case 11
      weapons.grapple(level,ent)
    end case
    case 12
      weapons.calcMuzzlePoint(ent,state.forward,state.right,state.up,result); word(level.context,225); floatWords(level.context,result)
    end case
    case 13
      weapons.calcMuzzlePointOrigin(ent,first,state.forward,state.right,state.up,result); word(level.context,225); floatWords(level.context,result)
    end case
    case 14
      weapons.bounceProjectile(first,second,third,result); word(level.context,225); floatWords(level.context,result)
    end case
    case default
      return error(499,"Invalid direct weapon fixture")
    end case
  end switch
  return void
end function
function runWeaponAction(level,kind,slot,p0,request)
  value = weaponFixtureValues(request); ent = level.entities[slot]
  switch kind
    case 50
      weapons.fire(level,ent)
    end case
    case 51
      hit = weapons.checkGauntlet(level,ent); word(level.context,224); boolWord(level.context,hit)
    end case
    case 52
      level.randSeed = n.i32(p0)
    end case
    case 53
      weaponFixtureScalar(level,slot,p0,value[0])
    end case
    case 54
      weaponFixtureVector(level,slot,p0,value)
    end case
    case 55
      weaponFixtureDirect(level,ent,p0,value)
    end case
    case 56
      ent.client.ps.eventSequence = n.add32(p0,1); ent.client.ps.events[p0 & 1] = c.EV_FIRE_WEAPON
      clientActive.clientEvents(level,ent,p0)
    end case
    case 57
      client = ent.client; client.cmdServerTime = value[0]; client.cmdButtons = value[1]; client.cmdWeapon = value[2]
      client.cmdAngles = [value[3],value[4],value[5]]
      client.cmdForwardmove = value[6]; client.cmdRightmove = value[7]; client.cmdUpmove = value[8]
      clientActive.realThink(level,ent)
    end case
    case 58
      weaponMissiles.run(level,level.entities[p0])
    end case
    case default
      return error(499,"Invalid weapon action")
    end case
  end switch
  return void
end function
function main(argv)
  if len(argv) < 3 then return error(499,"Expected map, input and oracle output") end if
  world = cm.loadWorld(fs.readAllBytes(argv[0]),true)
  if len(argv) > 3 and argv[3] == "--contracts" then return contracts(world) end if
  if len(argv) > 3 and argv[3] == "--follow-contracts" then return followContracts(world) end if
  if len(argv) > 3 and argv[3] == "--intermission-contracts" then return intermissionContracts(world) end if
  if len(argv) > 3 and argv[3] == "--commands-contracts" then return commandsContracts(world) end if
  if len(argv) > 3 and argv[3] == "--weapons-contracts" then return weaponsContracts(world) end if
  if len(argv) > 3 and argv[3] == "--server-commands-contracts" then return serverCommandsContracts(world) end if
  weaponsMode = len(argv) > 3 and argv[3] == "--weapons"
  serverCommandsMode = len(argv) > 3 and argv[3] == "--server-commands"
  commandsMode = serverCommandsMode or weaponsMode or (len(argv) > 3 and argv[3] == "--commands")
  intermissionMode = commandsMode or (len(argv) > 3 and argv[3] == "--intermission")
  followMode = intermissionMode or (len(argv) > 3 and argv[3] == "--follow")
  reader = Reader(fs.readAllBytes(argv[1]),0); check = Check(fs.readAllBytes(argv[2]),0,0,0,0,array(64,""),"",followMode,intermissionMode,commandsMode,weaponsMode,serverCommandsMode,0)
  level = game.create(world); configure(level,reader,check); count = readInt(reader)
  for index = 0 to count-1
    kind = readInt(reader); level.time = readInt(reader); slot = readInt(reader); p0 = readInt(reader); request = readString(reader)
    commandArgv = []
    if check.commandsMode and (kind == 40 or (check.serverCommandsMode and kind == 60)) then
      if p0 < 0 or p0 > 64 then return error(499,"Invalid command argc") end if
      if p0 > 0 then commandArgv = [request] end if
      nextArg = 1
      while nextArg < p0
        commandArgv = commandArgv+[readString(reader)]; nextArg = nextArg+1
      end while
    end if
    switch kind
      case 1
        teamChanges.setTeam(level,level.entities[slot],request)
      end case
      case 2
        args = array(p0,"team"); if p0 > 1 then args[1] = request end if
        teamChanges.commandTeam(level,level.entities[slot],args)
      end case
      case 3
        teamChanges.stopFollowing(level,level.entities[slot])
      end case
      case 4
        clientDisconnect.disconnect(level,slot)
      end case
      case 5
        level.entities[slot].health = p0; level.clients[slot].ps.stats[c.STAT_HEALTH] = p0; level.clients[slot].ps.pm_type = c.PM_DEAD
      end case
      case 6
        level.entities[slot].client = level.clients[p0]
      end case
      case default
        if not check.followMode then return error(499,"Invalid team change action") end if
        if check.commandsMode and kind >= 40 then
          outcome = void
          if check.serverCommandsMode and kind >= 60 then runServerCommandAction(level,kind,slot,p0,request,commandArgv)
          else if check.weaponsMode and kind >= 50 then runWeaponAction(level,kind,slot,p0,request)
          else outcome = try(runCommandAction(level,kind,slot,p0,request,commandArgv)) end if
          if outcome is error then
            snapshot(level); word(check,222); check.actions = check.actions+1
            if index != count-1 then return error(499,"Native command drop must be the final action") end if
            return finishResult(reader,check)
          end if
        else if check.intermissionMode then
          if kind >= 19 then runIntermissionAction(level,kind,slot,p0,request)
          else runFollowAction(level,kind,slot,p0,request) end if
        else
          outcome = try(runFollowAction(level,kind,slot,p0,request))
          if outcome is error then
            snapshot(level); word(check,222); check.actions = check.actions+1
            if index != count-1 then return error(499,"Native drop must be the final action") end if
            return finishResult(reader,check)
          end if
        end if
      end case
    end switch
    snapshot(level); check.actions = check.actions+1
  end for
  if check.weaponsMode then words(check,[226,game.random(level)]) end if
  return finishResult(reader,check)
end function

function serverFixtureBanVm(level,text)
  if len(bytes(text)) > 255 then return error(499,"Ban fixture exceeds VM storage") end if
  vm = serverFilters.filterVm(level,"g_banIPs"); vm.string = text; vm.modificationCount = vm.modificationCount+1
  vm.copyGeneration = vm.copyGeneration+1 // This fixture models an actual full native VM-buffer copy.
  return void
end function
function runServerCommandAction(level,kind,slot,p0,request,argv)
  switch kind
    case 60
      handled = serverCommands.command(level,argv); word(level.context,228); boolWord(level.context,handled)
    end case
    case 61
      client = serverCommands.clientForString(level,request); found = -1
      if client != void then found = sessions.sessionSlot(level,client) end if
      words(level.context,[229,found])
    end case
    case 62
      if slot < 0 or slot >= 1024 then return error(499,"Entity list fixture slot outside storage") end if
      ent = game.initEntity(level.entities[slot]); ent.s.eType = p0; ent.classname = request
      if request == "<null>" then ent.classname = void end if
      if level.num_entities <= slot then level.num_entities = slot+1 end if
    end case
    case 63
      serverMemory.init(level)
    end case
    case 64
      block = serverMemory.allocate(level,p0); words(level.context,[230,block.offset])
    end case
    case 65
      serverMemory.get(level).debugAlloc = p0
    end case
    case 66
      cv.set2(level.spawner.cvars,"g_banIPs",request,true); serverFixtureBanVm(level,request)
      serverFilters.filterVm(level,"g_filterBan").integer = p0
    end case
    case 67
      serverFilters.processBans(level)
    end case
    case 68
      rejected = serverFilters.filterPacket(level,request); word(level.context,231); boolWord(level.context,rejected)
    end case
    case 69
      serverFixtureBanVm(level,cv.find(level.spawner.cvars,"g_banIPs").string)
    end case
    case default
      return error(499,"Invalid server command action")
    end case
  end switch
  return void
end function
function serverContractBot(level,argv)
  level.time = level.time+len(argv); return void
end function
function serverContractConsole(level,mode,text)
  level.time = mode; level.changemap = text; return void
end function
function serverContractPrint(level,text)
  level.time = level.time+1; level.changemap = level.changemap+text; return void
end function
function serverCommandsContracts(world)
  count = 0; level = game.create(world)
  require(not serverCommands.command(level,[]) and not serverCommands.command(level,["unknown"]),"unknown nondedicated needs no sinks"); count = count+1
  require(serverCommands.get(level) == serverCommands.get(level),"stable per-level console state"); count = count+1
  require(serverCommands.get(level) != serverCommands.get(game.create(world)),"isolated console state"); count = count+1
  for each name in ["addbot","botlist","abort_podium"]
    require(try(serverCommands.command(level,[name])) is error,"bot command requires its explicit implementation"); count = count+1
  end for
  serverCommands.attach(level,serverContractBot,serverContractBot,serverContractBot)
  level.time = 0
  for each name in ["ADDbot","BOTLIST","ABORT_podium"]
    require(serverCommands.command(level,[name,"","two words"]) and level.time > 0,"bot callback receives complete argv"); count = count+1
  end for
  require(level.time == 9,"all bot boundary argv lengths preserved"); count = count+1
  require(try(serverCommands.command(level,["listip"])) is error,"listip requires console sink"); count = count+1
  level.consoleCommandFn = serverContractConsole
  require(serverCommands.command(level,["LiStIp"]) and level.time == 0 and level.changemap == "g_banIPs\n","listip executes now"); count = count+1
  require(try(serverCommands.command(level,["game_memory"])) is error,"memory status requires print sink"); count = count+1
  level.gamePrintFn = quietLog
  require(serverCommands.command(level,["game_memory"]),"memory status uses real arena"); count = count+1
  level.maxclients = 0
  require(serverCommands.clientForString(level,"0") == void,"zero client limit"); count = count+1
  for each limit in [-1,65]
    level.maxclients = limit
    require(try(serverCommands.clientForString(level,"0")) is error,"client lookup native storage bound"); count = count+1
  end for
  level.maxclients = 2; level.clients[0].connected = 1; level.clients[0].netname = "^1Player"
  require(serverCommands.clientForString(level,"^1pLaYeR") == level.clients[0],"raw name lookup accepts connecting"); count = count+1
  require(serverCommands.clientForString(level,"Player") == void,"lookup retains color escapes"); count = count+1
  require(serverCommands.clientForString(level,"0suffix") == level.clients[0],"numeric lookup uses atoi prefix"); count = count+1
  require(try(serverCommands.clientForString(level,decode(bytes([65,0,66])))) is error,"lookup rejects embedded NUL"); count = count+1
  require(try(serverCommands.clientForString(level,decode(bytes(997,120)))) is error,"missing-name output rejects native G_Printf overflow"); count = count+1
  require(try(serverCommands.serverPrint(level,decode(bytes(1024,120)))) is error,"classname output rejects native G_Printf overflow"); count = count+1
  ent = game.initEntity(level.entities[1]); ent.s.eType = 2; ent.classname = decode(bytes(1024,120))
  level.num_entities = 2; level.time = 0; level.changemap = ""; level.gamePrintFn = serverContractPrint
  require(try(serverCommands.entityList(level)) is error and level.time == 2 and level.changemap == "  1:ET_ITEM             ","entity classname overflow follows slot and type output"); count = count+1
  level.gamePrintFn = quietLog
  level.num_entities = 0
  require(serverCommands.entityList(level) == void,"empty entity list has no descending loop"); count = count+1
  for each size in [-1,1025]
    level.num_entities = size
    require(try(serverCommands.entityList(level)) is error,"entity list native storage bound"); count = count+1
  end for
  level.dedicated = 1
  require(try(serverCommands.command(level,["unknown"])) is error,"dedicated fallback requires delivery"); count = count+1
  level.serverCommandFn = quietCommand
  require(serverCommands.command(level,[]) and serverCommands.command(level,["SAY"]),"empty dedicated argv and chat"); count = count+1
  require(try(serverCommands.command(level,[decode(bytes([65,0,66]))])) is error,"console argv rejects embedded NUL"); count = count+1
  print "PASS: "+str(count)+" server command runtime contracts"; return 0
end function
function finishResult(reader,check)
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete team change stream") end if
  print "PASS: "+str(check.actions)+" team change actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects / "+str(check.traces)+" weapon traces"; return 0
end function
function require(condition,label)
  if not condition then return error(499,"Failed team change contract: "+label) end if
  return void
end function
function quietLog(level,message)
  return void
end function
function quietCommand(level,slot,message)
  return void
end function
function contracts(world)
  level = game.create(world); ent = level.entities[0]; count = 0
  for each slot in [-1,64]
    require(try(clientDisconnect.disconnect(level,slot)) is error,"invalid disconnect slot"); count = count+1
  end for
  require(try(clientDisconnect.disconnect(level,0)) is error,"bot queue removal boundary"); count = count+1
  require(try(teamChanges.stopFollowing(level,ent)) is error,"unbound follower"); count = count+1
  require(try(teamChanges.setTeam(level,ent,"red")) is error,"unbound team change"); count = count+1
  require(try(teamChanges.commandTeam(level,ent,["team"])) is error,"unbound team command"); count = count+1
  level.removeQueuedBotBeginFn = removeQueued
  require(clientDisconnect.disconnect(level,0) == void,"unbound disconnect still removes queued bot"); count = count+1
  game.bindClient(level,ent,level.clients[0])
  require(try(teamChanges.setTeam(level,ent,"red")) is error,"missing spawn state"); count = count+1
  spawn.create(level,""); level.maxclients = 65
  require(try(teamChanges.setTeam(level,ent,"red")) is error,"invalid team client limit"); count = count+1
  level.maxclients = 4
  require(try(teamChanges.setTeam(level,ent,decode(bytes([114,0,100])))) is error,"embedded NUL request"); count = count+1
  gameCvars.attach(level,"Sep  5 2026"); gameCvars.register(level)
  cv.set2(level.spawner.cvars,"g_teamForceBalance","-1",true); gameCvars.update(level)
  require(level.teamForceBalance == -1,"force-balance Cvar refresh"); count = count+1
  level.entities[1].client = level.clients[1]; level.clients[1].connected = 2; level.clients[1].team = 1
  level.entities[2].client = level.clients[2]; level.clients[2].connected = 1; level.clients[2].team = 1; level.spawner.gametype = 3
  require(try(teamChanges.setTeam(level,ent,"red")) is error,"balance rejection delivery"); count = count+1
  level.serverCommandFn = quietCommand; level.clients[0].team = 3; level.clients[0].losses = 17
  teamChanges.commandTeam(level,ent,["team","red"])
  require(level.clients[0].team == 3 and level.clients[0].switchTeamTime == 5000,"denied change consumes cooldown"); count = count+1
  level.clients[0].connected = 0
  require(try(clientDisconnect.disconnect(level,0)) is error,"disconnect log delivery"); count = count+1
  level.gameLogFn = quietLog; ent.r.svFlags = 8
  require(try(clientDisconnect.disconnect(level,0)) is error and not ent.inuse and level.clients[0].connected == 0,"bot shutdown remains explicit after cleanup"); count = count+1
  print "PASS: "+str(count)+" team change runtime contracts"; return 0
end function

function runFollowAction(level,kind,slot,p0,request)
  switch kind
    case 7
      found = followCommands.clientNumber(level,level.entities[slot],request); words(level.context,[224,found])
    end case
    case 8
      args = array(p0,"follow"); if p0 > 1 then args[1] = request end if
      followCommands.follow(level,level.entities[slot],args)
    end case
    case 9
      followCommands.cycle(level,level.entities[slot],p0)
    end case
    case 10
      tournament.addPlayer(level)
    end case
    case 11
      tournament.removeLoser(level)
    end case
    case 12
      tournament.removeWinner(level)
    end case
    case 13
      tournament.adjustScores(level)
    end case
    case 14
      tournament.check(level)
    end case
    case 15
      cmd = pmove.Command(p0,[0,0,0],textnum.atoi(request),0,0,0,0); clientActive.spectatorThink(level,level.entities[slot],cmd)
    end case
    case 16
      clean = followCommands.sanitize(request); word(level.context,223); textWord(level.context,clean)
    end case
    case 17
      level.numPlayingClients = p0
    end case
    case 18
      level.warmup = p0; level.warmupCvarModificationCount = textnum.atoi(request)
    end case
    case default
      return error(499,"Invalid follow action")
    end case
  end switch
  return void
end function
function followContracts(world)
  level = game.create(world); ent = level.entities[0]; count = 0
  require(try(followCommands.follow(level,ent,["follow"])) is error,"unbound follow"); count = count+1
  game.bindClient(level,ent,level.clients[0]); client = ent.client; client.spectatorState = 2; client.team = 3
  require(try(followCommands.cycle(level,ent,1)) is error,"missing spawn state"); count = count+1
  spawn.create(level,"")
  require(try(followCommands.sanitize(decode(bytes([65,27])))) is error,"trailing ESC"); count = count+1
  require(try(followCommands.sanitize(decode(bytes([65,0,66])))) is error,"embedded NUL"); count = count+1
  require(try(followCommands.clientNumber(level,ent,decode(bytes(1024,65)))) is error,"oversized name buffer"); count = count+1
  require(try(followCommands.cycle(level,ent,1)) is error,"zero client range"); count = count+1
  level.maxclients = 4; client.spectatorClient = 0
  require(followCommands.cycle(level,ent,1) == void and client.spectatorClient == 0,"empty finite cycle preserves state"); count = count+1
  for each start in [-2147483648,-2,-1,4,2147483647]
    for each direction in [-1,1]
      client.spectatorClient = start
      require(try(followCommands.cycle(level,ent,direction)) is error and client.spectatorClient == start,"native endless cycle bounded"); count = count+1
    end for
  end for
  level.maxclients = 65
  require(try(followCommands.cycle(level,ent,1)) is error,"invalid client range"); count = count+1
  require(try(tournament.addPlayer(level)) is error,"invalid queue range"); count = count+1
  level.maxclients = 4; level.spawner.gametype = 1; client.team = 0; client.losses = 2147483647
  require(try(followCommands.cycle(level,ent,0)) is error and client.losses == -2147483648,"loss before direction error"); count = count+1
  level.numPlayingClients = 2; level.sortedClients[1] = 64
  require(try(tournament.removeLoser(level)) is error,"invalid loser slot"); count = count+1
  level.sortedClients[0] = -1
  require(try(tournament.adjustScores(level)) is error,"invalid winner slot"); count = count+1
  level.numPlayingClients = 0; level.intermissiontime = 1; level.maxclients = 65
  require(tournament.addPlayer(level) == void,"intermission guard before queue"); count = count+1
  print "PASS: "+str(count)+" follow runtime contracts"; return 0
end function

function runIntermissionAction(level,kind,slot,p0,request)
  ent = level.entities[slot]
  switch kind
    case 19
      intermissionFlow.moveClient(level,ent)
    end case
    case 20
      intermissionFlow.begin(level)
    end case
    case 21
      intermissionFlow.exitLevel(level)
    end case
    case 22
      scores.checkExitRules(level)
    end case
    case 23
      scores.checkIntermissionExit(level)
    end case
    case 24
      scores.calculateRanks(level)
    end case
    case 25
      level.maxclientsCvar = p0
    end case
    case 26
      level.clients[slot].readyToExit = p0 != 0
    end case
    case 27
      level.restarted = p0 != 0; level.changemap = request
      if request == "<null>" then level.changemap = void end if
    end case
    case 28
      level.intermissionQueued = p0
    end case
    case 29
      clientSpawn.spawn(level,ent,deaths.playerDie)
    end case
    case 30
      level.entities[71].inuse = p0 != 0
    end case
    case 31
      level.entities[71].target = request; level.entities[70].targetname = void
      if request == "" then level.entities[71].target = void end if
      if p0 != 0 then level.entities[70].targetname = request end if
    end case
    case 32
      level.intermissiontime = p0
    end case
    case 33
      level.intermission_origin = [-12.5,33.25,99.75]; level.intermission_angle = [8.5,-179.25,11.5]
      ent.s.eFlags = 0x712; ent.s.eType = 12; ent.s.modelindex = 17; ent.s.loopSound = 45; ent.s.event = 123
      ent.s.eventParm = 46; ent.s.otherEntityNum = 12; ent.s.frame = 19; ent.s.powerups = 0x1234; ent.r.contents = 0x02000002
      ent.client.ps.eFlags = 0x10123; ent.client.ps.powerups[0] = 37; ent.client.ps.powerups[15] = 2147483647
      ent.client.ps.loopSound = 333; ent.client.ps.externalEvent = 77; ent.client.ps.eventSequence = 9
      ent.client.ps.events = [3,4]; ent.client.ps.eventParms = [5,6]
    end case
    case 34
      clientSpawn.clientBegin(level,slot)
    end case
    case 35
      clientSpawn.respawn(level,ent)
    end case
    case 36
      level.timelimit = p0; level.fraglimit = textnum.atoi(request)
    end case
    case default
      return error(499,"Invalid intermission action")
    end case
  end switch
  return void
end function
function intermissionContractLevel(world)
  level = game.create(world); spawn.create(level,""); level.maxclients = 0; level.maxclientsCvar = 0
  spot(level,64,"info_player_intermission",[5.0,15.0,25.0],[10.0,20.0,30.0]); level.num_entities = 65; level.time = 1234
  return level
end function
function intermissionContracts(world)
  count = 0; level = game.create(world); ent = level.entities[0]
  require(try(intermissionFlow.moveClient(level,void)) is error,"NULL intermission client"); count = count+1
  require(try(intermissionFlow.moveClient(level,ent)) is error,"unbound intermission client"); count = count+1
  game.bindClient(level,ent,level.clients[0])
  require(intermissionFlow.moveClient(level,ent) == void and ent.client.ps.pm_type == c.PM_INTERMISSION,"move requires no spawn context"); count = count+1
  require(try(intermissionFlow.begin(level)) is error,"begin requires spawn context"); count = count+1
  level.intermissiontime = 5
  require(intermissionFlow.begin(level) == void and level.intermissiontime == 5,"already active guard precedes spawn context"); count = count+1
  level = intermissionContractLevel(world); level.intermissiontime = 11; level.changemap = "pending"
  require(try(intermissionFlow.exitLevel(level)) is error and level.intermissiontime == 11 and level.changemap == "pending","bot end-match hook precedes exit mutations"); count = count+1
  level.botLifecycleState = botLifecycle.create(level.spawner.cvars); level.botLifecycleState.interbreed = true
  level.botLifecycleState.interbreedcycle.integer = 2; level.consoleCommandFn = followConsole; level.cvarSetFn = intermissionCvar
  require(intermissionFlow.exitLevel(level) == void and level.intermissiontime == 0 and level.botLifecycleState.interbreedMatchCount == 1,"ExitLevel advances attached bot lifecycle default"); count = count+1
  level = intermissionContractLevel(world); level.intermissiontime = 11
  level.botInterbreedEndMatchFn = intermissionBot
  require(try(intermissionFlow.exitLevel(level)) is error and level.intermissiontime == 11,"exit requires console delivery"); count = count+1
  level.consoleCommandFn = followConsole; level.teamScores[1] = 77
  require(try(intermissionFlow.exitLevel(level)) is error and level.intermissiontime == 0 and level.teamScores[1] == 0,"session delivery follows score reset"); count = count+1
  level.cvarSetFn = intermissionCvar
  require(intermissionFlow.exitLevel(level) == void and sessions.cvarText(level,"session") == "0","empty normal exit writes world session"); count = count+1
  level = intermissionContractLevel(world); level.spawner.gametype = 1; level.restarted = true
  require(try(intermissionFlow.exitLevel(level)) is error,"restarted tournament still needs bot hook"); count = count+1
  level.botInterbreedEndMatchFn = intermissionBot
  require(intermissionFlow.exitLevel(level) == void,"restarted tournament needs no console delivery"); count = count+1
  for each limit in [-1,65]
    level = intermissionContractLevel(world); level.maxclients = limit
    require(try(intermissionFlow.begin(level)) is error,"invalid begin client range"); count = count+1
    level = intermissionContractLevel(world); level.maxclientsCvar = limit
    level.botInterbreedEndMatchFn = intermissionBot; level.consoleCommandFn = followConsole; level.cvarSetFn = intermissionCvar
    require(try(intermissionFlow.exitLevel(level)) is error,"invalid exit Cvar client range"); count = count+1
  end for
  level = intermissionContractLevel(world); level.spawner.gametype = 2
  require(try(intermissionFlow.begin(level)) is error and level.intermissiontime == level.time,"singleplayer update hook after intermission time"); count = count+1
  level.intermissiontime = 0; level.updateTournamentInfoFn = intermissionUpdate
  require(try(intermissionFlow.begin(level)) is error,"singleplayer victory-pad hook"); count = count+1
  level.intermissiontime = 0; level.spawnVictoryPadsFn = intermissionPads
  require(intermissionFlow.begin(level) == void and level.intermission_origin[2] == 25.0,"empty singleplayer intermission with explicit hooks"); count = count+1
  print "PASS: "+str(count)+" intermission runtime contracts"; return 0
end function

function runCommandAction(level,kind,slot,p0,request,argv)
  switch kind
    case 40
      clientCommands.command(level,slot,argv)
    end case
    case 41
      level.cheats = p0; level.dedicated = textnum.atoi(request)
    end case
    case 42
      location = game.initEntity(level.entities[82]); location.classname = "target_location"
      origin = level.entities[slot].r.currentOrigin
      location.s.origin = [origin[0],origin[1],origin[2]]; location.r.currentOrigin = [origin[0],origin[1],origin[2]]
      location.count = p0; location.message = request; location.nextTrain = void
      level.locationHead = location; level.num_entities = 83
    end case
    case 43
      level.allowVote = p0; cv.set2(level.spawner.cvars,"nextmap",request,true)
    end case
    case 44
      level.clients[slot].lastkilled_client = p0; enemy = textnum.atoi(request); level.entities[slot].enemy = void
      if enemy != -1 then level.entities[slot].enemy = level.entities[enemy] end if
    end case
    case 45
      level.clients[slot].lasthurt_mod = p0; level.clients[slot].rewardTime = textnum.atoi(request)
    end case
    case 46
      value = n.f32(p0); level.entities[slot].s.origin = [value,value,value]
    end case
    case default
      return error(499,"Invalid client command action")
    end case
  end switch
  return void
end function

function commandContractLevel(world)
  level = game.create(world); spawn.create(level,""); level.maxclients = 2
  ent = game.initEntity(level.entities[0]); game.bindClient(level,ent,level.clients[0])
  ent.health = 100; ent.client.connected = 2; ent.client.ps.stats[c.STAT_HEALTH] = 100
  ent.client.ps.stats[c.STAT_MAX_HEALTH] = 100
  return level
end function
function commandContractUserinfo(level,slot)
  return "\\name\\Contract\\teamtask\\1"
end function
function commandsContracts(world)
  count = 0; level = game.create(world)
  for each slot in [-1,64]
    require(try(clientCommands.command(level,slot,["stats"])) is error,"router slot bound"); count = count+1
  end for
  require(clientCommands.command(level,0,[decode(bytes([0]))]) == void,"NULL client returns before reading argv"); count = count+1
  level = commandContractLevel(world); ent = level.entities[0]
  require(clientCommands.command(level,0,["stats"]) == void,"original stats body is empty"); count = count+1
  require(try(clientCommands.command(level,0,["unknown"])) is error,"unknown command requires delivery"); count = count+1
  require(try(commandArgs.argument(["a"],0,0)) is error,"argument requires native storage"); count = count+1
  require(try(commandArgs.argument([decode(bytes([65,0,66]))],0,1024)) is error,"argument rejects embedded NUL"); count = count+1
  require(commandArgs.argument(["a"],-1,1024) == "" and commandArgs.argument(["a"],1,1024) == "","missing argv is empty"); count = count+1
  require(commandArgs.concat(["a b","","c"],0) == "a b  c","concat preserves engine token boundaries"); count = count+1
  require(commandArgs.concat(["say",decode(bytes(1023,120))],1) == "","concat rejects first token at 1023"); count = count+1
  require(commandArgs.concat(["say","a",decode(bytes(1021,120))],1) == "a ","concat preserves separator before rejected token"); count = count+1
  require(len(bytes(commandArgs.concat(["say",decode(bytes(1022,120)),""],1))) == 1023,"concat permits final separator at 1023"); count = count+1
  require(try(clientCommands.command(level,0,["say","hello"])) is error,"chat log delivery is required first"); count = count+1
  level.gameLogFn = quietLog
  require(try(clientCommands.command(level,0,["say","hello"])) is error,"chat recipient requires server delivery"); count = count+1
  level.serverCommandFn = quietCommand; level.dedicated = 1
  require(try(clientCommands.command(level,0,["say","hello"])) is error,"dedicated chat print required"); count = count+1
  require(try(clientCommands.command(level,0,["vsay","hello"])) is error,"dedicated voice print required"); count = count+1
  level.gamePrintFn = quietLog
  require(clientCommands.command(level,0,["say","hello"]) == void,"chat with explicit host sinks"); count = count+1
  level.dedicated = 0; level.maxclients = 65
  require(try(clientCommands.command(level,0,["vsay","hello"])) is error,"voice recipient range bound"); count = count+1
  level.maxclients = 2
  require(try(clientCommands.command(level,0,["gc","1","7"])) is error,"native one-past-end game order rejected"); count = count+1
  level.spawner.gametype = 3
  require(try(clientCommands.command(level,0,["gc","1","0"])) is error,"team tell NULL target client rejected"); count = count+1
  ent.client.lastkilled_client = 1024
  require(try(clientCommands.command(level,0,["vtaunt"])) is error and ent.client.lastkilled_client == 1024,"native taunt pointer outside entity storage rejected"); count = count+1
  level = commandContractLevel(world); ent = level.entities[0]
  require(try(clientCommands.command(level,0,["god"])) is error and ent.flags == 0,"cheat rejection requires delivery before mutation"); count = count+1
  level.cheats = 1
  require(try(clientCommands.command(level,0,["god"])) is error and (ent.flags & 16) != 0,"god toggle occurs before delivery"); count = count+1
  require(try(clientCommands.command(level,0,["noclip"])) is error and ent.client.noclip,"noclip toggle occurs before delivery"); count = count+1
  level.serverCommandFn = quietCommand
  ent.health = 25; ent.client.ps.stats[c.STAT_HEALTH] = 25
  require(clientCommands.command(level,0,["give","health"]) == void and ent.health == 100 and ent.client.ps.stats[c.STAT_HEALTH] == 25,"give health leaves player stat until normal game synchronization"); count = count+1
  awardNames = ["excellent","impressive","gauntletaward","defend","assist"]
  awardSlots = [c.PERS_EXCELLENT_COUNT,c.PERS_IMPRESSIVE_COUNT,c.PERS_GAUNTLET_FRAG_COUNT,c.PERS_DEFEND_COUNT,c.PERS_ASSIST_COUNT]
  for index = 0 to 4
    ent.client.ps.persistant[awardSlots[index]] = 2147483647
    clientCommands.command(level,0,["give",awardNames[index]])
    require(ent.client.ps.persistant[awardSlots[index]] == -2147483648,"award int32 overflow"); count = count+1
  end for
  require(clientCommands.command(level,0,["teamtask"]) == void,"teamtask argc guard before host reads"); count = count+1
  require(try(clientCommands.command(level,0,["teamtask","3"])) is error,"teamtask requires userinfo read"); count = count+1
  level.userinfoFn = commandContractUserinfo
  require(try(clientCommands.command(level,0,["teamtask","3"])) is error,"teamtask requires userinfo storage"); count = count+1
  require(commandInfo.removeKey("\\A\\1\\a\\2\\a\\3","a") == "\\A\\1\\a\\3","Info remove is case sensitive and removes only first match"); count = count+1
  require(commandInfo.removeKey("name\\Ranger\\dangling","dangling") == "name\\Ranger\\dangling","Info remove preserves dangling key"); count = count+1
  require(commandInfo.setValue("\\a\\1\\a\\2","a","",void,void) == "\\a\\2","Info empty value deletes only first existing pair"); count = count+1
  require(commandInfo.setValue("\\a\\1","a","2",void,void) == "\\a\\2","Info value prepends updated pair"); count = count+1
  for each bad in ["a\\b","a;b","a\"b"]
    require(commandInfo.setValue("\\a\\1",bad,"2",void,void) == "\\a\\1","Info rejected key preserves original"); count = count+1
  end for
  require(try(commandInfo.setValue(decode(bytes(1024,120)),"a","1",void,void)) is error,"Info oversize input rejected"); count = count+1
  require(try(commandInfo.setValue("\\x\\"+decode(bytes(1017,120)),"k","v",void,void)) is error,"Info exact 1024 byte native NUL overflow rejected"); count = count+1
  require(try(commandInfo.setValue("","k",decode(bytes(31998,120)),void,void)) is error,"Info native format scratch overflow rejected"); count = count+1
  print "PASS: "+str(count)+" client command runtime contracts"; return 0
end function

function weaponsContracts(world)
  count = 0; level = game.create(world); ent = level.entities[0]
  require(try(weapons.fire(level,ent)) is error,"FireWeapon requires bound client"); count = count+1
  require(try(weapons.checkGauntlet(level,ent)) is error,"gauntlet check requires bound client"); count = count+1
  require(try(weapons.grapple(level,ent)) is error,"grapple requires bound client"); count = count+1
  require(weapons.gauntlet(level,void) == void,"original Weapon_Gauntlet body is empty"); count = count+1
  result = [0.0,0.0,0.0]
  require(try(weapons.calcMuzzlePoint(ent,[1.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],result)) is error,"muzzle requires bound client"); count = count+1
  state = weaponState.get(level); state.quadFactor = 3.0
  require(weaponState.get(level) == state and weaponState.get(game.create(world)).quadFactor == 0.0,"weapon statics persist per game instance"); count = count+1
  game.bindClient(level,ent,level.clients[0]); ent.client.ps.viewheight = 26
  ent.s.pos.trBase = [-1.5,2.75,10.25]
  weapons.calcMuzzlePoint(ent,[0.5,-0.25,0.125],[100.0,100.0,100.0],[-100.0,-100.0,-100.0],result)
  require(result[0] == 5.0 and result[1] == 0.0 and result[2] == 38.0,"muzzle adds height and forward then truncates"); count = count+1
  reference = [result[0],result[1],result[2]]
  weapons.calcMuzzlePointOrigin(ent,[999.0,-999.0,123.0],[0.5,-0.25,0.125],[0.0,0.0,0.0],[0.0,0.0,0.0],result)
  require(result[0] == reference[0] and result[1] == reference[1] and result[2] == reference[2],"muzzle origin argument is ignored"); count = count+1
  weapons.bounceProjectile([1.0,2.0,3.0],[1.0,2.0,3.0],[0.0,0.0,1.0],result)
  require(result[0] == 1.0 and result[1] == 2.0 and result[2] == 3.0,"zero bounce retains impact"); count = count+1
  ent.s.weapon = 0; ent.client.accuracy_shots = 2147483647
  require(weapons.fire(level,ent) == void and ent.client.accuracy_shots == -2147483648,"unknown weapon still counts shots with int32 wrap"); count = count+1
  ent.s.weapon = 2; ent.client.accuracy_shots = 0
  require(try(weapons.fire(level,ent)) is error and ent.client.accuracy_shots == 1,"machinegun spawn-state boundary follows shot and aim mutation"); count = count+1
  ent.s.weapon = 0; ent.client.ps.events[0] = c.EV_FIRE_WEAPON; ent.client.ps.eventSequence = 1
  clientActive.clientEvents(level,ent,0)
  require(ent.client.accuracy_shots == 2 and level.fireWeaponFn == void,"ClientEvents uses real FireWeapon by default"); count = count+1
  require(try(weaponHitscan.hitscanEntity(level,-1)) is error,"negative trace entity rejected"); count = count+1
  require(try(weaponHitscan.hitscanEntity(level,1024)) is error,"trace entity outside native storage rejected"); count = count+1
  print "PASS: "+str(count)+" weapon runtime contracts"; return 0
end function
