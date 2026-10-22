// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_weapon as weapon
import mq3.game.weapon_state as weaponState
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

function require(ok,label) if not ok then return error(499,"g_weapon contract: "+label) end if;return 1 end function
function quiet(level,text) return void end function
function contractDie(level,self,inflictor,attacker,damage,mod) return void end function
function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.gametype=0;level.num_entities=64;level.maxclients=2;level.maxclientsCvar=2;level.time=1000;level.previousTime=900;level.gamePrintFn=quiet
  for index=0 to 1
    ent=game.initEntity(level.entities[index]);game.bindClient(level,ent,level.clients[index]);ent.client.connected=2;ent.client.team=c.TEAM_RED;ent.client.ps.stats[c.STAT_HEALTH]=1000;ent.client.ps.stats[c.STAT_MAX_HEALTH]=100;ent.client.ps.viewheight=26;ent.health=1000;ent.takedamage=true;ent.die=contractDie;ent.s.eType=c.ET_PLAYER;ent.s.pos.trBase=[0.0+index*64.0,0.0,0.0];ent.r.currentOrigin=[0.0+index*64.0,0.0,0.0];ent.r.mins=[-15.0,-15.0,-24.0];ent.r.maxs=[15.0,15.0,32.0];ent.r.contents=0x02000000;game.link(level,ent)
  end for
  return level
end function
function contracts(world)
  count=0;level=setup(world);shooter=level.entities[0];target=level.entities[1];state=weaponState.get(level)
  output=[0.0,0.0,0.0];weapon.G_BounceProjectile([0.0,0.0,0.0],[1.0,0.0,0.0],[1.0,0.0,0.0],output);count=count+require(output[0]<-8190.0,"bounce facade")
  snapped=[1.9,-1.9,0.1];weapon.SnapVectorTowards(snapped,[2.0,-2.0,0.0]);count=count+require(snapped==[2.0,-1.0,0.0],"snap facade")
  state.muzzle=[10.0,20.0,30.0];state.forward=[1.0,0.0,0.0];state.right=[0.0,-1.0,0.0];state.up=[0.0,0.0,1.0];state.quadFactor=2.0
  first=level.num_entities;last=weapon.Weapon_Nailgun_Fire(level,shooter);count=count+require(level.num_entities==first+15 and last.classname=="nail" and last.s.weapon==weapon.WP_NAILGUN,"fifteen nail projectiles")
  count=count+require(last.damage==40 and last.methodOfDeath==weapon.MOD_NAIL and last.nextthink==11000 and last.s.pos.trType==c.TR_LINEAR,"nail profile and quad")
  state.forward=[1.0,0.0,0.0];prox=weapon.weapon_proxlauncher_fire(level,shooter);count=count+require(prox.classname=="prox mine" and prox.s.weapon==weapon.WP_PROX_LAUNCHER and prox.splashDamage==200,"prox profile and quad")
  count=count+require(prox.s.pos.trType==c.TR_GRAVITY and prox.s.pos.trTime==950 and prox.s.generic1==c.TEAM_RED and prox.count==0,"prox trajectory and team")
  shooter.s.weapon=weapon.WP_NAILGUN;shooter.client.accuracy_shots=0;state.quadFactor=1.0;before=level.num_entities;weapon.FireWeapon(level,shooter,true,true);count=count+require(shooter.client.accuracy_shots==15 and level.num_entities==before+15,"missionpack nail dispatch")
  shooter.s.weapon=weapon.WP_PROX_LAUNCHER;weapon.FireWeapon(level,shooter,true,false);count=count+require(shooter.client.accuracy_shots==16 and level.entities[level.num_entities-1].s.weapon==weapon.WP_PROX_LAUNCHER,"missionpack prox dispatch")
  shooter.s.weapon=weapon.WP_CHAINGUN;before=shooter.client.accuracy_shots;weapon.FireWeapon(level,shooter,true,false);count=count+require(shooter.client.accuracy_shots==before+1,"missionpack chaingun dispatch")
  // Team protection is explicitly bypassed by Kamikaze and each phase hits a
  // slot once per 3000 ms, matching gentity_t's two cooldown fields.
  target.health=1000;target.client.ps.stats[c.STAT_HEALTH]=1000;level.friendlyFire=0
  count=count+require(weapon.KamikazeRadiusDamage(level,[64.0,0.0,0.0],shooter,400.0,100.0)==2 and target.health<1000,"kamikaze team bypass")
  health=target.health;count=count+require(weapon.KamikazeRadiusDamage(level,[64.0,0.0,0.0],shooter,400.0,100.0)==0 and target.health==health,"kamikaze damage cooldown")
  level.time=4001;target.health=1000;target.client.ps.stats[c.STAT_HEALTH]=1000
  count=count+require(weapon.KamikazeShockWave(level,[0.0,0.0,0.0],shooter,25.0,400.0,128.0)>=2 and target.client.ps.velocity[2]==100.0,"kamikaze shock and push")
  count=count+require(weapon.KamikazeShockWave(level,[0.0,0.0,0.0],shooter,25.0,400.0,128.0)==0,"kamikaze shock cooldown")
  // Start logic creates the persistent event entity plus broadcast event and
  // removes the user's EF_KAMIKAZE before applying unprotected self damage.
  level.time=8000;shooter.health=100;shooter.client.ps.stats[c.STAT_HEALTH]=100;shooter.s.eFlags=weapon.EF_KAMIKAZE
  before=level.num_entities;explosion=weapon.G_StartKamikaze(level,shooter);count=count+require(explosion.classname=="kamikaze" and explosion.activator==shooter and explosion.think==weapon.KamikazeDamage,"kamikaze start callback")
  count=count+require(level.num_entities==before+2 and (shooter.s.eFlags&weapon.EF_KAMIKAZE)==0 and shooter.health<=0,"kamikaze event, sound and suicide")
  count=count+require(level.entities[level.num_entities-1].s.eventParm==c.GTS_KAMIKAZE and (level.entities[level.num_entities-1].r.svFlags&32)!=0,"global kamikaze sound")
  level.time=8100;explosion.count=1900;weapon.KamikazeDamage(level,explosion);count=count+require(not explosion.inuse,"kamikaze lifecycle ends at 2000 ms")
  count=count+require(weapon.LogAccuracyHit(level,target,shooter),"accuracy delegates live team/death state")
  return count
end function
function main(args) world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world);print("PASS: "+str(count)+" g_weapon complete contracts");return 0 end function
