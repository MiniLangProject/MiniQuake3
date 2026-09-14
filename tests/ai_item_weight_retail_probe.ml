import mq3.botlib.ai_item_weights as weights
import mq3.botlib.ai_resource_pools as pools
import mq3.format.pk3 as pk3

struct Context archive end struct
function require(ok,label) if not ok then return error(7578,"retail item weights: "+label) end if;return 1 end function
function readFile(context,path) data=try(pk3.read(context.archive,path));if data is error then return void end if;return data end function
function main(args)
  if len(args)!=1 then return error(7578,"usage: ai_item_weight_retail_probe <pak0.pk3>") end if
  count=0;archive=pk3.open(args[0]);if archive is error then return archive end if;context=Context(archive);runtime=weights.create(context,readFile)
  items=weights.parseItems(runtime,"items.c");count=count+require(not (items is error) and len(items)==35,"all retail iteminfo records")
  count=count+require(items[0].classname=="item_armor_shard" and items[0].modelIndex==1 and items[0].inventoryIndex==1 and items[0].mins==[-15.0,-15.0,-15.0],"retail item fields and inv.h defines")
  config=weights.parseWeightConfig(runtime,"bots/sarge_i.c");count=count+require(not (config is error) and len(config.weights)==33,"Sarge includes complete fw_items profile")
  armor=weights.findWeight(config,"item_armor_shard");count=count+require(armor>=0 and config.weights[armor].separators[0].inventoryIndex==1 and config.weights[armor].separators[0].value==10,"armor switch index and threshold")
  leaf=config.weights[armor].separators[0];count=count+require(leaf.type==weights.WT_BALANCE and leaf.weight==40.0 and leaf.minWeight==10.0 and leaf.maxWeight==70.0,"Sarge macro and evalfloat balance")
  inventory=array(256,0);inventory[1]=0;count=count+require(weights.fuzzyWeight(inventory,config,armor)==40.0,"retail fuzzy runtime result")
  mapping=weights.itemWeightIndex(config,items);missing=0;for each value in mapping if value<0 then missing=missing+1 end if end for
  count=count+require(len(mapping)==35 and mapping[0]==armor and missing==2,"retail classname weight index including two intentional gaps")
  state=pools.create();goal=pools.allocGoalState(state,0);count=count+require(weights.loadItemWeights(runtime,state,goal,"bots/sarge_i.c")==0,"retail profile binds to goal state")
  bound=pools.goalState(state,goal);count=count+require(bound.itemWeightConfig!=void and len(bound.itemWeightIndex)==35 and bound.itemWeightIndex[0]==armor,"bound retail config and item index")
  reads=runtime.fileReads;weights.freeItemWeights(runtime,state,goal);count=count+require(bound.itemWeightConfig==void and bound.itemWeightIndex==void and weights.loadItemWeights(runtime,state,goal,"bots/sarge_i.c")==0 and runtime.fileReads==reads,"free binding retains shared caches")
  print("PASS: retail Sarge item weights checks="+str(count)+" items="+str(len(items))+" weights="+str(len(config.weights))+" missing="+str(missing));return 0
end function
