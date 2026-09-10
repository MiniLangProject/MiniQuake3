import mq3.format.bsp as bsp
import mq3.collision.world as collision
import mq3.client.playable_targets as targets
import mq3.client.playable_enemy_ai as enemy
import std.fs as fs

function main(args)
  if len(args)!=1 then return error(7542,"usage: probe map.bsp") end if
  data=fs.readAllBytes(args[0]);if data is error then return data end if
  map=bsp.load(data);if map is error then return map end if
  world=collision.load(data);if world is error then return world end if
  all=targets.load(map,-1);preview=targets.load(map,0)
  if all is error then return all else if preview is error then return preview end if
  player=[all.targets[0].origin[0],all.targets[0].origin[1],all.targets[0].origin[2]+20.0]
  ai=enemy.state(preview,0);attacks=0
  for frame=0 to 39
    events=enemy.step(world,ai,preview,player,frame*50,50);if events is error then return events end if
    attacks=attacks+len(events)
  end for
  print("PASS: q3dm1 enemy AI targets="+str(len(preview.targets))+" visible="+str(ai.visibleCount)+" attacks="+str(attacks));return 0
end function
