import mq3.client.cl_input as cl
import mq3.client.send_cmd as send
import mq3.client.input_command as input
import mq3.qcommon.command_buffer as commands
import mq3.compat.numeric as n

struct Capture ui cg x y end struct
function uiMouse(c,x,y) c.ui=c.ui+1;c.x=x;c.y=y;return void end function
function cgMouse(c,x,y) c.cg=c.cg+1;c.x=x;c.y=y;return void end function
function make()
  s=cl.create(commands.create(),send.create(),send.services());s.frameTime=150;s.frameMsec=50;return s
end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  s=make();cl.IN_ForwardDown(s,7,100);cl.IN_ForwardDown(s,8,110);cl.IN_ForwardUp(s,7,125);cl.IN_ForwardUp(s,8,140);fraction=cl.CL_KeyState(s,s.inputState.forward);print "dual|"+str(n.trunc32(fraction*10.0))+"|"+str(s.inputState.forward.down0)+"|"+str(s.inputState.forward.down1)+"|"+str(s.inputState.forward.msec)
  s=make();cl.IN_BackDown(s,-1,0);cl.IN_BackUp(s,0,0);print "manual|"+str(s.inputState.back.down0)+"|"+str(s.inputState.back.down1)+"|"+str(flag(s.inputState.back.active))
  s=make();value=input.Command([0,0,0],0,0,0,0,0,0,[0.0,0.0,0.0]);s.inputState.buttons[0].wasPressed=true;s.inputState.buttons[3].active=true;s.keyCatchers=cl.KEYCATCH_UI;s.anyKeyDown=true;cl.CL_CmdButtons(s,value);print "buttons|"+str(value.buttons)+"|"+str(flag(s.inputState.buttons[0].wasPressed))+"|"+str(flag(s.inputState.buttons[3].wasPressed))
  s=make();capture=Capture(0,0,0,0);s.host.context=capture;s.host.uiMouseFn=uiMouse;s.host.cgameMouseFn=cgMouse;cl.CL_MouseEvent(s,3,-4,12);s.keyCatchers=cl.KEYCATCH_UI;cl.CL_MouseEvent(s,5,6,13);s.keyCatchers=cl.KEYCATCH_CGAME;cl.CL_MouseEvent(s,-7,8,14);print "mouse|"+str(s.inputState.mouseDx[0])+"|"+str(s.inputState.mouseDy[0])+"|"+str(capture.ui)+"|"+str(capture.cg)+"|"+str(capture.x)+"|"+str(capture.y)
  s=make();cl.CL_JoystickEvent(s,3,-42,10);print "joy|"+str(s.inputState.joystickAxis[3])
  s=make();value=input.Command([0,0,0],0,0,0,0,0,0,[0.0,0.0,0.0]);s.weapon=261;s.serverTime=123456;s.inputState.viewangles=[90.0,-45.0,720.0];cl.CL_FinishMove(s,value);print "finish|"+str(value.weapon)+"|"+str(value.serverTime)+"|"+str(value.angles[0])+"|"+str(value.angles[1])+"|"+str(value.angles[2])
  s=make();s.frameMsec=5;cl.IN_ForwardDown(s,7,100);cl.IN_ForwardUp(s,7,0);print "oddHalf|"+str(s.inputState.forward.msec);return 0
end function
