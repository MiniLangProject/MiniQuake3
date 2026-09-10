import mq3.format.bsp as bsp
import mq3.client.playable_items as items
import std.fs as fs

function main(args)
  if len(args)!=1 then return error(7503,"usage: probe map.bsp") end if
  data=fs.readAllBytes(args[0]);if data is error then return data end if
  map=bsp.load(data);if map is error then return map end if
  state=items.load(map);if state is error then return state end if
  health=0;armor=0;ammo=0;weapons=0
  for each item in state.items
    if item.kind=="health" then health=health+1
    else if item.kind=="armor" then armor=armor+1
    else if item.kind=="ammo" then ammo=ammo+1
    else if item.kind=="weapon" then weapons=weapons+1
    end if
  end for
  print("PASS: BSP preview items total="+str(len(state.items))+" health="+str(health)+" armor="+str(armor)+" ammo="+str(ammo)+" weapons="+str(weapons))
  return 0
end function
