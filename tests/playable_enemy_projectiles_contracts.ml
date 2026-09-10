import mq3.client.playable_enemy_projectiles as shots
import mq3.client.playable_enemy_ai as enemy
import mq3.client.playable_targets as targets
import mq3.shared.math as qmath

struct MockPlane fraction normal end struct
struct MockResult trace endpos end struct
struct TraceContext fractions index end struct

function require(ok,message) if not ok then return error(7561,message) end if;return 1 end function
function close(a,b,tolerance) value=a-b;if value<0.0 then value=0.0-value end if;return value<=tolerance end function
function entity(classname,origin) return [["classname",classname],["origin",origin]] end function
function targetState() return targets.fromEntities([entity("info_player_deathmatch","0 0 0"),entity("info_player_deathmatch","100 0 0"),entity("info_player_deathmatch","0 200 0")],0) end function
function fakeTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  point=[];for axis=0 to 2 point=point+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[-1.0,0.0,0.0]),point)
end function

function main(args)
  count=0
  count=count+require(shots.SHOT_MASK==0x6000001 and close(shots.DEFAULT_SPEED,420.0,0.0),"projectile defaults")
  state=shots.createAabb(100);count=count+require(shots.activeCount(state)==0 and state.nextId==0 and state.lastTime==100,"empty AABB state")
  combat=targetState();ai=enemy.state(combat,100);ai.events=[enemy.Event(7,-1,0),enemy.Event(9,1,1)]
  spawned=shots.spawnAttacks(state,ai,combat,[0.0,0.0,20.0],100)
  count=count+require(len(spawned)==2 and shots.activeCount(state)==2,"all AI attacks spawn projectiles")
  count=count+require(spawned[0].id==0 and spawned[1].id==1 and spawned[0].attacker==0 and spawned[1].attacker==1,"stable insertion IDs and owners")
  count=count+require(spawned[0].damage==7 and spawned[0].side==-1 and spawned[0].expiresAt==2600,"AI payload and lifetime copied")
  count=count+require(close(qmath.VectorLength(spawned[0].velocity),shots.DEFAULT_SPEED,0.02),"aim direction has configured speed")
  count=count+require(len(shots.spawnAttacks(state,ai,combat,[0.0,0.0,20.0],100))==0 and shots.activeCount(state)==2,"same-frame event batch is idempotent")
  damage=shots.updateWithTrace(fakeTrace,TraceContext([1.0,1.0],0),state,[0.0,0.0,20.0],300)
  count=count+require(damage==7 and len(state.impacts)==1 and state.impacts[0].kind=="player","nearest player AABB receives damage")
  count=count+require(state.impacts[0].projectileId==0 and state.impacts[0].damage==7,"impact identifies projectile and damage")
  count=count+require(len(state.trails)==2 and state.trails[0].fromTime==100 and state.trails[0].toTime>100 and state.trails[0].toTime<=300,"one visible trail per moved projectile")
  count=count+require(shots.activeCount(state)==1 and state.projectiles[0].id==1,"hit projectile removed while another continues")
  damage=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),state,[0.0,0.0,20.0],700)
  count=count+require(damage==9 and len(state.impacts)==1 and state.impacts[0].projectileId==1,"second projectile hits independently")
  count=count+require(shots.activeCount(state)==0,"player hits cannot damage twice")
  damage=shots.updateWithTrace(fakeTrace,TraceContext([],0),state,[0.0,0.0,20.0],800)
  count=count+require(damage==0 and len(state.impacts)==0,"removed shots stay inert")

  wall=shots.createAabb(0);shots.spawnOne(wall,3,[100.0,0.0,20.0],[0.0,0.0,20.0],11,1,0)
  damage=shots.updateWithTrace(fakeTrace,TraceContext([0.25],0),wall,[0.0,0.0,20.0],100)
  count=count+require(damage==0 and wall.damageThisFrame==0 and wall.impacts[0].kind=="world","BSP impact blocks player damage")
  count=count+require(close(wall.impacts[0].point[0],89.5,0.02) and wall.impacts[0].normal==[-1.0,0.0,0.0],"world impact data")
  count=count+require(close(wall.trails[0].endPoint[0],wall.impacts[0].point[0],0.0) and wall.impacts[0].at==25,"trail terminates at timed impact")

  sphere=shots.createSphere(0,10.0);shots.spawnOne(sphere,0,[30.0,0.0,0.0],[0.0,0.0,0.0],5,0,0)
  damage=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),sphere,[0.0,0.0,0.0],100)
  count=count+require(damage==5 and close(sphere.impacts[0].point[0],13.0,0.03),"sphere sweep includes projectile radius")

  expiry=shots.create(0,100.0,50,0.0,shots.PLAYER_AABB,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],1.0)
  shots.spawnOne(expiry,0,[0.0,0.0,0.0],[1.0,0.0,0.0],4,0,0)
  damage=shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),expiry,[100.0,100.0,100.0],80)
  count=count+require(damage==0 and len(expiry.trails)==1 and close(expiry.trails[0].endPoint[0],5.0,0.01),"lifetime clamps final movement")
  count=count+require(expiry.impacts[0].kind=="expired" and expiry.impacts[0].at==50 and shots.activeCount(expiry)==0,"expiry emits deterministic impact")

  deterministicA=shots.createAabb(0);deterministicB=shots.createAabb(0)
  shots.spawnOne(deterministicA,0,[10.0,20.0,30.0],[100.0,20.0,30.0],1,-1,0);shots.spawnOne(deterministicB,0,[10.0,20.0,30.0],[100.0,20.0,30.0],1,-1,0)
  shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),deterministicA,[999.0,999.0,999.0],37)
  shots.updateWithTrace(fakeTrace,TraceContext([1.0],0),deterministicB,[999.0,999.0,999.0],37)
  count=count+require(deterministicA.projectiles[0].origin==deterministicB.projectiles[0].origin and deterministicA.trails[0].endPoint==deterministicB.trails[0].endPoint,"same inputs produce identical flight")
  count=count+require(try(shots.create(-1,1.0,1,0.0,shots.PLAYER_AABB,[0.0,0.0,0.0],[1.0,1.0,1.0],1.0)) is error,"invalid creation rejected")
  count=count+require(try(shots.create(0,1.0,1,0.0,99,[0.0,0.0,0.0],[1.0,1.0,1.0],1.0)) is error,"unknown shape rejected")
  count=count+require(try(shots.spawnAttacks(state,ai,combat,[0.0,0.0],500)) is error,"invalid aim rejected")
  count=count+require(try(shots.updateWithTrace(fakeTrace,TraceContext([],0),state,[0.0,0.0,0.0],50)) is error,"backwards update rejected")
  print("PASS: "+str(count)+" playable enemy-projectile contracts");return 0
end function
