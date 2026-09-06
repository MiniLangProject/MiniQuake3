// SPDX-License-Identifier: GPL-2.0-or-later
// Verbatim Baseq3 ClientThink helpers and orchestration versus the native body.
import mq3.game.client_active as active
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.entitystate as es
import mq3.game.movement as movement
import mq3.game.pmove as pmove
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Check
  expected
  offset
  words
end struct
function checkWord(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected ClientThink output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"ClientThink mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
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
function checkString(check,value)
  data = bytes(value); checkWord(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"ClientThink string mismatch") end if
    check.offset = check.offset+1
  end for
  return void
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function observe(level,kind,ent)
  if level.context == void then return error(499,"Unexpected contract observe") end if
  if kind == 3 then checkWords(level.context,[90,0,level.num_entities])
  else if kind == 1 then checkWords(level.context,[90,1,ent.slot])
  else if kind == 2 then checkWords(level.context,[90,2,ent.slot])
  else return error(499,"Unexpected ClientThink spatial effect") end if
  return void
end function
function usercmd(level,slot,client)
  if level.context == void then return error(499,"Unexpected contract usercmd") end if
  checkWords(level.context,[90,3,slot]); return void
end function
function serverCommand(level,slot,message)
  if level.context == void then return error(499,"Unexpected contract server command") end if
  checkWords(level.context,[90,4,slot]); checkString(level.context,message); return void
end function
function dropClient(level,slot,message)
  if level.context == void then return error(499,"Unexpected contract drop") end if
  checkWords(level.context,[90,5,slot]); checkString(level.context,message); return void
end function
function gauntlet(level,ent)
  if level.context == void then return error(499,"Unexpected contract gauntlet") end if
  checkWords(level.context,[90,6,ent.slot]); return true
end function
function fire(level,ent)
  if level.context == void then return error(499,"Unexpected contract fire") end if
  checkWords(level.context,[90,7,ent.slot]); return void
end function
function follow(level,ent,direction)
  if level.context == void then return error(499,"Unexpected contract follow") end if
  checkWords(level.context,[90,8,ent.slot,direction]); return void
end function
function botTest(level,origin)
  if level.context == void then return error(499,"Unexpected contract AAS") end if
  checkWords(level.context,[90,9]); checkVector(level.context,origin); return void
end function
function cvarSet(level,key,value)
  if level.context == void then return error(499,"Unexpected contract cvar") end if
  checkWords(level.context,[90,10]); checkString(level.context,key); checkString(level.context,value); return void
end function
function touchCount(level,self,other,trace)
  self.count = self.count+1; return void
end function
function contractImpacts(world)
  current = game.create(world); player = game.initEntity(current.entities[0]); player.r.svFlags = 8; player.touch = touchCount
  first = game.initEntity(current.entities[1]); first.touch = touchCount; second = game.initEntity(current.entities[2])
  move = pmove.create(ps.create(),void,void,void); move.k.touches = [1,1,2]; active.impacts(current,player,move)
  if player.count != 2 or first.count != 1 or second.count != 0 then return error(499,"ClientImpacts duplicate/order contract failed") end if
  return void
end function

function seed(state)
  state.commandTime = 1000; state.pm_type = c.PM_NORMAL; state.origin = [0.0,0.0,64.0]; state.velocity = [0.0,0.0,0.0]
  state.gravity = 800; state.speed = 320; state.groundEntityNum = 1023; state.clientNum = 0
  state.weapon = c.WP_MACHINEGUN; state.weaponstate = c.WEAPON_READY; state.viewheight = 26
  state.stats[c.STAT_HEALTH] = 100; state.stats[c.STAT_MAX_HEALTH] = 100; state.stats[c.STAT_ARMOR] = 25
  state.stats[c.STAT_WEAPONS] = (1 << c.WP_GAUNTLET) | (1 << c.WP_MACHINEGUN)
  for index = 0 to 15
    state.ammo[index] = 10
  end for
  state.ammo[c.WP_GAUNTLET] = -1
  return void
end function
function configure(world,scenario,check)
  level = game.create(world); level.context = check; level.observeFn = observe; level.time = 1050
  level.gravity = 800; level.playerSpeed = 320; level.dmflags = 0; level.inactivity = 0; level.smoothClients = false
  level.forceRespawn = 0; level.synchronousClients = false; level.pmoveFixed = false; level.pmoveMsec = 8
  level.serverCommandFn = serverCommand; level.dropClientFn = dropClient; level.followCycleFn = follow
  level.gauntletAttackFn = gauntlet; level.fireWeaponFn = fire; level.botTestAasFn = botTest; level.cvarSetFn = cvarSet; level.usercmdFn = usercmd
  ent = game.initEntity(level.entities[0]); client = level.clients[0]; game.bindClient(level,ent,client); seed(client.ps)
  ent.s.number = 0; ent.s.eType = c.ET_PLAYER; ent.r.contents = 0x02000000
  ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.currentOrigin = movement.copy(client.ps.origin)
  ent.health = 100; ent.takedamage = true; client.connected = 2; client.team = c.TEAM_FREE
  client.respawnTime = 900; client.inactivityTime = 60000; client.cmdServerTime = 1050; client.cmdWeapon = c.WP_MACHINEGUN
  switch scenario
    case 1
      client.cmdForwardmove = 80; client.cmdRightmove = -20; client.cmdUpmove = 20; client.cmdButtons = 1
    end case
    case 2
      level.intermissiontime = 1; client.ps.eFlags = 0x1100; client.buttons = 4; client.cmdButtons = 5
    end case
    case 3
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 2; client.cmdButtons = 1
    end case
    case 4
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 1; client.cmdForwardmove = 100; client.cmdAngles[1] = 8192
    end case
    case 5
      client.connected = 1
    end case
    case 6
      client.cmdServerTime = 1000
    end case
    case 7
      level.inactivity = 30; client.inactivityTime = 20000; level.time = 10052; client.cmdServerTime = 10052; client.ps.commandTime = 10002
    end case
    case 8
      level.inactivity = 30; client.inactivityTime = 10050; level.time = 10051; client.cmdServerTime = 10051; client.ps.commandTime = 10001
    end case
    case 9
      client.timeResidual = 950; client.ps.powerups[c.PW_REGEN] = 12000; ent.health = 80; client.cmdServerTime = 1250; level.time = 1250
    end case
    case 10
      client.noclip = true; client.ps.powerups[c.PW_HASTE] = 1; client.cmdForwardmove = 64; client.cmdServerTime = 1200; level.time = 1200
    end case
    case 11
      ent.flags = 0x8000
    end case
    case 12
      level.smoothClients = true; client.cmdForwardmove = 32
    end case
    case 13
      level.pmoveFixed = true; level.pmoveMsec = 17; client.cmdServerTime = 1049
    end case
    case 14
      level.pmoveMsec = 7
    end case
    case 15
      ent.health = 0; client.ps.stats[c.STAT_HEALTH] = 0; client.respawnTime = 2000
    end case
    case 16
      client.cmdForwardmove = 40
    end case
    case 17
      ent.r.svFlags = 8; client.cmdForwardmove = 40
    end case
    case 18
      client.ps.weapon = c.WP_GAUNTLET; client.cmdWeapon = c.WP_GAUNTLET; client.cmdButtons = 1
    end case
    case 19
      client.ps.eventSequence = 1; client.ps.events[0] = c.EV_USE_ITEM2; ent.health = 17
    end case
    case 20
      client.ps.eventSequence = 1; client.ps.events[0] = c.EV_FALL_MEDIUM
    end case
    case 21
      level.dmflags = 8; client.ps.eventSequence = 1; client.ps.events[0] = c.EV_FALL_FAR
    end case
    case 22
      client.ps.eventSequence = 1; client.ps.events[0] = c.EV_FIRE_WEAPON
    end case
    case 23
      spot = game.initEntity(level.entities[64]); spot.s.number = 64; spot.classname = "info_player_deathmatch"; spot.s.origin = [256.0,0.0,32.0]
      level.num_entities = 65; client.ps.powerups[c.PW_REDFLAG] = level.time+5500; client.ps.eventSequence = 1; client.ps.events[0] = c.EV_USE_ITEM1
    end case
    case 24
      level.gravity = 800.75; level.playerSpeed = 321.75; client.ps.powerups[c.PW_HASTE] = 1
    end case
    case 25
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 1; level.pmoveFixed = true; level.pmoveMsec = 17
      client.cmdServerTime = 1049; client.cmdForwardmove = 73
    end case
    case 26
      hook = game.initEntity(level.entities[64]); hook.s.number = 64; hook.parent = ent; level.num_entities = 65; client.hook = hook
      client.ps.weapon = c.WP_GRAPPLING_HOOK; client.cmdWeapon = c.WP_GRAPPLING_HOOK
    end case
  end switch
  return [level,ent]
end function
function finalState(check,level,ent)
  client = ent.client; checkWord(check,91); checkWords(check,ps.words(client.ps)); checkWords(check,es.words(ent.s))
  checkVector(check,ent.r.currentOrigin); checkVector(check,ent.r.mins); checkVector(check,ent.r.maxs)
  checkWords(check,[boolean(ent.r.linked),ent.r.linkcount,ent.health,ent.flags,ent.eventTime,ent.waterlevel,ent.watertype,ent.pain_debounce_time])
  checkWords(check,[client.cmdServerTime]); checkWords(check,client.cmdAngles); checkWords(check,[client.cmdButtons,client.cmdWeapon,client.cmdForwardmove,client.cmdRightmove,client.cmdUpmove])
  checkWords(check,[client.lastCmdTime,client.buttons,client.oldbuttons,client.latched_buttons]); checkVector(check,client.oldOrigin)
  checkWords(check,[client.inactivityTime,boolean(client.inactivityWarning),client.timeResidual,boolean(client.fireHeld)])
  hook = -1; if client.hook != void then hook = client.hook.slot end if
  checkWords(check,[hook,level.num_entities]); checkWords(check,[client.damage_armor,client.damage_blood,client.damage_knockback]); checkVector(check,client.damage_from)
  checkWords(check,[boolean(client.damage_fromWorld),client.lasthurt_client,client.lasthurt_mod])
  index = 64
  while index < level.num_entities
    extra = level.entities[index]; checkWord(check,index); checkWords(check,es.words(extra.s)); checkVector(check,extra.r.currentOrigin)
    checkVector(check,extra.r.mins); checkVector(check,extra.r.maxs); checkWords(check,[extra.r.contents,boolean(extra.r.linked),extra.count,extra.flags]); checkString(check,extra.classname)
    index = index+1
  end while
  return void
end function
function contracts(world)
  level = game.create(world); ent = game.initEntity(level.entities[0]); game.bindClient(level,ent,level.clients[0]); ent.client.connected = 2
  caught = try(active.think(level,0)); if caught is not error then return error(499,"Missing user-command contract") end if
  allocation = bytes(12,0); n.writeU32(allocation,0,90); n.writeU32(allocation,4,0); n.writeU32(allocation,8,65)
  level.context = Check(allocation,0,0); level.observeFn = observe
  ent.client.ps.eventSequence = 1; ent.client.ps.events[0] = c.EV_FIRE_WEAPON; ent.s.weapon = c.WP_ROCKET_LAUNCHER
  active.clientEvents(level,ent,0)
  if ent.client.accuracy_shots != 1 or level.num_entities != 65 or level.entities[64].s.weapon != c.WP_ROCKET_LAUNCHER or level.entities[64].damage != 100 then
    return error(499,"Default ClientEvents weapon firing contract")
  end if
  if level.context.offset != len(allocation) or level.context.words != 3 then return error(499,"Default weapon allocation delivery contract") end if
  contractImpacts(world)
  print "PASS: 3 ClientThink runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args) > 3 and args[3] == "--contracts" then return contracts(world) end if
  input = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2]); check = Check(expected,0,0)
  if len(input)%4 != 0 then return error(499,"Invalid ClientThink input") end if
  offset = 0
  while offset < len(input)
    scenario = n.readI32(input,offset); offset = offset+4; configured = configure(world,scenario,check); level = configured[0]; ent = configured[1]
    if scenario == 16 then active.think(level,0)
    else if scenario == 17 then active.runClient(level,ent)
    else if scenario >= 19 and scenario <= 23 then active.clientEvents(level,ent,0)
    else active.realThink(level,ent) end if
    finalState(check,level,ent)
  end while
  if check.offset != len(expected) then return error(499,"Missing ClientThink output at "+str(check.offset)) end if
  print "PASS: "+str(check.words)+" exact ClientThink words"; return 0
end function
