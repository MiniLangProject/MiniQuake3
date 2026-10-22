// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_trigger as trigger
import mq3.game.spawn_functions as functions
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

struct Context uses end struct
function require(ok,label)
  if not ok then return error(499,"g_trigger contract: "+label) end if
  return 1
end function
function used(level,ent,other,activator)
  level.context.uses = level.context.uses+[[ent.slot,other.slot,activator.slot]]
  return void
end function
function setup(world)
  level = game.create(world); state = spawn.create(level,""); level.context = Context([])
  level.num_entities = 64; level.time = 1000; level.damageFn = void
  return level
end function
function newEntity(level,classname)
  ent = game.spawn(level); ent.classname = classname; ent.s.origin = [0.0,0.0,0.0]
  return ent
end function
function player(level,slot,team)
  ent = game.initEntity(level.entities[slot]); game.bindClient(level,ent,level.clients[slot])
  ent.client.team = team; ent.client.ps.pm_type = c.PM_NORMAL; ent.client.ps.stats[c.STAT_HEALTH] = 100
  ent.client.ps.origin = [4096.0+slot*128.0,4096.0,128.0]; ent.r.currentOrigin = ent.client.ps.origin
  return ent
end function
function contracts(world)
  checks = 0; level = setup(world); red = player(level,0,c.TEAM_RED); blue = player(level,1,c.TEAM_BLUE); spectator = player(level,2,c.TEAM_SPECTATOR)
  leaf = newEntity(level,"info_notnull"); leaf.targetname = "leaf"; leaf.use = used

  multiple = newEntity(level,"trigger_multiple"); multiple.model = "*1"; multiple.target = "leaf"; multiple.spawnflags = 1
  level.spawner.vars = [["wait","0.5"],["random","0"]]; trigger.SP_trigger_multiple(level,multiple)
  checks = checks+require(multiple.touch==trigger.Touch_Multi and multiple.use==trigger.Use_Multi and multiple.r.contents==trigger.CONTENTS_TRIGGER and multiple.r.linked,"multiple spawn")
  trigger.Touch_Multi(level,multiple,blue,void); checks = checks+require(len(level.context.uses)==0,"multiple red restriction")
  trigger.Touch_Multi(level,multiple,red,void); checks = checks+require(len(level.context.uses)==1 and multiple.activator==red and multiple.think==trigger.multi_wait and multiple.nextthink>level.time,"multiple fire")
  trigger.Touch_Multi(level,multiple,red,void); checks = checks+require(len(level.context.uses)==1,"multiple cooldown")
  trigger.multi_wait(level,multiple); checks = checks+require(multiple.nextthink==0,"multiple wait")

  once = newEntity(level,"trigger_multiple"); once.model = "*1"; once.target = "leaf"; level.spawner.vars = [["wait","-1"]]; trigger.SP_trigger_multiple(level,once)
  trigger.Use_Multi(level,once,leaf,red); checks = checks+require(once.touch==void and once.think==game.free and once.nextthink==1100,"one shot deferred free")

  always = newEntity(level,"trigger_always"); always.target = "leaf"; trigger.SP_trigger_always(level,always)
  checks = checks+require(always.think==trigger.trigger_always_think and always.nextthink==1300,"always arm")
  before = len(level.context.uses); trigger.trigger_always_think(level,always); checks = checks+require(len(level.context.uses)==before+1 and not always.inuse,"always fire/free")

  push = newEntity(level,"target_push"); push.s.angles = [0.0,0.0,0.0]; push.speed = 321.0; push.spawnflags = 1
  trigger.SP_target_push(level,push); checks = checks+require(push.use==trigger.Use_target_push and push.s.origin2==[321.0,0.0,0.0] and push.noise_index>0,"target push spawn")
  trigger.Use_target_push(level,push,leaf,red); checks = checks+require(red.client.ps.velocity==push.s.origin2 and red.fly_sound_debounce_time==2500,"target push use/sound")
  red.client.ps.velocity = [0.0,0.0,0.0]; red.client.ps.powerups[c.PW_FLIGHT] = 1; trigger.Use_target_push(level,push,leaf,red)
  checks = checks+require(red.client.ps.velocity==[0.0,0.0,0.0],"flight blocks target push")

  jump = newEntity(level,"trigger_push"); jump.model = "*1"; jump.target = "apex"; trigger.SP_trigger_push(level,jump)
  checks = checks+require(jump.touch==trigger.trigger_push_touch and jump.think==trigger.AimAtTarget and jump.s.eType==c.ET_PUSH_TRIGGER and (jump.r.svFlags & trigger.SVF_NOCLIENT)==0,"push trigger spawn")
  apex = newEntity(level,"target_position"); apex.targetname = "apex"; apex.s.origin = [256.0,0.0,512.0]
  trigger.AimAtTarget(level,jump); checks = checks+require(jump.inuse and jump.s.origin2[2]>0,"push apex")

  dest = newEntity(level,"misc_teleporter_dest"); dest.targetname = "dest"; dest.s.origin = [6000.0,6000.0,128.0]; dest.s.angles = [0.0,90.0,0.0]
  tele = newEntity(level,"trigger_teleport"); tele.model = "*1"; tele.target = "dest"; tele.spawnflags = 1; trigger.SP_trigger_teleport(level,tele)
  checks = checks+require(tele.touch==trigger.trigger_teleporter_touch and tele.s.eType==c.ET_TELEPORT_TRIGGER and (tele.r.svFlags & trigger.SVF_NOCLIENT)!=0,"spectator teleport spawn")
  old = red.client.ps.origin; trigger.trigger_teleporter_touch(level,tele,red,void); checks = checks+require(red.client.ps.origin==old,"spectator gate")
  trigger.trigger_teleporter_touch(level,tele,spectator,void); checks = checks+require(spectator.client.ps.origin[0]==6000.0 and spectator.client.ps.origin[2]==129.0,"spectator teleport")

  hurt = newEntity(level,"trigger_hurt"); hurt.model = "*1"; hurt.spawnflags = 2|4|8|16; trigger.SP_trigger_hurt(level,hurt)
  checks = checks+require(hurt.touch==trigger.hurt_touch and hurt.use==trigger.hurt_use and hurt.damage==5 and hurt.r.linked,"hurt spawn")
  victim = newEntity(level,"victim"); victim.takedamage = true; victim.health = 30
  trigger.hurt_touch(level,hurt,victim,void); checks = checks+require(victim.health==25 and hurt.timestamp==2000,"hurt damage/throttle")
  trigger.hurt_touch(level,hurt,victim,void); checks = checks+require(victim.health==25,"hurt throttled")
  trigger.hurt_use(level,hurt,leaf,red); checks = checks+require(not hurt.r.linked,"hurt toggle off")
  trigger.hurt_use(level,hurt,leaf,red); checks = checks+require(hurt.r.linked,"hurt toggle on")

  timer = newEntity(level,"func_timer"); timer.target = "leaf"; timer.spawnflags = 1; level.spawner.vars = [["wait","0.25"],["random","0.125"]]
  trigger.SP_func_timer(level,timer); checks = checks+require(timer.use==trigger.func_timer_use and timer.think==trigger.func_timer_think and timer.nextthink==1100 and timer.activator==timer and timer.r.svFlags==trigger.SVF_NOCLIENT,"timer start")
  trigger.func_timer_use(level,timer,leaf,blue); checks = checks+require(timer.nextthink==0 and timer.activator==blue,"timer off")
  before = len(level.context.uses); trigger.func_timer_use(level,timer,leaf,red)
  checks = checks+require(len(level.context.uses)==before+1 and timer.nextthink>level.time,"timer on/fire")
  checks = checks+require(trigger.between(timer.nextthink,1125,1375),"inventory between helper")

  // Every map class now enters through the C-named facade, including the
  // spectator-door/push restrictions exercised by the central touch path.
  rows = [["trigger_multiple",trigger.Touch_Multi],["trigger_always",trigger.trigger_always_think],
          ["trigger_push",trigger.trigger_push_touch],["trigger_teleport",trigger.trigger_teleporter_touch],
          ["trigger_hurt",trigger.hurt_touch],["target_push",trigger.Use_target_push],["func_timer",trigger.func_timer_think]]
  for each row in rows
    probe = newEntity(level,row[0]); probe.model = "*1"; probe.target = "apex"; level.spawner.vars = []
    functions.dispatch(level,probe)
    callback = probe.touch; if callback == void then callback = probe.think end if; if row[0] == "target_push" then callback = probe.use end if
    checks = checks+require(callback==row[1],"productive "+row[0])
  end for
  return checks
end function
function main(args)
  if len(args)!=1 then return error(499,"Expected Retail BSP") end if
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); checks = contracts(world)
  print "PASS: "+str(checks)+" complete g_trigger contracts"; return 0
end function
