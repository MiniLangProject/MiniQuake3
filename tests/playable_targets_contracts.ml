import mq3.client.playable_targets as targets
import mq3.client.playable_weapon as weapon

function require(ok,message) if not ok then return error(7521,message) end if;return 1 end function
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function
function entity(classname,origin) return [["classname",classname],["origin",origin]] end function

function shot(startPoint,endPoint)
  distance=endPoint[0]-startPoint[0];if distance<0.0 then distance=0.0-distance end if
  return weapon.Shot(startPoint,endPoint,false,[0.0,0.0,0.0],distance,1.0)
end function

function main(args)
  count=0
  entities=[entity("worldspawn","0 0 0"),entity("info_player_deathmatch","0 0 0"),entity("INFO_PLAYER_DEATHMATCH","100 0 24"),entity("info_player_deathmatch","200 0 24"),entity("item_health","300 0 0")]
  state=targets.fromEntities(entities,0)
  count=count+require(len(state.targets)==2,"player spawn excluded and target spawns loaded")
  count=count+require(state.targets[0].spawnIndex==1 and state.targets[0].origin==[100.0,0.0,24.0],"spawn order and origin")
  count=count+require(state.targets[0].health==100 and state.targets[0].maxHealth==100 and state.targets[0].alive,"target health defaults")
  count=count+require(state.targets[0].respawnAt==0 and state.targets[0].score==1,"target score and respawn defaults")
  count=count+require(state.score==0 and targets.activeCount(state)==2,"initial combat state")
  count=count+require(try(targets.fromEntities(entities,-2)) is error,"invalid excluded spawn rejected")
  count=count+require(close(targets.segmentFraction([0.0,0.0,24.0],[300.0,0.0,24.0],state.targets[0],15.0,-24.0,32.0),85.0/300.0,0.0001),"segment enters target radius")
  count=count+require(targets.segmentFraction([0.0,50.0,24.0],[300.0,50.0,24.0],state.targets[0],15.0,-24.0,32.0)<0.0,"parallel segment outside target misses")
  count=count+require(targets.segmentFraction([100.0,0.0,24.0],[300.0,0.0,24.0],state.targets[0],15.0,-24.0,32.0)==0.0,"segment starting inside target")
  count=count+require(targets.segmentFraction([0.0,0.0,100.0],[300.0,0.0,100.0],state.targets[0],15.0,-24.0,32.0)<0.0,"shot above target misses")
  miss=targets.applyDefaultShot(state,shot([0.0,50.0,24.0],[300.0,50.0,24.0]),0)
  count=count+require(miss==void and state.targets[0].health==100,"miss leaves health unchanged")
  hit=targets.applyDefaultShot(state,shot([0.0,0.0,24.0],[300.0,0.0,24.0]),10)
  count=count+require(hit!=void and hit.targetIndex==0 and hit.damage==34 and not hit.killed,"nearest target hit")
  count=count+require(state.targets[0].health==66 and close(hit.point[0],85.0,0.01),"damage and impact point")
  count=count+require(close(hit.distance,85.0,0.01) and hit.awardedScore==0,"hit distance and no premature score")
  hit2=targets.applyShot(state,shot([0.0,0.0,24.0],[300.0,0.0,24.0]),200,100)
  count=count+require(hit2.killed and hit2.damage==66,"lethal damage clamps to remaining health")
  count=count+require(not state.targets[0].alive and state.targets[0].health==0,"death state")
  count=count+require(state.targets[0].respawnAt==3100 and state.score==1 and hit2.awardedScore==1,"kill score and respawn deadline")
  throughDead=targets.applyDefaultShot(state,shot([0.0,0.0,24.0],[300.0,0.0,24.0]),200)
  count=count+require(throughDead!=void and throughDead.targetIndex==1,"dead target does not block farther target")
  count=count+require(targets.update(state,3099)==1 and not state.targets[0].alive,"target remains dead before deadline")
  count=count+require(targets.update(state,3100)==2 and state.targets[0].alive and state.targets[0].health==100,"target respawns at deadline")
  count=count+require(state.targets[0].respawnAt==0,"respawn clears deadline")
  origin0=[state.targets[0].origin[0],state.targets[0].origin[1],state.targets[0].origin[2]]
  targets.update(state,4100);origin1=state.targets[0].origin
  count=count+require(origin0!=origin1 and close(origin1[2],24.0,0.0),"deterministic horizontal patrol")
  copy=targets.fromEntities(entities,0);targets.update(copy,4100)
  count=count+require(copy.targets[0].origin==origin1,"same time and spawn produce same patrol position")
  wallLimited=targets.fromEntities(entities,0)
  blocked=targets.applyDefaultShot(wallLimited,shot([0.0,0.0,24.0],[50.0,0.0,24.0]),0)
  count=count+require(blocked==void,"world-limited Shot endpoint blocks target behind wall")
  count=count+require(try(targets.applyShot(void,shot([0.0,0.0,0.0],[1.0,0.0,0.0]),1,0)) is error,"missing state rejected")
  count=count+require(try(targets.applyShot(state,void,1,0)) is error,"missing shot rejected")
  count=count+require(try(targets.applyShot(state,shot([0.0,0.0,0.0],[1.0,0.0,0.0]),0,0)) is error,"zero damage rejected")
  count=count+require(try(targets.update(state,-1)) is error,"negative update time rejected")
  empty=targets.fromEntities([entity("worldspawn","0 0 0")],-1)
  count=count+require(len(empty.targets)==0 and targets.activeCount(empty)==0,"map without deathmatch spawns supported")
  print("PASS: "+str(count)+" playable-target contracts");return 0
end function
