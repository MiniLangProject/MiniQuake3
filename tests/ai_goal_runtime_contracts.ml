import mq3.botlib.ai_goal_runtime as goal
import mq3.botlib.ai_goal_selection as selection
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_level_items as levelItems

struct Context paths texts time logs prints end struct
struct Sight fraction end struct
struct Seen ltime end struct
function require(ok,label) if not ok then return error(7641,"AI goal runtime contract: "+label) end if;return 1 end function
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return error(7641,"missing "+path) end function
function clock(context) return context.time end function
function log(context,text) context.logs=context.logs+[text];return void end function
function printMessage(context,level,text) context.prints=context.prints+[[level,text]];return void end function
function reachable(context,origin,client) return 1 end function
function areaReach(context,area) if area>0 then return 1 end if;return 0 end function
function travel(context,area,origin,goalArea,flags) return goalArea*10 end function
function traceHost(context,start,finish,viewer,contents) return Sight(1.0) end function
function entityHost(context,number) return Seen(context.time-1.0) end function
function place(context,origin,mins,maxs,floating) return [1,[origin[0],origin[1],origin[2]]] end function

function main(args)
  items="iteminfo \"item_health\" { name \"25 Health\" model \"health.md3\" modelindex 1 type 1 index 0 respawntime 5 mins {-15,-15,-15} maxs {15,15,15} }\niteminfo \"item_armor\" { name \"Armor\" model \"armor.md3\" modelindex 2 type 1 index 1 respawntime 30 mins {-8,-8,-8} maxs {8,8,8} }"
  fuzzy="weight \"item_health\" { return 10; }\nweight \"item_armor\" { return 30; }"
  context=Context(["botfiles/items.c","botfiles/test_i.c"],[items,fuzzy],100.0,[],[]);services=selection.services(context);services.reachabilityAreaFn=reachable;services.areaReachabilityFn=areaReach;services.travelTimeFn=travel;services.traceFn=traceHost;services.entityInfoFn=entityHost
  state=goal.create(context,readFile,clock,log,printMessage,services);checks=0
  checks=checks+require(goal.botSetupGoalAI(state,"items.c",0,1000.0)==0 and state.setup and len(state.itemWeights.items)==2,"file setup and item config")
  goal.bindWorld(state,void,void,[[],[["classname","target_location"],["message","Hall"],["origin","10 20 30"]]],0,place)
  counts=goal.botInitInfoEntities(state);checks=checks+require(counts==[1,0],"map info initialization")
  location=goal.botGetMapLocationGoal(state,"hall");checks=checks+require(location!=void and location.origin==[10.0,20.0,30.0],"case-insensitive map location")
  checks=checks+require(goal.botGetNextCampSpotGoal(state,0).next==0,"empty camp traversal")

  checks=checks+require(goal.initLevelItemHeap(state,4)==4 and state.freeLevelItems==4,"level item heap initialization")
  raw=goal.allocLevelItem(state);checks=checks+require(raw!=void and state.freeLevelItems==3,"level item allocation")
  raw.number=77;raw.itemInfo=0;raw.entityNum=7;raw.goalAreaNum=2;raw.origin=[2.0,0.0,0.0];raw.goalOrigin=[2.0,0.0,0.0]
  checks=checks+require(goal.addLevelItemToList(state,raw)==1 and state.levelItems.levelItems[0].number==77,"head list insertion")
  checks=checks+require(goal.removeLevelItemFromList(state,raw) and len(state.levelItems.levelItems)==0,"list removal")
  goal.addLevelItemToList(state,raw);goal.freeLevelItem(state,raw);checks=checks+require(state.freeLevelItems==4 and len(state.levelItems.levelItems)==0,"heap free")

  health=levelItems.BotLevelItem(101,0,0,0.0,[10.0,0.0,0.0],1,[10.0,0.0,0.0],11,0.0)
  armor=levelItems.BotLevelItem(202,1,0,0.0,[20.0,0.0,0.0],2,[20.0,0.0,0.0],22,0.0)
  state.levelItems.levelItems=[health,armor];state.levelItems.initialized=true;state.levelItems.numLevelItems=2
  checks=checks+require(goal.botGoalName(state,101,5)=="25 H" and goal.botGoalName(state,999,10)=="","bounded goal name")
  handle=goal.botAllocGoalState(state,4);checks=checks+require(handle==1 and goal.botGoalStateFromHandle(state,handle).client==4,"goal state allocation")
  checks=checks+require(goal.botLoadItemWeights(state,handle,"test_i.c")==0,"fuzzy item weights load")
  checks=checks+require(goal.itemWeightIndex(goal.botGoalStateFromHandle(state,handle).itemWeightConfig,state.itemWeights.items)==[0,1],"item weight index")

  checks=checks+require(goal.botAddToAvoidGoals(state,handle,101,20.0)==1 and goal.botAvoidGoalTime(state,handle,101)==20.0,"avoid insertion and remaining time")
  goal.botRemoveFromAvoidGoals(state,handle,101);checks=checks+require(goal.botAvoidGoalTime(state,handle,101)==0.0,"avoid removal")
  goal.botSetAvoidGoalTime(state,handle,101,-1.0);checks=checks+require(goal.botAvoidGoalTime(state,handle,101)==10.0,"respawn avoid time minimum")
  goal.botResetAvoidGoals(state,handle);checks=checks+require(goal.botAvoidGoalTime(state,handle,101)==0.0,"avoid table reset")
  goal.botAddToAvoidGoals(state,handle,202,30.0);checks=checks+require(goal.botDumpAvoidGoals(state,handle)==1 and len(context.logs)==1,"avoid diagnostic")

  first=pools.Goal([1.0,2.0,3.0],1,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],3,101,selection.GFL_ITEM,0)
  second=pools.Goal([4.0,5.0,6.0],2,[-3.0,-3.0,-3.0],[3.0,3.0,3.0],4,202,selection.GFL_ITEM,1)
  checks=checks+require(goal.botPushGoal(state,handle,first)==1 and goal.botPushGoal(state,handle,second)==1,"goal stack push")
  checks=checks+require(goal.botGetTopGoal(state,handle).number==202 and goal.botGetSecondGoal(state,handle).number==101,"top and second goal")
  checks=checks+require(goal.botDumpGoalStack(state,handle)==2,"goal stack diagnostic")
  goal.botPopGoal(state,handle);checks=checks+require(goal.botGetTopGoal(state,handle).number==101,"goal stack pop")
  goal.botEmptyGoalStack(state,handle);checks=checks+require(goal.botGetTopGoal(state,handle)==void,"empty goal stack")
  checks=checks+require(goal.botTouchingGoal([1.0,2.0,3.0],first) and not goal.botTouchingGoal([100.0,2.0,3.0],first),"presence-box goal touch")

  goal.botResetAvoidGoals(state,handle);inventory=array(8,0);checks=checks+require(goal.botChooseLTGItem(state,handle,[0.0,0.0,0.0],inventory,1)==1 and goal.botGetTopGoal(state,handle).number==202,"LTG weighted by route time")
  goal.botEmptyGoalStack(state,handle);goal.botResetAvoidGoals(state,handle);checks=checks+require(goal.botChooseNBGItem(state,handle,[0.0,0.0,0.0],inventory,1,void,25.0)==1,"NBG maximum travel time")
  result=pools.emptyGoal();checks=checks+require(goal.botGetLevelItemGoal(state,-1,"Armor",result)==202 and result.entityNum==22,"level item lookup")
  visible=pools.Goal([10.0,0.0,0.0],1,[-2.0,-2.0,-2.0],[2.0,2.0,2.0],11,101,selection.GFL_ITEM,0);checks=checks+require(goal.botItemGoalInVisButNotVisible(state,1,[0.0,0.0,0.0],[0.0,0.0,0.0],visible),"stale visible item")

  goal.botResetGoalState(state,handle);checks=checks+require(goal.botGetTopGoal(state,handle)==void and goal.botAvoidGoalTime(state,handle,202)==0.0,"goal state reset preserves weights")
  checks=checks+require(goal.botFindEntityForLevelItem(state,health)==11,"entity-to-level-item relation")
  checks=checks+require(goal.botUpdateEntityItems(state)>=0,"dropped-item update entry point")
  goal.botFreeItemWeights(state,handle);checks=checks+require(goal.botGoalStateFromHandle(state,handle).itemWeightConfig==void,"item weight release")
  goal.botFreeGoalState(state,handle);checks=checks+require(goal.botGoalStateFromHandle(state,handle)==void,"goal state release")
  goal.botShutdownGoalAI(state);checks=checks+require(not state.setup and state.itemWeights.items==void and len(state.levelItems.levelItems)==0,"file shutdown lifecycle")
  print("PASS: "+str(checks)+" complete be_ai_goal runtime contracts");return 0
end function
