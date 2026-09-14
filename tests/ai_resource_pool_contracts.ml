import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_resource_syscalls as traps
import mq3.compat.numeric as n

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7569,"AI resource contract: "+label) end if;return 1 end function
function invoke(state,vm,base,op,arg) n.writeU32(vm.data,base,op);n.writeU32(vm.data,base+4,arg);return traps.dispatch(state,vm,base,op) end function

function main(args)
  checks=0;state=pools.create()
  checks=checks+require(pools.chatState(state,0)==void and pools.goalState(state,65)==void,"slot zero and upper bound are invalid")
  handles=[];for i=1 to pools.MAX_CLIENTS handles=handles+[pools.allocChatState(state)] end for
  checks=checks+require(handles[0]==1 and handles[63]==64 and pools.allocChatState(state)==0,"chat pool fixed capacity and allocation order")
  chat=pools.chatState(state,17);chat.consoleMessages=["one","two"];chat.numConsoleMessages=2;chat.chat="owned"
  checks=checks+require(pools.freeChatState(state,17)==0 and pools.chatState(state,17)==void and pools.allocChatState(state)==17,"chat free releases owned state and reuses first hole")
  checks=checks+require(pools.freeChatState(state,0)==0 and pools.freeChatState(state,65)==0,"invalid chat frees are harmless")

  goalHandle=pools.allocGoalState(state,23);goal=pools.goalState(state,goalHandle)
  checks=checks+require(goalHandle==1 and goal.client==23 and goal.goalStackTop==0 and len(goal.avoidGoals)==256,"cleared goal allocation with client")
  goal.itemWeightConfig="weights";goal.itemWeightIndex=[4,5];goal.lastReachabilityArea=77;goal.goalStackTop=2;goal.goalStack[0].number=9;goal.avoidGoals[5]=99;goal.avoidGoalTimes[5]=12.5
  pools.resetGoalState(state,goalHandle)
  checks=checks+require(goal.goalStackTop==0 and goal.goalStack[0].number==0 and goal.avoidGoals[5]==0 and goal.avoidGoalTimes[5]==0.0,"goal reset clears stack and avoid goals")
  checks=checks+require(goal.client==23 and goal.lastReachabilityArea==77 and goal.itemWeightConfig=="weights" and goal.itemWeightIndex[0]==4,"goal reset preserves client routing and weights")
  pools.freeGoalState(state,goalHandle);checks=checks+require(pools.goalState(state,goalHandle)==void and pools.allocGoalState(state,3)==goalHandle,"goal free and first-hole reuse")

  moveHandle=pools.allocMoveState(state);move=pools.moveState(state,moveHandle)
  checks=checks+require(moveHandle==1 and len(move.avoidReach)==1 and len(move.avoidSpots)==32 and move.numAvoidSpots==0,"cleared move allocation and original bounds")
  move.client=8;move.origin=[1.0,2.0,3.0];move.avoidReach[0]=42;move.avoidReachTimes[0]=9.0;move.avoidReachTries[0]=4
  pools.resetLastAvoidReach(state,moveHandle);checks=checks+require(move.avoidReachTimes[0]==0.0 and move.avoidReachTries[0]==3 and move.avoidReach[0]==42,"last avoid reach resets newest time and one try")
  move.avoidReachTimes[0]=8.0;move.avoidReachTries[0]=2;pools.resetAvoidReach(state,moveHandle)
  checks=checks+require(move.avoidReach[0]==0 and move.avoidReachTimes[0]==0.0 and move.avoidReachTries[0]==0 and move.client==8,"avoid reach reset is field-local")
  move.areaNum=12;move.avoidSpots[0].radius=64.0;move.numAvoidSpots=1;pools.resetMoveState(state,moveHandle);move=pools.moveState(state,moveHandle)
  checks=checks+require(move.client==0 and move.origin[0]==0.0 and move.areaNum==0 and move.avoidSpots[0].radius==0.0 and move.numAvoidSpots==0,"full move reset clears complete struct")
  pools.freeMoveState(state,moveHandle);checks=checks+require(pools.moveState(state,moveHandle)==void and pools.allocMoveState(state)==moveHandle,"move free and first-hole reuse")

  weaponHandle=pools.allocWeaponState(state);weapon=pools.weaponState(state,weaponHandle);weapon.weaponWeightConfig="config";weapon.weaponWeightIndex=[7]
  pools.resetWeaponState(state,weaponHandle);checks=checks+require(weapon.weaponWeightConfig=="config" and weapon.weaponWeightIndex[0]==7,"weapon reset preserves both released-code fields")
  pools.freeWeaponState(state,weaponHandle);checks=checks+require(pools.weaponState(state,weaponHandle)==void and pools.allocWeaponState(state)==weaponHandle,"weapon free and first-hole reuse")
  checks=checks+require(pools.chatState(state,1)!=void and pools.goalState(state,1)!=void and pools.moveState(state,1)!=void and pools.weaponState(state,1)!=void,"four handle namespaces are independent")

  vm=Machine(bytes(128,0),127);base=64;fresh=pools.create()
  checks=checks+require(invoke(fresh,vm,base,pools.OP_ALLOC_CHAT_STATE,0)==1 and invoke(fresh,vm,base,pools.OP_FREE_CHAT_STATE,1)==0,"chat lifecycle trap ABI")
  checks=checks+require(invoke(fresh,vm,base,pools.OP_ALLOC_GOAL_STATE,31)==1 and pools.goalState(fresh,1).client==31 and invoke(fresh,vm,base,pools.OP_RESET_GOAL_STATE,1)==0,"goal lifecycle trap ABI")
  checks=checks+require(invoke(fresh,vm,base,pools.OP_ALLOC_MOVE_STATE,0)==1 and invoke(fresh,vm,base,pools.OP_RESET_AVOID_REACH,1)==0 and invoke(fresh,vm,base,pools.OP_RESET_LAST_AVOID_REACH,1)==0 and invoke(fresh,vm,base,pools.OP_RESET_MOVE_STATE,1)==0,"move lifecycle trap ABI")
  checks=checks+require(invoke(fresh,vm,base,pools.OP_ALLOC_WEAPON_STATE,0)==1 and invoke(fresh,vm,base,pools.OP_RESET_WEAPON_STATE,1)==0 and invoke(fresh,vm,base,pools.OP_FREE_WEAPON_STATE,1)==0,"weapon lifecycle trap ABI")
  checks=checks+require((try(traps.dispatch(fresh,vm,base,509))) is error,"dispatcher rejects unimplemented chat functionality")
  pools.shutdown(state);checks=checks+require(pools.chatState(state,1)==void and pools.goalState(state,1)==void and pools.moveState(state,1)==void and pools.weaponState(state,1)==void,"shutdown releases all pools")
  print("PASS: "+str(checks)+" AI resource pool contracts");return 0
end function
