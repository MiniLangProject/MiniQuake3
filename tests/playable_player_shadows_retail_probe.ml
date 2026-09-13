import mq3.client.playable_player_shadows as shadows
import mq3.client.playable_targets as targets
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.collision.world as collision
function main(args)
  if len(args)!=1 then return error(7672,"pak path required") end if;archive=pk3.open(args[0]);if archive is error then return archive end if;catalog=shadows.load(archive,300);if catalog is error then return catalog end if
  if catalog.image.width!=32 or catalog.image.height!=32 then return error(7673,"unexpected shadow image size") end if
  data=pk3.read(archive,"maps/q3dm1.bsp");if data is error then return data end if;map=bsp.load(data);if map is error then return map end if;world=collision.load(data);if world is error then return world end if
  targetState=targets.load(map,0);if targetState is error then return targetState end if;traced=0
  for each target in targetState.targets shadow=shadows.trace(world,target.origin,0.0);if shadow is error then return shadow end if;if shadow!=void then traced=traced+1 end if end for
  if traced!=len(targetState.targets) then return error(7674,"q3dm1 target shadow trace missed") end if
  print("PASS: retail player shadow "+catalog.imageName+" 32x32 pixels="+str(len(catalog.image.pixels))+" traced="+str(traced));return 0
end function
