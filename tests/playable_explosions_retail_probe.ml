import mq3.client.playable_explosions as explosions
import mq3.format.pk3 as pk3
function main(args)
  if len(args)!=1 then return error(7652,"pak path required") end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=explosions.load(archive,200,explosions.MAX_TEXTURES);if catalog is error then return catalog end if
  if catalog.textureCount!=15 or len(catalog.profiles)!=4 or catalog.plasmaModel.numSurfaces<1 then return error(7653,"incomplete retail explosion catalog") end if
  print("PASS: retail explosions textures="+str(catalog.textureCount)+" plasmaSurfaces="+str(catalog.plasmaModel.numSurfaces));return 0
end function
