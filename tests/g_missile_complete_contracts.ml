// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_missile as missile
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

function require(ok,label) if not ok then return error(499,"g_missile contract: "+label) end if;return 1 end function
function quiet(level,text) return void end function
function die(level,self,inflictor,attacker,damage,mod) return void end function
function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.gametype=3;level.num_entities=64;level.maxclients=3;level.time=1000;level.previousTime=900;level.gamePrintFn=quiet
  for i=0 to 2
    ent=game.initEntity(level.entities[i]);game.bindClient(level,ent,level.clients[i]);ent.client.connected=2;ent.client.team=1+i%2;ent.client.ps.origin=[0.0+i*80.0,0.0,64.0];ent.client.ps.stats[c.STAT_HEALTH]=1000;ent.client.ps.stats[c.STAT_MAX_HEALTH]=100;ent.health=1000;ent.takedamage=true;ent.die=die;ent.s.eType=c.ET_PLAYER;ent.s.pos.trBase=[0.0+i*80.0,0.0,64.0];ent.r.currentOrigin=ent.s.pos.trBase;ent.r.mins=[-15.0,-15.0,-24.0];ent.r.maxs=[15.0,15.0,32.0];ent.r.contents=0x02000000;game.link(level,ent)
  end for
  return level
end function
function contracts(world)
  checks=0;level=setup(world);owner=level.entities[0];enemy=level.entities[1]
  plasma=missile.fire_plasma(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);checks=checks+require(plasma.classname=="plasma" and plasma.s.weapon==c.WP_PLASMAGUN,"plasma facade")
  grenade=missile.fire_grenade(level,owner,[0.0,0.0,64.0],[1.0,0.0,1.0]);checks=checks+require(grenade.classname=="grenade" and grenade.s.pos.trType==c.TR_GRAVITY,"grenade facade")
  checks=checks+require(missile.fire_rocket(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]).damage==100,"rocket facade")
  checks=checks+require(missile.fire_bfg(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]).splashRadius==120,"bfg facade")
  hook=missile.fire_grapple(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);checks=checks+require(owner.client.hook==hook and hook.methodOfDeath==c.MOD_GRAPPLE,"grapple facade")
  nail=missile.fire_nail(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0],[0.0,-1.0,0.0],[0.0,0.0,1.0]);checks=checks+require(nail.s.weapon==missile.WP_NAILGUN and nail.damage==20,"nail facade")
  prox=missile.fire_prox(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);checks=checks+require(prox.s.weapon==missile.WP_PROX_LAUNCHER and prox.count==0 and prox.s.generic1==owner.client.team,"prox facade")
  missile.ProximityMine_Player(level,prox,enemy);checks=checks+require((enemy.client.ps.eFlags&missile.EF_TICKING)!=0 and prox.enemy==enemy and prox.nextthink==11000,"stick player")
  enemy.s.eFlags=enemy.client.ps.eFlags;stacked=missile.fire_prox(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);oldDamage=prox.splashDamage;oldRadius=prox.splashRadius;missile.ProximityMine_Player(level,stacked,enemy);checks=checks+require(prox.splashDamage==oldDamage+stacked.splashDamage and prox.splashRadius==oldRadius*1.5 and stacked.think==game.free,"stack mine")
  level.time=2000;missile.ProximityMine_ExplodeOnPlayer(level,prox);checks=checks+require((enemy.client.ps.eFlags&missile.EF_TICKING)==0 and prox.s.eType==c.ET_GENERAL,"player explosion")
  wallMine=missile.fire_prox(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);wallMine.s.pos.trBase=[40.0,0.0,64.0];trigger=missile.ProximityMine_Activate(level,wallMine);checks=checks+require(trigger.parent==wallMine and trigger.touch==missile.ProximityMine_Trigger and wallMine.activator==trigger,"activation trigger")
  checks=checks+require(wallMine.takedamage and wallMine.health==1 and wallMine.nextthink==22000,"activation lifetime")
  before=wallMine.nextthink;missile.ProximityMine_Trigger(level,trigger,owner,void);checks=checks+require(wallMine.nextthink==before and trigger.inuse,"friendly trigger ignored")
  missile.ProximityMine_Trigger(level,trigger,enemy,void);checks=checks+require(wallMine.nextthink==2500 and not trigger.inuse and wallMine.activator==void,"enemy trigger")
  dead=missile.fire_prox(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);missile.ProximityMine_Die(level,dead,enemy,enemy,1,0);checks=checks+require(dead.think==missile.ProximityMine_Explode and dead.nextthink==2001,"mine die")
  reflected=missile.invulnerabilityEffect(level,enemy,[1.0,0.0,0.0],[40.0,0.0,64.0]);checks=checks+require(reflected[0] and reflected[2][0]<0.0,"invulnerability reflection")
  bounceHit=combatHit(world,[-1.0,0.0,0.0],[40.0,0.0,64.0],1022);grenade.r.currentOrigin=[0.0,0.0,64.0];grenade.s.pos.trDelta=[100.0,0.0,0.0];missile.G_BounceMissile(level,grenade,bounceHit);checks=checks+require(grenade.s.pos.trDelta[0]<0.0,"bounce facade")
  exploding=missile.fire_rocket(level,owner,[0.0,0.0,64.0],[1.0,0.0,0.0]);missile.G_ExplodeMissile(level,exploding);checks=checks+require(exploding.s.eType==c.ET_GENERAL and exploding.freeAfterEvent,"explode facade")
  return checks
end function
function combatHit(world,normal,finish,entityNumber)
  result=cm.trace(world,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,false,true);result.trace.normal=normal;result.endpos=finish;result.entityNum=entityNumber;return result
end function
function main(args) world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world);print("PASS: "+str(count)+" g_missile complete contracts");return 0 end function


