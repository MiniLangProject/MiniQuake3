import mq3.botlib.ai_chat_goal_tail as tail
import mq3.botlib.ai_chat_goal_tail_syscalls as traps
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_goal_state as goals
import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.ai_resource_pools as pools
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Host time end struct
struct LevelFixture itemRuntime levelItems end struct
struct LevelEntry number itemInfo end struct
function require(ok,label) if not ok then return error(7599,"AI chat/goal tail: "+label) end if;return 1 end function
function clock(host) return host.time end function
function name(host,number) return "" end function
function log(host,text) return void end function
function printLine(host,level,text) return void end function
function put(vm,address,value) data=bytes(value);copyBytes(vm.data,address,data,0,len(data));vm.data[address+len(data)]=0;return void end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function qvmString(vm,address) stop=address;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,address,stop-address)) end function

function main(args)
  checks=0;resources=pools.create();chatHandle=pools.allocChatState(resources);goalHandle=pools.allocGoalState(resources,3);host=Host(10.0)
  profileState=profiles.create(resources,void,void);message=profiles.Message("hello",[],0.0);chatType=profiles.ChatType("greeting",[message,message,message]);pools.chatState(resources,chatHandle).chat=profiles.Profile("x.c","bot",[chatType],3)
  goalRuntime=goals.create(resources,host,clock,name,log,printLine)
  itemRuntime=itemWeights.create(void,void);itemRuntime.items=[itemWeights.ItemInfo("item_health","Health","",0,0,0,5.0,[0.0,0.0,0.0],[0.0,0.0,0.0],0),itemWeights.ItemInfo("weapon_rocketlauncher","Rocket Launcher","",0,0,0,25.0,[0.0,0.0,0.0],[0.0,0.0,0.0],1)]
  state=tail.create(profileState,goalRuntime,LevelFixture(itemRuntime,[LevelEntry(41,0),LevelEntry(42,1)]))
  checks=checks+require(tail.numInitialChats(state,chatHandle,"GREETING")==3 and tail.numInitialChats(state,chatHandle,"missing")==0,"op569 case-insensitive type count")
  chat=pools.chatState(resources,chatHandle);chat.chatMessage="one~~two~three";checks=checks+require(tail.getChatMessage(state,chatHandle,256)=="one~twothree" and chat.chatMessage=="","op570 released tilde removal and consume")
  chat.chatMessage="abcdef";checks=checks+require(tail.getChatMessage(state,chatHandle,4)=="abc" and chat.chatMessage=="","op570 bounded copy")
  goals.addToAvoidGoals(goalRuntime,goalHandle,40,7.0);checks=checks+require(tail.removeFromAvoidGoals(state,goalHandle,40)==0 and goals.avoidGoalTime(goalRuntime,goalHandle,40)==0.0,"op571 clears active avoid goal")
  tail.setAvoidGoalTime(state,goalHandle,41,-1.0);checks=checks+require(goals.avoidGoalTime(goalRuntime,goalHandle,41)==10.0,"op573 negative time clamps item respawn to ten")
  tail.setAvoidGoalTime(state,goalHandle,42,-1.0);checks=checks+require(goals.avoidGoalTime(goalRuntime,goalHandle,42)==25.0,"op573 negative time uses item respawn")
  tail.setAvoidGoalTime(state,goalHandle,99,-1.0);checks=checks+require(goals.avoidGoalTime(goalRuntime,goalHandle,99)==0.0,"op573 ignores unknown negative item")
  tail.setAvoidGoalTime(state,goalHandle,99,3.5);checks=checks+require(goals.avoidGoalTime(goalRuntime,goalHandle,99)==3.5,"op573 explicit time bypasses item lookup")

  vm=Machine(bytes(1024,0),1023);base=900;put(vm,20,"greeting");arg(vm,base,1,chatHandle);arg(vm,base,2,20)
  checks=checks+require(traps.dispatch(state,vm,base,tail.OP_NUM_INITIAL_CHATS)==3,"op569 QVM ABI")
  chat.chatMessage="~hello~~";arg(vm,base,2,100);arg(vm,base,3,6);checks=checks+require(traps.dispatch(state,vm,base,tail.OP_GET_CHAT_MESSAGE)==0 and qvmString(vm,100)=="hello","op570 QVM output and truncation")
  goals.addToAvoidGoals(goalRuntime,goalHandle,77,9.0);arg(vm,base,1,goalHandle);arg(vm,base,2,77);checks=checks+require(traps.dispatch(state,vm,base,tail.OP_REMOVE_FROM_AVOID_GOALS)==0 and goals.avoidGoalTime(goalRuntime,goalHandle,77)==0.0,"op571 QVM integers")
  arg(vm,base,2,42);arg(vm,base,3,n.floatBits(-1.0));checks=checks+require(traps.dispatch(state,vm,base,tail.OP_SET_AVOID_GOAL_TIME)==0 and goals.avoidGoalTime(goalRuntime,goalHandle,42)==25.0,"op573 FloatAsInt ABI")
  checks=checks+require(tail.supportsTrap(569) and tail.supportsTrap(570) and tail.supportsTrap(571) and not tail.supportsTrap(572) and tail.supportsTrap(573),"explicit coverage leaves op572 visible")
  print("PASS: "+str(checks)+" AI chat/goal tail contracts");return 0
end function
