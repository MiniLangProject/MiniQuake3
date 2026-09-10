import mq3.client.playable_player_projectiles as shots
import mq3.client.playable_targets as targets
import mq3.client.playable_projectile_view as view
import mq3.shared.math as qmath

struct MockPlane fraction normal end struct
struct MockResult trace endpos end struct
struct TraceContext fractions index end struct

function require(ok,message) if not ok then return error(7591,message) end if;return 1 end function
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function
function entity(origin) return [["classname","info_player_deathmatch"],["origin",origin]] end function
function targetState() return targets.fromEntities([entity("0 0 0"),entity("100 0 0"),entity("180 0 0")],-1) end function
function fakeTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  point=[];for axis=0 to 2 point=point+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[-1.0,0.0,0.0]),point)
end function
function floorTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  point=[];for axis=0 to 2 point=point+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[0.0,0.0,1.0]),point)
end function

function main(args)
  c=0
  rocket=shots.profile(shots.ROCKET);plasma=shots.profile(shots.PLASMA);grenade=shots.profile(shots.GRENADE);bfg=shots.profile(shots.BFG)
  c=c+require(rocket.speed==900.0 and rocket.lifetime==15000 and rocket.directDamage==100 and rocket.splashDamage==100 and rocket.splashRadius==120.0,"stock rocket profile")
  c=c+require(plasma.style==view.STYLE_PLASMA and plasma.speed==2000.0 and plasma.lifetime==10000 and plasma.directDamage==20 and plasma.splashDamage==15 and plasma.splashRadius==20.0,"stock plasma profile")
  c=c+require(grenade.style==view.STYLE_GRENADE and grenade.speed==700.0 and grenade.lifetime==2500 and grenade.gravity and (grenade.eFlags & shots.EF_BOUNCE_HALF)!=0,"stock grenade profile")
  c=c+require(bfg.style==view.STYLE_BFG and bfg.speed==2000.0 and bfg.lifetime==10000 and bfg.directDamage==100 and bfg.splashDamage==100 and bfg.splashRadius==120.0,"stock BFG profile")
  c=c+require(try(shots.profile("weapon_machinegun")) is error,"hitscan weapon rejected")

  state=shots.create(0);shot=shots.spawn(state,shots.ROCKET,[-100.0,0.0,0.0],[1.0,0.0,0.0],0)
  c=c+require(shot.id==0 and shot.expiresAt==15000 and close(qmath.VectorLength(shot.velocity),900.0,0.01),"rocket spawn and normalized velocity")
  impacts=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),state,targetState(),50)
  c=c+require(len(impacts)==0 and shots.activeCount(state)==1 and len(state.trails)==1,"unobstructed flight survives")
  c=c+require(close(state.projectiles[0].origin[0],-55.0,0.01),"flight uses elapsed milliseconds")

  combat=targetState();impacts=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),state,combat,150)
  c=c+require(len(impacts)==1 and impacts[0].id==0 and impacts[0].projectileId==0 and impacts[0].kind=="target" and impacts[0].targetIndex==0,"unique target impact")
  c=c+require(len(impacts[0].damages)==2 and impacts[0].damages[0].direct and impacts[0].damages[0].amount==100,"direct damage recorded once")
  c=c+require(not impacts[0].damages[1].direct and impacts[0].damages[1].targetIndex==1 and impacts[0].damages[1].amount==16,"splash falloff reaches nearby target bounds")
  c=c+require(not combat.targets[0].alive and combat.targets[1].health==84 and combat.score==1,"damage mutates targets and awards kill score")
  c=c+require(shots.activeCount(state)==0,"impact removes projectile")

  wallState=shots.create(0);shots.spawn(wallState,shots.PLASMA,[-100.0,0.0,0.0],[1.0,0.0,0.0],0);far=targetState()
  impacts=shots.updateWithTrace(fakeTrace,TraceContext([0.25],0),wallState,far,100)
  c=c+require(len(impacts)==1 and impacts[0].kind=="world" and impacts[0].targetIndex== -1,"BSP wins before target")
  c=c+require(impacts[0].normal==[-1.0,0.0,0.0] and close(impacts[0].point[0],-50.0,0.01),"world impact point and normal")
  c=c+require(len(impacts[0].damages)==0,"plasma splash outside radius")

  gravityState=shots.create(0);g=shots.spawn(gravityState,shots.GRENADE,[0.0,0.0,100.0],[1.0,0.0,0.0],0);empty=targets.fromEntities([], -1)
  shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),gravityState,empty,500)
  c=c+require(close(g.origin[0],350.0,0.01) and close(g.origin[2],0.0,0.01) and close(g.velocity[2],-400.0,0.01),"grenade ballistic step")
  shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),gravityState,empty,1000)
  c=c+require(close(g.origin[0],700.0,0.01) and close(g.origin[2],-300.0,0.01),"ballistics remain stable across frames")

  bounceState=shots.create(0);bounce=shots.spawn(bounceState,shots.GRENADE,[0.0,0.0,0.0],[1.0,0.0,0.0],0)
  impacts=shots.updateWithTrace(fakeTrace,TraceContext([0.5,1.0],0),bounceState,empty,100)
  c=c+require(len(impacts)==0 and shots.activeCount(bounceState)==1 and len(bounceState.trails)==2,"grenade world contact bounces and consumes remaining frame")
  c=c+require(close(bounce.velocity[0],-455.0,0.01) and close(bounce.velocity[2],-66.0,0.01),"EF_BOUNCE_HALF reflects and damps impact velocity")
  c=c+require(close(bounce.origin[0],11.25,0.02) and close(bounce.origin[2],-4.3,0.02),"post-bounce flight advances from nudged impact point")

  restState=shots.create(0);rest=shots.spawn(restState,shots.GRENADE,[0.0,0.0,10.0],[1.0,0.0,0.0],0)
  impacts=shots.updateWithTrace(floorTrace,TraceContext([0.5],0),restState,empty,100)
  c=c+require(len(impacts)==0 and rest.stopped and rest.velocity==[0.0,0.0,0.0],"slow floor bounce settles grenade without impact")
  restPoint=rest.origin;shots.updateWithTrace(fakeTrace,TraceContext([],0),restState,empty,200)
  c=c+require(rest.origin==restPoint and shots.activeCount(restState)==1,"settled grenade remains until fuse expires")
  expiryTargets=targets.fromEntities([entity(str(restPoint[0])+" "+str(restPoint[1])+" "+str(restPoint[2]))],-1)
  impacts=shots.updateWithTrace(fakeTrace,TraceContext([],0),restState,expiryTargets,2600)
  c=c+require(len(impacts)==1 and impacts[0].kind=="expired" and len(impacts[0].damages)==1,"settled grenade fuse explodes with splash damage")
  c=c+require(impacts[0].damages[0].amount==100 and not expiryTargets.targets[0].alive,"fuse explosion applies full point-blank splash")

  expiryState=shots.create(0);shots.spawn(expiryState,shots.GRENADE,[0.0,0.0,0.0],[0.0,1.0,0.0],0);near=targets.fromEntities([], -1)
  impacts=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),expiryState,near,3000)
  c=c+require(len(impacts)==1 and impacts[0].kind=="expired" and impacts[0].at==2500,"lifetime clamps and emits expiry impact")
  c=c+require(shots.activeCount(expiryState)==0 and expiryState.nextImpactId==1,"expired projectile removed exactly once")
  c=c+require(len(shots.updateWithTrace(fakeTrace,TraceContext([],0),expiryState,near,3100))==0 and expiryState.nextImpactId==1,"removed projectile cannot impact twice")

  ids=shots.create(10);a=shots.spawn(ids,shots.ROCKET,[0.0,0.0,0.0],[1.0,0.0,0.0],10);b=shots.spawn(ids,shots.PLASMA,[0.0,0.0,0.0],[1.0,0.0,0.0],10)
  c=c+require(a.id==0 and b.id==1 and shots.activeCount(ids)==2,"stable projectile IDs")
  c=c+require(try(shots.create(-1)) is error and try(shots.spawn(ids,shots.ROCKET,[0.0,0.0],[1.0,0.0,0.0],10)) is error,"invalid construction rejected")
  c=c+require(try(shots.spawn(ids,shots.ROCKET,[0.0,0.0,0.0],[0.0,0.0,0.0],10)) is error,"zero aim rejected")
  c=c+require(try(shots.updateWithTrace(fakeTrace,TraceContext([],0),ids,targetState(),9)) is error,"backwards update rejected")
  print("PASS: "+str(c)+" playable player-projectile contracts");return 0
end function
