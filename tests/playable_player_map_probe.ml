import mq3.format.bsp as bsp
import mq3.client.playable_player as player
import std.fs as fs

function main(args)
  if len(args)!=1 then return error(7542,"usage: probe map.bsp") end if
  data=fs.readAllBytes(args[0]);if data is error then return data end if
  map=bsp.load(data);if map is error then return map end if
  state=player.load(map);if state is error then return state end if
  if len(state.spawns)<2 then return error(7543,"q3dm1 needs multiple deathmatch spawns") end if
  first=state.position
  player.configure(state,0,0);hit=player.applyDamage(state,10000,0,true);if hit is error then return hit end if
  respawn=player.pollRespawn(state,0);if respawn is error then return respawn end if
  if not respawn.respawned or state.position==first then return error(7544,"q3dm1 spawn cycle failed") end if
  print("PASS: BSP playable player deathmatchSpawns="+str(len(state.spawns))+" nextSpawn="+str(state.spawnIndex))
  return 0
end function
