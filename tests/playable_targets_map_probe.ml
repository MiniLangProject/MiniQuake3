import mq3.format.bsp as bsp
import mq3.client.playable_targets as targets
import std.fs as fs

function main(args)
  if len(args)!=1 then return error(7522,"usage: probe map.bsp") end if
  data=fs.readAllBytes(args[0]);if data is error then return data end if
  map=bsp.load(data);if map is error then return map end if
  all=targets.load(map,-1);if all is error then return all end if
  preview=targets.load(map,0);if preview is error then return preview end if
  if len(all.targets)<2 then return error(7523,"q3dm1 needs at least two deathmatch spawns") end if
  if len(preview.targets)!=len(all.targets)-1 then return error(7524,"preview must reserve one player spawn") end if
  print("PASS: BSP preview targets total="+str(len(preview.targets))+" deathmatchSpawns="+str(len(all.targets)))
  return 0
end function
