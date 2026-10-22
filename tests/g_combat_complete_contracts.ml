// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_combat as completeCombat
import mq3.game.entities as combatEntities
import mq3.game.spawn as combatSpawn
import mq3.game.constants as combatConstants
import mq3.collision.world as combatCollision
import std.fs as combatFs

function require(ok,label) if not ok then return error(499,"g_combat contract: "+label) end if;return 1 end function
function quietCommand(level,slot,text) return void end function
function quietLog(level,text) return void end function
function quietTeam(level,self,inflictor,attacker) return void end function
function observedDie(level,self,inflictor,attacker,damage,mod) self.count=self.count+1;return void end function
function setup(world)
  level=combatEntities.create(world);state=combatSpawn.create(level,"");state.gametype=0;state.missionpack=true
  level.num_entities=64;level.maxclients=2;level.maxclientsCvar=2;level.time=1000;level.previousTime=900;level.serverCommandFn=quietCommand;level.gameLogFn=quietLog
  for slot=0 to 1
    ent=combatEntities.initEntity(level.entities[slot]);combatEntities.bindClient(level,ent,level.clients[slot]);ent.client.connected=2;ent.client.team=combatConstants.TEAM_RED
    ent.client.ps.clientNum=slot;ent.client.ps.stats[combatConstants.STAT_HEALTH]=200;ent.client.ps.stats[combatConstants.STAT_MAX_HEALTH]=100
    ent.health=200;ent.takedamage=true;ent.die=observedDie;ent.s.eType=combatConstants.ET_PLAYER;ent.s.pos.trBase=[slot*96.0,0.0,32.0]
    ent.r.currentOrigin=[slot*96.0,0.0,32.0];ent.client.ps.origin=[slot*96.0,0.0,32.0];ent.r.mins=[-15.0,-15.0,-24.0];ent.r.maxs=[15.0,15.0,32.0];ent.r.contents=0x02000000;combatEntities.link(level,ent)
  end for
  return level
end function
function contracts(world)
  count=0;level=setup(world);target=level.entities[0];attacker=level.entities[1]
  target.client.ps.stats[combatConstants.STAT_ARMOR]=100;count=count+require(completeCombat.CheckArmor(target,101,0)==67 and target.client.ps.stats[combatConstants.STAT_ARMOR]==33,"armor ceil and cap")
  hits=[[0.0,0.0,0.0],[0.0,0.0,0.0]];count=count+require(completeCombat.RaySphereIntersections([0.0,0.0,0.0],42.0,[-100.0,0.0,0.0],[1.0,0.0,0.0],hits)==2 and hits[0][0]==42.0 and hits[1][0]==-42.0,"ray sphere secant")
  tangent=[[0.0,0.0,0.0],[0.0,0.0,0.0]];count=count+require(completeCombat.RaySphereIntersections([0.0,0.0,0.0],42.0,[42.0,0.0,0.0],[0.0,1.0,0.0],tangent)==1,"ray sphere tangent")
  miss=[[0.0,0.0,0.0],[0.0,0.0,0.0]];count=count+require(completeCombat.RaySphereIntersections([0.0,0.0,0.0],42.0,[50.0,50.0,0.0],[1.0,0.0,0.0],miss)==0,"ray sphere miss")
  before=level.num_entities;impact=[0.0,0.0,0.0];bounce=[0.0,0.0,0.0];count=count+require(completeCombat.G_InvulnerabilityEffect(level,target,[1.0,0.0,0.0],[-100.0,0.0,32.0],impact,bounce) and level.num_entities==before+1 and impact[0]==-42.0,"invulnerability event")
  target.client.invulnerabilityTime=2000;health=target.health;completeCombat.G_Damage(level,target,attacker,attacker,[1.0,0.0,0.0],[-20.0,0.0,32.0],100,0,6);count=count+require(target.health==health,"invulnerability blocks ordinary damage")
  completeCombat.G_Damage(level,target,attacker,attacker,[1.0,0.0,0.0],[-20.0,0.0,32.0],20,0,28);count=count+require(target.health<health,"juiced bypasses invulnerability")
  target.client.invulnerabilityTime=0;target.health=200;target.client.ps.stats[combatConstants.STAT_HEALTH]=200;attacker.client.ps.stats[7]=43
  completeCombat.G_Damage(level,target,attacker,attacker,[1.0,0.0,0.0],target.r.currentOrigin,100,2,6);count=count+require(target.health==150,"guard halves handicap damage")
  target.health=200;target.client.ps.stats[combatConstants.STAT_HEALTH]=200;completeCombat.G_Damage(level,target,attacker,target,[1.0,0.0,0.0],target.r.currentOrigin,100,2,26);count=count+require(target.health==200,"prox self protection")
  mine=combatEntities.spawn(level);mine.parent=attacker;level.spawner.gametype=3;target.client.team=combatConstants.TEAM_RED;attacker.client.team=combatConstants.TEAM_RED;completeCombat.G_Damage(level,target,mine,attacker,[1.0,0.0,0.0],target.r.currentOrigin,100,2,26);count=count+require(target.health==200,"prox parent team protection")
  target.client.team=combatConstants.TEAM_BLUE;level.friendlyFire=1;completeCombat.G_Damage(level,target,attacker,attacker,[1.0,0.0,0.0],target.r.currentOrigin,20,2,6);count=count+require(target.client.ps.velocity[0]>0.0,"knockback applied")
  target.health=5;target.client.ps.stats[combatConstants.STAT_HEALTH]=5;completeCombat.G_Damage(level,target,attacker,attacker,[1.0,0.0,0.0],target.r.currentOrigin,20,2,6);count=count+require(target.count==1 and target.enemy==attacker,"death callback and enemy")
  count=count+require(completeCombat.CanDamage(level,attacker,[96.0,0.0,128.0]),"visibility facade")
  target.health=200;target.client.ps.stats[combatConstants.STAT_HEALTH]=200;target.count=0;count=count+require(completeCombat.G_RadiusDamage(level,[0.0,0.0,32.0],attacker,100.0,200.0,attacker,7) and target.health<200,"radius and accuracy")
  before=level.num_entities;completeCombat.ScorePlum(level,attacker,attacker.r.currentOrigin,3);plum=level.entities[before];count=count+require(plum.s.time==3 and plum.s.otherEntityNum==attacker.s.number and plum.r.singleClient==attacker.s.number,"score plum")
  level.warmupTime=0;oldscore=attacker.client.ps.persistant[combatConstants.PERS_SCORE];completeCombat.AddScore(level,attacker,attacker.r.currentOrigin,2);count=count+require(attacker.client.ps.persistant[combatConstants.PERS_SCORE]==oldscore+2,"add score")
  powerup=combatEntities.spawn(level);powerup.r.svFlags=1;powerup.s.eFlags=0x80;attacker.client.persistantPowerup=powerup;attacker.client.ps.stats[7]=43
  completeCombat.TossClientPersistantPowerups(level,attacker);count=count+require(attacker.client.persistantPowerup==void and attacker.client.ps.stats[7]==0 and powerup.r.contents==0x40000000 and powerup.r.linked,"persistent powerup released")
  level.neutralObelisk=combatEntities.spawn(level);level.neutralObelisk.s.pos.trBase=[10.0,20.0,30.0];scratch=combatEntities.spawn(level);combatEntities.free(level,scratch);attacker.client.ps.generic1=4;before=level.num_entities;cube=completeCombat.TossClientCubes(level,attacker);count=count+require(cube!=void and attacker.client.ps.generic1==0 and cube.s.modelindex==47 and cube.spawnflags==combatConstants.TEAM_RED,"harvester cube")
  timer=completeCombat.Kamikaze_DeathTimer(level,attacker);count=count+require(timer.classname=="kamikaze timer" and timer.activator==attacker and timer.nextthink==6000,"kamikaze death timer")
  before=level.num_entities;completeCombat.Kamikaze_DeathActivate(level,timer);count=count+require(not timer.inuse and level.num_entities>=before+2,"kamikaze activation")
  return count
end function
function main(args) world=combatCollision.loadWorld(combatFs.readAllBytes(args[0]),true);count=contracts(world);print("PASS: "+str(count)+" g_combat complete contracts");return 0 end function
