// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_misc as misc
import mq3.game.spawn_functions as functions
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.game.portals as portalKernel
import mq3.game.shooters as shooterKernel
import mq3.game.active_portals as activePortalKernel
import mq3.collision.world as cm
import mq3.shared.math as q
import std.fs as fs

function require(ok,label)
  if not ok then return error(499,"g_misc contract: "+label) end if
  return 1
end function
function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.missionpack=true
  level.num_entities=64;level.maxclients=1;level.maxclientsCvar=1;level.time=1000
  player=game.initEntity(level.entities[0]);game.bindClient(level,player,level.clients[0]);player.health=100
  player.client.connected=2;player.client.team=c.TEAM_SPECTATOR;player.client.ps.clientNum=0
  player.client.ps.stats[c.STAT_HEALTH]=100;player.s.pos.trBase=[32.25,-16.75,80.5]
  player.s.apos.trBase=[0.0,90.0,0.0];player.client.ps.origin=[32.25,-16.75,80.5]
  player.r.currentOrigin=[32.25,-16.75,80.5];player.r.mins=[-15.0,-15.0,-24.0];player.r.maxs=[15.0,15.0,32.0]
  return level
end function
function fresh(level,name)
  ent=game.spawn(level);ent.classname=name;return ent
end function
function contracts(world)
  count=0;level=setup(world)

  camp=fresh(level,"info_camp");camp.s.origin=[1.25,-2.5,3.75];functions.dispatch(level,camp)
  count=count+require(camp.s.pos.trBase==camp.s.origin and camp.r.currentOrigin==camp.s.origin,"productive info_camp")
  marker=fresh(level,"info_notnull");marker.s.origin=[4.0,5.0,6.0];functions.dispatch(level,marker)
  count=count+require(marker.s.pos.trBase==marker.s.origin,"productive info_notnull")
  gone=fresh(level,"info_null");functions.dispatch(level,gone)
  count=count+require(not gone.inuse and gone.classname=="freed","productive info_null")
  light=fresh(level,"light");functions.dispatch(level,light);model=fresh(level,"misc_model");functions.dispatch(level,model)
  count=count+require(not light.inuse and not model.inuse,"light and disabled misc_model free")
  destinationMarker=fresh(level,"misc_teleporter_dest");destinationMarker.s.origin=[8.0,9.0,10.0];functions.dispatch(level,destinationMarker)
  count=count+require(destinationMarker.inuse and destinationMarker.s.pos.trBase==[0.0,0.0,0.0],"empty teleporter destination spawn")

  mirror=fresh(level,"misc_portal_surface");mirror.s.origin=[11.0,12.0,13.0];functions.dispatch(level,mirror)
  count=count+require(mirror.s.eType==c.ET_PORTAL and mirror.s.origin2==mirror.s.origin and mirror.r.linked,"portal mirror")
  camera=fresh(level,"misc_portal_camera");camera.targetname="camera";camera.s.origin=[64.0,0.0,32.0];camera.s.angles=[0.0,180.0,0.0]
  level.spawner.vars=[["roll","90"]];functions.dispatch(level,camera)
  surface=fresh(level,"misc_portal_surface");surface.target="camera";functions.dispatch(level,surface)
  count=count+require(surface.think==portalKernel.locateCamera and surface.nextthink==1100 and camera.s.clientNum==64,"productive delayed portal and roll")
  level.time=1100;game.runThink(level,surface)
  count=count+require(surface.r.ownerNum==camera.s.number and surface.s.origin2==camera.s.origin,"portal camera lookup in frame think")

  level.spawner.vars=[];shooter=fresh(level,"shooter_rocket");shooter.s.origin=[0.0,0.0,64.0];shooter.s.angles=[0.0,90.0,0.0]
  functions.dispatch(level,shooter)
  count=count+require(shooter.use==shooterKernel.use and shooter.s.weapon==c.WP_ROCKET_LAUNCHER and shooter.random!=0.0 and level.itemRegistered[12]!=0,"productive rocket shooter")
  before=level.num_entities;misc.Use_Shooter(level,shooter,void,void);projectile=level.entities[before]
  count=count+require(projectile.inuse and projectile.s.eType==c.ET_MISSILE and projectile.s.weapon==c.WP_ROCKET_LAUNCHER and (shooter.s.event&255)==c.EV_FIRE_WEAPON,"shooter use and missile")
  aim=fresh(level,"info_notnull");aim.targetname="aim";aim.r.currentOrigin=[100.0,20.0,64.0]
  targeted=fresh(level,"shooter_plasma");targeted.target="aim";targeted.s.angles=[0.0,0.0,0.0];functions.dispatch(level,targeted)
  count=count+require(targeted.think==shooterKernel.finish and targeted.nextthink==1600,"targeted shooter delayed finish")
  level.time=1600;game.runThink(level,targeted)
  count=count+require(targeted.enemy==aim and targeted.think==void and targeted.nextthink==0,"targeted shooter acquired")

  player=level.entities[0];misc.TeleportPlayer(level,player,[256.0,-64.0,24.0],[0.0,90.0,0.0])
  count=count+require(player.client.ps.origin==[256.0,-64.0,25.0] and player.client.ps.pm_time==160 and (player.client.ps.pm_flags&64)!=0,"spectator teleport state")
  count=count+require(q.VectorLength(player.client.ps.velocity)>399.0 and q.VectorLength(player.client.ps.velocity)<401.0,"teleport launch velocity")

  player.s.pos.trBase=[17.75,18.25,19.5];player.s.apos.trBase=[0.0,45.0,0.0]
  exit=misc.DropPortalDestination(level,player);portalId=player.client.portalID
  enter=misc.DropPortalSource(level,player)
  count=count+require(portalId==1 and player.client.portalID==0 and exit.count==enter.count and exit.die==activePortalKernel.PortalDie and enter.die==activePortalKernel.PortalDie and enter.think==activePortalKernel.PortalEnable,"portal pair callbacks")
  level.time=2600;game.runThink(level,enter)
  count=count+require(enter.touch==activePortalKernel.PortalTouch and enter.think==game.free and enter.nextthink==122600,"portal enable frame path")
  player.health=100;misc.PortalTouch(level,enter,player,void)
  count=count+require(player.client.ps.origin[0]==exit.s.pos.trBase[0] and player.client.ps.origin[1]==exit.s.pos.trBase[1] and player.client.ps.origin[2]==exit.s.pos.trBase[2]+1.0,"active portal teleport")
  misc.PortalDie(level,exit,enter,player,10,c.MOD_TELEFRAG)
  count=count+require(not exit.inuse,"portal damage callback")

  before=level.num_entities;result=misc.utilities(level,player)
  count=count+require(result==void and level.num_entities==before,"inventory-comment compatibility symbol")
  return count
end function
function main(args)
  if len(args)!=1 then return error(499,"Expected BSP") end if
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world)
  print("PASS: "+str(count)+" complete g_misc contracts");return 0
end function
