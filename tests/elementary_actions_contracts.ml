import mq3.botlib.elementary_actions as ea
import mq3.botlib.elementary_action_syscalls as traps
import mq3.compat.numeric as n

struct Context events end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7549,"EA contract: "+label) end if;return 1 end function
function command(c,client,text) c.events=c.events+[str(client)+":"+text];return 0 end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function putVec(vm,at,value) for axis=0 to 2 n.writeU32(vm.data,at+axis*4,n.floatBits(value[axis])) end for end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function

function main(args)
  c=Context([]);state=ea.create(3,command,c);checks=0
  checks=checks+require(ea.INPUT_SIZE==40 and ea.OP_SAY==400 and ea.OP_RESET_INPUT==423,"published trap and ABI constants")
  ea.say(state,1,"hello");ea.sayTeam(state,1,"red");ea.command(state,2,"team blue");checks=checks+require(c.events==["1:say hello","1:say_team red","2:team blue"] and state.commandCount==3,"command callback boundary")
  ea.attack(state,0);ea.useAction(state,0);ea.respawn(state,0);ea.gesture(state,0);ea.talk(state,0);ea.walk(state,0);ea.moveUp(state,0);ea.moveDown(state,0);ea.moveForward(state,0);ea.moveBack(state,0);ea.moveLeft(state,0);ea.moveRight(state,0);ea.action(state,0,ea.ACTION_AFFIRMATIVE|ea.ACTION_FOLLOWME)
  value=ea.getInput(state,0,0.125);bits=ea.ACTION_ATTACK|ea.ACTION_USE|ea.ACTION_RESPAWN|ea.ACTION_GESTURE|ea.ACTION_TALK|ea.ACTION_WALK|ea.ACTION_MOVEUP|ea.ACTION_MOVEDOWN|ea.ACTION_MOVEFORWARD|ea.ACTION_MOVEBACK|ea.ACTION_MOVELEFT|ea.ACTION_MOVERIGHT|ea.ACTION_AFFIRMATIVE|ea.ACTION_FOLLOWME
  checks=checks+require(value.actionflags==bits and value.thinktime==0.125,"all action bits accumulate")
  ea.selectWeapon(state,0,300);ea.move(state,0,[1.25,-2.5,3.75],900.0);ea.view(state,0,[10.0,20.0,30.0]);value=ea.getInput(state,0,0.25)
  checks=checks+require(value.weapon==300 and value.dir==[1.25,-2.5,3.75] and value.speed==400.0 and value.viewangles==[10.0,20.0,30.0],"weapon vectors and positive speed clamp")
  ea.move(state,0,[-1.0,0.0,0.0],-900.0);checks=checks+require(ea.getInput(state,0,0.5).speed==-400.0,"negative speed clamp")
  value.dir[0]=99.0;checks=checks+require(ea.getInput(state,0,0.5).dir[0]==-1.0,"GetInput returns memcpy-style copy")
  before=ea.getInput(state,0,0.75);ea.endRegular(state,0,99.0);after=ea.getInput(state,0,0.75);checks=checks+require(before.thinktime==after.thinktime and before.dir==after.dir and before.speed==after.speed and before.viewangles==after.viewangles and before.actionflags==after.actionflags and before.weapon==after.weapon,"released EndRegular is no-op")
  ea.jump(state,1);checks=checks+require((ea.getInput(state,1,0.1).actionflags&ea.ACTION_JUMP)!=0,"initial jump")
  ea.resetInput(state,1);latched=ea.getInput(state,1,0.2);checks=checks+require(latched.actionflags==ea.ACTION_JUMPEDLASTFRAME and latched.dir==[0.0,0.0,0.0] and latched.speed==0.0,"ResetInput jump latch and movement clear")
  ea.jump(state,1);ea.delayedJump(state,1);checks=checks+require(ea.getInput(state,1,0.2).actionflags==ea.ACTION_JUMPEDLASTFRAME,"last-frame latch suppresses both jumps")
  ea.resetInput(state,1);ea.delayedJump(state,1);checks=checks+require(ea.getInput(state,1,0.2).actionflags==ea.ACTION_DELAYEDJUMP,"delayed jump after latch clears")
  ea.selectWeapon(state,1,7);ea.view(state,1,[11.0,22.0,33.0]);ea.resetInput(state,1);value=ea.getInput(state,1,0.0);checks=checks+require(value.weapon==7 and value.viewangles==[11.0,22.0,33.0],"ResetInput preserves weapon and view")

  vm=Machine(bytes(2048,0),2047);base=1900;putString(vm,100,"via trap");invoke(state,vm,base,[ea.OP_SAY,2,100]);checks=checks+require(c.events[len(c.events)-1]=="2:say via trap","say trap")
  putVec(vm,200,[4.0,5.0,6.0]);invoke(state,vm,base,[ea.OP_MOVE,2,200,n.floatBits(123.5)]);putVec(vm,220,[45.0,90.0,-5.0]);invoke(state,vm,base,[ea.OP_VIEW,2,220]);invoke(state,vm,base,[ea.OP_SELECT_WEAPON,2,9]);invoke(state,vm,base,[ea.OP_ATTACK,2])
  invoke(state,vm,base,[ea.OP_GET_INPUT,2,n.floatBits(0.125),300]);checks=checks+require(n.bitsFloat(n.readU32(vm.data,300))==0.125 and n.bitsFloat(n.readU32(vm.data,304))==4.0 and n.bitsFloat(n.readU32(vm.data,316))==123.5,"bot_input_t float ABI")
  checks=checks+require(n.bitsFloat(n.readU32(vm.data,320))==45.0 and n.readI32(vm.data,332)==ea.ACTION_ATTACK and n.readI32(vm.data,336)==9,"bot_input_t tail ABI")
  invoke(state,vm,base,[ea.OP_JUMP,2]);invoke(state,vm,base,[ea.OP_RESET_INPUT,2]);checks=checks+require(ea.getInput(state,2,0.0).actionflags==ea.ACTION_JUMPEDLASTFRAME,"trap reset retains jump latch")
  checks=checks+require((try(invoke(state,vm,base,[ea.OP_MOVE,2,2044,n.floatBits(1.0)]))) is error and (try(invoke(state,vm,base,[ea.OP_GET_INPUT,2,n.floatBits(1.0),2030]))) is error,"trap pointer bounds")
  checks=checks+require((try(ea.attack(state,3))) is error and (try(traps.dispatch(state,vm,base,499))) is error,"client and opcode bounds")
  ea.shutdown(state);checks=checks+require((try(ea.getInput(state,0,0.0))) is error,"shutdown releases inputs")
  print("PASS: "+str(checks)+" Elementary Actions contracts");return 0
end function
