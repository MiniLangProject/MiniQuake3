// SPDX-License-Identifier: GPL-2.0-or-later
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
  // No Begin/death/item/rank/userinfo overrides: all those game routines are real.
  return void
end function
function main(argv)
  if len(argv) < 3 then return error(499,"Expected map, input and oracle output") end if
  world = cm.loadWorld(fs.readAllBytes(argv[0]),true); if len(argv) > 3 then return contracts(world) end if
  reader = Reader(fs.readAllBytes(argv[1]),0); check = Check(fs.readAllBytes(argv[2]),0,0,0,0,array(64,""),"")
  level = game.create(world); configure(level,reader,check); count = readInt(reader)
  for index = 0 to count-1
    kind = readInt(reader); level.time = readInt(reader); slot = readInt(reader); p0 = readInt(reader); request = readString(reader)
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
        return error(499,"Invalid team change action")
      end case
    end switch
    snapshot(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete team change stream") end if
  print "PASS: "+str(check.actions)+" team change actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects"; return 0
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
