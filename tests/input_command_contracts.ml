import mq3.client.input_command as input
import mq3.client.input_command_events as events
import mq3.compat.numeric as n

function req(value,label) if not value then return error(7701,"input command contract: "+label) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.0002 end function

function main(args)
  count=0
  count=count+req(input.clampChar(-999)==-128 and input.clampChar(999)==127 and input.clampChar(12.9)==12,"ClampChar")
  count=count+req(input.angleShort(90.0)==16384 and input.angleShort(270.0)==49152,"ANGLE2SHORT")

  b=input.button();count=count+req(input.keyDown(b,7,100) and b.active and b.wasPressed,"key down")
  count=count+req(not input.keyDown(b,7,110),"repeat ignored")
  count=count+req(not input.keyDown(b,8,115) and b.down0==7 and b.down1==8,"second source")
  count=count+req(not input.keyUp(b,7,125,50) and b.active,"first source release")
  count=count+req(input.keyUp(b,8,140,50) and not b.active and b.msec==40,"final source release")
  count=count+req(near(input.keyState(b,150,50),0.8) and b.msec==0,"partial key fraction")
  b=input.button();input.keyDown(b,1,100);count=count+req(near(input.keyState(b,125,50),0.5) and b.downtime==125,"active partial key")
  count=count+req(near(input.keyState(b,200,50),1.0),"active fraction clamped")
  b=input.button();input.keyDown(b,1,0);count=count+req(near(input.keyState(b,75,50),1.0),"zero downtime uses frame time")
  b=input.button();input.keyDown(b,1,100);input.keyUp(b,1,0,50);count=count+req(near(input.keyState(b,150,50),0.5),"untimed release uses half frame")
  count=count+req(try(input.keyDown(void,1,1)) is error and try(input.keyUp(b,1,1,0)) is error,"key validation")

  config=input.defaults();state=input.create(0.0,0.0,0.0);input.keyDown(state.forward,1,100)
  command=input.createCommand(state,config,150,50,1000,5,1.0,0,true)
  count=count+req(command.forwardmove==127 and command.rightmove==0 and command.upmove==0,"run keyboard movement")
  count=count+req((command.buttons&input.BUTTON_WALKING)==0 and (command.buttons&input.BUTTON_ANY)!=0,"run and any-key bits")
  count=count+req(command.weapon==5 and command.serverTime==1000,"finish move fields")

  state=input.create(0.0,0.0,0.0);config=input.defaults();config.run=false;input.keyDown(state.forward,1,100);input.keyDown(state.moveright,2,100);input.keyDown(state.up,3,100)
  command=input.createCommand(state,config,150,50,1000,0,1.0,0,false)
  count=count+req(command.forwardmove==64 and command.rightmove==64 and command.upmove==64,"walking movement")
  count=count+req((command.buttons&input.BUTTON_WALKING)!=0,"walking bit")

  state=input.create(0.0,0.0,0.0);input.keyDown(state.right,1,100);command=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[1],-7.0),"keyboard yaw")
  state=input.create(0.0,0.0,0.0);input.keyDown(state.lookup,1,100);command=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[0],-7.0),"keyboard pitch")

  state=input.create(0.0,0.0,0.0);config=input.defaults();config.sensitivity=2.0;input.accumulateMouse(state,10,-5);command=input.createCommand(state,config,50,50,1,0,0.5,0,false)
  count=count+req(near(command.viewangles[1],-0.22) and near(command.viewangles[0],-0.11),"mouse sensitivity and cgame scale")
  count=count+req(state.mouseIndex==1 and state.mouseDx[1]==0,"mouse buffer flip")
  state=input.create(0.0,0.0,0.0);config=input.defaults();config.filter=true;config.sensitivity=1.0;input.accumulateMouse(state,10,0);command=input.createCommand(state,config,50,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[1],-0.11),"mouse filtering")
  state=input.create(0.0,0.0,0.0);config=input.defaults();input.keyDown(state.strafe,1,10);input.accumulateMouse(state,40,0);command=input.createCommand(state,config,50,50,1,0,1.0,0,false)
  count=count+req(command.rightmove==50 and near(command.viewangles[1],0.0),"strafe mouse routing")

  state=input.create(0.0,0.0,0.0);input.joystickEvent(state,0,10);input.joystickEvent(state,1,-20);input.joystickEvent(state,2,30);command=input.createCommand(state,input.defaults(),50,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[1],70.0) and command.forwardmove==-20 and command.upmove==30,"joystick movement")
  count=count+req(try(input.joystickEvent(state,16,0)) is error and try(input.joystickEvent(state,0,128)) is error,"joystick validation")

  state=input.create(0.0,0.0,0.0);input.keyDown(state.buttons[0],1,10);input.keyUp(state.buttons[0],1,20,50);command=input.createCommand(state,input.defaults(),50,50,1,0,1.0,0,false)
  count=count+req((command.buttons&input.BUTTON_ATTACK)!=0,"short button press retained")
  next=input.createCommand(state,input.defaults(),100,50,2,0,1.0,3,false);count=count+req((next.buttons&input.BUTTON_ATTACK)==0 and (next.buttons&input.BUTTON_TALK)!=0,"button reset and catcher talk")
  state=input.create(0.0,0.0,0.0);state.viewangles[0]=120.0;input.accumulateMouse(state,0,1000);command=input.createCommand(state,input.defaults(),50,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[0],210.0),"pitch delta clamped to ninety")
  count=count+req(command.angles[0]==input.angleShort(210.0),"final short angles")
  count=count+req(try(input.accumulateMouse(void,1,1)) is error and try(input.createCommand(void,input.defaults(),1,1,1,1,1.0,0,false)) is error,"state validation")
  state=input.create(0.0,0.0,0.0);events.apply(state,110,events.INPUT_KEY,events.VK_W,1);events.apply(state,135,events.INPUT_KEY,events.VK_W,0);command=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false)
  count=count+req(command.forwardmove==63,"timestamped key fraction")
  state=input.create(0.0,0.0,0.0);events.apply(state,100,events.INPUT_KEY,events.VK_LBUTTON,1);events.apply(state,105,events.INPUT_KEY,events.VK_LBUTTON,0);command=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false)
  count=count+req((command.buttons&input.BUTTON_ATTACK)!=0,"timestamped click retained")
  state=input.create(0.0,0.0,0.0);events.apply(state,100,events.INPUT_MOUSE,4,-6);command=input.createCommand(state,input.defaults(),150,50,1,0,1.0,0,false)
  count=count+req(near(command.viewangles[1],-0.44) and near(command.viewangles[0],-0.66),"timestamped mouse routed")
  state=input.create(0.0,0.0,0.0);events.apply(state,100,events.INPUT_KEY,events.VK_A,1);count=count+req(events.anyDown(state),"event active state")
  released=events.release(state,125);count=count+req(not events.anyDown(state) and not (released is error),"event release")
  count=count+req(events.apply(state,130,events.INPUT_KEY,999,1)==void,"unbound key ignored")
  count=count+req(try(events.apply(void,1,events.INPUT_KEY,events.VK_W,1)) is error and try(events.release(state,-1)) is error,"event validation")
  print "PASS: "+str(count)+" client input-command contracts";return 0
end function
