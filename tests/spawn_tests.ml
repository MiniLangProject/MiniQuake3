// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.spawn as spawn
import mq3.game.spawn_functions as funcs
import mq3.game.spawn_values as values
import mq3.game.entities as game
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.triggers as triggers
import mq3.game.targets as targets
import mq3.game.events as events
import mq3.game.frame as frame
import mq3.game.combat as combat
import mq3.game.hazards as hazards
import mq3.game.teleport as teleport
import mq3.server.world as sv
import mq3.collision.world as cm
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n
import std.fs as fs
struct Check
  expected
  offset
  words
  stringBytes
  boundaries
  links
end struct
function checkWord(check,value)
  if check.offset+4 > len(check.expected) then return error(490,"Unexpected spawn output") end if
  want = n.readU32(check.expected,check.offset)
  if n.u32(value) != want then return error(490,"Spawn mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(want)) end if
  check.offset = check.offset+4; check.words = check.words+1
  return void
end function
function checkWords(check,values)
  for each value in values
    checkWord(check,value)
  end for
  return void
end function
function checkReal(check,value)
  return checkWord(check,n.floatBits(value))
end function
function checkVector(check,value)
  for each x in value
    checkReal(check,x)
  end for
  return void
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function checkString(check,text)
  if text == void then checkWord(check,-1); return void end if
  data = bytes(text); checkWord(check,len(data))
  for each value in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != value then return error(490,"Spawn string mismatch at byte "+str(check.offset)+" in "+text) end if
    check.offset = check.offset+1; check.stringBytes = check.stringBytes+1
  end for
  return void
end function
function checkSnapshot(check,ent)
  checkWord(check,ent.slot); checkWords(check,es.words(ent.s))
  checkWords(check,[boolean(ent.inuse),ent.freetime,boolean(ent.neverFree),ent.eventTime,boolean(ent.freeAfterEvent),ent.spawnflags])
  r = ent.r
  checkVector(check,r.mins); checkVector(check,r.maxs); checkVector(check,r.currentOrigin); checkVector(check,r.currentAngles); checkVector(check,r.absmin); checkVector(check,r.absmax)
  checkWords(check,[r.contents,boolean(r.bmodel),r.svFlags,r.ownerNum,boolean(r.linked),r.linkcount]); checkWord(check,len(r.clusters))
  for i = 0 to 15
    value = 0
    if i < len(r.clusters) then value = r.clusters[i] end if
    checkWord(check,value)
  end for
  checkWords(check,[r.lastCluster,r.areanum,r.areanum2,r.sector])
  checkReal(check,ent.speed); checkReal(check,ent.wait); checkReal(check,ent.random); checkWords(check,[ent.count,ent.health,ent.damage,ent.flags]); checkVector(check,ent.movedir); checkWord(check,ent.nextthink)
  think = 0; touch = 0
  if ent.think == funcs.aimAtTarget then think = 1 else if ent.think != void then think = 2 end if
  if ent.touch == triggers.pushTouch then touch = 1 else if ent.touch == triggers.teleporterTouch then touch = 2 else if ent.touch != void then touch = 3 end if
  checkWords(check,[think,touch])
  activator = -1
  if ent.activator != void then activator = ent.activator.slot end if
  checkWords(check,[boolean(ent.use != void),activator,boolean(ent.unlinkAfterEvent),boolean(ent.physicsObject)])
  checkWords(check,[ent.noise_index,ent.fly_sound_debounce_time,actionSlot(ent.nextTrain)])
  for each value in [ent.classname,ent.model,ent.model2,ent.target,ent.targetname,ent.message,ent.team,ent.targetShaderName,ent.targetShaderNewName]
    checkString(check,value)
  end for
  return void
end function
function recordSpawnEffect(state,kind,index,key,value)
  check = state.context; checkWords(check,[kind,index]); checkString(check,key); checkString(check,value)
  return void
end function
function recordSpawnBoundary(state,ent,kind,index)
  check = state.context; checkWords(check,[4,kind,index]); checkSnapshot(check,ent); check.boundaries = check.boundaries+1
  return void
end function
function recordSpawnSpatial(level,kind,ent)
  check = level.context
  if kind == 3 then checkWords(check,[7,level.num_entities]) else checkWord(check,kind+4); checkSnapshot(check,ent); check.links = check.links+1 end if
  return void
end function
function checkLevel(check,level)
  s = level.spawner; checkWords(check,[8,level.time,level.num_entities,boolean(s.spawning),len(s.vars),s.chars,s.warmupTime])
  checkWords(check,[boolean(level.locationLinked),actionSlot(level.locationHead)])
  i = 64
  while i < level.num_entities
    checkSnapshot(check,level.entities[i]); i = i+1
  end while
  checkSnapshot(check,level.entities[1022])
  return void
end function
function countSpawnThink(level,ent)
  ent.count = ent.count+1
  return void
end function
function actionSlot(ent)
  if ent == void then return -1 end if
  return ent.slot
end function
function actionThink(level,ent)
  checkWords(level.context,[11,ent.slot]); ent.count = ent.count+1
  return void
end function
function actionUse(level,ent,other,activator)
  checkWords(level.context,[10,ent.slot,actionSlot(other),actionSlot(activator),level.time]); ent.count = ent.count+1
  switch ent.damage
    case 1
      game.free(level,other)
    end case
    case 2
      game.free(level,ent)
    end case
    case 3
      game.free(level,level.entities[ent.health])
    end case
    case 4
      other.target = "changed"
    end case
    case 5
      created = game.spawn(level); created.targetname = "leaf"; created.use = actionUse; created.think = actionThink; created.nextthink = level.time
    end case
    case 6
      other.target = void
    end case
    case 7
      game.free(level,other); created = game.spawn(level); created.target = "changed"
    end case
  end switch
  return void
end function
function actionRun(level,kind,ent)
  checkWords(level.context,[12,kind,ent.slot])
  return void
end function
function actionField(ent,field,value)
  names = [void,"leaf","changed","dest","missing",""]
  switch field
    case 0
      ent.spawnflags = value
    end case
    case 1
      ent.nextthink = value
    end case
    case 2
      ent.eventTime = value
    end case
    case 3
      ent.freeAfterEvent = value != 0
    end case
    case 4
      ent.unlinkAfterEvent = value != 0
    end case
    case 5
      ent.neverFree = value != 0
    end case
    case 6
      ent.physicsObject = value != 0
    end case
    case 7
      ent.s.eType = value
    end case
    case 8
      ent.s.event = value
    end case
    case 9
      ent.s.eventParm = value
    end case
    case 10
      ent.wait = n.bitsFloat(value)
    end case
    case 11
      ent.random = n.bitsFloat(value)
    end case
    case 12
      ent.health = value
    end case
    case 13
      ent.damage = value
    end case
    case 14
      ent.count = value
    end case
    case 15
      ent.target = names[value]
    end case
    case 16
      ent.targetname = names[value]
    end case
    case 17
      ent.think = void
      if value != 0 then ent.think = actionThink end if
    end case
    case 18
      ent.use = void
      if value != 0 then ent.use = actionUse end if
    end case
    case 19
      ent.client.team = value
    end case
    case 20
      ent.client.ps.externalEvent = value
    end case
    case 21
      ent.client.ps.events[0] = value
    end case
    case 22
      ent.client.ps.externalEventTime = value
    end case
    case 23
      ent.client.ps.externalEventParm = value
    end case
    case 24
      ent.client.ps.pm_type = value
    end case
    case 25
      ent.client.ps.powerups[6] = value
    end case
    case 26
      ent.fly_sound_debounce_time = value
    end case
    case 27
      ent.noise_index = value
    end case
    case 28
      ent.inuse = value != 0
    end case
  end switch
  return void
end function
function runTargetActions(level,input,check)
  size = n.readI32(input,0); s = spawn.create(level,decode(slice(input,4,size))); s.motd = "MiniQuake3 spawn parity"
  s.context = check; s.effectFn = recordSpawnEffect; s.unportedFn = recordSpawnBoundary
  level.context = check; level.observeFn = recordSpawnSpatial; level.runEntityFn = actionRun
  spawn.load(s); checkLevel(check,level); off = 4+size; index = 0; names = [void,"leaf","changed","dest","missing",""]
  while off < len(input)
    op = n.readI32(input,off); a = n.readI32(input,off+4); b = n.readI32(input,off+8); d = n.readI32(input,off+12); off = off+32
    ent = void; other = void; activator = void
    if a >= 0 and a < 1024 then ent = level.entities[a] end if
    if b >= 0 and b < 1024 then other = level.entities[b] end if
    if d >= 0 and d < 1024 then activator = level.entities[d] end if
    switch op
      case 0
        level.time = a
      end case
      case 1
        ent.use(level,ent,other,activator)
      end case
      case 2
        targets.useTargets(level,ent,other)
      end case
      case 3
        funcs.runThink(level,ent)
      end case
      case 4
        frame.runEntities(level)
      end case
      case 5
        actionField(ent,b,d)
      end case
      case 6
        game.initEntity(ent); ent.client = game.createClient(ps.create(),b,[0,0,0]); ent.client.ps.stats[0] = 100; ent.s.eType = 1
        ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.contents = 0x2000000
      end case
      case 7
        events.add(level,ent,b,d)
      end case
      case 8
        events.sound(level,ent,b,d)
      end case
      case 9
        if b != 0 then game.link(level,ent) else game.unlink(level,ent) end if
      end case
      case 10
        game.free(level,ent)
      end case
      case 11
        ent = game.spawn(level); ent.targetname = names[a]; ent.use = actionUse
      end case
      case 12
        targets.multiTouch(level,ent,other,void)
      end case
      case 13
        ent.targetShaderName = "shader/"+str(b); ent.targetShaderNewName = "shader/"+str(d)
      end case
      case 14
        targets.addRemap(level,"shader/"+str(a),"shader/"+str(b),n.bitsFloat(d))
      end case
      case 15
        level.shaderRemaps = []
      end case
      case 16
        checkWord(check,13); checkString(check,targets.shaderState(level))
      end case
      case 17
        oldName = str(a); newName = str(b)
        while len(oldName) < 56
          oldName = "0"+oldName
        end while
        while len(newName) < 56
          newName = "0"+newName
        end while
        targets.addRemap(level,"shader/"+oldName,"shader/"+newName,n.bitsFloat(d))
      end case
      case 18
        checkWord(check,15); checkString(check,s.configstrings[a])
      end case
    end switch
    checkWords(check,[14,index]); index = index+1; checkLevel(check,level)
    for i = 0 to 2
      ent = level.entities[i]; checkSnapshot(check,ent); checkWord(check,boolean(ent.client != void))
      if ent.client != void then checkWords(check,ps.words(ent.client.ps)) end if
    end for
  end while
  checkWord(check,game.random(level))
  print "PASS: "+str(index)+" target/event/frame actions"
  return void
end function
function requireSpawnContract(condition,label)
  if not condition then return error(490,"Failed spawn contract: "+label) end if
  return void
end function
function combatCallback(level,kind,ent,inflictor,attacker,amount,mod)
  health = 0
  if ent.client != void then health = ent.client.ps.stats[0] end if
  checkWords(level.context,[kind,ent.slot,actionSlot(inflictor),actionSlot(attacker),amount,mod,ent.health,health,ent.flags,actionSlot(ent.enemy)])
  if ent.count == 1 then game.free(level,ent) end if
  return void
end function
function combatPain(level,ent,attacker,amount)
  return combatCallback(level,23,ent,void,attacker,amount,0)
end function
function combatDie(level,ent,inflictor,attacker,amount,mod)
  return combatCallback(level,24,ent,inflictor,attacker,amount,mod)
end function
function combatUse(level,ent,inflictor,attacker)
  return combatCallback(level,25,ent,inflictor,attacker,0,0)
end function
function combatField(level,ent,key,value)
  switch key
    case 0
      ent.health = value
    end case
    case 1
      ent.takedamage = value != 0
    end case
    case 2
      ent.flags = value
    end case
    case 3
      ent.s.eType = value
    end case
    case 4
      ent.moverState = value
    end case
    case 5
      ent.pain = void
      if value != 0 then ent.pain = combatPain end if
    end case
    case 6
      ent.die = void
      if value != 0 then ent.die = combatDie end if
    end case
    case 7
      ent.timestamp = value
    end case
    case 8
      ent.spawnflags = value
    end case
    case 9
      ent.damage = value
    end case
    case 10
      ent.noise_index = value
    end case
    case 11
      ent.neverFree = value != 0
    end case
    case 12
      ent.count = value
    end case
    case 13
      ent.use = void
      if value != 0 then ent.use = combatUse end if
    end case
    case 20
      ent.client.team = value
    end case
    case 21
      ent.client.noclip = value != 0
    end case
    case 22
      ent.client.ps.stats[3] = value
    end case
    case 23
      ent.client.ps.stats[6] = value
    end case
    case 24
      ent.client.ps.pm_time = value
    end case
    case 25
      ent.client.ps.pm_flags = value
    end case
    case 26,27,28
      power = 2
      if key == 27 then power = 7 else if key == 28 then power = 8 end if
      ent.client.ps.powerups[power] = value
    end case
    case 29
      ent.client.ps.generic1 = value
    end case
    case 30
      ent.client.ps.persistant[1] = value
    end case
    case 31
      ent.client.lasthurtcarrier = n.f32(value)
    end case
    case 32
      ent.client.damage_armor = value
    end case
    case 33
      ent.client.damage_blood = value
    end case
    case 34
      ent.client.damage_knockback = value
    end case
    case 35
      ent.client.lasthurt_client = value
    end case
    case 36
      ent.client.lasthurt_mod = value
    end case
    case 37
      ent.client.ps.externalEvent = value
    end case
    case 40
      level.spawner.gametype = value
    end case
    case 41
      level.friendlyFire = value
    end case
    case 42
      level.knockback = n.bitsFloat(value)
    end case
    case 43
      level.intermissionQueued = value
    end case
    case 44
      level.time = value
    end case
  end switch
  return void
end function
function checkCombatExtra(check,ent)
  checkWords(check,[boolean(ent.takedamage),ent.moverState,actionSlot(ent.enemy),boolean(ent.pain != void),boolean(ent.die != void),ent.timestamp,boolean(ent.client != void)])
  cl = ent.client
  if cl == void then return void end if
  checkWords(check,ps.words(cl.ps)); checkWord(check,cl.team); checkWords(check,cl.cmdAngles); checkWord(check,boolean(cl.noclip))
  checkWords(check,[cl.damage_armor,cl.damage_blood,cl.damage_knockback]); checkVector(check,cl.damage_from)
  checkWords(check,[boolean(cl.damage_fromWorld),cl.lasthurt_client,cl.lasthurt_mod]); checkReal(check,cl.lasthurtcarrier)
  return void
end function
function checkCombatState(level,index)
  check = level.context
  checkWords(check,[26,index,level.spawner.gametype,level.friendlyFire,n.floatBits(level.knockback),level.intermissionQueued]); checkLevel(check,level)
  for i = 0 to 2
    checkSnapshot(check,level.entities[i]); checkCombatExtra(check,level.entities[i])
  end for
  i = 64
  while i < level.num_entities
    checkCombatExtra(check,level.entities[i]); i = i+1
  end while
  checkCombatExtra(check,level.entities[1022])
  return void
end function
function runCombatActions(level,input,check)
  size = n.readI32(input,0); s = spawn.create(level,decode(slice(input,4,size))); s.motd = "MiniQuake3 spawn parity"
  s.context = check; s.effectFn = recordSpawnEffect; s.unportedFn = recordSpawnBoundary
  level.context = check; level.observeFn = recordSpawnSpatial
  spawn.load(s); checkCombatState(level,-1); off = 4+size; index = 0
  while off < len(input)
    command = []
    for j = 0 to 15
      command = command+[n.readI32(input,off+j*4)]
    end for
    off = off+64; ent = void; other = void; attacker = void
    if command[1] >= 0 and command[1] < 1024 then ent = level.entities[command[1]] end if
    if command[2] >= 0 and command[2] < 1024 then other = level.entities[command[2]] end if
    if command[3] >= 0 and command[3] < 1024 then attacker = level.entities[command[3]] end if
    switch command[0]
      case 1
        game.free(level,ent); game.initEntity(ent); ent.takedamage = true; ent.health = command[4]; ent.pain = combatPain; ent.die = combatDie
        ent.r.currentOrigin = [10.25,-20.75,32.5]; ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.contents = 0x2000000
        if command[2] != 0 then
          ent.client = game.createClient(ps.create(),command[3],[0,0,0]); ent.s.eType = 1
          ent.client.ps.stats[0] = command[4]; ent.client.ps.stats[3] = command[5]; ent.client.ps.stats[6] = command[6]
        end if
      end case
      case 2
        combatField(level,ent,command[2],command[3])
      end case
      case 3
        dir = [n.bitsFloat(command[7]),n.bitsFloat(command[8]),n.bitsFloat(command[9])]; point = [n.bitsFloat(command[11]),n.bitsFloat(command[12]),n.bitsFloat(command[13])]
        direction = void; position = void
        if command[10] != 0 then direction = dir end if
        if command[14] != 0 then position = point end if
        combat.damage(level,ent,other,attacker,direction,position,command[4],command[5],command[6])
        checkWord(check,20); checkVector(check,dir); checkVector(check,point)
      end case
      case 4
        saved = combat.checkArmor(ent,command[2],command[3]); checkWords(check,[21,saved])
      end case
      case 5
        hazards.hurtTouch(level,ent,other,void)
      end case
      case 6
        ent.use(level,ent,other,attacker)
      end case
      case 7
        checkWords(check,[22,boolean(combat.onSameTeam(level,ent,other))])
      end case
      case 8
        combat.checkHurtCarrier(level,ent,other)
      end case
      case 9
        teleport.killBox(level,ent)
      end case
      case 10
        if command[2] != 0 then game.link(level,ent) else game.unlink(level,ent) end if
      end case
      case 11
        game.free(level,ent)
      end case
      case 12
        for axis = 0 to 2
          ent.r.currentOrigin[axis] = n.bitsFloat(command[2+axis])
          if ent.client != void then ent.client.ps.origin[axis] = ent.r.currentOrigin[axis]; ent.client.ps.velocity[axis] = n.bitsFloat(command[5+axis]) end if
        end for
      end case
      case 13
        triggers.touch(level,ent)
      end case
      case 14
        teleport.player(level,ent,[n.bitsFloat(command[2]),n.bitsFloat(command[3]),n.bitsFloat(command[4])],[0.0,90.0,0.0])
      end case
    end switch
    checkCombatState(level,index); index = index+1
  end while
  print "PASS: "+str(index)+" combat/hazard actions"
  return void
end function
function runCombatContracts(level)
  s = spawn.create(level,"")
  requireSpawnContract(level.damageFn == combat.damage,"spawn binds real damage")
  ent = game.initEntity(level.entities[0]); ent.client = game.createClient(ps.create(),0,[0,0,0]); ent.health = 1; ent.s.eType = 1
  level.entities[1022].s.number = 1022
  // A missing death callback is reported only if the original would invoke it.
  combat.damage(level,ent,void,void,void,void,100000,8,18)
  requireSpawnContract(ent.health == 1,"non-damageable entity needs no death handler")
  ent.takedamage = true; level.intermissionQueued = 1; combat.damage(level,ent,void,void,void,void,100000,8,18)
  requireSpawnContract(ent.health == 1,"queued intermission needs no death handler")
  level.intermissionQueued = 0; caught = try(combat.damage(level,ent,void,void,void,void,100000,8,18))
  requireSpawnContract(caught is error and ent.health == -999 and ent.client.ps.stats[0] == -99999 and ent.enemy == level.entities[1022],"missing death handler after original damage state")
  ent.client = void; ent.health = 100
  attacker = game.initEntity(level.entities[1]); attacker.client = game.createClient(ps.create(),0,[0,0,0]); attacker.client.ps.stats[6] = 100
  caught = try(combat.damage(level,ent,attacker,attacker,void,void,1,0,6))
  requireSpawnContract(caught is error and attacker.client.ps.persistant[1] == 1 and ent.health == 100,"invalid nonclient hit-counter state is rejected")
  ent.timestamp = 987; ent.moverState = 3; ent.pain = combatPain; ent.die = combatDie; game.free(level,ent)
  requireSpawnContract(not ent.takedamage and ent.moverState == 0 and ent.timestamp == 0 and ent.pain == void and ent.die == void and ent.enemy == void,"free clears combat fields")
  print "PASS: 6 combat runtime contracts"
  return void
end function
function runSpawnContracts(level)
  s = spawn.create(level,""); ent = level.entities[64]
  caught = try(spawn.parseField("origin","1 2",ent)); requireSpawnContract(caught is error,"partial field vector")
  caught = try(spawn.newString("tail\\")); requireSpawnContract(caught is error,"trailing escape")
  caught = try(spawn.load(s)); requireSpawnContract(caught is error,"empty map")
  other = spawn.create(level,"{ classname info_null }"); caught = try(spawn.load(other)); requireSpawnContract(caught is error,"first worldspawn")
  level.spawner = s; ent.classname = "item_quad"; caught = try(spawn.callSpawn(s,ent)); requireSpawnContract(caught is error,"unported item")
  ent.classname = "func_door"; caught = try(spawn.callSpawn(s,ent)); requireSpawnContract(caught is error,"unported class")
  ent.classname = void; requireSpawnContract(not spawn.callSpawn(s,ent),"NULL classname")
  ent.classname = "INFO_PLAYER_START"; requireSpawnContract(not spawn.callSpawn(s,ent),"case-sensitive class")
  ent.nextthink = 1000; level.time = 1000; caught = try(funcs.runThink(level,ent)); requireSpawnContract(caught is error and ent.nextthink == 0,"missing due thinker")
  ent.nextthink = 1001; funcs.runThink(level,ent); requireSpawnContract(ent.nextthink == 1001,"future thinker")
  ent.nextthink = 0; funcs.runThink(level,ent); requireSpawnContract(ent.nextthink == 0,"disabled thinker")
  ent.think = countSpawnThink; ent.nextthink = 16777217; level.time = 16777216; funcs.runThink(level,ent)
  requireSpawnContract(ent.count == 1 and ent.nextthink == 0,"float-rounded think boundary")
  ent.nextthink = 16777219; level.time = 16777218; funcs.runThink(level,ent); requireSpawnContract(ent.count == 1 and ent.nextthink == 16777219,"future rounded thinker")
  requireSpawnContract(values.configIndex(s,"",32,3,true) == 0,"empty config name")
  requireSpawnContract(values.configIndex(s,"abc",32,3,true) == 1 and values.configIndex(s,"abc",32,3,true) == 1,"config reuse")
  requireSpawnContract(values.configIndex(s,"ABC",32,3,true) == 2,"case-sensitive config name")
  requireSpawnContract(values.configIndex(s,"missing",32,3,false) == 0,"config lookup only")
  caught = try(values.configIndex(s,"overflow",32,3,true)); requireSpawnContract(caught is error,"config capacity")
  caught = try(funcs.setBrushModel(level,ent,void)); requireSpawnContract(caught is error,"NULL brush name")
  caught = try(funcs.setBrushModel(level,ent,"model")); requireSpawnContract(caught is error,"non-brush name")
  caught = try(funcs.setBrushModel(level,ent,"*999999")); requireSpawnContract(caught is error,"invalid inline model")
  fresh = game.create(level.scene.world); fresh.num_entities = 65; fresh.time = 1000; node = game.initEntity(fresh.entities[64])
  for each type in [2,3,4]
    node.s.eType = type; caught = try(frame.runEntities(fresh)); requireSpawnContract(caught is error,"missing entity frame handler")
  end for
  node.s.eType = 0; node.physicsObject = true; caught = try(frame.runEntities(fresh)); requireSpawnContract(caught is error,"missing physics handler")
  node.inuse = false; game.initEntity(fresh.entities[0]); caught = try(frame.runEntities(fresh)); requireSpawnContract(caught is error,"missing client handler")
  longName = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  caught = try(targets.addRemap(fresh,longName,"new",0.0)); requireSpawnContract(caught is error,"overlong shader source")
  caught = try(targets.addRemap(fresh,"old",longName,0.0)); requireSpawnContract(caught is error,"overlong shader destination")
  ent.classname = "target_speaker"; caught = try(funcs.dispatch(level,ent)); requireSpawnContract(caught is error,"speaker requires noise key")
  values.setConfig(s,608,void); requireSpawnContract(s.configstrings[608] == "","NULL configstring storage")
  print "PASS: 30 spawn/target/frame runtime contracts"
  return void
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  input = fs.readAllBytes(args[1]); check = Check(fs.readAllBytes(args[2]),0,0,0,0,0); level = game.create(world)
  level.time = 1000; level.startTime = 1000
  if len(args) > 4 and args[4] == "--combat-contracts" then runCombatContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--contracts" then runSpawnContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--reject-spawn" then
    caught = try(spawn.load(spawn.create(level,decode(slice(input,4,n.readI32(input,0))))))
    if caught is not error then return 1 end if
    print "PASS rejected invalid spawn class input"; return 0
  end if
  if len(args) > 4 and args[4] == "--reject" then
    caught = try(spawn.parseVars(spawn.create(level,decode(slice(input,4,n.readI32(input,0))))))
    if caught is not error then return 1 end if
    print "PASS rejected malformed spawn input"; return 0
  end if
  if len(args) > 4 and args[4] == "--think" then
    off = 0; ent = level.entities[64]
    while off < len(input)
      ent.nextthink = n.readI32(input,off); level.time = n.readI32(input,off+4); ent.count = 0; ent.think = void
      if n.readI32(input,off+8) != 0 then ent.think = countSpawnThink end if
      funcs.runThink(level,ent); checkWords(check,[ent.nextthink,ent.count]); off = off+12
    end while
  else if len(args) > 4 and args[4] == "--actions" then
    runTargetActions(level,input,check)
  else if len(args) > 4 and args[4] == "--combat" then
    runCombatActions(level,input,check)
  else if len(args) > 4 and args[4] == "--values" then
    off = 0; count = 0
    while off < len(input)
      size = n.readI32(input,off); text = decode(slice(input,off+4,size)); off = off+4+size
      s = spawn.create(level,text); ent = game.blank(64,sv.entity(64)); ent.s.number = 64
      checkWord(check,boolean(spawn.parseVars(s))); checkWords(check,[len(s.vars),s.chars])
      for each pair in s.vars
        checkString(check,pair[0]); checkString(check,pair[1]); spawn.parseField(pair[0],pair[1],ent)
      end for
      checkSnapshot(check,ent); result = spawn.getString(s,"probe","fallback"); checkWord(check,boolean(result[0])); checkString(check,result[1])
      result = spawn.getInt(s,"probe","7"); checkWord(check,boolean(result[0])); checkWord(check,result[1])
      result = spawn.getFloat(s,"probe","7.5"); checkWord(check,boolean(result[0])); checkReal(check,result[1])
      result = spawn.getVector(s,"probe","1 2 3",[123.5,-45.25,67.75]); checkWord(check,boolean(result[0])); checkVector(check,result[1])
      checkWord(check,boolean(spawn.parseVars(s))); checkWords(check,[len(s.vars),s.chars]); count = count+1
    end while
    print "PASS: "+str(count)+" original spawn field/getter/parser cases"
  else
    size = n.readI32(input,8); s = spawn.create(level,decode(slice(input,12,size)))
    s.gametype = n.readI32(input,0); flags = n.readI32(input,4); s.restarted = flags & 1; s.doWarmup = flags & 2; s.motd = "MiniQuake3 spawn parity"
    s.context = check; s.effectFn = recordSpawnEffect; s.unportedFn = recordSpawnBoundary; level.context = check; level.observeFn = recordSpawnSpatial
    spawn.load(s); checkLevel(check,level)
    s.gravity = cv.find(s.cvars,"g_gravity").value
    for step = 0 to 2
      level.time = 1099+step; i = 64
      while i < level.num_entities
        if level.entities[i].inuse then funcs.runThink(level,level.entities[i]) end if
        i = i+1
      end while
      checkLevel(check,level)
    end for
    limit = level.num_entities; probes = 0; i = 64
    while i < limit and probes < 16
      hit = level.entities[i]; i = i+1
      if not hit.inuse or (hit.s.eType != 8 and hit.s.eType != 9) then continue end if
      ent = level.entities[0]; game.initEntity(ent); ent.client = game.createClient(ps.create(),0,[0,0,0]); ent.s.eType = 1
      ent.client.ps.stats[0] = 100; ent.client.ps.pmove_framecount = 1; ent.r.contents = 0x2000000
      ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]
      for axis = 0 to 2
        value = n.fmul(n.fadd(hit.r.absmin[axis],hit.r.absmax[axis]),0.5)
        ent.client.ps.origin[axis] = value; ent.r.currentOrigin[axis] = value
      end for
      game.link(level,ent); triggers.touch(level,ent); checkWord(check,9); checkWords(check,ps.words(ent.client.ps)); checkSnapshot(check,ent); game.free(level,ent); probes = probes+1
    end while
  end if
  if check.offset != len(check.expected) then return error(490,"Missing spawn output at "+str(check.offset)) end if
  print "PASS: "+str(check.words)+" exact words / "+str(check.stringBytes)+" string bytes; "+str(check.boundaries)+" explicit dispatch boundaries, "+str(check.links)+" link/lifecycle observations"
  return 0
end function
