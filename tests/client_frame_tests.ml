// SPDX-License-Identifier: GPL-2.0-or-later
// Verbatim Baseq3 ClientEndFrame versus the MiniLang port.
import mq3.game.client_frame as clientFrame
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.entitystate as es
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Check
  expected
  offset
  words
end struct
function checkWord(check,value)
  if check.offset+4 > len(check.expected) then return error(498,"Unexpected ClientEndFrame output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(498,"ClientEndFrame mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
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
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(498,"ClientEndFrame string mismatch") end if
    check.offset = check.offset+1
  end for
  return void
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function observe(level,kind,ent)
  if kind == 3 then checkWords(level.context,[80,0,level.num_entities])
  else if kind == 1 then checkWords(level.context,[80,1,ent.slot])
  else return error(498,"Unexpected ClientEndFrame spatial event") end if
  return void
end function
function effect(state,kind,index,key,value)
  check = state.context; checkWords(check,[1,index]); checkString(check,""); checkString(check,value)
  return void
end function
function die(level,self,inflictor,attacker,damage,mod)
  checkWords(level.context,[80,3,self.slot,damage,mod])
  return void
end function
function begin(level,slot)
  checkWords(level.context,[80,2,slot]); level.clients[slot].ps.generic1 = 0x12345678
  return void
end function
function seed(state,base)
  state.commandTime = base+1; state.pm_type = c.PM_NORMAL; state.bobCycle = base+2; state.pm_flags = base+3; state.pm_time = base+4
  state.origin = [10.25,-20.5,30.75]; state.velocity = [1.5,-2.25,3.125]
  state.weaponTime = base+5; state.gravity = 800; state.speed = 320; state.delta_angles = [base+6,base+7,base+8]
  state.groundEntityNum = 1023; state.legsTimer = base+9; state.legsAnim = c.LEGS_IDLE
  state.torsoTimer = base+10; state.torsoAnim = c.TORSO_STAND; state.movementDir = base & 7
  state.grapplePoint = [4.5,5.5,6.5]; state.eFlags = base+11; state.clientNum = base % 64
  state.weapon = c.WP_RAILGUN; state.weaponstate = c.WEAPON_READY; state.viewangles = [15.25,125.5,-7.75]
  state.viewheight = 26; state.damageEvent = base+12; state.damageYaw = base+13; state.damagePitch = base+14; state.damageCount = base+15
  for index = 0 to 15
    state.stats[index] = base+100+index; state.persistant[index] = base+200+index
    state.powerups[index] = 0; state.ammo[index] = base+300+index
  end for
  state.generic1 = base+16; state.loopSound = base+17; state.jumppad_ent = base+18; state.ping = base+19
  state.pmove_framecount = base+20; state.jumppad_frame = base+21; state.entityEventSequence = 0; state.eventSequence = 0
  return void
end function
function configure(level,scenario,check)
  state = spawn.create(level,""); state.context = check; state.effectFn = effect
  level.context = check; level.observeFn = observe; level.time = 5000; level.follow1 = 1; level.follow2 = 2; level.sndFry = 77; level.smoothClients = false; level.clientBeginFn = begin
  level.entities[1022].s.number = 1022
  ent = game.initEntity(level.entities[0]); client = level.clients[0]; game.bindClient(level,ent,client); seed(client.ps,1000)
  ent.s.number = 0; ent.s.eType = c.ET_PLAYER; ent.s.eFlags = 0x13579; ent.r.currentOrigin = [10.25,-20.5,30.75]
  ent.health = 91; ent.damage = 2; ent.takedamage = true; ent.die = die; ent.pain_debounce_time = 4000
  client.connected = 2; client.team = c.TEAM_FREE; client.lastCmdTime = 4500; client.airOutTime = 17000
  client.ps.clientNum = 0; client.ps.stats[c.STAT_HEALTH] = 91; client.ps.stats[c.STAT_ARMOR] = 25; client.ps.stats[c.STAT_MAX_HEALTH] = 100
  client.ps.powerups[c.PW_NONE] = 4999; client.ps.powerups[c.PW_QUAD] = 5000; client.ps.powerups[c.PW_HASTE] = 5001
  followed = level.clients[1]; seed(followed.ps,2000); followed.ps.clientNum = 1; followed.connected = 2; followed.team = c.TEAM_RED
  switch scenario
    case 1
      client.damage_blood = 7; client.damage_armor = 3; client.damage_knockback = 9; client.damage_from = [1.0,2.0,3.0]
    end case
    case 2
      client.damage_blood = 300; client.damage_armor = 100; client.damage_knockback = 11; client.damage_fromWorld = true; ent.flags = 0x10
    end case
    case 3
      client.ps.pm_type = c.PM_DEAD; client.damage_blood = 7; client.damage_armor = 3
    end case
    case 4
      client.noclip = true; client.airOutTime = -20; ent.waterlevel = 3; ent.watertype = 8
    end case
    case 5
      client.airOutTime = 4999; ent.waterlevel = 3; ent.damage = 2
    end case
    case 6
      ent.waterlevel = 2; ent.watertype = 8 | 16
    end case
    case 7
      ent.waterlevel = 2; ent.watertype = 8; client.ps.powerups[c.PW_BATTLESUIT] = 6000
    end case
    case 8
      client.ps.eventSequence = 5; client.ps.entityEventSequence = 3; client.ps.events = [c.EV_FIRE_WEAPON,c.EV_ITEM_PICKUP]
      client.ps.eventParms = [7,9]; client.ps.externalEvent = c.EV_PAIN; client.ps.externalEventParm = 44
    end case
    case 9
      level.smoothClients = true; client.ps.commandTime = 4567
    end case
    case 10
      level.intermissiontime = 4500; client.damage_blood = 7; client.damage_armor = 3
    end case
    case 11
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 2; client.spectatorClient = 1; client.ps.eFlags = 0x4000
      followed.ps.eFlags = 0x80000 | 0x100
    end case
    case 12
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 2; client.spectatorClient = -1; client.ps.eFlags = 0x80000
      followed.ps.eFlags = 0x4000 | 0x200
    end case
    case 13
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 2; client.spectatorClient = 1; followed.connected = 1
    end case
    case 14
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 3; client.ps.pm_flags = 4096
    end case
    case 15
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 1; client.ps.pm_flags = 8192 | 4096
    end case
    case 16
      client.team = c.TEAM_SPECTATOR; client.spectatorState = 2; client.spectatorClient = -3; client.ps.pm_flags = 8192
    end case
  end switch
  if scenario >= 100 then
    k = scenario-100; x = (k*37)%31-15; y = (k*53)%37-18; z = (k*71)%41-20
    if x == 0 and y == 0 and z == 0 then x = 1 end if
    client.damage_blood = (k*29)%330; client.damage_armor = (k*11)%90; client.damage_knockback = (k*7)%220
    client.damage_from = [n.f32(x),n.f32(y),n.f32(z)]; if (k & 1) != 0 then ent.pain_debounce_time = 5000 else ent.pain_debounce_time = 4999 end if
    if k%7 == 0 then ent.flags = ent.flags | 0x10 end if
  end if
  return ent
end function
function finalState(check,level,ent)
  client = ent.client; checkWord(check,81); checkWords(check,ps.words(client.ps)); checkWords(check,es.words(ent.s))
  checkWords(check,[ent.health,ent.damage,ent.flags,ent.pain_debounce_time,ent.waterlevel,ent.watertype])
  checkWords(check,[client.damage_blood,client.damage_armor,client.damage_knockback]); checkVector(check,client.damage_from)
  checkWords(check,[boolean(client.damage_fromWorld),client.airOutTime,client.spectatorState,client.spectatorClient,level.num_entities,boolean(level.smoothClients)])
  index = 64
  while index < level.num_entities
    temp = level.entities[index]; checkWord(check,index); checkWords(check,es.words(temp.s))
    checkWords(check,[temp.r.svFlags,temp.r.singleClient,boolean(temp.freeAfterEvent),temp.eventTime]); checkVector(check,temp.r.currentOrigin)
    index = index+1
  end while
  return void
end function
function contracts(world)
  original = ps.create(); seed(original,7000); clone = ps.copy(original)
  original.origin[0] = 999.0; original.events[0] = -1; original.stats[0] = -2; original.persistant[0] = -3; original.powerups[0] = -4; original.ammo[0] = -5
  if clone.origin[0] == 999.0 or clone.events[0] == -1 or clone.stats[0] == -2 or clone.persistant[0] == -3 or clone.powerups[0] == -4 or clone.ammo[0] == -5 then return error(498,"PlayerState copy aliases arrays") end if
  level = game.create(world); state = spawn.create(level,""); ent = game.initEntity(level.entities[0]); game.bindClient(level,ent,level.clients[0])
  ent.client.team = c.TEAM_SPECTATOR; ent.client.spectatorState = 2; ent.client.spectatorClient = 1; level.clients[1].connected = 1
  caught = try(clientFrame.endFrame(level,ent)); if caught is not error then return error(498,"Missing ClientBegin contract") end if
  print "PASS: 2 ClientEndFrame runtime contracts"
  return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args) > 3 and args[3] == "--contracts" then return contracts(world) end if
  input = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2]); check = Check(expected,0,0)
  if len(input)%4 != 0 then return error(498,"Invalid ClientEndFrame input") end if
  offset = 0
  while offset < len(input)
    scenario = n.readI32(input,offset); offset = offset+4
    level = game.create(world); ent = configure(level,scenario,check)
    clientFrame.endFrame(level,ent); finalState(check,level,ent)
  end while
  if check.offset != len(expected) then return error(498,"Missing ClientEndFrame output at "+str(check.offset)) end if
  print "PASS: "+str(check.words)+" exact ClientEndFrame words"
  return 0
end function
