import mq3.botlib.ai_goal_state as goalRuntime
import mq3.botlib.ai_goal_state_syscalls as goalSyscalls
import mq3.botlib.ai_resource_pools as goalResources
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Harness time names logs prints end struct
function require(ok,label) if not ok then return error(7599,"AI goal-state contract: "+label) end if;return 1 end function
function clock(context) return context.time end function
function nameOf(context,number) for each pair in context.names if pair[0]==number then return pair[1] end if end for;return "" end function
function logLine(context,text) context.logs=context.logs+[text];return void end function
function printLine(context,level,text) context.prints=context.prints+[[level,text]];return void end function
function makeGoalContract(number) return goalResources.Goal([1.0,2.0,3.0],7,[-4.0,-5.0,-6.0],[4.0,5.0,6.0],9,number,3,13) end function
function setGoalVmArgument(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function putVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function putGoal(vm,address,value)
  putVector(vm.data,address,value.origin);n.writeU32(vm.data,address+12,value.areaNum);putVector(vm.data,address+16,value.mins);putVector(vm.data,address+28,value.maxs);n.writeU32(vm.data,address+40,value.entityNum);n.writeU32(vm.data,address+44,value.number);n.writeU32(vm.data,address+48,value.flags);n.writeU32(vm.data,address+52,value.itemInfo);return void
end function
function stringAt(data,address) count=0;while data[address+count]!=0 count=count+1 end while;return decode(slice(data,address,count)) end function

function main(args)
  count=0;pools=goalResources.create();handle=goalResources.allocGoalState(pools,5);host=Harness(10.0,[[11,"Machinegun"],[12,"Rocket Launcher"]],[],[]);runtime=goalRuntime.create(pools,host,clock,nameOf,logLine,printLine)
  first=makeGoalContract(11);count=count+require(goalRuntime.pushGoal(runtime,handle,first)==1 and goalResources.goalState(pools,handle).goalStackTop==1,"first push uses stack slot one")
  first.number=99;count=count+require(goalRuntime.topGoal(runtime,handle).number==11,"push stores a full goal copy")
  count=count+require(goalRuntime.pushGoal(runtime,handle,makeGoalContract(12))==1 and goalRuntime.topGoal(runtime,handle).number==12 and goalRuntime.secondGoal(runtime,handle).number==11,"top and second goal ordering")
  returned=goalRuntime.topGoal(runtime,handle);returned.origin[0]=99.0;count=count+require(goalRuntime.topGoal(runtime,handle).origin[0]==1.0,"get returns an independent goal copy")
  goalRuntime.popGoal(runtime,handle);count=count+require(goalRuntime.topGoal(runtime,handle).number==11,"pop exposes previous goal")
  goalRuntime.emptyGoalStack(runtime,handle);count=count+require(goalRuntime.topGoal(runtime,handle)==void and goalRuntime.secondGoal(runtime,handle)==void,"empty and underflow queries")
  for number=1 to 7 goalRuntime.pushGoal(runtime,handle,makeGoalContract(number)) end for;count=count+require(goalRuntime.pushGoal(runtime,handle,makeGoalContract(8))==0 and goalResources.goalState(pools,handle).goalStackTop==7 and host.prints==[[goalRuntime.PRT_ERROR,"goal heap overflow\n"]],"eight-slot heap reserves slot zero and reports overflow")
  host.logs=[];count=count+require(goalRuntime.dumpGoalStack(runtime,handle)==7 and len(host.logs)==7,"goal-stack dump covers slots one through top")

  count=count+require(goalRuntime.addToAvoidGoals(runtime,handle,41,5.0)==1 and goalRuntime.avoidGoalTime(runtime,handle,41)==5.0,"avoid goal stores absolute expiry")
  host.time=12.5;count=count+require(goalRuntime.avoidGoalTime(runtime,handle,41)==2.5,"avoid query returns remaining time")
  count=count+require(goalRuntime.addToAvoidGoals(runtime,handle,41,9.0)==1 and goalRuntime.avoidGoalTime(runtime,handle,41)==9.0,"matching avoid number refreshes existing slot")
  count=count+require(goalRuntime.removeFromAvoidGoals(runtime,handle,41)==1 and goalRuntime.avoidGoalTime(runtime,handle,41)==0.0,"remove clears only active expiry")
  goalRuntime.addToAvoidGoals(runtime,handle,12,3.0);host.logs=[];count=count+require(goalRuntime.dumpAvoidGoals(runtime,handle)==1 and len(host.logs)==1,"avoid dump emits active entries")
  goalRuntime.resetAvoidGoals(runtime,handle);count=count+require(goalRuntime.avoidGoalTime(runtime,handle,12)==0.0 and goalResources.goalState(pools,handle).avoidGoals[0]==0,"avoid reset clears ids and times")

  touch=makeGoalContract(1);touch.origin=[100.0,200.0,300.0];touch.mins=[-8.0,-8.0,-8.0];touch.maxs=[8.0,8.0,8.0]
  count=count+require(goalRuntime.touchingGoal([77.0,177.0,260.0],touch) and goalRuntime.touchingGoal([123.0,223.0,332.0],touch),"touch bounds are inclusive and expanded by normal presence")
  count=count+require(not goalRuntime.touchingGoal([76.99,200.0,300.0],touch) and not goalRuntime.touchingGoal([100.0,200.0,332.01],touch),"touch rejects positions outside expanded goal")

  goalRuntime.emptyGoalStack(runtime,handle);vm=Machine(bytes(1024,0),1023);base=32;putGoal(vm,100,makeGoalContract(11));setGoalVmArgument(vm,base,1,handle);setGoalVmArgument(vm,base,2,100)
  count=count+require(goalSyscalls.dispatch(runtime,vm,base,goalRuntime.OP_PUSH_GOAL)==0 and goalResources.goalState(pools,handle).goalStackTop==1,"push syscall decodes 56-byte bot_goal_t")
  setGoalVmArgument(vm,base,2,200);count=count+require(goalSyscalls.dispatch(runtime,vm,base,goalRuntime.OP_GET_TOP_GOAL)==1 and n.readI32(vm.data,244)==11 and n.bitsFloat(n.readU32(vm.data,200))==1.0,"top syscall writes exact goal layout")
  setGoalVmArgument(vm,base,1,11);setGoalVmArgument(vm,base,2,300);setGoalVmArgument(vm,base,3,8);count=count+require(goalSyscalls.dispatch(runtime,vm,base,goalRuntime.OP_GOAL_NAME)==0 and stringAt(vm.data,300)=="Machine","goal-name syscall applies C string capacity")
  putVector(vm.data,400,[77.0,177.0,260.0]);putGoal(vm,420,touch);setGoalVmArgument(vm,base,1,400);setGoalVmArgument(vm,base,2,420);count=count+require(goalSyscalls.dispatch(runtime,vm,base,goalRuntime.OP_TOUCHING_GOAL)==1,"touch syscall decodes vectors and goal")
  host.time=20.0;goalRuntime.addToAvoidGoals(runtime,handle,77,4.25);setGoalVmArgument(vm,base,1,handle);setGoalVmArgument(vm,base,2,77);count=count+require(n.bitsFloat(goalSyscalls.dispatch(runtime,vm,base,goalRuntime.OP_AVOID_GOAL_TIME))==4.25,"avoid syscall returns FloatAsInt bits")
  count=count+require(goalRuntime.supportsTrap(526) and goalRuntime.supportsTrap(540) and not goalRuntime.supportsTrap(535),"dispatcher coverage is explicit")
  count=count+require((try(goalSyscalls.dispatch(runtime,vm,base,545))) is error,"unimplemented fuzzy-save trap remains visible")
  print("PASS: "+str(count)+" AI goal-state contracts opcodes=526-534,537,540");return 0
end function
