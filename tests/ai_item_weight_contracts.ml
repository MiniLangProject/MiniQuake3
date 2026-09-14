import mq3.botlib.ai_item_weights as weights
import mq3.botlib.ai_item_weight_syscalls as traps
import mq3.botlib.ai_resource_pools as pools
import mq3.compat.numeric as n

struct Context paths texts reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7579,"item-weight contract: "+label) end if;return 1 end function
function readFile(context,path) context.reads=context.reads+1;for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return void end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function invoke(runtime,state,vm,base,op,a,b) n.writeU32(vm.data,base,op);n.writeU32(vm.data,base+4,a);n.writeU32(vm.data,base+8,b);return traps.dispatch(runtime,state,vm,base,op) end function

function main(args)
  checks=0
  inv="#define INVENTORY_TEST 2\n#define MODEL_TEST 7\n\n"
  items="#include \"inv.h\"\n#define ITEM_WEAPON 2\niteminfo \"item_test\" { name \"Test\" model \"m.md3\" modelindex MODEL_TEST type ITEM_WEAPON index INVENTORY_TEST respawntime 30 mins {-15,-15,-15} maxs {15,15,15} }\niteminfo \"item_plain\" { name \"Plain\" model \"p.md3\" modelindex 8 type 3 index 3 respawntime 20 mins {-1,-2,-3} maxs {1,2,3} }\n"
  fuzzy="#include \"inv.h\"\n\n\n\n#define SCALE(v) balance($evalfloat(v),$evalfloat(v-5),$evalfloat(v+5))\nweight \"item_test\" { switch(INVENTORY_TEST) { case 10: return SCALE(20); default: return 2; } }\nweight \"item_plain\" { return $evalfloat((2*20-50)<0?0:(2*20-50)); }\n"
  context=Context(["botfiles/inv.h","botfiles/items.c","botfiles/bots/test_i.c"],[inv,items,fuzzy],0);runtime=weights.create(context,readFile)
  parsedItems=weights.parseItems(runtime,"items.c");checks=checks+require(not (parsedItems is error) and len(parsedItems)==2,"iteminfo structures parsed")
  checks=checks+require(parsedItems[0].classname=="item_test" and parsedItems[0].modelIndex==7 and parsedItems[0].inventoryIndex==2 and parsedItems[0].mins[0]==-15.0,"item macros and signed vectors")
  config=weights.parseWeightConfig(runtime,"bots/test_i.c");checks=checks+require(not (config is error) and len(config.weights)==2,"fuzzy weight definitions parsed")
  first=config.weights[0].separators[0];checks=checks+require(first.inventoryIndex==2 and first.value==10 and first.type==weights.WT_BALANCE and first.weight==20.0 and first.minWeight==15.0 and first.maxWeight==25.0,"balance leaf and evalfloat")
  checks=checks+require(config.weights[1].separators[0].weight==0.0,"ternary evalfloat")
  checks=checks+require(weights.findWeight(config,"item_test")==0 and weights.findWeight(config,"missing")==-1,"weight name lookup")
  index=weights.itemWeightIndex(config,parsedItems);checks=checks+require(index==[0,1],"item classname to fuzzy-weight index")
  inventory=array(8,0);inventory[2]=5;checks=checks+require(weights.fuzzyWeight(inventory,config,0)==20.0,"recursive fuzzy evaluation")
  state=pools.create();goal=pools.allocGoalState(state,4);checks=checks+require(weights.loadItemWeights(runtime,state,goal,"bots/test_i.c")==0,"load binds profile")
  bound=pools.goalState(state,goal);checks=checks+require(bound.itemWeightConfig!=void and bound.itemWeightIndex==[0,1],"goal state owns config and item index")
  reads=runtime.fileReads;checks=checks+require(weights.loadItemWeights(runtime,state,goal,"bots/test_i.c")==0 and runtime.fileReads==reads,"weight and item caches reused")
  checks=checks+require(weights.loadItemWeights(runtime,state,0,"bots/test_i.c")==weights.BLERR_CANNOTLOADITEMWEIGHTS,"invalid goal returns original error")
  vm=Machine(bytes(256,0),255);putString(vm,32,"bots/test_i.c");checks=checks+require(invoke(runtime,state,vm,192,weights.OP_LOAD_ITEM_WEIGHTS,goal,32)==0,"load trap ABI")
  checks=checks+require(invoke(runtime,state,vm,192,weights.OP_FREE_ITEM_WEIGHTS,goal,0)==0 and bound.itemWeightConfig==void and bound.itemWeightIndex==void,"free trap releases goal bindings")
  checks=checks+require((try(traps.dispatch(runtime,state,vm,192,545))) is error,"dispatcher boundary")
  badContext=Context(["botfiles/bad.c"],["weight \"x\" { switch(2) { case 1 return 3; } }"],0);bad=weights.create(badContext,readFile)
  checks=checks+require((try(weights.parseWeightConfig(bad,"bad.c"))) is error,"malformed fuzzy grammar rejected")
  weights.shutdown(runtime);checks=checks+require(runtime.items==void and len(runtime.configs)==0,"shutdown clears caches")
  print("PASS: "+str(checks)+" AI item-weight contracts");return 0
end function
