import mq3.client.cl_input as cl
import mq3.client.input_command as input
import mq3.client.send_cmd as send
import mq3.qcommon.command_buffer as commands

struct Capture packets ui cg graph prints end struct
function req(value,label) if not value then return error(7741,"cl_input contract: "+label) end if;return 1 end function
function uiMouse(c,x,y) c.ui=c.ui+[[x,y]];return void end function
function cgMouse(c,x,y) c.cg=c.cg+[[x,y]];return void end function
function graph(c,yaw,pitch) c.graph=c.graph+[[yaw,pitch]];return void end function
function output(c,text) c.prints=c.prints+[text];return void end function
function captureTransmit(host,state,msg) host.context.packets=host.context.packets+[slice(msg.data,0,msg.cursize)];return state.outgoingSequence+1 end function
function make()
  commandState=commands.create();commands.initCommands(commandState);sender=send.create();sender.connectionState=send.CA_ACTIVE;sender.realtime=1000;sender.lastPacketSentTime=0;sender.maxPackets=30;sender.outPackets[send.PACKET_MASK].realtime=0
  capture=Capture([],[],[],[],[]);sendHost=send.services();sendHost.context=capture;sendHost.transmitFn=captureTransmit
  state=cl.create(commandState,sender,sendHost);state.host.context=capture;state.host.uiMouseFn=uiMouse;state.host.cgameMouseFn=cgMouse;state.host.debugGraphFn=graph;state.host.printFn=output;state.frameTime=150;state.frameMsec=50;state.serverTime=900;return state
end function
function clean(value) return input.Command([0,0,0],0,0,0,0,0,0,[0.0,0.0,0.0]) end function
function main(args)
  count=0;s=make();count=count+req(cl.CL_InitInput(s) and s.initialized and len(s.commandState.functions)==64,"register original commands")
  count=count+req(cl.CL_InitInput(s),"idempotent init");commands.executeString(s.commandState,"+FoRwArD 6 90");count=count+req(s.inputState.forward.active and s.inputState.forward.down0==6,"case-insensitive dispatch");commands.executeString(s.commandState,"-forward 6 95");s.inputState.forward.msec=0
  commands.executeString(s.commandState,"+forward 7 100");count=count+req(s.inputState.forward.active and s.inputState.forward.down0==7,"registered forward down")
  commands.executeString(s.commandState,"+forward 8 110");commands.executeString(s.commandState,"-forward 7 125");count=count+req(s.inputState.forward.active and s.inputState.forward.down0==0 and s.inputState.forward.down1==8,"dual-source hold")
  commands.executeString(s.commandState,"-forward 8 140");count=count+req(not s.inputState.forward.active and s.inputState.forward.msec==40,"timestamped final release")
  commands.executeString(s.commandState,"+back");commands.executeString(s.commandState,"-back");count=count+req(not s.inputState.back.active and s.inputState.back.down0==0,"manual console unstick")

  s=make();cl.IN_UpDown(s,1,1);cl.IN_UpUp(s,1,2);cl.IN_DownDown(s,2,2);cl.IN_DownUp(s,2,3);cl.IN_LeftDown(s,3,3);cl.IN_LeftUp(s,3,4);cl.IN_RightDown(s,4,4);cl.IN_RightUp(s,4,5);count=count+req(not s.inputState.up.active and not s.inputState.down.active and not s.inputState.left.active and not s.inputState.right.active,"direction wrappers")
  cl.IN_ForwardDown(s,5,5);cl.IN_ForwardUp(s,5,6);cl.IN_BackDown(s,6,6);cl.IN_BackUp(s,6,7);cl.IN_LookupDown(s,7,7);cl.IN_LookupUp(s,7,8);cl.IN_LookdownDown(s,8,8);cl.IN_LookdownUp(s,8,9);count=count+req(not s.inputState.forward.active and not s.inputState.back.active and not s.inputState.lookup.active and not s.inputState.lookdown.active,"forward/look wrappers")
  cl.IN_MoveleftDown(s,9,9);cl.IN_MoveleftUp(s,9,10);cl.IN_MoverightDown(s,10,10);cl.IN_MoverightUp(s,10,11);cl.IN_SpeedDown(s,11,11);cl.IN_SpeedUp(s,11,12);cl.IN_StrafeDown(s,12,12);cl.IN_StrafeUp(s,12,13);count=count+req(not s.inputState.moveleft.active and not s.inputState.moveright.active and not s.inputState.speed.active and not s.inputState.strafe.active,"move modifier wrappers")
  cl.IN_Button0Down(s,20,20);cl.IN_Button0Up(s,20,21);cl.IN_Button1Down(s,21,21);cl.IN_Button1Up(s,21,22);cl.IN_Button2Down(s,22,22);cl.IN_Button2Up(s,22,23);cl.IN_Button3Down(s,23,23);cl.IN_Button3Up(s,23,24);cl.IN_Button4Down(s,24,24);cl.IN_Button4Up(s,24,25);cl.IN_Button5Down(s,25,25);cl.IN_Button5Up(s,25,26);cl.IN_Button6Down(s,26,26);cl.IN_Button6Up(s,26,27);cl.IN_Button7Down(s,27,27);cl.IN_Button7Up(s,27,28)
  cl.IN_Button8Down(s,28,28);cl.IN_Button8Up(s,28,29);cl.IN_Button9Down(s,29,29);cl.IN_Button9Up(s,29,30);cl.IN_Button10Down(s,30,30);cl.IN_Button10Up(s,30,31);cl.IN_Button11Down(s,31,31);cl.IN_Button11Up(s,31,32);cl.IN_Button12Down(s,32,32);cl.IN_Button12Up(s,32,33);cl.IN_Button13Down(s,33,33);cl.IN_Button13Up(s,33,34);cl.IN_Button14Down(s,34,34);cl.IN_Button14Up(s,34,35);cl.IN_Button15Down(s,35,35);cl.IN_Button15Up(s,35,36);count=count+req(not s.inputState.buttons[0].active and not s.inputState.buttons[15].active,"all sixteen button wrappers")
  cl.IN_ButtonDown(s,40,40);cl.IN_ButtonUp(s,40,41);count=count+req(not s.inputState.buttons[1].active,"generic button aliases button1")

  s=make();s.config.freelook=false;s.deltaPitch=16384;cl.IN_MLookDown(s,0,0);cl.IN_MLookUp(s,0,0);count=count+req(not s.inputState.mlooking and s.inputState.viewangles[0]==-90.0,"mlook release centers pitch")
  s=make();count=count+req(cl.CL_MouseEvent(s,4,-6,1)=="game" and s.inputState.mouseDx[0]==4 and s.inputState.mouseDy[0]==-6,"game mouse accumulation")
  s.keyCatchers=cl.KEYCATCH_UI;count=count+req(cl.CL_MouseEvent(s,2,3,2)=="ui" and len(s.host.context.ui)==1 and s.inputState.mouseDx[0]==4,"ui mouse routing")
  s.keyCatchers=cl.KEYCATCH_CGAME;count=count+req(cl.CL_MouseEvent(s,-2,-3,3)=="cgame" and len(s.host.context.cg)==1,"cgame mouse routing")
  count=count+req(cl.CL_JoystickEvent(s,0,420,0)==void and s.inputState.joystickAxis[0]==420,"joystick event preserves host range")
  count=count+req(try(cl.CL_JoystickEvent(s,16,0,0)) is error,"joystick bounds")

  s=make();s.inputState.forward.active=true;s.inputState.forward.downtime=100;value=clean(s);cl.CL_KeyMove(s,value);count=count+req(value.forwardmove==127,"key move")
  s=make();s.inputState.right.active=true;s.inputState.right.downtime=100;cl.CL_AdjustAngles(s);count=count+req(s.inputState.viewangles[1]==-7.0,"angle adjustment")
  s=make();input.accumulateMouse(s.inputState,10,-5);value=clean(s);cl.CL_MouseMove(s,value);count=count+req(s.inputState.mouseIndex==1 and s.inputState.viewangles[1]<0.0,"mouse move")
  s=make();input.joystickEvent(s.inputState,1,-20);value=clean(s);cl.CL_JoystickMove(s,value);count=count+req(value.forwardmove==-20,"joystick move")
  s=make();s.inputState.buttons[0].wasPressed=true;value=clean(s);cl.CL_CmdButtons(s,value);count=count+req((value.buttons&1)!=0 and not s.inputState.buttons[0].wasPressed,"transient command button")
  s=make();s.weapon=261;s.serverTime=777;s.inputState.viewangles=[90.0,-45.0,0.0];value=clean(s);cl.CL_FinishMove(s,value);count=count+req(value.weapon==5 and value.serverTime==777 and value.angles[0]==16384 and value.angles[1]==-8192,"finish move")
  s=make();cl.IN_ForwardDown(s,1,100);s.serverTime=501;s.debugMove=1;value=cl.CL_CreateCmd(s);count=count+req(value.forwardmove==127 and value.serverTime==501 and len(s.host.context.graph)==1,"complete create command")

  s=make();s.serverTime=1000;cl.IN_ForwardDown(s,1,1);count=count+req(cl.CL_CreateNewCommands(s,50) and s.sendState.cmdNumber==1 and s.sendState.commands[1].forwardmove==124,"command ring creation")
  count=count+req(cl.CL_ReadyToSendPacket(s),"packet pacing ready");result=cl.CL_WritePacket(s);count=count+req(result.sent and result.commandCount==1 and len(s.sendHost.context.packets)==1,"packet write and transmit")
  s=make();s.serverTime=2000;s.sendState.realtime=1100;result=cl.CL_SendCmd(s,50);count=count+req(result.sent and s.sendState.cmdNumber==1 and len(s.sendHost.context.packets)==1,"full send command path")
  s=make();s.sendState.connectionState=1;count=count+req(cl.CL_SendCmd(s,50)=="disconnected","disconnected suppression")
  s=make();s.sendState.serverRunning=true;s.sendState.serverPaused=true;s.sendState.clientPaused=true;count=count+req(cl.CL_SendCmd(s,50)=="paused","paused suppression")
  print "PASS: "+str(count)+" complete cl_input contracts";return 0
end function
