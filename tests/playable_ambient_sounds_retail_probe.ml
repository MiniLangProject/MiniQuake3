import mq3.client.playable_ambient_sounds as ambient
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp

function main(args)
  if len(args)!=1 then return error(7612,"pak0 path required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  bytes=pk3.read(archive,"maps/q3dm1.bsp");if bytes is error then return bytes end if
  map=bsp.load(bytes);if map is error then return map end if
  catalog=ambient.load(map,archive);if catalog is error then return catalog end if
  if len(catalog.speakers)!=8 or len(catalog.uniqueSounds)!=1 or len(catalog.skipped)!=0 then return error(7613,"unexpected q3dm1 ambient catalog") end if
  loops=ambient.globalLoops(catalog);if len(loops)!=0 then return error(7613,"q3dm1 spatial speakers must not become global loops") end if
  print("PASS: q3dm1 ambience speakers="+str(len(catalog.speakers))+" uniqueWavs="+str(len(catalog.uniqueSounds))+" globalLoops=0");return 0
end function
