import mq3.format.pk3 as pk3
import mq3.renderer.player_skins as skins

function main(args)
  if len(args)!=1 then print("usage: player_skins_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  suite=skins.loadSargeDefault(archive);if suite is error then return suite end if
  if len(suite.lower.bindings)!=1 or len(suite.upper.bindings)!=2 or len(suite.head.bindings)!=2 then return error(7522,"unexpected retail Sarge binding counts") end if
  pixels=0
  for each binding in suite.lower.bindings pixels=pixels+binding.image.width*binding.image.height end for
  for each binding in suite.upper.bindings pixels=pixels+binding.image.width*binding.image.height end for
  for each binding in suite.head.bindings pixels=pixels+binding.image.width*binding.image.height end for
  print("PASS: retail Sarge default lower=1 upper=2 head=2 unique="+str(suite.uniqueImages)+" decodedPixels="+str(pixels))
  return 0
end function
