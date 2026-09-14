import mq3.botlib.ai_goal_selection as selection
import mq3.botlib.ai_goal_selection_syscalls as selectionTraps
import mq3.botlib.ai_goal_state as goalRuntime
import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.ai_level_items as levelItems
import mq3.botlib.ai_item_weights as weights
import mq3.compat.numeric as n

struct Harness time traces entityTime prints end struct
struct Sight fraction end struct
struct Seen ltime end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7598,"AI goal-selection contract: "+label) end if;return 1 end function
function selectionClock(context) return context.time end function
function selectionName(context,number) return "item"+str(number) end function
function selectionLog(context,text) return void end function
function selectionPrint(context,level,text) context.prints=context.prints+[[level,text]];return void end function
function selectionReach(context,origin,client) if origin[0]<0.0 then return 0 end if;return 1 end function
function selectionAreaReach(context,area) if area==1 then return 1 end if;return 0 end function
function selectionTravel(context,area,origin,goalArea,flags)
  if goalArea==10 then return 100 end if;if goalArea==20 then return 200 end if;if goalArea==30 then return 300 end if;if goalArea==90 then return 250 end if;return 0
end function
function selectionTrace(context,start,finish,viewer,contents) context.traces=context.traces+[[finish,viewer,contents]];return Sight(1.0) end function
function selectionEntity(context,number) return Seen(context.entityTime) end function
function makeSelectionGoal(number,area,entity,flags) return resources.Goal([area*1.0,2.0,3.0],area,[-2.0,-3.0,-4.0],[2.0,3.0,4.0],entity,number,flags,77) end function
function simpleSeparator(value) return weights.Separator(0,999999,weights.WT_BALANCE,value,value,value,void) end function
function simpleConfig(values)
  result=[];for index=0 to len(values)-1 result=result+[weights.Weight("w"+str(index),[simpleSeparator(values[index])])] end for;return weights.WeightConfig("memory",result)
end function
function setSelectionVmArg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function putSelectionVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function putSelectionGoal(vm,address,value)
  putSelectionVector(vm.data,address,value.origin);n.writeU32(vm.data,address+12,value.areaNum);putSelectionVector(vm.data,address+16,value.mins);putSelectionVector(vm.data,address+28,value.maxs);n.writeU32(vm.data,address+40,value.entityNum);n.writeU32(vm.data,address+44,value.number);n.writeU32(vm.data,address+48,value.flags);n.writeU32(vm.data,address+52,value.itemInfo);return void
end function
function putSelectionString(vm,address,value) raw=bytes(value);copyBytes(vm.data,address,raw,0,len(raw));vm.data[address+len(raw)]=0;return void end function

function main(args)
  count=0;itemRuntime=weights.create(void,void)
  itemRuntime.items=[
    weights.ItemInfo("item_health","Health","health.md3",1,0,0,5.0,[-5.0,-6.0,-7.0],[5.0,6.0,7.0],0),
    weights.ItemInfo("item_armor","Armor","armor.md3",2,0,1,45.0,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],1),
    weights.ItemInfo("item_ammo","Ammo","ammo.md3",3,0,2,30.0,[-3.0,-3.0,-3.0],[3.0,3.0,3.0],2)
  ]
  level=levelItems.create(itemRuntime);level.initialized=true;level.gameType=0
  health=levelItems.BotLevelItem(101,0,0,0.0,[10.0,0.0,0.0],10,[11.0,0.0,0.0],11,0.0)
  armor=levelItems.BotLevelItem(202,1,0,0.0,[20.0,0.0,0.0],20,[21.0,0.0,0.0],22,0.0)
  blocked=levelItems.BotLevelItem(303,2,levelItems.IFL_NOTBOT,0.0,[30.0,0.0,0.0],30,[31.0,0.0,0.0],33,0.0)
  level.levelItems=[health,armor,blocked]
  pools=resources.create();first=resources.allocGoalState(pools,4);second=resources.allocGoalState(pools,5);child=resources.allocGoalState(pools,6)
  host=Harness(10.0,[],8.0,[]);goals=goalRuntime.create(pools,host,selectionClock,selectionName,selectionLog,selectionPrint)
  services=selection.services(host);services.reachabilityAreaFn=selectionReach;services.areaReachabilityFn=selectionAreaReach;services.travelTimeFn=selectionTravel;services.traceFn=selectionTrace;services.entityInfoFn=selectionEntity
  runtime=selection.create(level,goals,services);state=resources.goalState(pools,first);state.itemWeightConfig=simpleConfig([10.0,30.0,999.0]);state.itemWeightIndex=[0,1,2]
  inventory=array(256,0)

  count=count+require(selection.chooseLTGItem(runtime,first,[0.0,0.0,0.0],inventory,1)==1 and goalRuntime.topGoal(goals,first).number==202,"LTG maximizes fuzzy weight divided by travel time")
  chosen=goalRuntime.topGoal(goals,first);count=count+require(chosen.areaNum==20 and chosen.entityNum==22 and chosen.itemInfo==1 and chosen.mins[0]==-8.0,"LTG copies complete item goal")
  count=count+require(goalRuntime.avoidGoalTime(goals,first,202)==45.0,"LTG applies respawn avoid time")
  goalRuntime.emptyGoalStack(goals,first);count=count+require(selection.chooseLTGItem(runtime,first,[0.0,0.0,0.0],inventory,1)==1 and goalRuntime.topGoal(goals,first).number==101,"active avoid entry removes otherwise best item")
  count=count+require(goalRuntime.avoidGoalTime(goals,first,101)==10.0,"short respawn is clamped to ten seconds")
  goalRuntime.emptyGoalStack(goals,first);goalRuntime.resetAvoidGoals(goals,first);state.lastReachabilityArea=1
  count=count+require(selection.chooseLTGItem(runtime,first,[-1.0,0.0,0.0],inventory,1)==1 and state.lastReachabilityArea==1,"unreachable origin falls back to last reachable area")

  goalRuntime.emptyGoalStack(goals,first);goalRuntime.resetAvoidGoals(goals,first);longTerm=makeSelectionGoal(900,90,0,0)
  count=count+require(selection.chooseNBGItem(runtime,first,[0.0,0.0,0.0],inventory,1,longTerm,201.0)==1 and goalRuntime.topGoal(goals,first).number==202,"NBG accepts travel below strict maximum and valid return")
  goalRuntime.emptyGoalStack(goals,first);goalRuntime.resetAvoidGoals(goals,first);count=count+require(selection.chooseNBGItem(runtime,first,[0.0,0.0,0.0],inventory,1,longTerm,200.0)==1 and goalRuntime.topGoal(goals,first).number==101,"NBG excludes travel equal to maximum")

  resultGoal=makeSelectionGoal(0,0,0,0);resultGoal.itemInfo=66
  count=count+require(selection.getLevelItemGoal(runtime,-1,"health",resultGoal)==101 and resultGoal.number==101 and resultGoal.itemInfo==66,"level-item lookup is case insensitive and preserves unwritten iteminfo")
  count=count+require(selection.getLevelItemGoal(runtime,101,"Armor",resultGoal)==202 and resultGoal.number==202,"level-item lookup resumes after supplied list number")
  count=count+require(selection.getLevelItemGoal(runtime,999,"Health",resultGoal)==-1 and selection.getLevelItemGoal(runtime,303,"Ammo",resultGoal)==-1,"level-item continuation and NOTBOT filtering match Baseq3")
  armor.timeout=12.0;count=count+require(selection.getLevelItemGoal(runtime,-1,"Armor",resultGoal)==202 and resultGoal.flags==(selection.GFL_ITEM|selection.GFL_DROPPED),"level lookup marks dropped items")

  visible=makeSelectionGoal(7,10,22,selection.GFL_ITEM);visible.origin=[10.0,20.0,30.0];visible.mins=[-2.0,-4.0,-6.0]
  count=count+require(selection.itemGoalInVisButNotVisible(runtime,3,[0.0,0.0,0.0],[90.0,0.0,0.0],visible),"visible stale item reports entity desynchronization")
  middle=host.traces[0][0];count=count+require(middle==[8.0,16.0,24.0] and host.traces[0][2]==selection.CONTENTS_SOLID,"released origin-plus-mins sight target is retained")
  host.entityTime=9.5;count=count+require(not selection.itemGoalInVisButNotVisible(runtime,3,[0.0,0.0,0.0],[0.0,0.0,0.0],visible),"entity exactly half a second old is not stale")
  visible.flags=0;count=count+require(not selection.itemGoalInVisButNotVisible(runtime,3,[0.0,0.0,0.0],[0.0,0.0,0.0],visible),"visibility helper accepts item goals only")

  aChild=[weights.Separator(0,1,weights.WT_BALANCE,10.0,0.0,20.0,void)];bChild=[weights.Separator(0,1,weights.WT_BALANCE,30.0,0.0,40.0,void)];outChild=[weights.Separator(0,1,weights.WT_BALANCE,0.0,0.0,1.0,void)]
  aTop=[weights.Separator(0,1,0,0.0,0.0,0.0,aChild),weights.Separator(0,2,weights.WT_BALANCE,2.0,0.0,3.0,void)]
  bTop=[weights.Separator(0,1,0,0.0,0.0,0.0,bChild),weights.Separator(0,2,weights.WT_BALANCE,6.0,0.0,8.0,void)]
  outTop=[weights.Separator(0,1,0,0.0,0.0,0.0,outChild),weights.Separator(0,2,weights.WT_BALANCE,0.0,0.0,3.0,void)]
  resources.goalState(pools,first).itemWeightConfig=weights.WeightConfig("a",[weights.Weight("x",aTop)])
  resources.goalState(pools,second).itemWeightConfig=weights.WeightConfig("b",[weights.Weight("x",bTop)])
  resources.goalState(pools,child).itemWeightConfig=weights.WeightConfig("c",[weights.Weight("x",outTop)])
  selection.interbreedGoalFuzzyLogic(runtime,first,second,child)
  count=count+require(outChild[0].weight==30.0,"released child-recursion bug uses parent two twice")
  count=count+require(outTop[1].weight==4.0 and outTop[1].minWeight==4.0 and outTop[1].maxWeight==4.0,"balance average preserves released min/max comparisons")

  selection.setRandomSeed(runtime,1);mutating=weights.Separator(0,1,weights.WT_BALANCE,10.0,0.0,20.0,void);resources.goalState(pools,first).itemWeightConfig=weights.WeightConfig("mutate",[weights.Weight("x",[mutating])])
  count=count+require(selection.mutateGoalFuzzyLogic(runtime,first,99.0)==0 and n.floatBits(mutating.weight)==0x4148b1d2,"mutation follows native rand and ignores range")
  count=count+require(mutating.minWeight==0.0 and mutating.maxWeight==20.0,"mutation retains bounds when evolved weight remains inside")
  selection.setRandomSeed(runtime,1);family=selection.geneticParentsAndChildSelection(runtime,4,[1.0,2.0,3.0,4.0])
  count=count+require(family==[1,3,2,0],"released genetic selection consumes random values but selects from descending residual sum")
  count=count+require(selection.geneticParentsAndChildSelection(runtime,2,[1.0,2.0])==[0,0,0,0],"genetic selection rejects fewer than three valid bots")

  vm=Machine(bytes(4096,0),4095);base=3500;putSelectionString(vm,3000,"Armor");putSelectionGoal(vm,3100,makeSelectionGoal(0,0,0,0));setSelectionVmArg(vm,base,1,-1);setSelectionVmArg(vm,base,2,3000);setSelectionVmArg(vm,base,3,3100)
  count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_GET_LEVEL_ITEM_GOAL)==202 and n.readI32(vm.data,3144)==202 and n.readI32(vm.data,3148)==(selection.GFL_ITEM|selection.GFL_DROPPED),"GetLevelItemGoal syscall uses exact bot_goal_t ABI")
  setSelectionVmArg(vm,base,1,first);setSelectionVmArg(vm,base,2,second);setSelectionVmArg(vm,base,3,child);count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_INTERBREED_GOAL_FUZZY_LOGIC)==0,"interbreed syscall dispatches canonical opcode 565")
  putSelectionString(vm,3000,"ignored.w");setSelectionVmArg(vm,base,1,first);setSelectionVmArg(vm,base,2,3000);count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_SAVE_GOAL_FUZZY_LOGIC)==0,"released fuzzy-save trap remains an exact no-op")
  for index=0 to 3 n.writeU32(vm.data,2800+index*4,n.floatBits(index+1.0)) end for;setSelectionVmArg(vm,base,1,4);setSelectionVmArg(vm,base,2,2800);setSelectionVmArg(vm,base,3,2850);setSelectionVmArg(vm,base,4,2854);setSelectionVmArg(vm,base,5,2858);selection.setRandomSeed(runtime,1)
  count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_GENETIC_PARENTS_AND_CHILD_SELECTION)==1 and n.readI32(vm.data,2850)==3 and n.readI32(vm.data,2854)==2 and n.readI32(vm.data,2858)==0,"genetic syscall marshals float ranks and three output pointers")
  setSelectionVmArg(vm,base,1,257);setSelectionVmArg(vm,base,2,0);count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_GENETIC_PARENTS_AND_CHILD_SELECTION)==0 and n.readI32(vm.data,2850)==0 and n.readI32(vm.data,2854)==0 and n.readI32(vm.data,2858)==0,"oversized genetic syscall writes zero outputs without reading ranks")
  setSelectionVmArg(vm,base,1,first);setSelectionVmArg(vm,base,2,n.floatBits(0.01));count=count+require(selectionTraps.dispatch(runtime,vm,base,selection.OP_MUTATE_GOAL_FUZZY_LOGIC)==0,"mutation syscall decodes PASSFLOAT range")
  count=count+require(selection.supportsTrap(535) and selection.supportsTrap(539) and selection.supportsTrap(545) and selection.supportsTrap(564) and selection.supportsTrap(565) and selection.supportsTrap(566),"selection trap coverage includes the complete fuzzy evolution block")
  print("PASS: "+str(count)+" AI goal-selection contracts opcodes=535,536,538,539,545,564-566");return 0
end function
