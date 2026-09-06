// SPDX-License-Identifier: GPL-2.0-or-later
// Defined Mini safety boundaries and owned messages across original va overlap.
package map_object_contracts
import mq3.game.map_targets as mapTargets
import mq3.game.portals as portals
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.compat.numeric as n
struct ContractState
  messages
  links
  mutation
end struct
function mapContractRequire(condition,message)
  if not condition then return error(499,"Map-object contract: "+message) end if
  return 1
end function
function mapContractSend(level,slot,text)
  state = level.context; state.messages = state.messages+[[slot,text]]
  if state.mutation == 1 and slot == 0 then level.clients[1].connected = 2; level.clients[2].team = 1 end if
  if state.mutation == 2 and slot == 0 then level.maxclients = 1 end if
  if state.mutation == 3 and slot == 0 then level.entities[64].message = "changed" end if
  if state.mutation == 4 and slot == 0 then
    state.mutation = 0; mapTargets.mapTargetsTeamCommand(level,2,"nested")
  end if
  return void
end function
function mapContractObserve(level,kind,ent)
  if kind == 1 then level.context.links = level.context.links+[[ent.s.clientNum,ent.s.eType,ent.r.svFlags,ent.r.mins[0],ent.r.maxs[0]]] end if
  return void
end function
function mapContractLevel(world)
  level = game.create(world); spawn.create(level,""); level.context = ContractState([],[],0)
  level.serverCommandFn = mapContractSend; level.observeFn = mapContractObserve; level.maxclients = 64
  return level
end function
function run(world)
  total = 0; level = mapContractLevel(world); ent = level.entities[64]; activator = level.entities[0]
  ent.message = "owned text"; ent.spawnflags = 1
  for index = 0 to 63
    level.clients[index].team = 1; level.clients[index].connected = 2
  end for
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(len(level.context.messages)==64,"all 64 connected team recipients")
  for index = 0 to 63
    total = total+mapContractRequire(level.context.messages[index][0]==index and level.context.messages[index][1]=="cp \"owned text\"","owned va-overlap text and ordered recipient")
  end for
  level.context.messages = []; level.context.mutation = 1; level.maxclients = 3
  level.clients[1].connected = 1; level.clients[2].team = 2
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(len(level.context.messages)==3,"live connection/team changes during delivery")
  level.context.messages = []; level.context.mutation = 2
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(len(level.context.messages)==1,"live client limit during delivery")
  level.context.messages = []; level.context.mutation = 3; level.maxclients = 2
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(level.context.messages[0][1]=="cp \"owned text\"" and level.context.messages[1][1]=="cp \"owned text\"","current team retains its formatted message")
  level.context.messages = []; level.context.mutation = 4; level.maxclients = 3; level.clients[2].team = 2
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(len(level.context.messages)==3,"recursive team delivery completes")
  total = total+mapContractRequire(level.context.messages[0][1]=="cp \"changed\"" and level.context.messages[1][1]=="nested" and level.context.messages[2][1]=="cp \"changed\"","recursive va calls cannot corrupt retained owned text")
  for each invalidLimit in [-1,65,1.5,"64",void]
    level.maxclients = invalidLimit
    total = total+mapContractRequire(try(mapTargets.mapTargetsTeamCommand(level,1,"x")) is error,"client storage range")
  end for
  level.maxclients = 0
  total = total+mapContractRequire(not (try(mapTargets.mapTargetsTeamCommand(level,1,123)) is error),"unused command format is not evaluated")
  ent.message = decode(bytes(31994,120)); ent.spawnflags = 0; level.context.messages = []
  mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(len(bytes(level.context.messages[0][1]))==31999,"exact va payload limit")
  ent.message = decode(bytes(31995,120)); failure = try(mapTargets.printUse(level,ent,void,activator))
  total = total+mapContractRequire(failure is error and failure.message=="Map target format exceeds native va storage","va overflow rejected independently")
  total = total+mapContractRequire(len(level.context.messages)==1,"overflow before delivery")
  ent.message = "prefix"+decode(bytes(1,0))+decode(bytes(40000,120)); mapTargets.printUse(level,ent,void,activator)
  total = total+mapContractRequire(level.context.messages[1][1]=="cp \"prefix\"","format stops at embedded NUL before length guard")
  ent.message = 7
  total = total+mapContractRequire(try(mapTargets.printUse(level,ent,void,activator)) is error,"non-native string argument")
  for each operation in [mapTargets.giveUse,mapTargets.removePowerupsUse,mapTargets.scoreUse,mapTargets.printUse]
    total = total+mapContractRequire(try(operation(level,ent,void,void)) is error,"NULL activating entity")
  end for
  activator.client = level.clients[0]; ent.spawnflags = 4; ent.message = "private"
  original = activator.slot; activator.slot = -1
  total = total+mapContractRequire(try(mapTargets.printUse(level,ent,void,activator)) is error,"private entity storage range")
  activator.slot = 1
  total = total+mapContractRequire(try(mapTargets.printUse(level,ent,void,activator)) is error,"private entity array identity")
  activator.slot = original; level.serverCommandFn = void
  total = total+mapContractRequire(try(mapTargets.printUse(level,ent,void,activator)) is error,"missing server command host")
  ent.target = "item"
  for each invalidEntityCount in [-1,1025,1.5,"64",void]
    level.num_entities = invalidEntityCount
    total = total+mapContractRequire(try(mapTargets.giveUse(level,ent,void,activator)) is error,"entity search storage range")
  end for
  level.num_entities = 64; powers = activator.client.ps.powerups
  for each badPowers in [[],array(15,0),array(17,0)]
    activator.client.ps.powerups = badPowers
    total = total+mapContractRequire(try(mapTargets.removePowerupsUse(level,ent,void,activator)) is error,"native sixteen powerup slots")
  end for
  activator.client.ps.powerups = powers; powers[1] = 123; powers[15] = -17
  mapTargets.removePowerupsUse(level,ent,void,activator)
  total = total+mapContractRequire(activator.client.ps.powerups==powers and powers[1]==0 and powers[15]==0,"powerup clearing preserves array identity")
  total = total+mapContractRequire(mapTargets.mapTargetsNamesEqual("ABC","abc"),"ASCII folding")
  total = total+mapContractRequire(not mapTargets.mapTargetsNamesEqual("Ä","ä"),"high UTF8 bytes are not locale folded")
  total = total+mapContractRequire(not mapTargets.mapTargetsNamesEqual(void,void),"NULL Q_stricmp match")
  prefix = decode(bytes(99999,120))
  total = total+mapContractRequire(mapTargets.mapTargetsNamesEqual(prefix+"a",prefix+"b"),"original bounded Q_stricmp count")
  for each roll in ["nan","inf","-inf","3019898880","-3019899136","1e30","-1e30"]
    level = mapContractLevel(world); ent = game.spawn(level); ent.s.clientNum = 123; ent.s.eType = 7; ent.r.svFlags = 8
    ent.r.mins[0] = -25.0; ent.r.maxs[0] = 25.0; level.spawner.vars = [["roll",roll]]
    failure = try(portals.camera(level,ent))
    total = total+mapContractRequire(failure is error and failure.message=="Portal camera roll is outside defined native integer range","undefined camera cast rejected independently: "+roll+"; "+str(failure))
    total = total+mapContractRequire(ent.s.clientNum==123 and len(level.context.links)==1,"camera failure occurs after Link before clientNum assignment")
    observed = level.context.links[0]
    total = total+mapContractRequire(observed[0]==123 and observed[1]==7 and observed[2]==8 and observed[3]==0.0 and observed[4]==0.0,"camera Link prestate")
  end for
  return total
end function
