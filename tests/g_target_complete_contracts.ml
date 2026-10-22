// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_target as target
import mq3.game.spawn_functions as functions
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

struct Context uses messages end struct
function require(ok,label)
  if not ok then return error(499,"g_target contract: "+label) end if
  return 1
end function
function used(level,ent,other,activator)
  level.context.uses = level.context.uses+[[ent.slot,other.slot,activator.slot]]; return void
end function
function sent(level,slot,text)
  level.context.messages = level.context.messages+[[slot,text]]; return void
end function
function setup(world)
  level = game.create(world); state = spawn.create(level,"")
  level.context = Context([],[]); level.serverCommandFn = sent; level.maxclients = 2; level.maxclientsCvar = 2
  first = game.initEntity(level.entities[0]); game.bindClient(level,first,level.clients[0]); first.client.connected = 2; first.client.team = c.TEAM_RED
  second = game.initEntity(level.entities[1]); game.bindClient(level,second,level.clients[1]); second.client.connected = 2; second.client.team = c.TEAM_BLUE
  level.num_entities = 64; level.time = 1000
  return level
end function
function newTargetEntity(level,classname)
  ent = game.spawn(level); ent.classname = classname; return ent
end function
function contracts(world)
  checks = 0; level = setup(world)
  pos = newTargetEntity(level,"target_position"); pos.s.origin = [1.0,2.0,3.0]; target.SP_target_position(level,pos)
  checks = checks+require(pos.r.currentOrigin==[1.0,2.0,3.0] and pos.s.pos.trBase==[1.0,2.0,3.0],"position")

  delay = newTargetEntity(level,"target_delay"); level.spawner.vars = []; target.SP_target_delay(level,delay)
  checks = checks+require(delay.wait==1.0 and delay.use==target.Use_Target_Delay,"delay spawn")
  leaf = newTargetEntity(level,"info_notnull"); leaf.targetname = "leaf"; leaf.use = used; delay.target = "leaf"
  target.Use_Target_Delay(level,delay,pos,level.entities[0])
  checks = checks+require(delay.think==target.Think_Target_Delay and delay.activator==level.entities[0] and delay.nextthink==2000,"delay arm")
  target.Think_Target_Delay(level,delay)
  checks = checks+require(len(level.context.uses)==1 and level.context.uses[0][0]==leaf.slot,"delay fire")

  relay = newTargetEntity(level,"target_relay"); relay.target = "leaf"; relay.spawnflags = 1; target.SP_target_relay(level,relay)
  before = len(level.context.uses); target.target_relay_use(level,relay,pos,level.entities[1])
  checks = checks+require(relay.use==target.target_relay_use and len(level.context.uses)==before,"red relay gate")
  target.target_relay_use(level,relay,pos,level.entities[0])
  checks = checks+require(len(level.context.uses)==before+1,"red relay pass")

  give = newTargetEntity(level,"target_give"); target.SP_target_give(level,give)
  checks = checks+require(give.use==target.Use_Target_Give,"give callback")
  remove = newTargetEntity(level,"target_remove_powerups"); target.SP_target_remove_powerups(level,remove)
  level.entities[0].client.ps.powerups[1] = 123; target.Use_target_remove_powerups(level,remove,pos,level.entities[0])
  checks = checks+require(remove.use==target.Use_target_remove_powerups and level.entities[0].client.ps.powerups[1]==0,"remove powerups")

  score = newTargetEntity(level,"target_score"); target.SP_target_score(level,score)
  checks = checks+require(score.count==1 and score.use==target.Use_Target_Score,"score callback/default")
  printer = newTargetEntity(level,"target_print"); printer.message = "Arena"; target.SP_target_print(level,printer); target.Use_Target_Print(level,printer,pos,level.entities[0])
  checks = checks+require(printer.use==target.Use_Target_Print and level.context.messages[len(level.context.messages)-1]==[-1,"cp \"Arena\""],"print broadcast")

  speaker = newTargetEntity(level,"target_speaker"); speaker.spawnflags = 1; speaker.s.origin = [4.0,5.0,6.0]
  level.spawner.vars = [["noise","sound/world/test"],["wait","1.5"],["random","0.25"]]; target.SP_target_speaker(level,speaker)
  checks = checks+require(speaker.use==target.Use_Target_Speaker and speaker.s.eType==c.ET_SPEAKER and speaker.s.loopSound==speaker.noise_index and speaker.s.pos.trBase==speaker.s.origin,"speaker spawn")
  target.Use_Target_Speaker(level,speaker,pos,level.entities[0]); checks = checks+require(speaker.s.loopSound==0,"speaker off")
  target.Use_Target_Speaker(level,speaker,pos,level.entities[0]); checks = checks+require(speaker.s.loopSound==speaker.noise_index,"speaker on")

  tele = newTargetEntity(level,"target_teleporter"); target.SP_target_teleporter(level,tele)
  checks = checks+require(tele.use==target.target_teleporter_use,"teleporter callback")
  kill = newTargetEntity(level,"target_kill"); target.SP_target_kill(level,kill)
  checks = checks+require(kill.use==target.target_kill_use,"kill callback")

  laser = newTargetEntity(level,"target_laser"); laser.s.origin = [0.0,0.0,64.0]; laser.s.angles = [0.0,90.0,0.0]
  target.SP_target_laser(level,laser); checks = checks+require(laser.think==target.target_laser_start and laser.nextthink==1100,"laser delayed start")
  target.target_laser_start(level,laser)
  checks = checks+require(laser.s.eType==c.ET_BEAM and laser.use==target.target_laser_use and laser.think==target.target_laser_think and laser.damage==1 and laser.nextthink==0,"laser initialized off")
  target.target_laser_on(level,laser)
  checks = checks+require(laser.nextthink==1100 and laser.r.linked,"laser on/think")
  target.target_laser_off(level,laser); checks = checks+require(laser.nextthink==0 and not laser.r.linked,"laser off")

  firstLoc = newTargetEntity(level,"target_location"); firstLoc.message = "Hall"; target.SP_target_location(level,firstLoc)
  secondLoc = newTargetEntity(level,"target_location"); secondLoc.message = "Quad"; target.SP_target_location(level,secondLoc)
  checks = checks+require(firstLoc.think==target.target_location_linkup and firstLoc.nextthink==1200,"location delayed link")
  target.target_location_linkup(level,firstLoc)
  checks = checks+require(level.locationLinked and level.spawner.configstrings[608]=="unknown" and firstLoc.health>0 and secondLoc.health>0 and level.locationHead==secondLoc,"location list")

  // Productive class dispatch owns each g_target spawn and installs facade callbacks.
  level.spawner.vars = [["noise","sound/world/test"]]
  rows = [["target_give",target.Use_Target_Give],["target_remove_powerups",target.Use_target_remove_powerups],["target_delay",target.Use_Target_Delay],
          ["target_score",target.Use_Target_Score],["target_print",target.Use_Target_Print],["target_speaker",target.Use_Target_Speaker],
          ["target_teleporter",target.target_teleporter_use],["target_relay",target.target_relay_use],["target_kill",target.target_kill_use]]
  for each row in rows
    probe = newTargetEntity(level,row[0]); probe.targetname = "named"; functions.dispatch(level,probe)
    checks = checks+require(probe.use==row[1],"productive "+row[0])
  end for
  probe = newTargetEntity(level,"target_laser"); functions.dispatch(level,probe); checks = checks+require(probe.think==target.target_laser_start,"productive target_laser")
  probe = newTargetEntity(level,"target_location"); functions.dispatch(level,probe); checks = checks+require(probe.think==target.target_location_linkup,"productive target_location")
  return checks
end function
function main(args)
  if len(args)!=1 then return error(499,"Expected BSP") end if
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); checks = contracts(world)
  print "PASS: "+str(checks)+" complete g_target contracts"; return 0
end function
