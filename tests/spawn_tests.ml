// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.map_targets as mapTargets
import mq3.game.portals as portals
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
import mq3.game.missiles as missiles
import mq3.game.shooters as shooters
import mq3.game.bodies as bodies
import mq3.game.scores as scores
import mq3.game.deaths as deaths
import mq3.game.items as items
import mq3.game.team_bonuses as teamBonuses
import mq3.game.rank_sort as rankSort
import mq3.game.player_spawns as playerSpawns
import mq3.game.movement as movement
import mq3.shared.directions as directions
import mq3.collision.brush as brush
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
  missiles
  bodies
  scores
  deaths
  items
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
  if ent.think == funcs.aimAtTarget then think = 1 else if ent.think == portals.locateCamera then think = 3 else if ent.think != void then think = 2 end if
  if ent.touch == triggers.pushTouch then touch = 1 else if ent.touch == triggers.teleporterTouch then touch = 2 else if ent.touch != void then touch = 3 end if
  checkWords(check,[think,touch])
  activator = -1
  if ent.activator != void then activator = ent.activator.slot end if
  useId = boolean(ent.use != void)
  if ent.use == mapTargets.giveUse then useId = 2 else if ent.use == mapTargets.removePowerupsUse then useId = 3 else if ent.use == mapTargets.scoreUse then useId = 4 else if ent.use == mapTargets.printUse then useId = 5 end if
  checkWords(check,[useId,activator,boolean(ent.unlinkAfterEvent),boolean(ent.physicsObject)])
  checkWords(check,[ent.noise_index,ent.fly_sound_debounce_time,actionSlot(ent.nextTrain)])
  for each value in [ent.classname,ent.model,ent.model2,ent.target,ent.targetname,ent.message,ent.team,ent.targetShaderName,ent.targetShaderNewName]
    checkString(check,value)
  end for
  return void
end function
function recordSpawnDiagnostic(level,text)
  checkWord(level.context,16); checkString(level.context,text); return void
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
  mode = ent.count; slot = ent.damage
  health = 0
  if ent.client != void then health = ent.client.ps.stats[0] end if
  checkWords(level.context,[kind,ent.slot,actionSlot(inflictor),actionSlot(attacker),amount,mod,ent.health,health,ent.flags,actionSlot(ent.enemy)])
  checkMissileState(level)
  if mode == 1 then game.free(level,ent) end if
  if mode == 2 then game.free(level,level.entities[slot]) end if
  if mode == 3 then level.entities[slot].takedamage = false end if
  if mode == 4 then game.setOrigin(level.entities[slot],[2000.0,0.0,64.0]); game.link(level,level.entities[slot]) end if
  if mode == 5 or mode == 6 then
    if mode == 5 then game.free(level,level.entities[slot]) end if
    changed = game.spawn(level); changed.takedamage = true; changed.health = 333; game.setOrigin(changed,[100.0,0.0,64.0]); game.link(level,changed)
  end if
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
    case 14
      ent.r.contents = value
    end case
    case 15
      ent.r.ownerNum = value
    end case
    case 16
      names = [void,"leaf","changed","dest","missing",""]; ent.targetname = names[value]
    end case
    case 17
      ent.s.number = value
    end case
    case 18
      ent.enemy = void
      if value >= 0 then ent.enemy = level.entities[value] end if
    end case
    case 19
      ent.activator = void
      if value >= 0 then ent.activator = level.entities[value] end if
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
    case 45
      ent.client.ps.stats[0] = value
    end case
    case 46
      ent.inuse = value != 0
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
  checkMissileState(level)
  checkBodyState(level)
  checkScoreState(level)
  checkDeathState(level)
  checkItemState(level)
  return void
end function
function recordCombatTrace(level,start,finish,mins,maxs,passEntity,mask,hit)
  check = level.context; tr = hit.trace
  checkWords(check,[27,passEntity,mask,boolean(mins != void),boolean(maxs != void)])
  checkVector(check,start); checkVector(check,finish)
  if mins == void then checkVector(check,[0.0,0.0,0.0]) else checkVector(check,mins) end if
  if maxs == void then checkVector(check,[0.0,0.0,0.0]) else checkVector(check,maxs) end if
  checkReal(check,tr.fraction); checkVector(check,tr.normal); checkReal(check,tr.distance)
  checkWords(check,[tr.surfaceFlags,tr.contents,boolean(tr.startsolid),boolean(tr.allsolid)])
  checkVector(check,hit.endpos); checkWords(check,[tr.planeMetadata,hit.entityNum])
  return void
end function
function runCombatActions(level,input,check)
  size = n.readI32(input,0); s = spawn.create(level,decode(slice(input,4,size))); s.motd = "MiniQuake3 spawn parity"
  s.context = check; s.effectFn = recordSpawnEffect; s.unportedFn = recordSpawnBoundary
  level.context = check; level.observeFn = recordSpawnSpatial; level.traceObserveFn = recordCombatTrace
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
          game.bindClient(level,ent,game.createClient(ps.create(),command[3],[0,0,0])); ent.s.eType = 1
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
      case 15
        result = combat.canDamage(level,ent,[n.bitsFloat(command[2]),n.bitsFloat(command[3]),n.bitsFloat(command[4])]); checkWords(check,[28,boolean(result)])
      end case
      case 16
        result = combat.radiusDamage(level,[n.bitsFloat(command[5]),n.bitsFloat(command[6]),n.bitsFloat(command[7])],ent,n.bitsFloat(command[3]),n.bitsFloat(command[4]),other,command[8]); checkWords(check,[29,boolean(result)])
      end case
      case 17
        checkWords(check,[30,boolean(combat.logAccuracyHit(level,ent,other))])
      end case
      case 18
        funcs.runThink(level,ent)
      end case
      case 19
        point = [n.bitsFloat(command[3]),n.bitsFloat(command[4]),n.bitsFloat(command[5])]
        switch command[2]
          case 0
            ent.s.origin = point
          end case
          case 1
            ent.s.angles = point
          end case
          case 2
            ent.movedir = point
          end case
          case 3
            ent.r.mins = point
          end case
          case 4
            ent.r.maxs = point
          end case
          case 5
            ent.r.currentOrigin = point
          end case
          case 6
            ent.r.currentAngles = point
          end case
          case 7
            ent.r.absmin = point
          end case
          case 8
            ent.r.absmax = point
          end case
        end switch
      end case
      case 20
        funcs.setBrushModel(level,ent,"*"+str(command[2]))
      end case
      case default
        if check.items and command[0] >= 91 then runItemAction(level,command,check)
        else if check.deaths and command[0] >= 80 then runDeathAction(level,command)
        else if check.scores then runScoreAction(level,command)
        else if check.bodies then runBodyAction(level,command)
        else runMissileAction(level,command) end if
      end case
    end switch
    checkCombatState(level,index); index = index+1
  end while
  if check.missiles or check.bodies or check.items then checkWords(check,[37,game.random(level)]) end if
  print "PASS: "+str(index)+" combat/hazard actions"
  return void
end function
function checkMissileExtra(check,ent)
  think = 5
  if ent.think == void then think = 0
  else if ent.think == missiles.explode then think = 1
  else if ent.think == missiles.hookFree then think = 2
  else if ent.think == missiles.hookThink then think = 3
  else if ent.think == shooters.finish then think = 4 end if
  checkWords(check,[ent.slot,actionSlot(ent.parent),actionSlot(ent.target_ent),ent.splashDamage,ent.splashRadius,ent.methodOfDeath,ent.splashMethodOfDeath,ent.clipmask,think,boolean(ent.client != void)])
  if ent.client == void then checkWords(check,[0,-1]) else checkWords(check,[ent.client.accuracy_hits,actionSlot(ent.client.hook)]) end if
  return void
end function
function checkMissileState(level)
  check = level.context
  if not check.missiles then return void end if
  checkWords(check,[31,level.previousTime]); checkWords(check,level.itemRegistered); checkWord(check,level.num_entities-64+4)
  for i = 0 to 2
    checkMissileExtra(check,level.entities[i])
  end for
  i = 64
  while i < level.num_entities
    checkMissileExtra(check,level.entities[i]); i = i+1
  end while
  checkMissileExtra(check,level.entities[1022])
  return void
end function
function runMissileAction(level,command)
  check = level.context
  if not check.missiles then return error(490,"Unknown combat command") end if
  ent = void
  if command[1] >= 0 then ent = level.entities[command[1]] end if
  switch command[0]
    case 21
      start = [n.bitsFloat(command[3]),n.bitsFloat(command[4]),n.bitsFloat(command[5])]
      dir = [n.bitsFloat(command[6]),n.bitsFloat(command[7]),n.bitsFloat(command[8])]
      created = missiles.fire(level,ent,start,dir,command[2]); checkWords(check,[32,created.slot]); checkVector(check,start); checkVector(check,dir)
    end case
    case 22
      missiles.run(level,ent)
    end case
    case 23
      missiles.explode(level,ent)
    end case
    case 24,25
      tr = brush.emptyTrace(); tr.fraction = n.bitsFloat(command[2]); tr.surfaceFlags = command[4]
      tr.normal = [n.bitsFloat(command[5]),n.bitsFloat(command[6]),n.bitsFloat(command[7])]
      hit = movement.Collision(tr,[n.bitsFloat(command[8]),n.bitsFloat(command[9]),n.bitsFloat(command[10])],command[3])
      if command[0] == 24 then missiles.bounce(level,ent,hit) else missiles.impact(level,ent,hit) end if
      checkWord(check,33); checkVector(check,hit.endpos)
    end case
    case 26
      missiles.hookThink(level,ent)
    end case
    case 27
      missiles.hookFree(level,ent)
    end case
    case 28
      frame.runEntities(level)
    end case
    case 29
      dir = [n.bitsFloat(command[2]),n.bitsFloat(command[3]),n.bitsFloat(command[4])]
      start = [n.bitsFloat(command[5]),n.bitsFloat(command[6]),n.bitsFloat(command[7])]; source = dir
      if command[8] != 0 then source = void end if
      result = directions.dirToByte(source); missiles.snapTowards(dir,start); checkWords(check,[34,result]); checkVector(check,dir)
    end case
    case 30
      funcs.initShooter(level,ent,command[2])
    end case
    case 31
      value = command[3]
      switch command[2]
        case 0
          level.previousTime = value
        end case
        case 1
          ent.s.eFlags = value
        end case
        case 2
          ent.s.pos.trType = value
        end case
        case 3
          ent.s.pos.trTime = value
        end case
        case 4
          ent.s.pos.trDuration = value
        end case
        case 5
          ent.splashDamage = value
        end case
        case 6
          ent.splashRadius = value
        end case
        case 7
          ent.parent = void
          if value >= 0 then ent.parent = level.entities[value] end if
        end case
        case 8
          ent.target_ent = void
          if value >= 0 then ent.target_ent = level.entities[value] end if
        end case
        case 9
          ent.clipmask = value
        end case
        case 10
          ent.client.accuracy_hits = value
        end case
        case 11
          ent.nextthink = value
        end case
        case 12
          names = [void,"leaf","changed","dest","missing",""]; ent.target = names[value]
        end case
        case 13
          ent.random = n.bitsFloat(value)
        end case
        case 14
          level.randSeed = value
        end case
        case 15
          ent.s.weapon = value
        end case
        case 16
          ent.think = void
          if value != 0 then ent.think = missiles.explode end if
        end case
        case 17
          ent.client.hook = void
          if value >= 0 then ent.client.hook = level.entities[value] end if
        end case
      end switch
    end case
    case 32
      vector = [n.bitsFloat(command[3]),n.bitsFloat(command[4]),n.bitsFloat(command[5])]
      if command[2] != 0 then ent.s.pos.trDelta = vector else ent.s.pos.trBase = vector end if
    end case
    case 33
      vector = directions.perpendicular([n.bitsFloat(command[2]),n.bitsFloat(command[3]),n.bitsFloat(command[4])]); checkWord(check,35); checkVector(check,vector)
    end case
    case 34
      checkWords(check,[36,shooters.weaponItem(command[1])])
    end case
    case 35
      i = 72
      while i < level.num_entities
        if level.entities[i].inuse then game.free(level,level.entities[i]) end if
        i = i+1
      end while
    end case
    case default
      return error(490,"Unknown missile command")
    end case
  end switch
  return void
end function
function runMissileContracts(level)
  client = game.createClient(ps.create(),0,[0,0,0])
  requireSpawnContract(client.hook == void and client.accuracy_hits == 0,"client missile fields initialize")
  ent = game.spawn(level); ent.parent = level.entities[0]; ent.target_ent = level.entities[1]
  ent.splashDamage = 100; ent.splashRadius = 120; ent.methodOfDeath = 6; ent.splashMethodOfDeath = 7; ent.clipmask = 0x6000001; game.free(level,ent)
  requireSpawnContract(ent.parent == void and ent.target_ent == void and ent.splashDamage == 0 and ent.splashRadius == 0 and ent.methodOfDeath == 0 and ent.splashMethodOfDeath == 0 and ent.clipmask == 0,"free clears missile fields")
  caught = try(missiles.fire(level,ent,[0.0,0.0,128.0],[1.0,0.0,0.0],99)); requireSpawnContract(caught is error,"unknown projectile weapon")
  caught = try(missiles.hookFree(level,ent)); requireSpawnContract(caught is error,"hook free requires parent client")
  caught = try(missiles.hookThink(level,ent)); requireSpawnContract(caught is error,"hook think requires parent client")
  ent.r.ownerNum = 0; caught = try(missiles.accuracy(level,ent)); requireSpawnContract(caught is error,"accuracy requires owner client")
  caught = try(shooters.weaponItem(0)); requireSpawnContract(caught is error,"missing weapon item")
  caught = try(shooters.registerItem(level,-1)); requireSpawnContract(caught is error,"NULL item registration")
  print "PASS: 8 missile runtime contracts"
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
  attacker.takedamage = true; attacker.health = 100; attacker.client.ps.stats[0] = 100
  game.setOrigin(attacker,[2.0,0.0,128.0]); game.link(level,attacker)
  combat.radiusDamage(level,[0.0,0.0,128.0],level.entities[1022],100.0,1.00000001,void,7)
  requireSpawnContract(attacker.health == 100,"radius argument rounds to C float before distance comparison")
  attacker.health = 20000000; attacker.client.ps.stats[0] = 20000000
  combat.radiusDamage(level,[0.0,0.0,128.0],level.entities[1022],16777217.0,4.0,void,7)
  requireSpawnContract(attacker.health == 7417088,"damage argument rounds to C float before falloff")
  print "PASS: 8 combat runtime contracts"
  return void
end function
function runSpawnContracts(level)
  s = spawn.create(level,""); ent = level.entities[64]
  caught = try(spawn.parseField("origin","1 2",ent)); requireSpawnContract(caught is error,"partial field vector")
  caught = try(spawn.newString("tail\\")); requireSpawnContract(caught is error,"trailing escape")
  caught = try(spawn.load(s)); requireSpawnContract(caught is error,"empty map")
  other = spawn.create(level,"{ classname info_null }"); caught = try(spawn.load(other)); requireSpawnContract(caught is error,"first worldspawn")
  level.spawner = s; ent.classname = "item_quad"; requireSpawnContract(spawn.callSpawn(s,ent) and ent.item == 28 and ent.think == items.finishSpawning and ent.nextthink == level.time+200,"item spawn dispatch")
  ent.classname = "func_door"; caught = try(spawn.callSpawn(s,ent)); requireSpawnContract(caught is error,"unported class")
  ent.classname = void; requireSpawnContract(not spawn.callSpawn(s,ent),"NULL classname")
  ent.classname = "INFO_PLAYER_START"; requireSpawnContract(not spawn.callSpawn(s,ent),"case-sensitive class")
  ent.think = void; ent.item = void
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
  for each type in [2,4]
    node.s.eType = type; caught = try(frame.runEntities(fresh)); requireSpawnContract(caught is error,"missing entity frame handler")
  end for
  node.s.eType = 0; node.physicsObject = true; caught = try(frame.runEntities(fresh)); requireSpawnContract(caught is error,"missing physics handler")
  node.physicsObject = false; node.s.eType = 3; node.r.ownerNum = 1023; game.setOrigin(node,[0.0,0.0,128.0]); frame.runEntities(fresh)
  requireSpawnContract(node.r.linked,"missile frame uses actual handler")
  node.inuse = false; game.initEntity(fresh.entities[0]); caught = try(frame.runEntities(fresh)); requireSpawnContract(not (caught is error),"default client frame handler")
  longName = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  caught = try(targets.addRemap(fresh,longName,"new",0.0)); requireSpawnContract(caught is error,"overlong shader source")
  caught = try(targets.addRemap(fresh,"old",longName,0.0)); requireSpawnContract(caught is error,"overlong shader destination")
  ent.classname = "target_speaker"; caught = try(funcs.dispatch(level,ent)); requireSpawnContract(caught is error,"speaker requires noise key")
  values.setConfig(s,608,void); requireSpawnContract(s.configstrings[608] == "","NULL configstring storage")
  print "PASS: 30 spawn/target/frame runtime contracts"
  return void
end function
function checkBodyExtra(check,ent)
  think = 2; die = 2
  if ent.think == void then think = 0 else if ent.think == bodies.sink then think = 1 end if
  if ent.die == void then die = 0 else if ent.die == bodies.die then die = 1 end if
  checkWords(check,[ent.slot,ent.clipmask,n.floatBits(ent.physicsBounce),think,die])
  return void
end function
function checkBodyState(level)
  check = level.context
  if not check.bodies then return void end if
  checkWords(check,[38,level.previousTime,level.blood,level.bodyQueIndex])
  for i = 0 to 7
    slot = -1
    if i < len(level.bodyQue) then slot = level.bodyQue[i].slot end if
    checkWord(check,slot)
  end for
  checkVector(check,level.intermission_origin); checkVector(check,level.intermission_angle); checkWord(check,level.num_entities-64+4)
  for i = 0 to 2
    checkBodyExtra(check,level.entities[i])
  end for
  i = 64
  while i < level.num_entities
    checkBodyExtra(check,level.entities[i]); i = i+1
  end while
  checkBodyExtra(check,level.entities[1022])
  return void
end function
function runBodyAction(level,a)
  check = level.context; ent = void
  if a[1] >= 0 then ent = level.entities[a[1]] end if
  switch a[0]
    case 40
      origin = [123.5,-45.25,67.75]; angles = [-12.5,23.25,34.75]; avoid = [n.bitsFloat(a[5]),n.bitsFloat(a[6]),n.bitsFloat(a[7])]
      chosen = void; result = -1
      switch a[2]
        case 0
          result = boolean(playerSpawns.wouldTelefrag(level,ent))
        end case
        case 1
          chosen = playerSpawns.nearest(level,avoid)
        end case
        case 2
          chosen = playerSpawns.randomDeathmatch(level)
        end case
        case 3
          chosen = playerSpawns.furthest(level,avoid,origin,angles)
        end case
        case 4
          chosen = playerSpawns.selectSpawn(level,avoid,origin,angles)
        end case
        case 5
          chosen = playerSpawns.initial(level,origin,angles)
        end case
        case 6
          chosen = playerSpawns.randomTeam(level,a[4],a[3])
        end case
        case 7
          chosen = playerSpawns.ctf(level,a[3],a[4],origin,angles)
        end case
        case 8
          chosen = playerSpawns.spectator(level,origin,angles)
        end case
        case 9
          playerSpawns.findIntermission(level)
        end case
      end switch
      if a[2] != 0 then result = actionSlot(chosen) end if
      checkWords(check,[39,a[2],result]); checkVector(check,origin); checkVector(check,angles)
    end case
    case 41
      bodies.initQueue(level)
    end case
    case 42
      bodies.copyToQueue(level,ent)
    end case
    case 43
      bodies.sink(level,ent)
    end case
    case 44
      bodies.gib(level,ent,a[2])
    end case
    case 45
      bodies.die(level,ent,void,void,100,6)
    end case
    case 46
      other = void; attacker = void
      if a[2] >= 0 then other = level.entities[a[2]] end if
      if a[3] >= 0 then attacker = level.entities[a[3]] end if
      bodies.lookAtKiller(level,ent,other,attacker)
    end case
    case 47
      bodies.run(level,ent)
    end case
    case 48
      tr = brush.emptyTrace(); tr.fraction = n.bitsFloat(a[2]); tr.normal = [n.bitsFloat(a[5]),n.bitsFloat(a[6]),n.bitsFloat(a[7])]
      hit = movement.Collision(tr,[n.bitsFloat(a[8]),n.bitsFloat(a[9]),n.bitsFloat(a[10])],a[3]); bodies.bounce(level,ent,hit)
      checkWord(check,33); checkVector(check,hit.endpos)
    end case
    case 49
      key = a[2]; value = a[3]
      if key >= 100 and key < 152 then
        words = es.words(ent.s); words[key-100] = value; data = array(208,0)
        for i = 0 to 51
          n.writeU32(data,i*4,words[i])
        end for
        ent.s = es.load(data,0)
      else
        switch key
          case 0
            level.blood = value
          end case
          case 1
            ent.s.groundEntityNum = value
          end case
          case 2
            ent.s.legsAnim = value
          end case
          case 3
            ent.s.torsoAnim = value
          end case
          case 4
            ent.s.eFlags = value
          end case
          case 5
            ent.s.powerups = value
          end case
          case 6
            ent.s.loopSound = value
          end case
          case 7
            ent.s.event = value
          end case
          case 8
            ent.s.pos.trType = value
          end case
          case 9
            ent.s.pos.trTime = value
          end case
          case 10
            ent.s.pos.trDuration = value
          end case
          case 11
            ent.physicsBounce = n.bitsFloat(value)
          end case
          case 12
            level.previousTime = value
          end case
          case 13
            ent.die = void
            if value != 0 then ent.die = bodies.die end if
          end case
          case 14
            ent.classname = ["bodyque","kamikaze timer","Kamikaze timer","info_notnull"][value]
          end case
          case 15
            ent.r.svFlags = value
          end case
          case 16
            level.randSeed = value
          end case
          case 17
            names = [void,"leaf","changed","dest","missing",""]; ent.target = names[value]
          end case
          case 18
            ent.clipmask = value
          end case
          case 19
            ent.physicsObject = value != 0
          end case
          case 20
            ent.think = void
            if value != 0 then ent.think = bodies.sink end if
          end case
        end switch
      end if
    end case
    case 50
      vector = [n.bitsFloat(a[3]),n.bitsFloat(a[4]),n.bitsFloat(a[5])]
      if a[2] != 0 then ent.s.pos.trDelta = vector else ent.s.pos.trBase = vector end if
    end case
    case 51
      frame.runEntities(level)
    end case
    case 52
      checkWords(check,[40,n.floatBits(bodies.vectorYaw([n.bitsFloat(a[2]),n.bitsFloat(a[3]),n.bitsFloat(a[4])]))])
    end case
    case default
      return error(490,"Unknown body command")
    end case
  end switch
  return void
end function
function recordScoreMessage(level,slot,message)
  checkWords(level.context,[42,slot]); checkString(level.context,message)
  return void
end function
function recordScoreLog(level,message)
  checkWord(level.context,41); checkString(level.context,message)
  return void
end function
function recordScoreTransition(level,kind)
  checkWords(level.context,[43,kind,level.time,level.intermissionQueued,level.intermissiontime,level.exitTime,boolean(level.readyToExit),level.numConnectedClients,level.numPlayingClients])
  if level.entities[1022].count == 1 and kind == 1 then level.intermissiontime = level.time end if
  if level.entities[1022].count == 2 and kind == 2 then level.intermissiontime = 0 end if
  return void
end function
function recordTeamMessage(level,slot,message)
  checkWords(level.context,[49,slot]); checkString(level.context,message); return void
end function
function recordClientSpawn(level,ent)
  checkWords(level.context,[50,ent.slot]); ent.client.ps.origin = [111.0,222.0,333.0]; ent.s.clientNum = ent.slot+10; return void
end function
function checkScoreState(level)
  check = level.context
  if not check.scores then return void end if
  checkWords(check,[44,level.maxclients,level.maxclientsCvar,level.follow1,level.follow2,level.numConnectedClients,level.numNonSpectatorClients,level.numPlayingClients,level.numVotingClients,level.intermissiontime,level.timelimit,level.fraglimit,level.capturelimit,boolean(level.readyToExit),level.exitTime,level.startTime])
  checkWords(check,level.teamScores); checkWords(check,level.numteamVotingClients); checkWords(check,level.sortedClients)
  for i = 0 to 63
    cl = level.clients[i]; ent = level.entities[i]; checkWords(check,ps.words(cl.ps))
    checkWords(check,[cl.connected,cl.team,cl.spectatorState,cl.spectatorClient,cl.spectatorTime,cl.enterTime,cl.accuracy_hits,cl.accuracy_shots,boolean(cl.readyToExit)]); checkString(check,cl.netname)
    checkWords(check,[boolean(ent.client == cl),ent.s.number,ent.r.svFlags,ent.s.powerups,ent.r.singleClient])
  end for
  checkWord(check,level.num_entities-64+1); i = 64
  while i < level.num_entities
    checkWords(check,[i,level.entities[i].r.singleClient]); i = i+1
  end while
  checkWords(check,[1022,level.entities[1022].r.singleClient])
  return void
end function
function checkDeathState(level)
  check = level.context
  if not check.deaths then return void end if
  checkWords(check,[51,level.blood])
  for i = 0 to 63
    cl = level.clients[i]; ent = level.entities[i]; die = 0
    if ent.die == deaths.playerDie then die = 1 else if ent.die == bodies.die then die = 2 else if ent.die != void then die = 3 end if
    checkWords(check,[cl.lastkilled_client,cl.respawnTime,cl.rewardTime,cl.lastKillTime,cl.cmdWeapon])
    checkReal(check,cl.lastfraggedcarrier)
    checkWords(check,[cl.fragcarrier,cl.carrierdefense,cl.basedefense,actionSlot(cl.hook),die,actionSlot(ent.enemy)])
  end for
  return void
end function
function checkItemState(level)
  check = level.context
  if not check.items then return void end if
  checkWords(check,[52,level.redFlagStatus,level.blueFlagStatus,level.neutralFlagStatus]); checkString(check,level.spawner.configstrings[23])
  checkWords(check,[level.maxclients,level.weaponRespawn,level.weaponTeamRespawn]); checkWords(check,level.teamScores)
  checkWords(check,[level.redTakenTime,level.blueTakenTime]); checkReal(check,level.lastFlagCapture); checkWord(check,level.lastCaptureTeam)
  for i = 0 to 2
    cl = level.entities[i].client; checkWord(check,boolean(cl != void))
    if cl != void then
      checkWords(check,[boolean(cl.predictItemPickup),cl.captures,cl.flagrecovery,cl.assists,cl.rewardTime]); checkReal(check,cl.lastreturnedflag); checkReal(check,cl.flagsince); checkReal(check,cl.lastfraggedcarrier)
    end if
  end for
  checkWord(check,level.num_entities-64)
  i = 64
  while i < level.num_entities
    ent = level.entities[i]; item = -1
    if ent.item != void then item = ent.item end if
    checkWords(check,[i,item,actionSlot(ent.teammaster),actionSlot(ent.teamchain)])
    i = i+1
  end while
  return void
end function
function itemPlayerName(index)
  names = ["","Alpha","Bravo","Charlie"]
  if index >= 0 and index < len(names) then return names[index] end if
  return "Player"
end function
function itemTargetUse(level,ent,other,activator)
  checkWords(level.context,[55,ent.slot,actionSlot(other),actionSlot(activator)]); ent.count = ent.count+1; return void
end function
function runItemAction(level,a,check)
  ent = void; value = 0
  if a[1] >= 0 and a[1] < 1024 then ent = level.entities[a[1]] end if
  switch a[0]
    case 91
      level.spawner.gametype = a[1]; level.time = a[2]; level.previousTime = a[3]
      level.redFlagStatus = a[4]; level.blueFlagStatus = a[5]; level.neutralFlagStatus = a[6]
    end case
    case 92
      if a[1] >= level.num_entities then
        created = game.spawn(level)
        if created != ent then return error(490,"Non-sequential item test slot") end if
      else game.initEntity(ent) end if
      ent.item = a[2]; ent.classname = items.itemName(a[2]); ent.flags = a[3]
      ent.s.eType = 2; ent.s.modelindex = a[2]; ent.s.modelindex2 = boolean((a[3] & 0x1000) != 0); ent.physicsBounce = n.bitsFloat(a[10])
      ent.r.mins = [-15.0,-15.0,-15.0]; ent.r.maxs = [15.0,15.0,15.0]; ent.r.contents = 0x40000000; ent.touch = items.touch
      ent.s.pos.trBase = [n.bitsFloat(a[4]),n.bitsFloat(a[5]),n.bitsFloat(a[6])]; ent.r.currentOrigin = movement.copy(ent.s.pos.trBase)
      if a[11] != 0 then game.link(level,ent) end if
    end case
    case 93
      created = items.launch(level,a[1],[n.bitsFloat(a[2]),n.bitsFloat(a[3]),n.bitsFloat(a[4])],[n.bitsFloat(a[5]),n.bitsFloat(a[6]),n.bitsFloat(a[7])])
      checkWords(check,[53,created.slot])
    end case
    case 94
      created = items.drop(level,ent,a[2],n.bitsFloat(a[3])); checkWords(check,[53,created.slot])
    end case
    case 95
      items.respawn(level,ent)
    end case
    case 96
      items.checkDropped(level,ent)
    end case
    case 97
      created = items.resetFlag(level,a[1]); checkWords(check,[54,actionSlot(created)])
    end case
    case 98
      items.returnFlag(level,a[1])
    end case
    case 99
      items.teamFree(level,ent)
    end case
    case 100
      items.droppedFlagThink(level,ent)
    end case
    case 101
      items.run(level,ent)
    end case
    case 102
      switch a[2]
        case 0
          if a[3] < 0 then ent.item = void else ent.item = a[3] end if
        end case
        case 1
          ent.physicsBounce = n.bitsFloat(a[3])
        end case
        case 2
          ent.s.groundEntityNum = a[3]
        end case
        case 3
          ent.clipmask = a[3]
        end case
        case 4
          ent.s.pos.trType = a[3]
        end case
        case 5
          ent.s.pos.trTime = a[3]
        end case
        case 6
          ent.flags = a[3]
        end case
        case 7
          ent.r.contents = a[3]
        end case
        case 8
          if a[3] < 0 then ent.teammaster = void else ent.teammaster = level.entities[a[3]] end if
        end case
        case 9
          if a[3] < 0 then ent.teamchain = void else ent.teamchain = level.entities[a[3]] end if
        end case
        case 10
          if a[3] == 0 then ent.team = void else ent.team = "group" end if
        end case
        case 11
          ent.r.ownerNum = a[3]
        end case
        case 12
          ent.nextthink = a[3]
        end case
        case 13
          ent.s.eFlags = a[3]
        end case
        case 14
          ent.r.svFlags = a[3]
        end case
        case 15
          ent.speed = n.bitsFloat(a[3])
        end case
      end switch
    end case
    case 103
      vector = [n.bitsFloat(a[3]),n.bitsFloat(a[4]),n.bitsFloat(a[5])]
      if a[2] == 0 then ent.s.pos.trBase = vector
      else if a[2] == 1 then ent.s.apos.trBase = vector
      else if a[2] == 2 then ent.s.pos.trDelta = vector
      else if a[2] == 3 then ent.r.currentOrigin = vector
      else return error(490,"Unknown item vector") end if
    end case
    case 104
      frame.runEntities(level)
    end case
    case 105
      items.spawnItem(level,ent,a[2])
    end case
    case 106
      items.finishSpawning(level,ent)
    end case
    case 107
      game.initEntity(ent); client = game.createClient(ps.create(),a[2],[0,0,0]); game.bindClient(level,ent,client)
      ent.s.eType = 1; ent.s.clientNum = a[1]; client.ps.clientNum = a[1]; client.team = a[2]; client.ps.persistant[c.PERS_TEAM] = a[2]
      ent.health = a[3]; client.ps.stats[c.STAT_HEALTH] = a[3]; client.ps.stats[c.STAT_MAX_HEALTH] = a[4]; client.predictItemPickup = a[5] != 0; client.connected = a[6]; client.netname = itemPlayerName(a[7])
      if level.maxclients < a[1]+1 then level.maxclients = a[1]+1 end if
    end case
    case 108
      client = ent.client
      switch a[2]
        case 0
          client.ps.ammo[a[4]] = a[3]
        end case
        case 1
          client.ps.powerups[a[4]] = a[3]
        end case
        case 2
          client.ps.stats[a[4]] = a[3]
        end case
        case 3
          client.ps.persistant[a[4]] = a[3]
        end case
        case 4
          client.predictItemPickup = a[3] != 0
        end case
        case 5
          client.connected = a[3]
        end case
        case 6
          client.team = a[3]; client.ps.persistant[c.PERS_TEAM] = a[3]
        end case
        case 7
          client.flagrecovery = a[3]
        end case
        case 8
          client.lastreturnedflag = n.bitsFloat(a[3])
        end case
        case 9
          client.captures = a[3]
        end case
        case 10
          client.assists = a[3]
        end case
        case 11
          client.flagsince = n.bitsFloat(a[3])
        end case
        case 12
          client.lastfraggedcarrier = n.bitsFloat(a[3])
        end case
        case 13
          client.rewardTime = a[3]
        end case
        case 14
          client.ps.viewangles[a[4]] = n.bitsFloat(a[3])
        end case
        case 15
          ent.health = a[3]
        end case
        case 16
          client.ps.eFlags = a[3]
        end case
        case 17
          ent.s.number = a[3]
        end case
        case 18
          ent.inuse = a[3] != 0
        end case
      end switch
    end case
    case 109
      items.touch(level,ent,level.entities[a[2]],void)
    end case
    case 110
      value = items.canGrab(level.spawner.gametype,ent,level.entities[a[2]].client.ps); checkWords(check,[57,boolean(value)])
    end case
    case 111
      if a[3] == 0 then value = items.pickupPowerup(level,ent,level.entities[a[2]])
      else if a[3] == 1 then value = items.pickupHoldable(level,ent,level.entities[a[2]])
      else if a[3] == 2 then value = items.pickupAmmo(level,ent,level.entities[a[2]])
      else if a[3] == 3 then value = items.pickupWeapon(level,ent,level.entities[a[2]])
      else if a[3] == 4 then value = items.pickupHealth(level,ent,level.entities[a[2]])
      else if a[3] == 5 then value = items.pickupArmor(level,ent,level.entities[a[2]])
      else if a[3] == 6 then value = items.pickupTeam(level,ent,level.entities[a[2]])
      else return error(490,"Unknown pickup function") end if
      checkWords(check,[58,a[3],value])
    end case
    case 112
      if a[2] == 0 then ent.count = a[3]
      else if a[2] == 1 then ent.wait = n.bitsFloat(a[3])
      else if a[2] == 2 then ent.random = n.bitsFloat(a[3])
      else if a[2] == 3 then ent.speed = n.bitsFloat(a[3])
      else if a[2] == 4 then if a[3] == 0 then ent.target = void else ent.target = "pickup_target" end if
      else if a[2] == 5 then ent.spawnflags = a[3]
      else if a[2] == 6 then ent.s.modelindex2 = a[3]
      else if a[2] == 7 then ent.flags = a[3]
      else if a[2] == 8 then ent.r.contents = a[3]
      else return error(490,"Unknown pickup item field") end if
    end case
    case 113
      if a[2] == 0 then level.time = a[3]
      else if a[2] == 1 then level.weaponRespawn = a[3]
      else if a[2] == 2 then level.weaponTeamRespawn = a[3]
      else if a[2] == 3 then level.teamScores[a[4]] = a[3]
      else if a[2] == 4 then level.redTakenTime = a[3]
      else if a[2] == 5 then level.blueTakenTime = a[3]
      else if a[2] == 6 then level.lastFlagCapture = n.bitsFloat(a[3])
      else if a[2] == 7 then level.lastCaptureTeam = a[3]
      else if a[2] == 8 then level.maxclients = a[3]
      else if a[2] == 9 then level.spawner.warmupTime = a[3]
      else return error(490,"Unknown pickup level field") end if
    end case
    case 114
      if a[1] >= level.num_entities then
        created = game.spawn(level)
        if created != ent then return error(490,"Non-sequential target test slot") end if
      else game.initEntity(ent) end if
      ent.targetname = "pickup_target"; ent.use = itemTargetUse
    end case
    case default
      return error(490,"Unknown item command")
    end case
  end switch
  return void
end function
function runDeathAction(level,a)
  ent = void
  if a[1] >= 0 and a[1] < 1024 then ent = level.entities[a[1]] end if
  switch a[0]
    case 80
      game.initEntity(ent); cl = game.createClient(ps.create(),a[3],[0,0,0]); game.bindClient(level,ent,cl)
      ent.s.eType = 1; ent.s.number = a[1]; cl.ps.clientNum = a[1]; cl.connected = a[2]; cl.team = a[3]; cl.ps.persistant[3] = a[3]
      ent.health = a[4]; cl.ps.stats[0] = a[4]; ent.takedamage = true; ent.die = deaths.playerDie
      ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.contents = 0x2000000; cl.netname = scoreTestName(a[5])
    end case
    case 81
      key = a[2]; value = a[3]; cl = ent.client
      switch key
        case 0
          ent.s.weapon = value
        end case
        case 1
          cl.ps.weaponstate = value
        end case
        case 2
          cl.cmdWeapon = value
        end case
        case 3
          cl.ps.stats[2] = value
        end case
        case 4
          cl.ps.ammo[a[4]] = value
        end case
        case 5
          cl.ps.powerups[a[4]] = value
        end case
        case 6
          cl.ps.pm_type = value
        end case
        case 7
          cl.lastKillTime = value
        end case
        case 8
          cl.lasthurtcarrier = n.f32(value)
        end case
        case 9
          ent.s.powerups = value
        end case
        case 10
          ent.s.loopSound = value
        end case
        case 11
          ent.s.angles[a[4]] = n.bitsFloat(value)
        end case
        case 12
          cl.ps.legsAnim = value
        end case
        case 13
          cl.ps.torsoAnim = value
        end case
        case 14
          ent.flags = value
        end case
        case 15
          ent.r.svFlags = value
        end case
        case 16
          ent.s.number = value
        end case
        case 17
          ent.s.clientNum = value
        end case
        case 18
          cl.ps.generic1 = value
        end case
        case 19
          cl.hook = void
          if value >= 0 then cl.hook = level.entities[value] end if
        end case
        case 20
          ent.parent = void
          if value >= 0 then ent.parent = level.entities[value] end if
        end case
        case 21
          level.blood = value
        end case
        case 22
          ent.health = value
        end case
        case 23
          cl.respawnTime = value
        end case
        case 24
          cl.rewardTime = value
        end case
        case 25
          cl.ps.eFlags = value
        end case
      end switch
    end case
    case 82
      inflictor = void; attacker = void
      if a[2] >= 0 then inflictor = level.entities[a[2]] end if
      if a[3] >= 0 then attacker = level.entities[a[3]] end if
      deaths.playerDie(level,ent,inflictor,attacker,a[4],a[5])
    end case
    case 83
      inflictor = void; attacker = void
      if a[2] >= 0 then inflictor = level.entities[a[2]] end if
      if a[3] >= 0 then attacker = level.entities[a[3]] end if
      teamBonuses.fragBonuses(level,ent,inflictor,attacker)
    end case
    case 84
      deaths.tossClientItems(level,ent)
    end case
    case 85
      attacker = void
      if a[2] >= 0 then attacker = level.entities[a[2]] end if
      deaths.checkAlmostCapture(level,ent,attacker)
    end case
    case 86
      attacker = void
      if a[2] >= 0 then attacker = level.entities[a[2]] end if
      deaths.checkAlmostScored(level,ent,attacker)
    end case
    case 87
      deaths.respawn(level,ent)
    end case
    case 88
      if a[1] >= level.num_entities then ent = game.spawn(level) else game.initEntity(ent) end if
      ent.classname = [void,"leaf","changed","dest","missing","","team_CTF_redflag","team_CTF_blueflag","team_redobelisk","team_blueobelisk"][a[2]]; ent.flags = a[3]
      ent.s.origin = [n.bitsFloat(a[4]),n.bitsFloat(a[5]),n.bitsFloat(a[6])]; ent.r.currentOrigin = [n.bitsFloat(a[7]),n.bitsFloat(a[8]),n.bitsFloat(a[9])]
    end case
    case 89
      ent.s.pos.trBase = [n.bitsFloat(a[2]),n.bitsFloat(a[3]),n.bitsFloat(a[4])]
      ent.r.currentOrigin = [n.bitsFloat(a[5]),n.bitsFloat(a[6]),n.bitsFloat(a[7])]
      if ent.client != void then ent.client.ps.origin = [n.bitsFloat(a[8]),n.bitsFloat(a[9]),n.bitsFloat(a[10])] end if
    end case
    case 90
      bodies.initQueue(level)
    end case
  end switch
  return void
end function
function scoreTestName(index)
  return ["","Player","^1Red","^4Blue","Name with spaces","Quote\"Player","01234567890123456789012345678901234"][index]
end function
function runScoreAction(level,a)
  ent = void; cl = void
  if a[1] >= 0 and a[1] < 1024 then ent = level.entities[a[1]] end if
  if a[1] >= 0 and a[1] < 64 then cl = level.clients[a[1]] end if
  switch a[0]
    case 60
      game.initEntity(ent); cl = game.bindClient(level,ent,game.createClient(ps.create(),a[3],[0,0,0])); ent.s.eType = 1; cl.ps.clientNum = a[1]
      cl.connected = a[2]; cl.ps.persistant[0] = a[4]; cl.ps.ping = a[5]; cl.spectatorState = a[6]; cl.spectatorClient = a[7]; cl.spectatorTime = a[8]
      cl.enterTime = a[9]; cl.accuracy_hits = a[10]; cl.accuracy_shots = a[11]; cl.readyToExit = a[12] != 0; ent.r.svFlags = a[13]; cl.netname = scoreTestName(a[14])
    end case
    case 61
      key = a[2]; value = a[3]
      if key >= 100 and key < 116 then cl.ps.persistant[key-100] = value
      else
        switch key
          case 0
          cl.connected = value
          end case
          case 1
          cl.team = value
          end case
          case 2
          cl.ps.ping = value
          end case
          case 3
          cl.spectatorState = value
          end case
          case 4
          cl.spectatorClient = value
          end case
          case 5
          cl.spectatorTime = value
          end case
          case 6
          cl.enterTime = value
          end case
          case 7
          cl.accuracy_hits = value
          end case
          case 8
          cl.accuracy_shots = value
          end case
          case 9
          cl.readyToExit = value != 0
          end case
          case 10
          ent.r.svFlags = value
          end case
          case 11
          ent.s.powerups = value
          end case
          case 12
          cl.ps.clientNum = value
          end case
          case 13
          cl.netname = scoreTestName(value)
          end case
          case 14
          ent.client = void
          if value != 0 then ent.client = cl end if
          end case
          case 15
          ent.s.number = value
          end case
          case 16
          ent.r.singleClient = value
          end case
        end switch
      end if
    end case
    case 62
      key = a[2]; value = a[3]
      if key >= 100 and key < 104 then level.teamScores[key-100] = value
      else if key >= 200 and key < 264 then level.sortedClients[key-200] = value
      else
        switch key
          case 0
            level.maxclients = value
          end case
          case 1
            level.maxclientsCvar = value
          end case
          case 2
            level.intermissiontime = value
          end case
          case 3
            level.spawner.warmupTime = value
          end case
          case 4
            level.intermissionQueued = value
          end case
          case 5
            level.time = value
          end case
          case 6
            level.startTime = value
          end case
          case 7
            level.timelimit = value
          end case
          case 8
            level.fraglimit = value
          end case
          case 9
            level.capturelimit = value
          end case
          case 10
            level.readyToExit = value != 0
          end case
          case 11
            level.exitTime = value
          end case
          case 12
            level.spawner.gametype = value
          end case
          case 13
            level.numConnectedClients = value
          end case
          case 14
            level.numPlayingClients = value
          end case
          case 15
            level.entities[1022].count = value
          end case
          case 16
            level.spawner.spawning = value != 0
          end case
          case 17
            level.spawner.vars = []; i = 0
            while i < value
              level.spawner.vars = level.spawner.vars+[["scoretest","1"]]; i = i+1
            end while
          end case
          case 18
            level.spawner.chars = value
          end case
        end switch
      end if
    end case
    case 63
      scores.calculateRanks(level)
    end case
    case 64
      scores.commandScore(level,ent)
    end case
    case 65
      scores.sendAll(level)
    end case
    case 66
      scores.addScore(level,ent,[n.bitsFloat(a[3]),n.bitsFloat(a[4]),n.bitsFloat(a[5])],a[2])
    end case
    case 67
      scores.scorePlum(level,ent,[n.bitsFloat(a[3]),n.bitsFloat(a[4]),n.bitsFloat(a[5])],a[2])
    end case
    case 68
      checkWords(level.context,[45,scores.compareRanks(level,a[1],a[2])])
    end case
    case 69
      rankSort.sortIndices(level,level.sortedClients,a[1],scores.compareRanks)
    end case
    case 70
      checkWords(level.context,[46,boolean(scores.scoreIsTied(level))])
    end case
    case 71
      scores.checkExitRules(level)
    end case
    case 72
      reasons = ["Fraglimit hit.","Timelimit hit.","Capturelimit hit.","Test exit."]; scores.logExit(level,reasons[a[1]])
    end case
    case 73
      scores.checkIntermissionExit(level)
    end case
    case 74
      frame.runEntities(level)
    end case
    case 75
      i = 72
      while i < level.num_entities
        if level.entities[i].inuse then game.free(level,level.entities[i]) end if
        i = i+1
      end while
    end case
    case default
      return error(490,"Unknown score command")
    end case
  end switch
  return void
end function
function runScoreContracts(level)
  spawn.create(level,""); cl = level.clients[0]; ent = game.initEntity(level.entities[0])
  requireSpawnContract(len(level.clients) == 64 and cl != level.clients[1] and cl.connected == 0 and cl.netname == "" and len(level.numteamVotingClients) == 2,"persistent client slots and two team vote counters initialize independently")
  game.bindClient(level,ent,cl); cl.ps.persistant[0] = 123; game.free(level,ent)
  requireSpawnContract(ent.client == void and level.clients[0] == cl and cl.ps.persistant[0] == 123,"entity free retains persistent client storage")
  caught = try(game.bindClient(level,level.entities[64],cl)); requireSpawnContract(caught is error,"client binding range")
  caught = try(scores.clientLimit(65)); requireSpawnContract(caught is error,"score client limit")
  caught = try(scores.integerDivide(-2147483648,-1)); requireSpawnContract(caught is error,"native divide overflow rejects")
  caught = try(scores.integerDivide(1,0)); requireSpawnContract(caught is error,"divide by zero rejects")
  caught = try(rankSort.sortIndices(level,level.sortedClients,65,scores.compareRanks)); requireSpawnContract(caught is error,"sort range")
  caught = try(scores.commandScore(level,ent)); requireSpawnContract(caught is error,"scoreboard requires transport sink")
  caught = try(scores.logExit(level,"Test")); requireSpawnContract(caught is error and level.intermissionQueued == 0,"exit logging requires sink before queue mutation")
  level.intermissionQueued = 1000; level.time = 2000
  caught = try(scores.checkExitRules(level)); requireSpawnContract(caught is error and level.intermissionQueued == 0,"pending intermission clears before transition boundary")
  level.intermissiontime = 1000; level.time = 6000; level.maxclientsCvar = 1; cl.connected = 2; cl.readyToExit = true
  caught = try(scores.checkIntermissionExit(level)); requireSpawnContract(caught is error and cl.ps.stats[5] == 1,"readiness updates before exit boundary")
  ent.r.singleClient = 63; game.free(level,ent); requireSpawnContract(ent.r.singleClient == 0,"free clears single-client recipient")
  print "PASS: 12 score/rank runtime contracts"
  return void
end function
function runBodyContracts(level)
  ent = game.initEntity(level.entities[0]); ent.client = game.createClient(ps.create(),0,[0,0,0]); ent.s.origin = [0.0,0.0,128.0]
  requireSpawnContract(level.blood == 1 and level.bodyQueIndex == 0 and len(level.bodyQue) == 0,"body level defaults")
  game.link(level,ent); caught = try(bodies.copyToQueue(level,ent)); requireSpawnContract(caught is error and not ent.r.linked,"uninitialized queue rejects after unlink")
  ent.client = void; caught = try(bodies.lookAtKiller(level,ent,void,void)); requireSpawnContract(caught is error,"dead yaw requires client")
  caught = try(bodies.run(level,ent)); requireSpawnContract(caught is error,"unported physics boundary")
  ent.classname = "bodyque"; ent.s.eType = 2; caught = try(bodies.run(level,ent)); requireSpawnContract(caught is error,"item physics boundary")
  caught = try(playerSpawns.selectSpawn(level,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0])); requireSpawnContract(caught is error,"missing required spawn point")
  for i = 0 to 128
    spot = game.spawn(level); spot.classname = "info_player_deathmatch"; spot.s.origin = [0.0,0.0,128.0]
  end for
  caught = try(playerSpawns.randomDeathmatch(level)); requireSpawnContract(caught is error,"original 128 spot array overflow rejects")
  state = es.create(); state.pos.trBase = [1.0,2.0,3.0]; state.apos.trDelta = [4.0,5.0,6.0]; state.origin = [7.0,8.0,9.0]
  copied = es.copy(state); copied.pos.trBase[0] = 99.0; copied.apos.trDelta[1] = 99.0; copied.origin[2] = 99.0
  requireSpawnContract(state.pos.trBase[0] == 1.0 and state.apos.trDelta[1] == 5.0 and state.origin[2] == 9.0,"body entity state copies by value")
  ent.physicsBounce = 0.75; game.free(level,ent); requireSpawnContract(ent.physicsBounce == 0.0,"free clears physics bounce")
  bodies.initQueue(level); requireSpawnContract(len(level.bodyQue) == 8 and level.bodyQue[0].neverFree and level.bodyQue[7].classname == "bodyque","eight persistent body slots")
  print "PASS: 10 body/spawn runtime contracts"
  return void
end function
function runDeathContracts(level)
  spawn.create(level,"")
  cl = game.createClient(ps.create(),0,[0,0,0])
  requireSpawnContract(cl.lastkilled_client == 0 and cl.respawnTime == 0 and cl.rewardTime == 0 and cl.lastKillTime == 0 and cl.cmdWeapon == 0,"death client fields initialize")
  requireSpawnContract(cl.lastfraggedcarrier == 0.0 and cl.fragcarrier == 0 and cl.carrierdefense == 0 and cl.basedefense == 0,"team bonus fields initialize")
  requireSpawnContract(level.deathAnimIndex == 0 and level.itemDropFn == void and level.flagReturnFn == void and level.teamMessageFn == void and level.clientSpawnFn == void,"death boundaries initialize explicitly")
  requireSpawnContract(deaths.weaponItem(3) == 9 and deaths.weaponItem(4) == 11 and deaths.weaponItem(10) == 17 and deaths.powerupItem(1) == 28 and deaths.powerupItem(8) == 35,"baseq3 item mappings")
  ent = game.initEntity(level.entities[0]); game.bindClient(level,ent,cl); deaths.tossClientItems(level,ent)
  ent.s.weapon = 5; cl.ps.ammo[5] = 1; deaths.tossClientItems(level,ent); dropped = level.entities[64]
  requireSpawnContract(dropped.inuse and dropped.s.eType == 2 and dropped.item == 12 and dropped.classname == "weapon_rocketlauncher","weapon death drop creates an item entity")
  caught = try(deaths.returnFlag(level,1)); requireSpawnContract(caught is error,"flag return requires PrintMsg delivery")
  target = game.initEntity(level.entities[1]); game.bindClient(level,target,game.createClient(ps.create(),1,[0,0,0])); target.client.ps.powerups[8] = 1
  attacker = game.initEntity(level.entities[2]); game.bindClient(level,attacker,game.createClient(ps.create(),2,[0,0,0])); level.spawner.warmupTime = 1
  caught = try(teamBonuses.fragBonuses(level,target,void,attacker)); requireSpawnContract(caught is error,"team PrintMsg requires explicit sink")
  bare = game.initEntity(level.entities[3]); caught = try(deaths.playerDie(level,bare,void,attacker,1,6)); requireSpawnContract(caught is error,"player death requires a client")
  print "PASS: 8 death lifecycle runtime contracts"
  return void
end function
function runItemContracts(level)
  s = spawn.create(level,""); ent = game.initEntity(level.entities[64])
  requireSpawnContract(ent.item == void and ent.teammaster == void and ent.teamchain == void,"item entity references initialize explicitly")
  requireSpawnContract(level.redFlagStatus == 0 and level.blueFlagStatus == 0 and level.neutralFlagStatus == 0,"flag statuses initialize at base")
  requireSpawnContract(level.weaponRespawn == 5 and level.weaponTeamRespawn == 30 and not level.clients[0].predictItemPickup and level.clients[0].captures == 0 and level.clients[0].assists == 0,"pickup runtime defaults initialize")
  requireSpawnContract(items.itemQuantity(1) == 5 and items.itemQuantity(12) == 10 and items.itemQuantity(33) == 60,"baseq3 item quantities are pinned")
  caught = try(items.itemName(0)); requireSpawnContract(caught is error,"item zero is not a spawnable baseq3 item")
  caught = try(items.launch(level,36,[0.0,0.0,0.0],[0.0,0.0,0.0])); requireSpawnContract(caught is error,"out-of-range item rejects")
  caught = try(items.respawn(level,ent)); requireSpawnContract(caught is error,"respawn requires an item descriptor")
  ent.item = 12; ent.team = "group"; caught = try(items.respawn(level,ent)); requireSpawnContract(caught is error,"teamed item requires a master")
  caught = try(items.setFlagStatus(level,1,5)); requireSpawnContract(caught is error,"invalid flag status rejects")
  ent.s.modelindex = 0; caught = try(items.canGrab(0,ent,ps.create())); requireSpawnContract(caught is error,"pickup eligibility rejects an invalid item index")
  player = game.initEntity(level.entities[0]); cl = game.createClient(ps.create(),0,[0,0,0]); game.bindClient(level,player,cl)
  player.health = 100; cl.ps.stats[c.STAT_HEALTH] = 100; cl.ps.stats[c.STAT_MAX_HEALTH] = 100; ent.item = 12; ent.classname = items.itemName(12); ent.s.modelindex = 12; ent.team = void
  caught = try(items.touch(level,ent,player,void)); requireSpawnContract(caught is error,"successful item touch requires an explicit game log sink")
  ent.item = 12; game.free(level,ent); requireSpawnContract(ent.item == void and ent.teammaster == void and ent.teamchain == void,"free clears item references")
  print "PASS: 12 item/flag runtime contracts"
  return void
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  input = fs.readAllBytes(args[1]); check = Check(fs.readAllBytes(args[2]),0,0,0,0,0,false,false,false,false,false); level = game.create(world)
  level.time = 1000; level.startTime = 1000
  if len(args) > 4 and args[4] == "--item-contracts" then runItemContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--death-contracts" then runDeathContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--score-contracts" then runScoreContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--body-contracts" then runBodyContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--combat-contracts" then runCombatContracts(level); return 0 end if
  if len(args) > 4 and args[4] == "--missile-contracts" then runMissileContracts(level); return 0 end if
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
  else if len(args) > 4 and (args[4] == "--combat" or args[4] == "--missiles" or args[4] == "--bodies" or args[4] == "--scores" or args[4] == "--deaths" or args[4] == "--items") then
    check.missiles = args[4] == "--missiles"; check.bodies = args[4] == "--bodies"; check.deaths = args[4] == "--deaths"; check.items = args[4] == "--items"; check.scores = args[4] == "--scores" or check.deaths
    if check.scores then level.serverCommandFn = recordScoreMessage; level.gameLogFn = recordScoreLog; level.matchTransitionFn = recordScoreTransition; level.runEntityFn = actionRun end if
    if check.deaths then level.teamMessageFn = recordTeamMessage; level.clientSpawnFn = recordClientSpawn end if
    if check.items then level.teamMessageFn = recordTeamMessage; level.gameLogFn = recordScoreLog end if
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
    s.context = check; s.effectFn = recordSpawnEffect; s.unportedFn = recordSpawnBoundary; level.context = check; level.observeFn = recordSpawnSpatial; level.gamePrintFn = recordSpawnDiagnostic
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
