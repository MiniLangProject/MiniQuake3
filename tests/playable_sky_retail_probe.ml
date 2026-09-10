import mq3.client.playable_sky as sky
import mq3.format.pk3 as pk3

function main(args)
  if len(args)!=1 then print("usage: playable_sky_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  catalog=sky.load(archive,150,2);if catalog is error then return catalog end if
  if len(catalog.layers)!=2 or catalog.textureCount!=2 then return error(7612,"retail sky layers incomplete") end if
  if catalog.layers[0].imageName!="textures/skies/killsky_1.jpg" or catalog.layers[1].imageName!="textures/skies/killsky_2.jpg" then return error(7613,"q3dm1 retail sky image mismatch") end if
  if catalog.layers[0].image.width!=256 or catalog.layers[0].image.height!=256 or catalog.layers[1].image.width!=256 or catalog.layers[1].image.height!=256 then return error(7614,"retail sky dimensions mismatch") end if
  print("PASS: retail q3dm1 sky layers=2 textures=2 pixels="+str(catalog.layers[0].image.width*catalog.layers[0].image.height*2));return 0
end function
