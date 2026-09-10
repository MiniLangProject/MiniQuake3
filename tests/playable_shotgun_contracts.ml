import mq3.client.playable_shotgun as shotgun
import mq3.client.playable_targets as targets

struct MockPlane fraction normal end struct
struct MockResult trace endpos end struct
struct TraceContext fractions index end struct

function require(ok,message) if not ok then return error(7596,message) end if;return 1 end function
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function
function entity(origin) return [["classname","info_player_deathmatch"],["origin",origin]] end function
function targetState(origin) return targets.fromEntities([entity(origin)],-1) end function
function fakeTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  point=[];for axis=0 to 2 point=point+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[-1.0,0.0,0.0]),point)
end function
function failTrace(context,startPoint,endPoint) return error(7597,"trace failure") end function

function main(args)
  c=0
  c=c+require(shotgun.SHOT_MASK==0x6000001,"stock MASK_SHOT")
  c=c+require(shotgun.DEFAULT_SHOTGUN_COUNT==11 and shotgun.DEFAULT_SHOTGUN_DAMAGE==10,"stock pellet count and damage")
  c=c+require(shotgun.DEFAULT_SHOTGUN_SPREAD==700.0 and shotgun.PATTERN_RANGE==131072.0,"stock spread and 8192*16 range")
  pattern=shotgun.patternEndpoints([0.0,0.0,0.0],[4096.0,0.0,0.0],7)
  c=c+require(len(pattern[0])==11,"pattern emits eleven pellets")
  c=c+require(pattern[1]==1524994553,"two Q_crandom calls per pellet advance seed exactly")
  first=pattern[0][0];second=pattern[0][1]
  c=c+require(close(first[0],131072.0,0.0) and close(first[1],-2746.6797,0.01) and close(first[2],-4818.9941,0.01),"seed 7 first endpoint")
  c=c+require(close(second[1],-1505.9570,0.01) and close(second[2],10654.1504,0.01),"seed 7 second endpoint")
  repeat=shotgun.patternEndpoints([0.0,0.0,0.0],[1.0,0.0,0.0],7)
  c=c+require(repeat[0]==pattern[0] and repeat[1]==pattern[1],"normalized direction and seed are deterministic")

  combat=targetState("100 0 0");open=TraceContext(array(11,1.0),0)
  blast=shotgun.fireWithTrace(fakeTrace,open,combat,[0.0,0.0,0.0],[1.0,0.0,0.0],7,1000)
  c=c+require(len(blast.pellets)==11 and open.index==11,"every pellet performs one BSP trace")
  c=c+require(len(blast.hits)==10 and blast.totalDamage==100,"ten pellets deal ten damage before death")
  c=c+require(blast.kills==1 and blast.awardedScore==1 and blast.accuracyHit,"blast records one kill and one accuracy hit")
  c=c+require(not combat.targets[0].alive and combat.targets[0].health==0 and combat.score==1,"damage and kill mutate target state")
  c=c+require(blast.pellets[9].killed and blast.pellets[10].targetIndex== -1,"later pellet cannot hit dead target")

  shielded=targetState("100 0 0");wall=TraceContext(array(11,0.0003),0)
  blocked=shotgun.fireWithTrace(fakeTrace,wall,shielded,[0.0,0.0,0.0],[1.0,0.0,0.0],7,1000)
  c=c+require(len(blocked.hits)==0 and blocked.totalDamage==0 and shielded.targets[0].health==100,"BSP shields target")
  c=c+require(blocked.pellets[0].hit and blocked.pellets[0].normal==[-1.0,0.0,0.0],"BSP impact retained for effects")

  healthy=targetState("100 0 0")
  c=c+require(try(shotgun.fireWithTrace(failTrace,0,healthy,[0.0,0.0,0.0],[1.0,0.0,0.0],1,10)) is error,"trace failure propagated")
  c=c+require(healthy.targets[0].health==100 and healthy.score==0,"trace failure is damage-atomic")
  c=c+require(try(shotgun.patternEndpoints([0.0,0.0],[1.0,0.0,0.0],1)) is error,"invalid origin rejected")
  c=c+require(try(shotgun.patternEndpoints([0.0,0.0,0.0],[0.0,0.0,0.0],1)) is error,"zero direction rejected")
  c=c+require(try(shotgun.fireWithTrace(fakeTrace,TraceContext([],0),healthy,[0.0,0.0,0.0],[1.0,0.0,0.0],1,-1)) is error,"negative time rejected")
  print("PASS: "+str(c)+" playable-shotgun contracts");return 0
end function
