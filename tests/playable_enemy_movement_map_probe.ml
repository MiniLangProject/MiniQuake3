import mq3.format.bsp as bsp
import mq3.collision.world as collision
import mq3.client.playable_targets as targets
import mq3.client.playable_enemy_movement as enemyMotion
import std.fs as fs

function main(args)
  if len(args)!=1 then return error(7560,"usage: probe map.bsp") end if
  data=fs.readAllBytes(args[0]);if data is error then return data end if
  map=bsp.load(data);if map is error then return map end if
  world=collision.load(data);if world is error then return world end if
  state=targets.load(map,-1);if state is error then return state end if
  if len(state.targets)==0 then return error(7561,"map needs a deathmatch spawn") end if
  target=state.targets[0];start=[target.origin[0],target.origin[1],target.origin[2]]
  moved=0;grounded=0;blocked=0
  deltas=[[48.0,0.0,0.0],[0.0,48.0,0.0],[-48.0,0.0,0.0],[0.0,-48.0,0.0]]
  for each delta in deltas
    result=enemyMotion.moveTarget(world,target,delta);if result is error then return result end if
    if result.delta[0]!=0.0 or result.delta[1]!=0.0 then moved=moved+1 end if
    if result.grounded then grounded=grounded+1 end if
    if result.blocked then blocked=blocked+1 end if
    overlap=collision.boxTrace(world,target.origin,target.origin,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],0,enemyMotion.PLAYER_MASK,false)
    if overlap is error then return overlap end if
    if overlap.trace.allsolid then return error(7562,"enemy entered solid BSP") end if
  end for
  print("PASS: q3dm1 enemy movement targets="+str(len(state.targets))+" moved="+str(moved)+" grounded="+str(grounded)+" blocked="+str(blocked)+" startZ="+str(start[2])+" endZ="+str(target.origin[2]));return 0
end function
