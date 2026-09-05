// SPDX-License-Identifier: GPL-2.0-or-later
// Verbatim Baseq3 ClientSpawn versus the MiniLang orchestration.
import mq3.game.client_spawn as clientSpawn
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.spawn as spawn
import mq3.game.bodies as bodies
import mq3.game.deaths as deaths
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Check
  expected
  offset
  words
  scenario
  cmdAngles
  cmdWeapon
end struct
function checkWord(check,value)
  if check.offset+4 > len(check.expected) then return error(497,"Unexpected ClientSpawn output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(497,"ClientSpawn mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1
  return void
end function
function checkWords(check,values)
  for each value in values
    checkWord(check,value)
  end for
  return void
end function
function checkVector(check,value)
  for each part in value
    checkWord(check,n.floatBits(part))
  end for
  return void
end function
function bool(value)
  if value then return 1 end if
  return 0
end function
function checkString(check,value)
  data = bytes(value); checkWord(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(497,"ClientSpawn string mismatch") end if
    check.offset = check.offset+1
  end for
  return void
end function
function event(level,kind,slot)
  checkWords(level.context,[60,kind,slot])
  return void
end function
function observe(level,kind,ent)
  if level.context == void then return void end if
  if kind != 1 then return error(497,"Unexpected ClientSpawn spatial event") end if
  return event(level,3,ent.slot)
end function
function userinfo(level,slot)
  event(level,1,slot); return "\\handicap\\"+str(level.context.scenario)
end function
function usercmd(level,slot,client)
  event(level,2,slot); client.cmdAngles = [level.context.cmdAngles[0],level.context.cmdAngles[1],level.context.cmdAngles[2]]
  client.cmdServerTime = 0; client.cmdButtons = 0x1234; client.cmdWeapon = level.context.cmdWeapon
  client.cmdForwardmove = -17; client.cmdRightmove = 33; client.cmdUpmove = -4
  return void
end function
function think(level,slot)
  event(level,6,slot); client = level.clients[slot]
  client.ps.origin[0] = n.fadd(client.ps.origin[0],1.25); client.ps.commandTime = n.add32(client.ps.commandTime,7)
  return void
end function
function endFrame(level,ent)
  event(level,7,ent.slot); ent.client.ps.loopSound = 321
  return void
end function
function intermission(level,ent)
  event(level,5,ent.slot); ent.client.ps.pm_type = c.PM_INTERMISSION; ent.client.ps.origin = [level.intermission_origin[0],level.intermission_origin[1],level.intermission_origin[2]]
  return void
end function
function targetUse(level,self,other,activator)
  event(level,4,other.slot); activator.client.ps.stats[c.STAT_WEAPONS] = activator.client.ps.stats[c.STAT_WEAPONS] | (1 << c.WP_RAILGUN)
  return void
end function
function die(level,self,inflictor,attacker,damage,mod)
  return void
end function
function contractUserinfo(level,slot)
  return "\\handicap\\100"
end function
function contractUsercmd(level,slot,client)
  return void
end function
function contractThink(level,slot)
  return void
end function
function contractEndFrame(level,ent)
  return void
end function
function spot(level,slot,name,origin,angles,flags)
  ent = game.initEntity(level.entities[slot]); ent.classname = name; ent.flags = flags; ent.target = "spawn_target"
  ent.s.origin = origin; ent.s.angles = angles
  return ent
end function
function occupant(level,slot,origin)
  ent = game.initEntity(level.entities[slot]); game.bindClient(level,ent,level.clients[slot]); ent.s.origin = origin; ent.r.currentOrigin = origin
  ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.contents = 0x02000000; ent.takedamage = false; game.link(level,ent)
  return ent
end function
function configure(level,input,check)
  scenario = n.readI32(input,0); s = spawn.create(level,""); s.gametype = n.readI32(input,4)
  level.time = n.readI32(input,32); level.intermissiontime = n.readI32(input,28); level.inactivity = n.readI32(input,36)
  check.scenario = n.readI32(input,40); check.cmdAngles = [n.readI32(input,64),n.readI32(input,68),n.readI32(input,72)]; check.cmdWeapon = n.readI32(input,76)
  spot(level,64,"info_player_deathmatch",[0.0,0.0,64.0],[10.0,20.0,30.0],0); level.entities[64].spawnflags = 1
  spot(level,65,"info_player_deathmatch",[1000.0,0.0,64.0],[-15.0,180.0,1.0],0)
  spot(level,66,"info_player_deathmatch",[-500.0,300.0,96.0],[45.0,-90.0,5.0],0)
  spot(level,67,"team_CTF_redplayer",[100.0,200.0,80.0],[1.0,91.0,2.0],0)
  spot(level,68,"team_CTF_redspawn",[110.0,210.0,90.0],[3.0,93.0,4.0],0)
  spot(level,69,"team_CTF_blueplayer",[-100.0,-200.0,100.0],[5.0,-95.0,6.0],0)
  spot(level,70,"team_CTF_bluespawn",[-110.0,-210.0,110.0],[7.0,-97.0,8.0],0)
  spot(level,71,"info_player_intermission",[25.0,35.0,512.0],[9.0,135.0,11.0],0)
  if scenario == 1 then level.entities[64].flags = 0x4000 end if
  if scenario == 2 then level.entities[64].flags = 0x2000 end if
  if scenario == 3 then occupant(level,1,[0.0,0.0,64.0]); occupant(level,2,[1000.0,0.0,64.0]); occupant(level,3,[-500.0,300.0,96.0]) end if
  target = game.initEntity(level.entities[80]); target.classname = "target_give"; target.targetname = "spawn_target"; target.use = targetUse
  level.num_entities = 81

  ent = game.initEntity(level.entities[0]); client = level.clients[0]; game.bindClient(level,ent,client)
  ent.r.svFlags = 0; if n.readI32(input,12) != 0 then ent.r.svFlags = 8 end if
  ent.s.eFlags = n.readI32(input,48) | 0x200
  client.team = n.readI32(input,8); client.localClient = n.readI32(input,16) != 0; client.initialSpawn = n.readI32(input,20) != 0; client.teamStateState = n.readI32(input,24)
  client.connected = 2; client.predictItemPickup = true; client.maxHealth = 88; client.enterTime = 77
  client.teamStateLocation = 4; client.captures = 5; client.basedefense = 6; client.carrierdefense = 7; client.flagrecovery = 8; client.fragcarrier = 9; client.assists = 10
  client.lasthurtcarrier = 11.5; client.lastreturnedflag = 12.5; client.flagsince = 13.5; client.lastfraggedcarrier = 14.5
  client.spectatorTime = 15; client.spectatorState = 2; client.spectatorClient = 2; client.wins = 16; client.losses = 17; client.teamLeader = true; client.netname = "SpawnTester"
  client.ps.eFlags = n.readI32(input,44); client.ps.ping = n.readI32(input,52); client.ps.eventSequence = n.readI32(input,56)
  for index = 0 to 15
    client.ps.persistant[index] = n.add32(n.readI32(input,60),index)
  end for
  client.ps.origin = [n.bitsFloat(n.readI32(input,88)),n.bitsFloat(n.readI32(input,92)),n.bitsFloat(n.readI32(input,96))]
  client.accuracy_hits = n.readI32(input,80); client.accuracy_shots = n.readI32(input,84)
  client.readyToExit = true; client.noclip = true; client.lastCmdTime = 101; client.buttons = 102; client.oldbuttons = 103; client.latched_buttons = 104; client.oldOrigin = [1.0,2.0,3.0]
  client.damage_armor = 105; client.damage_blood = 106; client.damage_knockback = 107; client.damage_from = [4.0,5.0,6.0]; client.damage_fromWorld = true
  client.accurateCount = 108; client.lastkilled_client = 109; client.lasthurt_client = 110; client.lasthurt_mod = 111; client.respawnTime = 112; client.inactivityTime = 113
  client.inactivityWarning = true; client.rewardTime = 114; client.airOutTime = 115; client.lastKillTime = 116; client.fireHeld = true; client.hook = level.entities[90]; client.switchTeamTime = 117; client.timeResidual = 118
  level.context = check; level.observeFn = observe; level.userinfoFn = userinfo; level.usercmdFn = usercmd; level.clientThinkFn = think; level.clientEndFrameFn = endFrame; level.moveIntermissionFn = intermission
  return ent
end function
function finalState(check,ent)
  cl = ent.client; checkWord(check,70); checkWords(check,ps.words(cl.ps)); checkWords(check,es.words(ent.s))
  checkWords(check,[ent.health,ent.flags,bool(ent.takedamage),bool(ent.inuse),ent.r.contents,ent.clipmask,ent.waterlevel,ent.watertype,bool(ent.r.linked),bool(ent.die == die)]); checkString(check,ent.classname)
  checkVector(check,ent.r.mins); checkVector(check,ent.r.maxs); checkVector(check,ent.r.currentOrigin)
  checkWord(check,cl.team); checkWords(check,cl.cmdAngles); checkWords(check,[cl.cmdServerTime,cl.cmdButtons,cl.cmdWeapon,cl.cmdForwardmove,cl.cmdRightmove,cl.cmdUpmove])
  checkWords(check,[cl.accuracy_hits,cl.accuracy_shots,cl.connected,bool(cl.localClient),bool(cl.initialSpawn),bool(cl.predictItemPickup),cl.maxHealth,cl.enterTime,cl.teamStateState])
  checkWords(check,[cl.teamStateLocation,cl.captures,cl.basedefense,cl.carrierdefense,cl.flagrecovery,cl.fragcarrier,cl.assists])
  checkVector(check,[cl.lasthurtcarrier,cl.lastreturnedflag,cl.flagsince]); checkWord(check,n.floatBits(cl.lastfraggedcarrier))
  checkWords(check,[cl.spectatorTime,cl.spectatorState,cl.spectatorClient,cl.wins,cl.losses,bool(cl.teamLeader),cl.lastkilled_client,cl.respawnTime,cl.inactivityTime,cl.airOutTime])
  checkWords(check,[bool(cl.readyToExit),bool(cl.noclip),cl.lastCmdTime,cl.buttons,cl.oldbuttons,cl.latched_buttons]); checkVector(check,cl.oldOrigin)
  checkWords(check,[cl.damage_armor,cl.damage_blood,cl.damage_knockback]); checkVector(check,cl.damage_from)
  checkWords(check,[bool(cl.damage_fromWorld),cl.accurateCount,bool(cl.inactivityWarning),cl.rewardTime,cl.lastKillTime,bool(cl.fireHeld),bool(cl.hook != void),cl.switchTeamTime,cl.timeResidual])
  return void
end function
function requireContract(condition,label)
  if not condition then return error(497,"Failed ClientSpawn contract: "+label) end if
  return void
end function
function contracts(world)
  level = game.create(world); state = spawn.create(level,""); state.gametype = 0
  cl = game.createClient(ps.create(),0,[0,0,0])
  requireContract(not cl.localClient and not cl.initialSpawn and cl.maxHealth == 0 and cl.teamStateState == 0,"persistent defaults")
  requireContract(cl.cmdServerTime == 0 and cl.cmdButtons == 0 and cl.inactivityTime == 0 and cl.airOutTime == 0,"command and timer defaults")
  requireContract(clientSpawn.infoValue("\\name\\Ranger\\handicap\\75","handicap") == "75","userinfo lookup")
  requireContract(clientSpawn.infoValue("\\handicap\\25\\handicap\\90","handicap") == "25","userinfo first key wins")
  requireContract(clientSpawn.infoValue("\\name\\Ranger","handicap") == "","missing userinfo key")
  ent = game.initEntity(level.entities[0]); ent.client = cl
  caught = try(clientSpawn.spawn(level,ent,die)); requireContract(caught is error,"persistent slot identity")
  game.bindClient(level,ent,cl); cl.team = c.TEAM_SPECTATOR
  spot(level,64,"info_player_intermission",[0.0,0.0,0.0],[0.0,0.0,0.0],0); level.num_entities = 65
  caught = try(clientSpawn.spawn(level,ent,die)); requireContract(caught is error,"userinfo boundary")
  level2 = game.create(world); level2.observeFn = void; state2 = spawn.create(level2,""); bodies.initQueue(level2)
  ent = game.initEntity(level2.entities[0]); cl = level2.clients[0]; game.bindClient(level2,ent,cl); cl.team = c.TEAM_FREE
  ent.inuse = true; ent.s.number = 0; ent.s.eType = c.ET_PLAYER; ent.s.origin = [10.0,20.0,30.0]; ent.r.currentOrigin = [10.0,20.0,30.0]
  spawnPoint = game.spawn(level2); spawnPoint.classname = "info_player_deathmatch"; spawnPoint.s.origin = [100.0,200.0,300.0]
  level2.time = 1000; level2.userinfoFn = contractUserinfo; level2.usercmdFn = contractUsercmd; level2.clientThinkFn = contractThink; level2.clientEndFrameFn = contractEndFrame
  deaths.respawn(level2,ent)
  requireContract(ent.classname == "player" and ent.client.ps.origin[2] == 309.0 and level2.entities[73].s.eType == c.ET_EVENTS+c.EV_PLAYER_TELEPORT_IN,"respawn uses ClientSpawn by default")
  print "PASS: 8 ClientSpawn runtime contracts"
  return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args) > 3 and args[3] == "--contracts" then return contracts(world) end if
  input = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2]); check = Check(expected,0,0,0,[0,0,0],0)
  level = game.create(world); ent = configure(level,input,check)
  clientSpawn.spawn(level,ent,die); finalState(check,ent)
  if check.offset != len(expected) then return error(497,"Missing ClientSpawn output at "+str(check.offset)) end if
  print "PASS: "+str(check.words)+" exact ClientSpawn words"
  return 0
end function
