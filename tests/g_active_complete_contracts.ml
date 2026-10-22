// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_active as gactive
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

struct Context commands end struct
function require(ok,label) if not ok then return error(499,"g_active contract: "+label) end if;return 1 end function
function contractConsole(level,kind,text) level.context.commands=level.context.commands+[[kind,text]];return void end function
function dropped(level,owner,item,angle) ent=game.spawn(level);ent.item=item;return ent end function

function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.missionpack=true
  level.maxclients=2;level.maxclientsCvar=2;level.num_entities=64;level.time=2000;level.context=Context([])
  player=game.initEntity(level.entities[0]);game.bindClient(level,player,level.clients[0]);player.s.eType=c.ET_PLAYER
  player.health=100;player.client.connected=2;player.client.team=c.TEAM_FREE;player.client.ps.clientNum=0
  player.client.ps.stats[c.STAT_HEALTH]=100;player.client.ps.stats[c.STAT_MAX_HEALTH]=100
  player.client.ps.stats[c.STAT_WEAPONS]=(1<<c.WP_GAUNTLET)|(1<<c.WP_MACHINEGUN);player.client.ps.ammo[c.WP_MACHINEGUN]=20
  player.client.ps.weapon=c.WP_MACHINEGUN;player.client.cmdWeapon=c.WP_MACHINEGUN
  player.client.ps.commandTime=1950;player.client.cmdServerTime=2000;player.client.inactivityTime=62000
  player.s.pos.trBase=[0.0,0.0,64.0];player.client.ps.origin=[0.0,0.0,64.0];player.r.currentOrigin=[0.0,0.0,64.0]
  player.r.mins=[-15.0,-15.0,-24.0];player.r.maxs=[15.0,15.0,32.0]
  return level
end function

function contracts(world)
  count=0
  guard=setup(world);p=guard.entities[0];p.client.ps.stats[7]=43;p.health=40;p.client.ps.stats[c.STAT_ARMOR]=101;p.client.timeResidual=950
  gactive.ClientTimerActions(guard,p,100)
  count=count+require(p.health==55 and p.client.ps.stats[c.STAT_ARMOR]==100 and p.client.timeResidual==50,"Guard half-health regeneration")

  ammo=setup(world);p=ammo.entities[0];p.client.ps.stats[7]=45;p.client.ps.ammo[c.WP_MACHINEGUN]=0;p.client.ammoTimes[c.WP_MACHINEGUN]=900
  gactive.ClientTimerActions(ammo,p,100)
  count=count+require(p.client.ps.ammo[c.WP_MACHINEGUN]==4 and p.client.ammoTimes[c.WP_MACHINEGUN]==0,"Ammo Regen cadence")

  scout=setup(world);p=scout.entities[0];p.client.ps.stats[7]=42;gactive.ClientThink_real(scout,p)
  count=count+require(p.client.ps.speed==480,"Scout movement multiplier")

  invul=setup(world);p=invul.entities[0];p.client.ps.powerups[c.PW_INVULNERABILITY]=5000;gactive.ClientThink_real(invul,p)
  count=count+require((p.client.ps.pm_flags&0x4000)!=0 and p.r.mins==[-42.0,-42.0,-42.0] and p.r.maxs==[42.0,42.0,42.0],"invulnerability expansion and Pmove")

  blocked=setup(world);a=blocked.entities[0];a.r.absmin=[-42.0,-42.0,-42.0];a.r.absmax=[42.0,42.0,42.0]
  b=game.initEntity(blocked.entities[1]);game.bindClient(blocked,b,blocked.clients[1]);b.health=100;b.r.absmin=[-5.0,-5.0,-5.0];b.r.absmax=[5.0,5.0,5.0]
  count=count+require(gactive.StuckInOtherClient(blocked,a),"overlapping live client")

  framed=setup(world);p=framed.entities[0];p.client.ps.stats[7]=44;p.client.invulnerabilityTime=3000
  gactive.ClientEndFrame(framed,p)
  count=count+require(p.client.ps.powerups[c.PW_DOUBLER]==2000 and p.client.ps.powerups[c.PW_INVULNERABILITY]==2000,"persistent animation powerups")

  holdable=setup(world);p=holdable.entities[0];p.client.ps.eventSequence=1;p.client.ps.events[0]=c.EV_USE_ITEM5
  gactive.ClientEvents(holdable,p,0)
  count=count+require(p.client.invulnerabilityTime==12000,"invulnerability holdable")

  portal=setup(world);p=portal.entities[0];p.client.ps.eventSequence=1;p.client.ps.events[0]=c.EV_USE_ITEM4;gactive.ClientEvents(portal,p,0)
  destination=portal.entities[64];firstID=p.client.portalID;p.client.ps.eventSequence=2;p.client.ps.events[1]=c.EV_USE_ITEM4;gactive.ClientEvents(portal,p,1);source=portal.entities[65]
  count=count+require(firstID==1 and p.client.portalID==0 and destination.classname=="hi_portal destination" and source.classname=="hi_portal source" and destination.count==source.count,"portal destination/source pair")

  harvest=setup(world);harvest.spawner.gametype=7;harvest.itemDropFn=dropped;p=harvest.entities[0];p.client.team=c.TEAM_RED;p.client.ps.generic1=2
  spot=game.spawn(harvest);spot.classname="info_player_deathmatch";spot.s.origin=[256.0,0.0,32.0]
  p.client.ps.eventSequence=1;p.client.ps.events[0]=c.EV_USE_ITEM1;gactive.ClientEvents(harvest,p,0)
  count=count+require(p.client.ps.generic1==0 and harvest.entities[65].item==48 and harvest.entities[66].item==48 and harvest.entities[65].spawnflags==c.TEAM_BLUE,"Harvester cube drop")

  kami=setup(world);p=kami.entities[0];p.takedamage=false;p.client.invulnerabilityTime=9999;p.client.ps.eventSequence=1;p.client.ps.events[0]=c.EV_USE_ITEM3
  gactive.ClientEvents(kami,p,0)
  count=count+require(p.client.invulnerabilityTime==0 and kami.entities[64].classname=="kamikaze" and kami.entities[64].think!=void,"kamikaze holdable")

  single=setup(world);single.spawner.singlePlayer=true;single.intermissionQueued=1;single.time=2001;single.consoleCommandFn=contractConsole;p=single.entities[0]
  p.client.ps.commandTime=1950;p.client.cmdServerTime=2001;p.client.cmdButtons=1;p.client.cmdForwardmove=100
  gactive.ClientThink_real(single,p)
  count=count+require(p.client.ps.pm_type==c.PM_SPINTERMISSION and len(single.context.commands)==1 and single.context.commands[0][1]=="centerview\n","single-player queued intermission")
  return count
end function

function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world)
  print("PASS: "+str(count)+" complete g_active Missionpack contracts");return 0
end function
