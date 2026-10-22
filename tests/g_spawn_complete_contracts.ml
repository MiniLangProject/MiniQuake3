// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_spawn as gSpawn
import mq3.game.spawn as spawnContractKernel
import mq3.game.entities as game
import mq3.collision.world as cm
import std.fs as fs

function require(ok,label)
  if not ok then return error(499,"g_spawn contract: "+label) end if
  return 1
end function
function fresh(world)
  level=game.create(world);state=spawnContractKernel.create(level,"");level.num_entities=64;level.time=1000
  return [level,state]
end function
function editionEntity(world,missionpack,key)
  pair=fresh(world);level=pair[0];state=pair[1];state.missionpack=missionpack;state.gametype=0
  state.vars=[["classname","item_botroam"],[key,"1"]];slot=level.num_entities
  gSpawn.G_SpawnGEntityFromSpawnVars(state);return level.entities[slot]
end function
function contracts(world)
  count=0;pair=fresh(world);level=pair[0];state=pair[1]
  state.vars=[["Probe","17"],["probe","99"],["float","2.5"],["vector","1 -2 3.5"]]
  result=gSpawn.G_SpawnString(state,"probe","fallback")
  count=count+require(result[0] and result[1]=="17","case-insensitive first string")
  result=gSpawn.G_SpawnString(state,"missing","fallback")
  count=count+require(not result[0] and result[1]=="fallback","missing string fallback")
  result=gSpawn.G_SpawnInt(state,"probe","7")
  count=count+require(result[0] and result[1]==17,"integer conversion")
  result=gSpawn.G_SpawnFloat(state,"float","0")
  count=count+require(result[0] and result[1]==2.5,"float conversion")
  result=gSpawn.G_SpawnVector(state,"vector","0 0 0",[9.0,9.0,9.0])
  count=count+require(result[0] and result[1]==[1.0,-2.0,3.5],"vector conversion")
  count=count+require(len(gSpawn.fields())==20,"complete field table")
  count=count+require(len(gSpawn.spawns(state))==48,"Baseq3 class table")
  state.missionpack=true
  count=count+require(len(gSpawn.spawns(state))==51,"Missionpack class table")
  count=count+require(gSpawn.G_NewString("one\\ntwo\\qthree")=="one\ntwo\\three","escaped string copy")

  ent=game.spawn(level);gSpawn.G_ParseField(state,"AnGlE","-45.5",ent)
  gSpawn.G_ParseField(state,"targetShaderName","old\\nshader",ent)
  count=count+require(ent.s.angles==[0.0,-45.5,0.0] and ent.targetShaderName=="old\nshader","field conversion and arena string")
  chars=state.chars;gSpawn.G_AddSpawnVarToken(state,"abc")
  count=count+require(state.chars==chars+4,"spawn token byte accounting")

  parsed=spawnContractKernel.create(level,"{ \"key\" \"value\" }")
  count=count+require(gSpawn.G_ParseSpawnVars(parsed) and len(parsed.vars)==1 and parsed.vars[0]==["key","value"],"brace parser")
  count=count+require(not gSpawn.G_ParseSpawnVars(parsed),"entity token EOF")

  count=count+require(not editionEntity(world,false,"notq3a").inuse,"Baseq3 honors notq3a")
  count=count+require(editionEntity(world,false,"notta").inuse,"Baseq3 ignores notta")
  count=count+require(editionEntity(world,true,"notq3a").inuse,"Missionpack ignores notq3a")
  count=count+require(not editionEntity(world,true,"notta").inuse,"Missionpack honors notta")

  pair=fresh(world);level=pair[0];state=pair[1];obelisk=game.spawn(level);obelisk.classname="team_redobelisk"
  count=count+require(not gSpawn.G_CallSpawn(state,obelisk),"Baseq3 excludes Missionpack class")
  state.missionpack=true;state.gametype=3
  count=count+require(gSpawn.G_CallSpawn(state,obelisk),"Missionpack includes obelisk class")
  botroam=game.spawn(level);botroam.classname="item_botroam";botroam.count=77;gSpawn.SP_item_botroam(botroam)
  count=count+require(botroam.inuse and botroam.classname=="item_botroam" and botroam.count==77,"empty item_botroam leaves state unchanged")

  pair=fresh(world);level=pair[0];state=pair[1];level.startTime=321;state.motd="motd"
  state.vars=[["classname","worldspawn"],["music","music/test"],["message","Arena"],["gravity","700"]]
  gSpawn.SP_worldspawn(state)
  count=count+require(state.configstrings[20]=="baseq3-1" and state.configstrings[21]=="321" and state.configstrings[2]=="music/test" and state.configstrings[3]=="Arena" and state.configstrings[4]=="motd","worldspawn configstrings")
  count=count+require(level.entities[1022].classname=="worldspawn" and level.entities[1022].s.number==1022,"world entity initialization")

  pair=fresh(world);level=pair[0];state=spawnContractKernel.create(level,"{ \"classname\" \"worldspawn\" } { \"classname\" \"item_botroam\" }")
  gSpawn.G_SpawnEntitiesFromString(state)
  count=count+require(not state.spawning and level.num_entities==65 and level.entities[64].inuse,"productive entity-string load")
  return count
end function
function main(args)
  if len(args)!=1 then return error(499,"Expected BSP") end if
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);count=contracts(world)
  print("PASS: "+str(count)+" complete g_spawn contracts");return 0
end function
